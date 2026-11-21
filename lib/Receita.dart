class Receita{
  //metodo construtor
  const Receita({
    required this.nome,
    this.descricao,
    this.imagem,
    this.ingredientes = const [],
  });

  final String nome;
  // '?' -> pode ser que a variavel seja nula
  final String? descricao;
  final String? imagem;
  final List<String> ingredientes;
}