import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as https;

class AuthService {
  static const String baseUrl = 'https://medguard.vercel.app/api';
  var client = https.Client();
  Future<dynamic> validateHospitalNumber(
      String api, String hospitalNumber, BuildContext context, String location) async {
    try {
      var uri = Uri.parse(baseUrl + api + '?hospitalNumber=' + hospitalNumber);
      debugPrint(uri.toString());
      final response = await client.get(uri);
      if (response.statusCode == 200) {
        debugPrint(response.body);
        Navigator.of(context).pushNamed(location);
      } else {
        throw Exception('user does not exist');
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}

final authServiceProvider = Provider<AuthService>((ref) => AuthService());
