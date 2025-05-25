import 'package:flutter/material.dart';

class CitySearchScreen extends StatefulWidget {
  const CitySearchScreen({super.key});

  @override
  CitySearchScreenState createState() => CitySearchScreenState();
}

class CitySearchScreenState extends State<CitySearchScreen> {
  final TextEditingController _cityController = TextEditingController();
  String _selectedCity = '';

  // Lista de cidades brasileiras para o Autocomplete
  final List<String> _brazilianCities = [
    'São Paulo',
    'Rio de Janeiro',
    'Brasília',
    'Salvador',
    'Fortaleza',
    'Belo Horizonte',
    'Manaus',
    'Curitiba',
    'Recife',
    'Porto Alegre',
    'Belém',
    'Goiânia',
    'Guarulhos',
    'Campinas',
    'São Luís',
    'São Gonçalo',
    'Maceió',
    'Duque de Caxias',
    'Natal',
    'Teresina',
    'Campo Grande',
    'São Bernardo do Campo',
    'João Pessoa',
    'Nova Iguaçu',
    'Santo André',
    'São José dos Campos',
    'Ribeirão Preto',
    'Jaboatão dos Guararapes',
    'Osasco',
    'Uberlândia',
    'Sorocaba',
    'Contagem',
    'Aracaju',
    'Feira de Santana',
    'Cuiabá',
    'Joinville',
    'Juiz de Fora',
    'Londrina',
    'Aparecida de Goiânia',
    'Ananindeua',
    'Niterói',
    'Porto Velho',
    'Serra',
    'Caxias do Sul'
  ];

  @override
  void dispose() {
    _cityController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Pesquisa de Cidades'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Autocomplete<String>(
              optionsBuilder: (TextEditingValue textEditingValue) {
                if (textEditingValue.text.isEmpty) {
                  return const Iterable<String>.empty();
                }
                return _brazilianCities.where((city) => city
                    .toLowerCase()
                    .contains(textEditingValue.text.toLowerCase()));
              },
              onSelected: (String selection) {
                setState(() {
                  _selectedCity = selection;
                });
              },
              fieldViewBuilder: (BuildContext context,
                  TextEditingController controller,
                  FocusNode focusNode,
                  VoidCallback onFieldSubmitted) {
                _cityController.dispose();
                return TextField(
                  controller: controller,
                  focusNode: focusNode,
                  decoration: const InputDecoration(
                    labelText: 'Digite o nome de uma cidade brasileira',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.search),
                  ),
                );
              },
            ),
            const SizedBox(height: 24),
            if (_selectedCity.isNotEmpty)
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Cidade selecionada:',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      _selectedCity,
                      style: const TextStyle(fontSize: 20),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
