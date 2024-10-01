import 'package:dio/dio.dart';import 'package:flutter/material.dart';import '../data/Articles.dart';import 'Widget/build_articles.dart';class NewsScreen extends StatefulWidget {  const NewsScreen({super.key});  @override  State<NewsScreen> createState() => _NewsScreenState();}class _NewsScreenState extends State<NewsScreen> {  Future<List<Articles>>? articles;  @override  void initState() {    super.initState();    articles = getHttp();  }  @override  Widget build(BuildContext context) {    return Scaffold(      appBar: AppBar(),      body: FutureBuilder<List<Articles>>(        future: articles,        builder: (context, snapshot) {          if (snapshot.connectionState == ConnectionState.waiting) {            return const Center(              child: CircularProgressIndicator(),            );          } else if (snapshot.hasError) {            return Center(              child: Text('Error: ${snapshot.error}'),            );          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {            return const Center(              child: Column(                children: [                  CircularProgressIndicator(),                  SizedBox(                    height: 15,                  ),                  Text('No articles found.'),                ],              ),            );          } else {            final data = snapshot.data;            return ListView.builder(              itemCount: data?.length,              itemBuilder: (context, index) {                final articles = snapshot.data![index];                if (articles.urlToImage != null) {}                return BuildArticles(articles: articles);              },            );          }        },      ),    );  }}final dio = Dio();Future<List<Articles>> getHttp() async {  const apiKey = "70c84b24f0b3416da405361d79906233";  const baseUrl = "https://newsapi.org/v2";  const endPoint =      "/everything?q=tesla&from=2024-09-01&sortBy=publishedAt&apiKey=$apiKey";  final response = await dio.get('$baseUrl$endPoint');  final List<Articles> articles = [];  for (final data in response.data["articles"]) {    articles.add(Articles.fromJson(data));  }  return articles;}