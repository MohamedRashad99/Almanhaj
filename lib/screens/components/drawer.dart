// import 'package:flutter/material.dart';
// import 'package:jeet/constants.dart';
// import 'package:jeet/screens/contactAdministration/view.dart';
// import 'package:jeet/screens/setttings/home_setttings.dart';
// import 'package:jeet/screens/wallet/Data/balanceController.dart';
// import 'package:jeet/screens/wallet/Data/deliveryBalanceModel.dart';
// import 'package:jeet/screens/wallet/view.dart';
// import 'package:easy_localization/easy_localization.dart';
// import 'package:jeet/generated/locale_keys.g.dart';
//
// import 'package:jeet/screens/home/Data/profileControl.dart';
// import 'package:jeet/screens/home/Data/profileModel.dart';
//
// import 'package:flutter_spinkit/flutter_spinkit.dart';
// import 'package:provider/provider.dart';
// import 'package:jeet/screens/signUp/provider.dart';
//
// class CustomDrawer extends StatefulWidget {
//   @override
//   _CustomDrawerState createState() => _CustomDrawerState();
// }
//
// class _CustomDrawerState extends State<CustomDrawer> {
//   int selectedIndex = 0;
//   List<Widget> listWidgets = [
//     Wallet(),
//     ContactWithAdministration(),
//     Settings(),
//   ];
//   List<IconData> listIcons = [Icons.account_balance_wallet_outlined, Icons.contact_phone_outlined, Icons.settings];
//   List<String> listTitles = [LocaleKeys.wallet.tr(), LocaleKeys.contactWithAdmin.tr(), LocaleKeys.settings.tr()];
//
//   deliveryBalanceModel _deliveryBalanceModel = deliveryBalanceModel();
//   deliveryBalanceController _deliveryBalanceController = deliveryBalanceController();
//
//   ProfileModel _profileModel = ProfileModel();
//   ProfileGetData _profileGetData = ProfileGetData();
//
//   bool loading = true;
//   Future _getProData() async {
//     _profileModel = await _profileGetData.getProfileData();
//     setState(() {
//       loading = false;
//     });
//   }
//
//   void initState() {
//     _getProData();
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     var provider = Provider.of<SignUpProvider>(context);
//
//     final height = MediaQuery.of(context).size.height;
//     final width = MediaQuery.of(context).size.width;
//     return Drawer(
//       child: Column(
//         children: <Widget>[
//           Container(
//             color: kBackgroundColor,
//             height: height * 0.25,
//             child: loading
//                 ? SpinKitChasingDots(
//                     size: 20,
//                     color: kPrimaryColor,
//                   )
//                 : Column(
//                     children: [
//                       SizedBox(
//                         height: height * 0.06,
//                       ),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                         children: [
//                           CircleAvatar(
//                             maxRadius: 30,
//                             backgroundImage: provider.prof_image == null ? null : FileImage(provider.prof_image),
//                             child: Center(
//                               child: provider.prof_image == null
//                                   ? Icon(
//                                       Icons.camera_alt_outlined,
//                                     )
//                                   : Container(),
//                             ),
//                           ),
//                           Text(
//                             _profileModel.data.delivery.name,
//                             style: TextStyle(color: Colors.black, fontFamily: 'dinnextl bold', fontSize: 18),
//                           ),
//                         ],
//                       ),
//                       Container(
//                         height: height * 0.07,
//                         width: width * 0.7,
//                         margin: EdgeInsets.symmetric(vertical: 10),
//                         decoration: BoxDecoration(color: kHomeColor, borderRadius: BorderRadius.circular(10)),
//                         child: Row(
//                           children: [
//                             SizedBox(
//                               width: width * 0.06,
//                             ),
//                             Icon(Icons.whatshot),
//                             Text(
//                                 '\t'+LocaleKeys.rewards.tr(),
//                               style: TextStyle(color: Colors.black, fontFamily: 'dinnextl medium'),
//                             ),
//                             SizedBox(
//                               width: width * 0.2,
//                             ),
//                             Text(
//                               LocaleKeys.point.tr()+'\t',
//                               style: TextStyle(color: Colors.black, fontFamily: 'dinnextl medium'),
//                             ),
//                             Text(
//                               _profileModel.data.delivery.points.toString(),
//                               style: TextStyle(color: Colors.black, fontFamily: 'dinnextl medium'),
//                             ),
//                             Icon(Icons.arrow_right_rounded),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//           ),
//           //  Divider(),
//           Container(
//             color: kHomeColor,
//             height: height * 0.5,
//             child: Column(
//               children: [
//                 Container(
//                   padding: EdgeInsets.symmetric(horizontal: 10),
//                   color: kHomeColor,
//                   height: height * 0.50,
//                   child: Column(
//                     children: [
//                       buildFlatButton(
//                           context: context,
//                           width: width * 0.03,
//                           icon: Icons.account_balance_wallet_outlined,
//                           name: LocaleKeys.wallet.tr(),
//                           route: Wallet()),
//                       buildFlatButton(
//                           context: context,
//                           width: width * 0.03,
//                           icon: Icons.contact_phone_outlined,
//                           name: LocaleKeys.contactWithAdmin.tr(),
//                           route: ContactWithAdministration()),
//                       buildFlatButton(context: context, width: width * 0.03, icon: Icons.settings, name: LocaleKeys.settings.tr(), route: Settings()),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           // Divider(),
//
//           Container(
//             color: kBackgroundColor,
//             height: height * 0.25,
//             width: width,
//             child: Column(
//               children: [
//                 Padding(
//                   padding: EdgeInsets.symmetric(vertical: 10),
//                   child: Text(
//                     LocaleKeys.share.tr(),
//                     style: TextStyle(color: Colors.black, fontFamily: 'dinnextl bold', fontSize: 15),
//                   ),
//                 ),
//                 SizedBox(
//                   height: height * 0.02,
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Image.asset('assets/images/share.png'),
//                     SizedBox(
//                       width: width * 0.03,
//                     ),
//                     Image.asset('assets/images/facebook.png'),
//                     SizedBox(
//                       width: width * 0.03,
//                     ),
//                     Image.asset('assets/images/twitter.png'),
//                     SizedBox(
//                       width: width * 0.03,
//                     ),
//                     Image.asset('assets/images/inista.png'),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   FlatButton buildFlatButton({BuildContext context, double width, IconData icon, String name, Widget route}) {
//     return FlatButton(
//       onPressed: () {
//         Navigator.push(
//           context,
//           MaterialPageRoute(builder: (context) => route),
//         );
//       },
//       child: Row(
//         children: [
//           Icon(icon),
//           SizedBox(
//             width: width,
//           ),
//           Text(
//             name,
//             style: TextStyle(color: Colors.black, fontFamily: 'dinnextl medium', fontSize: 16),
//           ),
//         ],
//       ),
//     );
//   }
// }
