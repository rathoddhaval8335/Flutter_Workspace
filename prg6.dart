import 'dart:io';

void main(){
  var num;
  print("Enter Any Number:");
  num=int.parse(stdin.readLineSync().toString());

  for(int i=1;i<=10;i++){
    var ans=num*i;
    print("$num * $i =$ans");
  }
}