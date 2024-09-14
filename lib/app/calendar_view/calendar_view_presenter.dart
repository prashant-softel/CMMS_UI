import 'package:cmms/domain/models/view_doc_upload.dart';
import 'package:cmms/domain/usecases/calendar_view_usecase.dart';

class CalendarViewPresenter {
  CalendarViewPresenter(this.calendarViewUsecase);
  CalendarViewUsecase calendarViewUsecase;
}
