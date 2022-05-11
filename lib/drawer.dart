// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, camel_case_types

import 'package:flutter/material.dart';

import 'category/News.dart';
import 'category/Quraan.dart';
import 'category/Sports.dart';
import 'category/music.dart';

class header extends StatefulWidget {
  const header({Key? key}) : super(key: key);

  @override
  _headerState createState() => _headerState();
}

class _headerState extends State<header> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 200,
      decoration: BoxDecoration(
          image: DecorationImage(
        image: NetworkImage(
            'https://images.ctfassets.net/hrltx12pl8hq/1fR5Y7KaK9puRmCDaIof7j/09e2b2b9eaf42d450aba695056793607/vector1.jpg?fit=fill&w=800&h=300'),
        fit: BoxFit.cover,
      )),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(
            image: AssetImage('lib/images/logo.png'),
            width: 150,
            height: 150,
          ),
        ],
      ),
    );
  }
}

class types extends StatefulWidget {
  const types({Key? key}) : super(key: key);

  @override
  _typesState createState() => _typesState();
}

class _typesState extends State<types> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          builditem(
              name: 'Music',
              icon: Icons.music_note,
              onclicked: () => category(context, 1)),
          builditem(
              name: 'Sports',
              icon: Icons.sports_basketball,
              onclicked: () => category(context, 2)),
          builditem(
              name: 'Quraan',
              icon: Icons.book_online_sharp,
              onclicked: () => category(context, 3)),
          builditem(
              name: 'News',
              icon: Icons.web_outlined,
              onclicked: () => category(context, 4)),
        ],
      ),
    );
  }
}

Widget builditem({
  required String name,
  required IconData icon,
  required VoidCallback onclicked,
}) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: SizedBox(
      height: 50,
      child: InkWell(
        onTap: onclicked,
        child: Row(
          children: [
            Icon(
              icon,
              size: 30,
            ),
            SizedBox(
              width: 20,
            ),
            Text(
              name,
              style: TextStyle(
                fontSize: 20,
                //fontWeight: FontWeight.bold
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

void category(BuildContext context, int index) {
  Navigator.pop(context);
  switch (index) {
    case 1:
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => Music()));
      break;
    case 2:
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => sports()));
      break;
    case 3:
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => Quraan()));
      break;
    case 4:
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => News()));
      break;
  }
}
