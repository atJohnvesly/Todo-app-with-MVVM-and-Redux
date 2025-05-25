import 'package:todoapp/store/redux/actions.dart';
import 'package:todoapp/store/state/todo_state.dart';
import 'package:todoapp/model/todo_model.dart';

TodoState todoReducer(TodoState state, dynamic action) {
  if (action is SetTodosAction) {
    return state.copyWith(todos: action.todos);
  } else if (action is AddTodoAction) {
    final updatedTodos = List<Todo>.from(state.todos)
      ..insert(action.index, action.todo);
    return state.copyWith(todos: updatedTodos);
  } else if (action is EditTodoAction) {
    final updatedTodos = List<Todo>.from(state.todos);
    final todo = updatedTodos[action.index];
    updatedTodos[action.index] = Todo(
        id: todo.id,
        todo: action.newTitle,
        completed: todo.completed,
        userId: todo.userId);
    return state.copyWith(todos: updatedTodos);
  } else if (action is DeleteTodoAction) {
    final updatedTodos = List<Todo>.from(state.todos)..removeAt(action.index);
    return state.copyWith(todos: updatedTodos);
  } else {
    return state;
  }
}
