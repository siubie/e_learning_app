import 'package:http/http.dart' as http;

class DataService {
  Future<http.Response?> getPosts() async {
    const _baseUrl = 'jsonplaceholder.typicode.com';
    try {
      final url = Uri.https(_baseUrl, '/posts');
      final response = await http.get(url);
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
