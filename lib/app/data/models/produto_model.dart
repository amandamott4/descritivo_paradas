class ProdutoModel {
  final String title;
  final String description;
  final String price;
  final String ratinge;
  final String brand;
  final String category;
  final String thumbnail;;
  final String images;

  ProdutoModel({required this.title,
    required this.description,
    required this.price,
    required this.ratinge,
    required this.brand,
    required this.category,
    required this.thumbnail,
    required this.images
  });

  factory  ProdutoModel.fromMap(Map<String, dynamic> map) {
    return ProdutoModel( 
      title: map['title'],
      description: map['description'],
      price:  map['price']  * 1.0,
      ratinge:  map['ratinge'] * 1.0,
      brand:  map['brand'],
      category:  map['category'],
      thumbnail:  map['thumbnail'],
      images: List<String>.from((map['images'] as List)),
    );
  }
}
 