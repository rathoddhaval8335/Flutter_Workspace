import 'dart:io';

void main(){
  int i,j;
  for(i=6;i>=1;i--){
    for(j=i;j<=6;j++){
      stdout.write(j);
    }
    stdout.writeln();
  }
}