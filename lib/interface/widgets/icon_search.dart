import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class IconAndSearch extends StatelessWidget {
  const IconAndSearch({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SvgPicture.asset(
          'assets/images/icon.svg',
          height: 30,
        ),
        SvgPicture.asset(
          'assets/images/Vector.svg',
          height: 30,
        ),
      ],
    );
  }
}
