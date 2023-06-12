import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rateme/login.dart';

import '../api/ApiService.dart';
import 'DetailCafe.dart';
import '../model/listCafe.dart';

void main() {
  runApp(const Home());
}

class Home extends StatelessWidget {
  const Home({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RateMe',
      theme: ThemeData(
        primarySwatch: Colors.brown,
      ),
      home: const HomePage(title: 'RateMe'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});
  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class MenuItem {
  final String text;
  final IconData icon;

  const MenuItem({
    required this.text,
    required this.icon,
  });
}

class MenuItems {
  static const List<MenuItem> itemsFirst = [
    itemSignOut,
  ];

  static const itemSignOut = MenuItem(text: 'Sign Out', icon: Icons.logout);
}

class _HomePageState extends State<HomePage> {
  late Future<List<listCafe>> cafe;

  @override
  void initState() {
    super.initState();
    cafe = fetchCafe();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          backgroundColor: Color(0xff7c6354),
          leading: Container(
            padding: EdgeInsets.only(top: 15, bottom: 15, left: 15),
            child: Image.asset('assets/whiteLogo.png'),
          ),
          actions: [
            PopupMenuButton<MenuItem>(
              onSelected: (item) => onSelected(context, item),
              itemBuilder: (context) => [
                ...MenuItems.itemsFirst.map(buildItem).toList(),
              ],
            ),
          ],
        ),
        backgroundColor: Colors.white,
        body: SafeArea(
            child: Column(
              children: [
                SizedBox(height: 18),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Container(
                    height: 60,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Color(0xFFF5F5F7),
                        borderRadius: BorderRadius.circular(30)),
                    child: TextField(
                      cursorHeight: 20,
                      autofocus: false,
                      decoration: InputDecoration(
                        hintText: "Cari kafe atau restaurant",
                        prefixIcon: Icon(Icons.search),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey, width: 2),
                            borderRadius: BorderRadius.circular(30)),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 12),
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.only(left: 15),
                      child: Text('Rekomendasi',
                          style: GoogleFonts.montserrat(
                              fontSize: 24, fontWeight: FontWeight.bold)),
                    )
                  ],
                ),
                SizedBox(height: 16),
                Expanded(
                    child: FutureBuilder<List<listCafe>>(
                        future: cafe,
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            if (snapshot.data!.isEmpty) {
                              return const Center(
                                child: Text("gada"),
                              );
                            }
                            return ListView.separated(
                              padding: const EdgeInsets.all(8),
                              itemCount: snapshot.data!.length,
                              itemBuilder: (context, index) {
                                return CoffeShop(
                                  imagePath: snapshot.data![index].image,
                                  nameShop: snapshot.data![index].title,
                                  addr: snapshot.data![index].description,
                                  rating: snapshot.data![index].rating,
                                );
                              },
                              separatorBuilder: (BuildContext context, int index) {
                                return Divider(
                                  thickness: 0.5,
                                  indent: 250,
                                  endIndent: 250,
                                );
                              },
                            );
                          } else {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                        }))
              ],
            )));
  }

  PopupMenuItem<MenuItem> buildItem(MenuItem item) => PopupMenuItem<MenuItem>(
      value: item,
      child: Row(
        children: [
          Icon(item.icon, color: Colors.black, size: 20),
          const SizedBox(width: 12),
          Text(item.text)
        ],
      ));

  void onSelected(BuildContext context, MenuItem item) {
    switch (item) {
      case MenuItems.itemSignOut:
        Navigator.of(context, rootNavigator: true).pushAndRemoveUntil(
          MaterialPageRoute(
            builder: (BuildContext context) {
              return LoginApp();
            },
          ),
              (_) => false,
        );
    }
  }
}




