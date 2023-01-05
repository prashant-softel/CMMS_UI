// import 'package:cmms/app/auth/widgets/phone_login.dart';
import 'package:cmms/app/navigators/app_pages.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';

import '../../../variables.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  Variables.layerBinding.builder();
  Variables.authBinding.builder();
  Get.testMode = true;
  Get.addPages(AppPages.pages);

  testWidgets('Phone login screen test case', (WidgetTester tester) async {
    // await tester
    //     .pumpWidget(Variables.getTheMaterialAppWrapper(PhoneLoginScreen()));
    // var scaffoldFinder = find.byKey(ProductByCategory.scaffoldKey);
    // var appBarFinder = find.byKey(ProductByCategory.appBarKey);
    // expect(scaffoldFinder, findsOneWidget);
    // expect(appBarFinder, findsOneWidget);
  });
}
