import 'package:http/http.dart' as http;
import 'dart:io';

Future<void> buscarItinerarioDescritivo() async {
  // Solicita ao usuário que insira o código da linha
  print('Digite o código da linha:');
  String? codigoLinha = stdin.readLineSync();

  // Verifica se o código da linha foi inserido
  if (codigoLinha == null || codigoLinha.isEmpty) {
    print('Código da linha inválido.');
    return;
  }

  // Monta a URL completa do endpoint
  String url = 'http://10.233.144.111:3000/itinerario/descritivo/$codigoLinha';

  try {
    // Realiza a requisição GET
    var response = await http.get(Uri.parse(url));

    // Verifica o status da resposta
    if (response.statusCode == 200) {
      // Imprime o corpo da resposta
      print('Resposta: ${response.body}');
    } else {
      print('Erro na requisição. Código de status: ${response.statusCode}');
    }
  } catch (e) {
    print('Erro ao fazer a requisição: $e');
  }
}

void main() {
  buscarItinerarioDescritivo();
}