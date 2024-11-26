import 'package:av_sample/features/home/domain/entities/loan_entity.dart';
import 'package:av_sample/features/home/presentation/bloc/home_bloc.dart';
import 'package:av_sample/features/home/presentation/bloc/home_state.dart';
import 'package:av_sample/features/home/presentation/item/bloc/loan_bloc.dart';
import 'package:av_sample/features/home/presentation/item/loan_tile_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/di/injection_modules.dart';
import 'bloc/home_events.dart';
import 'item/bloc/loan_events.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    final bloc = context.read<HomeBloc>();
    bloc.add(FetchLoansEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (_, state) => Scaffold(
        appBar: AppBar(
          title: const Text('Lista de Préstamos'),
        ),
        body: state.status == HomeStatus.fetching
            ? const Center(child: CircularProgressIndicator())
            : CustomScrollView(slivers: [
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    childCount: state.loans.length,
                    (_, index) {
                      final LoanEntity item = state.loans[index];
                      return BlocProvider<LoanBloc>(
                          create: (_) => LoanBloc(updateLoanStatusUseCase: sl())
                            ..add(SetLoanEvent(loanEntity: item)),
                          child: const LoanItem());
                    },
                  ),
                )
              ]),
      ),
    );
  }
}
