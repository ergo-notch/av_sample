import 'package:av_sample/core/utils/extensions.dart';
import 'package:av_sample/features/home/domain/entities/loan_entity.dart';
import 'package:av_sample/features/home/presentation/item/bloc/loan_bloc.dart';
import 'package:av_sample/features/home/presentation/item/bloc/loan_events.dart';
import 'package:av_sample/features/home/presentation/item/bloc/loan_state.dart';
import 'package:av_sample/features/home/presentation/item/loan_tile_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mockito/mockito.dart';
import 'package:bloc_test/bloc_test.dart';

class MockLoanBloc extends MockBloc<LoanEvent, LoanState> implements LoanBloc {}

void main() {
  group('LoanTileWidgetTest', () {
    MockLoanBloc mockLoanBloc = MockLoanBloc();

    testWidgets('renders LoanTileWidget with BlocBuilder',
        (WidgetTester tester) async {
      when(mockLoanBloc.state).thenReturn(LoanState(
          loanEntity: LoanEntity(
        id: '123',
        loanType: LoanType.auto,
        amount: 1000,
        weeklyAmount: 100,
        paymentDate: DateTime.now(),
        isPaid: false,
      )));

      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider<LoanBloc>(
            create: (context) => mockLoanBloc,
            child: BlocBuilder<LoanBloc, LoanState>(
              builder: (context, state) {
                return const LoanItem();
              },
            ),
          ),
        ),
      );

      expect(find.byType(LoanItem), findsOneWidget);
      expect(find.text('Monto: \$1,000.00'), findsOneWidget);
      expect(find.text('Monto semanal: \$100.00'), findsOneWidget);
      expect(find.text('Fecha de pago: ${DateTime.now().formatDate()}'),
          findsOneWidget);
      expect(find.byType(Checkbox), findsOneWidget);
    });
  });
}
