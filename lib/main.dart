import 'package:flutter/material.dart';
import 'package:music_player/screens/music_screen/view/music_screen.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/':(context) =>MusicScreen(),
      },
    ),
  );
}
