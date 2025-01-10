import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:shop/mvvc/model/product_model.dart';

class ProductData {
  static Future<List<ProductModel>> fetchCategory(String category) async {
    final response = await http.get(
      Uri.parse('https://fakestoreapi.com/products/category/$category'),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body) as List;
      return data.map((e) => ProductModel.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load products');
    }
  }
}
