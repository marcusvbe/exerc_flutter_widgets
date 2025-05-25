import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class EventSchedulerScreen extends StatefulWidget {
  const EventSchedulerScreen({super.key});

  @override
  EventSchedulerScreenState createState() => EventSchedulerScreenState();
}

class EventSchedulerScreenState extends State<EventSchedulerScreen> {
  final TextEditingController _eventNameController = TextEditingController();
  final TextEditingController _eventTimeController = TextEditingController();
  DateTime _selectedDate = DateTime.now();
  final List<Event> _events = [];

  @override
  void dispose() {
    _eventNameController.dispose();
    _eventTimeController.dispose();
    super.dispose();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  void _addEvent() {
    if (_eventNameController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Por favor, digite o nome do evento.'),
        ),
      );
      return;
    }

    setState(() {
      _events.add(Event(
        name: _eventNameController.text,
        date: _selectedDate,
        time: _eventTimeController.text,
      ));
      _eventNameController.clear();
      _eventTimeController.clear();
    });

    // Ordenar eventos por data
    _events.sort((a, b) => a.date.compareTo(b.date));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Agendamento de Eventos'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Data picker
                InkWell(
                  onTap: () => _selectDate(context),
                  child: InputDecorator(
                    decoration: const InputDecoration(
                      labelText: 'Data do Evento',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.calendar_today),
                    ),
                    child: Text(
                      DateFormat('dd/MM/yyyy').format(_selectedDate),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                // Campo de hora
                TextField(
                  controller: _eventTimeController,
                  decoration: const InputDecoration(
                    labelText: 'Hora do Evento (ex: 14:30)',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.access_time),
                  ),
                ),
                const SizedBox(height: 16),
                // Nome do evento
                TextField(
                  controller: _eventNameController,
                  decoration: const InputDecoration(
                    labelText: 'Nome do Evento',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.event),
                  ),
                ),
                const SizedBox(height: 16),
                Center(
                  child: ElevatedButton(
                    onPressed: _addEvent,
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 32, vertical: 12),
                    ),
                    child: const Text('Adicionar Evento'),
                  ),
                ),
              ],
            ),
          ),
          const Divider(),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            child: Text(
              'Eventos Agendados',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: _events.isEmpty
                ? const Center(child: Text('Nenhum evento agendado'))
                : ListView.builder(
                    itemCount: _events.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: const Icon(Icons.event),
                        title: Text(_events[index].name),
                        subtitle: Text(
                          '${DateFormat('dd/MM/yyyy').format(_events[index].date)} - ${_events[index].time}',
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

class Event {
  final String name;
  final DateTime date;
  final String time;

  Event({required this.name, required this.date, required this.time});
}
