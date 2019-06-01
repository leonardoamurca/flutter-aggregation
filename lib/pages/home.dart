import 'package:flutter/material.dart';
import 'package:flutter_aggregation/pages/components/card_item.dart';
import 'package:webfeed/webfeed.dart';
import '../services/feed.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _Home();
}

class _Home extends State<Home> with SingleTickerProviderStateMixin {
  TabController _tabBarController;

  List<CardItem> _items = [];

  @override
  void initState() {
    _tabBarController = TabController(vsync: this, initialIndex: 0, length: 2);

    getMessages().then((feed) {
      print(feed);
      setState(() {
        _items = feed.map((feedItem) => CardItem(cardModel: feedItem)).toList();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
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
                crossAxisSpacing: 10.0, crossAxisCount: 2, children: _items),
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

  Future<List<FeedItemTranslate>> getMessages() async {
    final BaseFeedResponse feedResponse = new FeedResponse();

    try {
      final feed = await feedResponse.getAll(targetLanguage: 'pt-BR');

      return feed.items;
    } catch (error) {
      print('error: $error');
    }
  }
}
