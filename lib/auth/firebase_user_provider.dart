import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class WazirXNewDraftFirebaseUser {
  WazirXNewDraftFirebaseUser(this.user);
  User user;
  bool get loggedIn => user != null;
}

WazirXNewDraftFirebaseUser currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<WazirXNewDraftFirebaseUser> wazirXNewDraftFirebaseUserStream() =>
    FirebaseAuth.instance
        .authStateChanges()
        .debounce((user) => user == null && !loggedIn
            ? TimerStream(true, const Duration(seconds: 1))
            : Stream.value(user))
        .map<WazirXNewDraftFirebaseUser>(
            (user) => currentUser = WazirXNewDraftFirebaseUser(user));
