import '../../domain/models/document_manager_model.dart';
import '../../domain/usecases/document_manager_usecase.dart';

class DocumentManagerPresenter {
  DocumentManagerPresenter(this.documentManagerUsecase);
  DocumentManagerUsecase documentManagerUsecase;
  Future<List<DocumentManagerModel?>?> getDocumentManager({
    int? facilityId,
    bool? isLoading,
  }) async =>
      await documentManagerUsecase.getDocumentManager(
        facilityId: facilityId ?? 0,
        isLoading: isLoading ?? false,
      );
}
