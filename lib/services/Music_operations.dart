import 'package:musicplayer2/models/Music.dart';

class MusicOperations {
  MusicOperations._();

  static List<Music> getMusic() {
    return <Music>[
      Music(
        '2016 - "Closer" by The Chainsmokers ft. Halsey',
        "https://images.squarespace-cdn.com/content/v1/5a93e128f93fd48afb74d295/1519738005359-C2VJ6GNIT2AGJ8KCQ7E3/CLOSER_FINAL_AW-uai-1440x1440.jpg",
        '''Closer is a song by American DJ duo The Chainsmokers featuring American singer Halsey. 
        It was released in 2016 and became a massive hit, topping the charts and receiving critical acclaim.
        The song's catchy melody and relatable lyrics made it a favorite.''',
      ),
      Music(
        '2017 - "Despacito" by Luis Fonsi & Daddy Yankee',
        "https://wallpapercave.com/wp/wp2123467.jpg",
        '''Despacito is a reggaeton and Latin pop song by Puerto Rican singer Luis Fonsi and featuring Puerto Rican rapper Daddy Yankee. 
        Released in 2017, it became a global phenomenon, breaking multiple records and becoming one of the most-watched YouTube videos ever.''',
      ),
      Music(
        '2018 - "God\'s Plan" by Drake',
        "https://i.pinimg.com/474x/77/f6/d6/77f6d6aae7321017fabcec4835815311.jpg",
        '''God's Plan is a hip-hop song by Canadian rapper Drake. Released in 2018, it quickly became a chart-topper and received critical acclaim.
        The song's emotional and introspective lyrics resonated with listeners.''',
      ),
      Music(
        '2019 - "Old Town Road" by Lil Nas X ft. Billy Ray Cyrus',
        "https://m.media-amazon.com/images/I/51s6t82xP2S._AC_UF894,1000_QL80_.jpg",
        '''Old Town Road is a genre-blending song by American rapper Lil Nas X, featuring country singer Billy Ray Cyrus.
        Released in 2019, it sparked a viral dance challenge and became one of the longest-running number-one hits in Billboard Hot 100 history.''',
      ),
      Music(
        '2020 - "Blinding Lights" by The Weeknd',
        "https://www.theweeknd.com/files/2021/02/release_202102_ab67616d0000b273775c1b5de32446751c21188e.jpg",
        '''Blinding Lights is a synth-pop and electronic song by Canadian singer The Weeknd. Released in 2020, it gained widespread popularity,
        especially on social media platforms like TikTok. The song's retro vibe and catchy chorus made it a favorite.''',
      ),
    ];
  }
}
