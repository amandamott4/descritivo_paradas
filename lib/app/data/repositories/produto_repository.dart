 abstract class IProdutoReposity {
  Future<List<ProductModel>> getProdutos();
 }

 class ProdutoRepository implements IProdutoRepositoty {
  @override
  Future<List<ProdutoModel>> getProdutos() {
    throw UnimplementedError()
  }
 }