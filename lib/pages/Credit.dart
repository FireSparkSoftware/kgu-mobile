import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'dart:convert';
import 'dart:io';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:jwt_decode/jwt_decode.dart';
import 'package:kgu/main.dart';
String id ="";
String user_id ="";
class Credit extends StatefulWidget {


  @override

  _CreditState createState() => _CreditState();
}
TextEditingController creditLoad = TextEditingController();
 decoder() async{
  String token = token2;

  Map<String, dynamic> payload = Jwt.parseJwt(token);

  id=payload['id'];
  sender();
}
sender() async {


 Future<http.Response> fetchAlbum() async {
   return await http.get(Uri.https('kguproject.herokuapp.com', '/api/users/$id'));
  }


 print (id);
  print (http.Response);

  }


class _CreditState extends State<Credit> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    decoder();

  }
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF3F6FF),
      body: SingleChildScrollView(
        child: Column(
            children: <Widget>[
              SizedBox(
                height: 100,
              ),
              Text(
                'Mevcut kredi =  ',
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),

        Padding(
        padding: const EdgeInsets.only(
            left: 15.0, right: 15.0, top: 15, bottom: 15),
        //padding: EdgeInsets.symmetric(horizontal: 15),
        child: TextField(
          controller: creditLoad,

          obscureText: true,
          decoration: InputDecoration(
              filled: true,
              fillColor: Color(0xffC3D0ED),
              border: OutlineInputBorder(),

              labelText: 'Yüklemek İstediğiniz miktar!'
              ),
        ),
      ),

      Container(
        height: 50,
        width: 250,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Color(0xff374ABE), Color(0xff64B6FF)]),
            borderRadius: BorderRadius.circular(9)),
        child: CupertinoButton(

          onPressed: () {decoder();
                      },
          child: Text(
            'Yükle',
            style:
            TextStyle(color: Colors.white),
          ),
        ),

      ),
            ],
    ),

    ),
    );


  }

}
