import "package:flutter/material.dart";
import 'package:aplicativosabore/Receita.dart';
import 'package:aplicativosabore/DetalhesReceitas.dart';

class Telaprincipal extends StatefulWidget {
  const Telaprincipal({super.key}); //construtor da nossa classe

  @override
  State<Telaprincipal> createState() => _TelaprincipalState();
}

//classe feita para o campo de pesquisa funcional
class _TelaprincipalState extends State<Telaprincipal> {

  final pesquisa = TextEditingController();
  String? mensagemErro;

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

  void confirmarPesquisa() {
    validarPesquisa(pesquisa.text);

    if (mensagemErro == null) {
      final texto = pesquisa.text.trim();

      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Buscando por: $texto"))
      );

      pesquisa.clear();
    }
  }

  @override
  void dispose() {
    pesquisa.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //receitas que eu tinha colocado antes
    const bolo = Receita(
      nome: 'Bolo de Cenoura',
      descricao: 'Um bolinho pra se comer no final da tarde, delicioso e fofinho.',
      ingredientes: ['Cenoura', 'Farinha', 'Açúcar', 'Ovos', 'Fermento', 'Óleo'],
    );

    const costela = Receita(
      nome: 'Costela Assada no Forno',
      descricao: 'Costela preparada no forno.',
      ingredientes: ['Costela', 'Sal', 'Alho'],
    );

    return Scaffold( //fornece a estrutura básica de uma tela
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

                    const SizedBox(width: 8,),

                    Expanded(
                      child: TextField(
                        controller: pesquisa, //variável criada lá no começo na outra classe stateful
                        decoration: InputDecoration(
                          hintText: "Pesquisar receitas",
                          errorText: mensagemErro,
                          border: const OutlineInputBorder(),
                        ),
                        onChanged: validarPesquisa,
                      ),
                    ),

                    const SizedBox(width: 12,),

                    FilledButton(
                      onPressed: confirmarPesquisa,
                      child: const Text("Procurar"),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 16),

              Container(
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

              const SizedBox(height: 28),

              const Text(
                "Receitas em destaque",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 16),

              FilledButton(
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
                        receita: bolo,
                      ),
                    ),
                  );
                },

                child: const Row(
                  children: [
                    Icon(
                      Icons.restaurant,
                      size: 40,
                      color: Colors.grey,
                    ),

                    SizedBox(width: 16),

                    Expanded(
                      child: Text(
                        "Bolo de Cenoura\nTempo de preparo: 30~45 minutos",
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 12),

              FilledButton(
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
                        receita: costela,
                      ),
                    ),
                  );
                },

                child: const Row(
                  children: [
                    Icon(
                      Icons.restaurant,
                      size: 40,
                      color: Colors.grey,
                    ),

                    SizedBox(width: 16),

                    Expanded(
                      child: Text(
                        "Costela Assada no Forno\nTempo de preparo: 3~4 horas",
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
