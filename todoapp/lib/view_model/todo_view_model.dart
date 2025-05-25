import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todoapp/api/api_client.dart';
import 'package:todoapp/model/todo_model.dart';
import 'package:todoapp/store/redux/actions.dart';
import 'package:todoapp/store/state/todo_state.dart';

class TodoViewModel {
  final ApiClient _apiClient = ApiClient();

  List<Todo> todos = [];

  Future<void> fetchTodos(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    final cachedTodos = prefs.getString('todos');

    // Load from SharedPref
    if (cachedTodos != null) {
      final List<dynamic> decoded = jsonDecode(cachedTodos);
      final todos = decoded.map((e) => Todo.fromJson(e)).toList();
      StoreProvider.of<TodoState>(context).dispatch(SetTodosAction(todos));
      return;
    }

    // if not from Sharedpref, Call from API
    try {
      final response = await _apiClient.getAllTodos();
      final todosResponse = TodosResponse.fromJson(response.data);
      todos = todosResponse.todos;

      prefs.setString(
          'todos', jsonEncode(todos.map((e) => e.toJson()).toList()));

      StoreProvider.of<TodoState>(context).dispatch(SetTodosAction(todos));
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('Error: Invalid List'),
          backgroundColor: Colors.pinkAccent[400],
        ),
      );
      _apiClient.handleError(e);
    }
  }

  // void addTodo(int index, String title) {
  //   todos.insert(
  //     index,
  //     Todo(
  //       id: todos.length + 1,
  //       todo: title,
  //       completed: false,
  //       userId: todos.length * 2,
  //     ),
  //   );
  // }

  void addTodo(BuildContext context, int index, String title) {
    final newTodo = Todo(
      id: DateTime.now().millisecondsSinceEpoch,
      todo: title,
      completed: false,
      userId: index * 2,
    );
    StoreProvider.of<TodoState>(context)
        .dispatch(AddTodoAction(index, newTodo));
    _cacheTodos(context);
  }

  // void editTodo(int index, String newTitle) {
  //   if (index >= 0 && index < todos.length) {
  //     todos[index] = Todo(
  //       id: todos[index].id,
  //       todo: newTitle,
  //       completed: todos[index].completed,
  //       userId: todos[index].userId,
  //     );
  //   }
  // }

  void editTodo(BuildContext context, int index, String newTitle) {
    StoreProvider.of<TodoState>(context)
        .dispatch(EditTodoAction(index, newTitle));
    _cacheTodos(context);
  }

  // void deleteTodo(int index) {
  //   if (index >= 0 && index < todos.length) {
  //     todos.removeAt(index);
  //   }
  // }

  void deleteTodo(BuildContext context, int index) {
    StoreProvider.of<TodoState>(context).dispatch(DeleteTodoAction(index));
    _cacheTodos(context);
  }

  Future<void> _cacheTodos(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    final todos = StoreProvider.of<TodoState>(context).state.todos;
    prefs.setString('todos', jsonEncode(todos.map((e) => e.toJson()).toList()));
  }
}
