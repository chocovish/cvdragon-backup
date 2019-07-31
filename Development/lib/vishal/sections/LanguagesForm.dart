
import 'package:cvdragonapp_v1/localdatapush.dart';
import 'package:cvdragonapp_v1/vishal/myFormFields.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:nice_button/nice_button.dart';
import '../../localdatapush.dart' show updateData;
import '../myFormFields.dart';
import '../../edit_section.dart';


class LanguagesForm extends StatefulWidget {
  Map instance;

  LanguagesForm({Map i}) : instance = i ?? {};

  @override
  _LanguagesFormState createState() => _LanguagesFormState();
}

class _LanguagesFormState extends State<LanguagesForm> {
  final section = "51120";
   GlobalKey<FormBuilderState> _formKey;

  @override
  void initState() {
    _formKey =  GlobalKey<FormBuilderState>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(widget.instance["readLanguage"].runtimeType);
    return Container(
      color: Colors.white,
      
      child: FormBuilder(
        key: _formKey,
        child: Column(
          children: <Widget>[
            myTextField("language",initialValue: widget.instance["language"]),
            myCheckBox("readLanguage",initialValue:  num2bool(widget.instance["readLanguage"].toString())),
            myCheckBox("writeLanguage",initialValue:  num2bool(widget.instance["writeLanguage"].toString())),
            myCheckBox("speakLanguage",initialValue:  num2bool(widget.instance["speakLanguage"].toString())),

           
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
                        Navigator.of(context).push(MaterialPageRoute(builder: (_)=>EditSection(section)));
                      })
                    : updateData(section, newdata, widget.instance)
                        .then((onValue) {
                        Navigator.of(context).pop();
                        Navigator.of(context).pop();
                        Navigator.of(context).push(MaterialPageRoute(builder: (_)=>EditSection(section)));
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
