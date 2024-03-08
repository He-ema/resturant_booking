import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';

AwesomeDialog showAwesomeDialoug(
    {required BuildContext context,
    required String messageHedaer,
    required String messageBody,
    @required DialogType? dialogType}) {
  return AwesomeDialog(
    context: context,
    dialogType: dialogType ?? DialogType.warning,
    animType: AnimType.scale,
    title: messageHedaer,
    desc: messageBody,
    btnCancelOnPress: () {},
    btnOkOnPress: () {},
  )..show();
}
