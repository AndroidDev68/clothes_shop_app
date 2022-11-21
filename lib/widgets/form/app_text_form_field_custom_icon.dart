import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application/utils/extensions.dart';
import 'package:flutter_application/widgets/design_system/app_typography.dart';


class AppTextFormFieldCustomIcon extends FormField<String> {
  final TextEditingController? textEditingController;
  AppTextFormFieldCustomIcon({
    Key? key,
    String? initialValue,
    String? hint,
    String? title,
    Widget? action,
    int? maxLines = 1,
    int? maxLength = 1000,
    FormFieldSetter<String>? onSaved,
    bool isPassword = false,
    TextInputType? keyboardType,
    TextInputAction? textInputAction,
    TextCapitalization? textCapitalization,
    this.textEditingController,
    ValueChanged<String>? onChanged,
    VoidCallback? onEditingComplete,
    FormFieldValidator<String>? validator,
    List<TextInputFormatter>? textInputFormatter,
    Color? backgroundColor,
    String? description,
    Widget? trailingIcon,
    Widget? leadingIcon
  }) : super(
    key: key,
    initialValue: initialValue,
    onSaved: onSaved,
    validator: validator,
    builder: (field) {
      final state = field as AppTextFormFieldCustomIconState;
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if(title != null)
            Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    title,
                    style: AppTypography.bodyText1,
                  ),
                  if (action != null)
                    action
                ],
              ),
            ),
          Stack(
            children: [
              CupertinoTextField(
                controller: state.textEditingController,
                padding: const EdgeInsets.symmetric(
                    vertical: 12
                ).copyWith(left: leadingIcon != null ? 36 : 12, right: trailingIcon != null ? 36 : 12),
                obscureText: isPassword,
                maxLines: maxLines,
                maxLength: maxLength,
                placeholder: hint,
                onChanged: (value) {
                  if (onChanged != null) {
                    onChanged(value);
                  }
                  field.didChange(value);
                },
                onEditingComplete: () {
                  FocusScope.of(field.context).requestFocus(FocusNode());
                  if(onEditingComplete != null) {
                    onEditingComplete();
                  }
                },
                decoration: BoxDecoration(
                  color: backgroundColor ?? state.theme.hintColor.withOpacity(0.02) ,
                  border: Border.all(color: state.theme.dividerColor, width: 0.5),
                  borderRadius: BorderRadius.circular(4),
                ),
                style: AppTypography.bodyText2.copyWith(color: const Color(0xff303030)),
                keyboardType: keyboardType ?? TextInputType.text,
                placeholderStyle: AppTypography.bodyText2.copyWith(color: Color(0xffAEAEAE)),
                inputFormatters: textInputFormatter,
                textInputAction: textInputAction ?? TextInputAction.done,
                textCapitalization: textCapitalization ?? TextCapitalization.none,
              ),
              if(trailingIcon != null && textEditingController != null && textEditingController.text.isNotEmpty)
              Positioned.fill(
                right: 8,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: trailingIcon,
                ),
              ),
              if(leadingIcon != null && textEditingController != null)
                Positioned.fill(
                  left: 8,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: leadingIcon,
                  ),
                ),
            ],
          ),
          if (field.hasError)
            Text(field.errorText!, style: Theme.of(field.context).inputDecorationTheme.errorStyle,),
          if(description!=null)
            Padding(
              padding: const EdgeInsets.only(top: 3),
              child: Text(description, style: AppTypography.bodyText2.copyWith(color: Colors.black38)),
            ),
        ],
      );
    },
  );

  @override
  AppTextFormFieldCustomIconState createState() {
    return AppTextFormFieldCustomIconState();
  }
}

class AppTextFormFieldCustomIconState extends FormFieldState<String> {
  late TextEditingController textEditingController;

  @override
  void initState() {
    super.initState();
    textEditingController = (widget as AppTextFormFieldCustomIcon).textEditingController ?? TextEditingController(text: widget.initialValue);
  }
}
