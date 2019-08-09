import 'package:cvdragonapp_v1/Create_New_Section/Create_Co_Curricular_Activity.dart';
import 'package:cvdragonapp_v1/localdatapush.dart';
import 'package:cvdragonapp_v1/vishal/myFormFields.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:nice_button/nice_button.dart';
import '../../localdatapush.dart' show updateData;
import '../myFormFields.dart';
import '../../edit_section.dart';

class TechnicalKnowledgeForm extends StatefulWidget {
  Map instance;

  TechnicalKnowledgeForm({Map i}) : instance = i ?? {};

  @override
  _TechnicalKnowledgeFormState createState() => _TechnicalKnowledgeFormState();
}

class _TechnicalKnowledgeFormState extends State<TechnicalKnowledgeForm> {
  final section = "51111";
  GlobalKey<FormBuilderState> _formKey;

  @override
  void initState() {
    _formKey = GlobalKey<FormBuilderState>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(" widget instance is --- ${widget.instance}");
    return Container(
      color: Colors.white,
      child: FormBuilder(
        key: _formKey,
        child: Column(
          children: <Widget>[
            myTextField("technical",
                initialValue: widget.instance["technical"]),
            myTextField("type", initialValue: widget.instance["type"]),
            myDropdownField("level",
                initialValue: widget.instance["level"],
                items: [
                  "Trainee",
                  "Beginner",
                  "Intermediate",
                  "Proficient",
                  "Expert",
                  "Advanced",
                ],
                hint: "Select Level"),
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
                print(newdata);
                widget.instance.isEmpty
                    ? pushData(section, newdata).then((onValue) {
                        Navigator.of(context).pop();
                        Navigator.of(context).pop();
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (_) => EditSection(section)));
                      })
                    : updateData(section, newdata, widget.instance)
                        .then((onValue) {
                        Navigator.of(context).pop();
                        Navigator.of(context).pop();
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (_) => EditSection(section)));
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
