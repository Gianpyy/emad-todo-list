import 'package:emad_todo_list/activity.dart';
import 'package:emad_todo_list/modals.dart';
import 'package:material_ui/material_ui.dart';
import 'activity_card.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'To-Do List',
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: Colors.yellow),
      ),
      home: const MyHomePage(title: 'To-Do List'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Activity> _activities = [
    Activity(title: 'Seguire lezione EMAD', important: true),
    Activity(title: 'Revisionare Class Diagram del team', done: true, important: true),
    Activity(title: 'Task #3 EMAD'),
  ];

  int get _completedCount => _activities.where((a) => a.done).length;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          // Header with completed count
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Completate: $_completedCount su ${_activities.length}',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),

          // List with all the tasks
          Expanded(
            child: _activities.isEmpty
            // S2 Variante: nessuna attività
                ? const Center(
              child: Padding(
                padding: EdgeInsets.all(24.0),
                child: Text(
                  'Nessuna attività presente.\nPremi il pulsante + in basso per aggiungerne una.',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
              ),
            )
                : ListView.builder(
              itemCount: _activities.length,
              itemBuilder: (context, index) {
                final activity = _activities[index];
                return ActivityCard(
                  activity: activity,
                  onTap: () => _handleToggleActivity(activity),
                  onLongPress: () => _handleDeleteActivity(activity),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _handleAddActivity,
        tooltip: 'Aggiungi attività',
        child: const Icon(Icons.add),
      ),
    );
  }

  void _handleToggleActivity(Activity activity) {
    setState(() {
      activity.done = !activity.done;
    });
  }

  Future<void> _handleAddActivity() async {
    final newActivity = await showCreateActivityModal(context);
    if (newActivity != null) {
      setState(() {
        _activities.add(newActivity);
      });

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Attività "${newActivity.title}" aggiunta'),
            duration: const Duration(seconds: 2),
          ),
        );
      }
    }
  }

  Future<void> _handleDeleteActivity(Activity activity) async {
    final confirmed = await showDeleteActivityModal(context, activity);
    if (confirmed == true) {
      setState(() {
        _activities.remove(activity);
      });
    }
  }
}
