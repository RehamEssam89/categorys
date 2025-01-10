import 'package:flutter/material.dart';

class ProductDetailsScreen extends StatelessWidget {
  final dynamic product;

  const ProductDetailsScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.title, style: TextStyle(fontSize: 20)),
        backgroundColor: Colors.blueGrey.shade900,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16.0),
                child: Image.network(
                  product.image,
                  height: 300,
                  width: 300,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => const Icon(
                      Icons.broken_image,
                      size: 100,
                      color: Colors.grey),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              product.title,
              style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87),
            ),
            const SizedBox(height: 10),
            Text(
              product.description,
              style: const TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 20),
            Text(
              '\$${product.price.toStringAsFixed(2)}',
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // إضافة أي فعل عند الضغط على زر الشراء
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.blueGrey.shade900,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0)),
                padding: const EdgeInsets.symmetric(
                    vertical: 12.0, horizontal: 20.0),
              ),
              child: const Text('Buy Now', style: TextStyle(fontSize: 16)),
            ),
          ],
        ),
      ),
    );
  }
}
