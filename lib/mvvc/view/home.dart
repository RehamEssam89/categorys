import 'package:flutter/material.dart';
import 'package:shop/mvvc/view/category_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Categories',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          backgroundColor: Colors.blueGrey.shade900,
          elevation: 2,
        ),
        body: ListView(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          children: [
            _buildCategoryTile(
              context,
              title: 'Electronics',
              icon: Icons.devices,
              color: Colors.blue.shade400,
              category: 'electronics',
            ),
            _buildCategoryTile(
              context,
              title: 'Jewelery',
              icon: Icons.diamond,
              color: Colors.purple.shade400,
              category: 'jewelery',
            ),
            _buildCategoryTile(
              context,
              title: 'Men\'s Clothing',
              icon: Icons.male,
              color: Colors.green.shade400,
              category: 'men\'s clothing',
            ),
            _buildCategoryTile(
              context,
              title: 'Women\'s Clothing',
              icon: Icons.female,
              color: Colors.pink.shade400,
              category: 'women\'s clothing',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryTile(BuildContext context,
      {required String title,
      required IconData icon,
      required Color color,
      required String category}) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      elevation: 3,
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: ListTile(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        leading: Icon(icon, color: color, size: 30),
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        trailing: const Icon(Icons.arrow_forward_ios, color: Colors.grey),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CategoryScreen(category: category),
            ),
          );
        },
      ),
    );
  }
}
