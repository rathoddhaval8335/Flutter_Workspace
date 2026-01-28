/*
    *
   * * *
  * * * * *
* * * * * * *
  * * * * *
   * * *
     *


 */

import 'dart:io';

void main(){
  for(int i=0;i<=3;i++){
    for(int k=2;k>=i;k--){
      stdout.write("  ");
    }
    for(int j=1;j<=(i*2+1);j++){
      stdout.write("* ");
    }
    stdout.writeln();
  }

  for(int i=2;i>=0;i--){
    for(int j=3;j>i;j--){
      stdout.write("  ");
    }
    for(int j=1;j<=(i*2+1);j++){
      stdout.write("* ");
    }
    stdout.writeln();
  }
}