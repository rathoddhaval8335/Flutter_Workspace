import 'dart:io';

void main(){

  int num, sum=0;
  print("Enter Any Number:");
  num=int.parse(stdin.readLineSync().toString());

  while(num>0){
    int rem=num%10;
    sum=sum+rem;
    num=num~/10;
  }
  print("Sum=$sum");
}