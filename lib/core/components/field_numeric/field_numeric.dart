import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:intl/intl.dart';
import 'package:superapp/core/base/format_numeric/index.dart';

class FieldNumeric extends StatefulWidget {
  final String name;
  final String label;
  final String hintText;
  final bool autocorrect;
  final bool readOnly;
  final bool enabled;
  final TextCapitalization textCapitalization;
  final TextInputType keyboardType;
  final String? locale;
  final String? prefix;
  final String? suffix;
  final String? Function(String?)? validator;
  final Function(String name, String? value, dynamic data)? onChanged;

  const FieldNumeric({
    super.key,
    required this.name,
    required this.label,
    required this.hintText,
    this.autocorrect = false,
    this.readOnly = false,
    this.enabled = true,
    this.textCapitalization = TextCapitalization.none,
    this.keyboardType = TextInputType.text,
    this.onChanged,
    this.locale,
    this.prefix,
    this.suffix,
    this.validator,
  });

  @override
  State<FieldNumeric> createState() => _FieldNumericState();
}

class _FieldNumericState extends State<FieldNumeric> {
  @override
  Widget build(BuildContext context) {
    return FormBuilderTextField(
      name: widget.name,
      enabled: widget.enabled,
      readOnly: widget.readOnly,
      autocorrect: widget.autocorrect,
      textCapitalization: widget.textCapitalization,
      keyboardType: widget.keyboardType,
      maxLines: 1,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      inputFormatters: [
        FormatNumeric(
          allowFraction: true,
          formatter: NumberFormat.decimalPattern(widget.locale ?? 'id'),
        )
      ],
      decoration: InputDecoration(
        label: Text(widget.label),
        errorMaxLines: 2,
        hintText: widget.hintText,
        prefix: Text(widget.prefix ?? ''),
        suffix: Text(widget.suffix ?? ''),
      ),
      validator: widget.validator,
      onChanged: (String? value) {
        widget.onChanged?.call(widget.name, value, value);
      },
    );
  }
}
