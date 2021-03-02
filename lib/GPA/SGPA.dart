import 'package:cgpa_app/GPA/Calculation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Sgpa extends StatefulWidget {
  @override
  _SgpaState createState() => _SgpaState();
}

init(List list,List list1){
  var i;
  for(i=0;i<10;i++){
    list[i]="Select";
    list1[i]="Select";
  }
}
bool initBool = false;
List currentGradeSelected = [];
List currentCreditSelected = [];

class _SgpaState extends State<Sgpa> {
  var valueGPA;
  void changeValue(var newValue){
    setState(() {
      valueGPA = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    var grades = ["Select","O","A+","A","B+","B","C","P","F","FE"],
        credits = ["Select","1","2","3","4","5","6","7"];
    currentGradeSelected.length = 10;
    currentCreditSelected.length = 10;
    if(valueGPA == null){
      valueGPA = 0.0;
    }
    if(!initBool){
      init(currentGradeSelected, currentCreditSelected);
      initBool = !initBool;
    }
    // print(currentGradeSelected);
    return Scaffold(
      appBar: AppBar(
        title: Text("SGPA Calculator"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Flexible(
              fit: FlexFit.loose,
              child: Container(
                height: MediaQuery.of(context).size.height*0.85,
                child: Column(
                  children: [
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            alignment: Alignment(0,0),
                            width: MediaQuery.of(context).size.width*0.35,
                            height: 30,
                            color: Colors.blue,
                            padding: EdgeInsets.only(left: 5),
                            child: Text('Subject',
                              style: TextStyle(
                                  fontSize: 20
                              ),),
                            margin: EdgeInsets.fromLTRB(2, 4, 2, 4),
                          ),
                          Container(
                            alignment: Alignment(0,0),
                            width: MediaQuery.of(context).size.width*0.3,
                            height: 30,
                            color: Colors.blue,
                            child: Text('Grade',
                            style: TextStyle(
                              fontSize: 20
                            ),),
                            margin: EdgeInsets.fromLTRB(2, 4, 2, 4),
                          ),
                          Container(
                            alignment: Alignment(0,0),
                            width: MediaQuery.of(context).size.width*0.3,
                            height: 30,
                            color: Colors.blue,
                            child: Text('Credit',
                              style: TextStyle(
                                  fontSize: 20
                              ),),
                            margin: EdgeInsets.fromLTRB(2, 4, 2, 4),
                          ),
                        ],
                      ),
                    ),
                    Flexible(
                      fit: FlexFit.loose,
                      child: ListView.builder(
                          itemCount: 10,
                          itemBuilder: (context, index){
                            return Container(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    alignment: Alignment(0,0),
                                    width: MediaQuery.of(context).size.width*0.35,
                                    padding: EdgeInsets.only(left: 5),
                                    height: 45,
                                    color: Colors.blue,
                                    child: Text('Subject ${index+1}',
                                      style: TextStyle(
                                          fontSize: 20
                                      ),),
                                    margin: EdgeInsets.fromLTRB(2, 4, 2, 4),
                                  ),
                                  Container(
                                    alignment: Alignment(0,0),
                                    width: MediaQuery.of(context).size.width*0.3,
                                    height: 45,
                                    color: Colors.blue,
                                    child: DropdownButton<String>(
                                      dropdownColor: Colors.green[100],
                                      icon: Icon(Icons.arrow_drop_down),
                                      items: grades.map((String dropDownStringItem) {
                                        return DropdownMenuItem<String>(
                                          value: dropDownStringItem,
                                          child: Text(
                                            dropDownStringItem,
                                            style: TextStyle(
                                                fontSize: 20, fontWeight: FontWeight.w600),
                                          ),
                                        );
                                      }).toList(),
                                      value: currentGradeSelected[index],
                                      onChanged: (String newValueSelected) {
                                        // Your code to execute, when a menu item is selected from drop down
                                        setState(() {
                                          currentGradeSelected.removeAt(index);
                                          currentGradeSelected.insert(index, newValueSelected);
                                        });
                                      },
                                    ),
                                    margin: EdgeInsets.fromLTRB(2, 4, 2, 4),
                                  ),
                                  Container(
                                    alignment: Alignment(0,0),
                                    width: MediaQuery.of(context).size.width*0.3,
                                    height: 45,
                                    color: Colors.blue,
                                    child: DropdownButton<String>(
                                      dropdownColor: Colors.green[100],
                                      icon: Icon(Icons.arrow_drop_down),
                                      items: credits.map((String dropDownStringItem) {
                                        return DropdownMenuItem<String>(
                                          value: dropDownStringItem,
                                          child: Text(
                                            dropDownStringItem,
                                            style: TextStyle(
                                                fontSize: 20, fontWeight: FontWeight.w600),
                                          ),
                                        );
                                      }).toList(),
                                      value: currentCreditSelected[index],
                                      onChanged: (String newValueSelected) {
                                        // Your code to execute, when a menu item is selected from drop down
                                        setState(() {
                                          currentCreditSelected[index] = newValueSelected;
                                        });
                                      },
                                    ),
                                    margin: EdgeInsets.fromLTRB(2, 4, 2, 4),
                                  ),
                                ],
                              ),
                            );
                          }),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 20, 0, 20),
              child: MaterialButton(
                  onPressed:() {
                    List grade = gradePoint(currentGradeSelected);
                    List credit = creditChanger(currentCreditSelected, 10);
                    var newValue = calculator(grade, credit, 10);
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                              title: Text('SGPA Calculator', style: TextStyle(fontWeight: FontWeight.w700),),
                              content: Text(
                                "SGPA : ${newValue.toStringAsFixed(2)}",
                                textAlign: TextAlign.center,
                                style: TextStyle(color: Colors.green,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 22),
                              ),
                              actions: [
                                FlatButton(
                                    onPressed: () =>
                                        Navigator.pop(context),
                                    child: Text(
                                      'OK',
                                      style:
                                      TextStyle(color: Colors.black),
                                    )),
                              ]);
                        });
                  },
                color: Colors.blue[500],
                child: Text(""
                    "Calculate SGPA",
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
