import 'package:firebase_auth/firebase_auth.dart';
import '../services/authentication_service.dart';

final User? thisuser = AuthenticationService().currentUser;
