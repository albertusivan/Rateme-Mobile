import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rateme/BottomNav.dart';
import 'package:rateme/home2.dart';

void main() {
  runApp(detail());
}

class detail extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RateMe',
      theme: ThemeData(
        primarySwatch: Colors.brown,
      ),
      home: const DetailPage(title: 'RateMe'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class DetailPage extends StatefulWidget {
  const DetailPage({super.key, required this.title});
  final String title;

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double widht = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Tumpukan foto dan Container Nama Toko
                Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Container(
                      height: height * 0.3,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage("assets/bedacerita.jpeg"))),
                    ),
                    Positioned(
                        top: 16,
                        left: 16,
                        child: InkWell(
                          child: Container(
                          child: Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                          ),
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.all(Radius.circular(20))),
                          ),
                          onTap: () {
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(builder: (context) => navbar()),
                            // );
                            Navigator.of(context, rootNavigator: true).pushAndRemoveUntil(
                              MaterialPageRoute(
                                builder: (BuildContext context) {
                                  return navbar();
                                },
                              ),
                                  (_) => false,
                            );
                          },
                        ),
                      ),
                    Container(
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Text(
                            "Beda Cerita",
                            style: GoogleFonts.montserrat(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ),
                        height: height * .07,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20))))
                  ],
                ),
                // Row rating dan jam buka
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text("4.6 (32 review)",
                              style: GoogleFonts.montserrat(fontSize: 12))
                        ],
                      ),
                    ],
                  ),
                ),

                // Alamat
                TitleDetail(
                    title: "Alamat",
                    detail:
                    "Jl. Jalan capek banget\nBandung, Bojong Swan"),

                // Deskripsi
                TitleDetail(
                    title: "Menu",
                    detail:
                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."),

                // Title Ulasan / Comment

                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Text(
                    "Comment",
                    style: GoogleFonts.montserrat(
                        fontSize: 12, fontWeight: FontWeight.bold),
                  ),
                ),

                // Widget Ulasan / Comment
                Comment(), Comment(), Comment(), Comment()
              ],
            )),
      ),
    );
  }
}

class Comment extends StatelessWidget {
  const Comment({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Row(
            children: [
              Image.network(
                "https://oliver-andersen.se/wp-content/uploads/2018/03/cropped-Profile-Picture-Round-Color.png",
                width: 40,
              ),
              SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Albert Von Martin",
                      style: GoogleFonts.montserrat(fontSize: 12,fontWeight: FontWeight.w700)),
                ],
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Text(
              style: GoogleFonts.montserrat(fontSize: 12),
              " is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, ")
        ],
      ),
    );
  }
}

class TitleDetail extends StatelessWidget {
  final String title;
  final String detail;
  const TitleDetail({Key? key, required this.title, required this.detail})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: GoogleFonts.montserrat(
                fontSize: 12, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 10,
          ),
          Text(detail, style: GoogleFonts.montserrat(fontSize: 12))
        ],
      ),
    );
  }
}