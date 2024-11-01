import 'package:either_dart/either.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hi_toeic/app/config/app_colors.dart';
import 'package:hi_toeic/app/injection.dart';
import 'package:hi_toeic/data/enum/role.dart';
import 'package:hi_toeic/pages/auth/models/fail_model.dart';
import 'package:hi_toeic/pages/auth/models/meta_data_model.dart';
import 'package:hi_toeic/pages/auth/models/success_model.dart';
import 'package:hi_toeic/pages/auth/models/user_model.dart';
import 'package:hi_toeic/pages/auth/services/auth_services.dart';
import 'package:hi_toeic/pages/auth/widgets/custom_auth_dialog.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController extends GetxController {
  late UserModel user;

  var isLoadingLogin = Rx<bool>(false);
  var isLoadingSignUp = Rx<bool>(false);
  var isLoadingForgotPassword = Rx<bool>(false);
  var isObscureText = Rx<bool>(true);

  @override
  void onInit() async {
    await isLogin();
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> refreshUser() async {
    debugPrint('[LOG][refreshUser]: onRefresh');
    UserModel? userRefresh =
        await AuthServices.instance.getUserFromDB(email: user.email);
    if (userRefresh != null) {
      user = userRefresh;
    }
  }

  Future<void> onLogin({
    required String email,
    required String password,
  }) async {
    isLoadingLogin.value = true;

    var res = await AuthServices.instance
        .login(
          email: email,
          password: password,
        )
        .timeout(
          const Duration(seconds: 2),
          onTimeout: onTimeOut,
        );

    if (res.isRight) {
      final _user = await AuthServices.instance.getUserFromDB(email: email);
      if (_user != null) {
        user = _user;
        await saveUserString(user);
        // Get.offAll(() => RootViewScreen());
      } else {
        ScaffoldMessenger.of(Get.context!).showSnackBar(
          SnackBar(
            content: Text('account_not_found'.tr),
          ),
        );
      }
    } else {
      showError(
        message: 'invalid_account_or_password'.tr,
      );
    }
    isLoadingLogin.value = false;
  }

  void showError({required String message}) {
    ScaffoldMessenger.of(Get.context!).showSnackBar(
      SnackBar(
        backgroundColor: Colors.transparent,
        padding: const EdgeInsets.all(4),
        elevation: 0,
        content: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: AppColors.primary40,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Expanded(
                child: Icon(
                  Icons.info,
                  size: 20,
                  color: Colors.white,
                ),
              ),
              Expanded(
                flex: 8,
                child: Text(
                  message,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> onSignUp({
    required String email,
    required String password,
    required String fullname,
  }) async {
    isLoadingSignUp.value = true;
    var res = await AuthServices.instance.signUp(
      email: email,
      fullname: fullname,
      password: password,
    );

    if (res.isRight) {
      UserModel userModel = UserModel(
        user_id: res.right.user!.id,
        fullname: fullname,
        avatar_url: 'Constants.imageUser',
        email: email,
        password: password,
        isGoogle: false,
        role: Role.ROLE_STUDENT.toStringValue,
      );
      //print(userModel.toMap());
      var rs = await AuthServices.instance.addUserProfile(userModel: userModel);
      if (rs.isRight) {
        user = rs.right;

        await saveUserString(user);
        // Get.offAll(() => OnBoardingScreen());
      } else {
        if (rs.left.message.toString().contains('users_pkey')) {
          Get.snackbar(
              'Lỗi', 'Vui lòng kích hoạt tài khoản qua email để tiếp tục');
        }
        print(rs.left.message);
        Get.snackbar('Lỗi', rs.left.message);
      }
    } else {
      print('res is not AuthResponse');
    }
    isLoadingSignUp.value = false;
  }

  Future<void> onGoogleAuth() async {
    var res = await AuthServices.instance.nativeGoogleSignIn();
    if (res.isRight) {
      MetaDataModel metaDataModel = MetaDataModel.fromMap(
          res.right.user!.userMetadata as Map<String, dynamic>);
      user = UserModel(
        user_id: res.right.user!.id,
        fullname: metaDataModel.fullName,
        avatar_url: metaDataModel.avatarUrl,
        email: metaDataModel.email,
        isGoogle: true,
        role: Role.ROLE_STUDENT.toStringValue,
      );
      var addDb = await AuthServices.instance.addUserProfile(userModel: user);
      if (addDb.isRight) {
        await saveUserString(addDb.right);
        // Get.offAll(() => RootViewScreen());
      } else {
        print(addDb.left.message);
        Get.snackbar('title', res.left.message);
      }
    } else {
      Get.snackbar('title', res.left.message);
    }
  }

  Future<Either<FailModel, SuccessModel>> onTimeOut() async {
    try {
      return Right(SuccessModel(message: 'Successfull'));
    } catch (e) {
      return Left(FailModel(message: e.toString()));
    }
  }

  void onObscureText() {
    isObscureText.value = !isObscureText.value;
  }

  Future<void> saveUserString(UserModel userModel) async {
    user = userModel;
    var sharePrefernces = await getIt<SharedPreferences>();
    // sharePrefernces.setString(
    //     Constants.USER_STRING, userModel.toJson().toString());
  }

  Future<bool> isLogin() async {
    // var sharePrefernces = getIt<SharedPreferences>();
    // String? userString = sharePrefernces.getString(Constants.USER_STRING);
    // if (userString == null) {
    //   return false;
    // }
    // user = UserModel.fromJson(userString);
    return true;
  }

  Future<void> forgotPassword({required String email}) async {
    isLoadingForgotPassword.value = true;
    var result = await AuthServices.instance.resetPassword(email: email);

    if (result.isRight) {
      Get.dialog(
        PopScope(
          canPop: false,
          child: CustomAuthDialog(
            pathBackgroundLottie:
                'assets/images/lottie/ic_text_congratulation.json',
            pathLottie: 'assets/images/lottie/ic_effect_congratulation.json',
            titleButton: 'Vui lòng kiểm tra email để lấy lại mật khẩu',
            onTap: () {
              Navigator.pop(Get.context!);
              // Navigator.pop(
              //   Get.context!,
              //   {'result': 'success'},
              // );
            },
          ),
        ),
      );
    } else {
      Get.dialog(
        PopScope(
          canPop: false,
          child: CustomAuthDialog(
            pathBackgroundLottie:
                'assets/images/lottie/ic_text_congratulation.json',
            pathLottie: 'assets/images/lottie/ic_effect_congratulation.json',
            titleButton: result.left.message,
            onTap: () {
              Navigator.pop(Get.context!);
              // Navigator.pop(
              //   Get.context!,
              //   {'result': 'success'},
              // );
            },
          ),
        ),
      );
    }
    isLoadingForgotPassword.value = false;
  }
}
