import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class FieldRangeSlider extends StatefulWidget {
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
  final RangeValues? initialValue;
  final double? min;
  final double? max;
  final String? Function(RangeValues?)? validator;

  final Function(String name, RangeValues? value, dynamic data)? onChanged;

  const FieldRangeSlider({
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
    this.initialValue,
    this.min,
    this.max,
  });

  @override
  State<FieldRangeSlider> createState() => _FieldRangeSliderState();
}

class _FieldRangeSliderState extends State<FieldRangeSlider> {
  @override
  Widget build(BuildContext context) {
    return FormBuilderRangeSlider(
      name: widget.name,
      enabled: widget.enabled,
      // readOnly: widget.readOnly,
      // autocorrect: widget.autocorrect,
      // textCapitalization: widget.textCapitalization,
      // keyboardType: widget.keyboardType,
      // inputFormatters: widget.inputFormatters,
      // maxLines: widget.maxLines,
      // title: Text(widget.hintText),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        label: Text(widget.label),
        errorMaxLines: 2,
        prefixIcon: widget.prefixIcon,
        suffixIcon: widget.suffixIcon,
      ),
      initialValue: widget.initialValue,
      min: widget.min ?? 0,
      max: widget.max ?? 100,
      validator: widget.validator,
      onChanged: (RangeValues? value) {
        widget.onChanged?.call(widget.name, value, value);
      },
    );
  }
}
