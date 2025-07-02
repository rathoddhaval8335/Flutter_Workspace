import 'dart:io';

void main(){
  int fdigit=0;
  int ldigit=0;
  int sum=0;
  int num;

  print("Enter Any Number:");
  num=int.parse(stdin.readLineSync().toString());

  ldigit=num%10;

  while(num>0){

    if(num>9){
      num=num~/10;
    }
    fdigit=num;
    num=num~/10;

  }
  sum=fdigit+ldigit;
  print("Sum=$sum");
}