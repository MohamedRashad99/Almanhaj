//
//
// import '../utils/dimensions.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_circular_chart/flutter_circular_chart.dart';
// import '../utils/colors.dart';
//
// class GoalPieChartWidget extends StatefulWidget {
//   @override
//   _GoalPieChartWidgetState createState() => _GoalPieChartWidgetState();
// }
//
// class _GoalPieChartWidgetState extends State<GoalPieChartWidget> {
//   final GlobalKey<AnimatedCircularChartState> _chartKey = GlobalKey<AnimatedCircularChartState>();
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 200,
//       width: width,
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(20.0),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.grey.withOpacity(0.5),
//             spreadRadius: 2,
//             blurRadius: 7,
//             offset: const Offset(0, 3), // changes position of shadow
//           ),
//         ],
//       ),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Text(
//             .completeOurGoal.trs,
//             style: TextStyle(color: Colors.grey, fontSize: 16),
//           ),
//           AnimatedCircularChart(
//             key: _chartKey,
//             size: const Size.square(150),
//             initialChartData: const <CircularStackEntry>[
//               CircularStackEntry(
//                 <CircularSegmentEntry>[
//                   CircularSegmentEntry(
//                     75.00,
//                     Ko7lhColors.primaryColor,
//                     rankKey: 'completed',
//                   ),
//                   CircularSegmentEntry(
//                     25.00,
//                     Colors.grey,
//                     rankKey: 'remaining',
//                   ),
//                 ],
//                 rankKey: 'progress',
//               ),
//             ],
//             edgeStyle: SegmentEdgeStyle.round,
//             percentageValues: true,
//             holeLabel: '75%',
//             holeRadius: 20,
//           ),
//         ],
//       ),
//     );
//   }
// }
