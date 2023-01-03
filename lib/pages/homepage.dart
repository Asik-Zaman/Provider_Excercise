import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:newbie/provider/counter_pvider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final counter = Provider.of<CounterProvider>(context, listen: false);
   /*  Timer.periodic(Duration(seconds: 0), (timer) {
      counter.incrementCounter();
    }); */
  }

  @override
  Widget build(BuildContext context) {
    print('bild');
    final counter = Provider.of<CounterProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text('Counter App'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(child: Consumer<CounterProvider>(
            builder: (context, value, child) {
              print('mudgho');
              return Text(
                value.counter.toString(),
                style: TextStyle(fontSize: 50),
              );
            },
          )),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          counter.incrementCounter();
        },
      ),
    );
  }
}
