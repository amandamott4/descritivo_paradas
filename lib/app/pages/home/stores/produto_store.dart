//responsavel por gerenciar o estado dos produtos

import 'package:descritivo_paradas/app/data/http/exceptions.dart';
import 'package:descritivo_paradas/app/data/repositories/produto_repository.dart';
import 'package:flutter/material.dart';

class ProdutoStore {
final IProdutoReposity repository;


    //o estado inicial da variável é false, então não vai exibir nenhum carregamento na tela
  final ValueNotifier<bool> isLoading = ValueNotifier<bool>(false);

    //variavel que vai guardar o estado
  final ValueNotifier<List<ProdutoModel>> state =
      ValueNotifier<List<ProdutoModel>>([]);

  //
  final ValueNotifier<String> erro = ValueNotifier<String>('');

  ProdutoStore({required this.repository});


  getProdutos() async {
    isloading.value = true

    try{
      //tenta fazer a requisição e atualiza o state(lista de produtos)
      final result = await repository.getProdutos();
      state.value = result;
    } on NotFoundException catch (e) {
      erro.value = e.message;
    } catch (e) {
      erro.value = e.toString();
    }
  }
      isloading.value = false;
}