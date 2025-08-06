
import 'package:flutter/material.dart';
void main() {
  runApp(RoutineApp());
}
class RoutineApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
   return MaterialApp(
   title:'Routine App'
   theme: ThemeData(
     primarySwatch: Colors.red,
   ),
   home: RoutineHomePage(),
  );
}
class RoutineHomePage extends StatefulWidget {
  @override
  _RoutineHomePageState createState() => _RoutineHomePageState();
}
class _RoutineHomePageState extends State<RoutineHomePage> {
  final List<Map<string, dynamic>> _routines = [];
  final TextEditingController _controller = TextEditingController();
  void _addRoutine(String task) {
    if (task.isEmpty) return;
setState(() {
   _routine.add({'task': task, 'done': false});
  });
 }

void _showAddTaskDialog() {
  showDialog(
   context: context,
   builder: (ctx) => AlertDialog(
     title: Text("Add Routine"),
    content: TextField(
      controller: _controller,
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
        onPressed:() {
          _addRoutine(_controller.text);
          Navigator.of(ctx).pop();
        },
        child: Text("Add"),
      ),
    
],
 );
}
 @override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: Text('My Routine'),
     actions: [
       IconButton(
         icon: Icon(Icons.add),
         onPressed: _showAddTaskDialog,
     ), 

   ],
  ),
   body: ListView.builder(
     itemCount: _routines.length,
     itemBuilder: (ctx, index) {
        final task = _routines[index
   
];
        return ListTile(
          title: Text(
            task['task'

],
           style: TextStyle(
              decoration: task['done'
 
]
                  ? TextDecoration.lineThrough
                  : null,
           ),
         ),  
         trailing: Checkbox(
           value: task['done'],
           onChanged: (_) => _toggleDone(index),
         ),
       );
     },
    ),
  ); 
 } 
}   