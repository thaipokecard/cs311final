import 'dart:convert';

import 'package:cs311final/1_domain/repositories/digimon_detail_repo.dart';
import 'package:http/http.dart' as http;

class DigimonDetailRepoImpl extends DigimonDetailRepo {
  final client = http.Client();

  @override
  Future<Map<String, dynamic>> getDigimonJsonDetail(String digimonName) async {
    final response = await client
        .get(Uri.parse('https://www.digi-api.com/api/v1/digimon/$digimonName'));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Fail to connect to API.');
    }
  }

}