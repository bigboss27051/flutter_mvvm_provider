import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:poc_mvvm/models/apis/api_response.dart';
import 'package:poc_mvvm/models/magazine_model.dart';
import 'package:poc_mvvm/repository/magazine_repository.dart';
import 'package:poc_mvvm/view_model/magazine_view_model.dart';

class MockMagazineRepository extends Mock implements MagazineRepository {}

void main() {
  late MagazineViewModel sutMagazinenotifier;
  late MockMagazineRepository mockMagazineRepository;
  final mockMagazineListForTesting = List<Magazine>.generate(
      3,
      (index) => Magazine(
          malId: index,
          name: 'Test1',
          url: 'https://www.google.com',
          count: 1));

  setUp(() {
    mockMagazineRepository = MockMagazineRepository();
    sutMagazinenotifier = MagazineViewModel(mockMagazineRepository);
  });

  group('Group of Tests for testing change notifier', () {
    test('Should check initial value is correct', () {
      expect(sutMagazinenotifier.response.status, Status.INITIAL);
      expect(sutMagazinenotifier.response.data, null);
    });

    void getMagazineListReturnsQuotes() {
      when(() => mockMagazineRepository.gets())
          .thenAnswer((_) async => mockMagazineListForTesting);
    }

    test('Should check response status and value is correct', () async {
      getMagazineListReturnsQuotes();
      final future = sutMagazinenotifier.fetchMagazineListData();
      expect(sutMagazinenotifier.response.status, Status.LOADING);
      await future;
      expect(sutMagazinenotifier.response.data, mockMagazineListForTesting);
      expect(sutMagazinenotifier.response.status, Status.COMPLETED);
    });

    test('Should check set list value is correct', () {
      sutMagazinenotifier.setSelectedMagazine(List<Magazine>.generate(
          3,
          (index) => Magazine(
              malId: index,
              name: 'Test1',
              url: 'https://www.google.com',
              count: 1)));
      expect(sutMagazinenotifier.magazineList.length, 3);
    });
  });
}
