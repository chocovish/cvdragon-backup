
import 'package:cvdragonapp_v1/localdatapush.dart';
import 'package:cvdragonapp_v1/vishal/myFormFields.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:nice_button/nice_button.dart';
import '../../localdatapush.dart' show updateData;
import '../myFormFields.dart';
//import 'package:flutter_html/flutter_html.dart';


class IntroductionForm extends StatefulWidget {
  Map instance;

  IntroductionForm({Map i}) : instance = i ?? {};

  @override
  _IntroductionFormState createState() => _IntroductionFormState();
}

class _IntroductionFormState extends State<IntroductionForm> {
  final section = "51103";
   GlobalKey<FormBuilderState> _formKey;

  @override
  void initState() {
    _formKey =  GlobalKey<FormBuilderState>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(widget.instance);
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context,bool ibs)=>[
          SliverAppBar(
            backgroundColor: Colors.blue,
            expandedHeight: 150.0,
            floating: false,
            pinned: true,
            flexibleSpace: Container(decoration: BoxDecoration(gradient: LinearGradient(colors: 
            [    Color(0xff2727ff),
                      Color(0xff00003b),])),
              child: FlexibleSpaceBar(title: Text("Introduction"),centerTitle: true,)),
          )
        
          
        ],
          body: Container(
        color: Colors.white,
        
        child: FormBuilder(
          key: _formKey,
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Introduction"),
              ),
              myTextField("title",initialValue: widget.instance["title"]),
              myTextField("introduction",maxLines: 6,initialValue: widget.instance["introduction"]),
              //Container( child: Html(data: widget.instance["introduction"],),),
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
                          //Navigator.of(context).pop();
                          //Navigator.of(context).push(MaterialPageRoute(builder: (_)=>EditSection(section)));
                        })
                      : updateData(section, newdata, widget.instance)
                          .then((onValue) {
                          Navigator.of(context).pop();
                          //Navigator.of(context).pop();
                          //Navigator.of(context).push(MaterialPageRoute(builder: (_)=>EditSection(section)));
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
    );
  }
}
