import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:todoapp/model/todo_model.dart';
import 'package:todoapp/store/state/todo_state.dart';
import 'package:todoapp/utility/app_size.dart';
import 'package:todoapp/utility/base_color_theme.dart';
import 'package:todoapp/utility/button.dart';
import 'package:todoapp/utility/custom_textfield.dart';
import 'package:todoapp/view/home/widgets/add_todo_modal_sheet.dart';
import 'package:todoapp/utility/custom_appbar.dart';
import 'package:todoapp/view/home/widgets/todo_board.dart';
import 'package:todoapp/view/home/widgets/todo_scroller.dart';
import 'package:todoapp/view_model/todo_view_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TodoViewModel _todoViewModel = TodoViewModel();
  TextEditingController todoTitle = TextEditingController();

  Future<void> _loadTodos() async {
    await _todoViewModel.fetchTodos(context);
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _loadTodos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: BaseColorTheme.white500,
      appBar: CustomAppBar(
        title: 'Todo App',
        isDetail: false,
      ),
      body: SafeArea(
        child: Container(
            padding: EdgeInsets.only(left: 16, right: 16),
            child: StoreConnector<TodoState, List<Todo>>(
                converter: (store) => store.state.todos,
                builder: (context, todos) {
                  return Column(
                    children: [
                      TodoBoard(
                        firstTodoTitle:
                            todos.isNotEmpty && todos[0].todo.isNotEmpty
                                ? todos[0].todo
                                : '',
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      TodoScroller(todos: todos),
                      SizedBox(
                        height: ScreenUtils.getResponsiveHeight(
                            context: context, portionHeightValue: 100),
                        child: ButtonFilled(
                            title: 'Add New Todo',
                            function: () {
                              showModalBottomSheet(
                                context: context,
                                builder: (BuildContext context) {
                                  return AddTodoModalSheet();
                                },
                              );
                              todoTitle.clear();
                              // }
                            }),
                      ),
                    ],
                  );
                })),
      ),
    );
  }
}
