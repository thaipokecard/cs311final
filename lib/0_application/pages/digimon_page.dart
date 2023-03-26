import 'package:cs311final/0_application/widgets/digimon_list.dart';
import 'package:cs311final/1_domain/usecases/digimon_list_usecase.dart';
import 'package:flutter/material.dart';

/// Page that shows a list of digimon

class DigimonPage extends StatefulWidget {
  const DigimonPage({Key? key}) : super(key: key);

  @override
  State<DigimonPage> createState() => _DigimonPageState();
}

class _DigimonPageState extends State<DigimonPage> {

  int page = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Digimon List'),
      ),
      body: Column(
        children: [
          Row(
            children: [
              IconButton(
                onPressed: () {
                  setState(() {
                    page -= 1;
                  });
                },
                icon: const Icon(Icons.arrow_back),
              ),
              Expanded(child: Container()),
              IconButton(
                onPressed: () {
                  setState(() {
                    page += 1;
                  });
                },
                icon: const Icon(Icons.arrow_forward),
              ),
            ],
          ),
          FutureBuilder(
            future: DigimonListUsecase().getDigimonList(page),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return DigimonList(digimonNames: snapshot.data!);
              } else if (snapshot.hasError) {
                return Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: Text('Error: ${snapshot.error}'),
                );
              } else {
                return const CircularProgressIndicator();
              }
            },
          ),
        ],
      ),
    );
  }
}
