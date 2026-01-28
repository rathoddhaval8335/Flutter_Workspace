/*
1234
123
12
1
 */

import 'dart:io';

void main(){
  for(int i=4;i>=1;i--){
    for(int j=1;j<=i;j++){
      stdout.write(j);
    }
    stdout.writeln();
  }
}