import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:events_demo/model/event_info.dart';
import 'package:flutter/material.dart';

final CollectionReference mainCollection = FirebaseFirestore.instance.collection("event");
final DocumentReference documentReference = mainCollection.doc('test');

class Storage {
  Future<void> storeEventData(EventInfo eventInfo) async {
    DocumentReference documentReferencer = documentReference.collection('events').doc(eventInfo.id);

    Map<String, dynamic> data = eventInfo.toJson();

    print('DATA: \n$data');

    await documentReferencer.set(data).whenComplete(() {
      print('Event added to Database, id: {${eventInfo.id}}');
    }).catchError((e) => print(e));
  }

  Future<void> updateEventData(EventInfo eventInfo) async {
    DocumentReference documentReferencer = documentReference.collection('events').doc(eventInfo.id);

    Map<String, dynamic> data = eventInfo.toJson();

    print('DATA: \n$data');

    await documentReferencer.update(data).whenComplete(() {
      print("Event updated in the Database, id: {${eventInfo.id} ");
    }).catchError((e) => print(e));
  }

  Future<void> deletEvent({@required String id}) async {
    DocumentReference documentReferencer = documentReference.collection('events').doc(id);

    await documentReferencer.delete().catchError((e) => print(e));

    print('Event deleted, id: $id');
  }

  Stream<QuerySnapshot> retrieveEvents() {
    Stream<QuerySnapshot> myClasses = documentReference.collection('events').orderBy('start').snapshots();

    return myClasses;
  }

}