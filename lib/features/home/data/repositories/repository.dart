import 'package:av_sample/core/failure.dart';
import 'package:av_sample/features/home/domain/entities/loan_entity.dart';
import 'package:dartz/dartz.dart';

abstract class Repository {
  Future<Either<Failure, List<LoanEntity>>> getLoans();
}
