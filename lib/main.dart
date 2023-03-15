import 'package:flutter/material.dart';
import 'package:music_player/screens/music_screen/provider/music_provider.dart';
import 'package:music_player/screens/music_screen/view/music_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => music_provider(),),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/':(context) =>MusicScreen(),
        },
      ),
    ),
  );
}
