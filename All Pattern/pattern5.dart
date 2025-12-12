import 'dart:io';

void main(){
  for(int i=1;i<=5;i++){
    for(int j=5;j>i;j--){
      stdout.write(" ");
    }
    for(int j=i;j>=1;j--){
      stdout.write(j);
    }
    stdout.writeln();
  }
  for(int i=1;i<=5;i++){

    for(int j=i;j>=1;j--){
      stdout.write("$j ");
    }
    stdout.writeln();
  }

}