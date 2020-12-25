// import 'dart:math';

// import 'package:flutter/material.dart';
// import 'dart:async';

// import 'package:shared_preferences/shared_preferences.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       theme: ThemeData(fontFamily: "Verdana"),
//       title: "Menu",
//       home: LogoScreen(),
//     );
//   }
// }

// class LogoScreen extends StatefulWidget {
//   @override
//   _LogoScreenState createState() => _LogoScreenState();
// }

// class _LogoScreenState extends State<LogoScreen> {
//   final TextEditingController nameController = new TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.green[50],
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: <Widget>[
//           Text(
//             "KaifGame",
//             textAlign: TextAlign.center,
//             style: TextStyle(
//                 color: Colors.green[400],
//                 fontSize: 50,
//                 decoration: TextDecoration.combine(
//                     [TextDecoration.underline, TextDecoration.overline]),
//                 decorationStyle: TextDecorationStyle.dotted),
//           ),
//           Container(
//             margin: EdgeInsets.only(
//               top: 10.0,
//               right: 30,
//               left: 30,
//             ),
//             padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
//             child: TextFormField(
//               controller: nameController,
//               cursorColor: Colors.blue,
//               style: TextStyle(
//                 fontSize: 20,
//                 color: Colors.blue[400],
//               ),
//               textAlign: TextAlign.center,
//               decoration: InputDecoration(
//                 labelText: "Username",
//                 border: UnderlineInputBorder(
//                   borderSide: BorderSide(color: Colors.blue[500]),
//                 ),
//               ),
//             ),
//           ),
//           Container(
//             width: MediaQuery.of(context).size.width,
//             height: 40.0,
//             padding: EdgeInsets.symmetric(horizontal: 15.0),
//             margin: EdgeInsets.only(top: 15.0),
//             child: RaisedButton(
//               onPressed: () {
//                 if (this.nameController.text.length > 0)
//                   Navigator.of(context).push(MaterialPageRoute(
//                       builder: (context) => HomeScreen(
//                             name: nameController.text,
//                           )));
//               },
//               elevation: 0.0,
//               color: Colors.blue[600],
//               child: Text("Start",
//                   style: TextStyle(color: Colors.white, fontSize: 16)),
//               shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(10.0)),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class HomeScreen extends StatefulWidget {
//   String name;

//   HomeScreen({Key key, @required this.name}) : super(key: key);

//   @override
//   _HomeScreenState createState() => _HomeScreenState(name: name);
// }

// class _HomeScreenState extends State<HomeScreen> {
//   String name;
//   _HomeScreenState({this.name}) : super();

//   var _rezult = 0;
//   var _index = 0;
//   var lenght_index = 10;
//   int _selectedColor = 0;
//   int _selectedName = 0;
//   var _randname = "Red";
//   var _randcolor = Colors.red;

//   var time = '10';
//   var _progressValue = 0.0;
//   var _loading = true;

//   var _colors = [
//     {'name': "Red", 'value': Colors.red},
//     {'name': "Yellow", 'value': Colors.yellow},
//     {'name': "Orange", 'value': Colors.orange},
//     {'name': "Blue", 'value': Colors.blue},
//     {'name': "Green", 'value': Colors.green},
//     {'name': "Purple", 'value': Colors.purple},
//   ];

//   void _button_yes() {
//     if (this._selectedColor == this._selectedName) {
//       setState(() {
//         _rezult += 1;
//       });
//     }
//     _rand_color();
//     setState(() {
//       _index += 1;
//     });
//   }

//   void _button_no() {
//     if (this._selectedColor != this._selectedName) {
//       setState(() {
//         _rezult += 1;
//       });
//     }
//     _rand_color();
//     setState(() {
//       _index += 1;
//     });
//   }

//   void _rand_color() {
//     Random rand = new Random();
//     setState(() {
//       _selectedName = rand.nextInt(5);
//       _selectedColor = rand.nextInt(5);
//       _randname = _colors[_selectedName]['name'];
//       _randcolor = _colors[_selectedColor]['value'];
//     });
//   }

//   Future<void> _showMyDialog() async {
//     _save_stats(name, _rezult);
//     return showDialog<void>(
//       context: context,
//       barrierDismissible: false, // user must tap button!
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Text("${name} ваш результат"),
//           content: Text(
//             "${_rezult}",
//             textAlign: TextAlign.center,
//             style: TextStyle(fontSize: 30),
//           ),
//           actions: <Widget>[
//             TextButton(
//               child: Text(
//                 'Ок',
//                 style: TextStyle(color: Colors.black38, fontSize: 20),
//               ),
//               onPressed: () {
//                 _nullRezult();
//                 Navigator.of(context).pop();
//               },
//             ),
//           ],
//         );
//       },
//     );
//   }

//   void _nullRezult() {
//     setState(() {
//       _rezult = 0;
//     });
//   }

//   var _times = 0.1;
//   Timer times_periodic;
//   void _updateProgress() {
//     _restart_v = false;
//     const oneSec = const Duration(seconds: 1);
//     times_periodic = new Timer.periodic(oneSec, (Timer t) {
//       setState(() {
//         _progressValue += _times;
//         // we "finish" downloading here
//         if (_restart_v) {
//           _loading = false;
//           t.cancel();
//           return;
//         }
//         if (_progressValue >= 0.98) {
//           _loading = false;
//           t.cancel();
//           _showMyDialog();
//           return;
//         }
//       });
//     });
//   }

//   bool _restart_v = false;
//   void _restart() {
//     setState(() {
//       times_periodic.cancel();
//       _restart_v = true;
//       _rezult = 0;
//       _progressValue = 0;
//     });
//     _get_from_shared();
//     _updateProgress();
//   }

//   void _pause() {
//     if(times_periodic.isActive){
//       setState(() {
//         times_periodic.cancel();
//       });
//     }else{
//       setState(() {
//         _updateProgress();
//       });
//     }
//   }

//   @override
//   void initState() {
//     _get_from_shared();
//     _updateProgress();
//     super.initState();
//   }

//   Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
//   Future<void> _get_from_shared() async {
//     SharedPreferences prefs = await _prefs;
//     setState(() {
//       time = (prefs.getString("time"));
//       print(time.toLowerCase());
//     });
//     if (time == "30") {
//       _times = 0.03;
//     }
//     if (time == "20") {
//       _times = 0.05;
//     }
//     if (time == "10") {
//       _times = 0.1;
//     }
//   }
//   var _user_stats = "";
//   Future<void> _save_stats(var name, var stats) async {
//     SharedPreferences prefs = await _prefs;
//     var text = prefs.getString("stats");
//       prefs.setString("stats", text+"$name"+ "  "+"$_rezult"+"\n");
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Hello " + this.name),
//         actions: <Widget>[
//           PopupMenuButton<String>(
//             onSelected: (String result) {
//               switch (result) {
//                 case "1":
//                   Navigator.of(context).push(MaterialPageRoute(
//                       builder: (context) => SettingsScreen()));
//                   break;
//                 case "2":
//                   Navigator.of(context).pushAndRemoveUntil(
//                       MaterialPageRoute(builder: (context) => LogoScreen()),
//                       ModalRoute.withName('/'));
//                   break;
//               }
//             },
//             itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
//               const PopupMenuItem<String>(
//                 value: "1",
//                 child: Text('Settings\t'),
//               ),
//               const PopupMenuItem<String>(
//                 value: "2",
//                 child: Text('New game\t'),
//               ),
//             ],
//           ),
//         ],
//       ),
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: <Widget>[
//           Container(
//               padding: EdgeInsets.all(12.0),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: <Widget>[
//                   LinearProgressIndicator(
//                     backgroundColor: Colors.cyanAccent,
//                     valueColor: new AlwaysStoppedAnimation<Color>(
//                         Colors.deepOrange[200]),
//                     value: _progressValue,
//                   ),
//                   Text('${(_progressValue * 100).round()}%'),
//                 ],
//               )),
//           SizedBox(
//             height: 60,
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceAround,
//             children: <Widget>[
//               Text(
//                 "$_randname",
//                 textAlign: TextAlign.center,
//                 style: TextStyle(fontSize: 18),
//               ),
//               Text(
//                 "$_randname",
//                 textAlign: TextAlign.center,
//                 style: TextStyle(fontSize: 18, color: _randcolor),
//               ),
//             ],
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceAround,
//             children: <Widget>[
//               IconButton(
//                   icon: Icon(Icons.add_circle),
//                   iconSize: 60,
//                   color: Colors.green[300],
//                   highlightColor: Colors.green[50],
//                   onPressed: _button_yes),
//               IconButton(
//                   icon: Icon(Icons.cancel),
//                   iconSize: 60,
//                   color: Colors.red[300],
//                   highlightColor: Colors.red[50],
//                   onPressed: _button_no)
//             ],
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               RaisedButton(
//                 onPressed: _restart,
//                 child: Text("Restart"),
//                 shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(10.0)),
//               ),
//               RaisedButton(
//                 onPressed: _pause,
//                 child: Text("Pause"),
//                 shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(10.0)),
//               ),
//             ],
//           )
//         ],
//       ),
//     );
//   }
// }

// class SettingsScreen extends StatefulWidget {
//   _SettingScreenState createState() => _SettingScreenState();
// }

// class _SettingScreenState extends State<SettingsScreen> {
//   var _time = '10';
//   var user_stats = "";

//   Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
//   Future<void> _save() async {
//     SharedPreferences prefs = await _prefs;
//     setState(() {
//       _time = prefs.setString("time", _time).then((bool success) {
//         return _time;
//       }) as String;
//     });
//   }

//    Future<void> _get_stats() async {
//     SharedPreferences prefs = await _prefs;
//     setState(() {
//       user_stats = (prefs.getString("stats"));
//     });
//   }

//   @override
//   void initState() {
//     _get_stats();
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Settings"),
//       ),
//       body: Column(
//         children: <Widget>[
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceAround,
//             children: <Widget>[
//               Text("Час"),
//               DropdownButton(
//                   style: TextStyle(color: Colors.green, fontSize: 20),
//                   value: _time,
//                   onChanged: (String newValue) {
//                     setState(() {
//                       _time = newValue;
//                     });
//                   },
//                   items: <String>['10', '20', '30']
//                       .map<DropdownMenuItem<String>>((String value) {
//                     return DropdownMenuItem<String>(
//                       value: value,
//                       child: Text(value),
//                     );
//                   }).toList())
//             ],
//           ),
//           Container(
//             margin: EdgeInsets.symmetric(horizontal: 15.0),
//             padding: EdgeInsets.all(15.0),
//             child: RaisedButton(
//               child: Text(
//                 "Save",
//               ),
//               onPressed: _save,
//               shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(10.0)),
//             ),
//           ),
//           Column(children: [
//             Text("$user_stats")
//           ],)
//         ],
//       ),
//     );
//   }
// }
