class ProdutoModel {
 
  final String sentido;
  final List<String> itinerario;

  ProdutoModel({
   
    required this.sentido,
    required this.itinerario,
  });

  factory ProdutoModel.fromMap(Map<String, dynamic> map) {
    return ProdutoModel(
    
      sentido: map['sentido'],
      itinerario: List<String>.from(map['sentido']),
    );
  }
}