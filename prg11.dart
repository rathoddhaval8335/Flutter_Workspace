import 'dart:io';

void main(){
  
  var num;
  print("Enter Any Number:");
  num=int.parse(stdin.readLineSync().toString());
  
  switch(num){
    
    case 1:
      print("Monday");
      break;

    case 2:
      print("Tuesday");
      break;

    case 3:
      print("Wednesday");
      break;

    case 4:
      print("Thursday");
      break;

    case 5:
      print("Friday");
      break;

    case 6:
      print("Saturday");
      break;

    case 7:
      print("Sunday");
      break;

    default:
      print("Invalid Choice");
  }
  
}