import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shopping_list/data/categories.dart';
import 'package:shopping_list/models/grocery_item.dart';
import 'package:shopping_list/widgets/grocery.dart';
import 'package:shopping_list/widgets/new_item.dart';
import 'package:http/http.dart' as http;

class Groceries extends StatefulWidget {
  const Groceries({super.key});

  @override
  State<Groceries> createState() => _GroceriesState();
}

class _GroceriesState extends State<Groceries> {
  List<GroceryItem> _groceryItems = [];
  late Future<List<GroceryItem>> _loadedItems;

  @override
  void initState() {
    super.initState();
    _loadedItems = _loadItems();
  }

  Future<List<GroceryItem>> _loadItems() async {
    final url = Uri.https(
        'flutter-shoppinglist-292f7-default-rtdb.firebaseio.com',
        'ListaDeShopping.json');

    final response = await http.get(url);

    if (response.statusCode >= 400) {
      throw Exception('FALLASTE PAPI TE TOCA INTENTAR DE VUELTA');
      //_error = 'Failed to fetch data try again later';
    }

    if (response.body == 'null') {
      /*setState(() {
          isLoading = false;
        });*/
      return [];
    }

    final Map<String, dynamic> listData = json.decode(response.body);
    final List<GroceryItem> loadedItems = [];

    for (final item in listData.entries) {
      loadedItems.add(
        GroceryItem(
          id: item.key,
          name: item.value['name'],
          quantity: item.value['quantity'],
          category: categories.entries
              .firstWhere(
                  (catItem) => catItem.value.title == item.value['category'])
              .value,
        ),
      );
    }
    return loadedItems;
  }

  //EL ASYNC Y AWAIT VA A TRAER LA DATA DEL NAVIGATOR QUE LE PASES EN ESTE CASO GROCERY ITEM
  void _addItem() async {
    final newGroceryItem = await Navigator.of(context).push<GroceryItem>(
      MaterialPageRoute(
        builder: (ctx) => NewItem(),
      ),
    );

    if (newGroceryItem == null) {
      return;
    }

    setState(() {
      _groceryItems.add(newGroceryItem);
    });
  }

  void _removeItem(GroceryItem item) async {
    setState(() {
      _groceryItems.remove(item);
    });
    final url = Uri.https(
        'flutter-shoppinglist-292f7-default-rtdb.firebaseio.com',
        'ListaDeShopping/${item.id}.json');
    final response = await http.delete(url);
    print(response.statusCode);
    if (response.statusCode >= 400) {
      setState(() {
        _groceryItems.insert(_groceryItems.indexOf(item), item);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    /*if (isLoading) {
      content = Center(
        child: CircularProgressIndicator(),
      );
    }*/
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Your Groceries',
          style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                color: Colors.white,
              ),
        ),
        actions: [IconButton(onPressed: _addItem, icon: Icon(Icons.plus_one))],
      ),
      body: FutureBuilder(
          future: _loadedItems,
          builder: (ctx, snapshot) {
            print(snapshot.data);
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }

            if (snapshot.hasError) {
              return Center(child: Text(snapshot.error.toString()));
            }

            if (snapshot.data!.isEmpty) {
              return Center(
                child: Text(
                  'NO ITEMS ADDED YET',
                  style: TextStyle(fontSize: 34),
                ),
              );
            }

            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (ctx, index) => Dismissible(
                key: ValueKey(snapshot.data![index].id),
                child: Grocery(
                  snapshot.data![index],
                ),
                onDismissed: (direction) => _removeItem(snapshot.data![index]),
              ),
            );
          }),
      /*Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [for (final grocery in groceryItems) Grocery(grocery)],
      ),*/
    );
  }
}
