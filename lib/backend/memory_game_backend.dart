import 'package:cloud_firestore/cloud_firestore.dart';

class MemoryGameBackend{

  final ref = FirebaseFirestore.instance.collection("Memory Game");

  void firstFlip(int second){
    ref.doc("First Flip").set({
      'First Flip Time' : second,
    });
  }

  void sequence(String str){
       ref.doc("Sequence Of Card Flip").set({
      'Sequence' : str,
    });
  }

  void timeGap(List<int> timeGap){
    ref.doc("Time Gap Each Flip").set({
      "Time Gap" : timeGap.toList()
    });
  }

  void individualFlip(int card1,card2,card3,card4,card5,card6,card7,card8,card9,card10,card11,card12){
    ref.doc("Individual Flip").set({
      "1st Card" : card1,
      "2nd Card" : card2,
      "3rd Card" : card3,
      "4th Card" : card4,
      "5th Card" : card5,
      "6th Card" : card6,
      "7th Card" : card7,
      "8th Card" : card8,
      "9th Card" : card9,
      "10th Card" : card10,
      "11th Card" : card11,
      "12th Card" : card12,
    });
  }

  void sucess(List sucessFlip,List sucessTime){
    ref.doc("Sucess Card Details").set({

      '1st sucess Flip' : sucessFlip[0],
      '1st sucess Time' : sucessTime[0],

      '2nd sucess Flip' : sucessFlip[1],
      '2nd sucess Time' : sucessTime[1],

      '3rd sucess Flip' : sucessFlip[2],
      '3rd sucess Time' : sucessTime[2],

      '4th sucess Flip' : sucessFlip[3],
      '4th sucess Time' : sucessTime[3],

      '5th sucess Flip' : sucessFlip[4],
      '5th sucess Time' : sucessTime[4],

      '6th sucess Flip' : sucessFlip[5],
      '6th sucess Time' : sucessTime[5],
    });
  }
}