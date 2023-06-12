import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';


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
      home: const MyHomePage(title: 'RateMe'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  final List<String> imgList = [
    "assets/banner1.png",
    "assets/banner2.png",
    "assets/banner3.png",

  ];

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

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Color(0xff7c6354),
        actions: [
          IconButton(
              onPressed: (){
                showSearch(context: context,
                delegate: customSearchDelegate());
              },
              icon: const Icon(Icons.search)
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 10),
          child : Column(
            children: [
              Container(
                child: CarouselSlider(
                  options: CarouselOptions(
                    autoPlay: true,
                    viewportFraction: 1,
                    enlargeCenterPage: true,
                  ),
                  items: imgList.map((item) => Container(
                    child: Container(
                      margin: EdgeInsets.only(top: 5.0, left: 5.0, right: 5.0),
                      child: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(5.0)),
                          child: Stack(
                            children: <Widget>[
                              Image.asset(item),
                            ],
                          )),
                    ),
                  ))
                      .toList(),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(top: 0, bottom: 15.0),
                child: const Text("Recommendation",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 0.25,
                    )),
              ),
              Container(
                height: 450,
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
                  separatorBuilder: (BuildContext context, int index){
                    return Divider(thickness: 0.5,
                    indent: 250,
                    endIndent: 250,
                    );
                  },
                ),
              ),
            ],
          ),
        )
      )
    );
  }
}

class customSearchDelegate extends SearchDelegate{
  List<String> cafe = [
    'Nomina',
    'Diagram',
    'Sincere',
    'Tahi Lalat',
    'Beda Cerita',
    'Mana',
    'Taman Dilan',
    'Jurnal Risa',
  ];

  @override
  List<Widget> buildActions(BuildContext context) {
    return[
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: (){
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: (){
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    List<String> matchQuery = [];
    for (var cafeName in cafe ){
      if(cafeName.toLowerCase().contains(query.toLowerCase())){
        matchQuery.add(cafeName);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context,index){
        var result = matchQuery[index];
        return ListTile(
          title: Text(result),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> matchQuery = [];
    for (var cafeName in cafe ){
      if(cafeName.toLowerCase().contains(query.toLowerCase())){
        matchQuery.add(cafeName);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context,index){
        var result = matchQuery[index];
        return ListTile(
          title: Text(result),
        );
      },
    );
  }

}