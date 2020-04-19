import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/radio_provider.dart';

import 'package:loading/indicator/ball_pulse_indicator.dart';
import 'package:loading/indicator/line_scale_pulse_out_indicator.dart';
import 'package:loading/loading.dart';

class RadioPlayer extends StatefulWidget {
  @override
  _RadioPlayerState createState() => _RadioPlayerState();
}

class _RadioPlayerState extends State<RadioPlayer> {
  bool _showbottomsheet = false;
  bool _isplaying = false;
  bool _loadingstations = false;
  void initState() {
    super.initState();
    //radiostationloaded();
  }

  @override
  Widget build(BuildContext context) {
    final rp = Provider.of<RadioProvider>(context, listen: false);
    final mediaquery = MediaQuery.of(context);
    return Scaffold(
      appBar: new AppBar(
        centerTitle: true,
        title: const Text('Radio Stations'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body:
          // _loadingstations
          //     ? Center(
          //         child: Loading(
          //           indicator: BallPulseIndicator(),
          //           color: Colors.black,
          //         ),
          //       )
          //     :

          Column(
        children: <Widget>[
          Container(
            height: mediaquery.size.height * 0.1,
            child: ListView.separated(
              itemCount: 10,
              itemBuilder: (ctx, i) => Chip(
                padding: EdgeInsets.all(7),
                label: Text('Countries'),
                shape: RoundedRectangleBorder(),
                backgroundColor: Theme.of(context).primaryColor,
              ),
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.all(10),
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(
                  width: 10,
                );
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 15,
              itemBuilder: (context, i) => Container(
                height: mediaquery.size.height * 0.15,
                child: Card(
                  color: Colors.black,
                  child: ListTile(
                    dense: true,
                    leading: Icon(
                      Icons.radio,
                      size: 32,
                      color: Colors.white,
                    ),
                    title: Text(
                      'Radio Station name',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    subtitle: Text(
                      'Frequency',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    trailing: _isplaying
                        ? FlatButton(
                            child: Icon(
                              Icons.play_arrow,
                              size: 32,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              setState(() {
                                _isplaying = false;
                                _showbottomsheet = false;
                              });
                            },
                          )
                        : FlatButton(
                            child: Icon(
                              Icons.stop,
                              size: 32,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              setState(() {
                                _isplaying = true;
                                _showbottomsheet = true;
                              });
                            },
                          ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      bottomSheet: _showbottomsheet
          ? null
          : Container(
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
              ),
              height: mediaquery.size.height * 0.11,
              child: Center(
                child: ListTile(
                  title: Text('Radio Station name'),
                  subtitle: Text('Frequency'),
                  trailing: Loading(
                    indicator: LineScalePulseOutIndicator(),
                    size: 32,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
    );
  }
}
