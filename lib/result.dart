import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';

class Result extends StatefulWidget {
  final int resultScore;
  final Function resetHandler;

  Result(this.resultScore, this.resetHandler);

  @override
  _ResultState createState() => _ResultState();
}

class _ResultState extends State<Result> with TickerProviderStateMixin {
  AnimationController _opacityController;
  Animation<double> _opacity;

  @override
  void initState() {
    super.initState();

    _opacityController = new AnimationController(
        vsync: this, duration: const Duration(seconds: 2));
    _opacity =
        new CurvedAnimation(parent: _opacityController, curve: Curves.easeInOut)
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              _opacityController.reverse();
            } else if (status == AnimationStatus.dismissed) {
              _opacityController.forward();
            }
          });
    _opacityController.forward();
  }

  @override
  void dispose() {
    super.dispose();
    _opacityController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: widget.resultScore == 298
            ? [
                FadeTransition(
                  opacity: _opacity,
                  child: Container(
                    margin: EdgeInsets.only(
                        left: 10, top: 60, right: 10, bottom: 10),
                    child: ShaderMask(
                      shaderCallback: (img) {
                        return LinearGradient(
                          begin: Alignment(0.0, 0.0),
                          end: Alignment.bottomRight,
                          colors: [
                            Colors.pink[400],
                            Colors.white60,
                          ],
                          tileMode: TileMode.mirror,
                        ).createShader(
                            Rect.fromLTRB(0, 0, img.width, img.height));
                      },
                      blendMode: BlendMode.color,
                      child: Image.asset(
                        'assets/images/pic2.png',
                        fit: BoxFit.cover,
                        width: 250,
                        height: 250,
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(20),
                  child: Text('You Are Awesome!',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center),
                ),
                Container(
                  margin: EdgeInsets.all(20),
                  child: FlatButton(
                    child: Text(
                      'Restart Quiz!',
                      style: TextStyle(fontSize: 28, color: Colors.pink[200]),
                    ),
                    textColor: Colors.white,
                    onPressed: widget.resetHandler,
                  ),
                ),
              ]
            : [
                Container(
                  margin:
                      EdgeInsets.only(left: 10, top: 80, right: 10, bottom: 20),
                  child: Stack(
                    children: <Widget>[
                      ShaderMask(
                        shaderCallback: (img) {
                          return LinearGradient(
                            begin: Alignment(0.0, 0.0),
                            end: Alignment.bottomRight,
                            colors: [
                              Colors.pink[400],
                              Colors.white60,
                            ],
                          ).createShader(
                              Rect.fromLTRB(0, 0, img.width, img.height));
                        },
                        blendMode: BlendMode.colorDodge,
                        child: Image.asset(
                          'assets/images/pic6.png',
                          width: 160,
                          height: 160,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(20),
                  child: Text('Try One More Time!!!',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center),
                ),
                Container(
                  margin: EdgeInsets.all(20),
                  child: FlatButton(
                    child: Text(
                      'Restart Quiz!',
                      style: TextStyle(fontSize: 28, color: Colors.pink[200]),
                    ),
                    onPressed: widget.resetHandler,
                  ),
                ),
              ],
      ),
    );
  }
}
