// import 'package:flip_card/flip_card.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// class MyFlipCard extends StatefulWidget {
//   @override
//   _MyFlipCardState createState() => _MyFlipCardState();
// }

// class _MyFlipCardState extends State<MyFlipCard> {
//   GlobalKey _cardKey = GlobalKey();

//   void _handleTap(TapDownDetails details) {
//     RenderBox box = _cardKey.currentContext!.findRenderObject() as RenderBox;
//     Offset localOffset = box.globalToLocal(details.globalPosition);

//     double cardWidth = box.size.width;
//     double cardHeight = box.size.height;

//     bool tapInTop = localOffset.dy < (cardHeight / 3);
//     bool tapInMiddle = !tapInTop && localOffset.dy < (2 * cardHeight / 3);
//     bool tapInBottom = !tapInTop && !tapInMiddle;

//     bool tapInLeft = localOffset.dx < (cardWidth / 3);
//     bool tapInMiddleX = !tapInLeft && localOffset.dx < (2 * cardWidth / 3);
//     bool tapInRight = !tapInLeft && !tapInMiddleX;

//     if (tapInTop) {
//       print('User tapped on the top side of the card');
//     } else if (tapInMiddle) {
//       print('User tapped on the middle side of the card');
//     } else if (tapInBottom) {
//       print('User tapped on the bottom side of the card');
//     }

//     if (tapInLeft) {
//       print('User tapped on the left side of the card');
//     } else if (tapInRight) {
//       print('User tapped on the right side of the card');
//     } else if (tapInMiddleX) {
//       print('User tapped on the middle side of the card');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         height: double.maxFinite,
//         width: double.maxFinite,
//         color: Colors.transparent,
//         child: GestureDetector(
//           onTapDown: _handleTap,
//           child: FlipCard(
//             key: _cardKey,
//             // add your own front and back card widgets here
//             front: Container(
//               color: Colors.blue,
//               child: Center(child: Text('Front',
//               style: TextStyle(fontSize: 80.sp),
//               )),
//             ),
//             back:  Container(
//               color: Colors.red,
//               child: Center(child: Text('Back',
//               style: TextStyle(fontSize: 80.sp),
//               )),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
