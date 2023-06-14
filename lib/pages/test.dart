// import 'package:flutter/material.dart';
// import 'package:sensors_plus/sensors_plus.dart';

// class GyroscopePage extends StatefulWidget {
//   @override
//   _GyroscopePageState createState() => _GyroscopePageState();
// }

// class _GyroscopePageState extends State<GyroscopePage> {
//   List<double>? _gyroscopeValues;

//   @override
//   void initState() {
//     super.initState();
//     _startListeningToGyroscope();
//   }

//   @override
//   void dispose() {
//     _stopListeningToGyroscope();
//     super.dispose();
//   }

//   void _startListeningToGyroscope() {
//     gyroscopeEvents.listen((GyroscopeEvent event) {
//       setState(() {
//         _gyroscopeValues = <double>[event.x, event.y, event.z];
//       });
//     });
//   }

//   void _stopListeningToGyroscope() {
//     gyroscopeEvents.drain();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Gyroscope Example'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(
//               'Gyroscope Values:',
//               style: TextStyle(fontSize: 20),
//             ),
//             SizedBox(height: 16),
//             Text(
//               _gyroscopeValues != null
//                   ? 'X: ${_gyroscopeValues![0]}\nY: ${_gyroscopeValues![1]}\nZ: ${_gyroscopeValues![2]}'
//                   : 'No data',
//               style: TextStyle(fontSize: 18),
//               textAlign: TextAlign.center,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }