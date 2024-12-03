import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class FieldCheckboxGroup extends StatefulWidget {
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
  final List<CheckboxGroupOption>? options;
  final String? Function(List<dynamic>?)? validator;
  final Function(String name, List<dynamic>? value, dynamic data)? onChanged;

  const FieldCheckboxGroup({
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
  State<FieldCheckboxGroup> createState() => _FieldCheckboxGroupState();
}

class _FieldCheckboxGroupState extends State<FieldCheckboxGroup> {
  @override
  Widget build(BuildContext context) {
    return FormBuilderCheckboxGroup(
      name: widget.name,
      enabled: widget.enabled,
      // readOnly: widget.readOnly,
      // autocorrect: widget.autocorrect,
      // textCapitalization: widget.textCapitalization,
      // keyboardType: widget.keyboardType,
      // inputFormatters: widget.inputFormatters,
      // maxLines: widget.maxLines,

      options: (widget.options ?? []).map((opt) {
        return FormBuilderFieldOption(value: opt.value, child: Text(opt.label));
      }).toList(),
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

class CheckboxGroupOption {
  String value;
  String label;
  dynamic data;

  CheckboxGroupOption({
    required this.value,
    required this.label,
    this.data,
  });
}
