import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColors {
  static const Color lightBlue = Color(0xFF5D9CFB);
  static const Color lightRed = Color(0xFFD15858);
  static const Color lightGreen = Color(0xFF4EB798);
  static const Color darkGreen = Color(0xFF005B40);
  static const Color white = Color(0xFFFFFFFF);
  static const Color darkBlue = Color(0xFF007AFF);
  static const Color black = Color(0xFF171717);
  static const Color darkGrey = Color(0xFF5F5F5F);
  static const Color lightGrey = Color(0xFFEBEBEB);
  static const Color grey = Color(0xFFA3A3A3);
  static const Color secondLightGrey = Color(0xFFF3F3F3);
}

class AppFonts {
  static TextStyle? subtitle = GoogleFonts.inter(
    fontSize: 15,
    color: Colors.black45,
  );
  static TextStyle? headHome = GoogleFonts.inter(
    fontSize: 22,
    color: AppColors.black,
  );
  static TextStyle? subHeadHome = GoogleFonts.inter(
    fontSize: 15,
    color: const Color(0xFF545456),
  );
  static TextStyle? title = GoogleFonts.inter(
    color: AppColors.darkGreen,
    fontSize: 16,
  );
  static TextStyle? carouselWhite = GoogleFonts.inter(
    color: AppColors.black,
    fontSize: 20,
  );
  static TextStyle? carouselGreen = GoogleFonts.inter(
    color: AppColors.white,
    fontSize: 29,
  );
  static TextStyle? titleTile = GoogleFonts.inter(
    fontWeight: FontWeight.w500,
    color: const Color(0xFF444446),
    fontSize: 15,
  );
  static TextStyle? subtitleTile = GoogleFonts.inter(
    color: const Color(0xFF444446),
    fontSize: 13,
  );
  static TextStyle? titleDrawer = GoogleFonts.inter(
    color: AppColors.darkGreen,
    fontSize: 26.3,
  );
  static TextStyle? bodyDrawer = GoogleFonts.inter(
    color: Colors.black,
    fontSize: 16.7,
  );
  static TextStyle? selectedBottomNav = GoogleFonts.inter(
    color: AppColors.darkGreen,
    fontSize: 12,
  );
  static TextStyle? lyricTile = GoogleFonts.inter(
    color: Colors.black,
    fontSize: 16.5,
  );
  static TextStyle? titleLyricView = GoogleFonts.inter(
    color: const Color(0xFF363638),
    fontWeight: FontWeight.w500,
    fontSize: 20,
  );
  static TextStyle? headline = GoogleFonts.inter(
    color: const Color(0xFF444446),
    fontWeight: FontWeight.w500,
    fontSize: 17,
  );
  static TextStyle? h2 = GoogleFonts.inter(
    color: AppColors.black,
    fontSize: 25,
  );
  static TextStyle? bodyPlaceholder = GoogleFonts.inter(
    color: const Color(0xFFAEAEB2),
    fontWeight: FontWeight.w200,
    fontSize: 12.5,
  );
}
class AppIcons {
  static const String lyricsIconName = 'assets/icons/lyrics.svg';
  static const String logo = 'assets/icons/logo.svg';
  static const String arrowBack = 'assets/icons/arrow_back_ios_new.svg';
  static const String home = 'assets/icons/home.svg';
  static const String volunteerActivism = 'assets/icons/volunteer_activism.svg';
  static const String accountCircle = 'assets/icons/account_circle.svg';
  static final sideBarIcons = [
    'assets/icons/privacy_tip.svg',
    'assets/icons/lyrics.svg',
    'assets/icons/event.svg',
    'assets/icons/play_circle.svg',
    'assets/icons/book.svg',
    'assets/icons/volunteer_activism.svg',
    'assets/icons/group.svg',
  ];
}
class AppImages {
  static String get manha => "https://firebasestorage.googleapis.com/v0/b/ipbc-palmas.appspot.com/o/manha.png?alt=media&token=7324ea8f-fac5-4c9b-ba89-bbfa7906c27a";
  static String get noite => "https://firebasestorage.googleapis.com/v0/b/ipbc-palmas.appspot.com/o/noite.png?alt=media&token=b4c89d89-659e-497c-b4ae-67a0d0a2d731";
  static String get userAvatar => "assets/images/user_avatar.png";
  static String get arrowBack => "assets/images/arrow_back_ios_new.png";
  static String get lightLogo => "assets/images/light_logo.png";
  static String get lightUnauthorizedLogo => "assets/images/light_unauthorized_logo.png";
}