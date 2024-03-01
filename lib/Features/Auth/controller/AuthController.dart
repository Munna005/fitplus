

import 'package:fitplus/Features/Auth/repo/auth_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthRepoController {
  final AuthService authService;

  AuthRepoController({required this.authService});

  Future<dynamic> validation(String api, String hospitalNumber, BuildContext context, String location) async {
    authService.validateHospitalNumber(api, hospitalNumber, context, location);
  }
}

final authRepoController = Provider((ref) {
  final authProvider = ref.watch(authServiceProvider);
  return authProvider;
});

final validationProvider = FutureProvider((ref) {
  final validationProvider = ref.watch(authRepoController);
  return validationProvider;
});
