import 'package:flutter/material.dart';

class PetPage extends StatelessWidget {
  final String pageTitle;

  const PetPage({super.key,required this.pageTitle});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(255, 229, 230, 0.9),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(255, 0, 5, 0.8),
        title: Text(pageTitle),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 150,vertical: 20),
        child: CircleAvatar(
          
          radius: 80,
          backgroundImage:AssetImage ('lib/images/kopuk.jpg'),),
      ),
    );
  }
}