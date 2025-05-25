import 'package:todoapp/model/todo_model.dart';

class SetTodosAction {
  final List<Todo> todos;
  SetTodosAction(this.todos);
}

class AddTodoAction {
  final int index;
  final Todo todo;

  AddTodoAction(this.index, this.todo);
}

class EditTodoAction {
  final int index;
  final String newTitle;
  EditTodoAction(this.index, this.newTitle);
}

class DeleteTodoAction {
  final int index;
  DeleteTodoAction(this.index);
}
