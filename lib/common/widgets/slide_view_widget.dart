import 'dart:async';
import 'package:comic_reading/common/extension/custom_theme_extension.dart';
import 'package:comic_reading/screens/chi_tiet/chi_tiet_page.dart';
import 'package:comic_reading/screens/trang_chu/model/truyen.dart';
import 'package:flutter/material.dart';

class SlideViewWiget extends StatefulWidget {
  const SlideViewWiget({super.key, required this.data});

  final List<Results> data;
  @override
  State<SlideViewWiget> createState() => _SlideViewWigetState();
}

class _SlideViewWigetState extends State<SlideViewWiget> {
  int pageNo = 0;
  late final Timer carasouelTimer;

  late final PageController pageController;
  Timer getTimer() {
    return Timer.periodic(const Duration(seconds: 2), (timer) {
      if (pageNo == widget.data.length) {
        pageNo = 0;
      }
      pageController.animateToPage(
        pageNo,
        duration: const Duration(seconds: 1),
        curve: Curves.easeInOutCirc,
      );
      pageNo++;
    });
  }

  @override
  void initState() {
    pageController = PageController(initialPage: 0, viewportFraction: 0.75);
    carasouelTimer = getTimer();
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    final myColors = Theme.of(context).extension<CustomThemeExtension>()!;
    return Stack(
      children: [
        SizedBox(
          height: 190,
          child: PageView.builder(
            controller: pageController,
            itemCount: widget.data.length,
            onPageChanged: (index) {
              pageNo = index;
              setState(() {});
            },
            itemBuilder: (_, index) {
              return AnimatedBuilder(
                animation: pageController,
                builder: (cxt, child) {
                  return child!;
                },
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ChiTietPage(
                            id: int.parse(widget.data[index].id.toString())),
                      ),
                    );
                  },
                  child: Container(
                    margin:
                        EdgeInsets.only(right: 5, left: 5, top: 10, bottom: 10),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(3),
                    ),
                    alignment: Alignment.topLeft,
                    child: Row(
                      children: [
                        Image.network(
                          widget.data[index].imagelink.toString(),
                          fit: BoxFit.cover,
                          width: 100,
                          height: 180,
                        ),
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.all(10),
                            color: Colors.black.withOpacity(0.5),
                            child: Column(
                              children: [
                                Container(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    widget.data[index].tentruyen
                                        .toString()
                                        .toUpperCase(),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                Container(
                                  alignment: Alignment.topLeft,
                                  margin: EdgeInsets.symmetric(vertical: 4),
                                  child: Text(
                                    'Lượt xem: ${widget.data[index].tongluotxem}',
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      widget.data[index].mota!,
                                      maxLines: 4,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        Positioned(
          bottom: 20,
          child: SizedBox(
            width: screenWidth,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                widget.data.length,
                (index) => Container(
                  margin: EdgeInsets.all(1),
                  child: Icon(
                    Icons.circle,
                    size: pageNo == index ? 7 : 5,
                    color: pageNo == index ? Colors.blue : Colors.grey,
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
