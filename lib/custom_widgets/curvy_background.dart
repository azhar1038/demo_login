import 'package:flutter/material.dart';

class CurvyBackground extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Stack(
          alignment: Alignment.bottomCenter,
          children: <Widget>[
            Card(
              elevation: 10.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
              ),
              child: Image.asset(
                'images/logo.png',
                width: 80,
              ),
            ),
            WavyHeader(),
          ],
        ),
        Expanded(
          child: Container(),
        ),
        Container(
          alignment: Alignment.bottomLeft,
          child: WavyFooter(),
        ),
      ],
    );
  }
}

const List<Color> strongBliss = [
  Color(0xfff78ca0),
  Color(0xfff9748f),
  Color(0xfffd868c),
  Color(0xfffe9a8b),
];

class WavyHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: TopWaveClipper(),
      child: Container(
        height: MediaQuery.of(context).size.height / 4,
        decoration: BoxDecoration(
            //color: Colors.black,
            gradient: LinearGradient(
          colors: strongBliss,
          begin: Alignment.topRight,
          end: Alignment.topLeft,
        )),
      ),
    );
  }
}

class WavyFooter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: FootWaveClipper(),
      child: Container(
        height: MediaQuery.of(context).size.height / 3,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: strongBliss,
            begin: Alignment.center,
            end: Alignment.bottomRight,
          ),
        ),
      ),
    );
  }
}

class TopWaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0.0, size.height);

    Offset controlPoint = Offset(size.width / 7, size.height / 5);
    Offset endPoint = Offset(size.width / 1.8, size.height / 5);

    path.quadraticBezierTo(
      controlPoint.dx,
      controlPoint.dy,
      endPoint.dx,
      endPoint.dy,
    );

    controlPoint = Offset(size.width - (size.width / 9), size.height / 6);
    endPoint = Offset(size.width, 16.0);

    path.quadraticBezierTo(
      controlPoint.dx,
      controlPoint.dy,
      endPoint.dx,
      endPoint.dy,
    );

    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}

class FootWaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.moveTo(size.width, 0.0);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width / 2, size.height);

    Offset controlPoint = Offset(size.width - (size.width / 6), size.height);
    Offset endPoint = Offset(size.width, 0.0);

    path.quadraticBezierTo(
      controlPoint.dx,
      controlPoint.dy,
      endPoint.dx,
      endPoint.dy,
    );
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
