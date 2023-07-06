import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.text,
    this.width,
    required this.onTap,
    this.icon,
    this.color,
    this.textColor,
  });

  final String text;
  final double? width;
  final VoidCallback onTap;
  final IconData? icon;
  final Color? color;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: color ?? Theme.of(context).primaryColor,
      child: InkWell(
        onTap: onTap,
        child: Container(
          height: 60,
          width: width ?? double.infinity,
          alignment: Alignment.center,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              icon == null
                  ? const SizedBox.shrink()
                  : Container(
                      margin: const EdgeInsets.only(right: 10),
                      child: Icon(
                        icon,
                        size: 25,
                      ),
                    ),
              Text(
                text,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: textColor,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
