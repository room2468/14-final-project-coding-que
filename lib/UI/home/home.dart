import 'package:tontonin/UI/detail/detail_page.dart';
import 'package:tontonin/UI/home/now_playing.dart';
import 'package:tontonin/UI/home/popular.dart';
import 'package:tontonin/UI/home/top_rating.dart';
import 'package:tontonin/UI/home/upcoming.dart';
import 'package:tontonin/UI/login_page.dart';
import 'package:tontonin/service/service.dart';
import 'package:tontonin/service/sign_in.dart';
import 'package:flutter/material.dart';

class Tontonin extends StatefulWidget {
  @override
  _MovieListState createState() => _MovieListState();
}

class _MovieListState extends State<Tontonin> {
  int moviesCount1;
  int moviesCount2;
  List movies1;
  List movies2;
  TontoninService service;
  
  Future initialize() async {
    movies1 = [];
    movies2 = [];
    movies1 = await service.getTrendingDay();
    movies2 = await service.getTrendingWeek();
    setState(() {
      moviesCount1 = movies1.length;
      moviesCount2 = movies2.length;
      movies1 = movies1;
      movies2 = movies2;
    });
  }

  final String imgPath = 'https://image.tmdb.org/t/p/w600_and_h900_bestv2/'; 

  @override
  void initState() {
    service = TontoninService();
    initialize();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Icon(
          Icons.movie,
          color: Colors.black45,
        ),
        title: Text(
          'Tontonin'.toUpperCase(),
          style: Theme.of(context).textTheme.caption.copyWith(
            color: Colors.black45,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          Container(
            margin: EdgeInsets.only(right: 15),
            child: Image.asset('img/Tontonin.png')
          ),
        ],
      ),
      body: Stack(
        children: <Widget>[
          Container(
            height: size.height * .45,
            decoration: BoxDecoration(
              color: Color(0xFFAFCBFF),
            ),
          ),
          SafeArea(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 10),
                Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    alignment: Alignment.center,
                    height: 52,
                    width: 52,
                    child: CircleAvatar(
                      //backgroundImage: NetworkImage(
                      //  imageUrl,
                      //),
                      radius: 60,
                      backgroundColor: Colors.transparent,
                    ),
                  ),
                ),
                Text(
                  'Hello',
                  //'Hello $email',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900),
                ),
                Expanded(
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      Category(
                        icon: Icons.analytics_outlined,
                        title: 'Popular',
                        press: () {
                          MaterialPageRoute route =
                            MaterialPageRoute(builder: (_) => Popular());
                          Navigator.push(context, route);
                        }
                      ),
                      SizedBox(width:10),
                      Category(
                        icon: Icons.star_border,
                        title: 'Top Rating',
                        press: (){
                          MaterialPageRoute route =
                            MaterialPageRoute(builder: (_) => TopRating());
                          Navigator.push(context, route);
                        }
                      ),
                      SizedBox(width:10),
                      Category(
                        icon: Icons.slideshow,
                        title: 'Now Playing',
                        press: () {
                          MaterialPageRoute route =
                            MaterialPageRoute(builder: (_) => NowPlaying());
                          Navigator.push(context, route);
                        }
                      ),
                      SizedBox(width:10),
                      Category(
                        icon: Icons.calendar_today,
                        title: 'Upcoming',
                        press: () {
                          MaterialPageRoute route =
                            MaterialPageRoute(builder: (_) => Upcoming());
                          Navigator.push(context, route);
                        }
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  'Trending Today',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black45,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: (this.moviesCount1 == null) ? 0 : this.moviesCount1,
                    itemBuilder: (context, int index) {
                      return InkWell(
                        onTap: () {
                          MaterialPageRoute route = MaterialPageRoute(
                            builder: (_) => DetailPage(movies2[index])
                          );
                          Navigator.push(context, route);
                        },
                        child: Card(
                          elevation: 4.0,
                          child: Column(
                            children: [
                              Image.network(
                                imgPath + movies1[index].posterPath,
                                height: 100,
                                fit: BoxFit.cover
                              ),
                              Text(
                                movies1[index].title,
                                style: TextStyle(fontSize: 14),
                              )
                            ]
                          ),
                        )
                      );
                    }
                  )
                ),
                SizedBox(height: 10),
                Text(
                  'Trending This Week',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black45,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: (this.moviesCount2 == null) ? 0 : this.moviesCount2,
                    itemBuilder: (context, int index) {
                      return InkWell(
                        onTap: () {
                          MaterialPageRoute route = MaterialPageRoute(
                            builder: (_) => DetailPage(movies2[index])
                          );
                          Navigator.push(context, route);
                        },
                        child: Card(
                          elevation: 4.0,
                          child: Column(
                            children: [
                              Image.network(
                                imgPath + movies2[index].posterPath,
                                height: 100,
                                fit: BoxFit.cover
                              ),
                              Text(
                                movies2[index].title,
                                style: TextStyle(fontSize: 14),
                              )
                            ]
                          ),
                        )
                      );
                    }
                  )
                ),
              ],
            ),
          )),
        ],
      ),
      bottomNavigationBar: RaisedButton(
        padding: const EdgeInsets.only(
          top: 15,
          bottom: 15,
        ),
        onPressed: () {
          signOutGoogle();
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) {
            return LoginPage();
          }), ModalRoute.withName('/'));
        },
        color: Colors.white,
        textColor: Colors.black45,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.logout,
            ),
            Container(height: 5, width: 5),
            Text(
              'Log Out',
              style: TextStyle(fontSize: 16),
            )
          ],
        ),
      ),
    );
  }
}

class Category extends StatelessWidget {
  final icon;
  final String title;
  final Function press;
  const Category({
    Key key,
    this.icon,
    this.title,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(13),
      child: Container(
        width: 100,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(13),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 17),
              blurRadius: 17,
              spreadRadius: -23,
            )
          ],
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: press,
            child: Column(children: <Widget>[
              Spacer(),
              Icon(icon, size: 100, color: Colors.blue[200]),
              Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16),
              ),
              Spacer(),
            ]),
          ),
        )
      ),
    );
  }
}
