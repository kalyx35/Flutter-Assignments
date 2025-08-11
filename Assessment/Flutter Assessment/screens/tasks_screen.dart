import 'package:flutter/material.dart';
import 'package:student_connect/models/task.dart';
import 'package:student_connect/services/storage_service.dart';
import 'package:student_connect/widgets/task_card.dart';
import 'package:uuid/uuid.dart';

class TasksScreen extends StatefulWidget {
  const TasksScreen({super.key});

  @override
  _TasksScreenState createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  final StorageService _storage = StorageService();
  final List<Task> _tasks = [];
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    final loaded = await _storage.loadTasks();
    setState(() {
      _tasks.clear();
      _tasks.addAll(loaded);
      _loading = false;
    });
  }

  Future<void> _save() async {
    await _storage.saveTasks(_tasks);
  }

  Future<void> _addOrEdit({Task? existing}) async {
    final titleCtrl = TextEditingController(text: existing?.title ?? '');
    final descCtrl = TextEditingController(text: existing?.description ?? '');
    final isNew = existing == null;

    await showDialog(
      context: context,
      builder: (c) => AlertDialog(
        title: Text(isNew ? 'Add Task' : 'Edit Task'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(controller: titleCtrl, decoration: InputDecoration(labelText: 'Title')),
            TextField(controller: descCtrl, decoration: InputDecoration(labelText: 'Description')),
          ],
        ),
        actions: [
          TextButton(onPressed: () => Navigator.of(c).pop(), child: Text('Cancel')),
          ElevatedButton(
              onPressed: () {
                final title = titleCtrl.text.trim();
                if (title.isEmpty) return;
                if (isNew) {
                  final t = Task(id: Uuid().v4(), title: title, description: descCtrl.text.trim());
                  setState(() => _tasks.add(t));
                } else {
                  setState(() {
                    existing.title = title;
                    existing.description = descCtrl.text.trim();
                  });
                }
                _save();
                Navigator.of(c).pop();
              },
              child: Text(isNew ? 'Add' : 'Save'))
        ],
      ),
    );
  }

  void _toggleDone(Task t) {
    setState(() {
      t.done = !t.done;
    });
    _save();
  }

  void _delete(Task t) async {
    setState(() {
      _tasks.removeWhere((e) => e.id == t.id);
    });
    await _save();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Tasks')),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _addOrEdit(),
        tooltip: 'Add Task',
        child: Icon(Icons.add),
      ),
      body: _loading
          ? Center(child: CircularProgressIndicator())
          : _tasks.isEmpty
              ? Center(child: Text('No tasks yet. Add one with +'))
              : ListView.builder(
                  itemCount: _tasks.length,
                  itemBuilder: (c, i) {
                    final t = _tasks[i];
                    return Dismissible(
                      key: ValueKey(t.id),
                      direction: DismissDirection.endToStart,
                      background: Container(
                        color: Theme.of(context).colorScheme.error,
                        alignment: Alignment.centerRight,
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: Icon(Icons.delete, color: Colors.white),
                      ),
                      onDismissed: (_) => _delete(t),
                      child: TaskCard(
                        task: t,
                        onToggle: () => _toggleDone(t),
                        onEdit: () => _addOrEdit(existing: t),
                        onDelete: () => _delete(t),
                      ),
                    );
                  },
                ),
    );
  }
}