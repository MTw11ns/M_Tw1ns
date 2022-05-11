// ignore_for_file: non_constant_identifier_names, file_names, avoid_print, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:radio/Controller/Provider.dart';

class Fav extends StatefulWidget {
  const Fav({Key? key}) : super(key: key);

  @override
  State<Fav> createState() => _FavState();
}

class _FavState extends State<Fav> {
  // SQFLITE SQL = SQFLITE();
  // List fav = [];
  // readdata() async {
  //   var rsponse = await SQL.Select("SELECT * FROM 'Todo'");
  //   if (mounted) {
  //     setState(() {});
  //   }
  //   fav.addAll(rsponse);
  //   return rsponse;
  // }
  //
  // @override
  // void initState() {
  //   readdata();
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    var Size = MediaQuery.of(context);

    return Scaffold(body: Consumer<DataProvider>(
      builder: (BuildContext context, value, Widget? child) {
        return
        Column( children: [
        Expanded(
          child: ListView.builder(
          itemCount: value.favItems.length,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                margin: EdgeInsets.all(5),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                child: SizedBox(
                    height: Size.size.height / 10,
                    child: ListTile(
                      onTap: () {
                        setState(() {
                          DataProvider.title = value.favItems[index].name!;
                          DataProvider.category = value.favItems[index].type!;
                          DataProvider.image = value.favItems[index].imageUrl!;
                          DataProvider.soundUrl = value.favItems[index].soundUrl!;
                          DataProvider.playPauseIcon = Icons.pause;
                          DataProvider.id = value.favItems[index].id!;
                          Provider.of<DataProvider>(context, listen: false)
                              .getAudio("${value.favItems[index].soundUrl}");
                        });

                      },
                      title: Text(
                        "${value.favItems[index].name}",
                        style: TextStyle(fontSize: 20),
                      ),
                      subtitle: Text("${value.favItems[index].type}"),
                      leading: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image(
                          image: NetworkImage(
                            "${value.favItems[index].imageUrl}",
                          ),
                          width: Size.size.height / 10,
                          fit: BoxFit.cover,
                        ),
                      ),
                    )),
              );
            },
          ),
        ),
          InkWell(
            onTap: () {
              setState(() {
                DataProvider.playPauseIcon = DataProvider.playPauseIcon == Icons.play_arrow
                    ? Icons.pause
                    : Icons.play_arrow;
              });
              Provider.of<DataProvider>(context, listen: false)
                  .getAudio2(DataProvider.soundUrl);
            },
            child: Container(
              color: Colors.black.withOpacity(0.2),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: size.height / 70),
                child: ListTile(
                  title: Row(
                    children: [
                      Image.network(
                        DataProvider.image.toString(),
                        width: 50,
                        height: 50,
                      ),
                      SizedBox(width: size.width / 35),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(DataProvider.title.toString()),
                          Text(
                            DataProvider.category.toString(),
                            style: TextStyle(color: Colors.grey[600]),
                          )
                        ],
                      )
                    ],
                  ),
                  trailing: Icon(
                    DataProvider.playPauseIcon,
                    size: size.height / 22,
                  ),
                ),
              ),
            ),
          )

        ],);
      },
    ));
  }
}
