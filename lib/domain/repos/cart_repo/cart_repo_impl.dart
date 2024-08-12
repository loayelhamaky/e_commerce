import 'package:injectable/injectable.dart';

import 'cart_repo.dart';

@Injectable(as: CartRepo)
class CartRepoImpl extends CartRepo{
  @override
  addProduct(String id) {
    // TODO: implement addProduct
    throw UnimplementedError();
  }

  @override
  getCart() {
    // TODO: implement getCart
    throw UnimplementedError();
  }

  @override
  removeProduct(String id) {
    // TODO: implement removeProduct
    throw UnimplementedError();
  }

}