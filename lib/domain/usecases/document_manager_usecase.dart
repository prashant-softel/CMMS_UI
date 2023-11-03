import 'package:cmms/domain/domain.dart';

import '../models/document_manager_model.dart';

class DocumentManagerUsecase {
  final Repository repository;

  DocumentManagerUsecase(this.repository);
  Future<List<DocumentManagerModel?>?> getDocumentManager({
    int? facilityId,
    bool? isLoading,
  }) async =>
      await repository.getDocumentManager(
        facilityId,
        isLoading,
      );
}
