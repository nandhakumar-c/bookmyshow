import 'package:flutter/material.dart';

class StoriesClass {
  String? img;
  String? title;
  StoriesClass({this.img, this.title});
}

List<StoriesClass> storiesList = [
  StoriesClass(
      img:
          'https://assets-in.bmscdn.com/content-buzz/2021/07/upcomingprimevideo.jpg',
      title: 'Prime Movies'),
  StoriesClass(
      img:
          'https://assets-in.bmscdn.com/content-buzz/2021/07/upcomingnetflix.jpg',
      title: 'Netflix Movies'),
  StoriesClass(
      img:
          'https://assets-in.bmscdn.com/content-buzz/2021/07/upcomingprimevideo.jpg',
      title: 'Prime Movies'),
  StoriesClass(
      img:
          'https://assets-in.bmscdn.com/content-buzz/2021/07/upcomingnetflix.jpg',
      title: 'Netflix Movies'),
];

class Stories extends StatefulWidget {
  const Stories({Key? key}) : super(key: key);

  @override
  State<Stories> createState() => _StoriesState();
}

class _StoriesState extends State<Stories> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        separatorBuilder: (context, index) => SizedBox(
              width: 10,
            ),
        itemCount: storiesList.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => StoryGenerator(
              story: storiesList[index],
            ));
  }
}

class StoryGenerator extends StatelessWidget {
  StoriesClass? story;
  StoryGenerator({this.story});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(children: [
      Container(
        child: CircleAvatar(
          backgroundImage: NetworkImage(
            story!.img.toString(),
          ),
          radius: 35,
        ),
      ),
      SizedBox(
        height: 5,
      ),
      Text(
        story!.title.toString(),
        style: TextStyle(fontSize: 8),
      ),
    ]);
  }
}
