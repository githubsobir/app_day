import 'dart:developer';

import 'package:app_day/core/urls.dart';
import 'package:app_day/featurs/domain/entities/send_mail.dart';
import 'package:app_day/featurs/presentation/pages/main_page/sent_message/result_page.dart';
import 'package:app_day/featurs/presentation/providers/provider_send_message.dart';
import 'package:app_day/featurs/presentation/widgets/colors_app.dart';
import 'package:app_day/featurs/presentation/widgets/widget_mini/show_snacbar.dart';
import 'package:app_day/featurs/presentation/widgets/widget_mini/size.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:local_captcha/local_captcha.dart';

class SendMailMessage extends ConsumerStatefulWidget {
  const SendMailMessage({super.key});

  @override
  ConsumerState<SendMailMessage> createState() => _SendMailMessageState();
}

class _SendMailMessageState extends ConsumerState<SendMailMessage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController textControlEmail = TextEditingController();
  TextEditingController textControlName = TextEditingController();
  TextEditingController textControlPhone = TextEditingController();
  TextEditingController textAuthCaptcha = TextEditingController();
  final TextEditingController _textEditingController = TextEditingController();
  final _localCaptchaController = LocalCaptchaController();

  double sizeTextFields = 18;
  double sizeTextAfterText = 5;
  bool myBoolWidget = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Xabar yuborish",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      body: SafeArea(
          child: Container(
        padding: EdgeInsets.all(15),
        child: Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: sizeTextFields),
                Text("mail".tr()),
                SizedBox(height: sizeTextAfterText),
                TextFormField(
                  controller: textControlEmail,
                  style: TextStyle(fontWeight: FontWeight.bold),
                  validator: (value) {
                    final emailRegex = RegExp(
                        r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$');

                    if (!emailRegex.hasMatch(value!)) {
                      return "fillMail".tr();
                    }

                    return null;
                  },
                  maxLength: 35,
                  maxLines: 1,
                  decoration: InputDecoration(
                    suffixIcon: GestureDetector(
                      child: const Icon(Icons.clear, size: 12),
                      onTap: () {
                        textControlEmail.clear();
                      },
                    ),
                    counter: SizedBox.shrink(),
                    prefixStyle: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 15),
                    contentPadding: const EdgeInsets.all(8),
                    fillColor: Colors.white,
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(
                        color: AppColors.blue,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(
                        color: AppColors.grey,
                        width: 1.0,
                      ),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(
                        color: AppColors.red,
                        width: 1.0,
                      ),
                    ),
                    errorMaxLines: 2,
                    errorStyle: TextStyle(
                      color: AppColors.red,
                      fontWeight: FontWeight.bold,
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(
                        color: AppColors.red,
                        width: 1.0,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: sizeTextFields),
                Text("name".tr()),
                SizedBox(height: sizeTextAfterText),
                TextFormField(
                  controller: textControlName,
                  validator: (value) => value!.isEmpty ? "fillName".tr() : null,
                  maxLines: 1,
                  maxLength: 20,
                  textAlignVertical: TextAlignVertical.center,
                  style: TextStyle(fontWeight: FontWeight.bold),
                  decoration: InputDecoration(
                    counter: SizedBox.shrink(),
                    prefixStyle: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 15),
                    suffixIcon: GestureDetector(
                      child: const Icon(Icons.clear, size: 12),
                      onTap: () {
                        textControlName.clear();
                      },
                    ),
                    contentPadding: const EdgeInsets.all(8),
                    fillColor: Colors.white,
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(
                        color: AppColors.blue,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(
                        color: AppColors.grey,
                        width: 1.0,
                      ),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(
                        color: AppColors.grey,
                        width: 1.0,
                      ),
                    ),
                    errorMaxLines: 2,
                    errorStyle: TextStyle(
                      color: AppColors.red,
                      fontWeight: FontWeight.bold,
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(
                        color: AppColors.grey,
                        width: 1.0,
                      ),
                    ),
                    // focusedBorder: UnderlineInputBorder(
                    //   borderSide: BorderSide(color: MyColors.appColorBackC4()),
                    // ),
                  ),
                ),
                SizedBox(height: sizeTextFields),
                Text("telephone".tr()),
                SizedBox(height: sizeTextAfterText),
                TextFormField(
                    controller: textControlPhone,
                    style: TextStyle(fontWeight: FontWeight.bold),
                    maxLines: 1,
                    textAlignVertical: TextAlignVertical.center,
                    maxLength: 9,
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                    ],
                    decoration: InputDecoration(
                      prefixText: "+998 ",
                      suffixIcon: GestureDetector(
                        child: const Icon(Icons.clear, size: 12),
                        onTap: () {
                          textControlPhone.clear();
                        },
                      ),
                      contentPadding: const EdgeInsets.all(8),
                      fillColor: Colors.white,
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(color: AppColors.blue),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide:
                            BorderSide(color: AppColors.grey, width: 1.0),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide:
                              BorderSide(color: AppColors.grey, width: 1.0)),
                      errorMaxLines: 2,
                      errorStyle: TextStyle(
                          color: AppColors.red, fontWeight: FontWeight.w500),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(
                          color: AppColors.grey,
                          width: 1.0,
                        ),
                      ),
                    ),
                    validator: (value) {
                      if (value!.isNotEmpty) {
                        if (value.toString().trim().length < 9) {
                          if (value.length > 1) {
                            String kod = value.substring(0, 2);
                            for (var element
                                in MainUrl.checkTelephoneCompanyCode) {
                              if (element.contains(kod)) {
                                myBoolWidget = true;
                                break;
                              } else {
                                myBoolWidget = false;
                              }
                            }
                            if (!myBoolWidget && value.length < 3) {
                              return "kodError".tr();
                            } else {
                              return "kodLength".tr();
                            }
                          } else {
                            return "kodError".tr();
                          }
                        } else {
                          String kod = value.substring(0, 2);
                          for (var element
                              in MainUrl.checkTelephoneCompanyCode) {
                            if (element.contains(kod)) {
                              myBoolWidget = true;

                              break;
                            } else {
                              myBoolWidget = false;
                            }
                          }
                          if (!myBoolWidget) {
                            return "kodError".tr();
                          }
                        }
                      }
                      return null;
                    }),
                SizedBox(height: sizeTextAfterText),
                Text("storesMessage".tr()),
                SizedBox(height: sizeTextAfterText),

                /// message context
                Container(
                  padding: EdgeInsets.all(10),
                  height: AppSize.h(context: context) * 0.2,
                  decoration: BoxDecoration(
                      color: Colors.grey.shade50,
                      border: Border.all(color: AppColors.grey, width: 1),
                      borderRadius: BorderRadius.circular(10)),
                  child: TextFormField(
                    controller: _textEditingController,
                    onTapOutside: (val) {
                      FocusManager.instance.primaryFocus?.unfocus();
                    },
                    onChanged: (value) {
                      if (value.isEmpty) {
                        ref.read(visibleTextMessageMail.notifier).state = false;
                      } else {
                        ref.read(visibleTextMessageMail.notifier).state = true;
                      }
                    },
                    decoration: InputDecoration(
                      hintText: "typing".tr(),
                      hintStyle: TextStyle(color: AppColors.grey),
                      border: InputBorder.none,
                      counter: SizedBox.shrink(),
                    ),
                    maxLength: 400,
                    maxLines: null,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ),
                Text(
                  "enterInformation".tr(),
                  style: TextStyle(
                      color: ref.watch(visibleTextMessageMail) == false
                          ? Colors.red
                          : Colors.transparent),
                ),
                SizedBox(height: sizeTextAfterText),

                /// captcha
                const SizedBox(height: 35),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    LocalCaptcha(
                      key: const ValueKey('to tell widget should update'),
                      controller: _localCaptchaController,
                      height: 60,
                      width: 200,
                      backgroundColor: Colors.grey[100]!,
                      chars: 'abc1',
                      length: 3,
                      fontSize: 50.0,
                      textColors: const [
                        Colors.black54,
                        Colors.teal,
                        Colors.redAccent,
                      ],
                      noiseColors: const [
                        Colors.redAccent,
                        Colors.teal,
                      ],
                      caseSensitive: false,
                      codeExpireAfter: const Duration(minutes: 4),
                    ),
                    SizedBox(
                      width: 80,
                      child: TextFormField(
                        controller: textAuthCaptcha,
                        textAlignVertical: TextAlignVertical.center,
                        maxLines: 1,
                        maxLength: 3,
                        onTapOutside: (val) {
                          FocusManager.instance.primaryFocus?.unfocus();
                        },
                        autofocus: false,
                        // keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.all(8),
                          counter: const SizedBox.shrink(),
                          prefixStyle:
                              const TextStyle(fontWeight: FontWeight.bold),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(
                              color: AppColors.blue,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(
                              color: AppColors.grey,
                              width: 2.0,
                            ),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(
                              color: AppColors.red,
                              width: 2.0,
                            ),
                          ),
                          errorStyle: TextStyle(
                            color: AppColors.red,
                            fontWeight: FontWeight.bold,
                          ),
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(
                              color: AppColors.red,
                              width: 2.0,
                            ),
                          ),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "enterInformation".tr();
                          } else {
                            return null;
                          }
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 40),
                MaterialButton(
                  shape: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8)),
                  onPressed: () {
                    if (_formKey.currentState!.validate() &&
                        _textEditingController.text.isNotEmpty) {
                      if (_localCaptchaController
                              .validate(textAuthCaptcha.text.toString())
                              .toString() ==
                          "LocalCaptchaValidation.valid") {
                        SendMessageEntities sendMessageEntities =
                            SendMessageEntities(
                                mail: textControlEmail.text.trim(),
                                name: textControlName.text.trim(),
                                phone: textControlPhone.text.trim().isNotEmpty
                                    ? textControlPhone.text.trim()
                                    : "",
                                message: _textEditingController.text.trim());

                        ///
                        ///
                        ///
                        log("true");
                        Navigator.pushReplacement(
                            context,
                            CupertinoPageRoute(
                              builder: (context) => ResultPage(
                                  sendMessageEntities: sendMessageEntities),
                            ));
                        // ResultPage

                        ///
                        ///
                        ///
                      } else {
                        _localCaptchaController.refresh();
                        textAuthCaptcha.clear();
                        sendMailMessage(
                            context: context, text: "captchaError".tr());
                        log("false");
                      }
                    } else {
                      _localCaptchaController.refresh();
                      textAuthCaptcha.clear();
                      ref.read(visibleTextMessageMail.notifier).state =
                          _textEditingController.text.isNotEmpty ? true : false;
                      sendMailMessage(context: context, text: "fillRows".tr());
                      log("false");
                    }
                  },
                  minWidth: double.infinity,
                  color: AppColors.appActiveColor,
                  height: 50,
                  child: Text(
                    "confirmation".tr(),
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
          ),
        ),
      )),
    );
  }
}
