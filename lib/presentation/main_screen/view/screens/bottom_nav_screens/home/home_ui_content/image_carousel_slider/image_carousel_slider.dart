// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:carousel_slider/carousel_slider.dart' as slider;
// import '../../../../../../../../core/utils/constants/app_colors.dart';
//
// class ImageCarouselSlider extends StatefulWidget {
//   final List<String> adImages;
//   const ImageCarouselSlider({super.key, required this.adImages});
//
//   @override
//   ImageCarouselSliderState createState() => ImageCarouselSliderState();
// }
//
//   class ImageCarouselSliderState extends State<ImageCarouselSlider> {
//   int _current = 0;
//   final slider.CarouselController _controller = slider.CarouselController();
//
//   @override
//   Widget build(BuildContext context) {
//     List<Widget> imageWidget = widget.adImages
//         .map((image) => Container(
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(20.r),
//                 color: AppColors.primary,
//               ),
//               margin: EdgeInsets.symmetric(horizontal: 15.w),
//               child: ClipRRect(
//                 borderRadius: BorderRadius.circular(20.r),
//                 child: Image.asset(
//                   image,
//                   fit: BoxFit
//                       .fill,
//                   filterQuality: FilterQuality.high,
//                   width: double.infinity,
//                 ),
//               ),
//             ))
//         .toList();
//
//     return Padding(
//       /// ads images ui
//       padding: EdgeInsets.only(left: 5.w, right: 5.w, top: 14.h, bottom: 5.h),
//       child: Stack(
//         alignment: Alignment.bottomCenter,
//         children: [
//           CarouselSlider(
//             items: imageWidget,
//             carouselController: _controller,
//             options: CarouselOptions(
//               viewportFraction: 1,
//               height: 180.h,
//               autoPlay: true,
//               enlargeCenterPage: true,
//               onPageChanged: (index, reason) {
//                 setState(() {
//                   _current = index;
//                 });
//               },
//             ),
//           ),
//           Row(
//             /// the 3 navigating dots
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: widget.adImages.asMap().entries.map((image) {
//               return GestureDetector(
//                 onTap: () => _controller.animateToPage(image.key),
//                 child: gestureDetectorDesign(image),
//               );
//             }).toList(),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget gestureDetectorDesign(MapEntry<int, String> image) => Container(
//         width: 10.w,
//         height: 10.h,
//         margin: EdgeInsets.symmetric(vertical: 10.h, horizontal: 4.w),
//         decoration: BoxDecoration(
//           shape: BoxShape.circle,
//           color: _current == image.key ? AppColors.primary : Colors.white,
//         ),
//       );
// }
