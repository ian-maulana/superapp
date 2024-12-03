import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class FieldChoiceChip extends StatefulWidget {
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
  final List<ChipOption>? options;
  final String? Function(dynamic)? validator;
  final Function(String name, dynamic value, dynamic data)? onChanged;

  const FieldChoiceChip({
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
    this.options,
  });

  @override
  State<FieldChoiceChip> createState() => _FieldChoiceChipState();
}

class _FieldChoiceChipState extends State<FieldChoiceChip> {
  @override
  Widget build(BuildContext context) {
    return FormBuilderChoiceChip(
      name: widget.name,
      enabled: widget.enabled,
      // readOnly: widget.readOnly,
      // autocorrect: widget.autocorrect,
      // textCapitalization: widget.textCapitalization,
      // keyboardType: widget.keyboardType,
      // inputFormatters: widget.inputFormatters,
      // maxLines: widget.maxLines,

      options: (widget.options ?? []).map((opt) {
        return FormBuilderChipOption(value: opt.value, child: Text(opt.label));
      }).toList(),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      spacing: 5,
      decoration: InputDecoration(
        label: Text(widget.label),
        errorMaxLines: 2,
        prefixIcon: widget.prefixIcon,
        suffixIcon: widget.suffixIcon,
      ),
      validator: widget.validator,
      onChanged: (dynamic value) {
        ChipOption result = (widget.options ?? []).firstWhere((opt) {
          return opt.value.toLowerCase() == value.toString().toLowerCase();
        });

        widget.onChanged?.call(widget.name, value, result.data);
      },
    );
  }
}

class ChipOption {
  String value;
  String label;
  dynamic data;

  ChipOption({
    required this.value,
    required this.label,
    this.data,
  });
}
