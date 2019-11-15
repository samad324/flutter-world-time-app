import 'package:flutter/material.dart';
import "package:world_time/Services/world_time.dart";

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  List<WorldTime> locations = [
    WorldTime(URL: 'Europe/London', location: 'London', flag: 'uk.png'),
    WorldTime(URL: 'Europe/Berlin', location: 'Athens', flag: 'greece.png'),
    WorldTime(URL: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.png'),
    WorldTime(URL: 'Africa/Nairobi', location: 'Nairobi', flag: 'kenya.png'),
    WorldTime(URL: 'America/Chicago', location: 'Chicago', flag: 'usa.png'),
    WorldTime(URL: 'America/New_York', location: 'New York', flag: 'usa.png'),
    WorldTime(URL: 'Asia/Seoul', location: 'Seoul', flag: 'south_korea.png'),
    WorldTime(URL: 'Asia/Jakarta', location: 'Jakarta', flag: 'indonesia.png'),
    WorldTime(URL: 'Asia/Karachi', location: 'Karachi', flag: 'pakistan.png'),
  ];

  renderCard(index) {
    WorldTime item = locations[index];
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
      child: Card(
        child: ListTile(
          onTap: () {
            updateTime(index);
          },
          title: Text(item.location),
          leading: CircleAvatar(
            backgroundImage: AssetImage('assets/${item.flag}'),
          ),
        ),
      ),
    );
  }

  void updateTime(index) async {
    WorldTime instance = locations[index];
    await instance.getTime();
    print(instance.location);
    Navigator.pop(context, {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDayTime': instance.isDayTime
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[700],
        title: Text('Choose a Location'),
        centerTitle: true,
      ),
      body: SafeArea(
          child: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index) {
          return renderCard(index);
        },
      )),
    );
  }
}
