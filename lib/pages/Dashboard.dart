import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/Cupertino.dart';
import 'dart:convert';
import 'dart:io';
import 'dart:async';
import 'package:http/http.dart' as http;

class Dashboard extends StatefulWidget {
  int _currentIndex = 0;
  final List<Widget> _children = [];
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {

  Future<List<User>> _getUsers() async {


    var data = await http.get(Uri.https('kguproject.herokuapp.com', '/api/mentors/all-mentors'));

    var jsonData = json.decode(data.body);
    // print(jsonData);// debug
    print(jsonData);
    List<User> users = [];

    for(var u in jsonData){

      User user = User(u['emailActive'], u["total_income"], u["photo_path"], u["mentor_about"], u["hour_price"], u["_id"], u["firstname"], u["lastname"], u["email"], u["courses"], u["createdAt"], u["updatedAt"], u["__v"]);
      users.add(user);

    }

    print(users.length);

    return users;

  }

  @override

  Widget build(BuildContext context) {
    return new Scaffold(


      body: Container(
        child: FutureBuilder(
          future: _getUsers(),
          builder: (BuildContext context, AsyncSnapshot snapshot){
            print(snapshot.data);
            if(snapshot.data == null){
              return Container(
                  child: Center(
                      child: Text("Yükleniyor...")//Api'dan gelen data henüz yoksa gösterilecek //!To Do grafik koy
                  )
              );
            } else {
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage('https://picsum.photos/250?image=9'
                      ),//Veri tabanında mevcut resim bulunmadığından örnek resim localden gelir
                    ),
                    title: Text(snapshot.data[index].name),//Mentor ismi
                    subtitle: Text(snapshot.data[index].email),//Mentor maili ve ücreti
                    onTap: (){

                      Navigator.push(context,
                          new MaterialPageRoute(builder: (context) => DetailPage(snapshot.data[index]))
                      );

                    },
                  );
                },
              );
            }
          },
        ),
      ),

    );
  }
}
class DetailPage extends StatelessWidget {

  final User user;

  DetailPage(this.user);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(

        )
    );
  }
}


class User {
  final String emailActive;
  final int total_income;
  final String photo_path;
  final String mentor_about;
  final int hour_price;
  final int _id;
  final String firstname;
  final String lastname;
  final String email;
  final String courses;
  final String createdAt;
  final String updatedAt;
  final String __v;

  User(this.emailActive, this.total_income, this.photo_path, this.mentor_about, this.hour_price, this._id, this.firstname, this.lastname, this.email, this.courses, this.createdAt, this.updatedAt, this.__v);

}