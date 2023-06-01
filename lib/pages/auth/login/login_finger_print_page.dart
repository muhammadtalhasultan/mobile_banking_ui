import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../../../utils/constants.dart';

class LoginFingerprintPage extends StatefulWidget {
  const LoginFingerprintPage({super.key});

  @override
  State<LoginFingerprintPage> createState() => _LoginFingerprintPageState();
}

class _LoginFingerprintPageState extends State<LoginFingerprintPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RPadding(
          padding: REdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Unlock with fingerprnt',
                style: largeTextStyle,
              ),
              SizedBox(
                height: 50.h,
              ),
              CircularPercentIndicator(
                radius: 90.r,
                lineWidth: 4.w,
                percent: 0.5,
                reverse: true,
                backgroundColor: const Color(0xFFFFF9EF),
                center: SvgPicture.asset('assets/svg/fingerprint_icon.svg'),
                progressColor: const Color(0xFFFCC97C),
              ),
              SizedBox(
                height: 30.h,
              ),
              Text(
                'Put your finger on the sensor and register\nyour fingerprint data',
                style: xSmallTextStyle,
                textAlign: TextAlign.center,
              )
            ],
          ),
        ),
      ),
    );
  }
}
// import 'dart:io';

// import 'package:face_camera/face_camera.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:loading_indicator/loading_indicator.dart';

// import '../../../utils/constants.dart';

// const List<Color> _kDefaultRainbowColors = const [
//   Colors.red,
//   Colors.orange,
//   Colors.yellow,
//   Colors.green,
//   Colors.blue,
//   Colors.indigo,
//   Colors.purple,
// ];


// // class FingerPrintPage extends StatelessWidget {
// //   _showSingleAnimationDialog(
// //       BuildContext context, Indicator indicator, bool showPathBackground) {
// //     Navigator.push(
// //       context,
// //       MaterialPageRoute(
// //         fullscreenDialog: false,
// //         builder: (ctx) {
// //           return Scaffold(
// //             appBar: AppBar(
// //               title: Text(indicator.toString().split('.').last),
// //             ),
// //             body: Padding(
// //               padding: const EdgeInsets.all(64),
// //               child: Center(
// //                 child: LoadingIndicator(
// //                   indicatorType: indicator,
// //                   colors: _kDefaultRainbowColors,
// //                   strokeWidth: 4.0,
// //                   pathBackgroundColor:
// //                       showPathBackground ? Colors.black45 : null,
// //                 ),
// //               ),
// //             ),
// //           );
// //         },
// //       ),
// //     );
// //   }

// //   @override
// //   Widget build(BuildContext context) => Scaffold(
// //         appBar: AppBar(
// //           title: Text('Demo'),
// //         ),
// //         floatingActionButton: FloatingActionButton(
// //             child: Icon(Icons.grid_on),
// //             onPressed: () {
// //               Navigator.of(context).push(
// //                 MaterialPageRoute(
// //                   builder: (_) => FingerPrintPage(),
// //                 ),
// //               );
// //             }),
// //         body: ListView.builder(
// //           itemBuilder: (ctx, index) {
// //             return InkWell(
// //               onTap: () => _showSingleAnimationDialog(
// //                 ctx,
// //                 Indicator.values[index],
// //                 false,
// //               ),
// //               onLongPress: () => _showSingleAnimationDialog(
// //                 ctx,
// //                 Indicator.values[index],
// //                 true,
// //               ),
// //               child: Padding(
// //                 padding: const EdgeInsets.only(left: 16, top: 16, bottom: 16),
// //                 child: Text(
// //                   Indicator.values[index].toString().split('.').last,
// //                   style: TextStyle(
// //                     fontSize: 24,
// //                   ),
// //                 ),
// //               ),
// //             );
// //           },
// //           itemCount: Indicator.values.length,
// //         ),
// //       );
// // }

// class FingerPrintPage extends StatefulWidget {
//   @override
//   State<FingerPrintPage> createState() => _FingerPrintPageState();
// }

// class _FingerPrintPageState extends State<FingerPrintPage> {
//   bool pause = false;
//   File? _capturedImage;


//   Widget build(BuildContext context) {
//     return Scaffold(
//        backgroundColor: scaffoldColor,
//       appBar: AppBar(
//         elevation: 0,
//         centerTitle: true,
//         backgroundColor: scaffoldColor,
//         leadingWidth: 100.w,
//         title: Text('Fingerprint',
//         style: mediumTextStyle,
//         ),
//         leading: IconButton(
//           onPressed: (){
//               Navigator.of(context).pop();
//           },
//           icon: Icon(Icons.arrow_back_ios,
//           color: primaryColor,
//           size: 20.r,
//           ),
//         ),
//       ),
//       body:  SingleChildScrollView(
//         child: RPadding(
//                       padding: REdgeInsets.symmetric(horizontal: 59.w, vertical: 24.h),
//                       child: Center(
//                         child: Column(
//                           children: [
//                             SizedBox(
//                               height: 200.h,
//                             ),
//                              Text('Unlock with fingerprnt',
//                   style: largeTextStyle,
//                   ),
//                   SizedBox(
//                     height: 52.h,
//                   ),
//                              Builder(builder: (context) {
//               if (_capturedImage != null) {
//                 return Center(
//                   child: Stack(
//                     alignment: Alignment.bottomCenter,
//                     children: [
//                       Image.file(
//                         _capturedImage!,
//                         width: double.maxFinite,
//                         fit: BoxFit.fitWidth,
//                       ),
//                       ElevatedButton(
//                           onPressed: () => setState(() => _capturedImage = null),
//                           child: const Text(
//                             'Capture Again',
//                             textAlign: TextAlign.center,
//                             style: TextStyle(
//                                 fontSize: 14, fontWeight: FontWeight.w700),
//                           ))
//                     ],
//                   ),
//                 );
//               }
//               return 
//               SmartFaceCamera(
//                   autoCapture: true,
//                   defaultCameraLens: CameraLens.front,
//                   onCapture: (File? image) {
//                     setState(() => _capturedImage = image);
//                   },
//                   onFaceDetected: (Face? face) {
                    
//                     //Do something
//                   },
//                   messageBuilder: (context, face) {
//                     if (face == null) {
//                       return _message('Place your face in the camera');
//                     }
//                     if (!face.wellPositioned) {
//                       return _message('Center your face in the square');
//                     }
//                     return const SizedBox.shrink();
//                   });
//             }),
//                             SizedBox(
//                     height: 29.h,
//                   ),
//                              Text('Put your finger on the sensor and register your fingerprint data',
//                   style: xSmallTextStyle,
//                   textAlign: TextAlign.center,
//                   ),
//                           ],
//                         ),
//                       ),
//                     ),
//       )
    
    
//      );
//   }
//    Widget _message(String msg) => Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 55, vertical: 15),
//         child: Text(msg,
//             textAlign: TextAlign.center,
//             style: const TextStyle(
//                 fontSize: 14, height: 1.5, fontWeight: FontWeight.w400)),
//       );
// }