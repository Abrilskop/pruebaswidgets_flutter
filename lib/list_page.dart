import 'package:flutter/material.dart';

class ListPage extends StatefulWidget {
  const ListPage({super.key});

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  final List<String> items = [];
  final TextEditingController _taskController = TextEditingController();

  void _addTask() {
    final text = _taskController.text.trim();
    if (text.isNotEmpty) {
      setState(() {
        items.add(text);
      });
      _taskController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Lista de Tareas')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              key: const Key('taskInput'),
              controller: _taskController,
              decoration: const InputDecoration(labelText: 'Nueva tarea'),
            ),
            const SizedBox(height: 10),
            ElevatedButton.icon(
              key: const Key('addTaskBtn'),
              onPressed: _addTask,
              icon: const Icon(Icons.add_task),
              label: const Text('Agregar'),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                key: const Key('listView'),
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    key: Key('item_$index'),
                    title: Text(items[index]),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
