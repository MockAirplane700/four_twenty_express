import 'package:flutter/material.dart';
import 'package:four_twenty_express/constants/variables.dart';

class SearchDelegateTile extends StatefulWidget {
  final Widget leading;
  final String title;
  final String subtitle;
  final Widget trailing;
  final Function() onPressed;

  const SearchDelegateTile({
    Key? key, required this.leading, required this.title,
    required this.subtitle, required this.trailing,
    required this.onPressed
  }) : super(key: key);

  @override
  State<SearchDelegateTile> createState() => _SearchDelegateTileState();
}

class _SearchDelegateTileState extends State<SearchDelegateTile> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return GestureDetector(
      onTap:widget.onPressed,
      child: SizedBox(
          height: height/7,
          child: Row(
            children: [
              // Image
              Expanded(
                flex: 1,
                child: widget.leading,
              ),
              // content
              Expanded(
                  flex: 2,
                  child: Padding(
                    padding: EdgeInsets.all(height/80),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // title
                        Row(
                          children: [
                            Text(widget.title, style: titleTextStyle,),
                          ],
                        ),
                        // subtitle
                        Row(
                          children: [
                            Text(widget.subtitle, style: subtitleTextStyle,),
                          ],
                        )
                      ],
                    ),
                  ))

            ],
          )
      ),
    );
  }
}