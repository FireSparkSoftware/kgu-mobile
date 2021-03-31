import 'package:flutter/material.dart';
import 'main.dart';
import 'dart:convert';
import 'dart:io';
import 'dart:async';
import 'package:http/http.dart' as http;

class RegisterPage extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}
TextEditingController kAdi = TextEditingController();
TextEditingController kSoyad = TextEditingController();
TextEditingController kMail = TextEditingController();
TextEditingController kPass = TextEditingController();
TextEditingController kPassR = TextEditingController();
String returnM ='';
class _RegisterState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffF3F6FF),
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
              padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 10),
              child: TextField(
                controller: kAdi,
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Color(0xffC3D0ED),
                    border: OutlineInputBorder(),
                    labelText: 'İsim',
                    hintText: 'İsimiz'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 10),
              child: TextField(
                controller: kSoyad,
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Color(0xffC3D0ED),
                    border: OutlineInputBorder(),
                    labelText: 'Soyad',
                    hintText: 'Soyadınız'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 10),
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
              padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 10),

              child: TextField(
                controller: kPass,
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Color(0xffC3D0ED),
                    border: OutlineInputBorder(),
                    labelText: 'Şifre',
                    hintText: '6 karakter!!!!'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 10),

              child: TextField(
                controller: kPassR,
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
                  color: Colors.blue, borderRadius: BorderRadius.circular(20)),
              child: FlatButton(

                onPressed: () {
                  sender();
                  final snackBar = SnackBar(content: Text(returnM));
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                },
                child: Text(
                  'Kayıt Ol',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              ),
            ),

        SizedBox(
              height: 10,
            ),
            FlatButton(
              onPressed: (){
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => LoginDemo()));              },
              child: Text(
                'Hesabınız var mı? Giriş Yapın!',
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

  var response = await http.post(Uri.https('kguproject.herokuapp.com', '/api/users/signup'),
    headers: {
      'Content-Type': "application/json",
    },
    body: jsonEncode({
      'firstname':kAdi.text,
      'lastname':kSoyad.text,
      'email':kMail.text,
      'password':kPass.text,
      'repassword':kPassR.text
    }),)
      .then((response) {
    returnM= response.body;
  });


}

