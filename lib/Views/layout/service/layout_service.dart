import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evently_app/core/models/event_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LayoutServices {
  static String get uid => FirebaseAuth.instance.currentUser!.uid;
  static final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  static final CollectionReference<EventModel> _eventRef = _firestore
      .collection('event')
      .withConverter(
        fromFirestore: (snapshot, options) {
          return EventModel.fromJson(snapshot.data()!);
        },
        toFirestore: (value, options) => value.tojson(),
      );

  static Future<QuerySnapshot<EventModel>> getEvent(String id) async {
    var ref = _eventRef;
    return id == 'all'
        ? ref.where('userid', isEqualTo: uid).get()
        : ref
              .where('userid', isEqualTo: uid)
              .where('CategoryId', isEqualTo: id)
              .get();
  }

  static Stream<QuerySnapshot<EventModel>> getEventStream(String id) {
    var ref = _eventRef;
    return id == 'all'
        ? ref.where('userid', isEqualTo: uid).snapshots()
        : ref
              .where('userid', isEqualTo: uid)
              .where('CategoryId', isEqualTo: id)
              .snapshots();
  }

  static Stream<QuerySnapshot<EventModel>> getFavStream() {
    var ref = _eventRef;
    return ref
        .where('userid', isEqualTo: uid)
        .where('isFav', isEqualTo: true)
        .snapshots();
  }

  static Future<void> deleteEvent(String id) async {
    var ref = _eventRef;

    await ref.doc(id).delete();
  }

  static Future<void> updateEvent(EventModel event) async {
    var ref = _eventRef;
    await ref.doc(event.id).update(event.tojson());
  }

  static Future<void> updateEventFav(EventModel event) async {
    var ref = _eventRef;
    event.isFav = !event.isFav;
    await ref.doc(event.id).update({'isFav': event.isFav});
  }
}
