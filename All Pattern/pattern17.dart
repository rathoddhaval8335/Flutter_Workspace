import 'dart:io';

void main(){
  String num;
  print("Enter Any Word:");
  num=stdin.readLineSync().toString();

  for(int i=0;i<num.length;i++){
    for(int j=0;j<=i;j++){
      stdout.write(num[j]);
    }
    stdout.writeln();
  }
}