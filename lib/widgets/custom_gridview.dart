import 'package:flutter/material.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';

class CustomGridView extends StatefulWidget {
  final Function? onTap;
  final List<Widget> listWidget;
  final int crossAxisCount;
  final double crossAxisSpacing;
  final double mainAxisSpacing;
  final Axis scrollDirection;
  final EdgeInsets padding;
  final Color backgroundColor;

  const CustomGridView(
      {Key? key,
      this.onTap,
      this.listWidget = const [],
      this.crossAxisCount = 2,
      this.crossAxisSpacing = 10,
      this.mainAxisSpacing = 10,
      this.scrollDirection = Axis.vertical,
      required this.padding,

      this.backgroundColor = const Color.fromRGBO(0, 0, 0, 0)})
      : super(key: key);

  @override
  State<CustomGridView> createState() => _CustomGridViewState();
}

class _CustomGridViewState extends State<CustomGridView> {
  List<TrackSize> listTrackSize() {
    int count = widget.listWidget.length ~/ widget.crossAxisCount;
    int remainder = widget.listWidget.length % widget.crossAxisCount;
    if (remainder > 0) count = count + 1;
    List<TrackSize> list = List.generate(count, (index) => auto);
    if(list.isEmpty) list=[auto];
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: widget.backgroundColor,
      padding: widget.padding,
      child: LayoutGrid(
        columnSizes:
            widget.crossAxisCount == 1 ?  [1.fr ]:widget.crossAxisCount == 2 ?   [1.fr, 1.fr ]: [1.fr, 1.fr , 1.fr ],
        rowSizes: listTrackSize() ,
        rowGap: 10,
        columnGap: 10,
        children: [
          ...[
            for (var i = 0; i < widget.listWidget.length; i++)
              InkWell(onTap: () {
                widget.onTap!(
                  i,
                );
              }, child: widget.listWidget[i]),
          ]
        ],
      ),
    );

  }
}
