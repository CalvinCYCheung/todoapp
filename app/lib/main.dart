import 'dart:developer';

import 'package:app/global.dart';
import 'package:app/model/to_do_model.dart';
import 'package:app/widget/to_do_listtile.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'To Do Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'To Do demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<ToDoModel> toDoList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          ListView.builder(
              itemCount: toDoList.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return ToDoListTile(
                  toDoModel: toDoList[index],
                );
              })
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final data = await inputDialog(context);
          if (data != null) {
            setState(() {
              toDoList.add(data);
            });
          }
        },
        tooltip: 'add to Do item',
        child: const Icon(Icons.add),
      ),
    );
  }

  Future<ToDoModel?> inputDialog(BuildContext context) {
    String title = '';
    String content = '';
    return showDialog<ToDoModel>(
        context: context,
        builder: (_) {
          return AlertDialog(
            title: const Text("Input Dialog"),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  onChanged: (value) => title = value,
                  decoration: const InputDecoration(hintText: 'Title'),
                ),
                TextFormField(
                  onChanged: (value) => content = value,
                  decoration: const InputDecoration(hintText: 'Content'),
                ),
                Row(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('Cancel'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context, ToDoModel(title, content));
                      },
                      child: const Text('OK'),
                    )
                  ],
                )
              ],
            ),
          );
        });
  }
}
