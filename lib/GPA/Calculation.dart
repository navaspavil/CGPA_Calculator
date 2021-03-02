gradePoint(List gradeValues){
  var i;
  List gradePoint = [];
  gradePoint.length = 10;
  for(i=0;i<10;i++){
    if(gradeValues[i]=="O")
      gradePoint[i] = 10;
    else if(gradeValues[i]=="A+")
      gradePoint[i] = 9;
    else if(gradeValues[i]=="A")
      gradePoint[i] = 8.5;
    else if(gradeValues[i]=="B+")
      gradePoint[i] = 8;
    else if(gradeValues[i]=="B")
      gradePoint[i] = 7;
    else if(gradeValues[i]=="C")
      gradePoint[i] = 6;
    else if(gradeValues[i]=="P")
      gradePoint[i] = 5;
    else
      gradePoint[i]=0;
  }
/*  print(gradeValues);
  print(gradePoint);*/
return gradePoint;
}

creditChanger(List credit, n){
  List creditInInt= [];
  creditInInt.length = n;
  var i;
  for(i=0;i<n;i++){
    if(credit[i]!="Select")
      creditInInt[i]=int.parse(credit[i]);
    else
      creditInInt[i]=0;
  }
  // print(creditInInt);
  return creditInInt;
}

calculator(List grade, List credit, int n){
  var i;
  double intSum = 0,creditSum = 0, gpa;
  for(i=0;i<n;i++){
    intSum += credit[i]*grade[i];
    creditSum += credit[i];
  }
  gpa = intSum/creditSum;
  return intSum==0?0:gpa;
}

