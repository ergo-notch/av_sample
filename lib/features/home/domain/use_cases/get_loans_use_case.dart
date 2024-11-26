import 'package:av_sample/core/failure.dart';
import 'package:av_sample/core/use_case.dart';
import 'package:av_sample/features/home/data/repositories/repository.dart';
import 'package:av_sample/features/home/domain/entities/loan_entity.dart';
import 'package:dartz/dartz.dart';

class GetLoansUseCase extends UseCase<List<LoanEntity>, NoParams> {
  final Repository repository;

  GetLoansUseCase({required this.repository});

  @override
  Future<Either<Failure, List<LoanEntity>>> call(NoParams params) async {
    return await repository.getLoans();
  }
}
