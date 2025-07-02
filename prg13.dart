import 'dart:io';

void main(){

  int ch;
  print("Enter your Choice:");
  ch=int.parse(stdin.readLineSync().toString());

  switch(ch){

    case 1:
      double b,h;
      double ans;
      print("Enter Base:");
      b=double.parse(stdin.readLineSync().toString());

      print("Enter Height:");
      h=double.parse(stdin.readLineSync().toString());

      ans=0.5* b* h;
      print("Area Of Triangle:$ans");

    case 2:
      double l,w;
      double ans;
      print("Enter Length:");
      l=double.parse(stdin.readLineSync().toString());

      print("Enter Width:");
      w=double.parse(stdin.readLineSync().toString());

      ans=l* w;
      print("Area Of Rectangle:$ans");

    case 3:
      double r;
      double ans;

      print("Enter Radius:");
      r=double.parse(stdin.readLineSync().toString());

      ans=3.14*r*r;
      print("Area Of Circle:$ans");

    default:
      print("Invalid Choice");
  }
}