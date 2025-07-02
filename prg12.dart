import 'dart:io';

void main(){
  int ch,a,b;

  print("Enter Number 1:");
  a=int.parse(stdin.readLineSync().toString());

  print("Enter Number 2:");
  b=int.parse(stdin.readLineSync().toString());

  print("Enter Your Choice:");
  ch=int.parse(stdin.readLineSync().toString());
  switch(ch){
    case 1:
      int ans=a+b;
      print("Sum:$ans");

    case 2:
      int ans=a-b;
      print("Sub:$ans");

    case 3:
      int ans=a*b;
      print("Multi:$ans");

    case 4:
      int ans=a~/b;
      print("Div:$ans");

    default:
      print("Invalid Choice");
  }
}