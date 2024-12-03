import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:superapp/resources/app_sizes.dart';

class FieldPassword extends StatefulWidget {
  final String name;
  final String label;
  final String hintText;
  final bool autocorrect;
  final List<TextInputFormatter> inputFormatters;
  final Widget? prefixIcon;
  final bool readOnly;
  final bool enabled;
  final TextCapitalization textCapitalization;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;
  final Function(String name, String? value, dynamic data)? onChanged;

  const FieldPassword({
    super.key,
    required this.name,
    required this.label,
    required this.hintText,
    this.autocorrect = false,
    this.readOnly = false,
    this.enabled = true,
    this.textCapitalization = TextCapitalization.none,
    this.keyboardType = TextInputType.visiblePassword,
    this.validator,
    this.inputFormatters = const [],
    this.prefixIcon,
    this.onChanged,
  });

  @override
  State<FieldPassword> createState() => _FieldPasswordState();
}

class _FieldPasswordState extends State<FieldPassword> {
  bool _isObscure = true;

  void _eventToggled() {
    setState(() {
      _isObscure = !_isObscure;
    });
  }

  @override
  Widget build(BuildContext context) {
    return FormBuilderTextField(
      name: widget.name,
      enabled: widget.enabled,
      readOnly: widget.readOnly,
      autocorrect: widget.autocorrect,
      textCapitalization: widget.textCapitalization,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      keyboardType: widget.keyboardType,
      inputFormatters: widget.inputFormatters,
      maxLines: 1,
      obscureText: _isObscure,
      decoration: InputDecoration(
        label: Text(widget.label),
        errorMaxLines: 2,
        hintText: widget.hintText,
        prefixIcon: widget.prefixIcon,
        suffixIcon: Container(
          margin: EdgeInsets.only(top: 2, right: AppSizes.s2),
          child: InkWell(
            onTap: () => _eventToggled(),
            child: Icon(
              _isObscure
                  ? Icons.visibility_outlined
                  : Icons.visibility_off_outlined,
            ),
          ),
        ),
        suffixIconConstraints: BoxConstraints(
          minWidth: AppSizes.s2,
          minHeight: AppSizes.s2,
        ),
      ),
      validator: widget.validator,
      onChanged: (String? value) {
        widget.onChanged?.call(widget.name, value, value);
      },
    );
  }
}
