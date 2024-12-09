//responsavel por gerenciar o estado dos produtos

import 'package:descritivo_paradas/app/data/http/exceptions.dart';
import 'package:descritivo_paradas/app/data/models/endpoint_model.dart';
import 'package:descritivo_paradas/app/data/repositories/itinerario_repository.dart';
import 'package:flutter/material.dart';

class ProdutoStore {
  final IProdutoReposity repository;

  // Variável reativa para o loading
  final ValueNotifier<bool> isLoading = ValueNotifier<bool>(false);

  // Variável reativa para o state
  final ValueNotifier<List<ProdutoModel>> state =
      ValueNotifier<List<ProdutoModel>>([]);

  // Variável reativa para o erro
  final ValueNotifier<String> erro = ValueNotifier<String>('');

  ProdutoStore({required this.repository});

  Future getProdutos() async {
    isLoading.value = true;

    try {
      final result = await repository.getProdutos();
      state.value = result;
    } on NotFoundException catch (e) {
      erro.value = e.message;
    } catch (e) {
      erro.value = e.toString();
    }

    isLoading.value = false;
  }
}