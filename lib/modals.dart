import 'package:emad_todo_list/activity.dart';
import 'package:material_ui/material_ui.dart';

/// Modal for creating a new activity
Future<Activity?> showCreateActivityModal(BuildContext context) {
  final titleController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool isImportant = false;

  return showDialog<Activity>(
    context: context,
    builder: (context) {
      return StatefulBuilder(
        builder: (context, setModalState) {
          return AlertDialog(
            title: const Text('Nuova attività'),
            content: Form(
              key: formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextFormField(
                    controller: titleController,
                    autofocus: true,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: const InputDecoration(
                      labelText: 'Titolo',
                      hintText: 'Es. Fare la spesa',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Inserisci un titolo per l\'attività';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 12),
                  SwitchListTile(
                    contentPadding: EdgeInsets.zero,
                    title: const Text('Importante'),
                    secondary: Icon(
                      Icons.star_rounded,
                      color: isImportant ? Colors.amber : Colors.grey,
                    ),
                    value: isImportant,
                    onChanged: (value) {
                      setModalState(() {
                        isImportant = value;
                      });
                    },
                  ),
                ],
              ),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(null),
                child: const Text('Annulla'),
              ),
              FilledButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    final newActivity = Activity(
                      title: titleController.text.trim(),
                      important: isImportant,
                    );
                    Navigator.of(context).pop(newActivity);
                  }
                },
                child: const Text('Aggiungi'),
              ),
            ],
          );
        },
      );
    },
  );
}

/// Confirmation modal to delete an activity
Future<bool?> showDeleteActivityModal(
    BuildContext context,
    Activity activity,
    ) {
  return showDialog<bool>(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text('Elimina attività'),
        content: Text(
          'Vuoi davvero eliminare "${activity.title}"?',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('Annulla'),
          ),
          FilledButton(
            style: FilledButton.styleFrom(
              backgroundColor: Theme.of(context).colorScheme.error,
              foregroundColor: Theme.of(context).colorScheme.onError,
            ),
            onPressed: () => Navigator.of(context).pop(true),
            child: const Text('Elimina'),
          ),
        ],
      );
    },
  );
}