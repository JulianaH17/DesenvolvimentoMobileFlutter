import "package:flutter/material.dart";
import 'package:aplicativosabore/Receita.dart';
import 'package:aplicativosabore/DetalhesReceitas.dart';
import 'package:aplicativosabore/Utils/Request.dart';

class Telaprincipal extends StatefulWidget {
  const Telaprincipal({super.key}); //construtor da nossa classe

  @override
  State<Telaprincipal> createState() => _TelaprincipalState();
}

//classe feita para o campo de pesquisa funcional
class _TelaprincipalState extends State<Telaprincipal> {

  final pesquisa = TextEditingController();
  String? mensagemErro;
  List<Receita> receitas = [];
  bool carregando = true;
  bool mostrarTodas = false;

  @override
  void initState() {
    super.initState();
    carregarReceitas();
  }

  Future<void> carregarReceitas() async {
    try {
      final resultado = await carregar();

      setState(() {
        receitas = resultado;
        carregando = false;
      });
    } catch (e) {
      setState(() {
        mensagemErro = 'Não foi possível carregar as receitas.';
        carregando = false;
      });
    }
  }

  Future<void> verTodasReceitas() async {
    setState(() {
      mostrarTodas = true;
      carregando = true;
    });

    await carregarReceitas();
  }

  void validarPesquisa(String valor) {
    setState(() {
      if (valor.trim().isEmpty) {
        mensagemErro = "Preencha o campo vazio!";
      } else if (valor.trim().length < 3) {
        mensagemErro = "Escreva ao menos 3 caracteres!";
      } else {
        mensagemErro = null;
      }
    });
  }

  Future<void> confirmarPesquisa() async {
    final texto = pesquisa.text.trim();

    validarPesquisa(texto);

    if (texto.isEmpty || texto.length < 3) {
      return;
    }

    setState(() {
      carregando = true;
      mensagemErro = null;
    });

    try {
      final resultado = await pesquisar(texto);

      setState(() {
        receitas = resultado;
        carregando = false;
      });

      if (resultado.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Nenhuma receita encontrada.'),
          ),
        );
      }

    } catch (e) {
      setState(() {
        carregando = false;
        mensagemErro = 'Erro ao pesquisar receitas.';
      });
    }
  }

  @override
  void dispose() {
    pesquisa.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("Saborê"),
        backgroundColor: Colors.yellow.shade300,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),

        child: Container(
          padding: const EdgeInsets.all(20),

          decoration: BoxDecoration(
            color: Colors.yellow.shade100,
            borderRadius: BorderRadius.circular(20),
          ),

          child: Column(
            children: [
              Row(
                children: [
                  const CircleAvatar(
                    backgroundColor: Colors.grey,
                    child: Icon(
                      Icons.restaurant_menu,
                      color: Colors.white,
                    ),
                  ),

                  const SizedBox(width: 16),

                  const Expanded(
                    child: Text(
                      "Bem-vindo ao Saborê!",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 24),

              const Text(
                "O que vamos preparar hoje?",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 8),

              const Text(
                "Encontre receitas deliciosas para preparar no seu dia a dia.",
                style: TextStyle(fontSize: 16),
              ),

              const SizedBox(height: 24),

              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),

                child: Row(
                  children: [
                    const Icon(
                      Icons.search,
                      color: Colors.grey,
                      size: 24,
                    ),

                    const SizedBox(width: 8),

                    Expanded(
                      child: TextField(
                        controller: pesquisa,
                        decoration: InputDecoration(
                          hintText: "Pesquisar receitas",
                          errorText: mensagemErro,
                          border: const OutlineInputBorder(),
                        ),
                        onChanged: validarPesquisa,
                      ),
                    ),

                    const SizedBox(width: 12),

                    FilledButton(
                      onPressed: confirmarPesquisa,
                      child: const Text("Procurar"),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 16),

              InkWell(
                onTap: verTodasReceitas,

                child: Container(
                  padding: const EdgeInsets.all(16),

                  decoration: BoxDecoration(
                    color: Colors.grey.shade600,
                    borderRadius: BorderRadius.circular(12),
                  ),

                  child: const Row(
                    children: [
                      Icon(
                        Icons.menu_book,
                        color: Colors.white,
                      ),
                      SizedBox(width: 8),
                      Text(
                        "Ver todas as receitas disponíveis",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 28),

              const Text(
                "Receitas em destaque",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 16),

              // Exibição das receitas recebidas da API
              if (carregando)
                const CircularProgressIndicator()

              else if (receitas.isEmpty)
                const Text('Nenhuma receita encontrada.')

              else
                Column(
                  children: (mostrarTodas ? receitas : receitas.take(2)).map((receita) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 12),

                      child: FilledButton(
                        style: FilledButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.black,
                          padding: const EdgeInsets.all(16),
                        ),

                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Detalhesreceitas(
                                receita: receita,
                              ),
                            ),
                          );
                        },

                        child: Row(
                          children: [
                            const Icon(
                              Icons.restaurant,
                              size: 40,
                              color: Colors.grey,
                            ),

                            const SizedBox(width: 16),

                            Expanded(
                              child: Text(
                                "${receita.nome}\nTempo de preparo: ${receita.tempoPreparo ?? 'Não informado'} minutos",
                                style: const TextStyle(fontSize: 16),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }).toList(),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
