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

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _pageController = PageController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: _pageController,
      itemBuilder: (context, index) {
        return SectionCardWidget(
          backgroundImageURL: widget.imagesURLs[index %
              ((widget.imagesURLs.isNotEmpty) ? widget.imagesURLs.length : 1)],
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(flex: 2, child: Container()),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4.0),
                      child: PageViewDotIndicator(
                        size: const Size(7, 7),
                        unselectedSize: const Size(7, 7),
                        fadeEdges: false,
                        currentItem: index %
                            ((widget.imagesURLs.isNotEmpty)
                                ? widget.imagesURLs.length
                                : 1),
                        count: widget.imagesURLs.length,
                        unselectedColor: const Color(0xFFD9D9D9),
                        selectedColor: Colors.black,
                        duration: const Duration(milliseconds: 500),
                        boxShape: BoxShape.circle,
                        onItemClicked: (index) {
                          _pageController.animateToPage(
                            index,
                            duration: const Duration(milliseconds: 500),
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
