import "package:flutter/material.dart";

class Search extends StatelessWidget {
  const Search({super.key});

  Widget createAppBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: Text("Search"),
      actions: [
        Padding(
          padding: EdgeInsets.only(right: 15.0),
          child: Icon(Icons.search),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
          const Color.fromARGB(255, 73, 11, 87),
          Colors.black38,
          Colors.black54,
          Colors.black87
        ], begin: Alignment.topLeft, end: Alignment.bottomRight),
      ),
      child: Column(
        children: [
          createAppBar(),
          SizedBox(
            height: 5,
          ),
        ],
      ),
    ));
  }
}
