import 'package:doggos/utils/utils.dart';
import 'package:flutter/material.dart';

class CustomDropdown extends StatefulWidget {
  const CustomDropdown({
    super.key,
    required this.title,
    required this.items,
    required this.icon,
    this.onChanged,
  });

  final List<String> items;
  final IconData icon;
  final String title;
  final void Function(String?)? onChanged;

  @override
  State<CustomDropdown> createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  late String value;
  final spacing = const EdgeInsets.symmetric(
    horizontal: 20,
    vertical: 5,
  );

  @override
  void initState() {
    value = widget.items[0];
    super.initState();
  }

  static const _border = UnderlineInputBorder(
    borderSide: BorderSide(color: Colors.transparent),
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 40),
          child: Text(
            widget.title,
            style: TextStyle(
              color: Colors.grey.shade800,
              fontWeight: FontWeight.w600,
              fontSize: 18,
            ),
          ),
        ),
        Container(
          width: double.infinity,
          margin: spacing,
          padding: spacing,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Colors.white,
            boxShadow: const [
              BoxShadow(
                color: Colors.blueGrey,
                blurRadius: 5,
                spreadRadius: 0.25,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: DropdownButtonFormField<String>(
            value: widget.items[0],
            icon: const Icon(Icons.expand_more),
            borderRadius: BorderRadius.circular(30),
            decoration: InputDecoration(
              enabledBorder: _border,
              border: _border,
              focusedBorder: _border,
              errorBorder: _border,
              disabledBorder: _border,
              focusedErrorBorder: _border,
              icon: GradientIcon(
                size: 40,
                icon: widget.icon,
                gradient: const LinearGradient(
                  colors: <Color>[
                    AppColors.green,
                    AppColors.blue,
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
            ),
            items: widget.items.map((String item) {
              return DropdownMenuItem(
                value: item,
                child: Text(
                  item.toTitleCase(),
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.grey.shade800,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              );
            }).toList(),
            onChanged: (String? newValue) {
              setState(() => value = newValue!);
              widget.onChanged!(newValue);
            },
          ),
        ),
      ],
    );
  }
}
