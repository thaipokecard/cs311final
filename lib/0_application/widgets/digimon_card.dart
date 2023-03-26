import 'package:flutter/material.dart';

import '../../1_domain/entities/digimon_basic.dart';

class DigimonCard extends StatelessWidget {
  const DigimonCard({Key? key, required this.digimonBasic}) : super(key: key);

  final DigimonBasic digimonBasic;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.network(digimonBasic.img),
      title: Text(
        digimonBasic.name,
        style: Theme.of(context).textTheme.titleLarge,
      ),
      tileColor: Colors.white,
    );
  }
}
