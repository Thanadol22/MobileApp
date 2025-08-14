import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) => MaterialApp(
    home: MyHomePage(),
  );
}

class MyHomePage extends StatefulWidget {
  @override 
  State<MyHomePage> createState() => _MyHomePageState();
 
}

class _MyHomePageState extends State<MyHomePage> {
  var varEmail = TextEditingController();
  var varPWD = TextEditingController();
  var varName = TextEditingController();

  String varString = '';
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: Text('App 803'),),
    body:  Center(
      child: SizedBox(
        width: 350,
        child: Column(
          children: [
            SizedBox(height: 30,),
            Text('Email :'),
            textFieldEmail(),
            SizedBox(height: 20,),
            //Text('Password :'),
            textFieldPWD(),
            SizedBox(height: 20,),
            //Text('Name :'),
            textFieldName(),
            SizedBox(height: 40,),
            //Text('String :'),
            Text('$varString')
          ],
        ),
      ),
    ),
  );

  OutlineInputBorder outlineBorder() => const OutlineInputBorder(
    borderSide: BorderSide(
      color: Colors.grey,
      width: 2
    )
  );
  TextStyle textStyle() => const TextStyle(
    color: Colors.indigo,
    fontSize: 20,
    fontWeight: FontWeight.normal
  );

  Widget textFieldEmail() => TextField(
    controller: varEmail,
    decoration: InputDecoration(
      border: outlineBorder(),
      hintText: 'Email'
    ),
    keyboardType: TextInputType.emailAddress,
    style: textStyle(),
    onChanged: (text) => updateText(),
    onSubmitted: null,
  );

  Widget textFieldPWD() => TextField(
    controller: varPWD,
    decoration: InputDecoration(
      border: outlineBorder(),
      hintText: 'Password'
    ),
    obscureText: true,
    keyboardType: TextInputType.text,
    style: textStyle(),
    onChanged: (text) => updateText(),
    onSubmitted: null,
  );

  Widget textFieldName() => TextField(
    controller: varName,
    decoration: InputDecoration(
      border: outlineBorder(),
      hintText: 'Name'
    ),
    obscureText: true,
    keyboardType: TextInputType.text,
    style: textStyle(),
    onChanged: (text) => updateText(),
    onSubmitted: null,
  );

  void updateText() => setState((){
    varString = 'Email : ${varEmail.value.text}\n';
    varString += 'Password : ${varPWD.value.text}\n';
    varString += 'Name : ${varName.value.text}\n';
  });
 
}
