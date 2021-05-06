
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/Cupertino.dart';
import 'package:kgu/pages/Callendar.dart';
import 'package:kgu/pages/Credit.dart';
import 'package:kgu/pages/Dashboard.dart';
import 'package:kgu/pages/Settings.dart';
import 'Home.dart';
import 'main.dart';
import 'register.dart';
import 'dart:convert';
import 'dart:io';
import 'dart:async';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {


  @override
  _HomePageState createState() => _HomePageState();

}
class _HomePageState extends State<HomePage> {
  PageController _pageController = PageController();
  List<Widget> _screen = [
  Callendar(), Dashboard(), Credit(), Settings()
  ];
  int _selectedIndex =1;


  void _onPageChanged(int index) {

    setState(() {
      _selectedIndex=index;
    });
  }
  void _itemTapped (int selectedIndex){

    _pageController.jumpToPage(selectedIndex);
  }
  @override

  Widget build(BuildContext context) {
    return Scaffold(

      body: PageView(
        controller: _pageController,
        children: _screen,
        onPageChanged: _onPageChanged,
        physics: NeverScrollableScrollPhysics(),

      ),

      bottomNavigationBar: BottomNavigationBar(
        onTap: _itemTapped,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: new Icon(Icons.calendar_today_outlined,
            color: _selectedIndex == 0 ? Colors.blue : Colors.grey),
            title: new Text('Ajandam',
            style: TextStyle(
                color: _selectedIndex == 0 ? Colors.blue : Colors.grey
            )),
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.dashboard_rounded,
                color: _selectedIndex == 1 ? Colors.blue : Colors.grey),
            title: new Text('Danışmanlar',
                style: TextStyle(
                    color: _selectedIndex == 1 ? Colors.blue : Colors.grey
                )),
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.payment,
                  color: _selectedIndex == 2 ? Colors.blue : Colors.grey),
              title: Text('Kredi',
                  style: TextStyle(
                      color: _selectedIndex == 2 ? Colors.blue : Colors.grey
                  ))
          ),
          BottomNavigationBarItem(

              icon: Icon(Icons.settings_outlined,
                  color: _selectedIndex == 3 ? Colors.blue : Colors.grey),
              title: Text('Ayarlar',
                  style: TextStyle(
                      color: _selectedIndex == 3 ? Colors.blue : Colors.grey
                  ))
          )
        ],
      ),
    );
  }

}