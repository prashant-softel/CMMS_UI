import 'package:cmms/domain/models/get_pm_plan_detail_model.dart';
import 'package:cmms/domain/usecases/view_audit_detail_usecase.dart';

class ViewAuditDetailPresenter {
  ViewAuditDetailPresenter(this.viewAuditDetailUsecase);
  ViewAuditDetailUsecase viewAuditDetailUsecase;
}
