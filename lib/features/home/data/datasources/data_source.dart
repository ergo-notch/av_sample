import 'package:av_sample/features/home/data/models/loan_model.dart';

abstract class Datasource {
  Future<List<LoanModel>> getLoans();
}
