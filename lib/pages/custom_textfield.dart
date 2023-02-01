import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  TextEditingController controller;

  String hintName;
  CustomTextField({
    Key? key,
    required this.controller,
    required this.hintName,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 15),
      width: MediaQuery.of(context).size.width,
      child: Center(
        child: TextField(
          textInputAction: TextInputAction.done,
          decoration: InputDecoration(
            focusColor: const Color(0xff888DAA),
            hintText: hintName,
            counterText: "",
          ),
          controller: controller,
        ),
      ),
    );
  }
}
