import 'package:flutter/material.dart';

import '../general/colors.dart';

class ItemFilterWidget extends StatelessWidget {
  String text;
  bool isSelected;

  ItemFilterWidget({required this.text, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 10),
      child: Chip(
        backgroundColor: isSelected ? Colors.white : kBrandSecondayColor,
        labelStyle: TextStyle(
          color: isSelected ?kBrandSecondayColor: Colors.white,
        ),
        label: Text(text),
      ),
    );
  }
}
