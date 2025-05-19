import 'package:flutter/material.dart';

class StyledTitleWidget extends StatelessWidget {
  final String title;
  const StyledTitleWidget( {super.key, required this.title});

  @override
  Widget build(BuildContext context) {
     return Container(
      margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 40),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 255, 255, 255), // cor de fundo
        borderRadius: BorderRadius.circular(20),
      ),
      child: ListTile(
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}