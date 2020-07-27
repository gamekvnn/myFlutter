import 'package:flutter/material.dart';
import 'package:kaimood/page/detail/design_theme.dart';

class BlueButton extends StatelessWidget {

  String name;
  BlueButton(this.name);
  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
        duration: const Duration(milliseconds: 500),
        opacity: 0.0,
        child: Padding(
          padding: const EdgeInsets.only(
              left: 16, bottom: 16, right: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: Container(
                  height: 48,
                  decoration: BoxDecoration(
                    color: DesignTheme.nearlyBlue,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(16.0),
                    ),
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                          color: DesignTheme
                              .nearlyBlue
                              .withOpacity(0.5),
                          offset: const Offset(1.1, 1.1),
                          blurRadius: 10.0),
                    ],
                  ),
                  child: Center(
                    child: Text(
                      this.name,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                        letterSpacing: 0.0,
                        color: DesignTheme
                            .nearlyWhite,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
    );
  }
}
