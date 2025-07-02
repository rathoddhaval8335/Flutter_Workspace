import 'dart:io';

void main(){
  var num;
  print("Enter Any Number:");
  num=int.parse(stdin.readLineSync().toString());

  var Reversno=0;

  while(num>0){
    int rem=num%10;
    Reversno=Reversno*10+rem;
    num=num~/10;
  }
  print(Reversno);
}