import 'package:flutter/material.dart';
import 'screens/shopping_list.dart';
import 'screens/feedback_form.dart';
import 'screens/city_search.dart';
import 'screens/event_scheduler.dart';
import 'screens/product_catalog.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Exercises',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const ExerciseListScreen(),
    );
  }
}

class ExerciseListScreen extends StatelessWidget {
  const ExerciseListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Flutter Exercises'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildExerciseCard(
            context,
            '1. Lista de Compras',
            'TextField, ListView, Checkbox',
            const ShoppingListScreen(),
          ),
          _buildExerciseCard(
            context,
            '4. Formulário de Feedback',
            'TextField, Radio buttons',
            const FeedbackFormScreen(),
          ),
          _buildExerciseCard(
            context,
            '6. Pesquisa de Cidades',
            'Autocomplete, TextField',
            const CitySearchScreen(),
          ),
          _buildExerciseCard(
            context,
            '8. Agendamento de Eventos Simples',
            'Calendar, TextField, ListView',
            const EventSchedulerScreen(),
          ),
          _buildExerciseCard(
            context,
            '10. Catálogo de Produtos por Categoria',
            'TabBarView, ListView',
            const ProductCatalogScreen(),
          ),
        ],
      ),
    );
  }

  Widget _buildExerciseCard(
      BuildContext context, String title, String components, Widget screen) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16.0),
      child: ListTile(
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text('Componentes: $components'),
        trailing: const Icon(Icons.arrow_forward),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => screen),
          );
        },
      ),
    );
  }
}
