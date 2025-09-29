import 'package:bookia/core/constants/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Customtextfield extends StatefulWidget {
  const Customtextfield({
    super.key,
    required this.controller,
    this.hintText,
    this.validator,
    this.isPassword = false, this.onchanged,
  });
  final TextEditingController controller;
  final String? hintText;
  final String? Function(String?)? validator;
  final bool isPassword;
  final Function(String)? onchanged;

  @override
  State<Customtextfield> createState() => _CustomtextfieldState();
}

class _CustomtextfieldState extends State<Customtextfield> {
  bool isObscure = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: (value){
        if (widget.onchanged != null) {
          widget.onchanged!(value);
        }
      },
      controller: widget.controller,
      obscureText: widget.isPassword && isObscure,
      decoration: InputDecoration(
        hintText: widget.hintText,
        suffixIcon: widget.isPassword
            ? Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      isObscure = !isObscure;
                    });
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [SvgPicture.asset(AppAssets.eye)],
                  ),
                ),
              )
            : null,
      ),
      validator: widget.validator,
    );
  }
}
