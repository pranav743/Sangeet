import 'package:musicplayer2/models/Category.dart';

class CategoryOperations{
  static List<Category> getCategories(){
    return [
      Category("Top Hits","https://e1.pxfuel.com/desktop-wallpaper/532/110/desktop-wallpaper-7-best-websites-to-spotify-playlist-covers-aesthetic-playlist-covers-thumbnail.jpg", "top-hits", "https://mir-s3-cdn-cf.behance.net/project_modules/max_1200/924faf52097223.590463d34792e.jpg"),
      Category("Hot Songs","https://d1csarkz8obe9u.cloudfront.net/posterpreviews/tropical-beach-album-cover-art-v.1-design-template-f42b710683d89ee87c93ce3bbb79ba04_screen.jpg?ts=1648330214", "hot-songs", "https://mir-s3-cdn-cf.behance.net/project_modules/max_1200/924faf52097223.590463d34792e.jpg"),
      Category("Top EDMs","https://images.8tracks.com/cover/i/001/588/920/boo_ya-247.jpg?rect=0,0,640,640&q=98&fm=jpg&fit=max", "top-edms", "https://d1csarkz8obe9u.cloudfront.net/posterpreviews/music-album-cover-design-template-0b55f32b3855ba41707a08e386e95d6e_screen.jpg?ts=1561485226"),
      Category("2023 Hits", "https://create.vista.com/s3-static/templates/633afb2ad924097ccf8709b4-650px.webp", "2023-hits", "data:image/jpeg;base64,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"),
      Category("Hindi","https://marketplace.canva.com/EAEsukjNKjc/2/0/1600w/canva-orange-sunset-aesthetic-music-album-cover-sx5xxmyrxXY.jpg", "hindi", "https://www.designformusic.com/wp-content/uploads/2018/11/trailer-tension-album-cover-3d-design-1000x1000.jpg"),
      Category("Best of Raps", "https://mir-s3-cdn-cf.behance.net/project_modules/hd/137625112577745.60177189ef503.png", "best-of-raps", "https://i.pinimg.com/originals/41/a0/59/41a0593ec5c6562e838f349aba5ae9ef.jpg")
      ];

  }
}