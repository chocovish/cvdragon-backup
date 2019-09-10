
import 'package:cvdragonapp_v1/localdatapush.dart';
import 'package:cvdragonapp_v1/vishal/myFormFields.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:nice_button/nice_button.dart';
import '../../localdatapush.dart' show updateData;
import '../myFormFields.dart';
import '../../profile_sections.dart' show ProfileSections;


class ContactDetailsForm extends StatefulWidget {
  Map instance;

  ContactDetailsForm({Map i}) : instance = i ?? {};

  @override
  _ContactDetailsFormState createState() => _ContactDetailsFormState();
}

class _ContactDetailsFormState extends State<ContactDetailsForm> {
  final section = "51101";
   GlobalKey<FormBuilderState> _formKey;

  @override
  void initState() {
    _formKey =  GlobalKey<FormBuilderState>();
    print("calling from inuit state");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(" contact details incoming data is: ${widget.instance}");
    return Scaffold(
      
           body :NestedScrollView(
             headerSliverBuilder: (context, bool ibs)=>[
               SliverAppBar(
                 backgroundColor: Colors.blue,
                 expandedHeight: 150.0,
                 floating: false,
                 pinned: true,
                flexibleSpace: Container(decoration: BoxDecoration(gradient: LinearGradient(colors: 
            [    Color(0xff2727ff),
                      Color(0xff00003b),])),
              child: FlexibleSpaceBar(title: Text("Contact Details"),centerTitle: true,)),
          )
        ],
          body: Container(
        color: Colors.white,
        height: MediaQuery.of(context).size.height,
        
        child: FormBuilder(
          key: _formKey,
          child: SingleChildScrollView(
                    child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(14.0),
                    child: Text("ContactDetails"),
                  ),
                  myTextField("emailAddress",initialValue: widget.instance["emailAddress"]),
                  myTextField("phoneNumber",initialValue: widget.instance["phoneNumber"]),
                  myTextField("location",initialValue: widget.instance["location"]),
                  myTextField("fullAddress",maxLines: 6,initialValue: widget.instance["fullAddress"]),
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
                    
                   // Navigator.of(context).push(MaterialPageRoute(builder: (_)=>EditSection(section)));
                  })
                : updateData(section, newdata, widget.instance)
                    .then((onValue) {
                    Navigator.of(context).pop();
                    Navigator.of(context).pop();
                    
                    Navigator.of(context).push(MaterialPageRoute(builder: (_)=>ProfileSections()));
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
      ),
    ),
    );
  }
}
