import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

import 'DetailScreen.dart';

class CoffeShop extends StatelessWidget {
  final String imagePath;
  final String nameShop;
  final String addr;
  final double rating;
  const CoffeShop({
    Key? key,
    required this.imagePath,
    required this.nameShop,
    required this.addr,
    required this.rating,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        height: 264,
        child: Stack(
          children: [
            Card(
              child: new InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DetailScreen(
                            todo: Todo(imagePath, nameShop, addr, rating))),
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
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(nameShop,
                                        style: GoogleFonts.montserrat(
                                            fontSize: 17,
                                            fontWeight: FontWeight.bold)),
                                    SizedBox(
                                      width: 8,
                                    ),
                                    Icon(Icons.star, color: Colors.amber),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(rating.toString(),
                                        style: GoogleFonts.montserrat(
                                            fontSize: 12)),
                                    SizedBox(
                                      width: 20,
                                    ),
                                  ],
                                ),
                                SizedBox(height: 10),
                                Text(addr,
                                    style:
                                    GoogleFonts.montserrat(fontSize: 12)),
                              ],
                            ),
                          ),
                        )),
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