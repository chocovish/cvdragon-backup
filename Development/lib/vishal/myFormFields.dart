import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:intl/intl.dart' show DateFormat;
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart'
    show InputType;

var _labelStyle = TextStyle();

Widget myTextField(String title, {int maxLines: 1, String initialValue,validators}) {
  if (initialValue == "null") initialValue = null;
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: FormBuilderTextField(
     
    
      validators: validators,
        enabled: false,
        attribute: title,
        initialValue: initialValue,
        maxLines: maxLines,
        decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
            labelText: title,
            labelStyle: _labelStyle)),
  );
}



Widget myCheckBox(String title, {bool initialValue, Function onChanged}) {
  return FormBuilderCheckbox(
    onChanged: onChanged,
    initialValue: initialValue,
    attribute: title,
    label: Container(
        height: 20, alignment: Alignment.centerRight, child: Text(title)),
    decoration: InputDecoration(border: InputBorder.none),
  );
}

Widget myRadioButton(String title,
    {String initialValue, @required List<FormBuilderFieldOption> options}) {
  return FormBuilderRadio(
    initialValue: initialValue,
    attribute: title,
    options: options,
  );
}

Widget mySegmentField(String title,
    {String initialValue, @required List<String> options, List optionLabel}) {
  if (initialValue == "" || initialValue == "null") initialValue = null;
  return Padding(
    padding: const EdgeInsets.all(12.0),
    child: FormBuilderSegmentedControl(
      decoration: InputDecoration(
        labelText: title,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
      ),
      attribute: title,
      initialValue: initialValue,
      options: options
          .map((i) => FormBuilderFieldOption(
              label: optionLabel != null ? optionLabel[options.indexOf(i)] : i,
              value: i))
          .toList(),
    ),
  );
}

myDropdownField(String title,
    {@required List items, String initialValue, String hint}) {
  return FormBuilderDropdown(
    attribute: title,
    decoration: InputDecoration(labelText: title),
    initialValue: initialValue,
    hint: Text(hint),
    validators: [FormBuilderValidators.required()],
    items: items
        .map(
            (gender) => DropdownMenuItem(value: gender, child: Text("$gender")))
        .toList(),
  );
}

myDateField(String title,{String initialValue}) {
  String date = initialValue??"Select Date";
  return FormBuilderCustomField(
    attribute: title,
    validators: [
      FormBuilderValidators.required(),
    ],
    formField: FormField(
      enabled: true,
      builder: (FormFieldState<dynamic> field) {
        return InputDecorator(
          decoration: InputDecoration(
            labelText: "Select Date",
            contentPadding: EdgeInsets.only(top: 10.0, bottom: 0.0),
            border: null,
          ),
          child: StatefulBuilder(
            builder: (context, setState) => InkWell(
              child: Container(
                padding: EdgeInsets.all(8),
                  height: 40, alignment: Alignment.center, child: Text(date)),
              onTap: () async {
                DateTime dateTime = await showDatePicker(
                  context: context,
                  firstDate: DateTime(1),
                  initialDate: DateTime.now(),
                  lastDate: DateTime(2100),
                );
                print(dateTime);
                setState(() {
                  if(dateTime!=null) date = dateTime.toString().split(" ")[0];
                });
                print(date);
                field.didChange(date);
              },
            ),
          ),
        );
      },
    ),
  );
// field.didChange(value);
}

//  ---------------------------- utility functions.. -------------------- //

bool num2bool(num) {
  if (num == null || num == "null") return null;
  int n = int.parse(num);
  return n == 1;
}

int bool2num(bool b) {
  if (b == null) return 0;
  return b ? 1 : 0;
}
