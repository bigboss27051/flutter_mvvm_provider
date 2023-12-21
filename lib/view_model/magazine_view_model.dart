import 'package:flutter/material.dart';
import 'package:poc_mvvm/models/apis/api_response.dart';
import 'package:poc_mvvm/models/magazine_model.dart';
import 'package:poc_mvvm/repository/magazine_repository.dart';

class MagazineViewModel with ChangeNotifier {
  MagazineViewModel(this.magazineRepository);
  final MagazineRepository magazineRepository;

  ApiResponse _apiResponse = ApiResponse.initial('Empty data');
  List<Magazine> _magazineList = [];

  ApiResponse get response {
    return _apiResponse;
  }

  List<Magazine> get magazineList {
    return _magazineList;
  }

  Future<void> fetchMagazineListData() async {
    _apiResponse = ApiResponse.loading('Fetching magazine list data');
    notifyListeners();
    try {
      final magazineList = await magazineRepository.gets();
      _apiResponse = ApiResponse.completed(magazineList);
    } catch (e) {
      debugPrint(e.toString());
      _apiResponse = ApiResponse.error(e.toString());
    }
    notifyListeners();
  }

  void setSelectedMagazine(List<Magazine> magazineList) {
    _magazineList = magazineList;
    notifyListeners();
  }
}
