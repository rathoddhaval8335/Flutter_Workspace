import 'dart:io';

void main(){
  for(int i=5;i>=1;i--){
    for(int j=1;j<=i;j++){
      stdout.write("*");
    }
    for(int j=4;j>=i;j--){
      stdout.write("  ");
    }

    for(int j=1;j<=i;j++){
      stdout.write("*");
    }
    stdout.writeln();
  }

  for(int i=1;i<=5;i++){
    for(int j=1;j<=i;j++){
      stdout.write("*");
    }
    for(int j=5;j>i;j--){
      stdout.write("  ");
    }
    for(int j=1;j<=i;j++){
      stdout.write("*");
    }
    stdout.writeln();
  }
}