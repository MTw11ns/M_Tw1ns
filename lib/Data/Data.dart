// ignore_for_file: avoid_print, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:radio/Controller/Provider.dart';

class RadioData {
  final int id;
  final String name;
  final String type;
  final String imageUrl;
  final String soundUrl;

  RadioData(
      {required this.id,
      required this.name,
      required this.type,
      required this.imageUrl,
      required this.soundUrl});
}

final homeRadiosJson = [
  {
    'id': 1,
    'name': 'Tarateel',
    'type': 'Quran',
    'imageUrl':
        'https://i0.wp.com/iphoneislam.com/wp-content/uploads/2021/05/TarateelAlQura-1.png?resize=492%2C400&ssl=1',
    'soundurl': 'https://Qurango.net/radio/tarateel'
  },
  {
    'id': 2,
    'name': '9090 FM EGYPT',
    'type': 'Sports',
    'imageUrl':
        'https://mytuner.global.ssl.fastly.net/media/tvos_radios/ddvJvW8kCA.png',
    'soundurl': 'https://9090streaming.mobtada.com/9090FMEGYPT'
  },
  {
    'id': 3,
    'name': 'Quran',
    'type': 'Quran',
    'imageUrl':
        'https://mytuner.global.ssl.fastly.net/media/tvos_radios/c5UM5Rxx3R.png',
    'soundurl': 'https://Qurango.net/radio/mohammad_altablaway'
  },
  {
    'id': 4,
    'name': '90s Fm',
    'type': 'News',
    'imageUrl':
        'https://mytuner.global.ssl.fastly.net/media/tvos_radios/w6C8abXm33.png',
    'soundurl': 'https://eu1.fastcast4u.com/proxy/prontofm?mp=/1'
  },
  {
    'id': 5,
    'name': 'محطة مصر',
    'type': 'Quran',
    'imageUrl':
        'https://mytuner.global.ssl.fastly.net/media/tvos_radios/4hPpsMQRWM.png',
    'soundurl': 'https://s3.radio.co/s9cb11828c/listen'
  },
  {
    'id': 6,
    'name': 'Nagham FM',
    'type': 'random',
    'imageUrl':
        'https://mytuner.global.ssl.fastly.net/media/tvos_radios/LLt5bQXRUx.jpg',
    'soundurl': 'https://ahmsamir.radioca.st/stream'
  },
  {
    'id': 7,
    'name': 'MIX FM',
    'type': 'Music',
    'imageUrl':
        'https://static.wixstatic.com/media/22a4ef_8cb67f8beaad4a09be204c70372f8971~mv2_d_8268_5906_s_4_2.png/v1/fill/w_237,h_228,al_c,q_85,usm_0.66_1.00_0.01/MIXFM%20GOLD%20FINAL.webp',
    'soundurl': 'https://c34.radioboss.fm:18035/stream'
  },
  {
    'id': 8,
    'name': 'Mega',
    'type': 'random',
    'imageUrl':
        'https://mytuner.global.ssl.fastly.net/media/tvos_radios/qsMHvb23Tu.jpg',
    'soundurl': 'https://audiostreaming.twesto.com/megafm214'
  },
  {
    'id': 9,
    'name': 'شعبي أف أم',
    'type': 'Music',
    'imageUrl':
        'https://cdn.webrad.io/images/logos/egyptradio-net/shaabi-95.png',
    'soundurl': 'https://radio95.radioca.st/stream/1/'
  },
  {
    'id': 10,
    'name': 'إذاعة الأهرام',
    'type': 'News',
    'imageUrl':
        'https://cdn.webrad.io/images/logos/egyptradio-net/al-ahram.png',
    'soundurl': 'https://radiostream.ahram.org.eg/stream'
  },
  {
    'id': 11,
    'name': 'راديو نداء الخلاص',
    'type': 'Music',
    'imageUrl':
        'https://cdn.webrad.io/images/logos/egyptradio-net/call-to-salvation.png',
    'soundurl': 'https://i7.streams.ovh/sc/hoperad2/stream'
  },
  {
    'id': 12,
    'name': 'radio masr',
    'type': 'News',
    'imageUrl':
        'https://3.bp.blogspot.com/-mCBrPfjj5qM/XBq4AdFEe7I/AAAAAAAANlE/BvlVTlxGyNwcOWHt3RGnLRhU5-fAFhP_ACLcBGAs/s1600/listen-radio-masr-88.7-online.jpg',
    'soundurl': 'https://live.radiomasr.net/RADIOMASR'
  },
  {
    'id': 13,
    'name': 'راديو إنرجي 92.1 fm',
    'type': 'Random',
    'imageUrl':
        'https://media.filfan.com/NewsPics/FilfanNew/large/271236_0.jpg',
    'soundurl': 'https://nrjstreaming.ahmed-melege.com/nrjegypt'
  },
  {
        'id': 14,
        'name': 'BBC arabic',
        'type': 'news',
        'imageUrl': 'https://news.files.bbci.co.uk/ws/img/logos/og/arabic.png',
        'soundurl': 'https://stream.live.vc.bbcmedia.co.uk/bbc_arabic_radio'
  },
  {
    'id': 15,
    'name': 'Sky news',
    'type': 'news',
    'imageUrl': 'https://yt3.ggpht.com/ytc/AKedOLRVWs0sGp_-TrnK8Uq9LRHhbRCwslmFoIj4VK8mcgs=s900-c-k-c0x00ffffff-no-rj',
    'soundurl': 'https://radio.skynewsarabia.com/stream/radio/skynewsarabia'
  }
];

Widget radioStation(
        {
          required int index,
        required VoidCallback onTap,
        required double height,
        var name,
        var type,
        var image,
        var ICON,
        var onpress,
        }
        ) =>
Consumer<DataProvider>(builder: (BuildContext context, value, Widget? child) {
  return  ListTile(
    onTap: onTap,
    title: Text(
      "$name",
      style: const TextStyle(fontSize: 20),
    ),
    subtitle: Text("$type"),
    leading: ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Image(
        image: NetworkImage("$image"),
        width: height / 10,
        fit: BoxFit.cover,
      ),
    ),
    trailing: IconButton(
        onPressed: onpress,
        icon:  Icon(ICON)),
  );
}
,);


  final homeRadios = <RadioData>[
    RadioData(
        id: 1,
        name: 'Tarateel',
        type: 'Quran',
        imageUrl:
        'https://i0.wp.com/iphoneislam.com/wp-content/uploads/2021/05/TarateelAlQura-1.png?resize=492%2C400&ssl=1',
        soundUrl: 'https://Qurango.net/radio/tarateel'),
    RadioData(
        id: 2,
        name: '9090FMEGYPT',
        type: 'Sports',
        imageUrl:
        'https://mytuner.global.ssl.fastly.net/media/tvos_radios/ddvJvW8kCA.png',
        soundUrl: 'https://9090streaming.mobtada.com/9090FMEGYPT'),
    RadioData(
        id: 3,
        name: ' Quaran',
        type: 'Quran',
        imageUrl:
        'https://mytuner.global.ssl.fastly.net/media/tvos_radios/c5UM5Rxx3R.png',
        soundUrl: 'https://Qurango.net/radio/mohammad_altablaway'),
    RadioData(
        id: 4,
        name: '90s Fm',
        type: 'News',
        imageUrl:
        'https://mytuner.global.ssl.fastly.net/media/tvos_radios/w6C8abXm33.png',
        soundUrl: 'https://eu1.fastcast4u.com/proxy/prontofm?mp=/1'),
    RadioData(
        id: 5,
        name: 'محطه مصر',
        type: 'Quran',
        imageUrl:
        'https://mytuner.global.ssl.fastly.net/media/tvos_radios/4hPpsMQRWM.png',
        soundUrl: 'https://s3.radio.co/s9cb11828c/listen'),
    RadioData(
        id: 6,
        name: 'Nagham FM 105.3',
        type: 'random',
        imageUrl:
        'https://mytuner.global.ssl.fastly.net/media/tvos_radios/LLt5bQXRUx.jpg',
        soundUrl: 'https://ahmsamir.radioca.st/stream'),
    RadioData(
        id: 7,
        name: 'MIX FM 87.8',
        type: 'Music',
        imageUrl:
        'https://static.wixstatic.com/media/22a4ef_8cb67f8beaad4a09be204c70372f8971~mv2_d_8268_5906_s_4_2.png/v1/fill/w_237,h_228,al_c,q_85,usm_0.66_1.00_0.01/MIXFM%20GOLD%20FINAL.webp',
        soundUrl: 'https://c34.radioboss.fm:18035/stream'),
    RadioData(
        id: 8,
        name: ' Mega',
        type: 'random',
        imageUrl:
        'https://mytuner.global.ssl.fastly.net/media/tvos_radios/qsMHvb23Tu.jpg',
        soundUrl: 'https://audiostreaming.twesto.com/megafm214'),
    RadioData(
        id: 9,
        name: 'شعبيي أف أم',
        type: 'Music',
        imageUrl:
        'https://cdn.webrad.io/images/logos/egyptradio-net/shaabi-95.png',
        soundUrl: 'https://radio95.radioca.st/stream/1/'),
    RadioData(
        id: 10,
        name: 'إذاعة الأهرام',
        type: 'News',
        imageUrl:
        'https://cdn.webrad.io/images/logos/egyptradio-net/al-ahram.png',
        soundUrl: 'https://radiostream.ahram.org.eg/stream'),
    RadioData(
        id: 11,
        name: 'راديو نداء الخلاص',
        type: 'Music',
        imageUrl:
        'https://cdn.webrad.io/images/logos/egyptradio-net/call-to-salvation.png',
        soundUrl: 'https://i7.streams.ovh/sc/hoperad2/stream'),
    RadioData(
        id: 12,
        name: 'راديو مصر',
        type: 'News',
        imageUrl:
        'https://3.bp.blogspot.com/-mCBrPfjj5qM/XBq4AdFEe7I/AAAAAAAANlE/BvlVTlxGyNwcOWHt3RGnLRhU5-fAFhP_ACLcBGAs/s1600/listen-radio-masr-88.7-online.jpg',
        soundUrl: 'https://live.radiomasr.net/RADIOMASR'),
    RadioData(
        id: 13,
        name: 'راديو إنرجي 92.1 fm',
        type: 'Random',
        imageUrl:
        'https://media.filfan.com/NewsPics/FilfanNew/large/271236_0.jpg',
        soundUrl: 'https://nrjstreaming.ahmed-melege.com/nrjegypt'),
    RadioData(
        id: 14,
        name: 'BBC arabic',
        type: 'news',
        imageUrl:
        'https://news.files.bbci.co.uk/ws/img/logos/og/arabic.png',
        soundUrl: 'https://stream.live.vc.bbcmedia.co.uk/bbc_arabic_radio'),
    RadioData(
        id: 15,
        name: 'Sky news',
        type: 'news',
        imageUrl:
        'https://yt3.ggpht.com/ytc/AKedOLRVWs0sGp_-TrnK8Uq9LRHhbRCwslmFoIj4VK8mcgs=s900-c-k-c0x00ffffff-no-rj',
        soundUrl: 'https://radio.skynewsarabia.com/stream/radio/skynewsarabia')
  ];

