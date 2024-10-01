import 'package:app12_youtube_2024/ui/general/colors.dart';
import 'package:flutter/material.dart';

class ItemFilterWidget extends StatelessWidget {
  const ItemFilterWidget({super.key});
  
  get kBrandSecundaryColor => null;

  String texto;
  bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 10.0),
      child: Chip(
        backgroundColor: kBrandSecundaryColor,
        label: Text("Todos"),
        labelStyle: TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }
}