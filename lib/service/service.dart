import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:tontonin/models/movie.dart';

class TontoninService {
  final String apiKey = 'api_key=d95b18e60af5856565a0ba3a9c635a50';
  final String baseUrl = 'https://api.themoviedb.org/3';

  Future<List> getPopularMovies() async {
    final String uri = baseUrl + '/movie/popular?' + apiKey;

    http.Response result = await http.get(Uri.parse(uri));
    if (result.statusCode == HttpStatus.ok) {
      print("Sukses");
      final jsonResponse = json.decode(result.body);
      final moviesMap = jsonResponse['results'];
      List movies = moviesMap.map((i) => Movie.fromJson(i)).toList();
      return movies;
    } else {
      print("Fail");
      return null;
    }
  }

  Future<List> getNowPlaying() async {
    final String uri = baseUrl + '/movie/now_playing?' + apiKey;

    http.Response result = await http.get(Uri.parse(uri));
    if (result.statusCode == HttpStatus.ok) {
      print("Sukses");
      final jsonResponse = json.decode(result.body);
      final moviesMap = jsonResponse['results'];
      List movies = moviesMap.map((i) => Movie.fromJson(i)).toList();
      return movies;
    } else {
      print("Fail");
      return null;
    }
  }

  Future<List> getUpcoming() async {
    final String uri = baseUrl + '/movie/upcoming?' + apiKey;

    http.Response result = await http.get(Uri.parse(uri));
    if (result.statusCode == HttpStatus.ok) {
      print("Sukses");
      final jsonResponse = json.decode(result.body);
      final moviesMap = jsonResponse['results'];
      List movies = moviesMap.map((i) => Movie.fromJson(i)).toList();
      return movies;
    } else {
      print("Fail");
      return null;
    }
  }

  Future<List> getTopRating() async {
    final String uri = baseUrl+'/movie/top_rated?'+apiKey;

    http.Response result = await http.get(Uri.parse(uri));
    if (result.statusCode == HttpStatus.ok) {
      print("Sukses");
      final jsonResponse = json.decode(result.body);
      final moviesMap = jsonResponse['results'];
      List movies = moviesMap.map((i) => Movie.fromJson(i)).toList();
      return movies;
    } else {
      print("Fail");
      return null;
    }
  }

  Future<List> getTrendingDay() async {
    final String uri = baseUrl+'/trending/movie/day?'+apiKey;

    http.Response result = await http.get(Uri.parse(uri));
    if (result.statusCode == HttpStatus.ok) {
      print("Sukses");
      final jsonResponse = json.decode(result.body);
      final movies = jsonResponse['results'];
      List movieList = movies.map((i) => Movie.fromJson(i)).toList();
      return movieList;
    } else {
      print("Fail");
      return null;
    }
  }

  Future<List> getTrendingWeek() async {
    final String uri = baseUrl+'/trending/movie/week?'+apiKey;

    http.Response result = await http.get(Uri.parse(uri));
    if (result.statusCode == HttpStatus.ok) {
      print("Sukses");
      final jsonResponse = json.decode(result.body);
      final movies = jsonResponse['results'];
      List movieList = movies.map((i) => Movie.fromJson(i)).toList();
      return movieList;
    } else {
      print("Fail");
      return null;
    }
  }
}
