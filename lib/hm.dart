import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rateme/detail.dart';

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
      'name': 'Beda Cerita',
      "pic": "assets/bedacerita.jpeg",
      "addr": "alamat",
      "rate": "4"
    },
    {
      'name': 'Beda Cerita',
      "pic": "assets/bedacerita.jpeg",
      "addr": "jl",
      "rate": "4"
    },
    {
      'name': 'Beda Cerita',
      "pic": "assets/bedacerita.jpeg",
      "addr": "jl",
      "rate": "4"
    },
    {
      'name': 'Beda Cerita',
      "pic": "assets/bedacerita.jpeg",
      "addr": "jl",
      "rate": "4"
    },
    {
      'name': 'Beda Cerita',
      "pic": "assets/bedacerita.jpeg",
      "addr": "jl",
      "rate": "4"
    },
    {
      'name': 'Beda Cerita',
      "pic": "assets/bedacerita.jpeg",
      "addr": "jl",
      "rate": "4"
    },
    {
      'name': 'Beda Cerita',
      "pic": "assets/bedacerita.jpeg",
      "addr": "jl",
      "rate": "4"
    }
  ];

  Set<String> savedCafe = Set<String>();

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

        //container
        body: SafeArea(
          child: Padding(
            padding:
                const EdgeInsets.only(left: 15, right: 15, bottom: 25, top: 10),
            child: Column(
              children: [
                  Expanded(
                    child: ListView.separated(
                      padding: const EdgeInsets.all(8),
                      itemCount: info.length,
                      itemBuilder: (context, index) {
                        return CoffeShop(
                          imagePath: "${info[index]["pic"]}",
                          nameShop: "${info[index]["name"]}",
                          rating: "4.7",
                          jamBuka: "13.00 - 20.00",
                        );
                      },
                      separatorBuilder: (BuildContext context, int index){
                        return Divider(thickness: 0.5,
                          indent: 250,
                          endIndent: 250,
                        );
                      },
                    ),
                  )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class DemoIconToggleButtons extends StatefulWidget {
  const DemoIconToggleButtons({super.key});

  @override
  State<DemoIconToggleButtons> createState() => _DemoIconToggleButtonsState();
}

class _DemoIconToggleButtonsState extends State<DemoIconToggleButtons> {
  bool standardSelected = true;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.favorite,
          color: standardSelected ? Colors.red : Colors.grey),
      onPressed: () {
        setState(() {
          standardSelected = !standardSelected;
        });
      },
    );
  }
}

class CoffeShop extends StatelessWidget {
  final String imagePath;
  final String nameShop;
  final String rating;
  final String jamBuka;
  const CoffeShop(
      {Key? key,
      required this.imagePath,
      required this.nameShop,
      required this.rating,
      required this.jamBuka})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        height: 240,
        child: Stack(
          children: [
            Card(
              child: new InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => detail()),
                  );
                },
                child: Column(
                  children: [
                    SizedBox(
                        width: double.infinity,
                        height: 150,
                        child: Image.asset(imagePath, fit: BoxFit.cover)),
                    Positioned(
                        bottom: 0,
                        left: 10,
                        child: SizedBox(
                          height: 70,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10, right: 10, top: 15),
                            child: Row(
                              children: [

                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(nameShop,
                                        style: GoogleFonts.montserrat(
                                            fontSize: 17, fontWeight: FontWeight.bold)),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      children: [
                                        Icon(Icons.star, color: Colors.amber),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text(rating,
                                            style: GoogleFonts.montserrat(fontSize: 12)),
                                        SizedBox(
                                          width: 20,
                                        ),
                                        Icon(Icons.access_time, color: Colors.grey),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text(jamBuka,
                                            style: GoogleFonts.montserrat(fontSize: 12)),
                                        SizedBox(
                                          width: 100,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [DemoIconToggleButtons()],
                                )
                              ],
                            ),
                        )),
                    ),
                  ],
                ),
              ),
              clipBehavior: Clip.antiAliasWithSaveLayer,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              elevation: 10,

            ),
          ],
        ));
  }
}




