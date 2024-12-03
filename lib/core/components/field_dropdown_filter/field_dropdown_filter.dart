import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:superapp/resources/app_colors.dart';
import 'package:superapp/resources/app_sizes.dart';

class FieldDropdownFilter extends StatefulWidget {
  final String name;
  final String label;
  final String hintText;
  final bool autocorrect;
  final List<TextInputFormatter> inputFormatters;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool readOnly;
  final bool enabled;
  final TextCapitalization textCapitalization;
  final TextInputType keyboardType;
  final int maxLines;
  final String? Function(String?)? validator;
  final List<DropdownFilterOption>? options;
  final Function(String name, String? value, dynamic data)? onChanged;

  const FieldDropdownFilter({
    super.key,
    required this.name,
    required this.label,
    required this.hintText,
    required this.options,
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
  });

  @override
  State<FieldDropdownFilter> createState() => _FieldDropdownFilterState();
}

class _FieldDropdownFilterState extends State<FieldDropdownFilter> {
  List<DropdownFilterOption> _options = [];

  @override
  void initState() {
    _options = widget.options ?? [];
    super.initState();
  }

  void _showPopup() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      useSafeArea: true,
      backgroundColor: Colors.white,
      // showDragHandle: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadiusDirectional.only(
          topEnd: Radius.circular(25),
          topStart: Radius.circular(25),
        ),
      ),
      builder: (context) => Padding(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            SingleChildScrollView(
              padding: EdgeInsets.only(
                top: 120,
                left: AppSizes.s2,
                right: AppSizes.s2,
              ),
              child: Wrap(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: List.generate(
                      3,
                      (index) => Container(
                        height: 60,
                        margin: EdgeInsetsDirectional.only(bottom: 10),
                        width: double.infinity,
                        color: Colors.yellow,
                        child: Center(
                          child: Text(
                            'Widgets $index',
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(AppSizes.s2),
                ),
                child: Column(
                  children: [
                    Container(
                      width: 100,
                      height: 5,
                      margin: EdgeInsets.only(top: 14, bottom: 16),
                      decoration: BoxDecoration(
                        color: AppColors.border,
                        borderRadius: BorderRadius.circular(AppSizes.s2),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: AppSizes.s2,
                        vertical: AppSizes.s2,
                      ),
                      child: TextFormField(),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );

    // showModalBottomSheet(
    //   context: context,
    //   isScrollControlled: true,
    //   backgroundColor: AppColors.white,
    //   shape: const RoundedRectangleBorder(
    //     borderRadius: BorderRadius.only(
    //       topLeft: Radius.circular(25.0),
    //       topRight: Radius.circular(25.0),
    //     ),
    //   ),
    //   builder: (builder) {
    //     return StatefulBuilder(builder: (context, Function updateState) {
    //       return Padding(
    //         padding: EdgeInsets.only(
    //           bottom: MediaQuery.of(context).viewInsets.bottom,
    //         ),
    //         child: DraggableScrollableSheet(
    //           expand: false,
    //           builder: (BuildContext ctx, ScrollController scroll) {
    //             return Column(
    //               children: [
    //                 Container(
    //                   decoration: BoxDecoration(
    //                     color: AppColors.white,
    //                     borderRadius: BorderRadius.only(
    //                       topLeft: Radius.circular(AppSizes.s2),
    //                       topRight: Radius.circular(AppSizes.s2),
    //                     ),
    //                   ),
    //                   padding: EdgeInsets.only(
    //                     left: AppSizes.s2,
    //                     right: AppSizes.s2,
    //                     bottom: AppSizes.s0,
    //                     top: AppSizes.s2,
    //                   ),
    //                   child: TextFormField(),
    //                 ),
    //                 Expanded(
    //                   child: SingleChildScrollView(
    //                     child: Wrap(
    //                       children: _options.map((opt) {
    //                         return ListTile(
    //                           shape: RoundedRectangleBorder(
    //                             borderRadius: BorderRadius.circular(
    //                               AppSizes.s2,
    //                             ),
    //                           ),
    //                           // tileColor: _selected['value'] == opt['value']
    //                           //     ? Colours.border2
    //                           //     : Colors.transparent,
    //                           title: Text(
    //                             opt.label,
    //                             // style: getMediumStyle(
    //                             //   fontSize: FontSizes.md,
    //                             //   color: Colours.primary,
    //                             // ),
    //                           ),
    //                           // trailing: Visibility(
    //                           //   visible: _selected['value'] == opt['value'],
    //                           //   child: Icon(
    //                           //     Icons.check,
    //                           //     color: Colours.body1,
    //                           //   ),
    //                           // ),
    //                           // onTap: () => _eventSelectOption(opt),
    //                         );
    //                       }).toList(),
    //                     ),
    //                   ),
    //                 ),
    //               ],
    //             );
    //           },
    //         ),
    //       );
    //     });
    //   },
    // );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FormBuilderTextField(
          name: widget.name,
          enabled: widget.enabled,
          readOnly: widget.readOnly,
          autocorrect: widget.autocorrect,
          textCapitalization: widget.textCapitalization,
          keyboardType: widget.keyboardType,
          inputFormatters: widget.inputFormatters,
          maxLines: widget.maxLines,
          initialValue: '',
          autovalidateMode: AutovalidateMode.onUserInteraction,
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
        ),
        TextFormField(
          // focusNode: _node,
          enabled: widget.enabled,
          readOnly: true,
          autocorrect: false,
          textCapitalization: TextCapitalization.none,
          keyboardType: TextInputType.text,
          // controller: _controller,
          initialValue: widget.hintText,
          maxLines: 1,
          decoration: InputDecoration(
            label: Text(widget.label),
            errorMaxLines: 2,
            hintText: widget.hintText,
            prefixIcon: widget.prefixIcon,
            suffixIcon: Container(
              // margin: EdgeInsets.only(top: AppSizes.s0, right: AppSizes.s16),
              child: Icon(
                Icons.expand_more,
                // color: _provider.errors[widget.name] != null
                //     ? Colours.error
                //     : Colours.body2,
              ),
            ),
            // suffixIconConstraints: BoxConstraints(
            //   minWidth: AppSizes.s16,
            //   minHeight: AppSizes.s16,
            // ),
            // hintText: widget.hint,
            // errorText: _provider.errors[widget.name],
          ),
          onTap: _showPopup,
        )
      ],
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
