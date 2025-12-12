import 'dart:io';

void main(){
  for(int i=1;i<=5;i++){
    for(int j=5;j>i;j--){
       stdout.write(" ");
    }
    for(int j=1;j<=i;j++){
      stdout.write("*");
    }
    stdout.writeln();
  }
}

//
//  import 'dart:io';
//
// void main(){
//   for(int i=1;i<=5;i++){
//     for(int j=i;j<5;j++){
//       stdout.write(" ");
//     }
//     for(int j=1;j<=i;j++){
//       stdout.write("*");
//     }
//     stdout.writeln();
//   }
// }
