import 'package:flutter/material.dart';

class Roundbutton extends StatefulWidget {
  final String title;
  final VoidCallback onTap;
  const Roundbutton({required this.title, required this.onTap, super.key});

  @override
  State<Roundbutton> createState() => _RoundbuttonState();
}

class _RoundbuttonState extends State<Roundbutton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        width: 300,
        height: 50,
        child: Center(child: Text(widget.title,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 24))),
        decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(10),
      ),
    ));
  }
}
