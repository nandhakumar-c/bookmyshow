import 'package:bookmyshow/buzzpage/stories/stories.dart';
import 'package:flutter/material.dart';
import './stories/feeds.dart';

class BuzzPage extends StatelessWidget {
  const BuzzPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: const Color.fromARGB(255, 10, 21, 46),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "BUZZ",
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 175,
              ),
              Text(
                "Discover what's trending in entertainment",
                style: TextStyle(
                    fontSize: MediaQuery.of(context).size.height / 75),
              )
            ],
          )),
      body: ListView(
        key: const PageStorageKey('page8'),
        physics: const ScrollPhysics(),
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            width: double.infinity,
            height: 105,
            child: const Stories(),
          ),
          ListView.builder(
            key: const PageStorageKey('page9'),
            shrinkWrap: true,
            physics: const ScrollPhysics(),
            itemCount: feeds.length,
            scrollDirection: Axis.vertical,
            itemBuilder: ((context, index) => FeedGenerator(
                  feed: feeds[index],
                )),
          ),
        ],
      ),
    );
  }
}
