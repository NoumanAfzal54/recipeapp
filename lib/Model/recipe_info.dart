import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:pop/General/Util.dart';
import 'package:pop/Model/Favorties.dart';

class recipeinfo extends StatefulWidget {
  final String image;
  final String name;
  final String ingredients;
  final String mealtype;
  final String instructions;

  const recipeinfo({
    required this.image,
    required this.name,
    required this.ingredients,
    required this.mealtype,
    required this.instructions,
    super.key,
  });

  @override
  State<recipeinfo> createState() => _recipeinfoState();
}

class _recipeinfoState extends State<recipeinfo> {
  final DatabaseReference favorites = FirebaseDatabase.instance.ref("favorites");
  int count = 0;
  String id ="";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   automaticallyImplyLeading: true,
      // ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Image(image: NetworkImage(widget.image)),
                Positioned(
                  top: 30,
                  left: 10,
                  child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.arrow_back_outlined,
                        color: Colors.black87),
                  ),
                ),
                Positioned(
                  top: 31,
                  right: 10, // Adjusted for better alignment
                  child: IconButton(
                    onPressed: () {
                      setState(() {
                        if (count == 0) {
                          count = 1;
                          Util().toastmessage("Added to favorites");
                          id = DateTime.now().millisecondsSinceEpoch.toString();
                          favorites
                              .child(id)
                              .set({
                            "name": widget.name,
                            "image": widget.image,
                            "ingredients": widget.ingredients,
                            "mealtype": widget.mealtype,
                            "instructions": widget.instructions,
                          }).then((value) {
                            Util().toastmessage("Added to favorites");
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>fav(name: widget.name, image: widget.image)));

                          }).catchError((error) {
                            Util().toastmessage(error.toString());
                          });
                        } else {
                          count = 0;
                          favorites.child(id).remove();
                          Util().toastmessage("Removed from favorites");
                        }
                      });
                    },
                    icon: Icon(
                      count == 1 ? Icons.favorite : Icons.favorite_border,
                      color: count == 1 ? Colors.red : Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.name, style: const TextStyle(fontSize: 22)),
                  const SizedBox(height: 13),
                  const Text("- Ingredients:", style: TextStyle(fontSize: 20)),
                  const SizedBox(height: 10),
                  Text(widget.ingredients,
                      style: const TextStyle(fontSize: 18)),
                  const SizedBox(height: 10),
                  Text("- Meal Type: ${widget.mealtype}",
                      style: const TextStyle(fontSize: 18)),
                  const SizedBox(height: 10),
                  const Text("- Instructions:", style: TextStyle(fontSize: 20)),
                  const SizedBox(height: 10),
                  Text(widget.instructions,
                      style: const TextStyle(fontSize: 18)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
