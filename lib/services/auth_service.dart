import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:todo_app/common/failure.dart';
import 'package:todo_app/models/auth_body.dart';

@singleton
class AuthService {
  AuthService(this._firebaseAuth);

  final FirebaseAuth _firebaseAuth;

  Future<Either<Failure, User>> login(AuthBody body) async {
    try {
      final result = await _firebaseAuth.signInWithEmailAndPassword(
        email: body.email,
        password: body.password,
      );

      final user = result.user;
      if (user == null) {
        return left(const Failure.unknownError());
      }

      return right(user);
    } on FirebaseAuthException catch (e) {
      return left(_handleFirebaseException(e));
    } catch (e) {
      return left(const Failure.unknownError());
    }
  }

  Future<Either<Failure, User>> register(AuthBody body) async {
    try {
      final result = await _firebaseAuth.createUserWithEmailAndPassword(
        email: body.email,
        password: body.password,
      );

      final user = result.user;
      if (user == null) {
        return left(const Failure.unknownError());
      }

      return right(user);
    } on FirebaseAuthException catch (e) {
      return left(_handleFirebaseException(e));
    } catch (e) {
      return left(const Failure.unknownError());
    }
  }

  Failure _handleFirebaseException(FirebaseAuthException e) {
    debugPrint('FirebaseAuthException: $e');
    final FirebaseAuthException(:code) = e;
    return switch (code) {
      'email-already-in-use' ||
      'invalid-email' ||
      'user-not-found' ||
      'wrong-password' ||
      'invalid-credential' ||
      'user-disabled' =>
        const Failure.badRequest('Invalid email or password.'),
      'account-exists-with-different-credential' => const Failure.badRequest(
          'Account exists with different credential.',
        ),
      'weak-password' => const Failure.badRequest('Weak password.'),
      _ => Failure.unknownError('An error occured. Code: $code'),
    };
  }
}
