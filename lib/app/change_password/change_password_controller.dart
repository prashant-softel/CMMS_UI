import 'package:cmms/app/change_password/change_password_presenter.dart';
import 'package:get/get.dart';
import '../home/home_controller.dart';

class ChangePasswordController extends GetxController {
  ///
  ChangePasswordController(
    this.changePasswordPresenter,
  );
  ChangePasswordPresenter changePasswordPresenter;
  final HomeController homecontroller = Get.find();
  final currentPassword = ''.obs;
  final newPassword = ''.obs;
  final confirmPassword = ''.obs;

  @override
  void onInit() async {
    super.onInit();
  }

  void changePassword() {
    // Implement your password change logic here
    // For simplicity, let's assume the password is changed successfully.
    Get.snackbar('Success', 'Password changed successfully!');
  }
}
