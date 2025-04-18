import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class IntValueEdit extends StatefulWidget {
  const IntValueEdit(
      {super.key, required this.value, required this.onSubmitted});

  final int value;
  final void Function(int) onSubmitted;

  @override
  State<IntValueEdit> createState() => _IntValueEditState();
}

class _IntValueEditState extends State<IntValueEdit> {
  late TextEditingController _controller;
  Timer? _refreshTimer;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: '${widget.value}');
  }

  @override
  void didUpdateWidget(covariant IntValueEdit oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.value != widget.value) {
      _controller.value = TextEditingValue(
        text: '${widget.value}',
        selection: TextSelection.collapsed(offset: '${widget.value}'.length),
      );
    }
  }

  @override
  void dispose() {
    _refreshTimer?.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
      ],
      decoration: const InputDecoration(
        isDense: true,
        border: InputBorder.none,
      ),
      onChanged: (value) {
        widget.onSubmitted(int.tryParse(value) ?? 0);
        _refreshTimer?.cancel();
        _refreshTimer = Timer(const Duration(milliseconds: 4000), () {
          _controller.value = TextEditingValue(
            text: '${widget.value}',
            selection:
                TextSelection.collapsed(offset: '${widget.value}'.length),
          );
        });
      },
    );
  }
}
