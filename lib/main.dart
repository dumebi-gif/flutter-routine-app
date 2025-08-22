import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:routine_app/src/profile/profile_page.dart';

void main() {
  runApp(RoutineApp());
}

class RoutineApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Routine App',
      theme: ThemeData(primarySwatch: Colors.pink),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => RoutineHomePage(),
        '/profile': (context) => ProfilePage(),
      },
    );
  }
}

class RoutineHomePage extends StatefulWidget {
  @override
  _RoutineHomePageState createState() => _RoutineHomePageState();
}

class _RoutineHomePageState extends State<RoutineHomePage> {
  final List<Map<String, dynamic>> routines = [];
  final TextEditingController controller = TextEditingController();

  void addRoutine(String task) {
    if (task.isEmpty) return;
    setState(() {
      routines.add({'task': task, 'done': false});
    });
    controller.clear();
  }

  void toggleDone(int index) {
    setState(() {
      routines[index]['done'] = !routines[index]['done'];
    });
  }

  // within the 'HomeRoute' widget

  void showAddTaskDialog() {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text("Add Routine"),
        content: TextField(
          controller: controller,
          decoration: InputDecoration(labelText: "Enter task"),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(ctx).pop();
            },
            child: Text("Cancel"),
          ),
          ElevatedButton(
            onPressed: () {
              addRoutine(controller.text);
              Navigator.of(ctx).pop();
            },
            child: Text("Add"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('My Routine'),
          actions: [
            IconButton(
              icon: Icon(Icons.account_circle),
              onPressed: () {
                Navigator.pushNamed(context, '/profile');
              },
            ),
            IconButton(
              icon: Icon(Icons.add),
              onPressed: showAddTaskDialog,
            ),
          ],
        ),
        body: ListView.builder(
            itemCount: routines.length,
            itemBuilder: (ctx, index) {
              final task = routines[index];
              return ListTile(
                title: Text(
                  task['task'],
                  style: TextStyle(
                    decoration:
                        task['done'] ? TextDecoration.lineThrough : null,
                  ),
                ),
                trailing: Checkbox(
                  value: task['done'],
                  onChanged: (_) => toggleDone(index),
                ),
              );
            }));
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(
      StringProperty('title', 'Routine Home Page'),
    );
  }
}
