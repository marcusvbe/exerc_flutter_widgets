import 'package:flutter/material.dart';

class FeedbackFormScreen extends StatefulWidget {
  const FeedbackFormScreen({super.key});

  @override
  FeedbackFormScreenState createState() => FeedbackFormScreenState();
}

class FeedbackFormScreenState extends State<FeedbackFormScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _commentsController = TextEditingController();
  String? _selectedRating;
  final List<String> _ratings = ['Excelente', 'Bom', 'Regular', 'Ruim'];

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _commentsController.dispose();
    super.dispose();
  }

  void _submitFeedback() {
    if (_nameController.text.isEmpty ||
        _emailController.text.isEmpty ||
        _selectedRating == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Por favor, preencha todos os campos obrigatórios.'),
        ),
      );
      return;
    }

    // Simulando o envio do feedback
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Feedback enviado com sucesso!'),
      ),
    );

    // Limpar o formulário
    _nameController.clear();
    _emailController.clear();
    _commentsController.clear();
    setState(() {
      _selectedRating = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Formulário de Feedback'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: 'Nome *',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(
                labelText: 'Email *',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 24),
            const Text(
              'Como você avalia nosso serviço? *',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Column(
              children: _ratings.map((rating) {
                return RadioListTile<String>(
                  title: Text(rating),
                  value: rating,
                  groupValue: _selectedRating,
                  onChanged: (String? value) {
                    setState(() {
                      _selectedRating = value;
                    });
                  },
                );
              }).toList(),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _commentsController,
              decoration: const InputDecoration(
                labelText: 'Comentários',
                border: OutlineInputBorder(),
                alignLabelWithHint: true,
              ),
              maxLines: 5,
            ),
            const SizedBox(height: 24),
            Center(
              child: ElevatedButton(
                onPressed: _submitFeedback,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                ),
                child: const Text('Enviar Feedback'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}