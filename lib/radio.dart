import 'package:flutter/material.dart';
import 'package:loading/indicator/ball_pulse_indicator.dart';
import 'package:loading/indicator/ball_scale_indicator.dart';
import 'package:loading/indicator/line_scale_pulse_out_indicator.dart';
import 'package:loading/loading.dart';
import 'package:provider/provider.dart';

import 'provider/radio_provider.dart';

class RadioPlayer extends StatefulWidget {
  @override
  _RadioPlayerState createState() => _RadioPlayerState();
}

class _RadioPlayerState extends State<RadioPlayer> {
  bool _isplaying = false;
  void initState() {
    super.initState();
    radiostationloaded();
  }

  @override
  Widget build(BuildContext context) {
    final rp = Provider.of<RadioProvider>(context, listen: false);
    return Scaffold(
      appBar: new AppBar(
        title: const Text('Radio Stations'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.only(bottom: 100),
        child: Container(
          child: Center(
            child: _isplaying
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Loading(
                        indicator: LineScalePulseOutIndicator(),
                        size: 50.0,
                        color: Theme.of(context).primaryColor,
                      ),
                      Loading(
                        indicator: LineScalePulseOutIndicator(),
                        size: 50.0,
                        color: Theme.of(context).primaryColor,
                      ),
                    ],
                  )
                : null,
          ),
        ),
      ),

      // ListView.builder(
      //   itemCount: 15,
      //   itemBuilder: (context, i) => Container(
      //     height: MediaQuery.of(context).size.height * 0.175,
      //     padding: EdgeInsets.all(4),
      //     child: Card(
      //       color: Colors.red,
      //       child: ListTile(
      //         leading: _isplaying
      //             ? FlatButton(
      //                 child: Icon(
      //                   Icons.play_arrow,
      //                   size: 32,
      //                 ),
      //                 onPressed: () async {
      //                   getplayingStatus();
      //                   rp.playstation();
      //                 },
      //               )
      //             : FlatButton(
      //                 child: Icon(
      //                   Icons.pause,
      //                   size: 32,
      //                 ),
      //                 onPressed: () {
      //                   getplayingStatus();
      //                   rp.playstation();
      //                 },
      //               ),
      //         trailing: FlatButton(
      //           child: Icon(Icons.stop),
      //           onPressed: () {
      //             rp.stopstation();
      //           },
      //         ),
      //       ),
      //     ),
      //   ),
      // ),
      bottomSheet: Container(
        color: Theme.of(context).primaryColor,
        height: MediaQuery.of(context).size.height * 0.12,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              'Sample Station',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: _isplaying
                  ? IconButton(
                      icon: Icon(
                        Icons.pause,
                        size: 32,
                      ),
                      onPressed: () {
                        getplayingStatus();
                        rp.playstation();
                      },
                    )
                  : IconButton(
                      icon: Icon(
                        Icons.play_arrow,
                        size: 32,
                      ),
                      onPressed: () {
                        getplayingStatus();
                        rp.playstation();
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }

  void getplayingStatus() async {
    bool a = await Provider.of<RadioProvider>(context, listen: false)
        .playingStatus();
    setState(() {
      _isplaying = a;
    });
  }

  Future<void> radiostationloaded() async {
    await Provider.of<RadioProvider>(context, listen: false).audioStart();
  }
}
