// import 'dart:io';
//
// void main(){
//   int ch=65;
//   for(int i=1;i<=5;i++){
//     for(int j=1;j<=i;j++){
//       stdout.write(String.fromCharCode(ch));
//
//     }
//     ch++;
//     stdout.writeln();
//   }
// }
//
// import 'dart:io';
//
// void main(){
//   String a;
//   stdout.write("Enter Any Words:");
//   a=stdin.readLineSync().toString();
//
//   for(int i=0;i<=a.length-1;i++){
//     for(int j=0;j<=i;j++){
//       stdout.write(a[j]);
//     }
//     stdout.writeln();
//   }
// }

// import 'dart:io';
//
// void main(){
//   int num,sum=0;
//   stdout.write("Enter Any Number");
//   num=int.parse(stdin.readLineSync().toString());
//
//   while(num>0){
//     int rem=num % 10;
//     sum+=rem;
//     num=num ~/ 10;
//   }
//   stdout.write("Number Of Sum:$sum");
//
// }

// import 'dart:io';
//
// void main(){
//   int num,max=0;
//   stdout.write("Enter Any Num");
//   num=int.parse(stdin.readLineSync().toString());
//
//   while(num>0){
//     int rem=num %10;
//     if(max<rem){
//       max=rem;
//     }
//     num = num ~/ 10;
//   }
//   stdout.write("Max Number Is:$max");
// }

// import 'dart:io';
//
// void main(){
//   int num,min=9;
//   stdout.write("Enter Any Words");
//   num=int.parse(stdin.readLineSync().toString());
//
//   while(num>0){
//     int rem =num % 10;
//     if(min>rem){
//       min=rem;
//     }
//     num = num ~/ 10;
//
//   }
//
//   print("Min Num Is:$min");
//
// }

// import 'dart:io';
//
// void main(){
//   int num,ld=0;
//   stdout.writeln("Enter Any Number:");
//   num=int.parse(stdin.readLineSync().toString());
//   while(num>0){
//     int rem = num % 10;
//     ld = ld * 10 + rem;
//     num = num ~/ 10;
//   }
//   print("Num Is : $ld");
// }

// import 'dart:io';
//
// void main(){
//   int num,ld=0,orignal_num;
//   stdout.writeln("Enter Any Number:");
//   num=int.parse(stdin.readLineSync().toString());
//
//   orignal_num=num;
//   while(num>0){
//     int rem = num % 10;
//     ld = ld * 10 + rem;
//     num = num ~/ 10;
//   }
//   print("Reverse Num is : $ld");
//
//   if(ld==orignal_num){
//     print("Num Is Palidarome");
//   }else{
//     print("Num Is Not Palid");
//   }
// }

import 'dart:io';

void main(){
  String str;
  stdout.write("Enter Any String:");
  str=stdin.readLineSync().toString();

  String or_str=str;
  String rev="";

  for(int i=str.length-1;i>=0;i--){
    rev+=str[i];
  }
  print("Reverse Strin Is :$rev");

  if(or_str==rev){
    print("Strin Is Palid");
  }else{
    print("String Is Not Palid");
  }
}