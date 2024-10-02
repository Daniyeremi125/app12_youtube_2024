import 'package:app12_youtube_2024/ui/general/colors.dart';
import 'package:app12_youtube_2024/ui/widgets/item_filter_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 14.0,
          vertical: 12,
        ),
        child: Column(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              physics: BouncingScrollPhysics(),
              child: Row(
                children: [
                  ElevatedButton.icon(
                    onPressed: () {},
                    icon: Icon(
                      Icons.explore_outlined,
                      color: Colors.white,
                    ),
                    label: Text(
                      "Explorar",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      backgroundColor: kBrandSecundaryColor,
                      padding: EdgeInsets.symmetric(
                        horizontal: 10.0,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 38.0,
                    child: VerticalDivider(
                      color: kBrandSecundaryColor,
                      thickness: 1.0,
                    ),
                  ),
                  ItemFilterWidget(
                    texto: "Todos",
                    isSelected: true,
                  ),
                  ItemFilterWidget(
                    texto: "Mixes",
                    isSelected: false,
                  ),
                  ItemFilterWidget(
                    texto: "Música",
                    isSelected: false,
                  ),
                  ItemFilterWidget(
                    texto: "Programación",
                    isSelected: false,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}