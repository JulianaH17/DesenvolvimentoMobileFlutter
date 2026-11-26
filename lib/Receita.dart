
class Receita {
  // metodo construtor
  const Receita({
    required this.id,
    required this.nome,
    this.descricao,
    this.imagem,
    this.ingredientes = const [],
    this.instrucoes = const [],
    this.tempoPreparo,
    this.tempoCozimento,
    this.porcoes,
    this.avaliacao,
    this.culinaria,
    this.dificuldade,
    this.tipoRefeicao = const [],
  });

  final int id;
  final String nome;
  final String? descricao;
  final String? imagem;
  final List<String> ingredientes;
  final List<String> instrucoes;
  final int? tempoPreparo;
  final int? tempoCozimento;
  final int? porcoes;
  final num? avaliacao;
  final String? culinaria;
  final String? dificuldade;
  final List<String> tipoRefeicao;

  // converte os dados da API em um objeto Receita
  factory Receita.fromJson(Map<String, dynamic> json) {
    return Receita(
      id: json['id'] is int ? json['id'] : 0,

      nome: json['name']?.toString() ?? 'Receita sem nome',

      descricao: json['description']?.toString(),

      imagem: json['image']?.toString(),

      ingredientes: json['ingredients'] is List
          ? (json['ingredients'] as List)
          .map((item) => item.toString())
          .toList()
          : [],

      instrucoes: json['instructions'] is List
          ? (json['instructions'] as List)
          .map((item) => item.toString())
          .toList()
          : [],

      tempoPreparo: json['prepTimeMinutes'] is num
          ? (json['prepTimeMinutes'] as num).toInt()
          : null,

      tempoCozimento: json['cookTimeMinutes'] is num
          ? (json['cookTimeMinutes'] as num).toInt()
          : null,

      porcoes: json['servings'] is num
          ? (json['servings'] as num).toInt()
          : null,

      avaliacao: json['rating'] is num
          ? json['rating']
          : null,

      culinaria: json['cuisine']?.toString(),

      dificuldade: json['difficulty']?.toString(),

      tipoRefeicao: json['mealType'] is List
          ? (json['mealType'] as List)
          .map((item) => item.toString())
          .toList()
          : [],
    );
  }
}
