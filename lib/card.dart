import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:landmarks/details.dart';

class CardView extends StatefulWidget {
  final String name;
  final String image;
  final bool star;
  final int index;
  final Function(int) markFavourite;
  final Function(int) unmarkFavourite;
  const CardView({
    Key? key,
    required this.name,
    required this.image,
    required this.star,
    required this.index,
    required this.markFavourite,
    required this.unmarkFavourite,
  }) : super(key: key);

  @override
  State<CardView> createState() => _CardViewState();
}

class _CardViewState extends State<CardView> {
  @override
  Widget build(BuildContext context) {
    print("${widget.name} is ${widget.star}");
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailsPage(
              name: widget.name,
              image: widget.image,
              star: widget.star,
              markFavourite: widget.markFavourite,
              unmarkFavourite: widget.unmarkFavourite,
              index: widget.index,
            ),
          ),
        );
      },
      child: Container(
        padding: EdgeInsets.all(12),
        child: Hero(
          tag: widget.image,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(14),
            child: Stack(
              children: [
                Image(
                  image: AssetImage("assets/images/${widget.image}.jpg"),
                  fit: BoxFit.fitWidth,
                  width: double.infinity,
                ),
                Container(
                  alignment: Alignment.bottomLeft,
                  padding: EdgeInsets.only(left: 8, bottom: 4),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        widget.name,
                        style: GoogleFonts.quicksand(
                            fontSize: 36,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Icon(
                        widget.star == true
                            ? Icons.favorite_rounded
                            : Icons.favorite_outline_rounded,
                        size: 24,
                        color: widget.star == true
                            ? Color(0xFFff7061)
                            : Colors.white,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
