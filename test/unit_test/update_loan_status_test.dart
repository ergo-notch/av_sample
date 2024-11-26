import 'package:av_sample/features/home/domain/entities/loan_entity.dart';
import 'package:av_sample/features/home/domain/use_cases/update_loan_status_use_case.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('UpdateLoanStatusUseCaseTest', () {
    UpdateLoanStatusUseCase updateLoanStatusUseCase = UpdateLoanStatusUseCase();

    test('should update loan status to paid', () async {
      // Arrange
      const loanId = '123';
      const paid = true;

      // Act
      final result = await updateLoanStatusUseCase.call(
          UpdateLoanStatusUseCaseParams(
              loanEntity: LoanEntity(id: loanId), paid: paid));

      // Assert
      result.fold((failure) => fail('test failed'), (right) {
        expect(right, isInstanceOf<LoanEntity>());
      });
    });

    test('should update loan status to no paid', () async {
      // Arrange
      const loanId = '123';
      const paid = false;

      // Act
      final result = await updateLoanStatusUseCase.call(
          UpdateLoanStatusUseCaseParams(
              loanEntity: LoanEntity(id: loanId), paid: paid));

      // Assert
      result.fold((failure) => fail('test failed'), (right) {
        expect(right, isInstanceOf<LoanEntity>());
      });
    });
  });
}
