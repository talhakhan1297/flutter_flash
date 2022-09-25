import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_flash/cubit/cart_cubit.dart';

class CartView extends StatelessWidget {
  const CartView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(title: const Text("Cart")),
          body: ListView.builder(
            itemCount: state.cartProducts.length,
            itemBuilder: (context, index) {
              final product = state.cartProducts.values.toList()[index];
              return Card(
                child: Row(
                  children: [
                    Text(product.name),
                    const Spacer(),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () => context
                              .read<CartCubit>()
                              .incrementCartProduct(product),
                          icon: const Icon(Icons.add),
                        ),
                        Text(product.quantity.toString()),
                        IconButton(
                          onPressed: () => context
                              .read<CartCubit>()
                              .decrementCartProduct(product),
                          icon: const Icon(Icons.remove),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }
}
