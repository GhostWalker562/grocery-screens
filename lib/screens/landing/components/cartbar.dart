import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:screens_cart/core/sizeconfig.dart';

class CartBar extends StatelessWidget {
  const CartBar({Key key, this.products}) : super(key: key);

  final List products;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: Sc.blockSizeVertical * 12.5,
        child: ListView(
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          children: getCartProducts(),
        ),
        padding: EdgeInsets.symmetric(
            horizontal: Sc.blockSizeHorizontal * 5,
            vertical: Sc.blockSizeVertical * 2));
  }

  List<Widget> getCartProducts() {
    List<Widget> temp = [
      Center(
        child: Text(
          "Cart",
          style: GoogleFonts.roboto(color: Colors.white, fontSize: 24),
        ),
      ),
    ];
    products.forEach((item) => temp.add(createProduct(item['image'])));
    temp.add(Container(
        decoration: BoxDecoration(color: Colors.orange, shape: BoxShape.circle),
        width: Sc.blockSizeHorizontal * 10,
        height: Sc.blockSizeHorizontal * 10,
        child: Center(child: Text("${products.length}",style: GoogleFonts.roboto(fontWeight:FontWeight.bold,fontSize:18))),
        margin: EdgeInsets.only(
          left: Sc.blockSizeHorizontal * 5,
        ),
        padding: EdgeInsets.symmetric(
          horizontal: Sc.blockSizeHorizontal * 1,
          vertical: Sc.blockSizeHorizontal * 1,
        ),
      ));
    return temp;
  }

  Widget createProduct(String image) {
    return ZoomIn(
          child: Container(
        decoration: BoxDecoration(color: Colors.white, shape: BoxShape.circle),
        width: Sc.blockSizeHorizontal * 10,
        height: Sc.blockSizeHorizontal * 10,
        child: Image(
          fit: BoxFit.contain,
          image: AssetImage(image),
        ),
        margin: EdgeInsets.only(
          left: Sc.blockSizeHorizontal * 5,
        ),
        padding: EdgeInsets.symmetric(
          horizontal: Sc.blockSizeHorizontal * 1,
          vertical: Sc.blockSizeHorizontal * 1,
        ),
      ),
    );
  }
}
