import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/model/todo_model.dart';
import 'package:todo_app/provider/todo_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _userController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          'TODO',
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 50),
        ),
        centerTitle: true,
      ),
      body: Consumer<TodoProvider>(
        builder: (context, todoProvider, value) => ListView.builder(
            itemCount: todoProvider.todos.length,
            itemBuilder: (context, index) {
              final todo = todoProvider.todos[index];
              return Column(
                children: [
                  Container(
                    height: 100,
                    padding: const EdgeInsets.fromLTRB(30, 40, 30, 0),
                    child: ListTile(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        tileColor: Colors.grey.shade300,
                        leading: Checkbox(
                          activeColor: Colors.black,
                            value: todo.isCompleted,
                            onChanged: (value) {
                              context.read<TodoProvider>().toggleTodoCompletion(index);
                            }),
                        title: Text(todo.title),
                        trailing: IconButton(
                            onPressed: () {
                               context.read<TodoProvider>().removeTodo(todo);
                            },
                            icon: const Icon(
                              Icons.delete,
                              color: Colors.black,
                            ))),
                  ),
                ],
              );
            }),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        child: const Icon(Icons.add, color: Colors.white),
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  elevation: 0.0,
                  title: const Center(child: Text('Add A TODO')),
                  content: TextField(
                    controller: _userController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15)),
                      prefixIcon: const Icon(Icons.list_alt_outlined),
                      hintText: 'Add a TODO',
                    ),
                  ),
                  actions: [
                    MaterialButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text('Cancel'),
                    ),
                    MaterialButton(
                      onPressed: () {
                        final newTodo = TodoModel(title: _userController.text);
                        context.read<TodoProvider>().addTodo(newTodo);
                        _userController.clear();
                        Navigator.of(context).pop();
                      },
                      child: const Text('Add'),
                    )
                  ],
                );
              });
        },
      ),
    );
  }
}
