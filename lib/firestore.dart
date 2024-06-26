import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {

  final CollectionReference tasks=
      FirebaseFirestore.instance.collection('tasks');

  Future<void> addTask(String task){
    return tasks.add({
      'task':task,
      'completed': false,
      'timestamp': Timestamp.now(),
    });
  }

  Future<void> taskCheck(String docID, bool isCompleted){
    return tasks.doc(docID).update({'completed': isCompleted,});
  }

  Stream<QuerySnapshot> getTaskStream(){
    final taskStream = tasks.orderBy('timestamp').snapshots();
    return taskStream;
  }

  Future<void> updateTask(String docID, String newTask){
    return tasks.doc(docID).update({
      'task': newTask,
      'timestamp': Timestamp.now(),
    });
  }

  Future<void> deleteTask(String docID){
    return tasks.doc(docID).delete();
  }

}