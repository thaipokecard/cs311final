import 'dart:convert';

import 'package:cs311final/1_domain/repositories/digimon_list_repo.dart';
import 'package:http/http.dart' as http;

class DigimonListRepoImpl extends DigimonListRepo {
  final client = http.Client();

  @override
  Future<List<dynamic>> getDigimonJsonList(int page) async {
    final response = await client
        .get(Uri.parse('https://www.digi-api.com/api/v1/digimon?page=$page'));
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      //return List.from(json['content']);
      return json['content'];
    } else {
      throw Exception('Fail to connect to API.');
    }
  }
}
