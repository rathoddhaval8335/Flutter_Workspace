import 'dart:io';

void main(){
  int i,j;
  for(i=7;i>=1;i--){
    for(j=i;j>=1;j--){
      stdout.write(j);
    }
    stdout.writeln();
  }
}