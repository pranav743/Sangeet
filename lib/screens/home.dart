import 'package:musicplayer2/models/Category.dart';
import "package:flutter/material.dart";
import 'package:musicplayer2/services/Category_operations.dart';
import 'package:musicplayer2/services/Music_operations.dart';
import 'package:musicplayer2/models/Music.dart';

class MyHome extends StatelessWidget {

  Widget createCategory(Category category){

    return ClipRRect(
      borderRadius: BorderRadius.circular(8.0), // Adjust the radius as needed
      child: Container(
        color: Color.fromARGB(179, 25, 25, 25),
        child: Row(
          children: [
            Image.network(category.imageUrl, fit: BoxFit.cover, width: 60,),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(category.name, style: TextStyle(color: Colors.white),),
            )
          ],
        ),
      ),
    );

  }

  Widget createMusic(Music music) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child:
              Container(
                height: 200,
                width: 200,
                child: Image.network(music.image, fit: BoxFit.cover),
              ),
          ),
          Container(
            width: 200,
            child: Padding(
              padding: const EdgeInsets.only(top: 8, bottom: 8),
              child: Text(
                music.name,
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          Container(
            width: 200, // Adjust the width as needed
            child: Text(
              music.desc.length > 20 ? '${music.desc.substring(0, 20)}...' : music.desc,
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );

  }

  Widget CreateMusicList(String label) {
    List<Music> musicList = MusicOperations.getMusic();
    return Padding(
      padding: const EdgeInsets.only(left: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Text(label, style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w600)),
          ),
          SizedBox(height: 10),
          Container(
            constraints: BoxConstraints(maxHeight: 300), // Set a maximum height
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return createMusic(musicList[index]);
              },
              itemCount: musicList.length,
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> createListOfCategories(){
    List<Category> categoryList = CategoryOperations.getCategories();
    List<Widget> categories = categoryList.map((Category category) => createCategory(category))
    .toList();
  return categories; 
  } 

  Widget createAppBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: Text("Home"),
      actions: [
        Padding(
          padding: EdgeInsets.only(right: 15.0),
          child: Icon(Icons.settings),
        ),
      ],
    );
  }

  Widget CreateGrid() {
    return Container(
      padding: EdgeInsets.only(right: 12, left: 12, bottom: 10),
      height: 280,
      child: GridView.count(
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        childAspectRatio: 3,
        children: 
          createListOfCategories(),
      ),
    );
  }

@override
Widget build(BuildContext context) {
  return Scaffold(
    
    body: CustomScrollView(
      
      slivers: [
        SliverAppBar(
          pinned: true,
          expandedHeight: 150,
          backgroundColor: const Color.fromARGB(255, 0, 0, 0), // Set the desired height for the app bar
          flexibleSpace: FlexibleSpaceBar(
            background: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color.fromARGB(150, 0, 0, 0),
                    Color.fromARGB(255, 51, 80, 91), // Adjust your desired gradient colors here
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomLeft,
                ),
              ),
            ),
            title: Text("Hello, Pranav"),
            centerTitle: true,
          ),
          actions: [
            Padding(
              padding: EdgeInsets.only(right: 15.0),
              child: Icon(Icons.settings),
            ),
          ],
        ),
        SliverList(
          delegate: SliverChildListDelegate([
            Container(
              decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  const Color.fromARGB(255, 60, 78, 88),
                  Colors.black87,
                  Colors.black87,
                  Colors.black87
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ), // Set your desired background color here
              child: Column(
                children: [
                  CreateGrid(),
                  CreateMusicList("Hits By Year"),
                  CreateMusicList('Only for You'),
                ],
              ),
            ),
          ]),
        ),

      ],
    ),
  );
}
}
