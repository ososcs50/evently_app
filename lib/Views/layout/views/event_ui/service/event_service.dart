import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evently_app/core/models/event_model.dart';

class EventService {
  static final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  static final CollectionReference<EventModel> _eventRef = _firestore
      .collection('event')
      .withConverter(
        fromFirestore: (snapshot, options) {
          return EventModel.fromJson(snapshot.data()!);
        },
        toFirestore: (value, options) {
          return value.tojson();
        },
      );

  static Future<void> SetEvent(EventModel event) async {
    var ref = _eventRef;
    var doc = ref.doc();
    event.id = doc.id;
    return doc.set(event);
  }

  static Future<void> deleteEvent(String id) async {
    var ref = _eventRef;

    await ref.doc(id).delete();
  }

  static Future<void> updateEvent(EventModel event) async {
    var ref = _eventRef;
    await ref.doc(event.id).update(event.tojson());
  }
}
