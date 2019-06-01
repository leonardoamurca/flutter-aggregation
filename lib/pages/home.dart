import 'package:flutter/material.dart';
import 'package:flutter_aggregation/pages/components/card_item.dart';
import 'package:webfeed/webfeed.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _Home();
}

class _Home extends State<Home> with SingleTickerProviderStateMixin {
  TabController _tabBarController;

  @override
  void initState() {
    _tabBarController = TabController(vsync: this, initialIndex: 0, length: 2);
  }

  @override
  Widget build(BuildContext context) {
    var items =
        getMessages().map((feedItem) => CardItem(cardModel: feedItem)).toList();
    return Scaffold(
      appBar: AppBar(
        title: Hero(
            tag: 'logo',
            child: Image.asset(
              "flutter_icon.png",
              width: 120,
            )),
        elevation: 0.7,
        backgroundColor: Colors.lightBlue,
      ),
      body: Center(
          child: CustomScrollView(
        primary: false,
        slivers: <Widget>[
          SliverPadding(
            padding: const EdgeInsets.all(20.0),
            sliver: SliverGrid.count(
                crossAxisSpacing: 10.0, crossAxisCount: 2, children: items),
          ),
        ],
      )),
      /*bottomNavigationBar: BottomNavigationBar(
            showSelectedLabels: false,
            showUnselectedLabels: false,
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon:
                    Icon(Icons.chat, color: Color.fromRGBO(241, 245, 247, 50)),
                activeIcon:
                    Icon(Icons.chat, color: Color.fromRGBO(241, 245, 247, 50)),
                title: Text(''),
              ),
              BottomNavigationBarItem(
                icon:
                    Icon(Icons.chat, color: Color.fromRGBO(241, 245, 247, 50)),
                activeIcon:
                    Icon(Icons.chat, color: Color.fromRGBO(241, 245, 247, 50)),
                title: Text(''),
              )
            ])*/
    );
  }

  List<FeedItem> getMessages() {
    return [
      FeedItem(
          'Flutter title',
          'Flutter content',
          'https://www.hindustantimes.com/rf/image_size_960x540/HT/p2/2018/04/03/Pictures/_56db43e2-3722-11e8-8aa5-05fdb8d0ae52.jpg',
          'Link'),
      FeedItem(
          'Flutter title',
          'Flutter content',
          'https://cdn.shopify.com/s/files/1/1001/9644/files/WhatsNewWomen_700x.jpg?v=1536608955',
          'Link'),
      FeedItem(
          'Flutter title',
          'Flutter content',
          'https://vignette.wikia.nocookie.net/metalgear/images/b/be/MGS2SnakePP.png/revision/latest/scale-to-width-down/350?cb=20130626062457',
          'Link'),
      FeedItem(
          'Flutter title',
          'Flutter content',
          'https://vignette.wikia.nocookie.net/metalgear/images/b/be/MGS2SnakePP.png/revision/latest/scale-to-width-down/350?cb=20130626062457',
          'Link'),
    ];
  }
}

class FeedItem {
  FeedItem(this.title, this.content, this.image, this.link);

  FeedItem.fromRss(RssItem item)
      : this(item.title, item.content?.value ?? item.description,
            item.content?.images?.first, item.link);
  FeedItem.fromAtom(AtomItem item)
      : this(item.title, item.content, null, item.links.first.href);

  final String title;
  final String content;
  final String image;
  final String link;
}
