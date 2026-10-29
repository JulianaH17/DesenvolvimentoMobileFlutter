import "package:flutter/material.dart";

class Telaprincipal extends StatelessWidget {
  const Telaprincipal({super.key});   //construtor da nossa classe

  @override
  Widget build(BuildContext context) {
    return Scaffold(  //fornece a estrutura básica de uma tela
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

                child: const Row(
                  children: [
                    Icon(Icons.search, color: Colors.grey),
                    SizedBox(width: 12),
                    Text("Pesquisar receitas..."),
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

              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),

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

              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),

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