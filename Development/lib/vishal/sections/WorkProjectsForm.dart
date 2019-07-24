import 'package:cvdragonapp_v1/localdatapush.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:nice_button/nice_button.dart';
import '../../localdatapush.dart' show updateData;
import '../myFormFields.dart';

class WorkProjectsForm extends StatefulWidget {
  Map instance;

  WorkProjectsForm({Map i}) : instance = i ?? {};

  @override
  _WorkProjectsFormState createState() => _WorkProjectsFormState();
}

class _WorkProjectsFormState extends State<WorkProjectsForm> {
  final section = "51105";
  GlobalKey<FormBuilderState> _formKey;

  @override
  void initState() {
    _formKey = GlobalKey<FormBuilderState>();
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
            myTextField("title", initialValue: widget.instance["title"]),
            myTextField("designation",
                initialValue: widget.instance["designation"]),
            myTextField("duration", initialValue: widget.instance["duration"]),
            myTextField("location", initialValue: widget.instance["location"]),
            myTextField("description",
                maxLines: 6, initialValue: widget.instance["description"]),
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
               newdata["workid"] = "";
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
