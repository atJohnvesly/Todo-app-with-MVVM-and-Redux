import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:todoapp/routes/app_routes.dart';
import 'package:todoapp/store/redux/reducer.dart';
import 'package:todoapp/store/state/todo_state.dart';

void main() {
  final Store<TodoState> store = Store<TodoState>(
    todoReducer,
    initialState: TodoState.initial(),
  );
  runApp(MyApp(
    store: store,
  ));
}

class MyApp extends StatelessWidget {
  final Store<TodoState> store;
  const MyApp({Key? key, required this.store}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreProvider<TodoState>(
      store: store,
      child: MaterialApp(
        initialRoute: AppRoutes.home,
        onGenerateRoute: AppRoutes.generateRoute,
      ),
    );
  }
}
