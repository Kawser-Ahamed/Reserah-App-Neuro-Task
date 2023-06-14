// ignore_for_file: use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';

class SignUpBackend{
  
  void sendUserData(String userName,firstName,lastName,birthDay,diagnosis,activities){
     final firestore = FirebaseFirestore.instance.collection("Patient");
     firestore.doc(userName).set({
      "First Name" : firstName,
      "Last Name" : lastName,
      "Birthday" : birthDay,
      "Diagnosis" : diagnosis,
      "Activites" : activities,
     });
  }
  
}