import 'package:flutter/cupertino.dart';
import 'package:flutter_radio/flutter_radio.dart';

import '../data/countrycodes.dart';

class RadioProvider with ChangeNotifier {
  final radiourl = "https://s3.radio.co/s97f38db97/listen";
  Map<String, String> data = {};

  void fetchCoutryCodes() {
    for (var item in COUNTRY_CODES) {
      data.addAll(item);
    }
    print(data);
  }

  Future<void> audioStart() async {
    await FlutterRadio.audioStart();
  }

  void playstation() async {
    await FlutterRadio.playOrPause(url: radiourl);
  }


  Future<bool> playingStatus() async {
    bool isplaying = await FlutterRadio.isPlaying();
    return (isplaying);
  }
}
