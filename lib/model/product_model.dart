import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final int id;
  final String name;

  const Product({
    required this.id,
    required this.name,
  });

  @override
  List<Object?> get props => [id, name];
}

class CartProduct extends Equatable {
  final int id;
  final String name;
  final int quantity;

  const CartProduct({
    required this.id,
    required this.name,
    required this.quantity,
  });

  factory CartProduct.fromProduct(Product product) {
    return CartProduct(
      id: product.id,
      name: product.name,
      quantity: 1,
    );
  }

  CartProduct increment() {
    return CartProduct(
      id: id,
      name: name,
      quantity: quantity + 1,
    );
  }

  CartProduct decrement() {
    return CartProduct(
      id: id,
      name: name,
      quantity: quantity - 1,
    );
  }

  @override
  List<Object?> get props => [id, name, quantity];
}
