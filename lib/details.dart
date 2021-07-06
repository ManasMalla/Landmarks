import 'package:flutter/material.dart';

class DetailsPage extends StatefulWidget {
  final String image;
  final String name;
  bool star;
  final int index;
  final Function(int) markFavourite;
  final Function(int) unmarkFavourite;
  final String description =
      "Suscipit inceptos est felis purus aenean aliquet adipiscing diam venenatis, augue nibh duis neque aliquam tellus condimentum sagittis vivamus, cras ante etiam sit conubia elit tempus accumsan libero, mattis per erat habitasse cubilia ligula penatibus curae. Sagittis lorem augue arcu blandit libero molestie non ullamcorper, finibus imperdiet iaculis ad quam per luctus neque, ligula curae mauris parturient diam auctor eleifend laoreet ridiculus, hendrerit adipiscing sociosqu pretium nec velit aliquam. Inceptos egestas maecenas imperdiet eget id donec nisl curae congue, massa tortor vivamus ridiculus integer porta ultrices venenatis aliquet, curabitur et posuere blandit magnis dictum auctor lacinia, eleifend dolor in ornare vulputate ipsum morbi felis. ";
  DetailsPage({
    Key? key,
    required this.name,
    required this.image,
    required this.star,
    required this.markFavourite,
    required this.unmarkFavourite,
    required this.index,
  }) : super(key: key);

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Flexible(
                child: Container(
                  width: double.infinity,
                  color: Colors.yellow.withOpacity(0.3),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 42, left: 16),
                        child: InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Icon(
                            Icons.chevron_left_rounded,
                            color: Colors.grey[400],
                            size: 36,
                          ),
                        ),
                      ),
                      Spacer(),
                    ],
                  ),
                ),
                flex: 4,
              ),
              Flexible(
                child: Container(),
                flex: 3,
              ),
              Flexible(
                child: Container(),
                flex: 3,
              ),
            ],
          ),
          Column(
            children: [
              Flexible(
                child: Container(),
                flex: 2,
              ),
              Flexible(
                flex: 2,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      width: 190,
                      height: 190,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.withOpacity(0.3),
                              blurRadius: 14,
                              spreadRadius: 4),
                        ],
                        borderRadius: BorderRadius.circular(90),
                      ),
                      child: ClipOval(
                        child: Container(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Container(
                      width: 180,
                      height: 180,
                      child: Hero(
                        tag: widget.image,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(90),
                          child: SizedBox(
                            child: Image(
                              image: AssetImage(
                                  "assets/images/${widget.image}.jpg"),
                              fit: BoxFit.fill,
                              width: 180,
                              height: 180,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Flexible(
                child: Container(),
                flex: 3,
              ),
            ],
          ),
          Column(
            children: [
              Flexible(
                child: Container(),
                flex: 2,
              ),
              Flexible(
                child: Container(),
                flex: 2,
              ),
              Flexible(
                child: Container(
                  alignment: Alignment.bottomLeft,
                  padding: EdgeInsets.only(left: 8, bottom: 4),
                  margin: EdgeInsets.only(top: 8, left: 8, right: 16),
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            widget.name,
                            style: TextStyle(
                                fontFamily: "Quicksand",
                                fontSize: 36,
                                fontWeight: FontWeight.w500,
                                color: Colors.black),
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                if (widget.star == true) {
                                  widget.unmarkFavourite(widget.index);
                                  widget.star = false;
                                } else {
                                  widget.markFavourite(widget.index);
                                  widget.star = true;
                                }
                              });
                            },
                            child: Icon(
                              widget.star == true
                                  ? Icons.favorite_rounded
                                  : Icons.favorite_outline_rounded,
                              size: 24,
                              color: widget.star == true
                                  ? Color(0xFFff7061)
                                  : Colors.grey,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 4,
                          ),
                          Text(
                            "Joshua Tree National Park",
                            style: TextStyle(
                                fontFamily: "Quicksand",
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: Colors.grey),
                          ),
                          Spacer(),
                          Text(
                            "California",
                            style: TextStyle(
                                fontFamily: "Quicksand",
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: Colors.grey),
                          ),
                        ],
                      ),
                      Divider(),
                      SingleChildScrollView(
                          child: Flexible(
                              child: Text(
                        widget.description,
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                            fontFamily: "Quicksand",
                            fontSize: 16,
                            color: Colors.grey),
                      ))),
                    ],
                  ),
                ),
                flex: 4,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
