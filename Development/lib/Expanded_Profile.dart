import 'package:flutter/material.dart';

class ExpansionPanelListDemo extends StatefulWidget {
  ExpansionPanelListDemo({Key key}) : super(key: key);
  @override
  _ExpansionPanelListDemoState createState() => _ExpansionPanelListDemoState();
}

class _ExpansionPanelListDemoState extends State<ExpansionPanelListDemo> {
  final items = List<String>.generate(5, (i) => "Item ${i + 1}");

   final monVal = ValueNotifier(false);
  var currentPanelIndex = -1;

  List<int> mList;
  List<ExpandStateBean> expandStateList;

  _ExpansionPanelListDemoState() {
    mList = new List();
    expandStateList = new List();
      mList.add(0);
      expandStateList.add(ExpandStateBean(0, false));
    
  }

  _setCurrentIndex(int index, isExpand) {
    setState(() {
      expandStateList.forEach((item) {
        if (item.index == index) {
          item.isOpen = !isExpand;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("expansion panel list"),
        ),
        body: ListView.builder(itemCount: items.length,
            itemBuilder: (context, index) {
              var item = items[index];
              return 
              Dismissible(
                // Specify the direction to swipe and delete
                direction: DismissDirection.endToStart,
                key: Key(item),
                onDismissed: (direction) {
                  // Removes that item the list on swipwe
                  // setState(() {
                  //   items.removeAt(index);
                  // });
                  // Shows the information on Snackbar
                  Scaffold.of(context)
                      .showSnackBar(SnackBar(content: Text("$item dismissed")));
                },
                background: Container(color: Colors.red),
              
          child: 
          
          ExpansionPanelList(
            expansionCallback: (index, bol) {
              _setCurrentIndex(index, bol);
            },
            children: 
                                    
            
            mList.map((index) {
              return 
              ExpansionPanel(
                canTapOnHeader: true,
                headerBuilder: (context, isExpanded) {
                  return   ListTile(
                    title: new Text('This is NO. $index'),
                   ) ;
                },
                body: Container(
            padding: EdgeInsets.only(bottom: 20),
            height: MediaQuery.of(context).size.height / 1.9,
            child: Scrollbar(
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: 10,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(title: Text("abc"),trailing: 
                                                ValueListenableBuilder(
                                                    valueListenable: monVal,
                                                    builder: (context, val, child) {
                                                      return Checkbox(
                                                        value: val,
                                                        onChanged: (c) {
                                                          monVal.value = c;
                                                        },
                                                      );
                                                    }),
                   
                 
                  );
                },
              ),
            ),
          ),
                isExpanded: expandStateList[index].isOpen,
              );
            }).toList(),
          ));}
        ));
  }
}

class ExpandStateBean {
  var isOpen;
  var index;
  ExpandStateBean(this.index, this.isOpen);
}