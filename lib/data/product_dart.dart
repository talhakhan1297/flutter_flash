import 'package:flutter_flash/model/product_model.dart';

final productData = List.generate(
  10,
  (index) => Product(
    name: "Product ${index + 1}",
    id: index + 1,
  ),
);
