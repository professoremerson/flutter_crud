import 'package:cloud_firestore/cloud_firestore.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final CollectionReference _productsCollection =
    _firestore.collection('products');

class Database {
  /**
     * Iniciando os métodos para o nosso CRUD
     */

  static Stream<QuerySnapshot> readProducts() {
    CollectionReference productsCollection = _firestore.collection('products');

    return productsCollection.snapshots();
  }
}
