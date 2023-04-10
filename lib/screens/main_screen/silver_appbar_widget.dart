import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      surfaceTintColor: const Color.fromARGB(255, 0, 0, 0),
      scrolledUnderElevation: null,
      excludeHeaderSemantics: false,
      systemOverlayStyle: null,
      backgroundColor: Colors.transparent,
      automaticallyImplyLeading: false,
      pinned: false,
      expandedHeight: 160,
      flexibleSpace: FlexibleSpaceBar(
        background: ClipRRect(
          borderRadius:
              const BorderRadius.vertical(bottom: Radius.elliptical(300, 20)),
          child: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/appBar.jpeg'),
                  fit: BoxFit.fill),
              gradient: LinearGradient(
                  colors: [Colors.black, Color.fromARGB(255, 239, 71, 59)]),
            ),
          ),
        ),
      ),
    );
  }
}
