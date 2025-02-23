import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:pop/Model/General/Color.dart';

class fav extends StatefulWidget {
  final String image;
  final String name;
  const fav({required this.name, required this.image, super.key});

  @override
  State<fav> createState() => _favState();
}

class _favState extends State<fav> {
  final DatabaseReference favquery = FirebaseDatabase.instance.ref("favorites");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text("Favorites", style: color().styles),
      ),
      body: Column(
          children: [
            Expanded(
                child: FirebaseAnimatedList(
                    query: favquery,
                    itemBuilder: (context, snapshot, animation, index) {
                      print(snapshot.value);
                      final name = snapshot.child("name").value.toString();
                      final image = snapshot.child("image").value.toString();
                      return Center(
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Container(
                            width: 230,
                            height: 240,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(color: Colors.black)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                    width: 200,
                                    height: 180,
                                    child: Image(image: NetworkImage(image))),
                                Center(child: Text(name, style: TextStyle(fontSize: 16)))
                              ],
                            ),
                          ),
                        ),
                      );
                    }))
          ],
        ),
      );
  }
}
