import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class FieldText extends StatefulWidget {
  final String name;
  final String label;
  final String hintText;
  final bool autocorrect;
  final List<TextInputFormatter> inputFormatters;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool readOnly;
  final bool enabled;
  final TextCapitalization textCapitalization;
  final TextInputType keyboardType;
  final int maxLines;
  final String? Function(String?)? validator;
  final Function(String name, String? value, dynamic data)? onChanged;

  const FieldText({
    super.key,
    required this.name,
    required this.label,
    required this.hintText,
    this.autocorrect = false,
    this.readOnly = false,
    this.enabled = true,
    this.textCapitalization = TextCapitalization.none,
    this.keyboardType = TextInputType.text,
    this.inputFormatters = const [],
    this.maxLines = 1,
    this.prefixIcon,
    this.suffixIcon,
    this.onChanged,
    this.validator,
  });

  @override
  State<FieldText> createState() => _FieldTextState();
}

class _FieldTextState extends State<FieldText> {
  @override
  Widget build(BuildContext context) {
    return FormBuilderTextField(
      name: widget.name,
      enabled: widget.enabled,
      readOnly: widget.readOnly,
      autocorrect: widget.autocorrect,
      textCapitalization: widget.textCapitalization,
      keyboardType: widget.keyboardType,
      inputFormatters: widget.inputFormatters,
      maxLines: widget.maxLines,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        label: Text(widget.label),
        errorMaxLines: 2,
        hintText: widget.hintText,
        prefixIcon: widget.prefixIcon,
        suffixIcon: widget.suffixIcon,
      ),
      validator: widget.validator,
      onChanged: (String? value) {
        widget.onChanged?.call(widget.name, value, value);
      },
    );
  }
}
