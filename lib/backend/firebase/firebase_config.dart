import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyDiLZEP0qiN4D-oZEHpz7HnskBnvTwCOHM",
            authDomain: "meetmatrix-8b5e5.firebaseapp.com",
            projectId: "meetmatrix-8b5e5",
            storageBucket: "meetmatrix-8b5e5.firebasestorage.app",
            messagingSenderId: "235620052615",
            appId: "1:235620052615:web:5b8b191bd192d1d457d222",
            measurementId: "G-NLG1YEF2NP"));
  } else {
    await Firebase.initializeApp();
  }
}
