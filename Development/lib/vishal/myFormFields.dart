import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:intl/intl.dart' show DateFormat;
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart' show InputType;

    

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

Widget myDateField(String title, {String initialValue}) {
  DateTime ival;
  if (initialValue != null && initialValue != "null") {
    print("Starting parse with $initialValue");
    ival = DateTime.parse(initialValue);
    print("parsing done");
  }
  return Expanded(
    child: Padding(
      padding: EdgeInsets.all(8.0),
      child: FormBuilderDateTimePicker(
        //enabled: false,
        autovalidate: true,
        // readonly: true,
        keyboardType: TextInputType.datetime,
        attribute: title,
        initialValue: ival,
        decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
            labelText: title,
            labelStyle: _labelStyle),
        inputType: InputType.date,
        format: DateFormat("dd-MM-yyyy"),
      ),
    ),
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
    {String initialValue, @required List<String> options,List optionLabel}) {
      if(initialValue==""||initialValue=="null") initialValue = null;
      return Padding(
    padding: const EdgeInsets.all(12.0),
    child: FormBuilderSegmentedControl(
      decoration: InputDecoration(
        labelText: title,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
      ),
      attribute: title,
      initialValue: initialValue,
      options: options.map((i) => FormBuilderFieldOption(label:optionLabel!=null?optionLabel[options.indexOf(i)]:i ,value: i)).toList(),
    ),
  );
}

//  ---------------------------- utility functions.. -------------------- //

bool num2bool(num) {
  if (num == null||num=="null") return null;
  int n = int.parse(num);
  return n == 1;
}

int bool2num(bool b) {
  if (b == null) return 0;
  return b ? 1 : 0;
}
