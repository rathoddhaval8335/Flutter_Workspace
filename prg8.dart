import 'dart:io';

void main(){
  int num;
  int max=0;

  print("Enter Any Number");
  num=int.parse(stdin.readLineSync().toString());

  while(num>max){
    int rem=num%10;
    if(rem>max){
      max=rem;
    }
    num=num~/10;
  }
  print("Max Number:$max");
}