import 'package:flutter/material.dart';
import 'package:flutter_crud/utils/database.dart';

class AddProductForm extends StatefulWidget {
  final FocusNode nameFocusNode;
  final FocusNode priceFocusNode;

  const AddProductForm({
    required this.nameFocusNode,
    required this.priceFocusNode,
  });

  @override
  State createState() => _AddProductFormState();
}

class _AddProductFormState extends State<AddProductForm> {
  final _addProductFormKey = GlobalKey<FormState>();

  bool _isProcessing = false;

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _addProductFormKey,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 8.0,
              right: 8.0,
              bottom: 20.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 24.0,
                ),
                Text(
                  'Nome:',
                  style: TextStyle(
                    color: Color(0xFFECEFF1),
                    fontSize: 22.0,
                    letterSpacing: 1,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextFormField(
                  controller: _nameController,
                  focusNode: widget.nameFocusNode,
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                ),
                SizedBox(height: 24.0),
                Text(
                  'Preço:',
                  style: TextStyle(
                    color: Color(0xFFECEFF1),
                    fontSize: 22.0,
                    letterSpacing: 1,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 24.0),
                TextFormField(
                  controller: _priceController,
                  focusNode: widget.priceFocusNode,
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                ),
              ],
            ),
          ),
          _isProcessing
              ? Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(
                      Colors.orange,
                    ),
                  ),
                )
              : Container(
                  width: double.maxFinite,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                        Colors.orange,
                      ),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    onPressed: () async {
                      widget.nameFocusNode.unfocus();
                      widget.priceFocusNode.unfocus();

                      if (_addProductFormKey.currentState!.validate()) {
                        setState(() {
                          _isProcessing = true;
                        });

                        await Database.addProduct(
                          name: _nameController.text,
                          price: _priceController.text,
                        );

                        setState(() {
                          _isProcessing = false;
                        });

                        Navigator.of(context).pop();
                      }
                    },
                    child: Padding(
                      padding: EdgeInsets.only(top: 16.0, bottom: 16.0),
                      child: Text(
                        'Adicionar',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFECEFF1),
                          letterSpacing: 2,
                        ),
                      ),
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}
