/*
* * * * * * *
 * * * * * *
  * * * * *
   * * * *
    * * *
     * *
      *
 */


import 'dart:io';

void main(){
  for(int i=7;i>=1;i--){
    for(int j=i;j<=6;j++){
      stdout.write(" ");
    }
    for(int j=1;j<=i;j++){
      stdout.write("* ");
    }
    stdout.writeln();
  }
}