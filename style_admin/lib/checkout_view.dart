import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CheckoutView extends StatelessWidget {
  final String name;
  final String street;
  final String home;
  final int price;

  final Function onInfo;

  const CheckoutView(
      {Key key, this.name, this.price, this.home, this.street, this.onInfo})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var formatter = NumberFormat('#,###');

    return Padding(
      padding: EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
      child: InkWell(
        onTap: onInfo,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(24),
                    topRight: Radius.circular(24)),
              ),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Тапсырыс берген: ',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.indigo,
                          fontFamily: 'Montserrat',
                        ),
                      ),
                      Text(
                        name,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.pink,
                          fontFamily: 'Montserrat',
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            ProductDivider(),
            Container(
              padding: EdgeInsets.only(left: 16, right: 16, bottom: 12),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(24),
                      bottomRight: Radius.circular(24))),
              child: Row(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        color: Colors.amber.shade50,
                        borderRadius: BorderRadius.circular(20)),
                    child: Icon(Icons.task_alt, color: Color(0xffFFDB53)),
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  Row(
                    children: [
                      Text(
                        street + ', ',
                        style: TextStyle(
                          color: Color(0xff333333),
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Montserrat',
                        ),
                      ),
                      SizedBox(width: 10),
                      Text(
                        'Дом' + home,
                        style: TextStyle(
                          color: Color(0xff333333),
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Montserrat',
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: Text(
                      '${formatter.format(price.toInt()) + ' \u20b8'}'
                          .replaceAll(',', ' '),
                      textAlign: TextAlign.end,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontFamily: 'Montserrat',
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProductDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Row(
        children: <Widget>[
          SizedBox(
            height: 20,
            width: 10,
            child: DecoratedBox(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(10),
                      bottomRight: Radius.circular(10)),
                  color: Colors.grey.shade200),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: LayoutBuilder(
                builder: (context, constraints) {
                  return Flex(
                    children: List.generate(
                        (constraints.constrainWidth() / 10).floor(),
                        (index) => SizedBox(
                              height: 1,
                              width: 5,
                              child: DecoratedBox(
                                decoration:
                                    BoxDecoration(color: Color(0xffC0CCDA)),
                              ),
                            )),
                    direction: Axis.horizontal,
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  );
                },
              ),
            ),
          ),
          SizedBox(
            height: 20,
            width: 10,
            child: DecoratedBox(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      bottomLeft: Radius.circular(10)),
                  color: Colors.grey.shade200),
            ),
          ),
        ],
      ),
    );
  }
}
