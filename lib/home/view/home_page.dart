import 'package:doggos/home/home.dart';
import 'package:doggos/utils/utils.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  // Initial Selected Value

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
                    onPressed: () {},
                  ),
                ),
                VerticalSpacer.xLarge(),
                const Title(),
                const Spacer(),
                const CustomDropdown(
                  title: 'City',
                  items: ['Barcelona', 'Madrid', 'Zaragoza'],
                  icon: Icons.place_outlined,
                ),
                VerticalSpacer.medium20(),
                const CustomDropdown(
                  title: 'I wanna see a',
                  items: ['Barcelona', 'Madrid', 'Zaragoza'],
                  icon: Icons.schedule_outlined,
                ),
                VerticalSpacer.xLarge(),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 100),
                  child: CustomButton(title: "Let's check!"),
                ),
                const Spacer(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Title extends StatelessWidget {
  const Title({super.key});

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
            const Text('Choose', style: _textStyle)
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('your doggy', style: _textStyle),
            HorizontalSpacer.normal(),
            const Icon(Icons.auto_awesome, color: _color),
          ],
        ),
        VerticalSpacer.medium(),
        const Text(
          "Let's to complete the first steps",
          style: TextStyle(
            color: _color,
            fontWeight: FontWeight.w300,
            fontSize: 18,
          ),
        ),
      ],
    );
  }
}
