
// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables,, camel_case_types use_key_in_widget_constructors, file_names, camel_case_types, use_key_in_widget_constructors

import 'package:flutter/material.dart';

import 'Search screen.dart';
import 'favorite screen.dart';
import 'home screen.dart';
import '../drawer.dart';

class home_screen extends StatefulWidget {

  @override
  _home_screenState createState() => _home_screenState();
}

class _home_screenState extends State<home_screen> {

  @override
  Widget build(BuildContext context) {
    return  DefaultTabController(
      length: 2,
      child: Scaffold(
        extendBodyBehindAppBar: true,
        drawer: Drawer(
          child:Column(
            children:
            [
              header(),
              types()
            ],
          ) ,
        ),

        appBar: AppBar(centerTitle:true,
          title:Text('Radio app',
            style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.white
            ),
          ),
          flexibleSpace: Container(
            decoration: BoxDecoration(
                image:DecorationImage(image: AssetImage('lib/images/appbar.jpg'),fit: BoxFit.cover)
              // gradient: LinearGradient(
              //     colors: [Colors.deepPurple.shade900,Colors.deepPurple],
              //     begin: Alignment.topCenter,end: Alignment.bottomCenter)
            ),
          ),
          elevation: 0,
          actions: [
            IconButton(icon: Icon(Icons.search),onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>searchsc()));
            },)
          ],

          bottom: TabBar(tabs:
          [
            Tab(icon: Icon(Icons.home),child: Text('home'),),
            Tab(icon: Icon(Icons.favorite),child: Text('favorites'),),
          ],
          ),
        ),

        body: TabBarView(
          children: [
            HomeScreen(),//home screen
            Fav()//favorites screen

          ],),drawerEnableOpenDragGesture: true,
      ),
    );
  }
}





