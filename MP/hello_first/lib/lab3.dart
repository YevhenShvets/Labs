// import 'package:flutter/material.dart';
// import 'dart:math';
// import 'dart:async';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Lab2',
//       theme: ThemeData(
//         primarySwatch: Colors.yellow,
//         visualDensity: VisualDensity.adaptivePlatformDensity,
//       ),
//       home: MyMainPage(),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   String time = '30';
//   MyHomePage({Key key, @required this.time}) : super(key: key);

//   @override
//   _MyHomePageState createState() => _MyHomePageState(time: time);
// }

// class _MyHomePageState extends State<MyHomePage> {
//   var time = '30';
//   _MyHomePageState({this.time}) : super();
//   var _colors = [
//     Colors.red,
//     Colors.green,
//     Colors.blue,
//     Colors.orange,
//     Colors.grey,
//     Colors.yellow
//   ];
//   var _loading = true;
//   var _progressValue = 0.0;
//   MaterialColor _color_item = Colors.red;
//   var _rezult = 0;
//   var _colorname = "Red";
//   var _color = "Червоний";
//   var _colorlist = [
//     'Червоний',
//     'Зелений',
//     'Голубий',
//     'Оранжевий',
//     'Сірий',
//     'Жовтий'
//   ];
//   var _colornamelist = ['Red', 'Green', 'Blue', 'Orange', 'Grey', 'Yellow'];

//   void _nextRandYes() {
//     setState(() {
//       if (_colorlist.indexOf(_color) == _colornamelist.indexOf(_colorname)) {
//         _rezult++;
//       }
//       Random random = new Random();
//       int rand = random.nextInt(6);
//       _colorname = _colornamelist[rand];
//       rand = random.nextInt(6);
//       _color = _colorlist[rand];
//       _color_item = _colors[rand];
//     });
//   }

//   void _nextRandNo() {
//     setState(() {
//       if (_colorlist.indexOf(_color) != _colornamelist.indexOf(_colorname)) {
//         _rezult++;
//       }
//       Random random = new Random();
//       int rand = random.nextInt(6);
//       _colorname = _colornamelist[rand];
//       rand = random.nextInt(6);
//       _color = _colorlist[rand];
//       _color_item = _colors[rand];
//     });
//   }

//   void _nullRezult() {
//     setState(() {
//       _rezult = 0;
//     });
//   }

//   Future<void> _showMyDialog() async {
//     return showDialog<void>(
//       context: context,
//       barrierDismissible: false, // user must tap button!
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Text("Результат"),
//           content: Text(
//             "${_rezult}",
//             textAlign: TextAlign.center,
//             style: TextStyle(fontSize: 30),
//           ),
//           actions: <Widget>[
//             TextButton(
//               child: Text(
//                 "Обнулити",
//                 style: TextStyle(color: Colors.red),
//               ),
//               onPressed: () {
//                 _nullRezult();
//                 Navigator.of(context).pop();
//               },
//             ),
//             TextButton(
//               child: Text(
//                 'Ок',
//                 style: TextStyle(color: Colors.green, fontSize: 20),
//               ),
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//             ),
//           ],
//         );
//       },
//     );
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
//         if (_progressValue.toStringAsFixed(1) == '1.0') {
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
//       _restart_v = true;
//       _rezult = 0;
//       _progressValue = 0;
//     });
//     _updateProgress();
//   }

//   @override
//   void initState() {
//     _updateProgress();
//     super.initState();
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

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
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
//                     valueColor: new AlwaysStoppedAnimation<Color>(Colors.red),
//                     value: _progressValue,
//                   ),
//                   Text('${(_progressValue * 100).round()}%'),
//                 ],
//               )),
//           Container(
//               margin: EdgeInsets.symmetric(vertical: 60.0),
//               child: Text("Текст і назва кольору мають співпадати",
//                   textAlign: TextAlign.center,
//                   style: TextStyle(
//                     fontSize: 25,
//                     wordSpacing: 5,
//                   ))),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceAround,
//             children: <Widget>[
//               Text(
//                 "$_colorname",
//                 textAlign: TextAlign.center,
//                 style: TextStyle(fontSize: 18),
//               ),
//               Text(
//                 "$_color",
//                 textAlign: TextAlign.center,
//                 style: TextStyle(fontSize: 18, color: _color_item),
//               ),
//             ],
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceAround,
//             children: <Widget>[
//               IconButton(
//                   icon: Icon(Icons.add_circle),
//                   iconSize: 60,
//                   color: Colors.grey[400],
//                   highlightColor: Colors.grey,
//                   onPressed: _nextRandYes),
//               IconButton(
//                   icon: Icon(Icons.cancel),
//                   iconSize: 60,
//                   color: Colors.grey[400],
//                   highlightColor: Colors.grey,
//                   onPressed: _nextRandNo)
//             ],
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               RaisedButton(
//                 onPressed: _restart,
//                 child: Text("Рестарт"),
//               )
//             ],
//           )
//         ],
//       ),
//     );
//   }
// }

// class MyMainPage extends StatefulWidget {
//   MyMainPage({Key key}) : super(key: key);

//   @override
//   _MyMainPageState createState() => _MyMainPageState();
// }

// class _MyMainPageState extends State<MyMainPage> {
//   var _time = '30';
//   void _onPress() {
//     Navigator.of(context)
//         .push(MaterialPageRoute(builder: (context) => MyHomePage(time: _time)));
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Row(
//             children: [
//               Icon(Icons.grain_rounded, size: 200),
//               Text(
//                 "Game",
//                 style: TextStyle(fontSize: 30),
//               )
//             ],
//           ),
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
//           Row(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               RaisedButton(
//                 padding:
//                     EdgeInsets.only(left: 40, right: 40, top: 20, bottom: 20),
//                 hoverColor: Colors.blue,
//                 child: Text("Почати"),
//                 onPressed: _onPress,
//               )
//             ],
//           )
//         ],
//       ),
//     );
//   }
// }
