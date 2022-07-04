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
  State<AddProductForm> createState() => _AddProductFormState();
}

class _AddProductFormState extends State<AddProductForm> {
  @override
  Widget build(BuildContext context) {}
}
