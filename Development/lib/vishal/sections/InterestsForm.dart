import 'package:cvdragonapp_v1/localdatapush.dart';
import 'package:cvdragonapp_v1/vishal/myFormFields.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:nice_button/nice_button.dart';
import '../../localdatapush.dart' show updateData;
import '../myFormFields.dart';

class InterestsForm extends StatefulWidget {
  Map instance;

  InterestsForm({Map i}) : instance = i ?? {};

  @override
  _InterestsFormState createState() => _InterestsFormState();
}

class _InterestsFormState extends State<InterestsForm> {
  final section = "51119";
  GlobalKey<FormBuilderState> _formKey;

  @override
  void initState() {
    _formKey = GlobalKey<FormBuilderState>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(widget.instance);
    return Container(
      color: Colors.white,
      child: FormBuilder(
        key: _formKey,
        child: Column(
          children: <Widget>[
            myTextField("interest", initialValue: widget.instance["interest"]),
            myRadioButton("level",initialValue: widget.instance["level"], options: [
              FormBuilderFieldOption(label: "Interest", value: "Interest"),
              FormBuilderFieldOption(label: "Hobby", value: "Hobby"),
              FormBuilderFieldOption(label: "Passion", value: "Passion"),
            ]),

            // ---- Submit Button ---- //
            NiceButton(
              text: "Save",
              background: Colors.green,
              gradientColors: [
                Colors.greenAccent,
                Colors.green,
                Colors.lightBlue
              ],
              radius: 25,
              onPressed: () {
                _formKey.currentState.save();
                var newdata = _formKey.currentState.value;
                newdata["readLanguage"] = bool2num(newdata["readLanguage"]);
                newdata["writeLanguage"] = bool2num(newdata["writeLanguage"]);
                newdata["speakLanguage"] = bool2num(newdata["speakLanguage"]);
                print(newdata);
                widget.instance.isEmpty
                    ? pushData(section, newdata).then((onValue) {
                        Navigator.of(context).pop();
                        Navigator.of(context).pop();
                      })
                    : updateData(section, newdata, widget.instance)
                        .then((onValue) {
                        Navigator.of(context).pop();
                        Navigator.of(context).pop();
                      });
              },
              elevation: 8,
            ),
            SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }
}
