import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';
import 'package:myshop/models/shop_model.dart';
import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_lint/riverpod_lint.dart';
import 'package:http/http.dart' as http;

part 'watches_page.g.dart';

@riverpod
Future<List<Product>> fetchPosts(FetchPostsRef ref )  async {
  final Response response = await http.get(Uri.parse("https://fakestoreapi.com/products"));
  if (response.statusCode == 200) {
    String str = response.body;
    List<dynamic> strInList = jsonDecode(str) ;
    return strInList.map((productInfo)=> Product.fromJson(productInfo) ).toList();
  }else{
    throw Exception("failed123456");
  }
}



class WatchesPage extends ConsumerWidget {
  const WatchesPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final products = ref.watch(fetchPostsProvider);
    return products.when(
      error: (err, stack) => Text('Oops, something unexpected happened'),
      loading: () => SizedBox(height:300,width: 300,child: CircularProgressIndicator()),
      data: (data ) => ListView.builder(itemBuilder: (context,index){
        final product = data[index];
        return ListTile(title: Text(product.id as String),subtitle: Text(product.title),);
      }) ,
    );
  }

}
