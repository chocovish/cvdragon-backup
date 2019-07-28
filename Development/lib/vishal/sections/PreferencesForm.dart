
import 'package:cvdragonapp_v1/localdatapush.dart';
import 'package:cvdragonapp_v1/vishal/myFormFields.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:nice_button/nice_button.dart';
import '../../localdatapush.dart' show updateData;
import '../myFormFields.dart';


class PreferencesForm extends StatefulWidget {
  Map instance;

  PreferencesForm({Map i}) : instance = i ?? {};

  @override
  _PreferencesFormState createState() => _PreferencesFormState();
}

class _PreferencesFormState extends State<PreferencesForm> {
  final section = "51121";
   GlobalKey<FormBuilderState> _formKey;

  @override
  void initState() {
    _formKey =  GlobalKey<FormBuilderState>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(widget.instance);
    return Container(
      color: Colors.white,
      
      child: FormBuilder(
        key: _formKey,
        child: SingleChildScrollView(
                  child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Preferences"),
              ),
              myTextField("preferredLocation",initialValue: widget.instance["preferredLocation"]),
              myCheckBox("canRelocate",initialValue: widget.instance["canRelocate"]==1),
              myTextField("noticePeriod",initialValue: widget.instance["noticePeriod"]),
              myCheckBox("canJoin",initialValue: widget.instance["canJoin"]==1),
              myTextField("expectedCTC",initialValue: widget.instance["expectedCTC"]),
              myCheckBox("isNegotiate",initialValue: widget.instance["isNegotiate"]==1),
              myCheckBox("declaration",initialValue: widget.instance["declaration"]==1),
              
               mySegmentField("passport",initialValue: widget.instance["passport"].toString(),options: ["0","1","2"],optionLabel: ["Yes","No","Applied"]),
              // mySegmentField("recommendation",initialValue: widget.instance["recommendation"],options: ["Yes","No"]),
              // mySegmentField("declaration",initialValue: widget.instance["declaration"],options: ["Yes","No"]),

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
                  newdata["canRelocate"] = newdata["canRelocate"]?1:0;
                  newdata["canJoin"] = newdata["canJoin"]?1:0;
                  newdata["isNegotiate"] = newdata["isNegotiate"]?1:0;
                  newdata["declaration"] = newdata["declaration"]?1:0;
                  //print("After $newdata");
                  widget.instance.isEmpty
                      ? pushData(section, newdata).then((onValue) {
                          Navigator.of(context).pop();
                          
                        })
                      : updateData(section, newdata, widget.instance)
                          .then((onValue) {
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
      ),
    );
  }
}
