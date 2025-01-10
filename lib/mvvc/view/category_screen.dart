import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/mvvc/cubic/cubit/product_cubit.dart';
import 'package:shop/mvvc/cubic/cubit/product_state.dart';
import 'package:shop/mvvc/view/ProductDetailsScreen.dart';

class CategoryScreen extends StatelessWidget {
  final String category;

  const CategoryScreen({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductCubit()..fetchProducts(category),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('$category'),
          backgroundColor: Colors.blueGrey.shade900,
        ),
        body: BlocBuilder<ProductCubit, ProductState>(
          builder: (context, state) {
            if (state is ProductLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is ProductSuccess) {
              return ListView.builder(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 10.0),
                itemCount: state.products.length,
                itemBuilder: (context, index) {
                  final product = state.products[index];
                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    elevation: 5,
                    margin: const EdgeInsets.only(bottom: 16.0),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(12.0),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                ProductDetailsScreen(product: product),
                          ),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(12.0),
                              child: Image.network(
                                product.image,
                                height: 100,
                                width: 100,
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) =>
                                    const Icon(Icons.broken_image,
                                        size: 100, color: Colors.grey),
                              ),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    product.title,
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black87,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    product.description,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(color: Colors.grey),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    '\$${product.price.toStringAsFixed(2)}',
                                    style: const TextStyle(
                                      fontSize: 18,
                                      color: Colors.green,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  // إضافة التقييم في CategoryScreen
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                        size: 16,
                                      ),
                                      const SizedBox(width: 4),
                                      Text(
                                        '${product.rating.rate} (${product.rating.count} reviews)',
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            } else if (state is ProductError) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.error, size: 50, color: Colors.red),
                    const SizedBox(height: 10),
                    Text(
                      'Error: ${state.message}',
                      style: const TextStyle(fontSize: 16),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              );
            } else {
              return const Center(
                child: Text(
                  'No data available.',
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
