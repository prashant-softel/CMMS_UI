// import 'package:cmms/app/plant_stock_report_details/plant_stock_report_controller_details.dart';
// import 'package:cmms/app/plant_stock_report_details/plant_stock_report_presenter_details.dart';
// import 'package:cmms/domain/usecases/plant_stock_report_usecase_details.dart';
// import 'package:get/get.dart';

// import '../../domain/usecases/home_usecase.dart';
// import '../home/home_controller.dart';
// import '../home/home_presenter.dart';

// class PlantStockReportDetailsBinding extends Bindings {
//   @override
//   void dependencies() {
//     Get.lazyPut<PlantStockReportDetailsController>(
//       () => PlantStockReportDetailsController(
//         PlantStockReportDetailsPresenter(
//           PlantStockReportDetailsUsecase(
//             Get.find(),
//           ),
//         ),
//       ),
//     );
//     Get.lazyPut(
//       () => HomeController(
//         Get.put(
//           HomePresenter(
//             HomeUsecase(
//               Get.find(),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
