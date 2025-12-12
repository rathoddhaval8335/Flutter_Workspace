// import 'dart:ffi';
// import 'dart:io';
//
// void main(){
//
//   var ch=65;
//   for(int i=1;i<=5;i++){
//     for(int j=1;j<=i;j++){
//       stdout.write(String.fromCharCode(ch));
//       ch++;
//     }
//
//     stdout.writeln();
//   }
// }


// import 'dart:io';
//
// void main(){
//   String str="";
//   print("Enter Any String:");
//   str=stdin.readLineSync().toString();
//
//   String orignal_str=str;
//   String rev="";
//
//   for(int i=str.length-1;i>=0;i--){
//     rev+=str[i];
//   }
//   if(orignal_str==rev){
//     print("String Is Palidrone");
//   }else{
//     print("String Is Not Palidrone");
//   }
// }

// import 'dart:io';
//
// void main()
// {
//   int num,sum=0;
//
//   print("Enter Any Number");
//   num = int.parse(stdin.readLineSync().toString());
//
//   while(num>0)
//   {
//     int rem = num % 10;
//     sum+=rem;
//     num = num ~/ 10;
//
//   }
//   print("Sum of all digits are : $sum");
//
//
// }

// import 'dart:io';
//
// void main(){
//   int num,lastdigit=0;
//
//   print("Enter Any Number");
//   num=int.parse(stdin.readLineSync().toString());
//
//   while(num>0){
//     int rem=num % 10;
//     lastdigit=(lastdigit*10) + rem;
//     num=num~/10;
//   }
//   print("Reverse No:$lastdigit");
// }

// import 'dart:io';
//
// void main(){
//   int num,max=0;
//
//   print("Enter Any Number:");
//   num=int.parse(stdin.readLineSync().toString());
//
//   while(num>0){
//     int rem=num%10;
//     if (max<rem){
//       max=rem;
//     }
//     num=num~/10;
//   }
//   print("Max Num Is:$max");
// }

// import 'dart:io';
//
// void main(){
//   int num,min=9;
//
//   print("Enter Any Number:");
//   num=int.parse(stdin.readLineSync().toString());
//
//   while(num>0){
//     int rem=num%10;
//     if (min>rem){
//       min=rem;
//     }
//     num=num~/10;
//   }
//   print("Max Num Is:$min");
// }

import 'dart:io';

void main(){
  int num,sum=0,max=0,min=9,ld=0;
  print("Enter Any Number:");
  num=int.parse(stdin.readLineSync().toString());

  int rev=num;

  while(num>0){
    int rem=num%10;
    sum+=rem;
    if(max<rem){
      max=rem;
    }
    if(min>rem){
      min=rem;
    }

    ld=ld*10+rem;
    num=num~/10;
  }
  print("Sum Is:$sum");
  print("Max Is:$max");
  print("Min Is:$min");

  print("revse no:$ld");

  if(rev==ld){
    print("Number Is Palid");
  }else{
    print("Num Is Not Palid");
  }
}