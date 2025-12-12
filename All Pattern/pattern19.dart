import 'dart:ffi';
import 'dart:io';

void main(){

  var ch=65;
  for(int i=1;i<=5;i++){
    for(int j=1;j<=i;j++){
      stdout.write(String.fromCharCode(ch));
      ch++;
    }

    stdout.writeln();
  }
}

// import 'dart:io';
//
// void main(){
//   String str;
//   print("Enter Any String");
//   str=stdin.readLineSync().toString();
//
//   String rev="";
//   String orignal=str;
//
//   for(int i=str.length-1;i>=0;i--){
//     rev+=str[i];
//   }
//   if(orignal==rev){
//     print("String Is Palidrome");
//   }else{
//     print("String Is Not Palidrome");
//   }
//
//   print("Reverese string=$rev");
// }