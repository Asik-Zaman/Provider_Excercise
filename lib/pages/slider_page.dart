import 'package:flutter/material.dart';
import 'package:newbie/provider/slider_pvider.dart';
import 'package:provider/provider.dart';

class SliderPage extends StatefulWidget {
  const SliderPage({Key? key}) : super(key: key);

  @override
  State<SliderPage> createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  @override
  Widget build(BuildContext context) {
    final sliderProvider = Provider.of<SliderProvider>(context, listen: false);
    print('sss');
    return Scaffold(
      appBar: AppBar(
        title: Text('Slider App'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Consumer<SliderProvider>(
            builder: (context, value, child) {
              return Slider(
                  min: 0,
                  max: 1,
                  value: value.value,
                  onChanged: (value) {
                    sliderProvider.newSlider(value);
                  });
            },
          ),
          Row(
            children: [
              Consumer<SliderProvider>(
                builder: (context, value, child) {
                  return Expanded(
                      child: Container(
                    height: 100,
                    decoration: BoxDecoration(
                        color: Colors.red.withOpacity(sliderProvider.value)),
                    child: Center(
                      child: Text('Container1'),
                    ),
                  ));
                },
              ),
              Consumer<SliderProvider>(
                builder: (context, value, child) {
                  return Expanded(
                      child: Container(
                    height: 100,
                    decoration: BoxDecoration(
                        color: Colors.green.withOpacity(sliderProvider.value)),
                    child: Center(
                      child: Text('Container'),
                    ),
                  ));
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}
