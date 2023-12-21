import 'package:dio/dio.dart';

abstract class IMagazineService {
  Future<dynamic> gets() async {}
}

class MagazineService implements IMagazineService {
  final Dio dio = Dio();
  static const url = 'https://api.jikan.moe/v4/magazines';

  @override
  Future<dynamic> gets() async {
    final res = await dio.get(url);
    final data = res.data['data'];
    return data;
  }
}
