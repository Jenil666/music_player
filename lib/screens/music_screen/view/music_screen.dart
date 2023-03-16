import 'package:flutter/material.dart';
import 'package:music_player/screens/music_screen/provider/music_provider.dart';
import 'package:provider/provider.dart';

class MusicScreen extends StatefulWidget {
  const MusicScreen({Key? key}) : super(key: key);

  @override
  State<MusicScreen> createState() => _MusicScreenState();
}

class _MusicScreenState extends State<MusicScreen> {
  music_provider? m, mt;

  @override
  void initState() {
    super.initState();

    Provider.of<music_provider>(context, listen: false).intiAudio();
  }

  @override
  Widget build(BuildContext context) {
    m = Provider.of<music_provider>(context, listen: false);
    mt = Provider.of<music_provider>(context, listen: true);
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              height: double.infinity,
              width: double.infinity,
              child: Image.asset(
                "assets/photos/background.jpg",
                fit: BoxFit.cover,
              ),
            ),
            Container(
              height: double.infinity,
              width: double.infinity,
              color: Color(0x94000000),
            ),
            Center(
              child: Container(
                height: 200,
                width: 200,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(
                      "assets/photos/songphoto.jpg",
                      fit: BoxFit.cover,
                    )),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 500),
              child: Slider(
                activeColor: Colors.red,
                value: 0.6,
                onChanged: (value) {},
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.only(bottom: 50),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        m!.startAudio();
                      },
                      child: Icon(
                        Icons.play_arrow_outlined,
                        color: Colors.white,
                      ),
                      style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.red),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        m!.stopAudio();
                      },
                      child: Icon(
                        Icons.pause,
                        color: Colors.white,
                      ),
                      style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.red),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        m!.muteorUnmute();
                      },
                      child: mt!.mute == false
                          ? Icon(
                        Icons.volume_mute_outlined,
                        color: Colors.white,
                      )
                          : Icon(Icons.volume_down_outlined, color: Colors.white),
                      style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.red),
                    ),
                  ],
                ),
              ),
            ),

            Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(onPressed: () {
                    m!.previoussong();
                  },
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                    child: Icon(Icons.skip_previous_outlined,color: Colors.white,),),
                  ElevatedButton(onPressed: () {
                    m!.nextsong();
                  },
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                    child: Icon(Icons.skip_next_outlined,color: Colors.white,),),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
