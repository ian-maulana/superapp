import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class FieldCheckbox extends StatefulWidget {
  final String name;
  final String label;
  final String hintText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool enabled;
  // final bool autocorrect;
  // final bool readOnly;
  // final List<TextInputFormatter> inputFormatters;
  // final TextCapitalization textCapitalization;
  // final TextInputType keyboardType;
  // final int maxLines;
  final String? Function(bool?)? validator;
  final Function(String name, bool? value, dynamic data)? onChanged;

  const FieldCheckbox({
    super.key,
    required this.name,
    required this.label,
    required this.hintText,
    this.enabled = true,
    // this.autocorrect = false,
    // this.readOnly = false,
    // this.textCapitalization = TextCapitalization.none,
    // this.keyboardType = TextInputType.text,
    // this.inputFormatters = const [],
    // this.maxLines = 1,
    this.prefixIcon,
    this.suffixIcon,
    this.onChanged,
    this.validator,
  });

  @override
  State<FieldCheckbox> createState() => _FieldCheckboxState();
}

class _FieldCheckboxState extends State<FieldCheckbox> {
  @override
  Widget build(BuildContext context) {
    return FormBuilderCheckbox(
      name: widget.name,
      enabled: widget.enabled,
      // readOnly: widget.readOnly,
      // autocorrect: widget.autocorrect,
      // textCapitalization: widget.textCapitalization,
      // keyboardType: widget.keyboardType,
      // inputFormatters: widget.inputFormatters,
      // maxLines: widget.maxLines,
      title: Text(widget.hintText),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        label: Text(widget.label),
        errorMaxLines: 2,
        prefixIcon: widget.prefixIcon,
        suffixIcon: widget.suffixIcon,
      ),
      validator: widget.validator,
      onChanged: (bool? value) {
        widget.onChanged?.call(widget.name, value, value);
      },
    );
  }
}
