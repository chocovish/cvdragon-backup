
import 'package:cvdragonapp_v1/localdatapush.dart';
import 'package:cvdragonapp_v1/vishal/myFormFields.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:nice_button/nice_button.dart';
import '../../localdatapush.dart' show updateData;
import '../myFormFields.dart';


class SoftSkillsForm extends StatefulWidget {
  Map instance;

  SoftSkillsForm({Map i}) : instance = i ?? {};

  @override
  _SoftSkillsFormState createState() => _SoftSkillsFormState();
}

class _SoftSkillsFormState extends State<SoftSkillsForm> {
  final section = "51118";
   GlobalKey<FormBuilderState> _formKey;

  @override
  void initState() {
    _formKey =  GlobalKey<FormBuilderState>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      
      child: FormBuilder(
        key: _formKey,
        child: Column(
          children: <Widget>[
            myTextField("skill",initialValue: widget.instance["skill"]),
            myTextField("description",maxLines: 6,initialValue: widget.instance["description"]),

           
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
