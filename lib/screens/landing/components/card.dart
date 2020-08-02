import 'package:flutter/material.dart';
import 'package:flutter_page_transition/flutter_page_transition.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:screens_cart/core/sizeconfig.dart';
import 'package:screens_cart/screens/details/details.dart';

class ItemCard extends StatelessWidget {
  const ItemCard(
      {Key key,
      this.image = "assets/sauce.png",
      this.cost = "\$7.99",
      this.desc = "Seggiano Organic Togilatelle",
      this.grams = "500g", this.addItem})
      : super(key: key);

  final String image;
  final String cost;
  final String desc;
  final String grams;
  final Function addItem;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).push(PageTransition(
          type: PageTransitionType.slideInDown, child: DetailsPage(image: image,desc:desc, cost:  cost, grams: grams, addItem:addItem))),
      child: Container(
        padding: EdgeInsets.symmetric(
            horizontal: Sc.blockSizeHorizontal * 5,
            vertical: Sc.blockSizeVertical * 2.5),
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [BoxShadow(color: Colors.white)],
            borderRadius: BorderRadius.circular(30)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              height: Sc.blockSizeVertical * 25,
              padding: EdgeInsets.symmetric(vertical: Sc.blockSizeVertical * 5),
              child: Hero(
                tag : image,
                              child: Image(
                  fit: BoxFit.contain,
                  image: AssetImage(image),
                ),
              ),
            ),
            Align(
                alignment: Alignment.centerLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(bottom: 15.0),
                      child: Text(cost,
                          style: GoogleFonts.roboto(
                              fontSize: 28, fontWeight: FontWeight.bold)),
                    ),
                    Text(desc,
                        style: GoogleFonts.roboto(
                            fontSize: 16, fontWeight: FontWeight.bold)),
                    Text(
                      grams,
                      textAlign: TextAlign.left,
                      style: GoogleFonts.roboto(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black54),
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
