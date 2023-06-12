import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rateme/api/ApiService.dart';
import '../BottomNav.dart';

class DetailScreen extends StatelessWidget {
  // In the constructor, require a Todo.
  const DetailScreen({super.key, required this.todo});

  // Declare a field that holds the Todo.
  final Todo todo;

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
                              image: NetworkImage(todo.imagePath))),
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
                          Navigator.of(context, rootNavigator: true)
                              .pushAndRemoveUntil(
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
                            padding: const EdgeInsets.only(
                                left: 16.0, top: 16.0, right: 16.0),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      todo.nameShop,
                                      style: GoogleFonts.montserrat(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(width: 8),
                                    Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(todo.rating.toString(),
                                        style: GoogleFonts.montserrat(fontSize: 12))
                                  ],
                                ),
                              ],
                            )),
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
                  padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(todo.addr.toString(),
                          style: GoogleFonts.montserrat(fontSize: 12)),
                      SizedBox(height: 32),
                      Row(
                        children: [
                          Text('Menu',
                              style: GoogleFonts.montserrat(
                                  fontSize: 18, fontWeight: FontWeight.bold))
                        ],
                      )
                    ],
                  ),
                ),

                // Alamat
                TitleDetail(title: todo.nameShop, detail: todo.addr),

                // Deskripsi

                // Title Ulasan / Comment

                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Text(
                    "Comment",
                    style: GoogleFonts.montserrat(
                        fontSize: 12, fontWeight: FontWeight.bold),
                  ),
                ),
                Comment()
              ],
            )),
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

class Todo {
  final String imagePath;
  final String nameShop;
  final String addr;
  final double rating;
  const Todo(this.imagePath, this.nameShop, this.addr, this.rating);
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