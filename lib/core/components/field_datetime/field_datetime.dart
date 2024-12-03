import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:intl/intl.dart';

class FieldDatetime extends StatefulWidget {
  final String name;
  final String label;
  final String hintText;
  final bool autocorrect;
  final List<TextInputFormatter> inputFormatters;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool readOnly;
  final bool enabled;
  final InputType? inputType;
  final TextCapitalization textCapitalization;
  final TextInputType keyboardType;
  final int maxLines;
  final String? Function(DateTime?)? validator;
  final DateFormat? format;
  final DateTime? firstDate;
  final DateTime? lastDate;
  final Function(String name, DateTime? value, dynamic data)? onChanged;

  const FieldDatetime({
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
    this.inputType,
    this.format,
    this.firstDate,
    this.lastDate,
  });

  @override
  State<FieldDatetime> createState() => _FieldDatetimeState();
}

class _FieldDatetimeState extends State<FieldDatetime> {
  @override
  Widget build(BuildContext context) {
    return FormBuilderDateTimePicker(
      name: widget.name,
      enabled: widget.enabled,
      // readOnly: widget.readOnly,
      locale: const Locale('en', 'GB'),
      fieldHintText: 'DD/MM/YYYY',
      autocorrect: widget.autocorrect,
      textCapitalization: widget.textCapitalization,
      keyboardType: widget.keyboardType,
      inputFormatters: widget.inputFormatters,
      maxLines: widget.maxLines,
      inputType: widget.inputType ?? InputType.both,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      format: widget.format ?? DateFormat('dd/MM/yyyy hh:mm'),
      firstDate: widget.firstDate,
      lastDate: widget.lastDate,
      decoration: InputDecoration(
        label: Text(widget.label),
        errorMaxLines: 2,
        hintText: widget.hintText,
        prefixIcon: widget.prefixIcon,
        suffixIcon: widget.suffixIcon,
      ),
      validator: widget.validator,
      onChanged: (DateTime? value) {
        widget.onChanged?.call(widget.name, value, value);
      },
    );
  }
}
