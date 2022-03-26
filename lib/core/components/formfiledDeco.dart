import 'package:flutter/material.dart';

class FormFieldDeco {
  static get deco => InputDecoration(
    hintText: 'Enter info',
    labelText: 'Your info',
    border: OutlineInputBorder(borderRadius: BorderRadius.circular(20),
    gapPadding: 10)
  );
}
