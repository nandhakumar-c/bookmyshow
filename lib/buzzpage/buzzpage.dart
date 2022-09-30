import 'package:flutter/material.dart';

class FeedList {
  String? feedTitle;
  String? imageURL;
  String? profileURL;
  String? time;
  FeedList({this.feedTitle, this.imageURL, this.profileURL, this.time});
}

final Feeds = [
  FeedList(
      feedTitle: 'Tamil Thriller \'Naane Varuven\' Is Deliciously Chilling',
      imageURL: 'assets/images/image.jpeg',
      profileURL: 'assets/icons/BookMyShowLogo.png'),
  FeedList(
      feedTitle: 'Tamil Thriller \'Naane Varuven\' Is Deliciously Chilling',
      imageURL: 'assets/images/image.jpeg',
      profileURL: 'assets/icons/BookMyShowLogo.png'),
  FeedList(
      feedTitle: 'Tamil Thriller \'Naane Varuven\' Is Deliciously Chilling',
      imageURL: 'assets/images/image.jpeg',
      profileURL: 'assets/icons/BookMyShowLogo.png'),
  FeedList(
      feedTitle: 'Tamil Thriller \'Naane Varuven\' Is Deliciously Chilling',
      imageURL: 'assets/images/image.jpeg',
      profileURL: 'assets/icons/BookMyShowLogo.png'),
];

class BuzzPage extends StatelessWidget {
  const BuzzPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 10, 21, 46),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
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
      body: ListView.builder(
          itemCount: Feeds.length,
          scrollDirection: Axis.vertical,
          itemBuilder: ((context, index) => FeedGenerator(
                feed: Feeds[index],
              ))),
    );
  }
}

class FeedGenerator extends StatelessWidget {
  FeedList? feed;
  FeedGenerator({this.feed});
  @override
  Widget build(BuildContext context) {
    double? height = MediaQuery.of(context).size.height;
    double? width = MediaQuery.of(context).size.width;
    return Container(
        height: height / 6,
        width: 200,
        child: Card(
          child: Padding(
            padding: EdgeInsets.all(height / 60),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    '${feed?.imageURL}',
                    height: height / 10,
                    width: width / 5,
                  ),
                ),
                SizedBox(
                  width: width / 15,
                ),
                Container(
                  height: 100,
                  width: 260,
                  child: Column(
                    children: [
                      Container(
                        height: 45,
                        child: Row(
                          children: [
                            Container(
                                width: width / 2,
                                child: Text('${feed?.feedTitle}')),
                            Spacer(),
                            Icon(Icons.bookmark_border_rounded)
                          ],
                        ),
                      ),
                      Container(
                        height: 50,
                        width: double.infinity,
                        child: Align(
                          alignment: Alignment.bottomLeft,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Image.asset(
                                    '${feed?.profileURL}',
                                    height: 20,
                                    width: 20,
                                  )
                                ],
                              ),
                              Spacer(),
                              Row(
                                children: [
                                  InkWell(
                                    onTap: () {},
                                    child: Icon(Icons.favorite_border_outlined),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  InkWell(
                                    onTap: () {},
                                    child: Icon(Icons.share_outlined),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
