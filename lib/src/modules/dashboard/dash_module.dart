import 'package:flutter_modular/flutter_modular.dart';
import 'package:http/http.dart' as http;
import 'package:memobelc_front/src/modules/dashboard/presenter/pages/home_page.dart';
class DashboardModule extends Module {
  @override
  void binds(i) {
    i.add(http.Client.new);

    // i.add<IGetTasksDatasource>(GetTasksDatasource.new);
    // i.add<IAddTaskDatasource>(AddTaskDatasource.new);

    // i.add<IGetTaskRepository>(GetTaskRepository.new);
    // i.add<IAddTaskRepository>(AddTaskRepository.new);

    // i.add<IGetTasksUseCase>(GetTasksUseCase.new);
    // i.add<IAddTaskUseCase>(AddTaskUseCase.new);

    // i.addSingleton<TaskStore>(TaskStore.new);
  }

  @override
  void routes(RouteManager r) {
    r.child(Modular.initialRoute, child: (context) => TaskDashboard(user: r.args.data));
  }
}
