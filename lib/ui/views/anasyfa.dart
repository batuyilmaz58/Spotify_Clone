import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:spotify_clone/data/entity/kartlar.dart';
import 'package:spotify_clone/data/entity/oynatma_listeleri.dart';
import 'package:spotify_clone/data/entity/pop%C3%BCler_radyolar.dart';

class Anasyfa extends StatefulWidget {
  const Anasyfa({super.key});

  @override
  State<Anasyfa> createState() => _AnasyfaState();
}

class _AnasyfaState extends State<Anasyfa> {

  Future<List<Playlist>> playlistleriYukle() async {
    var playList = <Playlist>[];
    var f1 = Playlist(ad: "Gece Yolculuğu", resim: "playlist1.jpg");
    var f2 = Playlist(ad: "Lo-Fi Chill Beats", resim: "playlist2.jpg");
    var f3 = Playlist(ad: "Workout Power", resim: "playlist3.jpg");
    var f4 = Playlist(ad: "Unutulmaz 2000’ler", resim: "playlist4.jpg");
    var f5 = Playlist(ad: "Sabah Kahvesi", resim: "playlist5.jpg");
    var f6 = Playlist(ad: "Türkçe Pop Mix", resim: "playlist6.jpg");
    var f7 = Playlist(ad: "Indie Vibes", resim: "playlist7.jpg");
    var f8 = Playlist(ad: "Akustik Rüzgar", resim: "playlist8.jpg");
    playList.addAll([f1, f2, f3, f4, f5, f6, f7, f8]);
    return playList;
  }

  Future<List<Kartlar>> kartlariYukle() async {
    var kartlar = <Kartlar>[];
    var f1 = Kartlar(resim: "adamlar.jpg", aciklama: "Adamlar, Barış Manço, mor ve ötesi ve daha fazlası");
    var f2 = Kartlar(resim: "ahmet_kaya.jpg", aciklama: "Ahmet Kaya, Müslüm Gürses, Mokali ve daha fazlası");
    var f3 = Kartlar(resim: "göksel.jpg", aciklama: "Göksel, Mustafa Sandal, Oğuzhan Koç ve daha fazlası");
    var f4 = Kartlar(resim: "lvbelc5.jpg", aciklama: "Lvbel C5, BLOK3, Organize ve daha fazlası");
    var f5 = Kartlar(resim: "sagopa_kajmer.jpg", aciklama: "Sagopa Kajmer, Şanışer, M Lisa ve daha fazlası");
    var f6 = Kartlar(resim: "semicenk.jpg", aciklama: "Semicenk, Sancak, Sıla ve daha fazlası");
    var f7 = Kartlar(resim: "haftalik_kesif.png", aciklama: "Gizli cevherler, az bilinenler ve gelecekteki favoriler her pazartesi güncellenir.");
    kartlar.addAll([f1, f2, f3, f4, f5, f6, f7]);
    return kartlar;
  }

  Future<List<PopulerRadyolar>> radyolariYukle() async {
    var radyolar = <PopulerRadyolar>[];
    var f1 = PopulerRadyolar(resim: "blok3_radyosu.jpg", aciklama: "BLOK3, Poizi, Ati242, Era7capone ve daha fazlası");
    var f2 = PopulerRadyolar(resim: "melike_sahin_radyosu.jpg", aciklama: "Dedublüman, Melike Şahin ve daha fazlası");
    var f3 = PopulerRadyolar(resim: "yalin_radyosu.jpg", aciklama: "Yalın, Gülşen, Murat Boz, Hande Yener ve daha fazlası");
    var f4 = PopulerRadyolar(resim: "semicenk_radyosu.jpg", aciklama: "BLOK3, Semicenk, Dedublüman, Simge ve daha fazlası");
    var f5 = PopulerRadyolar(resim: "sezen_aksu_radyosu.jpg", aciklama: "Sezen Aksu, Dedublüman, Mabel Mativ ve daha fazlası");
    radyolar.addAll([f1, f2, f3, f4, f5]);
    return radyolar;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      appBar:
      // AppBar'da CircleAvatar kullanıldı + 3 container
      AppBar(
        backgroundColor: const Color(0xFF121212),
        title: Row(
          children: [
            const CircleAvatar(
              radius: 18,
              backgroundImage: AssetImage("images/pp.jpg"),
            ),
            const SizedBox(width: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildFilterChip("Tümü", true),
                _buildFilterChip("Müzik", false),
                _buildFilterChip("Podcast'ler", false, width: 110),
              ],
            )
          ],
        ),
      ),
      body:
      // Playlistler Gridview kullanıldı
      FutureBuilder(
        future: playlistleriYukle(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var playList = snapshot.data!;
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 🔹 Üst Grid
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: playList.length,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 8,
                      crossAxisSpacing: 8,
                      childAspectRatio: 3,
                    ),
                    itemBuilder: (context, indeks) {
                      var play = playList[indeks];
                      return Container(
                        margin: const EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          color: const Color(0xFF2A2A2A),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.asset(
                                "images/${play.resim}",
                                width: 55,
                                height: 55,
                                fit: BoxFit.cover,
                              ),
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                play.ad,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),

                  const SizedBox(height: 20),

                  // Kartların üstü
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    child: Text(
                      "Ela İçin Derlendi",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Roboto"
                      ),
                    ),
                  ),

                  const SizedBox(height: 12),

                  // Daily Mix Kartları ListView, scroll kullanıldı
                  FutureBuilder(
                    future: kartlariYukle(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        var kartlar = snapshot.data!;
                        return SizedBox(
                          height: 210,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: kartlar.length,
                            itemBuilder: (context, i) {
                              var kart = kartlar[i];
                              return Container(
                                width: 160,
                                margin: const EdgeInsets.only(left: 12),
                                decoration: BoxDecoration(
                                  color: const Color(0xFF121212),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    AspectRatio(
                                      aspectRatio: 1,
                                      child: ClipRRect(
                                        borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(3),
                                          topRight: Radius.circular(3),
                                          bottomLeft: Radius.circular(3),
                                          bottomRight: Radius.circular(3),
                                        ),
                                        child: Image.asset(
                                          "images/${kart.resim}",
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 8),
                                      child: Text(
                                        kart.aciklama,
                                        style: const TextStyle(
                                          color: Color(0xFFB3B3B3),
                                          fontFamily: "Roboto",
                                          fontSize: 13,
                                        ),
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        );
                      } else {
                        return const Center(
                          child: CircularProgressIndicator(color: Color(0xFF1DB954)),
                        );
                      }
                    },
                  ),

                  // Murat Boz ile benzer diğer müzikler text
                  const Padding(
                    padding: EdgeInsets.all(12),
                    child: Text(
                      "Murat Boz ile benzer diğer müzikler",
                      style: TextStyle(
                          color: Color(0xFFB3B3B3),
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Roboto"
                      ),
                    ),
                  ),

                  // Murat Boz Radyosu Container
                  Center(
                      child:Padding(
                        padding: const EdgeInsets.only(top:4.0),
                        child: Container(
                          width: 390,
                          height: 240,
                          decoration: BoxDecoration(
                              color: Color(0xFF9B7AD9),
                              borderRadius: BorderRadius.circular(18),
                            gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              const Color(0xFF9B7AD9),        // Üst kısım — parlak mor
                              const Color(0xFF4A148C),        // Orta — koyu mor
                              //Colors.black12.withOpacity(0.1),  // Alt kısım — siyah saydam gölge
                            ],
                          ),
                          ),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(8),
                                      child: Image.asset(
                                        "images/murat_boz_radyo.jpg",
                                        width: 100,
                                        height: 100,
                                        fit: BoxFit.cover,
                                      ),
                                    ),

                                    const SizedBox(width: 12),

                                    Expanded(
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Column(crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                              "Murat Boz Radyosu",
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 22,
                                              ),
                                            ),
                                              Text(
                                                "Spotify",
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 16
                                              ),)
                                            ]
                                          ),

                                          Icon(
                                            Icons.more_horiz,
                                            color: Colors.white,
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left:16.0),
                                child: Row(mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text("50 şarkı • Poizi, SNOW, Murat Boz, Demet \nAkalın, Tarkan",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold
                                    ),),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 14.0),
                                    child: Container(
                                      width: 200,
                                      height: 30,
                                      decoration: BoxDecoration(
                                        color: Color(0xFF212121),
                                        borderRadius: BorderRadius.circular(40)
                                      ),
                                      child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Icon(Icons.cast_connected, color: Colors.white,size: 20,),
                                          Text("Çalma listesini önizle",
                                            style: TextStyle(
                                                color: Colors.white,
                                              fontWeight: FontWeight.bold
                                            ),)
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 110,
                                  ),
                                  Row(
                                    children: [
                                      Icon(Icons.add_circle_outline, color: Colors.white,),
                                      SizedBox(width: 6,),
                                      Icon(Icons.play_circle, color: Colors.white,size: 35)
                                    ],
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      )
                  ),

                  const SizedBox(height: 20,),

                  // Kartların üstü
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    child: Text(
                      "Popüler Radyolar",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Roboto"
                      ),
                    ),
                  ),

                  const SizedBox(height: 12),

                  // Popüler Radyolar
                  FutureBuilder(
                    future: radyolariYukle(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        var radyolar = snapshot.data!;
                        return SizedBox(
                          height: 210,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: radyolar.length,
                            itemBuilder: (context, i) {
                              var radyo = radyolar[i];
                              return Container(
                                width: 160,
                                margin: const EdgeInsets.only(left: 12),
                                decoration: BoxDecoration(
                                  color: const Color(0xFF121212),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    AspectRatio(
                                      aspectRatio: 1,
                                      child: ClipRRect(
                                        borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(3),
                                          topRight: Radius.circular(3),
                                          bottomLeft: Radius.circular(3),
                                          bottomRight: Radius.circular(3),
                                        ),
                                        child: Image.asset(
                                          "images/${radyo.resim}",
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 8),
                                      child: Text(
                                        radyo.aciklama,
                                        style: const TextStyle(
                                          color: Color(0xFFB3B3B3),
                                          fontFamily: "Roboto",
                                          fontSize: 13,
                                        ),
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        );
                      } else {
                        return const Center(
                          child: CircularProgressIndicator(color: Color(0xFF1DB954)),
                        );
                      }
                    },
                  ),
                ],
              ),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(color: Color(0xFF1DB954)),
            );
          }
        },
      ),
    );
  }

  // 🔸 Küçük yardımcı widget
  Widget _buildFilterChip(String label, bool selected, {double width = 75}) {
    return Container(
      width: width,
      height: 35,
      margin: const EdgeInsets.symmetric(horizontal: 6),
      decoration: BoxDecoration(
        color: selected ? const Color(0xFF1DB954) : const Color(0xFF535353),
        borderRadius: BorderRadius.circular(35),
      ),
      alignment: Alignment.center,
      child: Text(
        label,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
