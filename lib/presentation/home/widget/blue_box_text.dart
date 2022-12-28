import 'package:flutter/material.dart';
import 'package:flutter_projects/presentation/home/constants/image_constant.dart';

class BlueBoxText extends StatefulWidget {
  final void Function()? onTap;
  final String text;
  final bool showBold;
  final bool showBlueBox;
  const BlueBoxText(
      {super.key,
        required this.text,
        required this.showBold,
        required this.showBlueBox,
        required this.onTap});

  @override
  State<BlueBoxText> createState() => _BlueBoxTextState();
}

class _BlueBoxTextState extends State<BlueBoxText> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            if (widget.showBlueBox)
              Container(
                width: 7,
                height: 31,
                padding: EdgeInsets.zero,
                decoration: BoxDecoration(
                  //color: Colors.blue.shade700,
                  borderRadius: BorderRadius.circular(0),
                  shape: BoxShape.rectangle,
                  image: const DecorationImage(
                    image: AssetImage(HomeAsset.sideBlue),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            if (!widget.showBlueBox)
              const SizedBox(
                width: 7,
                height: 31,
              ),
            const SizedBox(
              width: 20,
            ),
            Text(
              widget.text,
              textAlign: TextAlign.left,
              style: TextStyle(
                  color: widget.showBlueBox ? Colors.blue : Colors.black,
                  fontWeight:
                  widget.showBold ? FontWeight.bold : FontWeight.normal),
            ),
          ],
        ),
      ),
    );
  }
}
