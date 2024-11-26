import 'package:av_sample/features/home/data/repositories/repository.dart';
import 'package:av_sample/features/home/domain/datasources/data_source_impl.dart';
import 'package:av_sample/features/home/domain/use_cases/get_loans_use_case.dart';
import 'package:av_sample/features/home/domain/use_cases/update_loan_status_use_case.dart';
import 'package:av_sample/features/home/presentation/bloc/home_bloc.dart';
import 'package:av_sample/features/home/presentation/item/bloc/loan_bloc.dart';
import 'package:get_it/get_it.dart';

import '../data/datasources/data_source.dart';
import '../domain/repositories/repository_impl.dart';

final sl = GetIt.instance;

Future<void> initModule() async {
  ///DataSource
  sl.registerFactory<Datasource>(() => DataSourceImpl());

  ///Repository
  sl.registerFactory<Repository>(
    () => RepositoryImpl(datasource: sl()),
  );

  ///UseCases
  sl.registerLazySingleton(() => GetLoansUseCase(repository: sl()));
  sl.registerLazySingleton(() => UpdateLoanStatusUseCase());

  ///State management
  sl.registerLazySingleton(() => HomeBloc(getLoansUseCase: sl()));
  sl.registerLazySingleton(() => LoanBloc(updateLoanStatusUseCase: sl()));
}
