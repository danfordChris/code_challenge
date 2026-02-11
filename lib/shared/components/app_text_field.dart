import 'package:flutter/material.dart';

enum AppTextFieldVariant { plain, password, phone, dropdown, pin }

class AppTextField<T> extends StatefulWidget {
  final String? label;
  final String hint;
  final TextEditingController? controller;
  final AppTextFieldVariant _variant;
  final List<T>? items;
  final T? initialValue;
  final ValueChanged<T?>? onChanged;
  final FormFieldValidator<String>? validator;
  final VoidCallback? onTap;
  final BorderRadius? borderRadius;
  final Widget? suffixIcon;
  final String? hintText;
  final String Function(T)? itemLabel;

  // Plain text (default)
  const AppTextField({
    Key? key,
    this.label,
    required this.hint,
    this.controller,
    this.validator,
    this.onChanged,
    this.onTap,
    this.suffixIcon,
    this.hintText,
    this.borderRadius,
  }) : _variant = AppTextFieldVariant.plain,
       items = null,
       itemLabel = null,
       initialValue = null,
       super(key: key);

  // Password with visibility toggle
  const AppTextField.password({
    Key? key,
    this.label,
    required this.hint,
    this.controller,
    this.validator,
    this.onChanged,
    this.onTap,
    this.suffixIcon,
    this.hintText,
    this.borderRadius,
  }) : _variant = AppTextFieldVariant.password,
       items = null,
       itemLabel = null,
       initialValue = null,
       super(key: key);

  // Phone number (outlined)
  const AppTextField.phone({
    Key? key,
    this.label,
    required this.hint,
    this.controller,
    this.validator,
    this.onChanged,
    this.onTap,
    this.suffixIcon,
    this.hintText,
    this.borderRadius,
  }) : _variant = AppTextFieldVariant.phone,
       items = null,
       itemLabel = null,
       initialValue = null,
       super(key: key);

  // PIN input
  const AppTextField.pin({Key? key, this.label, this.validator, this.onChanged, this.onTap, this.suffixIcon, this.hintText, this.borderRadius})
    : _variant = AppTextFieldVariant.pin,
      hint = '',
      controller = null,
      items = null,
      itemLabel = null,
      initialValue = null,
      super(key: key);

  // Dropdown
  const AppTextField.dropdown({
    Key? key,
    this.label,
    required this.hint,
    required this.items,
    required this.itemLabel,

    this.initialValue,
    this.validator,
    this.onChanged,
    this.onTap,
    this.suffixIcon,
    this.hintText,
    this.borderRadius,
  }) : _variant = AppTextFieldVariant.dropdown,
       controller = null,
       super(key: key);

  @override
  State<AppTextField<T>> createState() => _AppTextFieldState<T>();
}

class _AppTextFieldState<T> extends State<AppTextField<T>> {
  bool _obscureText = true;
  T? _selectedValue;

  bool get _isPassword => widget._variant == AppTextFieldVariant.password;
  bool get _isPhone => widget._variant == AppTextFieldVariant.phone;
  bool get _isDropdown => widget._variant == AppTextFieldVariant.dropdown;
  bool get _isPin => widget._variant == AppTextFieldVariant.pin;

  @override
  void initState() {
    super.initState();
    if (!_isPassword) _obscureText = false;
    if (_isDropdown) {
      _selectedValue = widget.initialValue;
    }
  }

  @override
  Widget build(BuildContext context) {
    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: _isPhone ? const BorderSide(width: 1, color: Colors.grey) : BorderSide.none,
    );

    final AppTextField = Container(
      decoration: BoxDecoration(color: _isPin ? null : Theme.of(context).colorScheme.outlineVariant, borderRadius: BorderRadius.circular(8)),
      child: _isDropdown
          ? _buildDropdown(border)
          : _isPin
          ? _buildPinField()
          : _buildTextField(border),
    );

    if (widget.label == null) {
      return AppTextField;
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label!,
          style: TextStyle(fontWeight: FontWeight.w600, color: Colors.grey.shade700),
        ),
        const SizedBox(height: 6),
        AppTextField,
      ],
    );
  }

  Widget _buildPinField() {
    // Placeholder for PIN input widget, can be replaced with a package like pinput
    return TextField(
      obscureText: true,
      maxLength: 6,
      decoration: InputDecoration(
        counterText: '',
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        fillColor: Theme.of(context).colorScheme.outlineVariant,
        filled: true,
      ),
      keyboardType: TextInputType.number,
      style: const TextStyle(fontFamily: 'General Sans', fontSize: 14, fontWeight: FontWeight.w400, height: 1.02, letterSpacing: 0.56),
      onChanged: (value) => widget.onChanged?.call(value as T?),
    );
  }

  Widget _buildDropdown(OutlineInputBorder border) {
    return DropdownButtonFormField<T>(
      value: _selectedValue,
      items: widget.items!
          .map((item) => DropdownMenuItem<T>(value: item, child: Text(widget.itemLabel != null ? widget.itemLabel!(item) : item.toString())))
          .toList(),
      onChanged: (value) {
        setState(() {
          _selectedValue = value;
        });
        widget.onChanged?.call(value);
      },
      onTap: widget.onTap,
      decoration: InputDecoration(
        fillColor: Theme.of(context).colorScheme.outlineVariant,
        hintText: widget.hint,
        border: border,
        enabledBorder: border,
        focusedBorder: border,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      ),
      hint: Text(widget.hintText ?? 'Select'),
      validator: widget.validator == null ? null : (value) => widget.validator!(value?.toString()),
      borderRadius: widget.borderRadius ?? BorderRadius.circular(16.0),
      icon: widget.suffixIcon ?? Icon(Icons.arrow_drop_down, color: Theme.of(context).colorScheme.primary),
    );
  }

  Widget _buildTextField(OutlineInputBorder border) {
    return TextField(
      controller: widget.controller,
      obscureText: _obscureText,
      keyboardType: _isPhone ? TextInputType.phone : TextInputType.text,
      style: const TextStyle(fontFamily: 'General Sans', fontSize: 14, fontWeight: FontWeight.w400, height: 1.02, letterSpacing: 0.56),
      decoration: InputDecoration(
        fillColor: _isPhone ? Theme.of(context).colorScheme.surface : Theme.of(context).colorScheme.outlineVariant,
        hintText: widget.hint,
        hintStyle: const TextStyle(fontFamily: 'General Sans', fontSize: 14, fontWeight: FontWeight.w400, height: 1.02, letterSpacing: 0.56),
        border: border,
        enabledBorder: border,
        focusedBorder: _isPhone ? border.copyWith(borderSide: const BorderSide(width: 1, color: Colors.blue)) : border,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        suffixIcon: _isPassword ? _buildPasswordToggle() : widget.suffixIcon,
      ),
      onChanged: (value) => widget.onChanged?.call(value as T?),
      onTap: widget.onTap,
    );
  }

  Widget _buildPasswordToggle() {
    return IconButton(
      icon: Icon(_obscureText ? Icons.visibility_off : Icons.visibility, color: Colors.grey.shade600),
      onPressed: () {
        setState(() {
          _obscureText = !_obscureText;
        });
      },
    );
  }
}

// Validators can be added as extension methods or helper functions outside this widget.
