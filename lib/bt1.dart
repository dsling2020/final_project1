import 'package:flutter/material.dart';

const text =
TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black);

class Bt extends StatelessWidget {
  const Bt({Key? key, required this.text1}) : super(key: key);
  final String text1;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      style: TextButton.styleFrom(
        backgroundColor: Colors.deepOrange,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Text(text1, style: text),
    );
  }
}
