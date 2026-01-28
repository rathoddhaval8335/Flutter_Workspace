/*
      4
     43
    432
   4321
 */

import 'dart:io';

void main(){
  for(int i=4;i>=1;i--){
    for(int j=i;j>1;j--){
      stdout.write(" ");
    }
    for(int j=4;j>=i;j--){
      stdout.write(j);
    }
    stdout.writeln();
  }
}