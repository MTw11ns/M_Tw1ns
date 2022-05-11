// ignore_for_file: non_constant_identifier_names, avoid_types_as_parameter_names, avoid_print, file_names, prefer_const_constructors, curly_braces_in_flow_control_structures

import 'dart:developer';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:radio/Controller/Provider.dart';
import 'package:radio/Data/Data.dart';
import 'package:alan_voice/alan_voice.dart';
import '../shared/network/local/favourite_model.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  IconData favIcon = Icons.favorite_border;
  AudioPlayer audioPlayer = AudioPlayer();

  void currentChannel (int indx){
    setState(() {
      DataProvider.index = indx;
      DataProvider.title = homeRadios[DataProvider.index].name;
      DataProvider.category = homeRadios[DataProvider.index].type;
      DataProvider.image = homeRadios[DataProvider.index].imageUrl;
      DataProvider.soundUrl = homeRadios[DataProvider.index].soundUrl;
      DataProvider.playPauseIcon = Icons.pause;
      DataProvider.id = homeRadios[DataProvider.index].id;
      Provider.of<DataProvider>(context, listen: false).getAudio(DataProvider.soundUrl);
    });
  }

  void setupAlan(){
    AlanVoice.addButton(
      "5a1f2b34d4b1d69620e6b6972cca03b42e956eca572e1d8b807a3e2338fdd0dc/stage",
      buttonAlign: AlanVoice.BUTTON_ALIGN_RIGHT
    );

    void _handleCommand(Map<String, dynamic> response){
      debugPrint("command was ${response.toString()}");
      switch(response["command"].toString().toLowerCase()){
        case 'play':
          Provider.of<DataProvider>(context, listen: false).getAudio(DataProvider.soundUrl);
          setState(() {
            DataProvider.playPauseIcon = Icons.pause;
          });
          break;
        case 'pause':
          Provider.of<DataProvider>(context, listen: false).pause();
          setState(() {
            DataProvider.playPauseIcon = Icons.play_arrow;
          });
          break;
        case 'play_channel':
          Provider.of<DataProvider>(context, listen: false).pause();
          DataProvider.index = response['id'] - 1;
          currentChannel(DataProvider.index);
          break;
        case 'favorite':
          Provider.of<DataProvider>(context, listen: false)
              .toggleFavIcon(favouriteModel:   FavouriteModel(
            id:  Provider.of<DataProvider>(context, listen: false).allItems[DataProvider.index].id,
            name:  Provider.of<DataProvider>(context, listen: false).allItems[DataProvider.index].name,
            type:  Provider.of<DataProvider>(context, listen: false).allItems[DataProvider.index].type,
            imageUrl:  Provider.of<DataProvider>(context, listen: false).allItems[DataProvider.index].imageUrl,
            soundUrl:  Provider.of<DataProvider>(context, listen: false).allItems[DataProvider.index].soundUrl,
            isFav:  Provider.of<DataProvider>(context, listen: false)
                .allItems[DataProvider.index].isFav! == "true" ? "false" : "true",
          ));
          break;
        case 'favorite_channel':
          DataProvider.index = response['id'] - 1;
          Provider.of<DataProvider>(context, listen: false)
              .toggleFavIcon(favouriteModel:   FavouriteModel(
            id:  Provider.of<DataProvider>(context, listen: false).allItems[DataProvider.index].id,
            name:  Provider.of<DataProvider>(context, listen: false).allItems[DataProvider.index].name,
            type:  Provider.of<DataProvider>(context, listen: false).allItems[DataProvider.index].type,
            imageUrl:  Provider.of<DataProvider>(context, listen: false).allItems[DataProvider.index].imageUrl,
            soundUrl:  Provider.of<DataProvider>(context, listen: false).allItems[DataProvider.index].soundUrl,
            isFav:  Provider.of<DataProvider>(context, listen: false)
                .allItems[response['id'] - 1].isFav! == "true" ? "false" : "true",
          ));
          break;
        case 'next':
          DataProvider.index++;
          if(DataProvider.index == 15)
            DataProvider.index = 0;
          Provider.of<DataProvider>(context, listen: false).pause();
          currentChannel(DataProvider.index);
          break;
        case 'previous':
          DataProvider.index--;
          if(DataProvider.index == -1)
            DataProvider.index = 14;
          Provider.of<DataProvider>(context, listen: false).pause();
          currentChannel(DataProvider.index);
          break;
        case 'category':
          Provider.of<DataProvider>(context, listen: false).pause();
          DataProvider.index = response['id'] - 1;
          currentChannel(DataProvider.index);
          break;
      }
    }

    AlanVoice.onCommand.add((command) => _handleCommand(command.data));
  }

  @override
  void initState() {
    super.initState();
    setupAlan();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Consumer<DataProvider>(
                builder: (context, radiodata, Widget? child) {
                  return ListView.separated(
                      itemBuilder: (context, index) => radiolistile(
                        isfav: radiodata.allItems[index].isFav == "true" ? true : false,
                        title: radiodata.allItems[index].name!,
                        subtitle: radiodata.allItems[index].type!,
                        image: radiodata.allItems[index].imageUrl!,
                        checkfavorite: () async {
                          FavouriteModel model = FavouriteModel(
                            id: radiodata.allItems[index].id,
                            name: radiodata.allItems[index].name,
                            type: radiodata.allItems[index].type,
                            imageUrl: radiodata.allItems[index].imageUrl,
                            soundUrl: radiodata.allItems[index].soundUrl,
                            isFav: radiodata.allItems[index].isFav! == "true" ? "false" : "true",
                          );
                          await radiodata.toggleFavIcon(
                            favouriteModel: model,
                          );
                        },
                        ontap: () {
                          setState(() {
                            DataProvider.index=index;
                            DataProvider.title = radiodata.allItems[index].name!;
                            DataProvider.category = radiodata.allItems[index].type!;
                            DataProvider.image = radiodata.allItems[index].imageUrl!;
                            DataProvider.soundUrl = radiodata.allItems[index].soundUrl!;
                            DataProvider.playPauseIcon = Icons.pause;
                            DataProvider.id = radiodata.allItems[index].id!;
                            Provider.of<DataProvider>(context, listen: false)
                                .getAudio(DataProvider.soundUrl);
                          });
                          log("Index = = ${DataProvider.index}");
                        },
                      ),
                      itemCount: radiodata.allItems.length,
                      separatorBuilder: (context, index) => SizedBox(height: 10));
                }),
          ),

          InkWell(
            onTap: () {
              setState(() {
                DataProvider.playPauseIcon =
                DataProvider.playPauseIcon == Icons.play_arrow
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
        ],
      ),
    );
  }
}