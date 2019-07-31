
import 'package:cvdragonapp_v1/localdatapush.dart';
import 'package:cvdragonapp_v1/vishal/myFormFields.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:nice_button/nice_button.dart';
import '../../localdatapush.dart' show updateData;
import '../myFormFields.dart';
import '../../edit_section.dart';


class EducationalBackgroundForm extends StatefulWidget {
  Map instance;

  EducationalBackgroundForm({Map i}) : instance = i ?? {};

  @override
  _EducationalBackgroundFormState createState() => _EducationalBackgroundFormState();
}

class _EducationalBackgroundFormState extends State<EducationalBackgroundForm> {
  final section = "51109";
   GlobalKey<FormBuilderState> _formKey;

  @override
  void initState() {
    _formKey =  GlobalKey<FormBuilderState>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print("widget instance is  ${widget.instance}");
    return Material(
          child: ListView(
        //color: Colors.white,
        //height: MediaQuery.of(context).size.height,
        
        children: <Widget>[FormBuilder(
          key: _formKey,
          child: Column(
                  children: <Widget>[
                    Padding(
          padding: const EdgeInsets.all(14.0),
          child: Text("ContactDetails"),
                    ),
                    myTextField("institute",initialValue: widget.instance["institute"]),
                    myTextField("university",initialValue: widget.instance["university"]),
                    myTextField("location",initialValue: widget.instance["location"]),
                    myTextField("specialization",initialValue: widget.instance["specialization"]),
                    myTextField("grade",initialValue: widget.instance["grade"]),
                    myTextField("year",initialValue: widget.instance["year"].toString()),
                    myTextField("score",initialValue: widget.instance["score"].toString()),
                    myTextField("category",initialValue: widget.instance["category"]),
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
        ],
      ),
    );
  }
}