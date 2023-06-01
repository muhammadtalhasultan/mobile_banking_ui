import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:wallet_app/components/c_elevated_button.dart';
import 'package:wallet_app/utils/constants.dart';

import '../../../utils/routes.dart';

class RegisterFingerprintUnlockPage extends StatefulWidget {
  const RegisterFingerprintUnlockPage({super.key});

  @override
  State<RegisterFingerprintUnlockPage> createState() =>
      _RegisterFingerprintUnlockPageState();
}

class _RegisterFingerprintUnlockPageState
    extends State<RegisterFingerprintUnlockPage> {
  bool success = false;
  bool failed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldColor,
      body: ListView(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        padding: REdgeInsets.symmetric(horizontal: 24.w, vertical: 40.h),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Icon(
                  Icons.arrow_back_ios,
                  size: 20.r,
                  color: primaryColor,
                ),
              ),
              Text(
                'Step 3 of 4',
                style: smallTextStyle,
              )
            ],
          ),
          SizedBox(
            height: 136.h,
          ),
          Column(
            children: [
              Text(
                'Biometric Security',
                style: largeTextStyle,
              ),
              SizedBox(
                height: 8.h,
              ),
              Text(
                'For more advanced security, register your fingerprint and\nface unlock',
                style: xSmallTextStyle,
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 47.h,
              ),
              success
                  ? SvgPicture.asset(
                      'assets/svg/fingerprint_unlock_success.svg')
                  : failed
                      ? SvgPicture.asset(
                          'assets/svg/fingerprint_unlock_failed.svg')
                      : CircularPercentIndicator(
                          radius: 90.r,
                          lineWidth: 4.w,
                          percent: 0.5,
                          reverse: true,
                          backgroundColor: const Color(0xFFFFF9EF),
                          center: SvgPicture.asset(
                              'assets/svg/fingerprint_icon.svg'),
                          progressColor: const Color(0xFFFCC97C),
                        ),
              SizedBox(
                height: 40.h,
              ),
              success
                  ? Text(
                      'Registration is successful, you can proceed\nto the next step',
                      style: xSmallTextStyle,
                      textAlign: TextAlign.center,
                    )
                  : failed
                      ? Text(
                          'Registration failed, try again or try to clean\nyour finger',
                          style: xSmallTextStyle,
                          textAlign: TextAlign.center,
                        )
                      : Text(
                          'Put your finger on the sensor and register\nyour fingerprint data',
                          style: xSmallTextStyle,
                          textAlign: TextAlign.center,
                        ),
              SizedBox(
                height: 143.h,
              ),
              SizedBox(
                width: double.infinity,
                child: CElevatedButton(
                    child:
                        failed ? const Text('Retry') : const Text('Continue'),
                    onPressed: () {
                      Navigator.of(context).pushNamed(
                        RouteGenerator.registerFaceUnlockPage,
                      );
                    }),
              )
            ],
          )
        ],
      ),
    );
  }
}


// // Copyright 2013 The Flutter Authors. All rights reserved.
// // Use of this source code is governed by a BSD-style license that can be
// // found in the LICENSE file.

// // ignore_for_file: public_member_api_docs, avoid_print

// import 'dart:async';

// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:local_auth/local_auth.dart';



// class RegisterFingerprintUnlockPage extends StatefulWidget {
//   const RegisterFingerprintUnlockPage({Key? key}) : super(key: key);

//   @override
//   State<RegisterFingerprintUnlockPage> createState() => _RegisterFingerprintUnlockPageState();
// }

// class _RegisterFingerprintUnlockPageState extends State<RegisterFingerprintUnlockPage> {
//   final LocalAuthentication auth = LocalAuthentication();
//   _SupportState _supportState = _SupportState.unknown;
//   bool? _canCheckBiometrics;
//   List<BiometricType>? _availableBiometrics;
//   String _authorized = 'Not Authorized';
//   bool _isAuthenticating = false;

//   @override
//   void initState() {
//     super.initState();
//     auth.isDeviceSupported().then(
//           (bool isSupported) => setState(() => _supportState = isSupported
//               ? _SupportState.supported
//               : _SupportState.unsupported),
//         );
//   }

//   Future<void> _checkBiometrics() async {
//     late bool canCheckBiometrics;
//     try {
//       canCheckBiometrics = await auth.canCheckBiometrics;
//     } on PlatformException catch (e) {
//       canCheckBiometrics = false;
//       print(e);
//     }
//     if (!mounted) {
//       return;
//     }

//     setState(() {
//       _canCheckBiometrics = canCheckBiometrics;
//     });
//   }

//   Future<void> _getAvailableBiometrics() async {
//     late List<BiometricType> availableBiometrics;
//     try {
//       availableBiometrics = await auth.getAvailableBiometrics();
//     } on PlatformException catch (e) {
//       availableBiometrics = <BiometricType>[];
//       print(e);
//     }
//     if (!mounted) {
//       return;
//     }

//     setState(() {
//       _availableBiometrics = availableBiometrics;
//     });
//   }

//   Future<void> _authenticate() async {
//     bool authenticated = false;
//     try {
//       setState(() {
//         _isAuthenticating = true;
//         _authorized = 'Authenticating';
//       });
//       authenticated = await auth.authenticate(
//         localizedReason: 'Let OS determine authentication method',
//         options: const AuthenticationOptions(
//           stickyAuth: true,
//         ),
//       );
//       setState(() {
//         _isAuthenticating = false;
//       });
//     } on PlatformException catch (e) {
//       print(e);
//       setState(() {
//         _isAuthenticating = false;
//         _authorized = 'Error - ${e.message}';
//       });
//       return;
//     }
//     if (!mounted) {
//       return;
//     }

//     setState(
//         () => _authorized = authenticated ? 'Authorized' : 'Not Authorized');
//   }

//   Future<void> _authenticateWithBiometrics() async {
//     bool authenticated = false;
//     try {
//       setState(() {
//         _isAuthenticating = true;
//         _authorized = 'Authenticating';
//       });
//       authenticated = await auth.authenticate(
//         localizedReason:
//             'Scan your fingerprint (or face or whatever) to authenticate',
//         options: const AuthenticationOptions(
//           stickyAuth: true,
//           biometricOnly: true,
//         ),
//       );
//       setState(() {
//         _isAuthenticating = false;
//         _authorized = 'Authenticating';
//       });
//     } on PlatformException catch (e) {
//       print(e);
//       setState(() {
//         _isAuthenticating = false;
//         _authorized = 'Error - ${e.message}';
//       });
//       return;
//     }
//     if (!mounted) {
//       return;
//     }

//     final String message = authenticated ? 'Authorized' : 'Not Authorized';
//     setState(() {
//       _authorized = message;
//     });
//   }

//   Future<void> _cancelAuthentication() async {
//     await auth.stopAuthentication();
//     setState(() => _isAuthenticating = false);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text('Plugin example app'),
//         ),
//         body: ListView(
//           padding: const EdgeInsets.only(top: 30),
//           children: <Widget>[
//             Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: <Widget>[
//                 if (_supportState == _SupportState.unknown)
//                   const CircularProgressIndicator()
//                 else if (_supportState == _SupportState.supported)
//                   const Text('This device is supported')
//                 else
//                   const Text('This device is not supported'),
//                 const Divider(height: 100),
//                 Text('Can check biometrics: $_canCheckBiometrics\n'),
//                 ElevatedButton(
//                   onPressed: _checkBiometrics,
//                   child: const Text('Check biometrics'),
//                 ),
//                 const Divider(height: 100),
//                 Text('Available biometrics: $_availableBiometrics\n'),
//                 ElevatedButton(
//                   onPressed: _getAvailableBiometrics,
//                   child: const Text('Get available biometrics'),
//                 ),
//                 const Divider(height: 100),
//                 Text('Current State: $_authorized\n'),
//                 if (_isAuthenticating)
//                   ElevatedButton(
//                     onPressed: _cancelAuthentication,
//                     // TODO(goderbauer): Make this const when this package requires Flutter 3.8 or later.
//                     // ignore: prefer_const_constructors
//                     child: Row(
//                       mainAxisSize: MainAxisSize.min,
//                       children: const <Widget>[
//                         Text('Cancel Authentication'),
//                         Icon(Icons.cancel),
//                       ],
//                     ),
//                   )
//                 else
//                   Column(
//                     children: <Widget>[
//                       ElevatedButton(
//                         onPressed: _authenticate,
//                         // TODO(goderbauer): Make this const when this package requires Flutter 3.8 or later.
//                         // ignore: prefer_const_constructors
//                         child: Row(
//                           mainAxisSize: MainAxisSize.min,
//                           children: const <Widget>[
//                             Text('Authenticate'),
//                             Icon(Icons.perm_device_information),
//                           ],
//                         ),
//                       ),
//                       ElevatedButton(
//                         onPressed: _authenticateWithBiometrics,
//                         child: Row(
//                           mainAxisSize: MainAxisSize.min,
//                           children: <Widget>[
//                             Text(_isAuthenticating
//                                 ? 'Cancel'
//                                 : 'Authenticate: biometrics only'),
//                             const Icon(Icons.fingerprint),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// enum _SupportState {
//   unknown,
//   supported,
//   unsupported,
// }