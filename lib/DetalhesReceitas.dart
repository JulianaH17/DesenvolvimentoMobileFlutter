import 'package:flutter/material.dart';
import 'package:aplicativosabore/Receita.dart';

class Detalhesreceitas extends StatelessWidget {
  const Detalhesreceitas({super.key, required this.receita});

  final Receita receita;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow.shade100,

      appBar: AppBar(
        title: const Text("Detalhes da receita"),
        backgroundColor: Colors.yellow.shade300,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // imagem da receita
            receita.imagem != null
                ? Image.network(
              receita.imagem!,
              width: double.infinity,
              height: 200,
              fit: BoxFit.cover,

              // imagem alternativa caso ocorra erro
              errorBuilder: (context, erro, stackTrace) {
                return Container(
                  width: double.infinity,
                  height: 200,
                  color: Colors.grey.shade300,
                  child: const Icon(
                    Icons.restaurant,
                    size: 60,
                    color: Colors.grey,
                  ),
                );
              },
            )
                : Container(
              width: double.infinity,
              height: 200,
              color: Colors.grey.shade300,
              child: const Icon(
                Icons.restaurant,
                size: 60,
                color: Colors.grey,
              ),
            ),

            const SizedBox(height: 20),

            // info da receita
            Container(
              padding: const EdgeInsets.all(20),

              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Text(
                    receita.nome,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 12),

                  // culinaria e dificuldade
                  Text(
                    [
                      if (receita.culinaria != null)
                        receita.culinaria!,
                      if (receita.dificuldade != null)
                        receita.dificuldade!,
                    ].join(' • '),
                    style: const TextStyle(fontSize: 16),
                  ),

                  const SizedBox(height: 16),

                  // tempo total (somente quando os dois valores existem)
                  if (receita.tempoPreparo != null &&
                      receita.tempoCozimento != null)
                    Text(
                      "Tempo total: ${receita.tempoPreparo! + receita.tempoCozimento!} minutos",
                      style: const TextStyle(fontSize: 16),
                    ),

                  if (receita.porcoes != null)
                    Text(
                      "Porções: ${receita.porcoes}",
                      style: const TextStyle(fontSize: 16),
                    ),

                  if (receita.avaliacao != null)
                    Text(
                      "Avaliação: ${receita.avaliacao} / 5",
                      style: const TextStyle(fontSize: 16),
                    ),

                  if (receita.descricao != null) ...[
                    const SizedBox(height: 16),
                    Text(
                      receita.descricao!,
                      style: const TextStyle(fontSize: 16),
                    ),
                  ],

                  const SizedBox(height: 25),

                  const Text(
                    "Ingredientes",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 12),

                  if (receita.ingredientes.isEmpty)
                    const Text("Ingredientes indisponíveis.")
                  else
                    Text(
                      receita.ingredientes.join('\n'),
                      style: const TextStyle(fontSize: 16),
                    ),

                  const SizedBox(height: 25),

                  const Text(
                    "Modo de preparo",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 12),

                  if (receita.instrucoes.isEmpty)
                    const Text("Instruções indisponíveis.")
                  else
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        for (int i = 0; i < receita.instrucoes.length; i++)
                          Padding(
                            padding: const EdgeInsets.only(bottom: 12),
                            child: Text(
                              "${i + 1}. ${receita.instrucoes[i]}",
                              style: const TextStyle(fontSize: 16),
                            ),
                          ),
                      ],
                    ),
                ],
              ),
            ),

            const SizedBox(height: 25),

            // botão de voltar
            Center(
              child: OutlinedButton(
                child: const Text("Voltar às receitas"),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
