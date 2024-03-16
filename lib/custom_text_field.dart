import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController? controller;
  final bool? isPassword;
  final String? hint;
  final bool? enabled;
  final int? maxLines, minLines, maxLength;
  final String? obscuringCharacter, value;
  final String? Function(String?)? onValidate;
  final void Function(String?)? onChanged, onFieldSubmitted, onSaved;
  final void Function()? onEditingComplete, onTap;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final Widget? suffixWidget, prefixIcon;
  final IconData? icon;
  final TextInputAction? action;
  final FocusNode? focusNode;
  final Color? hintColor;
  final Color? fillColor;
  final bool? filled;

  const CustomTextField({
    super.key,
    this.controller,
    this.isPassword,
    this.hint,
    this.enabled,
    this.obscuringCharacter,
    this.value,
    this.onValidate,
    this.onChanged,
    this.onFieldSubmitted,
    this.onEditingComplete,
    this.onSaved,
    this.onTap,
    this.maxLines,
    this.minLines,
    this.maxLength,
    this.keyboardType,
    this.inputFormatters,
    this.suffixWidget,
    this.icon,
    this.prefixIcon,
    this.action,
    this.focusNode,
    this.hintColor = Colors.white,
    this.fillColor,
    this.filled,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return TextFormField(
      controller: widget.controller,
      initialValue: widget.value,
      validator: widget.onValidate,
      onChanged: widget.onChanged,
      onEditingComplete: widget.onEditingComplete,
      onFieldSubmitted: widget.onFieldSubmitted,
      onSaved: widget.onSaved,
      onTap: widget.onTap,
      maxLines: widget.maxLines,
      minLines: widget.minLines,
      maxLength: widget.maxLength,
      obscureText: widget.isPassword ?? false ? obscureText : false,
      obscuringCharacter: '*',
      keyboardType: widget.keyboardType,
      inputFormatters: widget.inputFormatters,
      enabled: widget.enabled,
      style: theme.textTheme.bodyLarge?.copyWith(color: Colors.black),
      // autovalidateMode: AutovalidateMode.disabled,
      textInputAction: widget.action ?? TextInputAction.done,
      focusNode: widget.focusNode,
      decoration: InputDecoration(
        suffixIcon: widget.isPassword ?? false
            ? InkWell(
                onTap: () {
                  setState(() {
                    obscureText = !obscureText;
                  });
                },
                child: Icon(
                  obscureText ? Icons.visibility : Icons.visibility_off,
                  color: const Color(0xffF8A00E),
                ),
              )
            : widget.suffixWidget,
        prefixIcon: widget.prefixIcon,
        hintText: widget.hint, fillColor: const Color(0xff454545), filled: true,
        hintStyle: TextStyle(fontSize: 14, color: widget.hintColor),
        counterText: "",
        border: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Color(0xffF8A00E),
          ),
          borderRadius: BorderRadius.circular(10.0),
        ),
        // suffix: isPass widget.suffixWidget,
        // contentPadding: const EdgeInsets.only(top: 5,left: 5, right: 5),
        // disabledBorder: UnderlineInputBorder(
        //   borderSide: BorderSide(
        //     color: Colors.grey.shade200,
        //     width: 1,
        //   ),
        // ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.blue,
          ),
          borderRadius: BorderRadius.circular(18.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Color(0xffF8A00E),
          ),
          borderRadius: BorderRadius.circular(10.0),
        ),
        errorStyle: const TextStyle(
            color: Colors.deepOrangeAccent, fontWeight: FontWeight.w400),
        errorMaxLines: 6,
        errorBorder: UnderlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: Colors.deepOrangeAccent,
            width: 1,
          ),
        ),
      ),
    );
  }
}
