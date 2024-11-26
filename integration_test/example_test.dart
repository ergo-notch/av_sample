import 'package:av_sample/core/di/injection_modules.dart';
import 'package:av_sample/main.dart';
import 'package:patrol/patrol.dart';

void main() async {
  patrolTest('Test status payment on loan list', ($) async {
    await init();
    await $.pumpAndSettle();
    await $.pumpWidgetAndSettle(const MyApp());
    await Future<void>.delayed(const Duration(seconds: 4));
    //await $(SliverList).$(ListTile).$(#Loan_1).tap();
    await $(#loan_1).tap();
    await Future<void>.delayed(const Duration(seconds: 4));
    await $(#loan_1).tap();
    await Future<void>.delayed(const Duration(seconds: 4));
  });
}
