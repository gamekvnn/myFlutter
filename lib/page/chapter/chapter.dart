import 'package:flutter/material.dart';
import 'package:kaimood/model/chapter_model.dart';
import 'package:kaimood/page/detail/design_theme.dart';

class ChapterScreen extends StatefulWidget {
  final List<ChapterModel> info;

  ChapterScreen(this.info);

  @override
  _ChapterScreenState createState() => _ChapterScreenState(info);
}

class _ChapterScreenState extends State<ChapterScreen>
    with TickerProviderStateMixin {
  final List<ChapterModel> info;

  _ChapterScreenState(this.info);

  final double infoHeight = 364.0;
  AnimationController animationController;
  Animation<double> animation;
  double opacity1 = 0.0;
  double opacity2 = 0.0;
  double opacity3 = 0.0;
  int i = 0;

  @override
  void initState() {
    animationController = AnimationController(
        duration: const Duration(milliseconds: 1000), vsync: this);
    animation = Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        parent: animationController,
        curve: Interval(0, 1.0, curve: Curves.fastOutSlowIn)));
    setData();
    super.initState();
  }

  Future<void> setData() async {
    animationController.forward();
    await Future<dynamic>.delayed(const Duration(milliseconds: 200));
    setState(() {
      opacity1 = 1.0;
    });
    await Future<dynamic>.delayed(const Duration(milliseconds: 200));
    setState(() {
      opacity2 = 1.0;
    });
    await Future<dynamic>.delayed(const Duration(milliseconds: 200));
    setState(() {
      opacity3 = 1.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    final double tempHeight = MediaQuery.of(context).size.height -
        (MediaQuery.of(context).size.width / 1.2) +
        24.0;
    return Container(
      color: Colors.white,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: <Widget>[
            Positioned(
              top: 20,
              bottom: 0,
              left: 0,
              right: 0,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(left: 8, right: 8),
                  child: SingleChildScrollView(
                    child: Container(
                      constraints: BoxConstraints(
                          minHeight: infoHeight,
                          maxHeight: 3000.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 32.0, left: 18, right: 16),
                            child: Text(
                              "Chương " +
                                  info[i].id.toString() +
                                  ": " +
                                  info[i].chapterName,
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 22,
                                letterSpacing: 0.27,
                                color: DesignTheme.darkerText,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 16, right: 16, bottom: 8, top: 8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  info[i].nameOfNovel,
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w200,
                                    fontSize: 14,
                                    letterSpacing: 0.27,
                                    color: DesignTheme.nearlyBlack,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: AnimatedOpacity(
                              duration: const Duration(milliseconds: 500),
                              opacity: opacity2,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 16, right: 16, top: 8, bottom: 8),
                                child: new SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: new Column(
                                    children: <Widget>[
                                      Text(
                                        '''${info[i].content}''',
                                        textAlign: TextAlign.justify,
                                        style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 14,
                                          letterSpacing: 0.27,
                                          color: DesignTheme.grey,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      AnimatedOpacity(
                                          duration: const Duration(milliseconds: 500),
                                          opacity: opacity3,
                                          child: Stack(
                                            children: <Widget>[
                                              Column(
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                children: <Widget>[
                                                  Row(
                                                    mainAxisAlignment:
                                                    MainAxisAlignment.spaceAround,
                                                    children: <Widget>[
                                                      SizedBox(width: 20),
                                                      Expanded(
                                                        child: FlatButton(
                                                          shape: RoundedRectangleBorder(
                                                              borderRadius:
                                                              new BorderRadius.circular(
                                                                  15.0)),
                                                          color: DesignTheme.nearlyBlue,
                                                          onPressed: () {
                                                            setState(() {});
                                                          },
                                                          child: Text(
                                                            'Chương trước',
                                                            textAlign: TextAlign.left,
                                                            style: TextStyle(
                                                              fontWeight: FontWeight.w600,
                                                              fontSize: 18,
                                                              letterSpacing: 0.0,
                                                              color:
                                                              DesignTheme.nearlyWhite,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(width: 20),
                                                      Expanded(
                                                        child: FlatButton(
                                                          shape: RoundedRectangleBorder(
                                                              borderRadius:
                                                              new BorderRadius.circular(
                                                                  15.0)),
                                                          color: DesignTheme.nearlyBlue,
                                                          onPressed: () {
                                                            setState(() {});
                                                          },
                                                          child: Text(
                                                            'Chương tới',
                                                            textAlign: TextAlign.left,
                                                            style: TextStyle(
                                                              fontWeight: FontWeight.w600,
                                                              fontSize: 18,
                                                              letterSpacing: 0.0,
                                                              color:
                                                              DesignTheme.nearlyWhite,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(width: 20),
                                                    ],
                                                  )
                                                ],
                                              ),
                                            ],
                                          )),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).padding.bottom,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget getTimeBoxUI(String text1, String txt2) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: DesignTheme.nearlyWhite,
          borderRadius: const BorderRadius.all(Radius.circular(16.0)),
        ),
        child: Padding(
          padding: const EdgeInsets.only(
              left: 18.0, right: 18.0, top: 12.0, bottom: 12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                text1,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                  letterSpacing: 0.27,
                  color: DesignTheme.nearlyBlue,
                ),
              ),
              Text(
                txt2,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                  letterSpacing: 0.27,
                  color: DesignTheme.grey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
