import 'package:flutter/material.dart';
import 'package:poc_mvvm/repository/magazine_repository.dart';
import 'package:poc_mvvm/services/magazine_service.dart';
import 'package:poc_mvvm/view/magazine_list_screen.dart';
import 'package:poc_mvvm/view_model/magazine_view_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
            value: MagazineViewModel(
                MagazineRepository(magazineService: MagazineService()))),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter App',
        initialRoute: '/',
        routes: {
          '/': (context) => const MagazineListScreen(),
        },
      ),
    );
  }
}
