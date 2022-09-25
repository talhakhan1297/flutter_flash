import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_flash/data/product_dart.dart';
import 'package:flutter_flash/model/product_model.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(const CartState());

  void initialize() {
    emit(state.copyWith(products: productData));
  }

  void incrementProduct(Product product) {
    final cartProducts =
        state.cartProducts.map((key, value) => MapEntry(key, value));
    if (state.cartProducts.keys.contains(product.id)) {
      cartProducts[product.id] = cartProducts[product.id]!.increment();
    } else {
      cartProducts.addAll({product.id: CartProduct.fromProduct(product)});
    }
    emit(state.copyWith(cartProducts: cartProducts));
  }

  void decrementProduct(Product product) {
    final cartProducts =
        state.cartProducts.map((key, value) => MapEntry(key, value));
    if (cartProducts[product.id]!.quantity > 1) {
      cartProducts[product.id] = cartProducts[product.id]!.decrement();
    } else {
      cartProducts.removeWhere((key, value) => key == product.id);
    }
    emit(state.copyWith(cartProducts: cartProducts));
  }

  void incrementCartProduct(CartProduct product) {
    final cartProducts =
        state.cartProducts.map((key, value) => MapEntry(key, value));

    cartProducts[product.id] = cartProducts[product.id]!.increment();

    emit(state.copyWith(cartProducts: cartProducts));
  }

  void decrementCartProduct(CartProduct product) {
    final cartProducts =
        state.cartProducts.map((key, value) => MapEntry(key, value));
    if (product.quantity > 1) {
      cartProducts[product.id] = cartProducts[product.id]!.decrement();
    } else {
      cartProducts.removeWhere((key, value) => key == product.id);
    }
    emit(state.copyWith(cartProducts: cartProducts));
  }
}
