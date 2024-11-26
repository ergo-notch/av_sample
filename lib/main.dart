import 'package:av_sample/core/di/injection_modules.dart' as di;
import 'package:av_sample/features/home/presentation/home_page.dart';
import 'package:flutter/material.dart';

import 'features/home/presentation/bloc/home_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aviva sample',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      home: BlocProvider<HomeBloc>(
          create: (_) => di.sl<HomeBloc>(), child: const HomePage()),
    );
  }
}
