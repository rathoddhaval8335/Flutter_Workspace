import 'dart:io';

void main(){

  for(int i=1;i<=5;i++){
    int charcode=65;
    for(int j=1;j<=i;j++){
      stdout.write(String.fromCharCode(charcode));
      charcode++;
    }

    stdout.writeln();
  }
}