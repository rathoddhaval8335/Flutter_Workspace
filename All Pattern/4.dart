/*
4321
321
21
1
 */

import 'dart:io';

void main(){
  for(int i=1;i<=4;i++){
    for(int j=4;j>=i;j--){
      stdout.write(j);
    }
    stdout.writeln();
  }
}