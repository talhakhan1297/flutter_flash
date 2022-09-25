part of 'cart_cubit.dart';

class CartState extends Equatable {
  const CartState({
    this.products = const [],
    this.cartProducts = const {},
  });

  final List<Product> products;
  final Map<int, CartProduct> cartProducts;

  CartState copyWith({
    List<Product>? products,
    Map<int, CartProduct>? cartProducts,
  }) {
    return CartState(
      products: products ?? this.products,
      cartProducts: cartProducts ?? this.cartProducts,
    );
  }

  CartProduct? getCartProduct(Product product) {
    return cartProducts[product.id];
  }

  @override
  List<Object?> get props => [
        products,
        products.length,
        cartProducts,
      ];
}
