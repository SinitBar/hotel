import 'package:flutter/material.dart';
import 'section_card_widget.dart';
import 'package:page_view_dot_indicator/page_view_dot_indicator.dart';

class PictureCarousel extends StatefulWidget {
  const PictureCarousel({
    super.key,
    required this.imagesURLs,
  });

  final List<String> imagesURLs;

  @override
  State<PictureCarousel> createState() => _PictureCarouselState();
}

class _PictureCarouselState extends State<PictureCarousel>
    with SingleTickerProviderStateMixin {
  late final PageController _pageController;
  int currentPageIndex = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _pageController = PageController();
    _pageController.addListener(() {
      setState(() {
        currentPageIndex = 0;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      onPageChanged: (index) {
        setState(() {
          currentPageIndex = index;
          print('page: $currentPageIndex');
        });
      },
      controller: _pageController,
      itemBuilder: (context, index) {
        return SectionCardWidget(
          //width: 343,
          //height: 257,
          backgroundImageURL: widget.imagesURLs[index %
              ((widget.imagesURLs.isNotEmpty) ? widget.imagesURLs.length : 1)],
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(flex: 2, child: Container()),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    //margin: EdgeInsets.all(4.0),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4.0),
                      child: PageViewDotIndicator(
                        size: const Size(7, 7),
                        unselectedSize: const Size(7, 7),
                        fadeEdges: false,
                        currentItem: currentPageIndex,
                        count: widget.imagesURLs.length,
                        unselectedColor: const Color(0xFFD9D9D9),
                        selectedColor: Colors.black,
                        duration: const Duration(milliseconds: 200),
                        boxShape: BoxShape.circle,
                        onItemClicked: (index) {
                          _pageController.animateToPage(
                            index,
                            duration: const Duration(milliseconds: 200),
                            curve: Curves.easeInOut,
                          );
                        },
                      ),
                    ),
                  ),
                ),
                Expanded(flex: 2, child: Container()),
              ],
            ),
          ),
        );
      },
    );
  }
}
