import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application/widgets/design_system/app_typography.dart';
import 'dart:developer' as developer;
import '../../constants.dart';

class AppTextFormFieldMaterialCustomIcon extends FormField<String> {

  AppTextFormFieldMaterialCustomIcon({
    TextEditingController? controller,
    Key? key,
    required String labelText,
    required String hintText,
    required FocusNode focusNode,
    required StreamController<Color> colorShadowStream,
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
    onchange,
    onTap,
  }) : super(
            key: key,
            validator: validator,
            onSaved: onSaved,
            initialValue: initialValue,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            builder: (FormFieldState state) {
              Color colorShadow = Colors.transparent;
              if(!focusNode.hasListeners){
                focusNode.addListener(() {
                  if(!focusNode.hasFocus){
                    developer.log("value: add transparent color", name:'tz');
                    colorShadow = Colors.transparent;
                    colorShadowStream.sink.add(colorShadow);
                  }else{
                    developer.log("value: add redAccent color", name:'tz');
                    colorShadow = Colors.redAccent;
                    colorShadowStream.sink.add(colorShadow);
                  }
                });
              }
              return Container(
                alignment: Alignment.topLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(labelText, style: AppTypography.bodyText1,textAlign: TextAlign.start,),
                    kSpacingItem2,
                    StreamBuilder<Color>(
                        stream: colorShadowStream.stream,
                        builder: (context, snapshot){
                          Color colorShadow = Colors.transparent;
                          if(snapshot.hasData){
                            colorShadow = snapshot.data!;
                          }else{
                            colorShadow = Colors.transparent;
                          }
                      return Container(
                        decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: const BorderRadius.all(Radius.circular(6)),
                            boxShadow: [
                              BoxShadow(
                                spreadRadius: -1.0,
                                color: colorShadow,
                                blurRadius: 3,
                                blurStyle: BlurStyle.outer,
                                offset: const Offset(0, 0),
                              )
                            ]
                        ),
                        child: Stack(
                          children: [
                            TextField(
                              controller: controller,
                              focusNode: focusNode,
                              onTap: (){
                                colorShadowStream.sink.add(Colors.redAccent);
                              },
                              obscureText: isPassword ? obscureText : false,
                              style: AppTypography.bodyText2,
                              onChanged: (text) {
                                state.didChange(text);
                                state.setValue(text);
                                if (onchange != null) onchange(text);
                              },
                              decoration: const InputDecoration()
                                  .applyDefaults(Theme.of(state.context).inputDecorationTheme)
                                  .copyWith(
                                hintText: hintText,
                                floatingLabelBehavior: floatingLabelBehavior,
                                border: const OutlineInputBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(8)),
                                    borderSide:
                                    BorderSide(color: Colors.black, width: 1)),
                                enabledBorder: const OutlineInputBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(8)),
                                    borderSide:
                                    BorderSide(color: Color(0xffD2D2D2), width: 1)),
                                focusedBorder: const OutlineInputBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(8)),
                                    borderSide:
                                    BorderSide(color: colorAccent, width: 1)),
                                disabledBorder: const OutlineInputBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(8)),
                                    borderSide:
                                    BorderSide(color: Color(0xffccced7), width: 1)),
                                fillColor: Colors.transparent,
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
                        ),
                      );
                    })

                  ],
                ),
              );
            });
}
