import 'package:flutter/material.dart';
import 'package:superapp/resources/app_sizes.dart';
import 'package:superapp/resources/app_styles.dart';

class FieldGroup extends StatefulWidget {
  final String? label;
  final Widget child;
  final bool required;

  const FieldGroup({
    super.key,
    required this.child,
    this.label,
    this.required = false,
  });

  @override
  State<FieldGroup> createState() => _FieldGroupState();
}

class _FieldGroupState extends State<FieldGroup> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: AppSizes.s3),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          widget.label != null
              ? Padding(
                  padding: EdgeInsets.only(bottom: AppSizes.s1_3),
                  child: Text(
                    '${widget.label} ${widget.required ? '*' : ''}',
                    style: getLabelStyle(),
                  ),
                )
              : Container(),
          widget.child,
        ],
      ),
    );
  }
}
