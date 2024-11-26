import 'dart:convert';

import 'package:av_sample/features/home/data/datasources/data_source.dart';
import 'package:av_sample/features/home/data/models/loan_model.dart';
import 'package:flutter/services.dart' show rootBundle;

class DataSourceImpl extends Datasource {
  DataSourceImpl();

  @override
  Future<List<LoanModel>> getLoans() async {
    try {
      final String response =
          await rootBundle.loadString('assets/responses/mock_data.json');
      final data = await json.decode(response);
      final result =
          List<LoanModel>.from(data.map((x) => LoanModel.fromJson(x)));
      return result;
    } catch (e) {
      rethrow;
    }
  }
}
