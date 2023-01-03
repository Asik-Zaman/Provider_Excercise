import 'package:flutter/material.dart';
import 'package:newbie/pages/fav_cart.dart';
import 'package:newbie/provider/favourite_pvider.dart';
import 'package:provider/provider.dart';

class FavouritePage extends StatefulWidget {
  const FavouritePage({Key? key}) : super(key: key);

  @override
  State<FavouritePage> createState() => _FavouritePage();
}

class _FavouritePage extends State<FavouritePage> {
  @override
  Widget build(BuildContext context) {
    print('build');
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => FavCart()));
              },
              icon: Icon(Icons.favorite)),
          SizedBox(
            width: 10,
          )
        ],
        title: Text('Favourite'),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
        child: ListView.builder(
            itemCount: 6,
            itemBuilder: (ctx, i) {
              return Card(
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('items' + i.toString()),
                      Consumer<FavProvider>(
                        builder: (context, value, child) {
                          return IconButton(
                              onPressed: () {
                                if (value.selectedIndex.contains(i)) {
                                  value.removeItems(i);
                                } else {
                                  value.addItems(i);
                                }
                              },
                              icon: value.selectedIndex.contains(i)
                                  ? Icon(Icons.favorite)
                                  : Icon(Icons.favorite_border_outlined));
                        },
                      )
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }
}
