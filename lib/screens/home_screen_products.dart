import 'package:flutter/material.dart';
import 'package:flutter_crud/widgets/products_list.dart';

class HomeScreenProducts extends StatefulWidget {
  const HomeScreenProducts({Key? key}) : super(key: key);

  @override
  _HomeScreenProductsState createState() => _HomeScreenProductsState();
}

class _HomeScreenProductsState extends State<HomeScreenProducts> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF2C384A),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xFF2C384A),
        title: Text(
          'Listagem de Produtos',
          style: TextStyle(
            color: Colors.orange,
            fontSize: 20,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 20.0),
          child: ProductsList(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.orange,
        foregroundColor: Colors.black,
        onPressed: () {
          // Respond to button press
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
