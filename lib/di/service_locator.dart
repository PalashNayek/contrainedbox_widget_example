import 'package:get_it/get_it.dart';
import '../view_modes/constrainedbox_viewmodel.dart';

final getIt = GetIt.instance;

void setupLocator() {
  getIt.registerLazySingleton<ConstrainedBoxViewModel>(() => ConstrainedBoxViewModel());
}
