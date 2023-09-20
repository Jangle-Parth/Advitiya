// ignore_for_file: unused_field, unused_local_variable, non_constant_identifier_names

import 'package:advitiya/Widget_for_input.dart';
import 'package:advitiya/paint_screen.dart';
import 'package:flutter/material.dart';

class CreateRoom extends StatefulWidget {
  const CreateRoom({super.key});

  @override
  State<CreateRoom> createState() => _CreateRoomState();
}

class _CreateRoomState extends State<CreateRoom> {
  final TextEditingController _roomcontroller = TextEditingController();
  final TextEditingController _roomnamecontroller = TextEditingController();
  late String? _maxroundsvalue; //? indicate string can be null
  late String? _maxplayers;
  void CreateRoom() {
    if (_roomcontroller.text.isNotEmpty &&
        _roomnamecontroller.text.isNotEmpty &&
        _maxroundsvalue != null &&
        _maxplayers != null) {
      Map data = {
        "nickname": _roomcontroller.text,
        "roomname": _roomnamecontroller.text,
        "maxrounds": _maxroundsvalue,
        "maxplayers": _maxplayers,
      };
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => const PaintScreen()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Create Room",
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
          height: 20,
        ),
        DropdownButton(
          focusColor: const Color(0xffF5F6FA),
          items: ["2", "5", "10", "15"]
              .map((value) => DropdownMenuItem(
                    value: value,
                    child: Text(
                      value,
                      style: const TextStyle(color: Colors.black, fontSize: 20),
                    ),
                  ))
              .toList(),
          hint: const Text(
            "Select Max of Rounds",
            style: TextStyle(color: Colors.black, fontSize: 20),
          ),
          onChanged: (String? value) {
            setState(() {
              _maxroundsvalue = value;
            });
          },
        ),
        const SizedBox(
          height: 20,
        ),
        DropdownButton(
          focusColor: const Color(0xffF5F6FA),
          items: ["2", "3", "4", "5"]
              .map((value) => DropdownMenuItem(
                    value: value,
                    child: Text(
                      value,
                      style: const TextStyle(color: Colors.black, fontSize: 20),
                    ),
                  ))
              .toList(),
          hint: const Text(
            "Select No of Players",
            style: TextStyle(color: Colors.black, fontSize: 20),
          ),
          onChanged: (String? value) {
            setState(() {
              _maxplayers = value;
            });
          },
        ),
        const SizedBox(
          height: 30,
        ),
        ElevatedButton(
          onPressed: CreateRoom,
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
