import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../utilis/colour_class.dart';
import '../utilis/text_style.dart';



class NormalButtonWidget extends StatelessWidget {
  final String name;
  final Function function;
  final IconData? icon;
  final bool loading;
  final Color? color;
  final TextStyle? textStyle;
  const NormalButtonWidget({
    Key? key,
    required this.name,
    required this.function,
    this.icon,
    this.loading = false,
    this.color,
    this.textStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(
              color ?? ColorClass.primaryColor),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6.0),
              ))),
      onPressed: () {
        function();
      },
      child: loading
          ? const Center(
        child: SpinKitThreeBounce(color: Colors.white, size: 20),
      )
          : Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (icon != null)
            Icon(
              icon,
              color: Colors.white,
            ),
          if (icon != null)
            const SizedBox(
              width: 5,
            ),
          Text(
            name,
            style: textStyle ?? TextStyleClass.poppinsWhite16,
          ),
        ],
      ),
    );
  }
}

class OutLineButtonWidget extends StatelessWidget {
  final String name;
  final Function function;
  final Color? color;
  final TextStyle? textStyle;
  final bool icon;
  const OutLineButtonWidget(
      {Key? key,
        required this.name,
        required this.function,
        this.color,
        this.textStyle,
        this.icon = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        elevation: MaterialStateProperty.resolveWith<double>(
                (Set<MaterialState> states) {
              return 0;
            }),
        backgroundColor: MaterialStateProperty.all<Color>(
          Colors.white,
        ),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6.0),
            side: BorderSide(
                color: color ?? ColorClass.primaryColor, width: 1.5),
          ),
        ),
      ),
      onPressed: () {
        function();
      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            name,
            style: textStyle ?? TextStyleClass.poppinsPrimary16,
          ),
          icon
              ? const Icon(
            Icons.duo_outlined,
          )
              : const SizedBox(),
        ],
      ),
    );
  }
}
