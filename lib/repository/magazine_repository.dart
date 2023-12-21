import 'package:poc_mvvm/models/magazine_model.dart';
import 'package:poc_mvvm/services/magazine_service.dart';

abstract class IMagazineRepository {
  Future gets() async {}
}

class MagazineRepository implements IMagazineRepository {
  MagazineRepository({required this.magazineService});
  final MagazineService magazineService;

  @override
  Future<List<Magazine>> gets() async {
    final res = await magazineService.gets();
    final list = List<Magazine>.from(res.map((p) => Magazine.fromJson(p)));
    return list;
  }
}
