import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DataBaseServices {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  Future<void> addData(String groupname) async {
    final docRef = await firebaseFirestore.collection('chats').add({
      'group': groupname,
    });
    await docRef.set({
      'group': groupname,
      'id': docRef.id,
    });
  }

  Future<void> addMessage(String id, String message, String time) async {
    final user = FirebaseAuth.instance.currentUser;
    await firebaseFirestore
        .collection('chats')
        .doc(id)
        .collection('messages')
        .add({
      'Username': user!.displayName,
      'Email': user.email,
      'Profile pic': user.photoURL,
      'Message': message,
      'Time': time,
    }).then((value) => print('Message added successfully'));
  }
}
