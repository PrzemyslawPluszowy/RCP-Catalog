import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      surfaceTintColor: Color.fromARGB(255, 0, 0, 0),
      scrolledUnderElevation: null,
      excludeHeaderSemantics: false,
      systemOverlayStyle: null,
      backgroundColor: Colors.transparent,
      automaticallyImplyLeading: false,
      pinned: true,
      expandedHeight: 160,
      flexibleSpace: FlexibleSpaceBar(
        background: ClipRRect(
          borderRadius:
              const BorderRadius.vertical(bottom: Radius.elliptical(300, 20)),
          child: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.black, Color.fromARGB(255, 239, 71, 59)]),
            ),
            child: Padding(
              padding: const EdgeInsets.all(50.0),
              child: Image.asset(
                'assets/images/3x/logo.png',
              ),
            ),
          ),
        ),
      ),
    );
  }
}
