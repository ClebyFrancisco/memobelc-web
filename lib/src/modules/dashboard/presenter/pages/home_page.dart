import 'package:flutter/material.dart';
// import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:memobelc_front/src/modules/auth/infra/comm_packages/proto/pb/auth.pb.dart';
import 'package:memobelc_front/src/modules/dashboard/presenter/pages/components/appbar_widget.dart';
// import 'package:memobelc_front/src/modules/dashboard/presenter/pages/components/card_task.dart';

class TaskDashboard extends StatefulWidget {
  final LoginResponse? user;
  const TaskDashboard({super.key, required this.user});

  @override
  TaskDashboardState createState() => TaskDashboardState();
}

class TaskDashboardState extends State<TaskDashboard> {
  final taskController = TextEditingController();

  // final taskStore = Modular.get<TaskStore>();

  // @override
  // void initState() {
  //   super.initState();
  //   taskStore.getTasks(widget.user!.id);
  // }

  // @override
  // void dispose() {
  //   taskController.dispose();
  //   super.dispose();
  // }

  void _openAddTaskModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (ctx) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: taskController,
                autofocus: true,
                decoration: const InputDecoration(
                  labelText: 'Nome da Tarefa',
                  prefixIcon: Icon(Icons.task),
                ),
              ),
              const SizedBox(height: 10),
              Observer(
                builder: (_) => ElevatedButton(
                  onPressed: () async {
                    if (taskController.text.isNotEmpty) {
                      print('add task');
                      // await taskStore.addTask(
                      //     taskController.text, widget.user!.id);
                      // await taskStore.getTasks(widget.user!.id);
                    }
                  },
                  child: const Text('Adicionar tarefa'),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(user: widget.user),
      // body: Observer(
      //   builder: (_) => taskStore.taskList.isEmpty
      //       ? const Center(child: Text('Nenhuma tarefa adicionada ainda'))
      //       : ListView.builder(
      //           itemCount: taskStore.taskList.length,
      //           itemBuilder: (ctx, index) {
      //             return ListTile(
      //               title: CardTask(title: taskStore.taskList[index].task),
      //             );
      //           },
      //         ),
      // ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _openAddTaskModal(context),
        child: const Icon(Icons.add),
      ),
    );
  }
}
