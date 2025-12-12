//7 6 5 4 3 2 1
//6 5 4 3 2 1
//5 4 3 2 1
//4 3 2 1
//3 2 1
//2 1
//1

import 'dart:io';

void main(){
  for(int i=7;i>=1;i--){
    for(int j=i;j>=1;j--){
      stdout.write(j);
    }
    stdout.writeln();
  }
}