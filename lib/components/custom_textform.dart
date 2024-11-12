import 'package:flutter/material.dart';

InputDecoration FieldInputDecoration(String hintText, Widget prefixIcon) {
  return InputDecoration(
    hintText: hintText,
    hintStyle: const TextStyle(fontWeight: FontWeight.bold),
    prefixIcon: prefixIcon,
    prefixIconColor: const Color(0xff034da2),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
      borderSide: const BorderSide(
        color: Color(0xff034da2),
        width: 1.5,
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
      borderSide: const BorderSide(
        color: Color(0xffff6900),
        width: 3.0,
      ),
    ),
  );
}