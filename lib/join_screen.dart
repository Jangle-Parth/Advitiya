import 'package:flutter/material.dart';
import 'package:advitiya/Widget_for_input.dart';

class JoinRoom extends StatefulWidget {
  const JoinRoom({super.key});

  @override
  State<JoinRoom> createState() => _JoinRoomState();
}

class _JoinRoomState extends State<JoinRoom> {
  final TextEditingController _roomcontroller = TextEditingController();
  final TextEditingController _roomnamecontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Join Room",
          style: TextStyle(color: Colors.black, fontSize: 30),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.08,
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          child: Input(
            controllername: _roomcontroller,
            hintText: "Enter Your Name",
          ),
        ),
        const SizedBox(height: 20),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          child: Input(
            controllername: _roomnamecontroller,
            hintText: "Enter Room Name",
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        ElevatedButton(
          onPressed: () {},
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.blue),
              textStyle: MaterialStateProperty.all(
                  const TextStyle(color: Colors.white)),
              minimumSize: MaterialStateProperty.all(
                  Size(MediaQuery.of(context).size.width / 2.5, 50))),
          child: const Text(
            "Chaliye Shuru Karte Hai",
            style: TextStyle(color: Colors.black, fontSize: 20),
          ),
        )
      ],
    ));
  }
}
