import 'dart:typed_data';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tech_store/core/errors/failure.dart';

abstract class AuthRepo {
  Future<Either<Failure, User?>> getCurrentUser(String uid);

  Future<Either<Failure, User>> updateCurrentUser(User user);

  Future<Either<Failure, String>> uploadUserImageToServer(
      Uint8List imageData, String userID);

  /// login with email and password with firebase
  /// @param email user email
  /// @param password user password
  Future<Either<Failure, dynamic>> loginWithEmailAndPassword(
      {required String email, required String password});

  Future<Either<Failure, Unit>> loginWithFacebook();

  Future<Either<Failure, Unit>> handleFacebookLogin();

}
