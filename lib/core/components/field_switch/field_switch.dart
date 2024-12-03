import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class FieldSwitch extends StatefulWidget {
  final String name;
  final String label;
  final String hintText;
  // final List<TextInputFormatter> inputFormatters;
  // final bool autocorrect;
  // final TextCapitalization textCapitalization;
  // final TextInputType keyboardType;
  // final int maxLines;
  // final bool readOnly;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool enabled;
  final String? Function(bool?)? validator;

  final Function(String name, bool? value, dynamic data)? onChanged;

  const FieldSwitch({
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
  State<FieldSwitch> createState() => _FieldSwitchState();
}

class _FieldSwitchState extends State<FieldSwitch> {
  @override
  Widget build(BuildContext context) {
    return FormBuilderSwitch(
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
