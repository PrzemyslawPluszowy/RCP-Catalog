import 'package:flutter/material.dart';

class InputWidget extends StatelessWidget {
  InputWidget({
    super.key,
    required TextEditingController nameController,
    required this.validator,
    required this.labelText,
    this.textType,
    required this.prefixIcon,
    this.minimalLine,
  }) : _nameController = nameController;
  final String? Function(String?) validator;
  final TextEditingController _nameController;
  final String labelText;
  final IconData prefixIcon;
  final TextInputType? textType;
  final int? minimalLine;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: textType,
      minLines: minimalLine,
      maxLines: null,
      textInputAction: TextInputAction.next,
      validator: validator,
      controller: _nameController,
      decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: labelText,
          hintText: labelText,
          prefixIcon: Icon(prefixIcon)),
    );
  }
}
