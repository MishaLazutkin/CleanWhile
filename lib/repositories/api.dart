import 'package:clean_whale/repositories/models/api_responces/logo_responce.dart';
import 'package:http/http.dart' as http;
import 'http_client.dart';

class Api {
  static final _singleton = Api._internal();
  factory Api() => _singleton;
  Api._internal();
  //https://api.cleanwhale.pl/customer/v1.0/order/services
  static const scheme = 'https';
  static const host = 'api.cleanwhale.pl';

  final _client = HttpClient();



  void _handleHttpError({String? method, Uri? route, error}) {
    try {
      if (error.message != null) {
        print('ERROR: $method $route\n${error.message}');
      }
    } catch (exception, stackTrace) {
      print('HTTP ERROR HANDLING ERROR: $exception');
    }
  }



  T? _parsedResponse<T>(
    http.Response response, {
    Function? onSuccess,
    Function? onError,
  }) {
    if (response == null) return null;
    switch (response.statusCode) {
      case 200: return onSuccess == null ? null : onSuccess(response);
      case 400: return onError == null ? null : onError(response);
      case 500: {

        return null;
      }
      default: return null;
    }
  }

  Future<http.Response?> _get(
    String path, {
    Map<String, dynamic>? queryParameters,
    Map<String, String>? headers,
  }) async {
    if (queryParameters != null) {
      queryParameters.removeWhere((k, v) => v == null);
      queryParameters.forEach((k, v) {
        if (v is! String) queryParameters![k] = v.toString();
      });
      if (queryParameters.isEmpty) {
        queryParameters = null;
      }
    }

    final route = Uri(
      scheme: scheme,
      host: host,
      path: '$path',
      queryParameters: queryParameters,
    );

    try {
      return await _client.get(route, headers: headers);
    } catch (error) {
      _handleHttpError(method: 'GET', route: route, error: error);
      return null;
    }
  }

  Future<http.Response?> _post(
      String path, {
        Map<String, dynamic>? queryParameters,
        Map? body,
        String? rawBody,
        Map<String, String>? headers,
      }) async {
    if (body != null) {
      body.removeWhere((k, v) => v == null);
      body.forEach((k, v) {
        if (v is! String) body![k] = v.toString();
      });
      if (body.isEmpty) {
        body = null;
      }
    }
    final route = Uri(scheme: scheme, host: host, path: '$path');
    try {
      print('route $route');
      return await _client.post(route, body: body ?? rawBody, headers: headers);
    } catch (error) {
      _handleHttpError(method: 'POST', route: route, error: error);
      return null;
    }
  }
  //
  // Future<LoginResponse> login({
  //   @required String email,
  //   @required String password,
  // }) async {
  //   try {
  //     final authResult = await _auth0client.auth.passwordRealm({
  //       'realm': 'Username-Password-Authentication',
  //       'username': email,
  //       'password': password,
  //     });
  //     return LoginResponse.fromMap(authResult.cast<String, dynamic>());
  //   } catch (exception, stackTrace) {
  //     print('AuthProvider.login method ERROR: $exception');
  //     print(stackTrace);
  //     if (exception is Auth0Exeption) {
  //       FlushbarService().showError(exception?.description ?? 'Error');
  //     }
  //     return const LoginResponse.error();
  //   }
  // }

  Future<ServicesResponse?> loadServices( Map<String,dynamic> params) async {
    final response = await _post('customer/v1.0/order/services',queryParameters: params);

    return _parsedResponse<ServicesResponse>(
      response!,
      onSuccess: (r) => ServicesResponse.fromResponse(r),
      onError: (r) => ServicesResponse.fromResponse(r),
    );
  }


}
