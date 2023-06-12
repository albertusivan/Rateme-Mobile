import 'package:flutter/material.dart';

void main() {
  runApp(BookApp());
}

class BookApp extends StatelessWidget {
  const BookApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bookmark',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyBookmark(title: 'Bookmark'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyBookmark extends StatefulWidget {
  MyBookmark({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyBookmarkState createState() => _MyBookmarkState();
}

class _MyBookmarkState extends State<MyBookmark> {
  final List<Map<String, dynamic>> info = [
    {
      'name': 'Beda Certia',
      "pic": "assets/bedacerita.jpeg",
      "addr": "alamat",
      "rate": "4"
    },
    {
      'name': 'Beda Certia',
      "pic": "assets/bedacerita.jpeg",
      "addr": "jl",
      "rate": "4"
    },
    {
      'name': 'Beda Certia',
      "pic": "assets/bedacerita.jpeg",
      "addr": "jl",
      "rate": "4"
    },
    {
      'name': 'Beda Certia',
      "pic": "assets/bedacerita.jpeg",
      "addr": "jl",
      "rate": "4"
    },
    {
      'name': 'Beda Certia',
      "pic": "assets/bedacerita.jpeg",
      "addr": "jl",
      "rate": "4"
    },
    {
      'name': 'Beda Certia',
      "pic": "assets/bedacerita.jpeg",
      "addr": "jl",
      "rate": "4"
    },
    {
      'name': 'Beda Certia',
      "pic": "assets/bedacerita.jpeg",
      "addr": "jl",
      "rate": "4"
    }
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        //appbar buat welcome
        appBar: AppBar(
          centerTitle: true,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Bookmark",
                    style: TextStyle(
                        color: Colors.brown,
                        fontWeight: FontWeight.bold,
                        fontSize: 25),
                  ),
                ],
              ),
            ],
          ),
          backgroundColor: Colors.white12,
          elevation: 0,
        ),

        body: Padding(
          padding: EdgeInsets.only(top: 16),
          child: Column(
            children: [
              Expanded(
                child: ListView.separated(
                  padding: const EdgeInsets.all(8),
                  itemCount: info.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      height: 100,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 10.0,
                              color: Colors.black12,
                            )
                          ],
                          borderRadius: BorderRadius.circular(8)),
                      child: ListTile(
                        contentPadding:
                        EdgeInsets.only(top: 15, left: 10, right: 12),
                        title: Text("${info[index]["name"]}"),
                        trailing: ConstrainedBox(
                          constraints: BoxConstraints(
                            maxWidth: 30,
                            maxHeight: 30,
                          ),
                          child:
                          Image.asset("assets/note.png", fit: BoxFit.cover),
                        ),
                        subtitle: Text("${info[index]["addr"]}"),
                        leading: ConstrainedBox(
                          constraints: BoxConstraints(
                            minWidth: 44,
                            minHeight: 44,
                            maxWidth: 100,
                            maxHeight: 100,
                          ),
                          child: Image.asset("${info[index]["pic"]}",
                              fit: BoxFit.cover),
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) =>
                  const Divider(),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}