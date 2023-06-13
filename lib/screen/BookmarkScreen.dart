import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rateme/api/ApiService.dart';
import 'package:rateme/detail.dart';
import 'package:rateme/model/listBookmark.dart';
import 'package:rateme/model/listCafe.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(Bookmark());
}

class Bookmark extends StatelessWidget {
  const Bookmark({Key? key}) : super(key: key);

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

Future<List<listCafe>> fetchCafe() async {
  final res = await http.get(Uri.parse('http://192.168.77.125:8000/api/cafe'));
  if (res.statusCode == 200) {
    var data = jsonDecode(res.body);
    var parsed = data['list'].cast<Map<String, dynamic>>();
    return parsed.map<listCafe>((json) => listCafe.fromJson(json)).toList();
  } else {
    throw Exception('Failed');
  }
}

Future<List<listBookmark>> fetchBookmark(String userID) async {
  final res = await http.get(
      Uri.parse('http://192.168.77.125:8000/api/cafe/bookmark?user_id=${userID}'));
  if (res.statusCode == 200) {
    var data = jsonDecode(res.body);
    var parsed = data['list'].cast<Map<String, dynamic>>();
    return parsed
        .map<listBookmark>((json) => listBookmark.fromJson(json))
        .toList();
  } else {
    throw Exception('Failed');
  }
}

class DataGroup {
  // final Future<Map<String, dynamic>> fromBook;
  // final Future<Map<String, dynamic>> fromCafes;
  final Future<List<listCafe>> fromCafes;
  final Future<List<listBookmark>> fromBook;
  DataGroup({required this.fromBook, required this.fromCafes});
}

class DataGroupFuture {
  final Future<List<listBookmark>> fromBookF;
  final Future<List<listCafe>> fromCafesF;
  // final Future<Map<String, dynamic>> fromBookF;
  // final List<Map<String, dynamic>> fromCafesF;
  DataGroupFuture({required this.fromBookF, required this.fromCafesF});
  Future<DataGroup> get future async {
    Future<List<listBookmark>> fromBook = fromBookF;
    Future<List<listCafe>> fromCafes = fromCafesF;
    return DataGroup(fromBook: fromBook, fromCafes: fromCafes);
  }
}

class _MyBookmarkState extends State<MyBookmark> {
  // final DataGroupFuture dataGroupF = DataGroupFuture(
  //   fromBookF: fetchBookmark("4"),
  //   fromCafesF: fetchCafe(),
  // );

  late Future<List<listBookmark>> bookmark;
  late Future<List<listCafe>> cafe;
  late List<int> cafeID = [];

  @override
  void initState() {
    super.initState();
    bookmark = fetchBookmark("4");
    cafe = fetchCafe();
  }

  // @override
  // void initStateCafe() {
  //   super.initState();
  //   cafe = fetchCafe();
  // }

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
                Container(
                    child: FutureBuilder<List<listBookmark>>(
                        future: bookmark,
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            if (snapshot.data!.isEmpty) {
                              return const Center(
                                child: Text("gada"),
                              );
                            }

                            for (int i = 0; i < snapshot.data!.length; i++) {
                              // add data to list you want to return.
                              cafeID.add(snapshot.data![i].cafe_id);
                            }

                            return Text(
                              cafeID.toString(),
                              style: TextStyle(color: Colors.white10),
                            );

                            // List<String> ids = new ArrayList<String>(snapshot.);
                            // return Expanded(
                            //   child: ListView.builder(
                            //     padding: const EdgeInsets.all(8),
                            //     itemCount: snapshot.data!.length,
                            //     itemBuilder: (context, index) {
                            //       cafeID.add(snapshot.data![index].cafe_id);
                            //       // return Text(cafeID.toString());
                            //     },
                            // separatorBuilder:
                            //     (BuildContext context, int index) {
                            //   return Divider(
                            //     thickness: 0.5,
                            //     indent: 250,
                            //     endIndent: 250,
                            //   );
                            // },
                            // ),
                            // );
                          } else {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                        })),
                FutureBuilder<List<listCafe>>(
                    future: cafe,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        if (snapshot.data!.isEmpty) {
                          return const Center(
                            child: Text("gada"),
                          );
                        }
                        return Expanded(
                          child: ListView.separated(
                            padding: const EdgeInsets.all(8),
                            itemCount: snapshot.data!.length,
                            itemBuilder: (context, index) {
                              // ID = snapshot.data![index].id;
                              if (cafeID.contains(snapshot.data![index].id)) {
                                return CoffeShop(
                                  imagePath: snapshot.data![index].image,
                                  nameShop: snapshot.data![index].title,
                                  addr: snapshot.data![index].description,
                                  rating: snapshot.data![index].rating,
                                );
                              }
                            },
                            separatorBuilder:
                                (BuildContext context, int index) {
                              return Divider(
                                thickness: 0.5,
                                indent: 250,
                                endIndent: 250,
                              );
                            },
                          ),
                        );
                      } else {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    })
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
  final String addr;
  final double rating;
  const CoffeShop(
      {Key? key,
        required this.imagePath,
        required this.nameShop,
        required this.addr,
        required this.rating})
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
                        child: Image.network(imagePath, fit: BoxFit.cover)),
                    Positioned(
                      bottom: 0,
                      left: 10,
                      child: SizedBox(
                          height: 80,
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 10, right: 10, top: 15),
                            child: Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // Text(nameShop,
                                    //     style: GoogleFonts.montserrat(
                                    //         fontSize: 17,
                                    //         fontWeight: FontWeight.bold)),
                                    // SizedBox(
                                    //   height: 10,
                                    // ),
                                    Row(
                                      children: [
                                        Text(nameShop,
                                            style: GoogleFonts.montserrat(
                                                fontSize: 17,
                                                fontWeight: FontWeight.bold)),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Icon(Icons.star, color: Colors.amber),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text(rating.toString(),
                                            style: GoogleFonts.montserrat(
                                                fontSize: 12)),
                                        DemoIconToggleButtons()
                                      ],
                                    ),
                                  ],
                                ),
                                // Column(
                                //   crossAxisAlignment: CrossAxisAlignment.end,
                                //   children: [
                                //     SizedBox(width: 10),
                                //     DemoIconToggleButtons()
                                //   ],
                                // )
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
