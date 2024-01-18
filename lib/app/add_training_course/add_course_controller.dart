import 'package:cmms/app/add_training_course/add_course_presenter.dart';
import 'package:cmms/app/home/home_controller.dart';
import 'package:get/get.dart';

class AddCourseController extends GetxController {
  AddCourseController(
    this.addCoursePresenter
  );

  final HomeController homeController = Get.find();
  late AddCoursePresenter addCoursePresenter;
}
