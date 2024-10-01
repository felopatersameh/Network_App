import 'package:flutter/material.dart';import 'package:network_app/data/Articles.dart';class ViewNew extends StatelessWidget {  final Articles model;  const ViewNew({super.key, required this.model});  @override  Widget build(BuildContext context) {    return Scaffold(      body: SafeArea(        child: Column(          children: [            model.urlToImage != null                ? Image.network(                    model.urlToImage!,                    width: MediaQuery.sizeOf(context).width,                    height: MediaQuery.sizeOf(context).height * .25,                    fit: BoxFit.cover,                    errorBuilder: (context, error, stackTrace) =>                        const Icon(Icons.broken_image),                  )                : const Icon(Icons.image_not_supported),            Padding(              padding: const EdgeInsets.all(15),              child: Column(                children: [                  Text(                    model.title.toString(),                    style: Theme.of(context).textTheme.headlineLarge,                    maxLines: model.title?.split(" ").length,                  ),                  SizedBox(                    height: 15,                  ),                  Text(                    model.description.toString(),                    style: Theme.of(context).textTheme.bodyMedium,                    maxLines: model.title?.split(" ").length,                  ),                ],              ),            )          ],        ),      ),    );  }}