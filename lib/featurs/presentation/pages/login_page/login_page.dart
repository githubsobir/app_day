import 'package:app_day/featurs/presentation/widgets/colors_app.dart';
import 'package:app_day/featurs/presentation/widgets/widget_mini/image_logo.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // final formKey12345 = GlobalKey<FormState>();
  TextEditingController textAuthLogin = TextEditingController();
  TextEditingController textAuthPassword = TextEditingController();
  TextEditingController textAuthCaptcha = TextEditingController();
  final boolPasswordVisible = StateProvider<bool>((ref) => true);
  // final _localCaptchaController = LocalCaptchaController();

  @override
  void dispose() {
    // _localCaptchaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white100,
      appBar: AppBar(
        iconTheme: IconThemeData(color: AppColors.white100),
        backgroundColor: AppColors.appActiveColor,
        title: Text(
          "enterSystem".tr(),
          style:
          TextStyle(color: AppColors.white100, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          // SizedBox(
          //   height: 220,
          //   child: ClipPath(
          //     clipper: WaveClipper(),
          //     child: Container(
          //       color: AppColors.appActiveColor,
          //       height: 150,
          //     ),
          //   ),
          // ),
          SafeArea(
            child: Form(
                // key: formKey12345,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Padding(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 20),
                        imageLogo(),
                        const SizedBox(height: 25),
                        Align(
                          alignment: Alignment.center,
                          child: Text(
                            "forms.standart.uz",
                            style: TextStyle(
                                color: AppColors.appActiveColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 25),
                          ),
                        ),
                        const SizedBox(height: 25),
                        Text(
                          "login".tr(),
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        TextFormField(
                            controller: textAuthLogin,
                            maxLines: 1,
                            textAlignVertical: TextAlignVertical.center,
                            decoration: InputDecoration(
                              prefixStyle: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 15),
                              suffixIcon: GestureDetector(
                                child: const Icon(Icons.clear, size: 12),
                                onTap: () {
                                  textAuthLogin.clear();
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
                                  width: 2.0,
                                ),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(
                                  color: AppColors.grey,
                                  width: 2.0,
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
                                  width: 2.0,
                                ),
                              ),
                              // focusedBorder: UnderlineInputBorder(
                              //   borderSide: BorderSide(color: MyColors.appColorBackC4()),
                              // ),
                            ),
                            validator: (value) {
                              // if (value == null ||
                              //     value.toString().trim().length < 9) {
                              //   if (value!.length > 1) {
                              //     String kod = value.substring(0, 2);
                              //     for (var element in AppVariable
                              //         .checkTelephoneCompanyCode) {
                              //       if (element.contains(kod)) {
                              //         // myBoolWidget = true;
                              //         break;
                              //       } else {
                              //         //  myBoolWidget = false;
                              //       }
                              //       // }
                              //       // if (! myBoolWidget && value.length < 3) {
                              //       //   return "kodError".tr();
                              //       // } else {
                              //       //   return "kodLength".tr();
                              //       // }
                              //       // } else {
                              //       return "login";
                              //     }
                              //   } else {
                                  // String kod = value.substring(0, 2);
                                  // for (var element
                                  //     in AppVariable.checkTelephoneCompanyCode) {
                                  //   if (element.contains(kod)) {
                                  //     myBoolWidget = true;
                                  //     boolButtonCol1(boolValue: true);
                                  //     break;
                                  //   } else {
                                  //     boolButtonCol1(boolValue: false);
                                  //     myBoolWidget = false;
                                  //   }
                                  // }
                                  // if (!myBoolWidget) {
                                  //   boolButtonCol1(boolValue: false);
                                  //   return "kodError".tr();
                                  // } else {
                                  //   boolButtonCol1(boolValue: true);
                                  // }
                                // }
                                return null;
                              // }
                            }),
                        const SizedBox(height: 10),
                        Text(
                          "password".tr(),
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        Consumer(
                          builder: (context, ref, child) => TextFormField(
                              controller: textAuthPassword,
                              textAlignVertical: TextAlignVertical.center,
                              maxLines: 1,
                              maxLength: 20,
                              onTapOutside: (val) {
                                FocusManager.instance.primaryFocus?.unfocus();
                                // MediaQuery.of(context).viewInsets.bottom;
                              },
                              autofocus: false,
                              obscureText: ref.watch(boolPasswordVisible),
                              keyboardType: TextInputType.visiblePassword,
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.all(8),
                                suffixIcon: GestureDetector(
                                  onTap: () {
                                    ref
                                        .read(boolPasswordVisible.notifier)
                                        .update((state) =>
                                    !ref.watch(boolPasswordVisible));
                                  },
                                  child: ref.watch(boolPasswordVisible)
                                      ? Icon(
                                    CupertinoIcons.eye_slash,
                                    color: AppColors.appActiveColor,
                                    size: 18,
                                  )
                                      : Icon(
                                    CupertinoIcons.eye,
                                    color: AppColors.appActiveColor,
                                    size: 18,
                                  ),
                                ),
                                fillColor: AppColors.white100,
                                prefixStyle: const TextStyle(
                                    fontWeight: FontWeight.bold),
                                errorMaxLines: 2,
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
                                    color: AppColors.grey,
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
                                    color: AppColors.grey,
                                    width: 2.0,
                                  ),
                                ),
                              ),
                              validator: (value) {
                                if (value!.isEmpty ||
                                    value.toString().trim().length < 8) {
                                  return "password".tr();
                                }
                                return null;
                              }),
                        ),
                        const SizedBox(height: 20),
                        Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              "reset_password".tr(),
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.appActiveColor,
                                  fontSize: 17),
                            )),
                        // const SizedBox(height: 20),
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                        //   children: [
                        //     LocalCaptcha(
                        //
                        //       key: const ValueKey(
                        //           'to tell widget should update'),
                        //       controller: _localCaptchaController,
                        //       height: 60,
                        //       width: 200,
                        //       backgroundColor: Colors.grey[100]!,
                        //       chars: 'abdc012345',
                        //       length: 3,
                        //       fontSize: 50.0,
                        //       textColors: const [
                        //         Colors.black54,
                        //         Colors.blueGrey,
                        //         Colors.redAccent,
                        //         Colors.teal,
                        //       ],
                        //       noiseColors: const [
                        //         Colors.black54,
                        //         Colors.grey,
                        //         Colors.blueGrey,
                        //         Colors.redAccent,
                        //         Colors.teal,
                        //         Colors.amber,
                        //         Colors.brown,
                        //       ],
                        //       caseSensitive: false,
                        //       codeExpireAfter: const Duration(minutes: 4),
                        //     ),
                        //     SizedBox(
                        //       width: 80,
                        //       child: TextFormField(
                        //         controller: textAuthCaptcha,
                        //         textAlignVertical: TextAlignVertical.center,
                        //         maxLines: 1,
                        //         maxLength: 3,
                        //         onTapOutside: (val) {
                        //           FocusManager.instance.primaryFocus?.unfocus();
                        //         },
                        //         autofocus: false,
                        //         // keyboardType: TextInputType.text,
                        //         decoration: InputDecoration(
                        //           contentPadding: const EdgeInsets.all(8),
                        //           fillColor: AppColors.white100,
                        //           counter: const SizedBox.shrink(),
                        //           prefixStyle: const TextStyle(
                        //               fontWeight: FontWeight.bold),
                        //           focusedBorder: OutlineInputBorder(
                        //             borderRadius: BorderRadius.circular(8),
                        //             borderSide: BorderSide(
                        //               color: AppColors.blue,
                        //             ),
                        //           ),
                        //           enabledBorder: OutlineInputBorder(
                        //             borderRadius: BorderRadius.circular(8),
                        //             borderSide: BorderSide(
                        //               color: AppColors.grey,
                        //               width: 2.0,
                        //             ),
                        //           ),
                        //           focusedErrorBorder: OutlineInputBorder(
                        //             borderRadius: BorderRadius.circular(8),
                        //             borderSide: BorderSide(
                        //               color: AppColors.grey,
                        //               width: 2.0,
                        //             ),
                        //           ),
                        //           errorStyle: TextStyle(
                        //             color: AppColors.red,
                        //             fontWeight: FontWeight.bold,
                        //           ),
                        //           errorBorder: OutlineInputBorder(
                        //             borderRadius: BorderRadius.circular(8),
                        //             borderSide: BorderSide(
                        //               color: AppColors.grey,
                        //               width: 2.0,
                        //             ),
                        //           ),
                        //         ),
                        //       ),
                        //     ),
                        //   ],
                        // ),
                        const SizedBox(height: 40),
                        MaterialButton(
                          onPressed: () {
                            // if (textAuthLogin.text
                            //     .toString()
                            //     .trim()
                            //     .isNotEmpty &&
                            //     textAuthPassword.text
                            //         .toString()
                            //         .trim()
                            //         .isNotEmpty &&
                            //     textAuthCaptcha.text.toString().trim().length >
                            //         2) {
                            //   if (_localCaptchaController
                            //       .validate(textAuthCaptcha.text.toString())
                            //       .toString() ==
                            //       "LocalCaptchaValidation.valid") {
                            //
                            //     _localCaptchaController.refresh();
                            //   } else {
                            //     showDialogAppCaptcha(context);
                            //     _localCaptchaController.refresh();
                            //   }
                            // } else {
                            //   showDialogApp(context);
                            // }
                          },
                          height: 55,
                          minWidth: double.infinity,
                          color: AppColors.appActiveColor,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          child: Text(
                            "confirmation".tr(),
                            style: TextStyle(
                                color: AppColors.white100,
                                fontSize: 17,
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ),
                  ),
                )),
          ),
        ],
      ),
    );
  }

  Future<void> showDialogApp(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: AppColors.white100,
          title: const Text(
            'TalabaUz',
            style: TextStyle(fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          content: Text(
            "checkInfo".tr(),
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: Text(
                'ok'.tr(),
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> showDialogAppCaptcha(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: AppColors.white100,
          title: const Text(
            'TalabaUz',
            style: TextStyle(fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          content: Text(
            "captchaError".tr(),
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: Text(
                'ok'.tr(),
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}