import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:track_your_dollar/resources/keys/dimension_keys.dart';
import 'package:track_your_dollar/resources/keys/margin_keys.dart';
import 'package:track_your_dollar/resources/keys/widget_keys.dart';

class LoaderDialog extends StatefulWidget {
  final String content;
  final num divider;

  const LoaderDialog({super.key, required this.content, this.divider = 1.5});

  @override
  State<LoaderDialog> createState() => _LoaderDialogState();
}

class _LoaderDialogState extends State<LoaderDialog> {
  final double _sigmaX = 0.5;
  final double _sigmaY = 0.5;
  final double _opacity = 0.3;

  @override
  Widget build(BuildContext context) {
    return AbsorbPointer(
      child: Stack(children: [
        BackdropFilter(
          filter: ImageFilter.blur(sigmaX: _sigmaX, sigmaY: _sigmaY),
          child: Container(
            color: Colors.black.withOpacity(_opacity),
          ),
        ),
        SimpleDialog(
          children: [
            Padding(
              padding: const EdgeInsets.all(MarginKeys.commonHorizontalPadding),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    height: DimensionKeys.loaderSize / widget.divider,
                    width: DimensionKeys.loaderSize / widget.divider,
                    child: const CircularProgressIndicator(
                      key: WidgetKeys.loaderIndicator,
                      color: Colors.lightGreen,
                    ),
                  ),
                  const SizedBox(width: MarginKeys.commonVerticalPadding),
                  Expanded(
                    child: Text(widget.content,
                        style: Theme.of(context).textTheme.bodyLarge),
                  ),
                ],
              ),
            ),
          ],
        ),
      ]),
    );
  }
}
