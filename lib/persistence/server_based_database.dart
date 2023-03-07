import 'dart:convert';

import 'package:four_twenty_express/constants/variables.dart';
import 'package:four_twenty_express/objects/product.dart';
import 'package:four_twenty_express/objects/store.dart';
import 'package:http/http.dart' as http;
class ServerBasedDatabase {
  // GET PRODUCTS
  static Future<List<Product>> getProducts() async {
    try {
      final response = await http.get(Uri.parse(databaseUrl));
      List<Map<String,dynamic>> maps = jsonDecode(response.body);

      return List.generate(maps.length, (index) {
        return Product(
            id: maps[index]['id'], name: maps[index]['name'],type: maps[index]['type'], description: maps[index]['description'],
            images: maps[index]['images'], price: maps[index]['price']
        );
      }).toList();
    } catch (error) {
      throw Exception('There was an error getting products ${error.toString()}');
    }//end try-catch
  }//end get products
  // GET PRODUCT
  static Future<Product> getProduct(String id) async {
    // THE HEADERS
    Map<String, String> headers = {
      'content' :'application/json'
    };
    // THE BODY
    Map<String,dynamic> body = {
      'request' : 'get_product',
      'id':id
    };

    try {

      final response = await http.post(
          Uri.parse(databaseUrl),
          headers: headers,
          body: body
      );
      // DECODE RESPONSE
      Map<String, dynamic> map = jsonDecode(response.body);
      return Product(
          id: map['id'], name: map['name'] ,type: map['type'] ,
          description:  map['description'], images:  map['images'],
          price:  map['price']
      );
    } catch (error) {
      throw Exception('There was an error getting the product ${error.toString()}');
    }//end try-catch
  }//end get product
  // GET STORES
  static Future<List<Store>> getStores() async {
    try {
      final response = await http.get(Uri.parse(databaseUrl));
      List<Map<String,dynamic>> maps = jsonDecode(response.body);

      return List.generate(maps.length, (index) {
        return Store(
            id: maps[index]['id'], name: maps[index]['name'], description: maps[index]['description'],
            address: maps[index]['address'], images: maps[index]['images'].split(','),
            phone: maps[index]['phone'], email: maps[index]['email'],
            products:maps[index]['products'].split(',') , website: maps[index]['website'],
            rating:maps[index]['rating']
        );
      }).toList();
    } catch (error) {
      throw Exception('There was an error ${error.toString()}');
    }//end try-catch
  }//end get stores
  // GET STORE
  static Future<Store> getStore(String id) async {
    // THE HEADERS
    Map<String, String> headers = {
      'content' :'application/json'
    };
    // THE BODY
    Map<String,dynamic> body = {
      'request' : 'get_store',
      'id':id
    };

    try {

      final response = await http.post(
          Uri.parse(databaseUrl),
          headers: headers,
          body: body
      );
      // DECODE RESPONSE
      Map<String, dynamic> map = jsonDecode(response.body);
      return Store(
          id: map['id'], name: map['name'], description: map['description'],
          address: map['address'], images: map['images'],
           phone: map['phone'], email:map['email'], products: map['products'].split(','), website: map['website'],
          rating: map['rating']
      );
    } catch (error) {
      throw Exception('There was an error getting the store ${error.toString()}');
    }//end try-catch
  }//end get store
}//end server based database