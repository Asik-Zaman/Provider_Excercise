import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class AuthProvider with ChangeNotifier {
  bool _loading = false;
  bool get loading => _loading;

  setLoading(value) {
    _loading = value;
    notifyListeners();
  }

  void login(String email, String pass) async {
    setLoading(true);
    notifyListeners();
    try {
      http.Response response = await http.post(
          Uri.parse(
            'https://reqres.in/api/login',
          ),
          body: {'email': email, 'password': pass});

      if (response.statusCode == 200) {
        setLoading(false);
        print('Successful');
      } else {
        setLoading(false);
        print('Unsuccessful');
      }
    } catch (error) {
      setLoading(false);
      print('Error');
      print(error.toString());
    }
  }
}
