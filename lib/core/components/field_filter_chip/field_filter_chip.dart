import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class FieldFilterChip extends StatefulWidget {
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
  final List<FilterChipOption>? options;
  final String? Function(List<dynamic>?)? validator;
  final Function(String name, List<dynamic>? value, dynamic data)? onChanged;

  const FieldFilterChip({
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
  State<FieldFilterChip> createState() => _FieldFilterChipState();
}

class _FieldFilterChipState extends State<FieldFilterChip> {
  @override
  Widget build(BuildContext context) {
    return FormBuilderFilterChip(
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
      spacing: 5,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        label: Text(widget.label),
        errorMaxLines: 2,
        prefixIcon: widget.prefixIcon,
        suffixIcon: widget.suffixIcon,
      ),
      validator: widget.validator,
      onChanged: (List<dynamic>? values) {
        var results = (values ?? []).map((value) {
          var item = (widget.options ?? []).firstWhere((opt) {
            return opt.value.toLowerCase() == (value ?? '').toLowerCase();
          });

          return item;
        }).toList();

        var data = results.map((result) => result.data).toList();
        widget.onChanged?.call(widget.name, values, data);
      },
    );
  }
}

class FilterChipOption {
  String value;
  String label;
  dynamic data;

  FilterChipOption({
    required this.value,
    required this.label,
    this.data,
  });
}
