import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:superapp/core/base/format_masking/format_masking.dart';

class FieldMask extends StatefulWidget {
  final String name;
  final String label;
  final String hintText;
  final bool autocorrect;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool readOnly;
  final bool enabled;
  final TextCapitalization textCapitalization;
  final TextInputType keyboardType;
  final String mask;
  final Map<String, RegExp> filter;
  final String? Function(String?)? validator;
  final Function(String name, String? value, dynamic data)? onChanged;

  const FieldMask({
    super.key,
    required this.name,
    required this.label,
    required this.hintText,
    required this.mask,
    required this.filter,
    this.autocorrect = false,
    this.readOnly = false,
    this.enabled = true,
    this.textCapitalization = TextCapitalization.none,
    this.keyboardType = TextInputType.text,
    this.prefixIcon,
    this.suffixIcon,
    this.onChanged,
    this.validator,
  });

  @override
  State<FieldMask> createState() => _FieldMaskState();
}

class _FieldMaskState extends State<FieldMask> {
  late FormatMasking mask = FormatMasking(
    mask: widget.mask,
    filter: widget.filter,
    type: MaskAutoCompletionType.lazy,
  );

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
      inputFormatters: [mask],
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
