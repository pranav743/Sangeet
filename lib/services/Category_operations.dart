import 'package:musicplayer2/models/Category.dart';

class CategoryOperations{
  static List<Category> getCategories(){
    return [
      Category("Top Hits","https://e1.pxfuel.com/desktop-wallpaper/532/110/desktop-wallpaper-7-best-websites-to-spotify-playlist-covers-aesthetic-playlist-covers-thumbnail.jpg"),
      Category("Hot Songs","https://d1csarkz8obe9u.cloudfront.net/posterpreviews/tropical-beach-album-cover-art-v.1-design-template-f42b710683d89ee87c93ce3bbb79ba04_screen.jpg?ts=1648330214"),
      Category("Top EDMs","https://images.8tracks.com/cover/i/001/588/920/boo_ya-247.jpg?rect=0,0,640,640&q=98&fm=jpg&fit=max"),
      Category("2023 Hits", "https://create.vista.com/s3-static/templates/633afb2ad924097ccf8709b4-650px.webp"),
      Category("Hindi","https://marketplace.canva.com/EAEsukjNKjc/2/0/1600w/canva-orange-sunset-aesthetic-music-album-cover-sx5xxmyrxXY.jpg"),
      Category("Best of Raps", "https://mir-s3-cdn-cf.behance.net/project_modules/hd/137625112577745.60177189ef503.png")

      
      ];

  }
}