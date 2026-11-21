import 'package:flutter/material.dart';
import 'package:aplicativosabore/Receita.dart';

class Detalhesreceitas extends StatelessWidget {
  const Detalhesreceitas({super.key, required this.receita});

  final Receita receita;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(receita.nome),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
                receita.descricao ?? 'Descrição Indisponível'
            ),

            const SizedBox(height: 20),
            Text('Ingredientes'),
            const SizedBox(height: 10),
            Text(receita.ingredientes.join(', ')),
            const SizedBox(height: 20),

            OutlinedButton(
              child: const Text('Voltar'),
              onPressed: () {
                Navigator.pop(context);
              },
            )
          ],
        ),
      ),
    );
  }
}
