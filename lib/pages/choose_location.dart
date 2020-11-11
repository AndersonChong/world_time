import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';

class Location extends StatefulWidget {
  @override
  _LocationState createState() => _LocationState();
}

class _LocationState extends State<Location> {
  var locationList = [
    WorldTime(
      location: 'Kuala Lumpur',
      url: 'Asia/Kuala_Lumpur',
      flag: 'malaysia_flag.gif',
    ),
    WorldTime(
      location: 'Shanghai',
      url: 'Asia/Shanghai',
      flag: 'china_flag.gif',
    ),
    WorldTime(
      location: 'Singapore',
      url: 'Asia/Singapore',
      flag: 'singapore_flag.gif',
    ),
    WorldTime(
      location: 'Tokyo',
      url: 'Asia/Tokyo',
      flag: 'japan_flag.gif',
    ),
    WorldTime(
      location: 'Melbourne',
      url: 'Australia/Melbourne',
      flag: 'australia_flag.gif',
    ),
    WorldTime(
      location: 'London',
      url: 'Europe/London',
      flag: 'england_flag.gif',
    ),
    WorldTime(
      location: 'Paris',
      url: 'Europe/Paris',
      flag: 'france_flag.gif',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    void getLocation(int index) async {
      WorldTime instance = locationList[index];
      await instance.getData();
      Navigator.pop(context, {
        'location': instance.location,
        'flag': instance.flag,
        'isDaytime': instance.isDaytime,
        'time': instance.time,
      });
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Choose Location'),
        centerTitle: true,
        backgroundColor: Colors.indigoAccent,
      ),
      body: ListView.builder(
        itemCount: locationList.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              onTap: () {
                getLocation(index);
              },
              leading: CircleAvatar(
                backgroundImage:
                    AssetImage('assets/${locationList[index].flag}'),
              ),
              title: Text(locationList[index].location),
            ),
          );
        },
      ),
    );
  }
}
