
import 'package:cvdragonapp_v1/localdatapush.dart';
import 'package:cvdragonapp_v1/vishal/myFormFields.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:nice_button/nice_button.dart';
import '../../localdatapush.dart' show updateData;
import '../myFormFields.dart';
import '../../edit_section.dart';

GlobalKey<FormBuilderState> _formKey;

class AcademicProjectsForm extends StatefulWidget {
  Map instance;


  AcademicProjectsForm({Map i}) : instance = i ?? {};

  @override
  _AcademicProjectsFormState createState() => _AcademicProjectsFormState();
}

class _AcademicProjectsFormState extends State<AcademicProjectsForm> {
  final section = "51122";
   

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
            myTextField("title",initialValue:widget.instance["title"],validators:
             [
              FormBuilderValidators.minLength(0,errorText: "Enter the title to continue")
            ],
            ),
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
