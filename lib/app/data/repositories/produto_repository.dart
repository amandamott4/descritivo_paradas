import 'dart:convert';
import 'package:descritivo_paradas/app/data/http/exceptions.dart';
import 'package:descritivo_paradas/app/data/http/http_client.dart';
import 'package:descritivo_paradas/app/data/models/produto_model.dart';

abstract class IProdutoReposity {
  Future<List<ProdutoModel>> getProdutos();
}

class ProdutoRepository implements IProdutoReposity {
  final IHttpClient client;

  ProdutoRepository({required this.client});

  @override
  Future<List<ProdutoModel>> getProdutos() async {
    final response = await client.get(
      url: 'http://10.233.144.111:3000/itinerario/descritivo/:codigolinha',
    );

    if (response.statusCode == 200) {
      final List<ProdutoModel> produtos = [];

      final body = jsonDecode(response.body);

      body['products'].map((item) {
        final ProdutoModel produto = ProdutoModel.fromMap(item);
        produtos.add(produto);
      }).toList();

      return produtos;
    } else if (response.statusCode == 404) {
      throw NotFoundException('A url informada não é válida');
    } else {
      throw Exception('Não foi possível carregar os produtos');
    }
  }
}