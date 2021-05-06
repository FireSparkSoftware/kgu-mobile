import 'package:flutter/material.dart';
import 'package:flutter/Cupertino.dart';
import 'Home.dart';
import 'register.dart';
import 'dart:convert';
import 'dart:io';
import 'dart:async';
import 'package:http/http.dart' as http;
String token2="";
void main() {
  runApp(MyApp());
}
TextEditingController kMail = TextEditingController();
TextEditingController kPass = TextEditingController();
String returnM ='';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginDemo(),
    );
  }
}

class LoginDemo extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<LoginDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF3F6FF) ,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 60.0),
              child: Center(
                child: Container(
                    width: 200,
                    height: 150,
                    /*decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(50.0)),*/
                    child: Image.asset('asset/images/kgu.png')),
              ),
            ),
            Padding(
                //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                controller: kMail,

                decoration: InputDecoration(
                    filled: true,
                    fillColor: Color(0xffC3D0ED),
                    border: OutlineInputBorder(),
                    labelText: 'Mail',
                    hintText: 'abc@gmail.com'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 15, bottom: 15),
              //padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                controller: kPass,

                obscureText: true,
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Color(0xffC3D0ED),
                    border: OutlineInputBorder(),

                    labelText: 'Şifre',
                    hintText: '6 karakter!!!!'),
              ),
            ),

            Container(
              height: 50,
              width: 250,
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [Color(0xff374ABE), Color(0xff64B6FF)]), borderRadius: BorderRadius.circular(9)),
              child: CupertinoButton (

                onPressed: () {
                      sender();
                      sender();
                      final snackBar = SnackBar(content: Text(returnM));
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  if(returnM == "Successful") { //login state kontrolü//
                    Navigator.push(
                        context, MaterialPageRoute(builder: (_) => HomePage()));
                  }
                },
                child: Text(
                  'Giriş Yap',
                  style:
                  TextStyle(color: Colors.white),
                ),
              ),

            ),
            FlatButton(
              onPressed: (){
                            },
              child: Text(
                'Şifremi unuttum!',
                style: TextStyle(color: Colors.grey, fontSize: 15),
              ),
            ),
            SizedBox(
              height: 100,
            ),
            FlatButton(
              onPressed: (){
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => RegisterPage()));              },
              child: Text(
                'Hesabınız yok mu? Kayıt Olun',
                style: TextStyle(color: Colors.grey, fontSize: 15),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
sender() async {
  var jsonString = "";
  var response = await http.post(Uri.https('kguproject.herokuapp.com', '/api/users/signin'),//api adresi
    headers: {
      'Content-Type': "application/json",
    },
    body: jsonEncode({
      'email':kMail.text,
      'password':kPass.text
    }),)
      .then((response) {
      //  print(kMail.text); //debug içindir.
      //  print(kPass.text); //debug içindir.
    Map<String, dynamic> user = jsonDecode(response.body);
    returnM= user['message'];
    token2= user['token'];
    // print('message, ${user['message']}!'); //debug içindir.
    // print('message, ${user['token']}!'); //debug içindir.


  });


}