import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TogglePassword extends StatelessWidget {
  TogglePassword({Key? key}) : super(key: key);

  ValueNotifier<int> _counter = ValueNotifier<int>(0);
  ValueNotifier<bool> _toggle = ValueNotifier<bool>(false);

  @override
  Widget build(BuildContext context) {
    print('build');
    return Scaffold(
      appBar: AppBar(
        title: Text('Toggle Password'),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              ValueListenableBuilder(
                  valueListenable: _toggle,
                  builder: (context, value, child) {
                    return TextFormField(
                      obscureText: _toggle.value,
                      decoration: InputDecoration(
                        suffixIcon: InkWell(
                            onTap: () {
                              _toggle.value = !_toggle.value;
                            },
                            child: _toggle.value
                                ? Icon(Icons.visibility_off_outlined)
                                : Icon(Icons.visibility)),
                        hintText: 'Password',
                      ),
                    );
                  }),
              ValueListenableBuilder(
                  valueListenable: _counter,
                  builder: (context, value, child) {
                    return Text(
                      _counter.value.toString(),
                      style: TextStyle(fontSize: 50),
                    );
                  })
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red,
        onPressed: () {
          _counter.value++;
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
