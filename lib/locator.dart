import 'package:get_it/get_it.dart';
import 'package:getx_test_1/sql/sqldb.dart';
import 'package:getx_test_1/task/add_screen/add_task_controller.dart';
import 'package:getx_test_1/task/edit_screen/edit_task_controller.dart';

import 'data_source/in_memory_task_data_source.dart';
import 'data_source/task_data_source.dart';
import 'home/home_controller.dart';

final GetIt locator = GetIt.instance;

initLocator() {
  locator.registerSingleton<TaskDataSource>(InMemoryTaskDataSource());
  locator.registerFactory<HomeController>(
      () => HomeController(locator<TaskDataSource>()));
  locator.registerFactory<AddTaskController>(
      () => AddTaskController(locator<TaskDataSource>()));
  locator.registerFactory<EditTaskController>(
      () => EditTaskController(locator<TaskDataSource>()));
  locator.registerLazySingleton<SqlDatabase>(() => SqlDatabase());
}
