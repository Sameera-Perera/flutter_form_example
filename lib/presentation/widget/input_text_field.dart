import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InputTextField extends StatefulWidget {
  final String? Function(String? val)? validation;
  final Function()? onEditComplete;
  final Function(String val)? onChange;
  final TextEditingController? textEditingController;
  final String hint;
  final TextInputType? textInputType;
  final List<TextInputFormatter>? inputFormatters;
  final bool enable;
  final String? initialValue;
  final bool obscureText;
  final TextAlign textAlign;
  final TextInputAction textInputAction;

  const InputTextField(
      {Key? key,
      this.validation,
      this.textEditingController,
      this.hint = "",
      this.onChange,
      this.textInputType,
      this.inputFormatters,
      this.enable = true,
      this.initialValue,
      this.obscureText = false,
      this.textAlign = TextAlign.left,
      this.onEditComplete,
      this.textInputAction = TextInputAction.next})
      : super(key: key);

  @override
  State<InputTextField> createState() => _InputTextFieldState();
}

class _InputTextFieldState extends State<InputTextField> {
  bool _isVisible = false;

  @override
  void initState() {
    _isVisible = widget.obscureText;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      child: TextFormField(
        textDirection: TextDirection.ltr,
        controller: widget.textEditingController,
        initialValue: widget.initialValue,
        validator: widget.validation ??
            (val) {
              return null;
            },
        keyboardType: widget.textInputType,
        inputFormatters: widget.inputFormatters,
        textInputAction: widget.textInputAction,
        enabled: widget.enable,
        onChanged: (val) {
          if (widget.onChange != null) {
            widget.onChange!(val);
          }
        },
        onEditingComplete: widget.onEditComplete,
        obscureText: _isVisible,
        style:
            const TextStyle(fontSize: 12.0, height: 2.0, color: Colors.black),
        textAlign: widget.textAlign,
        decoration: InputDecoration(
            hintText: widget.hint,
            suffixIcon: widget.obscureText
                ? GestureDetector(
                    child: _isVisible
                        ? const Icon(
                            Icons.visibility_off,
                            size: 18,
                            color: Colors.grey,
                          )
                        : const Icon(
                            Icons.visibility,
                            size: 18,
                            color: Colors.grey,
                          ),
                    onTap: () => setState(() {
                      _isVisible = !_isVisible;
                    }),
                  )
                : null,
            contentPadding: const EdgeInsets.symmetric(horizontal: 10),
            filled: !widget.enable,
            fillColor: Colors.grey.shade100,
            hintStyle:
                const TextStyle(fontWeight: FontWeight.w300, fontSize: 11),
            border: OutlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(5.0)),
              borderSide: BorderSide(width: 1, color: Colors.grey.shade300),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(5.0)),
              borderSide: BorderSide(width: 1, color: Colors.grey.shade300),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(5.0)),
              borderSide: BorderSide(width: 1, color: Colors.grey.shade300),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(5.0)),
              borderSide: BorderSide(width: 1, color: Colors.grey.shade300),
            )),
      ),
    );
  }
}
