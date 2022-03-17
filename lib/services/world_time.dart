import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  String location; //location name for UI
  late String time; //the time in that location
  String flag; //url to an asset flag icon
  String url; //location url for api endpoint
  late bool isDaytime; // true or false if Daytime or not

  WorldTime({required this.location, required this.flag, required this.url});

  Future<void> getTime() async {
    try {
      Response response =
          await get(Uri.parse('https://worldtimeapi.org/api/timezone/$url'));

      Map data = jsonDecode(response.body);
      // print(data);
      // get properties from data
      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(1, 3);
      // print(datetime);
      // print(offset);
      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));

      //set isDaytime property
      isDaytime = now.hour > 6 && now.hour < 20 ? true : false;

      //set the time property
      time = DateFormat.jm().format(now);
    } catch (err) {
      print('Caught error: $err');
      time = 'Could not get the time';
    }

    //  Response response= await get('https://jsonplaceholder.typicode.com/todos/1');
    // //simulate network for a username

    // String username = await Future.delayed(Duration(seconds: 3), () {
    //   return "Temesgen";
    // });

    // String bio = await Future.delayed(Duration(seconds: 3), () {
    //   return "Mobile App Developer, Wed designer and developer";
    // });

    // print('$username - $bio');
  }
}
