import 'dart:io';

void main(){

  for(int i=1;i<=5;i++){
    for(int j=4;j>=i;j--){
       stdout.write(" ");
    }
    for(int j=i;j<=(i*2-1);j++){
       stdout.write(" $j");
    }
    stdout.writeln();
  }
}