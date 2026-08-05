import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class DatePicker extends HookWidget {
  const DatePicker({
    required this.date,
    required this.onChanged,
    this.labelText = 'Date',
    this.firstDate,
    this.lastDate,
    super.key,
  });

  final DateTime? date;
  final ValueChanged<DateTime> onChanged;
  final String labelText;
  final DateTime? firstDate;
  final DateTime? lastDate;

  Future<void> _pickDate(BuildContext context) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: date ?? DateTime.now(),
      firstDate: firstDate ?? DateTime(2000),
      lastDate: lastDate ?? DateTime(2100),
    );
    if (picked != null) onChanged(picked);
  }

  @override
  Widget build(BuildContext context) {
    final formattedDate = date == null ? '' : MaterialLocalizations.of(context).formatMediumDate(date!);
    final controller = useTextEditingController(text: formattedDate);

    useEffect(() {
      controller.text = formattedDate;
      return null;
    }, [formattedDate]);

    return TextField(
      controller: controller,
      readOnly: true,
      canRequestFocus: false,
      decoration: InputDecoration(labelText: labelText),
      onTap: () => _pickDate(context),
    );
  }
}
