import 'package:flutter/material.dart';

class ProductCatalogScreen extends StatelessWidget {
  const ProductCatalogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3, // Número de abas
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text('Catálogo de Produtos'),
          bottom: const TabBar(
            tabs: [
              Tab(icon: Icon(Icons.devices), text: 'Eletrônicos'),
              Tab(icon: Icon(Icons.shopping_bag), text: 'Roupas'),
              Tab(icon: Icon(Icons.book), text: 'Livros'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _buildProductList(electronicProducts),
            _buildProductList(clothingProducts),
            _buildProductList(bookProducts),
          ],
        ),
      ),
    );
  }

  Widget _buildProductList(List<Product> products) {
    return ListView.builder(
      padding: const EdgeInsets.all(8.0),
      itemCount: products.length,
      itemBuilder: (context, index) {
        return Card(
          margin: const EdgeInsets.symmetric(vertical: 8.0),
          child: ListTile(
            leading: Icon(
              products[index].icon,
              color: products[index].color,
              size: 36,
            ),
            title: Text(products[index].name),
            subtitle: Text('R\$ ${products[index].price.toStringAsFixed(2)}'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              // Aqui poderia navegar para a tela de detalhes do produto
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Você selecionou: ${products[index].name}'),
                  duration: const Duration(seconds: 1),
                ),
              );
            },
          ),
        );
      },
    );
  }
}

class Product {
  final String name;
  final double price;
  final IconData icon;
  final Color color;

  Product({
    required this.name,
    required this.price,
    required this.icon,
    required this.color,
  });
}

// Dados de exemplo
final List<Product> electronicProducts = [
  Product(
      name: 'Smartphone Galaxy S21',
      price: 3999.99,
      icon: Icons.smartphone,
      color: Colors.blue),
  Product(
      name: 'Notebook Dell XPS',
      price: 7499.90,
      icon: Icons.laptop,
      color: Colors.grey),
  Product(
      name: 'Smart TV 55"',
      price: 2799.00,
      icon: Icons.tv,
      color: Colors.black),
  Product(
      name: 'Fone de Ouvido Bluetooth',
      price: 299.90,
      icon: Icons.headphones,
      color: Colors.purple),
  Product(
      name: 'Câmera DSLR',
      price: 3599.00,
      icon: Icons.camera_alt,
      color: Colors.red),
  Product(
      name: 'Tablet iPad',
      price: 4199.00,
      icon: Icons.tablet_android,
      color: Colors.amber),
  Product(
      name: 'Echo Dot', price: 349.90, icon: Icons.speaker, color: Colors.teal),
];

final List<Product> clothingProducts = [
  Product(
      name: 'Camiseta Básica',
      price: 49.90,
      icon: Icons.person,
      color: Colors.indigo),
  Product(
      name: 'Calça Jeans',
      price: 129.90,
      icon: Icons.accessibility,
      color: Colors.blue),
  Product(
      name: 'Vestido Casual',
      price: 159.90,
      icon: Icons.woman,
      color: Colors.pink),
  Product(
      name: 'Moletom com Capuz',
      price: 189.90,
      icon: Icons.person,
      color: Colors.grey),
  Product(
      name: 'Tênis Esportivo',
      price: 249.90,
      icon: Icons.directions_walk,
      color: Colors.green),
  Product(
      name: 'Jaqueta de Couro',
      price: 399.90,
      icon: Icons.person,
      color: Colors.brown),
];

final List<Product> bookProducts = [
  Product(
      name: 'O Senhor dos Anéis',
      price: 89.90,
      icon: Icons.book,
      color: Colors.amber),
  Product(
      name: 'Harry Potter', price: 69.90, icon: Icons.book, color: Colors.red),
  Product(
      name: 'A Arte da Guerra',
      price: 34.90,
      icon: Icons.book,
      color: Colors.brown),
  Product(
      name: 'Meditações', price: 29.90, icon: Icons.book, color: Colors.indigo),
  Product(
      name: 'Clean Code',
      price: 99.90,
      icon: Icons.computer,
      color: Colors.blue),
  Product(
      name: 'O Pequeno Príncipe',
      price: 24.90,
      icon: Icons.book,
      color: Colors.green),
  Product(
      name: 'Dom Quixote',
      price: 59.90,
      icon: Icons.book,
      color: Colors.orange),
  Product(
      name: 'A Divina Comédia',
      price: 49.90,
      icon: Icons.book,
      color: Colors.purple),
];
