
import 'package:cvdragonapp_v1/localdatapush.dart';
import 'package:cvdragonapp_v1/vishal/myFormFields.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:nice_button/nice_button.dart';
import '../../localdatapush.dart' show updateData;
import '../myFormFields.dart';
import '../../edit_section.dart';
import 'package:validators/validators.dart';

GlobalKey<FormBuilderState> _formKey;

class VolunteerExpForm  extends StatefulWidget {
  Map instance;


  VolunteerExpForm({Map i}) : instance = i ?? {};

  @override
  _VolunteerExpFormState createState() => _VolunteerExpFormState();
}

class _VolunteerExpFormState extends State<VolunteerExpForm> {
  final section = "51117";
   

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
            myTextField("organization",initialValue:widget.instance["organization"],validators:
             [
              FormBuilderValidators.minLength(0,errorText: "Enter the title to continue")
            ],
            ),
            myTextField("role",maxLines: 6,initialValue: widget.instance["role"]),
            myTextField("cause",maxLines: 6,initialValue: widget.instance["cause"]),
            myDateField("dateJoining",initialValue: widget.instance["dateJoining"]),
            myDateField("dateLeaving",initialValue: widget.instance["dateLeaving"]),
            myCheckBox("description",initialValue: widget.instance["present"]==1),
            myTextField("contribution",maxLines: 6,initialValue: widget.instance["contribution"]),

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
                if(_formKey.currentState.validate())
                {
                var newdata = _formKey.currentState.value;
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
              }
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
