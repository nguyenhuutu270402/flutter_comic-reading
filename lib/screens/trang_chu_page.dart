import 'package:flutter/material.dart';

class TrangChuPage extends StatelessWidget {
  TrangChuPage({Key? key}) : super(key: key);
  final List<int> numbers = [1, 2, 3, 4, 5, 6, 7, 8];
  final List<Color> colors = [
    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.yellow,
    Colors.purple,
    Colors.orange,
    Colors.grey,
    Colors.pink,
  ];
  @override
  Widget build(BuildContext context) {
    int crossAxisCount = 2;
    double hieghtBox = 200;

    double screenWidth = MediaQuery.of(context).size.width;
    if (screenWidth > 600) {
      crossAxisCount = 4;
      hieghtBox = 300;
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('shhhhh'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // các widget khác
            Container(
              height: 50,
              color: Colors.amber,
            ),
            SizedBox(
              height: hieghtBox,
              child: PageView(
                children: numbers
                    .map((number) => Container(
                          child: Center(child: Text('Item: $number')),
                        ))
                    .toList(),
              ),
            ),
            // GridView
            GridView.builder(
              shrinkWrap: true,
              itemCount: colors.length,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: crossAxisCount,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: 0.5,
              ),
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  height: 400,
                  color: colors[index],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
