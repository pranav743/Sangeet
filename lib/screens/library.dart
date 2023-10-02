import "package:flutter/foundation.dart";
import "package:flutter/material.dart";
import "package:just_audio/just_audio.dart";
import "package:on_audio_query/on_audio_query.dart";
import 'package:fluttertoast/fluttertoast.dart';



class Library extends StatefulWidget {
  const Library({Key? key}) : super(key: key);
  

  @override
  State<Library> createState() => _LibraryState();
}

class _LibraryState extends State<Library> {
  
  final OnAudioQuery _audioQuery = OnAudioQuery();
  final AudioPlayer _player = AudioPlayer();

  @override
  void initState() {
    super.initState();
    if (!kIsWeb) {
      requestStoragePermissions();
    }
  }

  @override
  void dispose(){
    _player.dispose();
    super.dispose();
  }
  void requestStoragePermissions() async {
  if (!kIsWeb) {
    bool permission_status = await _audioQuery.permissionsStatus();
    if (!permission_status){
      await _audioQuery.permissionsRequest();
    }
    setState(() {});
    }
  }


  @override
Widget build(BuildContext context) {
  return Scaffold(
    backgroundColor: Colors.black,
    appBar: AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: Text("Your Library"),
      actions: [
        Padding(
          padding: EdgeInsets.only(right: 15.0),
          child: Icon(Icons.settings),
        ),
      ],
    ),
    body: Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromRGBO(83, 19, 25, 1),
            Colors.black87
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      
      child: FutureBuilder<List<SongModel>>(
        future: _audioQuery.querySongs(
          sortType: SongSortType.TITLE,
          orderType: OrderType.ASC_OR_SMALLER,
          uriType: UriType.EXTERNAL,
          ignoreCase: true
        ), 
        builder: (context, item){
          if (item.data == null){
            return const Center(child: CircularProgressIndicator(),);
          }
          if (item.data!.isEmpty){
            return const Center(child: Text("No Songs found", style: TextStyle(color: Color.fromARGB(255, 96, 51, 51)),),);
          }

          return ListView.builder(
            itemCount: item.data!.length,
            itemBuilder: (context, index) {
              return Container(
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 25, 25, 25),
                  borderRadius: BorderRadius.circular(10.0), // Set the desired radius
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    title: Text(
                      item.data![index].title,
                      maxLines: 2, 
                      overflow: TextOverflow.ellipsis, // Allow it to be ellipsized if it exceeds the width
                      style: TextStyle(
                        color: const Color.fromARGB(255, 255, 255, 255),
                        fontFamily: AutofillHints.username,
                      ),
                    ),
                    trailing: const Icon(Icons.more_vert_outlined, color: Colors.white),
                    leading: QueryArtworkWidget(
                      id: item.data![index].id,
                      type: ArtworkType.AUDIO,
                    ),
                    onTap: () async {
                        Fluttertoast.showToast(
                          msg: "Playing: " + item.data![index].title,
                          toastLength: Toast.LENGTH_LONG, // Duration for how long the toast appears (Toast.LENGTH_SHORT or Toast.LENGTH_LONG)
                          gravity: ToastGravity.BOTTOM, // Position of the toast (TOP, CENTER, BOTTOM)
                          timeInSecForIosWeb: 1, // Duration for iOS web
                          backgroundColor: Colors.black.withOpacity(0.7), // Background color
                          textColor: Colors.white, // Text color
                          fontSize: 16.0, // Font size
                          // You can further customize the appearance with other properties like fontSize, radius, and more.
                        );

                        String? uri = item.data![index].uri;
                        await _player.setAudioSource(AudioSource.uri(Uri.parse(uri!)));
                        await _player.play();
                    },
                  ),
                ),
              );
            },
          );

        }
      ),
    ),
    // Add other widgets as needed.
  );
}

}
