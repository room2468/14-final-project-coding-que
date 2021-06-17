import 'package:flutter/material.dart';
import 'package:tontonin/UI/home/widget/bottomNavBar.dart';
import 'package:tontonin/service/service.dart';

class Popular extends StatefulWidget {
  @override 
  _MovieListState createState() => _MovieListState();
}

class _MovieListState extends State<Popular> {
  //inisialisasi variabel
  int moviesCount;
  List movies;
  TontoninService service;

  Future initialize() async {
    movies = [];
    movies = await service.getPopularMovies();
    setState(() {
      moviesCount = movies.length;
      movies = movies;
    });
  }
  
  final String imgPath = 'https://image.tmdb.org/t/p/w600_and_h900_bestv2/';
  
  @override
  void initState() {
    service = TontoninService();
    initialize();
    super.initState();
  }
  Widget build(BuildContext context) {
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
      body: ListView.builder(
        itemCount: (this.moviesCount == null) ? 0 : this.moviesCount,
        itemBuilder: (context, int position){
          return InkWell(
            onTap: () {
              // MaterialPageRoute route = MaterialPageRoute(
              //   builder: (_) => MovieDetail(movies[position])
              // );
              // Navigator.push(context, route);
            },
            child: Card(
              elevation: 2.0,
              child: Container(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      width: 120,
                      child: Image.network(imgPath + movies[position].posterPath)
                    ),
                    SizedBox(width: 20),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(top: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Text(
                              movies[position].title,
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600
                              ),
                            ),
                            SizedBox(height: 10),
                            Row(
                              children: <Widget>[
                                Icon(
                                  Icons.calendar_today,
                                  size: 12
                                ),
                                SizedBox(width:5),
                                Text(movies[position].releaseDate),
                              ]
                            ),
                            SizedBox(height:10),
                            Row(
                              children: <Widget>[
                                Icon(
                                  Icons.star, 
                                  size: 12
                                ),
                                SizedBox(width: 5),
                                Text(movies[position].voteAverage.toString()),
                              ],
                            ),
                          ]
                        )
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}

