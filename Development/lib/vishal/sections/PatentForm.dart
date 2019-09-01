import 'package:cvdragonapp_v1/localdatapush.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:nice_button/nice_button.dart';
import '../../localdatapush.dart' show updateData;
import '../myFormFields.dart';
import '../../edit_section.dart';


class PatentForm extends StatefulWidget {
  Map instance;

  PatentForm({Map i}) : instance = i ?? {};

  @override
  _PatentFormState createState() => _PatentFormState();
}

class _PatentFormState extends State<PatentForm> {
  final section = "51113";
  bool working = false;
  GlobalKey<FormBuilderState> _formKey;

  @override
  void initState() {
    _formKey = GlobalKey<FormBuilderState>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print("In patent form");
    print(widget.instance);
    //return Container(child:Text("hello World"));
    return Container(
      color: Colors.white,
      child: FormBuilder(
        key: _formKey,
        child: Column(
          children: <Widget>[
            myTextField("title", initialValue: widget.instance["title"]),
            myTextField("patentOffice",
                initialValue: widget.instance["patentOffice"]),

            myRadioButton("patentStatus", initialValue: widget.instance["patentStatus"],options: [
              FormBuilderFieldOption(label: "Issued", value: "Issued"),
              FormBuilderFieldOption(label: "Pending", value: "Pending"),
            ]),

            Row(children: <Widget>[
              myDateField("patentDate",
                initialValue: widget.instance["patentDate"]),
            ],),
            

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
                newdata["patentDate"] =
                    newdata["patentDate"].toString().split(" ")[0];

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
