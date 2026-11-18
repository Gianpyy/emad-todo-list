import 'package:emad_todo_list/activity.dart';
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
      title: 'Todo list',
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: Colors.yellow),
      ),
      home: const MyHomePage(title: 'Todo list'),
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
            child: ListView.builder(
              itemCount: _activities.length,
              itemBuilder: (context, index) {
                final activity = _activities[index];

                return ActivityCard(
                  activity: activity,
                  onTap: () {
                    // Updates state
                    setState(() {
                      activity.done = !activity.done;
                    });
                  },
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // TODO: Add modal window for adding an activity
        },
        tooltip: 'Aggiungi attività',
        child: const Icon(Icons.add),
      ),
    );
  }
}
