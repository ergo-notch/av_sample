import 'package:av_sample/features/home/di/injection_modules.dart' as home;
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> init() async {
  home.initModule();
}
