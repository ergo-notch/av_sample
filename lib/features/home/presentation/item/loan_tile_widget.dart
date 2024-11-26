import 'package:av_sample/core/utils/extensions.dart';
import 'package:av_sample/features/home/presentation/item/bloc/loan_bloc.dart';
import 'package:av_sample/features/home/presentation/item/bloc/loan_events.dart';
import 'package:av_sample/features/home/presentation/item/bloc/loan_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoanItem extends StatelessWidget {
  const LoanItem({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoanBloc, LoanState>(
      builder: (_, state) => Card(
          color: (state.loanEntity?.isPaid ?? false) ? Colors.green[100] : null,
          child: ListTile(
            key: Key('loan_${state.loanEntity?.id ?? ''}'),
            onTap: () => context.read<LoanBloc>().add(
                  SetLoanPaymentStatusEvent(
                      paid: !(state.loanEntity?.isPaid ?? false),
                      loanEntity: state.loanEntity),
                ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
              side: const BorderSide(color: Colors.grey),
            ),
            title: Text(state.loanEntity?.loanType?.name ?? ''),
            subtitle:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text('Monto: ${state.loanEntity?.amount?.formatAmount()}'),
              Text(
                  'Monto semanal: ${state.loanEntity?.weeklyAmount?.formatAmount()}'),
              Text(
                  'Fecha de pago: ${state.loanEntity?.paymentDate?.formatDate()}'),
            ]),
            trailing: Checkbox(
              value: state.loanEntity?.isPaid ?? false,
              onChanged: (bool? value) => context.read<LoanBloc>().add(
                  SetLoanPaymentStatusEvent(
                      paid: value, loanEntity: state.loanEntity)),
            ),
          )),
    );
  }
}
