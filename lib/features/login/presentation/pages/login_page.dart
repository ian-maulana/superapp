import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:intl/intl.dart';
import 'package:superapp/core/components/field_checkbox/index.dart';
import 'package:superapp/core/components/field_checkbox_group/index.dart';
import 'package:superapp/core/components/field_choice_chip/index.dart';
import 'package:superapp/core/components/field_daterange/index.dart';
import 'package:superapp/core/components/field_datetime/index.dart';
import 'package:superapp/core/components/field_dropdown/index.dart';
import 'package:superapp/core/components/field_dropdown_filter/index.dart';
import 'package:superapp/core/components/field_filter_chip/index.dart';
import 'package:superapp/core/components/field_group/index.dart';
import 'package:superapp/core/components/field_mask/index.dart';
import 'package:superapp/core/components/field_numeric/field_numeric.dart';
import 'package:superapp/core/components/field_password/index.dart';
import 'package:superapp/core/components/field_radio_group/index.dart';
import 'package:superapp/core/components/field_rangeslider/field_rangeslider.dart';
import 'package:superapp/core/components/field_slider/index.dart';
import 'package:superapp/core/components/field_switch/index.dart';
import 'package:superapp/core/components/field_text/index.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Superapps'),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(14),
          color: Colors.white,
          child: FormBuilder(
            key: _formKey,
            initialValue: {
              'email': 'ian@actionpay.co.id',
              'dob': DateTime(1992, 9, 20),
              'visit': DateTimeRange(
                start: DateTime(1992, 9, 20),
                end: DateTime(2000, 09, 20),
              )
            },
            child: Column(
              children: [
                FieldGroup(
                  child: FieldText(
                    name: 'email',
                    label: 'Email',
                    hintText: 'Enter your email',
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(),
                      FormBuilderValidators.email(),
                    ]),
                  ),
                ),
                FieldGroup(
                  child: FieldPassword(
                    name: 'password',
                    label: 'Password',
                    hintText: 'Enter your password',
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(),
                    ]),
                  ),
                ),
                FieldGroup(
                  child: FieldNumeric(
                    name: 'age',
                    label: 'Age',
                    hintText: 'Enter your age',
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(),
                    ]),
                  ),
                ),
                FieldGroup(
                  child: FieldMask(
                    name: 'identityNumber',
                    label: 'Identity Number',
                    hintText: 'Enter your identity number',
                    mask: '#### #### #### ####',
                    filter: {'#': RegExp(r'^[a-zA-Z0-9_]*')},
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(),
                    ]),
                  ),
                ),
                FieldGroup(
                  child: FieldDatetime(
                    name: 'dob',
                    label: 'Date of Birth',
                    hintText: 'Enter your date of birth',
                    inputType: InputType.date,
                    format: DateFormat('dd/MM/yyyy'),
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(),
                    ]),
                  ),
                ),
                FieldGroup(
                  child: FieldDaterange(
                    name: 'visit',
                    label: 'Range Visit',
                    hintText: 'Enter your visit',
                    inputType: InputType.date,
                    format: DateFormat('dd/MM/yyyy'),
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(),
                    ]),
                  ),
                ),
                FieldGroup(
                  child: FieldSwitch(
                    name: 'subscribe',
                    label: 'Subscribe',
                    hintText: 'Subscribe status?',
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(),
                    ]),
                  ),
                ),
                FieldGroup(
                  child: FieldCheckbox(
                    name: 'remember',
                    label: 'Remember Me',
                    hintText: 'Remember status?',
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(),
                    ]),
                  ),
                ),
                FieldGroup(
                  child: FieldCheckboxGroup(
                    name: 'services',
                    label: 'Services',
                    hintText: 'Select Service',
                    options: [
                      CheckboxGroupOption(
                        value: 'remitten',
                        label: 'Remitten',
                        data: {'name': 'remitten', 'id': '001'},
                      ),
                      CheckboxGroupOption(
                        value: 'payment solution',
                        label: 'Payment Solution',
                        data: {'name': 'payment solution', 'id': '002'},
                      ),
                      CheckboxGroupOption(
                        value: 'collection',
                        label: 'Collection',
                        data: {'name': 'collection', 'id': '003'},
                      ),
                    ],
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(),
                    ]),
                  ),
                ),
                FieldGroup(
                  child: FieldSlider(
                    name: 'totalEmployee',
                    label: 'Total Employee',
                    hintText: 'Enter total employee',
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(),
                    ]),
                  ),
                ),
                FieldGroup(
                  child: FieldRangeSlider(
                    name: 'stamina',
                    label: 'Stamina',
                    hintText: 'Enter your stamina',
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(),
                    ]),
                  ),
                ),
                FieldGroup(
                  child: FieldChoiceChip(
                    name: 'service',
                    label: 'Service',
                    hintText: 'Select Service',
                    options: [
                      ChipOption(
                        value: 'remitten',
                        label: 'Remitten',
                        data: {'name': 'remitten', 'id': '001'},
                      ),
                      ChipOption(
                        value: 'payment solution',
                        label: 'Payment Solution',
                        data: {'name': 'payment solution', 'id': '002'},
                      ),
                      ChipOption(
                        value: 'collection',
                        label: 'Collection',
                        data: {'name': 'collection', 'id': '003'},
                      ),
                    ],
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(),
                    ]),
                  ),
                ),
                FieldGroup(
                  child: FieldFilterChip(
                    name: 'product',
                    label: 'Product',
                    hintText: 'Select Product',
                    options: [
                      FilterChipOption(
                        value: 'remitten',
                        label: 'Remitten',
                        data: {'name': 'remitten', 'id': '001'},
                      ),
                      FilterChipOption(
                        value: 'payment solution',
                        label: 'Payment Solution',
                        data: {'name': 'payment solution', 'id': '002'},
                      ),
                      FilterChipOption(
                        value: 'collection',
                        label: 'Collection',
                        data: {'name': 'collection', 'id': '003'},
                      ),
                    ],
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(),
                    ]),
                  ),
                ),
                FieldGroup(
                  child: FieldRadioGroup(
                    name: 'gender',
                    label: 'Gender',
                    hintText: 'Select Gender',
                    options: [
                      RadioOption(
                        value: 'male',
                        label: 'Male',
                        data: {'name': 'male', 'id': '001'},
                      ),
                      RadioOption(
                        value: 'female',
                        label: 'Female',
                        data: {'name': 'female', 'id': '002'},
                      ),
                    ],
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(),
                    ]),
                  ),
                ),
                FieldGroup(
                  child: FieldDropdown(
                    name: 'gender',
                    label: 'Gender',
                    hintText: 'Select Gender',
                    options: [
                      DropdownOption(
                        value: 'male',
                        label: 'Male',
                        data: {'name': 'male', 'id': '001'},
                      ),
                      DropdownOption(
                        value: 'female',
                        label: 'Female',
                        data: {'name': 'female', 'id': '002'},
                      ),
                    ],
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(),
                    ]),
                  ),
                ),
                FieldGroup(
                  child: FieldDropdownFilter(
                    name: 'country',
                    label: 'Country',
                    hintText: 'Select Country',
                    options: [
                      DropdownFilterOption(
                        value: 'male',
                        label: 'Male',
                        data: {'name': 'male', 'id': '001'},
                      ),
                      DropdownFilterOption(
                        value: 'female',
                        label: 'Female',
                        data: {'name': 'female', 'id': '002'},
                      ),
                    ],
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(),
                    ]),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
