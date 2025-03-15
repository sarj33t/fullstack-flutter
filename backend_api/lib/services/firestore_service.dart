/// [FirestoreService]
abstract class FirestoreService {
  Future<List<Map<String, dynamic>>> fetchDocuments();

  String collectionName();
}

