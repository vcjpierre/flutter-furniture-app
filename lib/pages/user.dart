import 'package:flutter/material.dart';

class UserPage extends StatefulWidget {
  @override
  _UserPageState createState() => _UserPageState();
}

class _UserPageState extends State<UserPage>
    with SingleTickerProviderStateMixin {
  int getColorHexFromStr(String colorStr) {
    colorStr = "FF" + colorStr;
    colorStr = colorStr.replaceAll("#", "");
    int val = 0;
    int len = colorStr.length;
    for (int i = 0; i < len; i++) {
      int hexDigit = colorStr.codeUnitAt(i);
      if (hexDigit >= 48 && hexDigit <= 57) {
        val += (hexDigit - 48) * (1 << (4 * (len - 1 - i)));
      } else if (hexDigit >= 65 && hexDigit <= 70) {
        // A..F
        val += (hexDigit - 55) * (1 << (4 * (len - 1 - i)));
      } else if (hexDigit >= 97 && hexDigit <= 102) {
        // a..f
        val += (hexDigit - 87) * (1 << (4 * (len - 1 - i)));
      } else {
        throw new FormatException("An error occurred when converting a color");
      }
    }
    return val;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(children: <Widget>[
        Column(children: <Widget>[
          Stack(children: <Widget>[
            Container(
              height: 250.0,
              width: double.infinity,
              color: Color(getColorHexFromStr('#FDD148')),
            ),
            Positioned(
              bottom: 250.0,
              right: 100.0,
              child: Container(
                height: 400.0,
                width: 400.0,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(200.0),
                    color:
                        Color(getColorHexFromStr('#FEE16D')).withOpacity(0.4)),
              ),
            ),
            Positioned(
              bottom: 300.0,
              left: 150.0,
              child: Container(
                  height: 300.0,
                  width: 300.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(150.0),
                      color: Color(getColorHexFromStr('#FEE16D'))
                          .withOpacity(0.5))),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 15.0),
                Row(
                  children: <Widget>[
                    SizedBox(width: 15.0),
                    Container(
                      alignment: Alignment.topLeft,
                      height: 75.0,
                      width: 75.0,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(37.5),
                          border: Border.all(
                              color: Colors.white,
                              style: BorderStyle.solid,
                              width: 3.0),
                          image: DecorationImage(
                              image: AssetImage('assets/images/chris.jpg'))),
                    ),
                    SizedBox(width: 10.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Jean',
                          style: TextStyle(
                              fontFamily: 'Quicksand',
                              fontSize: 25.0,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          '176****590',
                          style: TextStyle(
                              fontFamily: 'Quicksand',
                              fontSize: 15.0,
                              color: Colors.black.withOpacity(0.7)),
                        ),
                      ],
                    ),
                    SizedBox(width: MediaQuery.of(context).size.width - 225.0),
                    Container(
                      alignment: Alignment.topRight,
                      child: IconButton(
                        icon: Icon(Icons.settings),
                        onPressed: () {},
                        color: Colors.white,
                        iconSize: 30.0,
                      ),
                    ),
                    SizedBox(height: 15.0)
                  ],
                ),
                SizedBox(height: 10.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Container(
                      child: Column(
                        children: <Widget>[
                          IconButton(
                            icon: Icon(Icons.folder_shared),
                            color: Colors.white,
                            iconSize: 40.0,
                            onPressed: () {},
                          ),
                          Text(
                            'Favorites',
                            style: TextStyle(
                                fontFamily: 'Quicksand',
                                fontSize: 15.0,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: Column(
                        children: <Widget>[
                          IconButton(
                            icon: Icon(Icons.account_balance_wallet),
                            color: Colors.white,
                            iconSize: 40.0,
                            onPressed: () {},
                          ),
                          Text(
                            'Wallet',
                            style: TextStyle(
                                fontFamily: 'Quicksand',
                                fontSize: 15.0,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: Column(
                        children: <Widget>[
                          IconButton(
                            icon: Icon(Icons.print),
                            color: Colors.white,
                            iconSize: 40.0,
                            onPressed: () {},
                          ),
                          Text(
                            'Footprint',
                            style: TextStyle(
                                fontFamily: 'Quicksand',
                                fontSize: 15.0,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: Column(
                        children: <Widget>[
                          IconButton(
                            icon: Icon(Icons.computer),
                            color: Colors.white,
                            iconSize: 40.0,
                            onPressed: () {},
                          ),
                          Text(
                            'Coupon',
                            style: TextStyle(
                                fontFamily: 'Quicksand',
                                fontSize: 15.0,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(height: 25.0),
                Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        cardDetails(
                            'Pending payment', 'assets/images/card.png', '5'),
                        cardDetails(
                            'To be shipped', 'assets/images/box.png', '2'),
                      ],
                    ),
                    SizedBox(height: 10.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        cardDetails(
                            'To be received', 'assets/images/trucks.png', '8'),
                        cardDetails('Return / Replace',
                            'assets/images/returnbox.png', '0'),
                      ],
                    ),
                    SizedBox(height: 5.0)
                  ],
                ),
              ],
            )
          ]),
          SizedBox(height: 15.0),
          listItem('Gift card', Colors.red, Icons.account_box),
          listItem('Bank card', Color(getColorHexFromStr('#E89300')),
              Icons.credit_card),
          listItem('Replacement code', Color(getColorHexFromStr('#FB8662')),
              Icons.grid_on),
          listItem('Consulting collection', Colors.blue, Icons.pages),
          listItem('Customer service', Color(getColorHexFromStr('#ECB800')),
              Icons.person)
        ])
      ]),
    );
  }

  Widget listItem(String title, Color buttonColor, iconButton) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Row(
        children: <Widget>[
          Container(
            height: 50.0,
            width: 50.0,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25.0),
                color: buttonColor.withOpacity(0.3)),
            child: Icon(iconButton, color: buttonColor, size: 25.0),
          ),
          SizedBox(width: 25.0),
          Container(
            width: MediaQuery.of(context).size.width - 100.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  title,
                  style: TextStyle(
                      fontFamily: 'Quicksand',
                      fontSize: 15.0,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
                Icon(Icons.arrow_forward_ios, color: Colors.black, size: 20.0),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget cardDetails(String title, String imgPath, String valueCount) {
    return Material(
      elevation: 4.0,
      borderRadius: BorderRadius.circular(7.0),
      child: Container(
        height: 125.0,
        width: (MediaQuery.of(context).size.width / 2) - 20.0,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(7.0), color: Colors.white),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 10.0),
            Padding(
              padding: EdgeInsets.only(left: 15.0),
              child: Image.asset(
                imgPath,
                fit: BoxFit.cover,
                height: 50.0,
                width: 50.0,
              ),
            ),
            SizedBox(height: 2.0),
            Padding(
              padding: EdgeInsets.only(left: 15.0),
              child: Text(
                title,
                style: TextStyle(
                  fontFamily: 'Quicksand',
                  fontSize: 15.0,
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(height: 3.0),
            Padding(
              padding: EdgeInsets.only(left: 15.0),
              child: Text(
                valueCount,
                style: TextStyle(
                    fontFamily: 'Quicksand',
                    fontSize: 15.0,
                    color: Colors.red,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
