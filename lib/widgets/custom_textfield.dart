import 'package:flutter/material.dart';

class CustomTextFiled extends StatefulWidget {
  const CustomTextFiled(
      {required this.controller,
      this.inputText = "null",
      this.textType = TextInputType.text,
      super.key});
  final TextEditingController controller;
  final String inputText;
  final TextInputType textType;

  @override
  State<CustomTextFiled> createState() => _CustomTextFiledState();
}

class _CustomTextFiledState extends State<CustomTextFiled> {
  @override
  Widget build(BuildContext context) {
    final inputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(25),
      borderSide: BorderSide(color: Colors.grey.shade100, width: 2.0),
    );
    return SizedBox(
      height: 60,
      child: TextField(
        keyboardType: widget.textType,
        style: const TextStyle(color: Colors.black),
        controller: widget.controller,
        decoration: InputDecoration(
            // contentPadding: EdgeInsets.symmetric(horizontal: 15),
            hintText: widget.inputText,
            hintStyle: const TextStyle(color: Colors.grey),
            border: inputBorder,
            focusedBorder: inputBorder),
        cursorColor: Colors.grey,
      ),
    );
  }
}
