import 'package:education_app/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class TCheckBoxTheme{
  TCheckBoxTheme._();

  /// --light Check Box Theme
  static CheckboxThemeData lightCheckBoxTheme = CheckboxThemeData(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
    checkColor: WidgetStateProperty.resolveWith((states) {
      if(states.contains(WidgetState.selected)){
        return Colors.white;
      }else{
        return Colors.black;
      }
    }),
    fillColor: WidgetStateProperty.resolveWith((states) {
      if(states.contains(WidgetState.selected)){
        return TColors.primaryColor;
      }else{
        return Colors.transparent;
      }
    })
  );
  /// --dark Check Box Theme
  static CheckboxThemeData darkCheckBoxTheme = CheckboxThemeData(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
    checkColor: WidgetStateProperty.resolveWith((states) {
      if(states.contains(WidgetState.selected)){
        return Colors.white;
      }else{
        return Colors.black;
      }
    }),
    fillColor: WidgetStateProperty.resolveWith((states) {
      if(states.contains(WidgetState.selected)){
        return TColors.primaryColor;
      }else{
        return Colors.transparent;
      }
    })
  );

}