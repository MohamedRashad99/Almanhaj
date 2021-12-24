import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

const kPrimaryColor = Color(0xFF2972B7);
const Color kAccentColor = Color(0xFFFFD0C5);
const Color kTextColor = Color(0xFFB5B5B5);
const kBackgroundColor = Color(0xFFF1F1F1);
const Color kHomeColor = Color(0xFFF9F9F9);
const Color kRoundColor = Color(0xFFFEBD2F);
const Color kLightText =Color(0xFFC4C4C4);
const Color kRoundBorderColor = Color.fromRGBO(220, 220, 220,1);


const kGreenColor = Color(0xFF03AB6A);
const kLightGreenColor = Color(0xFF099861);
const kGreyTextColor = Color(0xFF898A8D);
const kWhitecardColor = Color(0xFFF5F5F5);
const kprimaryLightColor = Color(0x5c0090CF);
const kFavouriteColor = Color(0xFFAB0D03);
const kPrimaryFDarkColor = Color(0xFF0A4E75);
const kPrimaryBlueColor = Color(0xFF3080D1);
const khTextColor = Color(0xFF323232);








final headingStyle = TextStyle(
  fontSize: getProportionateScreenWidth(28),
  fontFamily: 'Khebrat Musamim',
  fontWeight: FontWeight.bold,
  color: Colors.black,
);

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}

const subheadingStyle = TextStyle(
  fontFamily: 'Khebrat Musamim',
  fontWeight: FontWeight.w400,
  color: Colors.grey,
);

spaceH(double height) {
  return SizedBox(height: height);
}

spaceW(double width) {
  return SizedBox(width: width);
}




//constant functions
double sizeFromHeight(BuildContext context, double fraction,{bool removeAppBarSize = true}) {
  double deviceHeight = MediaQuery.of(context).size.height;
  fraction = (removeAppBarSize ? (deviceHeight - AppBar().preferredSize.height) : deviceHeight) / (fraction == 0 ? 1 : fraction);
  return fraction;
}

double sizeFromWidth(BuildContext context, double fraction) {
  fraction = MediaQuery.of(context).size.width / (fraction == 0 ? 1 : fraction);
  return fraction;
}


class SizeConfig {
  static double screenHeight = 0.0;
  static double screenWidth = 0.0;

  void init(BuildContext context) {
    MediaQueryData _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
  }
}

// Get the proportionate height as per screen size
double getProportionateScreenHeight(double inputHeight) {
  double screenHeight = SizeConfig.screenHeight;
  // 812 is the layout height that designer use
  return (inputHeight / 812.0) * screenHeight;
}

// Get the proportionate height as per screen size
double getProportionateScreenWidth(double inputWidth) {
  double screenWidth = SizeConfig.screenWidth;
  // 375 is the layout width that designer use
  return (inputWidth / 375.0) * screenWidth;
}


//Text test
String test = " فعلى سبيل المثال لا الحصر، تُستخدم المسائل والحسابات الرياضية   فعلى سبيل المثال لا الحصر، تُستخدم المسائل والحسابات الرياضية  فعلى سبيل المثال لا الحصر، تُستخدم المسائل والحسابات الرياضية فعلى سبيل المثال لا الحصر، تُستخدم المسائل والحسابات   فعلى سبيل المثال لا الحصر، تُستخدم المسائل والحسابات الرياضية   فعلى سبيل المثال لا الحصر، تُستخدم المسائل والحسابات الرياضية في فرضيات الاختبار، وفي المهن العلمية، وحتى في ماكينات المدفوعات النقدية الموجودة في المحلات والمتاجر الكبرى، ومن مجالات استخدام الرياضيات الأخرى معالجة برامج التصنيع، التي تُستخدم فيها الخصائص الهندسية.لذلك يعد علم الرياضيات علمًا شاملًا يدخل في معظم العلوم الحديثة الأخرى، ومن أبرز فروع علم الرياضيات ما يأتي لذلك يعد علم الرياضيات علمًا شاملًا يدخل في معظم العلوم الحديثة الأخرى، ومن أبرز فروع علم الرياضيات ما يأتي طُوّر علم الرياضيات في العصر الحديث، وأصبح له العديد من الفروع المتنوعة، وكل فرع منها يختص بدراسة مجال رياضي معين، وقد ساهمت فروع الرياضيات في التطور التكنولوجي بدرجة كبيرة، لذلك يعد علم الرياضيات علمًا شاملًا يدخل في معظم العلوم الحديثة الأخرى، ومن أبرز فروع علم الرياضيات ما يأتيا لمثال لا الحصر، تُستخدم المسائل والحسابات ال ا يأتيا لمثال لا الحصر، تُستخدم المسائل والحسابات ";

