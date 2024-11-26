import 'package:av_sample/features/home/domain/datasources/data_source_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:av_sample/features/home/data/datasources/data_source.dart';
import 'package:av_sample/features/home/data/models/loan_model.dart';

import 'data_source_test.mocks.dart';

@GenerateMocks([Datasource])
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  group('Data sources test', () {
    DataSourceImpl dataSourceImpl = DataSourceImpl();
    MockDatasource mockDatasource = MockDatasource();

    final List<LoanModel> tLoanModelList = [
      LoanModel(
        id: "123",
        amount: 1000,
      ),
      LoanModel(
        id: "354",
        amount: 2000,
      ),
    ];

    test(
        'should return a list of LoanModel when the call to data source is successful',
        () async {
      // arrange
      when(mockDatasource.getLoans()).thenAnswer((_) async => tLoanModelList);

      // act
      final result = await dataSourceImpl.getLoans();

      // assert
      expect(result.length, greaterThan(tLoanModelList.length));
      expect(result, isInstanceOf<List<LoanModel>>());
      verifyNoMoreInteractions(mockDatasource);
    });
  });
}
