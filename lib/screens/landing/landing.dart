import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:screens_cart/core/sizeconfig.dart';
import 'package:screens_cart/screens/cart/cart.dart';
import 'package:screens_cart/screens/landing/components/card.dart';
import 'package:screens_cart/screens/landing/components/cartbar.dart';

import 'components/landingheader.dart';

class LandingPage extends StatefulWidget {
  LandingPage({Key key}) : super(key: key);

  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage>
    with TickerProviderStateMixin {
  List products = [
    {
      "image": "assets/sauce.png",
      "desc": "Seggiano Organic Togilatelle",
      "cost": "\$7.99",
      "grams": "500g",
    },
    {
      "image": "assets/pasta1.jpg",
      "desc": "Biona Organic White",
      "cost": "\$14.99",
      "grams": "500g",
    },
    {
      'image': "assets/pasta2.png",
      "desc": "Rummo Fusilli No 48 Pasta",
      "cost": "\$3.99",
      "grams": "500g",
    },
    {
      "image": "assets/pasta3.png",
      "desc": "Les Framboise",
      "cost": "\$7.99",
      "grams": "500g",
    }
  ];
  List cartProducts = [];

  Gradient topGrad =
      LinearGradient(colors: [Color(0xFFfffff2), Color(0x00FFFFFF)]);

  AnimationController _fadeCartBar;
  AnimationController _fadeCart;

  void _onDragUpdate(double metric) {
    _fadeCartBar.value = 1 - (metric / MediaQuery.of(context).size.width);
    _fadeCart.value = (metric / MediaQuery.of(context).size.width);
  }

  void addItemToCart(Map item) {
    setState(() => cartProducts.add(item));
  }

  void removeItemFromCart() {}

  List<Widget> getProducts() {
    List<Widget> temp = [];
    for (int x = 0; x < products.length; x++) {
      dynamic item = products[x];
      if ((x % 2) == 0) {
        temp.add(
          ItemCard(
            image: item["image"],
            desc: item["desc"],
            cost: item["cost"],
            grams: item["grams"],
            addItem: addItemToCart,
          ),
        );
      } else {
        temp.add(
          Transform.translate(
            offset: Offset(0, -025),
            child: ItemCard(
              image: item["image"],
              desc: item["desc"],
              cost: item["cost"],
              grams: item["grams"],
              addItem: addItemToCart,
            ),
          ),
        );
      }
    }

    return temp;
  }

  @override
  void initState() {
    _fadeCartBar = AnimationController(vsync: this)..value = 1;
    _fadeCart = AnimationController(vsync: this)..value = 1;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: NotificationListener(
        onNotification: (notif) {
          if (notif is ScrollUpdateNotification) {
            _onDragUpdate(notif.metrics.extentBefore);
          }
          return true;
        },
        child: ScrollConfiguration(
          behavior: new ScrollBehavior()
            ..buildViewportChrome(context, null, AxisDirection.down),
          child: PageView(
              pageSnapping: false,
              scrollDirection: Axis.vertical,
              children: [
                Column(
                  children: <Widget>[
                    Stack(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: Sc.blockSizeHorizontal * 3,
                              vertical: Sc.blockSizeVertical * 5),
                          width: Sc.blockSizeHorizontal * 100,
                          height: Sc.blockSizeVertical * 87.5,
                          child: NotificationListener(
                            onNotification: (_) => true,
                            child: FadeIn(
                                                          child: GridView.count(
                                  physics: BouncingScrollPhysics(),
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 15,
                                  mainAxisSpacing: 15,
                                  childAspectRatio: 2 / 3.5,
                                  children: getProducts()),
                            ),
                          ),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                bottomLeft:
                                    Radius.circular(Sc.blockSizeVertical * 7),
                                bottomRight:
                                    Radius.circular(Sc.blockSizeVertical * 7),
                              ),
                              color: Color(0xFFF3EBE1)),
                        ),
                        // HEADER
                        LandingHeader(),
                        Positioned(
                          bottom: Sc.blockSizeVertical * 1.5,
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  bottomLeft:
                                      Radius.circular(Sc.blockSizeVertical * 5),
                                  bottomRight:
                                      Radius.circular(Sc.blockSizeVertical * 5),
                                ),
                                gradient: LinearGradient(
                                    end: Alignment(0, 0),
                                    begin: Alignment(0, 0.8),
                                    colors: [
                                      Color(0xFFF3EBE1),
                                      Color(0x00F3EBE1)
                                    ])),
                          ),
                          width: Sc.blockSizeHorizontal * 100,
                          height: Sc.blockSizeVertical * 15,
                        ),
                      ],
                    ),
                    AnimatedBuilder(
                        animation: _fadeCartBar,
                        child: CartBar(products: cartProducts),
                        builder: (context, child) {
                          return Transform.translate(
                            offset: Offset(0, _fadeCartBar.value / 2),
                            child: Transform.scale(
                              scale: _fadeCartBar.value,
                              child: Opacity(
                                  child: child, opacity: _fadeCartBar.value),
                            ),
                          );
                        }),
                  ],
                ),
                AnimatedBuilder(
                    animation: _fadeCart,
                    child: Cart(products: cartProducts),
                    builder: (context, child) {
                      return Opacity(child: child, opacity: _fadeCart.value);
                    }),
              ]),
        ),
      ),
    );
  }
}
