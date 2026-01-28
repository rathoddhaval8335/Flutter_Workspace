/*
********
***  ***
**    **
*      *
 */

import 'dart:io';

void main(){
  for(int i=4;i>=1;i--){
    for(int j=1;j<=i;j++){
      stdout.write("*");
    }
    for(int s=4;s>i;s--){
      stdout.write("  ");
    }
    for(int j=1;j<=i;j++){
      stdout.write("*");
    }
    stdout.writeln();
  }
}