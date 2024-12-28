import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future<void> users() async {
  final user = FirebaseAuth.instance.currentUser;
  if (user != null) {
    try {
      await FirebaseFirestore.instance.collection('users').doc(user.uid).set({
        'uid': user.uid,
        'name': user.displayName ?? 'Anonymous',
        'email': user.email ?? 'No email provided',
        'profileImageUrl':
            user.photoURL ?? 'https://example.com/default-profile.png',
        'phone': '1234567890', // Placeholder; can be dynamically set
        'address': '123 Main Street, City, Country', // Placeholder
        'dateOfBirth': '1990-01-01', // Placeholder
      }, SetOptions(merge: true));
      print('User data added successfully.');
    } catch (e) {
      print('Error adding user data: $e');
    }
  } else {
    print('No user is signed in.');
  }
}
