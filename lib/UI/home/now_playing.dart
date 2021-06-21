import 'package:flutter/material.dart';
import 'package:tontonin/UI/detail/detail_page.dart';
import 'package:tontonin/UI/home/widget/bottomNavBar.dart';
import 'package:tontonin/service/service.dart';

class NowPlaying extends StatefulWidget {
  @override 
  _MovieListState createState() => _MovieListState();
}

class _MovieListState extends State<NowPlaying> {
  //inisialisasi variabel
  int moviesCount;
  List movies;
  List _search;
  TontoninService service;
  
  Future initialize() async {
    movies = [];
    _search = [];
    movies = await service.getNowPlaying();
    setState(() {
      moviesCount = movies.length;
      movies = movies;
    });
  }
  
  final String imgPath = 'https://image.tmdb.org/t/p/w600_and_h900_bestv2/';
  
  TextEditingController controller = new TextEditingController();
  onSearch(String text) async {
    _search.clear();
    if(text.isEmpty) {
      setState(() { });
      return;
    }
    movies.forEach((find) {
      if(find.title.contains(text)) {
        _search.add(find);
      } 
    });
    setState(() {});
  }

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
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(10),
            color: Colors.white,
            child: Card(
              child: ListTile(
                leading: Icon(Icons.search),
                title: TextField(
                  controller: controller,
                  onChanged: onSearch,
                  decoration: InputDecoration(
                    hintText: 'Search', 
                    border: InputBorder.none
                  ),
                ),
                trailing: IconButton(
                  onPressed: (){
                    controller.clear();
                    onSearch('');
                  },
                  icon: Icon(Icons.cancel),
                ),
              ),
            ),
          ),
          Expanded(
            child: _search.length != 0 || controller.text.isNotEmpty
            ? ListView.builder(
              itemCount: _search.length,
              itemBuilder: (context, int position){
                final f = _search[position];
                return InkWell(
                  onTap: () {
                    MaterialPageRoute route = MaterialPageRoute(
                      builder: (_) => DetailPage()
                    );
                    Navigator.push(context, route);
                  },
                  child: Card(
                    elevation: 2.0,
                    child: Container(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            width: 120,
                            child: Image.network(imgPath + f.posterPath)
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
                                    f.title,
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
                                      Text(f.releaseDate),
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
                                      Text(f.voteAverage.toString()),
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
            )
            : ListView.builder(
              itemCount: (this.moviesCount == null) ? 0 : this.moviesCount,
              itemBuilder: (context, int position){
                return InkWell(
                  onTap: () {
                    MaterialPageRoute route = MaterialPageRoute(
                      builder: (_) => DetailPage()
                    );
                    Navigator.push(context, route);
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
          ),
        ]
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}