import 'package:av_sample/core/failure.dart';
import 'package:av_sample/features/home/data/datasources/data_source.dart';
import 'package:av_sample/features/home/data/repositories/repository.dart';
import 'package:av_sample/features/home/domain/entities/loan_entity.dart';
import 'package:dartz/dartz.dart';

class RepositoryImpl extends Repository {
  final Datasource datasource;

  RepositoryImpl({required this.datasource});

  @override
  Future<Either<Failure, List<LoanEntity>>> getLoans() async {
    try {
      final result = await datasource.getLoans();
      return Right(result.map((x) => LoanEntity.fromModel(x)).toList());
    } catch (e) {
      return Left(Failure(message: (e as Exception).toString()));
    }
  }
}
