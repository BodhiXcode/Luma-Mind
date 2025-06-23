import 'package:flutter/material.dart';
import 'package:luma_mind/enums/widget_enums.dart';

class StackWiget extends StatefulWidget {
  final List<Widget> widgets;
  const StackWiget({super.key, required this.widgets});

  @override
  State<StackWiget> createState() => _StackWigetState();
}

class _StackWigetState extends State<StackWiget> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: WidgetDimesion.normalHeight,
            width: 380,
            child: PageView.builder(
              onPageChanged: (value) {
                setState(() {
                  currentIndex = value;
                });
              },
              scrollDirection: Axis.vertical,
              itemCount: widget.widgets.length,
              itemBuilder: (context, index) {
                return widget.widgets[index];
              },
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              widget.widgets.length,
              (index) => Container(
                margin: const EdgeInsets.symmetric(vertical: 4),
                width: 5,
                height: 5,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: currentIndex == index ? Colors.white : Colors.grey,
                  border: Border.all(color: Colors.grey, width: 1),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
