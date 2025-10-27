import 'package:dnt7/helper/color/app_color.dart';
import 'package:flutter/material.dart';

class CircleAddButton extends StatefulWidget {
  final ValueChanged <String> onSubmitted;
  final String hintText;


  const CircleAddButton({
    super.key,
    required this.onSubmitted,
    this.hintText = 'Enter name',
  });

  @override
  State <CircleAddButton> createState() => _CircleAddButtonState();
}

class _CircleAddButtonState extends State <CircleAddButton> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _openInputDialog() async {
    _controller.clear();
    final result = await showDialog <String> (
      context: context,
      barrierDismissible: true,
      builder: (context) {
        return AlertDialog(
          content: TextField(
            controller: _controller,
            autofocus: true,
            textInputAction: TextInputAction.done,
            onSubmitted: (value) => Navigator.of(context).pop(value),
            decoration: InputDecoration(
              hintText: widget.hintText,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop(_controller.text);
              },
              child: const Text('Add'),
            )
          ]
        );
      }
    );
    if (result != null && result.trim().isNotEmpty) {
      widget.onSubmitted(result.trim());
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _openInputDialog,
      child: Container(
        width: 90,
        height: 90,
        decoration: BoxDecoration(
          color: AppColor.bgIcon.withValues(alpha: 0.55),
          shape: BoxShape.circle,
        ), 
        child: Icon(
            Icons.add,
            size: 50,
            color: AppColor.colorIcons.withValues(alpha: 0.7),
        )
      ),
    );
  }
}