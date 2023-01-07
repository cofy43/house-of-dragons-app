import 'package:flutter/material.dart';
import 'cards_list.dart';

class CharactersScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: [
        const Text(
          "Characters",
          style: TextStyle(
            fontWeight: FontWeight.w600,
          ),
        ),
        Expanded(
          child: CardList(),
        )
      ],
    );
  }

}