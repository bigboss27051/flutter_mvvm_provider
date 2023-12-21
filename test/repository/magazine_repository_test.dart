import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:poc_mvvm/models/magazine_model.dart';
import 'package:poc_mvvm/repository/magazine_repository.dart';
import 'package:poc_mvvm/services/magazine_service.dart';

class MockMagazineService extends Mock implements MagazineService {}

void main() {
  late MagazineRepository repository;
  late MockMagazineService mockMagazineService;
  final mockMagazineListForTesting = List<Magazine>.generate(
      3,
      (index) => Magazine(
          malId: index,
          name: 'Test1',
          url: 'https://www.google.com',
          count: 1));

  final mockMagazineMap = <Map<String, dynamic>>[];

  setUp(() {
    for (var element in mockMagazineListForTesting) {
      mockMagazineMap.add(element.toJson());
    }
    mockMagazineService = MockMagazineService();
    repository = MagazineRepository(magazineService: mockMagazineService);
  });

  group('Group of Tests for testing repository', () {
    void getsMockupReturns() {
      when(() => mockMagazineService.gets())
          .thenAnswer((_) async => mockMagazineMap);
    }

    test("call function gets return an magazines data.", () async {
      getsMockupReturns();
      final list = await repository.gets();
      expect(list.length, 3);
    });
  });
}
