import 'package:flutter/material.dart';
import 'package:world_tme/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  // void getTime() async {
  //   Response response = await get(
  //       Uri.parse('https://worldtimeapi.org/api/timezone/Europe/London'));

  //   Map data = jsonDecode(response.body);
  //   // print(data);
  //   // get properties from data
  //   String datetime = data['datetime'];
  //   String offset = data['utc_offset'].substring(1, 3);
  //   print(datetime);
  //   print(offset);
  //   DateTime now = DateTime.parse(datetime);
  //   now = now.add(Duration(hours: int.parse(offset)));
  //   print(now);

  //   //  Response response= await get('https://jsonplaceholder.typicode.com/todos/1');
  //   // //simulate network for a username

  //   // String username = await Future.delayed(Duration(seconds: 3), () {
  //   //   return "Temesgen";
  //   // });

  //   // String bio = await Future.delayed(Duration(seconds: 3), () {
  //   //   return "Mobile App Developer, Wed designer and developer";
  //   // });

  //   // print('$username - $bio');
  // }

  // String time = 'loading';
  // WorldTime instance =
  //     WorldTime(location: 'Berlin', flag: 'germany.jpg', url: 'Europe/Berlin');

  void setUpWorldTime() async {
    WorldTime instance = WorldTime(
        location: 'Berlin', flag: 'germany.jpg', url: 'Europe/Berlin');
    await instance.getTime();

    // print(instance.time);
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDaytime': instance.isDaytime,
    });

    // setState(() {
    //   time = instance.time;
    // });
  }

  @override
  void initState() {
    super.initState();
    // getTime();
    setUpWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: Center(
        child: SpinKitRing(
          color: Colors.white,
          size: 80.0,
        ),
      ),
    );
  }
}
