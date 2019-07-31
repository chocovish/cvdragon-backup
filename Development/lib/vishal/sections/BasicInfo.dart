import 'package:cvdragonapp_v1/localdatapush.dart';
import 'package:cvdragonapp_v1/vishal/myFormFields.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:nice_button/nice_button.dart';
import '../../localdatapush.dart' show updateData;
import '../myFormFields.dart';

class BasicInfo extends StatefulWidget {
  Map instance;

  BasicInfo({Map i}) : instance = i ?? {};

  @override
  _CertificatesFormState createState() => _CertificatesFormState();
}

class _CertificatesFormState extends State<BasicInfo> {
  final section = "51100";
  GlobalKey<FormBuilderState> _formKey;

  @override
  void initState() {
    _formKey = GlobalKey<FormBuilderState>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print("got data {$widget.instance}");
    return Container(
      color: Colors.white,
      child: FormBuilder(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Text("Basic Info", style: Theme.of(context).textTheme.display1),
              myTextField("nationality",
                  initialValue: widget.instance["nationality"]),
              // myTextField("gender", initialValue: widget.instance["gender"]),
              mySegmentField("gender",options: ["Male","Female","Other"]),
              Row(
                children: <Widget>[
                  myDateField("dateBirth",
                      initialValue: widget.instance["dateBirth"]),
                ],
              ),
              // myTextField("maritalStatus",
              //     initialValue: widget.instance["maritalStatus"]),
              mySegmentField("maritalStatus",options: ["Unmarried","Married"]),
              myTextField("facebookLink",
                  initialValue: widget.instance["facebookLink"]),
              myTextField("twitterLink",
                  initialValue: widget.instance["twitterLink"]),
              myTextField("linkedinLink",
                  initialValue: widget.instance["linkedinLink"]),
              myTextField("blogLink",
                  initialValue: widget.instance["blogLink"]),

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
                  print("new data is $newdata");
                  updateData(section, newdata, widget.instance).then((onValue) {
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
      ),
    );
  }
}
