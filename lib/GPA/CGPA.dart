import 'package:cgpa_app/GPA/Calculation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Cgpa extends StatefulWidget {
  @override
  _CgpaState createState() => _CgpaState();
}

init(List list) {
  var i;
  for (i = 0; i < 8; i++) {
    list[i] = "Select";
  }
}

bool initBool = false;
List semesterGPA = [];
List currentCreditSelected = [];

class _CgpaState extends State<Cgpa> {


  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var credits = ["Select", "19", "20", "21", "22", "23", "24", "25", "26"];
    semesterGPA.length = 8;
    currentCreditSelected.length = 8;

    if (!initBool) {
      init(currentCreditSelected);
      initBool = !initBool;
    }
    // print(currentGradeSelected);
    return Scaffold(
      appBar: AppBar(
        title: Text("CGPA Calculator"),
      ),
      body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Form(
                    key: _formKey,
                    child: Flexible(
                      fit: FlexFit.loose,
                      child: Container(
                        // height: MediaQuery.of(context).size.height * 0.65,
                        child: Column(
                          children: [
                            Container(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    alignment: Alignment(0, 0),
                                    width: MediaQuery.of(context).size.width *
                                        0.35,
                                    height: 30,
                                    color: Colors.blue,
                                    padding: EdgeInsets.only(left: 5),
                                    child: Text(
                                      'Semester',
                                      style: TextStyle(fontSize: 20),
                                    ),
                                    margin: EdgeInsets.fromLTRB(2, 4, 2, 4),
                                  ),
                                  Container(
                                    alignment: Alignment(0, 0),
                                    width:
                                        MediaQuery.of(context).size.width * 0.3,
                                    height: 30,
                                    color: Colors.blue,
                                    child: Text(
                                      'SGPA',
                                      style: TextStyle(fontSize: 20),
                                    ),
                                    margin: EdgeInsets.fromLTRB(2, 4, 2, 4),
                                  ),
                                  Container(
                                    alignment: Alignment(0, 0),
                                    width:
                                        MediaQuery.of(context).size.width * 0.3,
                                    height: 30,
                                    color: Colors.blue,
                                    child: Text(
                                      'Credit',
                                      style: TextStyle(fontSize: 20),
                                    ),
                                    margin: EdgeInsets.fromLTRB(2, 4, 2, 4),
                                  ),
                                ],
                              ),
                            ),
                            Flexible(
                              fit: FlexFit.loose,
                              child: ListView.builder(
                                  itemCount: 8,
                                  itemBuilder: (context, index) {
                                    return Container(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Container(
                                            alignment: Alignment(0, 0),
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.35,
                                            padding: EdgeInsets.only(left: 5),
                                            height: 60,
                                            color: Colors.blue,
                                            child: Text(
                                              'Semester ${index + 1}',
                                              style: TextStyle(fontSize: 20),
                                            ),
                                            margin:
                                                EdgeInsets.fromLTRB(2, 4, 2, 4),
                                          ),
                                          Container(
                                            alignment: Alignment(0, 0),
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.3,
                                            height: 60,
                                            // color: Colors.blue,
                                            margin:
                                                EdgeInsets.fromLTRB(2, 4, 2, 4),
                                            child: TextFormField(
                                                decoration: InputDecoration(
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                          borderSide: BorderSide(
                                                              color: Colors
                                                                  .indigoAccent)),
                                                  border: OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color: Colors.blue)),
                                                ),
                                                onSaved: (value) {
                                                  semesterGPA[index] =
                                                      double.tryParse(value);
                                                },
                                                textAlign: TextAlign.center,
                                                cursorWidth: 1,
                                                initialValue: "0",
                                                keyboardType:
                                                    TextInputType.number,
                                                validator: (String value) {
                                                  var x =
                                                      double.tryParse(value);
                                                  if (x > 10)
                                                    return 'Error: SGPA >10';
                                                  else
                                                    return null;
                                                }),
                                          ),
                                          Container(
                                            alignment: Alignment(0, 0),
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.3,
                                            height: 60,
                                            color: Colors.blue,
                                            child: DropdownButton<String>(
                                              dropdownColor: Colors.green[100],
                                              icon: Icon(Icons.arrow_drop_down),
                                              items: credits.map(
                                                  (String dropDownStringItem) {
                                                return DropdownMenuItem<String>(
                                                  value: dropDownStringItem,
                                                  child: Text(
                                                    dropDownStringItem,
                                                    style: TextStyle(
                                                        fontSize: 20,
                                                        fontWeight:
                                                            FontWeight.w600),
                                                  ),
                                                );
                                              }).toList(),
                                              value:
                                                  currentCreditSelected[index],
                                              onChanged:
                                                  (String newValueSelected) {
                                                // Your code to execute, when a menu item is selected from drop down
                                                setState(() {
                                                  currentCreditSelected[index] =
                                                      newValueSelected;
                                                });
                                              },
                                            ),
                                            margin:
                                                EdgeInsets.fromLTRB(2, 4, 2, 4),
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
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 20, 0, 20),
                    child: MaterialButton(
                      onPressed: () {
                        if (_formKey.currentState.validate()) {
                          _formKey.currentState.save();
                          List credit = creditChanger(currentCreditSelected, 8);
                          var newValue = calculator(semesterGPA, credit, 8);
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                    title: Text('CGPA Calculator', style: TextStyle(fontWeight: FontWeight.w700),),
                                    content: Text(
                                      "CGPA : ${newValue.toStringAsFixed(2)}",
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
                        }
                      },
                      color: Colors.blue[500],
                      child: Text(
                        "Calculate CGPA",
                      ),
                    ),
                  )
                ],
              ),
            ),
    );
  }
}
