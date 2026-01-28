/*
* * * * * * *
 * * * * *
  * * *
    *
 */
import 'dart:io';

void main(){
  for(int i=3;i>=0;i--){
    for(int s=3;s>i;s--){
      stdout.write("  ");
    }
    for(int j=1;j<=(i*2+1);j++){
      stdout.write("* ");
    }
    stdout.writeln();
  }
}