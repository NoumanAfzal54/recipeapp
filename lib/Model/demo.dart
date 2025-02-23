import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:pop/Model/Favorties.dart';
import 'package:pop/Model/recipe_info.dart';
import 'postmodel.dart';
import 'package:http/http.dart' as http;
import 'package:pop/Model/General/Color.dart';

class demo extends StatefulWidget {
  const demo({super.key});

  @override
  State<demo> createState() => _demoState();
}

class _demoState extends State<demo> {
  final searchcontroller = TextEditingController();
  List<Postmodel> postlist = [];

  Future<List<Postmodel>> getpostapi() async {
    final response = await http.get(Uri.parse("https://dummyjson.com/recipes"));
    var data = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      Postmodel postmodel = Postmodel.fromJson(data);
      postlist.add(postmodel);
      return postlist;
    } else {
      throw Exception("Failed to load data");
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text("Recipes", style: color().styles),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: searchcontroller,
                    decoration: InputDecoration(
                        hintText: "Search any recipe",
                        suffixIcon: IconButton(onPressed: (){
                          setState(() {

                          });
                        }, icon: Icon(Icons.search_rounded)),
                        hintStyle: TextStyle(
                            color: Colors.grey, fontWeight: FontWeight.bold),
                        border: OutlineInputBorder()),
                  ),
                ),
                SizedBox(width: 10),
                TextButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>fav(name: "", image: "")));}, child: Text("Favourites",style: TextStyle(fontSize: 20,color: Colors.teal,fontWeight: FontWeight.bold),))
              ],
            ),
          ),
          Expanded(
            child: FutureBuilder(
                future: getpostapi(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else {
                    List<Recipes> recipes = postlist[0].recipes ?? [];
                    // Access the recipes list from the first Postmodel object
                    return ListView.builder(
                      itemCount: recipes.length,
                      itemBuilder: (context, index) {
                        final recipe = recipes[index];
                        if (searchcontroller.text.isEmpty) {
                          return InkWell(
                            onTap: (){
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => recipeinfo(image: recipe.image.toString(),name: recipe.name.toString(),ingredients: recipe.ingredients.toString(),mealtype: recipe.mealType.toString(),instructions: recipe.instructions.toString(),)));
                            },
                            child: Container(
                              width: 21,
                              height: 100,
                              margin: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black),
                                  borderRadius: BorderRadius.circular(10)),
                              child: ListTile(
                                  title: Text(
                                    recipe.name ?? "Noname",
                                    style: TextStyle(fontSize: 20),
                                  ),
                                  leading: Container(
                                      width: 140,
                                      height: 100,
                                      child: Center(
                                        child: Image.network(recipe.image!,
                                            width: 100,
                                            height: 101,
                                            fit: BoxFit.contain),
                                      ))),
                            ),
                          );
                        }
                        else if (
                        recipe.name!.toLowerCase().contains(searchcontroller.text.toLowerCase())
                        ) {
                          return InkWell(
                            onTap: (){
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => recipeinfo(image: recipe.image.toString(),name: recipe.name.toString(),ingredients: recipe.ingredients.toString(),mealtype: recipe.mealType.toString(),instructions: recipe.instructions.toString(),)));
                            },
                            child: Container(
                              width: 21,
                              height: 100,
                              margin: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black),
                                  borderRadius: BorderRadius.circular(10)),
                              child: ListTile(
                                  title: Text(
                                    recipe.name ?? "Noname",
                                    style: TextStyle(fontSize: 20),
                                  ),
                                  leading: Container(
                                      width: 140,
                                      height: 100,
                                      child: Center(
                                        child: Image.network(recipe.image!,
                                            width: 100,
                                            height: 101,
                                            fit: BoxFit.contain),
                                      ))),
                            ),
                          );

                        }
                        else {
                          return Container();
                        }
                      },
                    );
                  }
                }),
          ),
        ],
      ),
    );
  }
}
