import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:aplicativosabore/Receita.dart';

Future<List<Receita>> carregar() async {
  final resposta = await http.get(
    Uri.https('dummyjson.com', '/recipes'),
  ).timeout(const Duration(seconds: 10));

  if (resposta.statusCode != 200) {
    throw Exception('HTTP ${resposta.statusCode}');
  }

  final dados = jsonDecode(resposta.body);

  if (dados is! Map<String, dynamic>) {
    throw const FormatException('Formato inválido');
  }

  if (dados['recipes'] is! List) {
    throw const FormatException('Lista de receitas inválida');
  }

  return (dados['recipes'] as List).map((item) {
    if (item is! Map<String, dynamic>) {
      throw const FormatException('Objeto inválido');
    }

    return Receita.fromJson(item);
  }).toList();
}


Future<List<Receita>> pesquisar(String termo) async {
  final busca = termo.trim();

  if (busca.isEmpty) {
    throw const FormatException('Digite um nome de receita');
  }

  final resposta = await http.get(
    Uri.https(
      'dummyjson.com',
      '/recipes/search',
      {'q': busca},
    ),
  ).timeout(const Duration(seconds: 10));


  if (resposta.statusCode != 200) {
    throw Exception('HTTP ${resposta.statusCode}');
  }

  final dados = jsonDecode(resposta.body);

  if (dados is! Map<String, dynamic>) {
    throw const FormatException('Formato inválido');
  }

  if (dados['recipes'] is! List) {
    throw const FormatException('Lista de receitas inválida');
  }

  return (dados['recipes'] as List).map((item) {
    if (item is! Map<String, dynamic>) {
      throw const FormatException('Objeto inválido');
    }

    return Receita.fromJson(item);
  }).toList();
}
