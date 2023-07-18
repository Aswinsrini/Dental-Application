import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:maris_dental/screens/home_screen.dart';

class AuthService {
  void signinValidate({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    print(email);
    print(password);
    final FirebaseFirestore firestore = FirebaseFirestore.instance;

    //parent collections
    final DocumentReference location =
        firestore.collection('location').doc('m1');

    //sub-collections
    final CollectionReference patient = location.collection('patient_details');

    patient
        .add({
          'address': 'ok',
          'age': 'ok',
          'description': 'ok',
          'name': 'ok',
          'phone_number': 'ok',
          'p_id': 'ok',
          'sex': 'ok',
          'tooth_number': 'ok',
        })
        .then((value) => print('Data created successfully!'))
        .catchError((error) => print('Failed to create data: $error'));

    // final CollectionReference usersCollection =
    //     firestore.collection('loaction').;

    // final DocumentReference newDocumentRef =
    //     usersCollection.doc(); // Auto-generated ID

    // newDocumentRef
    //     .set({'patient': 'aswin'})
    //     .then((value) => print('Data created successfully!'))
    //     .catchError((error) => print('Failed to create data: $error'));

    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) => {
              print('user created'),
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomePage()),
              )
            });
  }
}
