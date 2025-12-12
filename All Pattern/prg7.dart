// import 'dart:io';
//
// void main(){
//   int i,j;
//   for(i=1;i<=7;i++){
//     for(j=7;j>=i;j--){
//       stdout.write(j);
//     }
//     stdout.writeln();
//   }
// }

import 'dart:io';

void main(){
  int i,j;
  for(i=1;i<=4;i++){
    for(j=4;j>=i;j--){
      stdout.write("$j ");
    }
    stdout.writeln();
  }
}