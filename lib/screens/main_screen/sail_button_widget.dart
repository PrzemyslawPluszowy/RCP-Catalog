import 'package:flutter/material.dart';
import 'package:rcp/utils/image_network.dart';

class SailButtonWidget extends StatelessWidget {
  const SailButtonWidget({
    Key? key,
    required this.imageSrc,
    required this.title,
    required this.icon,
    this.callback,
  }) : super(key: key);
  final String imageSrc;
  final String title;
  final IconData icon;
  final callback;
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        height: 100,
        width: 150,
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: const Color.fromARGB(255, 236, 5, 5).withOpacity(0.4),
                spreadRadius: 1,
                blurRadius: 1,
                offset: const Offset(1, 1), // changes position of shadow
              ),
            ],
            border: Border.all(color: Colors.black),
            borderRadius: BorderRadius.circular(10),
            color: Colors.amber),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.asset(
            imageSrc,
            fit: BoxFit.cover,
          ),
        ),
      ),
      Container(
          height: 99,
          width: 149,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
              borderRadius: BorderRadius.circular(10),
              color: const Color.fromARGB(159, 0, 0, 0)),
          child: Container()),
      Container(
        height: 99,
        width: 149,
        child: Center(
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            Container(
                width: 70,
                child: Text(
                  title,
                  style: const TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w800),
                )),
            Icon(
              icon,
              size: 50,
              color: Colors.white,
            )
          ]),
        ),
      )
    ]);
  }
}



// tack(
//       children: [
//         ClipRRect(
//           borderRadius: const BorderRadius.only(
//               topLeft: Radius.circular(50), bottomRight: Radius.circular(50)),
//           child: Material(
//             elevation: 2,
//             child: Container(
//               decoration: BoxDecoration(border: Border.all(width: 4)),
//               width: 130,
//               height: 130,
//               child: Image.asset(
//                 imageSrc,
//                 fit: BoxFit.fill,
//                 color: const Color.fromARGB(112, 0, 0, 0),
//                 colorBlendMode: BlendMode.darken,
//               ),
//             ),
//           ),
//         ),
//         Opacity(
//           opacity: 0.9,
//           child: ClipRRect(
//             borderRadius: const BorderRadius.only(
//                 topLeft: Radius.circular(50), bottomRight: Radius.circular(50)),
//             child: Container(
//               decoration: BoxDecoration(
//                 border: Border.all(width: 0),
//                 gradient: const LinearGradient(
//                     transform: GradientRotation(-45),
//                     colors: [Colors.black, Color.fromARGB(255, 25, 0, 255)]),
//               ),
//               width: 130,
//               height: 130,
//             ),
//           ),
//         ),
//         GestureDetector(
//           onTap: () async {
//             callback();
//           },
//           child: ClipRRect(
//             borderRadius: const BorderRadius.only(
//                 topLeft: Radius.circular(10), bottomRight: Radius.circular(50)),
//             child: Container(
//                 decoration: BoxDecoration(
//                     border: Border.all(width: 2, color: Colors.black54)),
//                 width: 130,
//                 height: 130,
//                 child: Center(
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Icon(icon),
//                       Text(
//                         title,
//                         textAlign: TextAlign.center,
//                         style: Theme.of(context).textTheme.headlineSmall,
//                       ),
//                     ],
//                   ),
//                 )),
//           ),
//         ),
//       ],
//     );