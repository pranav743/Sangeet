import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

class CategoryPage extends StatefulWidget {
  final String categoryName;
  final String folderName; // Define a variable to hold the received argument
  final String categoryImage;

  const CategoryPage(
      {Key? key,
      required this.categoryName,
      required this.folderName,
      required this.categoryImage})
      : super(key: key); // Receive the argument

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  late DatabaseReference ref; // Declare the reference variable

  @override
  void initState() {
    super.initState();
    ref = FirebaseDatabase.instance.ref("Songs/" +
        widget.folderName); // Access widget property within initState
  }

  Widget createAppBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: Text(widget.categoryName),
      actions: [
        Padding(
          padding: EdgeInsets.only(right: 15.0),
          child: Icon(Icons.more_vert_outlined),
        ),
      ],
    );
  }

  Widget createListItem(String title, String singer, String image) {
    return Card(
        color: Color.fromARGB(0, 0, 0, 0),
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(1.0),
        ),
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  CircleAvatar(
                    radius: 25,
                    backgroundImage: NetworkImage(
                      image, // Replace with your image URL
                    ),
                    child: ClipOval(
                      child: Image.network(
                        image,
                        fit: BoxFit.cover,
                        errorBuilder: (BuildContext context, Object exception,
                            StackTrace? stackTrace) {
                          return Image.asset(
                            'assets/song_icon.jpg', // Replace with the path to your default image
                            fit: BoxFit.cover,
                          );
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        singer.length <= 32
                            ? singer
                            : singer.substring(0, 32) + '...',
                        style: TextStyle(color: Colors.grey, fontSize: 15),
                      )

                      // SizedBox(height: 5,),
                      // Container(
                      //   width: 200,
                      //   // constraints: BoxConstraints(maxWidth: 150),
                      //   child: Text(
                      //     singer,
                      //     style:
                      //         TextStyle(color: Colors.grey, fontSize: 15),
                      //     maxLines: 1,
                      //     overflow: TextOverflow
                      //         .ellipsis, // Adds ellipsis if text exceeds the width
                      //   ),
                      // ),
                    ],
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                const Color.fromARGB(255, 73, 11, 87),
                Colors.black87,
                Colors.black,
                Colors.black
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Container(
            child: Column(
              children: [
                createAppBar(),
                SizedBox(
                  height: 25,
                ),
                Center(
                  child: Container(
                    padding: EdgeInsets.all(15),
                    height: 300,
                    width: MediaQuery.of(context).size.width - 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.network(
                        widget.categoryImage, // Replace this URL with your image's URL
                        fit: BoxFit
                            .cover, // Adjust the fit of the image within the container
                        loadingBuilder: (BuildContext context, Widget child,
                            ImageChunkEvent? loadingProgress) {
                          if (loadingProgress == null) {
                            return child; // Return the image if it's fully loaded
                          } else {
                            return Center(
                                child:
                                    CircularProgressIndicator()); // Show a loading indicator
                          }
                        },
                        errorBuilder: (BuildContext context, Object exception,
                            StackTrace? stackTrace) {
                          return Text(
                              'Failed to load the image'); // Show this text if the image fails to load
                        },
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Expanded(
                  child: FirebaseAnimatedList(
                    query: ref,
                    itemBuilder: (context, snapshot, animation, index) {
                      print(snapshot);
                      return createListItem(
                        snapshot.child('title').value.toString(),
                        snapshot.child('singer').value.toString(),
                        snapshot.child('image').value.toString(),
                      );
                    },
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
