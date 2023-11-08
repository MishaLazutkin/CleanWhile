import 'dart:convert';
import 'package:http/http.dart';
import 'package:meta/meta.dart';
import '../models/services.dart';


@immutable
class ServicesResponse {
  final Services? services;
  const ServicesResponse.success({@required this.services});
  const ServicesResponse.error() : services = null;

  factory ServicesResponse.fromResponse(Response response) {
    try {
      final decoded =  json.decode(response.body)  as Map<String, dynamic>;
     // print('decoded: ${decoded.toString()}');

      return ServicesResponse.success(
        services: Services.fromJson(decoded),
      );
    } catch (exception, stackTrace) {
      print('Services parsing ERROR: $exception');
      print(stackTrace);
      return const ServicesResponse.error();
    }
  }
}