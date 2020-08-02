import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:screens_cart/core/sizeconfig.dart';

class LandingHeader extends StatelessWidget {
  const LandingHeader({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
                          top: -5,
                          child: Container(
                            alignment: Alignment.topCenter,
                            child: Container(
                              padding: EdgeInsets.only(
                                top: Sc.blockSizeVertical * 5,
                                left: Sc.blockSizeHorizontal * 0,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: <Widget>[
                                  Icon(AntDesign.arrowleft),
                                  Padding(
                                    padding: EdgeInsets.only(
                                      right: Sc.blockSizeHorizontal * 10,
                                    ),
                                    child: Text("Pasta and Noodles",
                                        style: GoogleFonts.roboto(
                                            fontSize: 24,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                  Icon(Octicons.settings),
                                ],
                              ),
                            ),
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                                    begin: Alignment(0, 0.20),
                                    end: Alignment(0, 1),
                                    colors: [
                                  Color(0xFFF3EBE1),
                                  Color(0x00F3EBE1)
                                ])),
                          ),
                          width: Sc.blockSizeHorizontal * 100,
                          height: Sc.blockSizeVertical * 15,
                        );
  }
}