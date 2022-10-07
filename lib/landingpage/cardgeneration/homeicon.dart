import 'package:flutter/material.dart';

class HomeIcon {
  String? iconUrl;
  HomeIcon({this.iconUrl});
}

List<HomeIcon> iconList = [
  HomeIcon(
      iconUrl:
          'https://assets-in.bmscdn.com/discovery-catalog/collections/tr:w-800,h-800:w-300:q-80/icd-movies-collection-202201201113.png'),
  HomeIcon(
      iconUrl:
          'https://assets-in.bmscdn.com/discovery-catalog/collections/tr:w-800,h-800:w-300:q-80/icd-stream-collection-202201201113.png'),
  HomeIcon(
      iconUrl:
          'https://assets-in.bmscdn.com/discovery-catalog/collections/tr:w-800,h-800:w-300:q-80/pro-kabaddi-league-collection-202209280447.png'),
  HomeIcon(
      iconUrl:
          'https://assets-in.bmscdn.com/discovery-catalog/collections/tr:w-800,h-800:w-300:q-80/icd-music-shows-collection-202201201113.png'),
  HomeIcon(
      iconUrl:
          'https://assets-in.bmscdn.com/discovery-catalog/collections/tr:w-800,h-800:w-300:q-80/icd-comedy-shows-collection-202201201113.png'),
  HomeIcon(
      iconUrl:
          'https://assets-in.bmscdn.com/discovery-catalog/collections/tr:w-800,h-800:w-300:q-80/icd-sports-collection-202201201113.png'),
  HomeIcon(
      iconUrl:
          'https://assets-in.bmscdn.com/discovery-catalog/collections/tr:w-800,h-800:w-300:q-80/icd-plays-collection-202201201113.png'),
  HomeIcon(
      iconUrl:
          'https://assets-in.bmscdn.com/discovery-catalog/collections/tr:w-800,h-800:w-300:q-80/icd-see-all-collection-202201201113.png'),
];

class IconGenerator extends StatelessWidget {
  HomeIcon? icon;
  IconGenerator({this.icon});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: 70,
      width: 70,
      child: Image(
        image: NetworkImage(icon!.iconUrl.toString()),
      ),
    );
  }
}
