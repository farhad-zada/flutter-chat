import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart' show DateFormat;

class MessageBubble extends StatelessWidget {
  final String text;
  final String from;
  final Timestamp ts;
  final bool? isMe;

  const MessageBubble({
    super.key,
    required this.text,
    required this.from,
    required this.ts,
    required this.isMe,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment:
                isMe! ? MainAxisAlignment.end : MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment:
                      isMe! ? CrossAxisAlignment.end : CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(1.0),
                      child: Text(
                        from.split('@')[0],
                        style: const TextStyle(
                            fontSize: 13.6, color: Colors.white54),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(1.0),
                      child: Text(
                        DateFormat('HH:mm:ss').format(DateTime(ts.seconds)),
                        style: const TextStyle(
                            fontSize: 12.5, color: Colors.white54),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment:
                isMe! ? MainAxisAlignment.end : MainAxisAlignment.start,
            children: [
              Material(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(
                    isMe! ? 27.3 : 0.0,
                  ),
                  topRight: Radius.circular(
                    isMe! ? 0.0 : 27.3,
                  ),
                  bottomLeft: const Radius.circular(27.3),
                  bottomRight: const Radius.circular(27.3),
                ),
                elevation: 6.0,
                color: isMe! ? Colors.lightBlueAccent : Colors.white,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 13.4, vertical: 9.3),
                  child: Text(
                    text,
                    style: TextStyle(
                      fontSize: 15.3,
                      fontWeight: FontWeight.w500,
                      color: isMe! ? Colors.white : Colors.black,
                    ),
                    textAlign: TextAlign.start,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
