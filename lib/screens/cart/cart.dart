import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:screens_cart/core/sizeconfig.dart';

import 'components/cartitem.dart';
import 'components/delivery.dart';

class Cart extends StatefulWidget {
  Cart({Key key, this.products}) : super(key: key);

  final List products;

  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return NotificationListener(
      onNotification: (_) => true,
      child: Container(
          width: Sc.blockSizeHorizontal * 100,
          padding: EdgeInsets.only(
              left: Sc.blockSizeHorizontal * 6,
              right: Sc.blockSizeHorizontal * 6,
              top: Sc.blockSizeVertical * 5),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Container(
                child: Text(
              "Cart",
              style: GoogleFonts.roboto(color: Colors.white, fontSize: 48),
            )),
            // Items
            Expanded(
                child: Container(
                    margin: EdgeInsets.symmetric(
                        vertical: Sc.blockSizeVertical * 5),
                    child:
                        ListView(physics: BouncingScrollPhysics(), children: getProducts(),))),
            // Total
            Container(
                margin: EdgeInsets.only(bottom: Sc.blockSizeVertical * 5),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Total:",
                          style: GoogleFonts.roboto(
                              fontSize: 24, color: Colors.white54)),
                      Text("\$59.97",
                          style: GoogleFonts.roboto(
                              fontWeight: FontWeight.bold,
                              fontSize: 36,
                              color: Colors.white))
                    ]),
                height: Sc.blockSizeVertical * 10),
            // Next
            Container(
              margin: EdgeInsets.only(bottom: Sc.blockSizeVertical * 5),
              decoration: BoxDecoration(
                color: Colors.orange,
                borderRadius: BorderRadius.circular(90),
              ),
              height: Sc.blockSizeVertical * 10,
              width: double.infinity,
              child: Center(
                  child: Text("Next",
                      style: GoogleFonts.roboto(
                          fontWeight: FontWeight.bold, fontSize: 24))),
            ),
          ])),
    );
  }

  List<Widget> getProducts(){
    List<Widget> temp =[];
    widget.products.forEach((item)=>temp.add(CartItem(image:item["image"],cost:item["cost"],desc:item["desc"],count:1)));
    temp.add(DeliveryItem(),);
    return temp;

  }
}
