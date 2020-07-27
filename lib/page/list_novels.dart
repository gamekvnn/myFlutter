import 'package:flutter/material.dart';
import 'package:kaimood/page/detail/detail.dart';
import '../model/novels_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class NovelsScreen extends StatefulWidget {
  @override
  NovelsScreenState createState() {
    return new NovelsScreenState();
  }
}

class NovelsScreenState extends State<NovelsScreen> {
  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
      itemCount: dummyData.length,
      itemBuilder: (context, i) => new Column(
        children: <Widget>[
          new Divider(
            height: 10.0,
          ),
          new ListTile(
            leading: new CircleAvatar(
              foregroundColor: Theme.of(context).primaryColor,
              backgroundColor: Colors.grey,
              backgroundImage: new NetworkImage(dummyData[i].avatarUrl),
            ),
            title: new Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                new Text(
                  dummyData[i].name,
                  style: new TextStyle(fontWeight: FontWeight.bold),
                  overflow: TextOverflow.ellipsis,
                ),
                new Text(
                  dummyData[i].author,
                  style: new TextStyle(color: Colors.grey, fontSize: 14.0),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
            subtitle: new Container(
              padding: const EdgeInsets.only(top: 5.0),
              child: new Text(
                dummyData[i].content,
                style: new TextStyle(color: Colors.grey, fontSize: 15.0),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            onTap:() {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DetailScreen(dummyData[i])),
              );
            },
          )
        ],
      ),
    );
  }
}
