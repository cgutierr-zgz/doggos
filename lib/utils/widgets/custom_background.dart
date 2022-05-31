import 'package:doggos/utils/utils.dart';
import 'package:flutter/material.dart';

class CustomBackground extends StatelessWidget {
  const CustomBackground({
    super.key,
    required this.body,
    required this.title,
    required this.subTitle,
    required this.description,
  });

  final String title;
  final String subTitle;
  final String description;
  final Widget body;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          const BackgroundBubble(),
          SafeArea(
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: IconButton(
                    icon: const Icon(
                      Icons.person_outline,
                      size: 50,
                      color: Colors.white,
                    ),
                    // TODO(carlos): Add Route
                    onPressed: () => throw UnimplementedError(),
                  ),
                ),
                VerticalSpacer.xLarge(),
                _Title(
                  title: title,
                  subTitle: subTitle,
                  description: description,
                ),
                const Spacer(),
                body,
                const Spacer(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _Title extends StatelessWidget {
  const _Title({
    required this.title,
    required this.subTitle,
    required this.description,
  });

  final String title;
  final String subTitle;
  final String description;

  static const _color = Colors.white;
  static const _textStyle = TextStyle(
    color: _color,
    fontSize: 30,
    fontWeight: FontWeight.w600,
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.auto_awesome, color: _color),
            HorizontalSpacer.normal(),
            Text(title, style: _textStyle)
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(subTitle, style: _textStyle),
            HorizontalSpacer.normal(),
            const Icon(Icons.auto_awesome, color: _color),
          ],
        ),
        VerticalSpacer.medium(),
        Text(
          description,
          style: const TextStyle(
            color: _color,
            fontWeight: FontWeight.w300,
            fontSize: 18,
          ),
        ),
      ],
    );
  }
}
