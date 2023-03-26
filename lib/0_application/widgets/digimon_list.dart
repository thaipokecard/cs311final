import 'package:cs311final/1_domain/entities/digimon_basic.dart';
import 'package:flutter/material.dart';

import 'digimon_card.dart';

class DigimonList extends StatelessWidget {
  const DigimonList({Key? key, required this.digimonNames}) : super(key: key);

  final List<DigimonBasic> digimonNames;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: ListView.builder(
        itemCount: digimonNames.length,
        itemBuilder: (context, index) {
          return DigimonCard(
            digimonBasic: digimonNames[index],
          );
        },
      ),
    );
  }
}
