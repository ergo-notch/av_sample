import 'package:av_sample/features/home/domain/use_cases/get_loans_use_case.dart';
import 'package:av_sample/features/home/presentation/bloc/home_events.dart';
import 'package:av_sample/features/home/presentation/bloc/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/use_case.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetLoansUseCase getLoansUseCase;

  HomeBloc({required this.getLoansUseCase}) : super(HomeState()) {
    on<FetchLoansEvent>(_onFetchLoans);
    on<LoadedLoansEvent>(_onLoadedLoans);
    on<ErrorEvent>(_onError);
  }

  Future<void> _onFetchLoans(FetchLoansEvent event, emit) async {
    emit(state.copyWith(status: HomeStatus.fetching));
    final result = await getLoansUseCase(NoParams());
    result.fold(
      (failure) => add(ErrorEvent(error: failure.message)),
      (success) => add(LoadedLoansEvent(loans: success)),
    );
  }

  void _onLoadedLoans(LoadedLoansEvent event, emit) {
    emit(state.copyWith(status: HomeStatus.success, loans: event.loans));
  }

  void _onError(ErrorEvent event, emit) {
    emit(state.copyWith(status: HomeStatus.error, errorMessage: event.error));
  }
}
