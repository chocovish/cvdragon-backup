
import 'package:cvdragonapp_v1/localdatapush.dart';
import 'package:cvdragonapp_v1/vishal/myFormFields.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:nice_button/nice_button.dart';
import '../../localdatapush.dart' show updateData;
import '../myFormFields.dart';
import '../../edit_section.dart';


class ProfessionalQualificationsForm extends StatefulWidget {
  Map instance;

  ProfessionalQualificationsForm({Map i}) : instance = i ?? {};

  @override
  _ProfessionalQualificationsFormState createState() => _ProfessionalQualificationsFormState();
}

class _ProfessionalQualificationsFormState extends State<ProfessionalQualificationsForm> {
  final section = "51108";
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
            myTextField("course",initialValue: widget.instance["course"]),
            myTextField("organization",initialValue: widget.instance["organization"]),
            myTextField("university",initialValue: widget.instance["university"]),
            myTextField("year",initialValue: widget.instance["year"].toString()),
            myTextField("grade",initialValue: widget.instance["grade"]),
            myTextField("score",initialValue: widget.instance["score"]),
           
            // ---- Submit Button ---- //
            Container(
              decoration: BoxDecoration(image: DecorationImage(image: AssetImage('assets/button.gif'),fit: BoxFit.cover)),
              child: NiceButton(
                
                text: "Save",
                background: Colors.transparent,
                // gradientColors: [
                //   Colors.greenAccent,
                //   Colors.green,
                //   Colors.lightBlue
                // ],
                radius: 25,
                onPressed: () {
                  _formKey.currentState.save();
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
                },
                elevation: 0,
              ),
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
