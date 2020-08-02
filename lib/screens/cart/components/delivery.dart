import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:screens_cart/core/sizeconfig.dart';

class DeliveryItem extends StatelessWidget {
  const DeliveryItem({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(bottom: Sc.blockSizeVertical * 5),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: <
            Widget>[
          Container(
              decoration:
                  BoxDecoration(color: Colors.white24, shape: BoxShape.circle),
              width: Sc.blockSizeHorizontal * 12.5,
              height: Sc.blockSizeHorizontal * 12.5,
              padding: EdgeInsets.all(8),
              child: Icon(
                FontAwesome.car,
                color: Colors.orange,
              )),
          Container(
            width: Sc.blockSizeHorizontal * 65,
            padding: EdgeInsets.only(top: Sc.blockSizeVertical * 5, left: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("Delivery ",
                    style:
                        GoogleFonts.roboto(color: Colors.white, fontSize: 18)),
                Padding(
                  padding: EdgeInsets.only(
                      right: Sc.blockSizeHorizontal * 20, top: 10),
                  child: Text(
                      "All orders of \$40 or more qualify for FREE delivery",
                      style: GoogleFonts.roboto(
                          color: Colors.white54, fontSize: 16)),
                ),
              ],
            ),
          ),
          Text("\$30",
              style: GoogleFonts.roboto(color: Colors.white54, fontSize: 16))
        ]));
  }
}
