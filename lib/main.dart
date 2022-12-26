import 'package:floating_test1/const.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'HockTactics'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  var _x = 0.0;
  var _y = 0.0;

  var _x2 = 0.0;
  var _y2 = 0.0;

  final GlobalKey stackKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(widget.title),
      // ),
      body: Stack(
        key: stackKey,
        fit: StackFit.expand,
        children: [
          //*draggable
          buildPlayer(),
          buildPlayer2(),

          //*gates top
          Positioned(
            top: 10,
            left: screenWidth / 2 - gatesWidth / 2,
            child: Container(
              color: Colors.red,
              width: gatesWidth,
              height: 50,
            ),
          ),

          //*gates bottom
          Positioned(
            bottom: 10,
            left: screenWidth / 2 - gatesWidth / 2,
            child: Container(
              color: Colors.blue,
              width: gatesWidth,
              height: 50,
            ),
          ),
        ],
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {},
            tooltip: 'Add blue player',
            child: const Icon(Icons.add),
          ),
          const SizedBox(height: 16),
          FloatingActionButton(
            backgroundColor: Colors.red,
            onPressed: () {},
            tooltip: 'Add red player',
            child: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }

  Positioned buildPlayer() {
    return Positioned(
      left: _x,
      top: _y,
      child: Draggable(
        child: Column(
          children: [
            Container(
              width: playerDiameter,
              height: playerDiameter,
              decoration: BoxDecoration(
                color: Colors.blue,
                shape: BoxShape.circle,
              ),
            ),
            Text('ryan'),
          ],
        ),
        feedback: Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            color: Colors.blue,
            shape: BoxShape.circle,
          ),
        ),
        onDragEnd: (dragDetails) {
          setState(() {
            final parentPos = stackKey.globalPaintBounds;
            if (parentPos == null) return;
            _x = dragDetails.offset.dx - parentPos.left; // 11.
            _y = dragDetails.offset.dy - parentPos.top;
          });
        },
      ),
    );
  }

  Positioned buildPlayer2() {
    return Positioned(
      left: _x2,
      top: _y2,
      child: Draggable(
        child: Column(
          children: [
            Container(
              width: playerDiameter,
              height: playerDiameter,
              decoration: BoxDecoration(
                color: Colors.blue,
                shape: BoxShape.circle,
              ),
            ),
            Text('Dkato'),
          ],
        ),
        feedback: Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            color: Colors.blue,
            shape: BoxShape.circle,
          ),
        ),
        onDragEnd: (dragDetails) {
          setState(() {
            final parentPos = stackKey.globalPaintBounds;
            if (parentPos == null) return;
            _x2 = dragDetails.offset.dx - parentPos.left; // 11.
            _y2 = dragDetails.offset.dy - parentPos.top;
          });
        },
      ),
    );
  }
}

extension GlobalKeyExtension on GlobalKey {
  Rect? get globalPaintBounds {
    final renderObject = currentContext?.findRenderObject();
    var translation = renderObject?.getTransformTo(null).getTranslation();
    if (translation != null && renderObject?.paintBounds != null) {
      return renderObject!.paintBounds
          .shift(Offset(translation.x, translation.y));
    } else {
      return null;
    }
  }
}
