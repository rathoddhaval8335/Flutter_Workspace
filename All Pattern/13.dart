import 'dart:io';

void main(){
  for(int i=1;i<=4;i++){
    for(int j=1;j<=i;j++){
      if((i+j)%2==0){
        stdout.write("*");
      }
      else{
        stdout.write("#");
      }
    }
    stdout.writeln();
  }
}