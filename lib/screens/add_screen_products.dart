import 'package:flutter/material.dart';
import 'package:flutter_crud/widgets/add_product_form.dart';

class AddScreen extends StatelessWidget {
  final FocusNode _nameFocusNode = FocusNode();
  final FocusNode _priceFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _nameFocusNode.unfocus();
        _priceFocusNode.unfocus();
      },
      child: Scaffold(
        backgroundColor: Color(0xFF2C384A),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Color(0xFF2C384A),
          title: Text(
            'Adicionar Produto',
            style: TextStyle(
              color: Colors.orange,
              fontSize: 20,
            ),
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(
              left: 16.0,
              right: 16.0,
              bottom: 20.0,
            ),
            child: AddProductForm(
              nameFocusNode = _nameFocusNode,
              priceFocusNode = _priceFocusNode,
            ),
          ),
        ),
      ),
    );
  }
}
