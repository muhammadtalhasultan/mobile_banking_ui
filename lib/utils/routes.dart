import 'package:flutter/material.dart';
import 'package:wallet_app/pages/auth/login/login_face_unlock_page.dart';
import 'package:wallet_app/pages/auth/login/pin_code_page.dart';
import 'package:wallet_app/pages/auth/register/register_fingerprint_unlock_page.dart';
import 'package:wallet_app/pages/auth/register/register_page.dart';
import 'package:wallet_app/pages/card/add_card_page.dart';
import 'package:wallet_app/pages/dashboard/add_new_account/add_new_account_page.dart';
import 'package:wallet_app/pages/dashboard/saving/add_saving_page.dart';
import 'package:wallet_app/pages/dashboard/saving/saving_page.dart';
import 'package:wallet_app/pages/dashboard/transfer/transfer_bank_page.dart';
import 'package:wallet_app/pages/dashboard/transfer/transfer_page.dart';
import 'package:wallet_app/pages/dashboard/transfer/transfer_successful_page.dart';
import 'package:wallet_app/pages/dashboard/transfer/transfer_to_friends_page.dart';
import 'package:wallet_app/pages/dashboard/withdraw/withdraw_code_page.dart';
import 'package:wallet_app/pages/dashboard/withdraw/withdraw_page.dart';
import 'package:wallet_app/pages/onboard/onbording_page.dart';
import 'package:wallet_app/pages/profile/security_page.dart';
import 'package:wallet_app/pages/scan/scan_page.dart';
import 'package:wallet_app/pages/splash/splash_page.dart';

import '../pages/auth/login/login_finger_print_page.dart';
import '../pages/auth/login/login_page.dart';
import '../pages/auth/register/capture_identity_card_page.dart';
import '../pages/auth/register/register_face_unlock_page.dart';
import '../pages/auth/register/register_success_page.dart';
import '../pages/dashboard/notification/notification_page.dart';
import '../pages/dashboard/payment/payment_page.dart';
import '../pages/navigation/navigation_page.dart';
import '../pages/profile/manage_notification_page.dart';

class RouteGenerator {
  static const String splashPage = 'splashPage';
  static const String onboardingPage = 'onboardingPage';
  static const String loginPage = 'loginPage';
  static const String pinCodePage = 'pinCodePage';
  static const String loginFingerprintPage = 'loginFingerprintPage';
  static const String registerPage = 'registerPage';
  static const String navigationPage = 'navigationPage';
  static const String notificationPage = 'notificationPage';
  static const String transferPage = 'transferPage';
  static const String transferToFriendsPage = 'transferToFriendsPage';
  static const String transferSuccessfulPage = 'transferSuccessfulPage';
  static const String transferBankPage = 'transferBankPage';
  static const String withdrawPage = 'withdrawPage';
  static const String withdrawCodePage = 'withdrawCodePage';
  static const String paymentPage = 'paymentPage';
  static const String addNewAccountPage = 'addNewAccountPage';
  static const String savingPage = 'savingPage';
  static const String addSavingPage = 'addSavingPage';
  static const String addCardPage = 'addCardPage';
  static const String manageNotificationPage = 'manageNotificationPage';
  static const String securityPage = 'securityPage';
  static const String scanPage = 'scanPage';
  static const String captureIdentityCardPage = 'captureIdentityCardPage';
  static const String registerFingerprintUnlockPage =
      'registerFingerprintUnlockPage';
  static const String loginFaceUnlockPage = 'loginFaceUnlockPage';
  static const String registerFaceUnlockPage = 'registerFaceUnlockPage';
  static const String registerSuccessPage = 'registerSuccessPage';

  RouteGenerator._();

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case loginPage:
        return MaterialPageRoute(builder: (_) => LoginPage());
      case splashPage:
        return MaterialPageRoute(builder: (_) => const SplashPage());
      case onboardingPage:
        return MaterialPageRoute(builder: (_) => const OnboardingPage());
      case registerPage:
        return MaterialPageRoute(builder: (_) => RegisterPage());
      case pinCodePage:
        return MaterialPageRoute(builder: (_) => const PinCodePage());
      case loginFingerprintPage:
        return MaterialPageRoute(builder: (_) => const LoginFingerprintPage());
      case navigationPage:
        return MaterialPageRoute(builder: (_) => const NavigationPage());
      case notificationPage:
        return MaterialPageRoute(builder: (_) => const NotificationPage());
      case transferPage:
        return MaterialPageRoute(builder: (_) => const TransferPage());
      case transferToFriendsPage:
        return MaterialPageRoute(builder: (_) => const TransferToFriendsPage());
      case transferSuccessfulPage:
        return MaterialPageRoute(
            builder: (_) => const TransferSuccessfulPage());
      case transferBankPage:
        return MaterialPageRoute(builder: (_) => const TransferBankPage());
      case withdrawPage:
        return MaterialPageRoute(builder: (_) => const WithdrawPage());
      case withdrawCodePage:
        return MaterialPageRoute(builder: (_) => const WithdrawCodePage());
      case paymentPage:
        return MaterialPageRoute(builder: (_) => const PaymentPage());
      case addNewAccountPage:
        return MaterialPageRoute(builder: (_) => const AddNewAccountPage());
      case savingPage:
        return MaterialPageRoute(builder: (_) => const SavingPage());
      case addSavingPage:
        return MaterialPageRoute(builder: (_) => const AddSavingPage());
      case addCardPage:
        return MaterialPageRoute(builder: (_) => AddCardPage());
      case manageNotificationPage:
        return MaterialPageRoute(
            builder: (_) => const ManageNotificationPage());
      case securityPage:
        return MaterialPageRoute(builder: (_) => const SecurityPage());
      case scanPage:
        return MaterialPageRoute(builder: (_) => const ScanPage());
      case captureIdentityCardPage:
        return MaterialPageRoute(
            builder: (_) => const CaptureIdentityCardPage());
      case registerFingerprintUnlockPage:
        return MaterialPageRoute(
            builder: (_) => const RegisterFingerprintUnlockPage());
      case loginFaceUnlockPage:
        return MaterialPageRoute(builder: (_) => const LoginFaceUnlockPage());
      case registerFaceUnlockPage:
        return MaterialPageRoute(
            builder: (_) => const RegisterFaceUnlockPage());
      case registerSuccessPage:
        return MaterialPageRoute(builder: (_) => const RegisterSuccessPage());

      default:
        throw Exception('Route not found');
    }
  }
}
