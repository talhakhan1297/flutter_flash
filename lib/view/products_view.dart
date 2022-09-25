import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_flash/cubit/cart_cubit.dart';
import 'package:flutter_flash/view/cart_view.dart';

class ProductsView extends StatelessWidget {
  const ProductsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Products")),
      body: BlocBuilder<CartCubit, CartState>(
        builder: (context, state) {
          print(state.products.length);
          if (state.products.isEmpty) {
            context.read<CartCubit>().initialize();
            return const SizedBox();
          }
          return Stack(
            alignment: Alignment.bottomRight,
            children: [
              ListView.builder(
                itemCount: state.products.length,
                itemBuilder: (context, index) {
                  final product = state.products[index];
                  return Card(
                    child: Row(
                      children: [
                        Text(product.name),
                        const Spacer(),
                        if (state.getCartProduct(product) == null)
                          IconButton(
                              onPressed: () => context
                                  .read<CartCubit>()
                                  .incrementProduct(product),
                              icon: const Icon(Icons.add))
                        else
                          Row(children: [
                            IconButton(
                              onPressed: () => context
                                  .read<CartCubit>()
                                  .incrementProduct(product),
                              icon: const Icon(Icons.add),
                            ),
                            Text(state
                                .getCartProduct(product)!
                                .quantity
                                .toString()),
                            IconButton(
                              onPressed: () => context
                                  .read<CartCubit>()
                                  .decrementProduct(product),
                              icon: const Icon(Icons.remove),
                            ),
                          ])
                      ],
                    ),
                  );
                },
              ),
              OutlinedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => const CartView()));
                },
                child: Text(
                  "Cart (${state.cartProducts.length})",
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
