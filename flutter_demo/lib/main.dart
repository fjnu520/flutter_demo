import 'package:flutter/material.dart';
import 'package:flutter_demo/List.dart';
import 'package:flutter_demo/image.dart';
import 'package:flutter_demo/origin.dart';
import 'package:flutter_demo/shopList.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(new Main());
}

class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(home: new HomePage());
  }
}

class HomePage extends StatefulWidget {
  _HomePageSate createState() => new _HomePageSate();
}

class _HomePageSate extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Main APP'),
      ),
      body: new Center(
        child: new Column(
          children: <Widget>[
            buildTestButton(context),
            buildImageButton(context),
            buildHtmlButton(context),
            buildListlButton(context),
            buildOrignButton(context),
            buildShopListButton(context),
            buildChangeTexttButton(context),
          ],
        ),
      ),
    );
  }

  /// changeText
  String text = 'before';
  bool flag = false;

  buildChangeTexttButton(BuildContext context) {
    return new Row(children: <Widget>[
      new RaisedButton(
          child: new Text(
              'click me',
              style: new TextStyle(fontSize: 20, color: Colors.blue)),
//          padding: new EdgeInsets.only(right: 50),
          onPressed: () {
            // 通过调用setState来告诉Flutter更新其状态，setState将使用网络调用的结果更新您的UI
            setState(() {
              flag = !flag;
              text = flag ? 'after' : 'before';
            });
          }),
      new Text(text)
    ]);
  }

  /// test
  MaterialButton buildTestButton(BuildContext context) {
    return new RaisedButton(
//      child: new Text(
//        'Test',
//        style: new TextStyle(fontSize: 20, color: Colors.blue),
//      ),
      child: new Text(
        'test',
        style: new TextStyle(fontSize: 20, color: Colors.blue),
      ),
      onPressed: () {

      },
    );
  }
}

/// 图片
MaterialButton buildImageButton(BuildContext context) {
  return new RaisedButton(
//      child: new Text(
//        'Test',
//        style: new TextStyle(fontSize: 20, color: Colors.blue),
//      ),
    child: new Text(
      '图片',
      style: new TextStyle(fontSize: 20, color: Colors.blue),
    ),
    onPressed: () {
      Navigator.of(context)
          .push(new MaterialPageRoute(builder: (context) => new ImageApp()));
    },
  );
}

/// Html
MaterialButton buildHtmlButton(BuildContext context) {
  return new RaisedButton(
    child: new Text(
      'HTML',
      style: new TextStyle(fontSize: 20, color: Colors.blue),
    ),
    onPressed: () {
//      launch('https://www.baidu.com/');
      _openUrl();
    },
  );
}

_openUrl() async {
  const url = 'https://www.baidu.com/';
//    const url = 'tel://123456';

  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

/// list
MaterialButton buildListlButton(BuildContext context) {
  return new RaisedButton(
    child: new Text(
      'List',
      style: new TextStyle(fontSize: 20, color: Colors.blue),
    ),
    onPressed: () {
      Navigator.of(context)
          .push(new MaterialPageRoute(builder: (context) => new List()));
    },
  );
}

/// 自带
MaterialButton buildOrignButton(BuildContext context) {
  return new RaisedButton(
    child: new Text(
      '自带',
      style: new TextStyle(fontSize: 20, color: Colors.blue),
    ),
    onPressed: () {
      Navigator.of(context).push(new MaterialPageRoute(
          builder: (context) =>
          new OrignPage(title: 'Flutter Demo Home Page')));
    },
  );
}

/// shopList
MaterialButton buildShopListButton(BuildContext context) {
  return new RaisedButton(
    child: new Text(
      'ShopList',
      style: new TextStyle(fontSize: 20, color: Colors.blue),
    ),
    onPressed: () {
      Navigator.of(context).push(new MaterialPageRoute(
          builder: (context) =>
          new ShoppingList(
            products: <Product>[
              new Product(name: 'Eggs'),
              new Product(name: 'Flour'),
              new Product(name: 'Chocolate chips'),
            ],
          )));
    },
  );
}
