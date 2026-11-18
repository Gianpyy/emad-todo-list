import 'package:emad_todo_list/activity.dart';
import 'package:material_ui/material_ui.dart';

class ActivityCard extends StatelessWidget {
  final Activity activity;
  final VoidCallback? onTap;

  const ActivityCard({
    super.key,
    required this.activity,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      child: ListTile(
        onTap: onTap,
        leading: Icon(
          activity.done ? Icons.check_circle : Icons.radio_button_unchecked,
          color: activity.done ? Colors.green : Colors.grey,
        ),
        title: Text(
          activity.title,
          style: TextStyle(
            decoration: activity.done ? TextDecoration.lineThrough : null,
            color: activity.done ? Colors.grey : null,
          ),
        ),
        trailing: activity.important
            ? const Icon(Icons.star_rounded, color: Colors.amber)
            : null,
      ),
    );
  }
}