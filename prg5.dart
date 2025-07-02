import 'dart:io';

void main(){
  int n;
  int a=0,b=1;
  print("Enter Any Number");
  n=int.parse(stdin.readLineSync().toString());

  for(int i=0;i < n;i++){
    print(a);
    int next=a+b;
    a=b;
    b=next;
  }
}