import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:test123/20-8/radioex2.dart';

class RadioButtonEx extends StatefulWidget {
  const RadioButtonEx({super.key});

  @override
  State<RadioButtonEx> createState() => _RadioButtonExState();
}
enum Operator {addition,subtraction,multification,division}
class _RadioButtonExState extends State<RadioButtonEx> {

  double ans=0;
  TextEditingController val1=new TextEditingController();
  TextEditingController val2=new TextEditingController();
  Operator _result=Operator.addition;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("RadioButton Ex"),
        backgroundColor: Colors.red,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            children: [
              TextField(
                controller: val1,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Enter Value 1"
                ),
              ),
              SizedBox(height: 10,),
              TextField(
                controller: val2,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Enter Value 2"
                ),
              ),
              SizedBox(height: 10,),
              ListTile(
                title: Text("Addition"),
                leading: Radio(
                    value: Operator.addition,
                    groupValue: _result,
                    onChanged: (value){
                      setState(() {
                        _result=value!;
                        double a=double.parse(val1.text.toString());
                        double b=double.parse(val2.text.toString());
                        ans=a+b;
                        toastMessage(ans);
                      });
                    }
                ),
              ),
              SizedBox(height: 10,),
              ListTile(
                title: Text("Subtraction"),
                leading: Radio(
                    value: Operator.subtraction,
                    groupValue: _result,
                    onChanged: (value){
                      setState(() {
                        _result=value!;
                        double a=double.parse(val1.text.toString());
                        double b=double.parse(val2.text.toString());
                        ans=a-b;
                        toastMessage(ans);
                      });
                    }
                ),
              ),
              SizedBox(height: 10,),
              ListTile(
                title: Text("Multification"),
                leading: Radio(
                    value: Operator.multification,
                    groupValue: _result,
                    onChanged: (value){
                      setState(() {
                        _result=value!;
                        double a=double.parse(val1.text.toString());
                        double b=double.parse(val2.text.toString());
                        ans=a*b;
                        toastMessage(ans);
                      });
                    }
                ),
              ),
              SizedBox(height: 10,),
              ListTile(
                title: Text("Division"),
                leading: Radio(
                    value: Operator.division,
                    groupValue: _result,
                    onChanged: (value){
                      setState(() {
                        _result=value!;
                        int a=int.parse(val1.text.toString());
                        int b=int.parse(val2.text.toString());
                        ans=a/b;
                        toastMessage(ans);
                      });
                    }
                ),
              ),
              SizedBox(height: 20,),
              ElevatedButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>ColorChangeEx()));
              }, child: Text("Display Color"))
            ],
          ),
        ),
      ),
    );
  }

  void toastMessage(double val) {
    Fluttertoast.showToast(
        msg:"Result:$ans",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.blue,
        textColor: Colors.black,
        fontSize: 16.0
    );
  }
}
