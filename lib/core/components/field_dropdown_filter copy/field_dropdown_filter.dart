import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:form_builder_extra_fields/form_builder_extra_fields.dart';

class FieldDropdownFilter extends StatefulWidget {
  final String name;
  final String label;
  final String hintText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool enabled;
  final String? initialValue;

  // final bool autocorrect;
  // final bool readOnly;
  // final List<TextInputFormatter> inputFormatters;
  // final TextCapitalization textCapitalization;
  // final TextInputType keyboardType;
  // final int maxLines;
  final List<DropdownFilterOption>? options;
  final String? Function(dynamic)? validator;
  final Function(String name, dynamic value, dynamic data)? onChanged;

  const FieldDropdownFilter({
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
    this.initialValue,
  });

  @override
  State<FieldDropdownFilter> createState() => _FieldDropdownFilterState();
}

class _FieldDropdownFilterState extends State<FieldDropdownFilter> {
  @override
  Widget build(BuildContext context) {
    return FormBuilderSearchableDropdown(
      name: widget.name,
      enabled: widget.enabled,
      // readOnly: widget.readOnly,
      // autocorrect: widget.autocorrect,
      // textCapitalization: widget.textCapitalization,
      // keyboardType: widget.keyboardType,
      // inputFormatters: widget.inputFormatters,
      // maxLines: widget.maxLines,
      initialValue: widget.initialValue ?? '',
      selectedItem: widget.initialValue ?? '',
      items: [
        DropdownFilterOption(value: '', label: widget.hintText, data: ''),
        ...widget.options ?? []
      ],

      popupProps: PopupProps.menu(
        showSearchBox: true,
        itemBuilder: (context, dynamic item, isDisabled) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(item.label),
          );
        },
      ),
      dropdownBuilder: (ctx, selectedItem) {
        if (selectedItem == '') {
          return Text(widget.hintText);
        }
        return Text(selectedItem?.label ?? '');
      },
      dropdownSearchDecoration: const InputDecoration(hintText: 'Search'),
      compareFn: (item1, item2) {
        return item1.label == item2.label;
      },
      filterFn: (item, filter) {
        return item.label.toLowerCase().contains(filter.toLowerCase());
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        label: Text(widget.label),
        errorMaxLines: 2,
        prefixIcon: widget.prefixIcon,
        suffixIcon: widget.suffixIcon,
      ),
      validator: widget.validator,
      onChanged: (dynamic opt) {
        inspect(opt);
        widget.onChanged?.call(widget.name, opt.value, opt.data);
      },
    );
  }
}

class DropdownFilterOption {
  String value;
  String label;
  dynamic data;

  DropdownFilterOption({
    required this.value,
    required this.label,
    this.data,
  });
}
