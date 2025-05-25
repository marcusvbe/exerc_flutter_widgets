import 'package:flutter/material.dart';

class ShoppingListScreen extends StatefulWidget {
  const ShoppingListScreen({super.key});

  @override
  ShoppingListScreenState createState() => ShoppingListScreenState();
}

class ShoppingListScreenState extends State<ShoppingListScreen> {
  final TextEditingController _itemController = TextEditingController();
  final List<ShoppingItem> _items = [];

  @override
  void dispose() {
    _itemController.dispose();
    super.dispose();
  }

  void _addItem() {
    if (_itemController.text.isNotEmpty) {
      setState(() {
        _items
            .add(ShoppingItem(name: _itemController.text, isCompleted: false));
        _itemController.clear();
      });
    }
  }

  void _removeItem(int index) {
    setState(() {
      _items.removeAt(index);
    });
  }

  void _toggleItem(int index) {
    setState(() {
      _items[index].isCompleted = !_items[index].isCompleted;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Lista de Compras'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _itemController,
                    decoration: const InputDecoration(
                      labelText: 'Adicionar item',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: _addItem,
                  child: const Text('Adicionar'),
                ),
              ],
            ),
          ),
          Expanded(
            child: _items.isEmpty
                ? const Center(child: Text('Sua lista está vazia!'))
                : ListView.builder(
                    itemCount: _items.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: Checkbox(
                          value: _items[index].isCompleted,
                          onChanged: (bool? value) {
                            _toggleItem(index);
                          },
                        ),
                        title: Text(
                          _items[index].name,
                          style: TextStyle(
                            decoration: _items[index].isCompleted
                                ? TextDecoration.lineThrough
                                : null,
                          ),
                        ),
                        trailing: IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: () => _removeItem(index),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}

class ShoppingItem {
  String name;
  bool isCompleted;

  ShoppingItem({required this.name, required this.isCompleted});
}
