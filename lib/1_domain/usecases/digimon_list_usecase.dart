import 'package:cs311final/2_data/repositories/digimon_list_repo_impl.dart';

import '../entities/digimon_basic.dart';
import '../repositories/digimon_list_repo.dart';

class DigimonListUsecase {
  Future<List<DigimonBasic>> getDigimonList(int page) async {
    DigimonListRepo digimonListRepo = DigimonListRepoImpl();
    final digimonList = await digimonListRepo.getDigimonJsonList(page);
    return digimonList
        .map((val) => DigimonBasic(val['name'], val['image']))
        .toList();
  }
}
