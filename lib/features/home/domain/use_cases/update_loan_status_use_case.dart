import 'package:av_sample/core/failure.dart';
import 'package:av_sample/core/use_case.dart';
import 'package:av_sample/features/home/domain/entities/loan_entity.dart';
import 'package:dartz/dartz.dart';

class UpdateLoanStatusUseCase
    extends UseCase<LoanEntity, UpdateLoanStatusUseCaseParams> {
  @override
  Future<Either<Failure, LoanEntity>> call(
      UpdateLoanStatusUseCaseParams params) async {
    final result = params.loanEntity.copyWith(isPaid: params.paid);
    return Right(result);
  }
}

class UpdateLoanStatusUseCaseParams {
  final LoanEntity loanEntity;
  final bool? paid;

  UpdateLoanStatusUseCaseParams({required this.loanEntity, this.paid});
}
