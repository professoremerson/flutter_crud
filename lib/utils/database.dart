import 'package:cloud_firestore/cloud_firestore.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final CollectionReference _productsCollection =
    _firestore.collection('products');

class Database {
  /**
     * Iniciando os métodos para o nosso CRUD
     */

  static Future<void> addProduct({
    required String name,
    required String price,
  }) async {
    DocumentReference documentReferencer = _productsCollection.doc();

    Map<String, dynamic> data = <String, dynamic>{
      "name": name,
      "price": price,
    };

    await documentReferencer
        .set(data)
        .whenComplete(() => print("Produto adicionado ao banco"))
        .catchError((e) => print(e));
  }

  static Stream<QuerySnapshot> readProducts() {
    CollectionReference productsCollection = _firestore.collection('products');

    return productsCollection.snapshots();
  }
}
