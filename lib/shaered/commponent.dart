import 'package:flutter/material.dart';

class DefaultFormField extends StatelessWidget {
  DefaultFormField(
      {Key? key,
      required this.controller,
      required this.type,
      required this.label,
        this.prefix,
      required this.validate,
      required this.isPassword,
      this.onChange,
      this.onSubmit,
      this.onTap,
      this.suffix,
      this.suffixPressed})
      : super(key: key);
  final TextEditingController controller;
  final TextInputType type;
  final String label;
  final Widget? prefix;
  final String? Function(String? value) validate;
  final VoidCallback? onTap;
  final Function? onSubmit;
  final Function(String)? onChange;
   bool isPassword = false;
  final IconData? suffix;
  final VoidCallback? suffixPressed;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: isPassword,
      controller: controller,
      keyboardType: type,
      validator: validate,
      onTap: onTap,
      onChanged: onChange,
      onFieldSubmitted: (s) {
        onSubmit!(s);
      },
      decoration: InputDecoration(
        labelText: label,
        prefixIcon:
          prefix,
        suffixIcon: suffix != null
            ? IconButton(
                onPressed: suffixPressed,
                icon: Icon(suffix),
              )
            : null,
        border: OutlineInputBorder(),
      ),
    );
  }
}

Widget defaultButton({
  double width = double.infinity,
  Color background = Colors.blue,
  Color textColor = Colors.white,
  double radius = 5.0,
  bool isUpperCase = true,
  required VoidCallback function,
  required String text,
}) =>
    Container(
      width: width,
      height: 40.0,
      child: MaterialButton(
        onPressed: function,
        child: Text(
          isUpperCase ? text.toUpperCase() : text,
          style: TextStyle(
            color: textColor,
          ),
        ),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        border: Border.all(color: Colors.blue),
        color: background,
      ),
    );

Widget defaultTextButton(
    {
      required VoidCallback function,
      required String text,
    }) =>TextButton(
    onPressed: function,
    child: Text(text.toUpperCase()));

void navigateTo(context, widget) => Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => widget,
  ),
);
void navigateAndFinish(context, widget) => Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(
      builder: (context) => widget,
    ),
        (Route<dynamic> route) => false);
