// import 'dart:io';
//
// void main(){
//   int i,j,k;
//   for(i=1;i<=5;i++){
//     for(j=i;j>=1;j--){
//       stdout.write(j);
//     }
//     for(k=i;k>=1;k--){
//       stdout.write(k);
//     }
//     stdout.writeln();
//   }
// }

import 'dart:io';

void main(){
  int i,j,k;
  for(i=1;i<=4;i++){
    for(j=4;j>i;j--){
      stdout.write(" ");
    }
    for(k=1;k<=i;k++){
      stdout.write("$k ");
    }
    stdout.writeln();
  }
  for(i=3;i>=1;i--){
    for(j=4;j>i;j--){
      stdout.write(" ");
    }
    for(k=1;k<=i;k++){
      stdout.write("$k ");
    }
    stdout.writeln();
  }
}