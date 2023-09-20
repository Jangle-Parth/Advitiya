// ignore_for_file: library_prefixes

import 'package:flutter/material.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class PaintScreen extends StatefulWidget {
  const PaintScreen({super.key});

  @override
  State<PaintScreen> createState() => _PaintScreenState();
}

class _PaintScreenState extends State<PaintScreen> {
  late IO.Socket _socket;
  @override
  void initState() {
    super.initState();
    connect();
  }

  void connect() {
    _socket = IO.io('http:// 192.168.29.18:3000', <String, dynamic>{
      'transports': ['websockets'],
      'autoconnect': false
    });
    _socket.connect();

    _socket.onConnect((data) {});
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
