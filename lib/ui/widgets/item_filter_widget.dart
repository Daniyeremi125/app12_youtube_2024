import 'package:app12_youtube_2024/ui/general/colors.dart';


import 'package:flutter/material.dart';
// ignore: must_be_immutable
class ItemFilterWidget extends StatelessWidget {
  String texto;
  bool isSelected;

  ItemFilterWidget({super.key, 
    required this.texto,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 10.0),
      child: Chip(
        backgroundColor: isSelected ? Colors.white : kBrandSecundaryColor,
        label: Text(texto),
        labelStyle: TextStyle(
          color: isSelected ? kBrandSecundaryColor : Colors.white,
        ),
      ),
    );
  }
}