import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ButtonWithLoading extends StatefulWidget {
  final Widget title;
  final StreamController<bool> loadingController;
  final double? borderRadius;
  final VoidCallback onPressed;
  final Color? bgColor;

  const ButtonWithLoading({
    Key? key,
    required this.title,
    required this.loadingController,
    required this.onPressed,
    this.borderRadius,
    this.bgColor,
  }) : super(key: key);

  @override
  _ButtonWithLoadingState createState() => _ButtonWithLoadingState();
}

class _ButtonWithLoadingState extends State<ButtonWithLoading> {
  late Colors bgColor;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: () => widget.onPressed.call(),
        borderRadius: BorderRadius.circular(widget.borderRadius ?? 12),
        child: Container(
          decoration: BoxDecoration(
            color: widget.bgColor,
            borderRadius: BorderRadius.circular(widget.borderRadius ?? 12),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              widget.title,
              StreamBuilder<bool>(
                stream: widget.loadingController.stream,
                builder: (context, snapshot) {
                  bool showLoading = snapshot.requireData;
                  if (showLoading) {
                    return const CupertinoActivityIndicator();
                  }
                  return const SizedBox.shrink();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
