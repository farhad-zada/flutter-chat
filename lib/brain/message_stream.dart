import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../widgets/widgets.dart';

class MessageStream extends StatelessWidget {
  const MessageStream({
    super.key,
    required FirebaseFirestore firestore,
  }) : _firestore = firestore;

  final FirebaseFirestore _firestore;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: _firestore
            .collection('messages')
            .orderBy('ts', descending: true)
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const CircularProgressIndicator(
              color: Colors.white,
              backgroundColor: Colors.lightBlueAccent,
            );
          }
          final messages = snapshot.data?.docs;
          List<MessageBubble> messageBables = [];
          for (var message in messages!) {
            messageBables.add(
              MessageBubble(
                text: message['data'],
                from: message['from'],
                ts: message['ts'],
                isMe:
                    FirebaseAuth.instance.currentUser?.email == message['from'],
              ),
            );
          }
          return ListView(
              reverse: true,
              padding: const EdgeInsets.all(4.0),
              children: messageBables);
        });
  }
}
