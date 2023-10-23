import 'package:flutter/material.dart';
import 'package:flutter_heatmap_calendar/flutter_heatmap_calendar.dart';

class Activity extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
          child: Text('最近一年您一共记录了253次'),
        ),
        HeatMap(
          datasets: {
            DateTime(2023, 10, 6): 3,
            DateTime(2023, 10, 7): 7,
            DateTime(2023, 10, 8): 10,
            DateTime(2023, 10, 9): 13,
            DateTime(2023, 10, 13): 6,
          },
          size: 15,
          fontSize: 10,
          colorMode: ColorMode.opacity,
          showText: false,
          scrollable: true,
          colorsets: {
            1: Colors.red,
            3: Colors.orange,
            5: Colors.yellow,
            7: Colors.green,
            9: Colors.blue,
            11: Colors.indigo,
            13: Colors.purple,
          },
          onClick: (value) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(value.toString())));
          },
        )
      ],
    );
  }
}
