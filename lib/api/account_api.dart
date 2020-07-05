import 'package:http/http.dart' as http;
import 'dart:convert';

class AccountApi {
  Future<bool> login(String email, String password) async {
    try {
      final http.Response response = await http.post(
          'https://reqres.in/api/login',
          body: jsonEncode({'email': email, 'password': password, 'age': 25}),
          headers: {'Content-Type': 'application/json'});

      if (response.statusCode == 200) {
        final dynamic parsed = jsonDecode(response.body);
        print('Login OK ${parsed['token']}');
        return true;
      }

      return false;
    } catch (e) {
      return false;
    }
  }

  Future<List<dynamic>> getUsers(int page) async {
    try {
      final http.Response response =
          await http.get('https://reqres.in/api/users?page=$page&delay=3');

      if (response.statusCode == 200) {
        final parsed = jsonDecode(response.body);
        print(parsed['data'].runtimeType);
        print('get users OK');
        return parsed['data'];
      }

      return [];
    } catch (e) {
      return [];
    }
  }
}
