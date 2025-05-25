import 'package:todoapp/model/todo_model.dart';

class TodoState {
  final List<Todo> todos;

  TodoState({required this.todos});

  TodoState.initial() : todos = [];

  TodoState copyWith({List<Todo>? todos}) {
    return TodoState(todos: todos ?? this.todos);
  }
}
