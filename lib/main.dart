import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() async {
//  Firestore.instance.collection("mensagens").document().collection("media").document().setData({"img" : "foto"});
//  DocumentSnapshot snapshot = await Firestore.instance.collection("usuarios").document("JaqueX").get();
//  print(snapshot.data);

//  QuerySnapshot snapshot = await Firestore.instance.collection("usuarios").getDocuments();
//  print(snapshot.documents);
//  for(DocumentSnapshot doc in snapshot.documents) {
//    print(doc.documentID);
//    print(doc.data);
//  }

//  Firestore.instance.collection("mensagens").snapshots().listen((snapshot){
//    for(DocumentSnapshot doc in snapshot.documents) {
//      print(doc.data);
//    }
//  });

  runApp(MyApp());
}

final ThemeData kIOSTheme = ThemeData(
    primarySwatch: Colors.orange,
    primaryColor: Colors.grey[100],
    primaryColorBrightness: Brightness.light
);

final ThemeData kDefaultTheme = ThemeData(
    primarySwatch: Colors.purple,
    accentColor: Colors.orangeAccent[400]
);

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Chat Online",
        debugShowCheckedModeBanner: false,
        theme: Theme.of(context).platform == TargetPlatform.iOS
            ? kIOSTheme
            : kDefaultTheme,
        home: ChatScreen());
  }
}

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        bottom: false,
        top: false,
        child: Scaffold(
          appBar: AppBar(
            title: Text("Chat App"),
            centerTitle: true,
            elevation:
                Theme.of(context).platform == TargetPlatform.iOS ? 0.0 : 4.0,
          ),
          body: Column(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).cardColor,
                ),
                child: TextComposer(),
              )
            ],
          ),
        ));
  }
}

class TextComposer extends StatefulWidget {
  @override
  _TextComposerState createState() => _TextComposerState();
}

class _TextComposerState extends State<TextComposer> {
  bool _isComposing = false;

  @override
  Widget build(BuildContext context) {
    return IconTheme(
      data: IconThemeData(color: Theme.of(context).accentColor),
      child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 8.0),
          decoration: Theme.of(context).platform == TargetPlatform.iOS
              ? BoxDecoration(
                  border: Border(top: BorderSide(color: Colors.grey[200])))
              : null,
          child: Row(
            children: <Widget>[
              Container(
                child: IconButton(
                  icon: Icon(Icons.photo_camera),
                  onPressed: () {},
                ),
              ),
              Expanded(
                  child: TextField(
                decoration:
                    InputDecoration.collapsed(hintText: "Enviar uma Mensagem"),
                onChanged: (text) {
                  setState(() {
                    _isComposing = text.length > 0;
                  });
                },
              )),
              Container(
                  margin: const EdgeInsets.symmetric(horizontal: 4.0),
                  child: Theme.of(context).platform == TargetPlatform.iOS
                      ? CupertinoButton(
                          child: Text("Enviar"),
                          onPressed: _isComposing ? () {} : null,
                        )
                      : IconButton(
                          icon: Icon(Icons.send),
                          onPressed: _isComposing ? () {} : null,
                        ))
            ],
          )),
    );
  }
}
