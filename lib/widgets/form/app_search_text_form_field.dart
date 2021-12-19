import 'package:flutter/material.dart';
import 'package:flutter_application/widgets/design_system/app_typography.dart';

import '../../constants.dart';

class AppSearchTextFormField extends FormField<String> {

  AppSearchTextFormField({
    TextEditingController? controller,
    Key? key,
    required String labelText,
    required String hintText,
    FocusNode? focusNode,
    String? initialValue,
    FormFieldSetter<String>? onSaved,
    FormFieldValidator<String>? validator,
    bool autoValidate = false,
    bool enabled = true,
    bool selected = false,
    Widget? trailingIcon,
    Widget? leadingIcon,
    Widget? prefix,
    FloatingLabelBehavior floatingLabelBehavior = FloatingLabelBehavior.auto,
    AutovalidateMode? autoValidateMode,
    bool obscureText = true,
    bool isPassword = false,
    Color lablelColor = Colors.black45,
    onEditingComplete,
    onchange,
    onTap,
  }) : super(
      key: key,
      validator: validator,
      onSaved: onSaved,
      initialValue: initialValue,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      builder: (FormFieldState state) {
        return Stack(
          children: [
            TextField(
              controller: controller,
              focusNode: focusNode,
              obscureText: isPassword ? obscureText : false,
              style: AppTypography.bodyText1.copyWith(color: Colors.black),
              onChanged: (text) {
                state.didChange(text);
                state.setValue(text);
                if (onchange != null) onchange(text);
              },
              onEditingComplete: (){
                if(onEditingComplete!=null){
                  onEditingComplete(state.value);
                }
              },
              decoration: const InputDecoration()
                  .applyDefaults(Theme.of(state.context).inputDecorationTheme)
                  .copyWith(
                hintText: hintText,
                hintStyle: AppTypography.bodyText1.copyWith(color: const Color(0xff7C7C7C)),
                floatingLabelBehavior: floatingLabelBehavior,
                filled: true,
                fillColor: const Color(0xffF2F3F2),
                border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                    borderSide: BorderSide(color: Colors.transparent, width: 1)),
                enabledBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                    borderSide: BorderSide(color: Colors.transparent, width: 1)),
                focusedBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                    borderSide: BorderSide(color: Colors.transparent, width: 1)),
                disabledBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                    borderSide: BorderSide(color: Colors.transparent, width: 1)),
                contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12).copyWith(
                    left: leadingIcon != null ? 48 : 16,
                    right: trailingIcon != null ? 48 : 16
                ),
                suffixIcon: isPassword ? Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: InkResponse(
                    child: Icon(obscureText ? Icons.visibility : Icons.visibility_off,
                      color: obscureText ? const Color(0xffc9c9c9) : colorAccent,),
                    onTap: () {
                      state.setState(() {
                        obscureText = !obscureText;
                      });
                    },
                  ),
                )
                    : Container(
                  width: 1,
                ),
                errorText: state.errorText,
                enabled: enabled,
              ),
            ),
            if(leadingIcon != null)
              Positioned.fill(
                  left: 16,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: leadingIcon,
                  )),
            if(trailingIcon != null)
              Positioned.fill(
                  right: 16,
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: trailingIcon,
                  )),
          ],
        );
      });
}
