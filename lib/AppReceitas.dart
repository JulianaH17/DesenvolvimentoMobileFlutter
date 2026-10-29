import "package:flutter/material.dart";
import 'package:aplicativosabore/TelaPrincipal.dart';

class AppReceitas extends StatelessWidget {
  const AppReceitas({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        home: const Telaprincipal(),
    );

  }
}