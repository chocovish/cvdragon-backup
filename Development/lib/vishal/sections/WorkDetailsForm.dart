
import 'package:cvdragonapp_v1/localdatapush.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:nice_button/nice_button.dart';
import '../../localdatapush.dart' show updateData;
import '../myFormFields.dart';
import '../../edit_section.dart';

class WorkDetailsForm extends StatefulWidget {
  Map instance;

  WorkDetailsForm({Map i}) : instance = i ?? {};

  @override
  _WorkDetailsFormState createState() => _WorkDetailsFormState();
}

class _WorkDetailsFormState extends State<WorkDetailsForm> {
  final section = "51104";
  bool working = false;
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
            myTextField("organization",
                initialValue: widget.instance["organization"]),
            myTextField("designation",
                initialValue: widget.instance["designation"]),
            myTextField("location",
                initialValue: widget.instance["location"]),
            myTextField("workProfile",
                maxLines: 6, initialValue: widget.instance["workProfile"]),
            Row(
              children: <Widget>[
                myDateField("dateJoined",
                    initialValue: widget.instance["dateJoined"]),
                myDateField("dateResigned",
                    initialValue: working ? "0001-01-01" : widget.instance["dateResigned"]),
              ],
            ),
            myCheckBox(
              "currentWorking",
              onChanged: (dynamic val) {
                print(val);
                setState(() {
                  working = !working;
                });
              },
              initialValue:
                  widget.instance["currentWorking"] == 1 ? true : false,
            ),
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
                newdata["dateJoined"] =
                    newdata["dateJoined"].toString().split(" ")[0];
                newdata["dateResigned"] =
                    newdata["dateResigned"].toString().split(" ")[0];
                newdata["currentWorking"] = newdata["currentWorking"] ? 1 : 0;
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
