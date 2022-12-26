// import 'package:floating_test1/const.dart';
// import 'package:flutter/material.dart';
// import 'package:floating_test1/main.dart';

// class Player extends StatefulWidget {
//   const Player({super.key});

//   @override
//   State<Player> createState() => _PlayerState();
// }

// class _PlayerState extends State<Player> {
//   var _x = 0.0;
//   var _y = 0.0;
  
  

//   @override
//   Widget build(BuildContext context) {
//     return Positioned(
//       left: _x,
//       top: _y,
//       child: Draggable(
//         child: Container(
//           width: playerDiameter,
//           height: playerDiameter,
//           decoration: BoxDecoration(
//             color: Colors.blue,
//             shape: BoxShape.circle,
//           ),
//         ),
//         feedback: Container(
//           width: 60,
//           height: 60,
//           decoration: BoxDecoration(
//             color: Colors.blue[200],
//             shape: BoxShape.circle,
//           ),
//         ),
//         onDragEnd: (dragDetails) {
//           setState(() {
//             final parentPos = stackKey.globalPaintBounds;
//             if (parentPos == null) return;
//             _x = dragDetails.offset.dx - parentPos.left; // 11.
//             _y = dragDetails.offset.dy - parentPos.top;
//           });
//         },
//       ),
//     );
//   }
// }

// extension GlobalKeyExtension on GlobalKey {
//   Rect? get globalPaintBounds {
//     final renderObject = currentContext?.findRenderObject();
//     var translation = renderObject?.getTransformTo(null).getTranslation();
//     if (translation != null && renderObject?.paintBounds != null) {
//       return renderObject!.paintBounds
//           .shift(Offset(translation.x, translation.y));
//     } else {
//       return null;
//     }
//   }
// }
