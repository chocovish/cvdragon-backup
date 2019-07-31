
import 'package:cvdragonapp_v1/localdatapush.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:nice_button/nice_button.dart';
import '../../localdatapush.dart' show updateData;
import '../myFormFields.dart';
import '../../edit_section.dart';

class AssociatedMembersForm extends StatefulWidget {
  Map instance;

  AssociatedMembersForm({Map i}) : instance = i ?? {};

  @override
  _AssociatedMembersFormState createState() => _AssociatedMembersFormState();
}

class _AssociatedMembersFormState extends State<AssociatedMembersForm> {
  final section = "51116";
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
            myTextField("position",
                initialValue: widget.instance["position"]),
            myTextField("location",
                initialValue: widget.instance["location"]),
           
            Row(
              children: <Widget>[
                myDateField("dateJoining",
                    initialValue: widget.instance["dateJoining"]),
                myDateField("dateLeaving",
                    initialValue: widget.instance["dateLeaving"]),
              ],
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
                newdata["dateJoining"] =
                    newdata["dateJoining"].toString().split(" ")[0];
                newdata["dateLeaving"] =
                    newdata["dateLeaving"].toString().split(" ")[0];
                
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
