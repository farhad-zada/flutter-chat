import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:chat/constants.dart';

import '../brain/message_stream.dart';

class ChatScreen extends StatefulWidget {
  static const String id = 'c';
  const ChatScreen({super.key});
  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;
  String? _messageText;
  final _textFieldFocusNode = FocusNode();
  final _messageInputFielsController = TextEditingController();

  void getCurrentUser() async {
    _auth.currentUser;
  }

  @override
  void initState() {
    getCurrentUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: null,
        actions: <Widget>[
          IconButton(
              icon: const Icon(Icons.close),
              onPressed: () async {
                await _auth.signOut();
                navigateBack();
              }),
        ],
        title: const Text('⚡️Chat'),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Expanded(
              child: Container(
                  color: Colors.black26,
                  child: MessageStream(firestore: _firestore)),
            ),
            Container(
              decoration: kMessageContainerDecoration,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      controller: _messageInputFielsController,
                      keyboardAppearance: Brightness.dark,
                      onChanged: (value) {
                        _messageText = value;
                      },
                      decoration: kMessageTextFieldDecoration,
                      focusNode: _textFieldFocusNode,
                      onTap: () {
                        _textFieldFocusNode.requestFocus();
                      },
                    ),
                  ),
                  TextButton(
                    onPressed: () async {
                      _messageInputFielsController.clear();
                      await _firestore.collection('messages').add(
                        {
                          'data': _messageText,
                          'from': _auth.currentUser?.email,
                          'ts': Timestamp.now(),
                        },
                      );
                    },
                    child: const Text(
                      'Send',
                      style: kSendButtonTextStyle,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void navigateBack() {
    Navigator.pop(context);
  }
}
