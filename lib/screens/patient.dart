import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:maris_dental/common/custom_button.dart';
import 'package:maris_dental/common/custom_textfield.dart';

class Patient extends StatefulWidget {
  const Patient({super.key});

  @override
  State<Patient> createState() => _PatientState();
}

class _PatientState extends State<Patient> {
  final TextEditingController _descController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _sexController = TextEditingController();
  final TextEditingController _toothController = TextEditingController();
  final TextEditingController _addController = TextEditingController();
  void addPatient() {
    final FirebaseFirestore firestore = FirebaseFirestore.instance;

    //parent collections
    final DocumentReference location =
        firestore.collection('location').doc('m1');

    //sub-collections
    final CollectionReference patient = location.collection('patient_details');

    patient
        .add({
          'address': _addController.text,
          'age': _ageController.text,
          'Cheif complaiant': _descController.text,
          'name': _nameController.text,
          'phone_number': _phoneController.text,
          'p_id': 'p1',
          'sex': _sexController.text,
          'tooth_number': _toothController.text,
        })
        .then((value) => print('Data created successfully!'))
        .catchError((error) => print('Failed to create data: $error'));
    _addController.clear();
    _ageController.clear();
    _descController.clear();
    _nameController.clear();
    _phoneController.clear();
    _sexController.clear();
    _toothController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Form(
          child: Column(
        children: [
          const SizedBox(height: 12),
          CustomTextField(controller: _nameController, hintText: 'Name'),
          const SizedBox(height: 12),
          CustomTextField(controller: _ageController, hintText: 'Age'),
          const SizedBox(height: 12),
          CustomTextField(controller: _descController, hintText: 'Description'),
          const SizedBox(height: 12),
          CustomTextField(
              controller: _phoneController, hintText: 'Phone Number'),
          const SizedBox(height: 12),
          CustomTextField(controller: _sexController, hintText: 'Sex'),
          const SizedBox(height: 12),
          CustomTextField(
              controller: _toothController, hintText: 'Tooth Number'),
          const SizedBox(height: 12),
          CustomTextField(controller: _addController, hintText: 'Address'),
          const SizedBox(height: 12),
          CustomButton(
              onTap: () {
                addPatient();
              },
              text: 'Add Patient')
        ],
      )),
    );
  }
}
