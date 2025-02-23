import 'package:flutter/material.dart';
import 'package:pop/Model/demo.dart';

class splashscreen extends StatefulWidget {
  const splashscreen({super.key});

  @override
  State<splashscreen> createState() => _splashscreenState();
}

class _splashscreenState extends State<splashscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image(
            image: NetworkImage(
                "https://images.pexels.com/photos/1109197/pexels-photo-1109197.jpeg?auto=compress&cs=tinysrgb&w=600"),
            fit: BoxFit.cover,
          ),
          Positioned(
              right: 30,
              left: 20,
              bottom: 130,
              child: Text("Delicious Recipes One Tap Away!",
                  style: TextStyle(
                    color: Colors.teal,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ))),
          Positioned(
              right: 20,
              left: 20,
              bottom: 60,
              child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  height: 50,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.teal,
                      ),
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => demo()));
                      },
                      child: Icon(
                        Icons.arrow_forward_ios_outlined,
                        color: Colors.white,
                      )))),
        ],
      ),
    );
  }
}
