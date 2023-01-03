import 'package:flutter/material.dart';
import 'package:newbie/pages/favorite.dart';
import 'package:newbie/provider/favourite_pvider.dart';
import 'package:provider/provider.dart';

class FavCart extends StatefulWidget {
  const FavCart({Key? key}) : super(key: key);

  @override
  State<FavCart> createState() => _FavCartState();
}

class _FavCartState extends State<FavCart> {
  @override
  Widget build(BuildContext context) {
    final cartItems = Provider.of<FavProvider>(context,listen: false);
    print('build');
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => FavouritePage()));
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
            itemCount: cartItems.selectedIndex.length,
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
