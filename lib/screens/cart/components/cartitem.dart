import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:screens_cart/core/sizeconfig.dart';

class CartItem extends StatelessWidget {
  const CartItem(
      {Key key,
      this.image = "assets/sauce.png",
      this.desc = "Newman's Own Pasta Sauce",
      this.count = 1,
      this.cost = "\$4.99"})
      : super(key: key);

  final String image;
  final String desc;
  final int count;
  final String cost;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom:Sc.blockSizeVertical * 5),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
              decoration:
                  BoxDecoration(color: Colors.white, shape: BoxShape.circle),
              width: Sc.blockSizeHorizontal * 12.5,
              height: Sc.blockSizeHorizontal * 12.5,
              padding: EdgeInsets.all(8),
              child: Image(
                fit: BoxFit.contain,
                image: AssetImage(image),
              ),
            ),
            Container(
              padding: EdgeInsets.all(8),
              child: Text("$count x ",
                  style: GoogleFonts.roboto(color: Colors.white, fontSize: 16)),
            ),
            Container(
              width: Sc.blockSizeHorizontal * 50,
              height: Sc.blockSizeHorizontal * 10,
              child: Text(desc,
                  style: GoogleFonts.roboto(color: Colors.white, fontSize: 18)),
            ),
            Text(cost,
                style: GoogleFonts.roboto(color: Colors.white54, fontSize: 16))
          ]),
    );
  }
}
