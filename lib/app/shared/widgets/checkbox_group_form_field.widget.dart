import 'package:flutter/material.dart';

class CheckboxGroup extends FormField<List<String>> {
  final List<String> options;

  CheckboxGroup({
    super.key,
    required this.options,
    super.initialValue = const [],
    super.onSaved,
    super.validator,
    bool autovalidate = false,
  }) : super(
          builder: (FormFieldState<List<String>> state) {
            return Column(
              children: options.map((option) {
                return CheckboxListTile(
                  title: Text(option),
                  value: state.value!.contains(option),
                  onChanged: (bool? value) {
                    if (value == true) {
                      state.value!.add(option);
                    } else {
                      state.value!.remove(option);
                    }

                    state.didChange(state.value);
                  },
                );
              }).toList(),
            );
          },
        );

  @override
  FormFieldState<List<String>> createState() => _CheckboxGroupState();
}

class _CheckboxGroupState extends FormFieldState<List<String>> {
  List<String> selectedValues = [];

  @override
  void initState() {
    super.initState();
    selectedValues = widget.initialValue ?? [];
  }

  @override
  Widget build(BuildContext context) {
    final CheckboxGroup widget = this.widget as CheckboxGroup;
    return Column(
      children: widget.options.map((option) {
        return CheckboxListTile(
          title: Text(option),
          value: selectedValues.contains(option),
          onChanged: (bool? value) {
            setState(() {
              if (value == true) {
                selectedValues.add(option);
              } else {
                selectedValues.remove(option);
              }

              didChange(selectedValues);
            });
          },
        );
      }).toList(),
    );
  }
}
