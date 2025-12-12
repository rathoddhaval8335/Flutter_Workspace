//7 6 5 4 3 2 1
//7 6 5 4 3 2
//7 6 5 4 3
//7 6 5 4
//7 6 5
//7 6
//7

import 'dart:io';

void main(){
  for(int i=1;i<=7;i++){
    for(int j=7;j>=i;j--){
      stdout.write(j);
    }
    stdout.writeln();
  }
}