import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

class List extends StatefulWidget {
  @override
  createState() => new _ListState();
}

class _ListState extends State<List> {
  final _suggestions = <WordPair>[]; // 总的list 在Dart语言中使用下划线前缀标识符，会强制其变成私有的。

  final _saved = new Set<WordPair>(); // 保存的数据

  final TextStyle _biggerFont = new TextStyle(fontSize: 18.0); // 增大字体大小

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        // 标题栏
        title: new Text('Startup Name Generator'),

        // 状态栏
        actions: <Widget>[
          new IconButton(icon: new Icon(Icons.list), onPressed: _pushSaved),
        ],
      ),

      //
      body: _buildSuggestions(),
    );
  }

  void _pushSaved() {
    Navigator.of(context).push(
      new MaterialPageRoute(
        builder: (context) {
          final tiles = _saved.map(
            (pair) {
              return new ListTile(
                title: new Text(
                  pair.asPascalCase,
                  style: _biggerFont,
                ),
              );
            },
          );
          final divided = ListTile.divideTiles(
            context: context,
            tiles: tiles,
          ).toList();
          return new Scaffold(
            appBar: new AppBar(
              title: new Text('Saved Suggestions'),
            ),
            body: new ListView(children: divided),
          );
        },
      ),
    );
  }

  Widget _buildSuggestions() {
    return new ListView.builder(
      padding: const EdgeInsets.all(16.0),

      // itemBuilder: (context, i) { //itemBuilder 值是一个匿名回调函数，
      // 接受两个参数- BuildContext和行迭代器i。迭代器从0开始， 每调用一次该函数，i就会自增1
      itemBuilder: (context, i) {
        // 添加一个1像素高的分隔线widget
        if (i.isOdd) return new Divider();

        final index = i ~/ 2; // 语法 "i ~/ 2" 表示i除以2

        // 如果是建议列表中最后一个单词对 分割线也要算index
        if (index >= _suggestions.length) {
          _suggestions.addAll(generateWordPairs().take(10));
        }
        return _buildRow(_suggestions[index]);
      },
    );
  }

  Widget _buildRow(WordPair pair) {
    final alreadySaved = _saved.contains(pair);

    return new ListTile(
      title: new Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),
      trailing: new Icon(
        alreadySaved ? Icons.favorite : Icons.favorite_border,
        color: alreadySaved ? Colors.red : null,
      ),
      onTap: () {
        setState(() {
          if (alreadySaved) {
            _saved.remove(pair);
          } else {
            _saved.add(pair);
          }
        });
      },
    );
  }
}
