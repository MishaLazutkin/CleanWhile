import 'package:http/http.dart' as http;


class HttpClient extends http.BaseClient {
  final _client = http.Client();

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) {
    request.headers['Authorization'] = "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJrZXkiOiJhMmJjY2FmZmVkM2EzNDE3YzM4ZjAxZDFjNjExMjk3NSIsImlhdCI6MTY3ODA1NDgxNn0.lIzYc96bx_rvXYWSURc27UM3GUojfmL3r855atnYdgU";
    return _client.send(request);
  }
}
