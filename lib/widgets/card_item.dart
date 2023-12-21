import 'package:flutter/material.dart';

class CardItem extends StatelessWidget {
  const CardItem({required this.title, super.key});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.deepPurpleAccent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      elevation: 8,
      child: Center(
          child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.75,
              height: MediaQuery.of(context).size.height * 0.1,
              child: Center(
                child: Text(
                  title,
                  style: const TextStyle(color: Colors.white),
                ),
              ))),
    );
  }
}
