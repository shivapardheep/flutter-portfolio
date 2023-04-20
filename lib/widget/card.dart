import 'package:flutter/material.dart';

import '../constants.dart';

class ZoomableCard extends StatefulWidget {
  final String imageUrl;

  const ZoomableCard({Key? key, required this.imageUrl}) : super(key: key);

  @override
  _ZoomableCardState createState() => _ZoomableCardState();
}

class _ZoomableCardState extends State<ZoomableCard> {
  double _scale = 1.0;
  late Offset _previousOffset;
  late Offset _offset;

  @override
  void initState() {
    super.initState();
    _offset = Offset.zero;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onScaleStart: (details) {
        _previousOffset = details.focalPoint;
      },
      onScaleUpdate: (details) {
        setState(() {
          _scale *= details.scale;
          _scale = _scale.clamp(1.0, 5.0);

          _offset += details.focalPoint - _previousOffset;
          _previousOffset = details.focalPoint;
        });
      },
      child: Transform.scale(
        scale: _scale,
        child: Container(
          decoration: BoxDecoration(
              color: secondaryColor, borderRadius: BorderRadius.circular(10)),
          child: Column(
            children: [
              Expanded(
                flex: 3,
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                        image: AssetImage(widget.imageUrl), fit: BoxFit.cover),
                  ),
                ),
              ),
              const Expanded(flex: 1, child: Text("Shiva")),
            ],
          ),
        ),
      ),
    );
  }
}
