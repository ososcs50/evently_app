import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evently_app/core/models/event_model.dart';

class EventService {
  static FirebaseFirestore _firestore = FirebaseFirestore.instance;
  static CollectionReference<EventModel> _eventRef() {
    return _firestore
        .collection('event')
        .withConverter(
          fromFirestore: (snapshot, options) {
            return EventModel.fromJson(snapshot.data()!);
          },
          toFirestore: (value, options) {
            return value.tojson();
          },
        );
  }

  static Future<void> SetEvent(EventModel event) async {
    var ref = _eventRef();
    var doc = ref.doc();
    event.id = doc.id;
    return doc.set(event);
  }
}
