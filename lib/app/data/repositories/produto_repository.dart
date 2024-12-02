import 'dart:convert';

import 'package:descritivo_paradas/app/data/http/exceptions.dart';
import 'package:descritivo_paradas/app/data/models/produto_model.dart';

abstract class IProdutoReposity {
  Future<List<ProdutoModel>> getProdutos();
 }

 class ProdutoRepository implements IProdutoReposity {
   final IHttpClientclient;

  ProdutoRepository({required this.client});

  

  @override
  Future<List<ProdutoModel>> getProdutos() async {
    final response = await client.get(
      url: "https://dummyjson.com/products" //link da https aqui
    );

    if (response.satusCode == 200) {
      final List<ProdutoModel> produtos = [];

      //transforma a string em map
      final body = jsonDecode(response.body);

      body['products'].map((item) {
        final ProdutoModel produto = ProdutoModel.fromMap(item);
        produtos. add(produto);
      }).toList();     

      return produtos;
    } else if(response.satatusCode == 404) {
      throw NotFoundException('A url não é válida');
    } else {
      throw Exception('Não foi possível carregar os produtos');
    }
  }
}