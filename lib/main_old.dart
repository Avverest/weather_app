// main() => runApp(const MainPage());

// class MyStatelessWidget extends StatelessWidget {
//   final String name;
//   const MyStatelessWidget(this.name, {super.key});
//   @override
//   Widget build(BuildContext context) {
//     return Text('Hello, $name!!!',
//         style: const TextStyle(
//           color: Color(0xFFFD620A),
//           fontSize: 32.0,
//         ));
//   }
// }
//
// class App extends StatelessWidget {
//   const App({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Directionality(
//         textDirection: Te
//         xtDirection.ltr,
//         child: Container(
//           padding: const EdgeInsets.symmetric(
//             vertical: 60,
//             horizontal: 20,
//           ),
//           color: const Color(0xFFFFFFFF),
//           child: const Content(),
//         ));
//   }
// }
//
// class Content extends StatelessWidget {
//   const Content({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return const Column(
//       children: [
//         Counter('Manchester United'),
//         Counter('Juventus'),
//       ],
//     );
//   }
// }
//
// class Counter extends StatefulWidget {
//   final String _name;
//   const Counter(this._name, {super.key});
//
//   @override
//   State<Counter> createState() => _CounterState();
// }
//
// class _CounterState extends State<Counter> {
//   int counter = 0;
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: const EdgeInsets.only(bottom: 10),
//       padding: const EdgeInsets.all(4),
//       decoration: BoxDecoration(
//         border: Border.all(color: const Color(0xFFFD6A02)),
//         borderRadius: BorderRadius.circular(4),
//       ),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           _CounterLabel(widget._name),
//           _CounterButton(
//             counter,
//             onPressed: () {
//               setState(() {
//                 ++counter;
//               });
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// class _CounterLabel extends StatelessWidget {
//   static const textStyle = TextStyle(
//     color: Color(0xFF000000),
//     fontSize: 26,
//   );
//   final String _label;
//   const _CounterLabel(this._label);
//
//   @override
//   Widget build(BuildContext context) {
//     return Text(
//       _label,
//       style: _CounterLabel.textStyle,
//     );
//   }
// }
//
// class _CounterButton extends StatelessWidget {
//   final int _count;
//   final dynamic onPressed;
//   const _CounterButton(this._count, {@required this.onPressed});
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         onPressed();
//       },
//       child: Container(
//         padding: const EdgeInsets.symmetric(horizontal: 6.0),
//         decoration: BoxDecoration(
//           color: const Color(0xFFFD6A02),
//           borderRadius: BorderRadius.circular(4.0),
//         ),
//         child: Center(
//           child: Text(
//             '$_count',
//             style: const TextStyle(fontSize: 20.0),
//           ),
//         ),
//       ),
//     );
//   }
// }
