import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lavender/core/themes/app_colors.dart';
import 'package:lavender/core/themes/stylesdart.dart';

class CustomTextField extends StatefulWidget {
  final String hint;
  final String title;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final bool isPassword;
  final String? Function(String?)? validator;

  const CustomTextField({
    super.key,
    required this.title,
    required this.hint,
    required this.controller,
    required this.keyboardType,
    this.isPassword = false,
    this.validator,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool obscureText = true;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: GoogleFonts.alexandria(
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 20.h),
        TextFormField(
          style: TextStyles.bodyBold,
          controller: widget.controller,
          keyboardType: widget.keyboardType,
          obscureText: widget.isPassword ? obscureText : false,
          obscuringCharacter: "*",
          validator: widget.validator,
          textAlign: TextAlign.right,
          decoration: InputDecoration(
            hintText: widget.hint,
            hintStyle: GoogleFonts.alexandria(color: Colors.grey.shade400),
            filled: true,
            fillColor: AppColors.grey3,
            suffixIcon:
                widget.isPassword
                    ? IconButton(
                      icon: Icon(
                        obscureText ? Icons.visibility_off : Icons.visibility,
                        color: AppColors.grey4,
                      ),
                      onPressed: () {
                        setState(() {
                          obscureText = !obscureText;
                        });
                      },
                    )
                    : null,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ],
    );
  }
}
