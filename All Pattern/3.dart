/*
54321
2345
543
45
5
 */
import 'dart:io';

void main(){
  for(int i=0;i<5;i++){
    if(i%2==0){
      for(int j=5;j>i;j--){
        stdout.write(j);
      }
    }else{
      for(int k=i+1;k<=5;k++){
        stdout.write(k);
      }
    }
    stdout.writeln();
  }
}