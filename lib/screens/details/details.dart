import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:screens_cart/core/sizeconfig.dart';

class DetailsPage extends StatefulWidget {
  DetailsPage(
      {Key key,
      this.image = "assets/sauce.png",
      this.cost = "\$7.99",
      this.desc = "Seggiano Organic Togilatelle",
      this.grams = "500g",
      this.addItem})
      : super(key: key);

  final String image;
  final String cost;
  final String desc;
  final String grams;
  final Function addItem;

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FadeInDown(
      delay: Duration(seconds: 0),
      child: Container(
        color: Colors.white,
        child: Stack(
          children: <Widget>[
            Column(
              children: <Widget>[
                // IMAGE
                Container(
                  height: Sc.blockSizeVertical * 40,
                  width: Sc.blockSizeHorizontal * 100,
                  padding:
                      EdgeInsets.symmetric(vertical: Sc.blockSizeVertical * 5),
                  child: Hero(
                    tag: widget.image,
                    child: Image(
                      fit: BoxFit.contain,
                      image: AssetImage(widget.image),
                    ),
                  ),
                ),
                // HEADER
                Container(
                  height: Sc.blockSizeVertical * 20,
                  width: Sc.blockSizeHorizontal * 100,
                  padding: EdgeInsets.only(
                      right: Sc.blockSizeHorizontal * 20,
                      left: Sc.blockSizeHorizontal * 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text(widget.desc,
                          style: GoogleFonts.roboto(
                              fontSize: 36, fontWeight: FontWeight.bold)),
                      Text(widget.grams,
                          style: GoogleFonts.roboto(
                              fontSize: 18, color: Colors.black26))
                    ],
                  ),
                ),
                // PRICE
                Container(
                  height: Sc.blockSizeVertical * 10,
                  width: Sc.blockSizeHorizontal * 100,
                  padding: EdgeInsets.symmetric(
                      horizontal: Sc.blockSizeHorizontal * 5,
                      vertical: Sc.blockSizeVertical * 1),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        width: Sc.blockSizeHorizontal * 30,
                        height: Sc.blockSizeVertical * 6,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(90),
                          color: Colors.white,
                          border: Border.all(color: Colors.black12, width: 1),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Icon(AntDesign.minus),
                            Text("1", style: GoogleFonts.roboto(fontSize: 20)),
                            Icon(AntDesign.plus),
                          ],
                        ),
                      ),
                      Text(widget.cost,
                          style: GoogleFonts.roboto(
                              fontSize: 32, fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
                // DESC
                Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: Sc.blockSizeHorizontal * 5,
                      vertical: Sc.blockSizeVertical * 1),
                  height: Sc.blockSizeVertical * 15,
                  width: Sc.blockSizeHorizontal * 100,
                  child: Stack(
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Container(
                            child: Text(
                              "About the product",
                              style: GoogleFonts.roboto(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                          ),
                          Text(
                            "Aute in aliqua ut aliquip deserunt nostrud. Ullamco nisi esse consequat ",
                            style: GoogleFonts.roboto(
                                fontSize: 16,
                                color: Colors.black54,
                                height: 1.5),
                            overflow: TextOverflow.fade,
                          )
                        ],
                      ),
                      Positioned(
                          bottom: 0,
                          child: Container(
                            height: Sc.blockSizeVertical * (15),
                            width: Sc.blockSizeHorizontal * 100,
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                                    begin: Alignment(0, 1),
                                    end: Alignment(0, 0),
                                    colors: [Colors.white, Color(0x00FFFFFF)])),
                          ))
                    ],
                  ),
                ),
                // BUY FAVORITE
                Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: Sc.blockSizeHorizontal * 5,
                      vertical: Sc.blockSizeVertical * 3),
                  height: Sc.blockSizeVertical * 15,
                  width: Sc.blockSizeHorizontal * 100,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: EdgeInsets.all(Sc.blockSizeVertical * 2),
                          child: Icon(AntDesign.heart),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                              border: Border.all(color: Colors.black12)),
                        ),
                        FlatButton(
                          padding: EdgeInsets.zero,
                          // LOGIC HERE IS TEMPORARY USAGE
                          onPressed: () {
                            widget.addItem({
                              "image": widget.image,
                              "desc": widget.desc,
                              "grams": widget.grams,
                              "cost": widget.cost
                            });
                            Navigator.of(context).pop();
                          },
                          child: Container(
                            width: Sc.blockSizeHorizontal * 70,
                            margin: EdgeInsets.only(
                              left: Sc.blockSizeHorizontal * 5,
                            ),
                            child: Center(
                                child: Text(
                              "Add to Cart",
                              style: GoogleFonts.roboto(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            )),
                            decoration: BoxDecoration(
                                color: Colors.orange,
                                borderRadius: BorderRadius.circular(90)),
                          ),
                        ),
                      ]),
                ),
              ],
            ),
            Positioned(
              top: 0,
              child: Container(
                alignment: Alignment.centerLeft,
                width: Sc.blockSizeHorizontal * 100,
                height: Sc.blockSizeVertical * 10,
                child: IconButton(
                  icon: Icon(AntDesign.arrowleft),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
