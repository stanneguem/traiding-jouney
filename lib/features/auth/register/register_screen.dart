import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:trading_journey/core/utils/colors.dart';
import 'package:trading_journey/features/auth/register/register_controller.dart';
import 'package:trading_journey/features/auth/register/widgets/register_error_box.dart';
import '../widgets/app_back_button.dart';
import '../widgets/dropdown_custom.dart';
import '../widgets/footer_text.dart';
import '../widgets/primary_button.dart';
import '../widgets/social_button.dart';
import '../widgets/text_field_custom.dart';
import 'widgets/register_form.dart';

class RegisterScreen extends StatelessWidget {

  RegisterScreen({super.key});
  final controller = Get.put(RegisterController());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => SingleChildScrollView(
        child: Stack(
          children: [
            SizedBox(
                width: double.maxFinite,
                child: Image.asset("assets/images/fond.png", fit: BoxFit.cover,)),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25, vertical: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 35.h,),
                  const AppBackButton(),
                  const SizedBox(height: 24),
                  Text("S’inscrire",
                      style: TextStyle(fontSize: 32.sp, fontWeight: FontWeight.bold, color: Colors.white, fontFamily: "poppins")),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Text("Vous avez déjà un compte ? ",
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 12.sp,
                              fontFamily: "poppins"
                          )),
                      GestureDetector(
                        onTap: () => Get.back(),
                        child: Text("Se connecter",
                            style: TextStyle(
                                color: AppColors.primaryColor,
                                fontWeight: FontWeight.bold,
                                fontFamily: "poppins",
                                fontSize: 12.sp
                            )),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  RegisterErrorBox(errors: controller.errors),
                  Row(
                    children: [
                      Expanded(
                          child: TextFieldCustom(
                            label: 'Nom',
                            asError: false,
                            func: (){},
                            controller: controller.name,
                            hint: "Nom",
                            isInvisible: false,
                            isPassword: false,
                          )),
                      const SizedBox(width: 10),
                      Expanded(child: TextFieldCustom(
                        label: 'Prénom',
                        asError: false,
                        func: (){},
                        controller: controller.lastName,
                        hint: "Prénom",
                        isInvisible: false,
                        isPassword: false,
                      )),
                    ],
                  ),
                  const SizedBox(height: 14),
                  TextFieldCustom(
                    label: 'Email',
                    asError: false,
                    func: (){},
                    controller: controller.email,
                    hint: "Email",
                    isInvisible: false,
                    isPassword: false,
                  ),
                  const SizedBox(height: 14),
                  DropdownCustom(
                    label: 'Pays',
                    asError: false,
                    flag: controller.flage.value,
                    func: (){
                      showCountryPicker(
                        context: context,
                        countryListTheme: CountryListThemeData(
                          flagSize: 25,
                          backgroundColor: AppColors.darkColor,
                          textStyle: TextStyle(fontSize: 16, color: AppColors.lightColor, fontFamily: "poppins"),
                          bottomSheetHeight: 500, // Optional. Country list modal height
                          //Optional. Sets the border radius for the bottomsheet.
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20.0),
                            topRight: Radius.circular(20.0),
                          ),
                          //Optional. Styles the search field.
                          inputDecoration: InputDecoration(
                            labelText: 'Search',
                            hintText: 'Start typing to search',
                            prefixIcon: const Icon(Icons.search),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: const Color(0xFF8C98A8).withOpacity(0.2),
                              ),
                            ),
                          ),
                        ),
                        onSelect: (Country country){
                          controller.flage.value = country.flagEmoji;
                          controller.pays.text = country.name;
                        },
                      );
                    },
                    controller: controller.pays,
                    hint: "Cameroun",
                    isInvisible: false,
                    isReadOnly: true,
                  ),
                  const SizedBox(height: 14),
                  TextFieldCustom(
                    label: 'Mot de passe',
                    asError: false,
                    func: controller.changePasswordVisible,
                    controller: controller.password,
                    hint: "******",
                    isInvisible: controller.isPasswordInvisible.value,
                    isPassword: true,
                  ),
                  const SizedBox(height: 14),
                  TextFieldCustom(
                    label: 'Confirmer le mot de passe',
                    asError: false,
                    func: controller.changeConfirmPasswordVisible,
                    controller: controller.confirmPassword,
                    hint: "******",
                    isInvisible: controller.isConfirmPasswordInvisible.value,
                    isPassword: true,
                  ),
                  const SizedBox(height: 20),
                  PrimaryButton(isLoading: false,func: controller.register,),
                  const SizedBox(height: 30),
                  const Row(
                    children: [
                      Expanded(child: Divider(color: Colors.grey)),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text("Ou continuer avec", style: TextStyle(
                            fontSize: 12,
                            fontFamily: "poppins"
                        ),),
                      ),
                      Expanded(child: Divider(color: Colors.grey)),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      SocialButton(icon: "assets/images/google.png", label: "Google"),
                      SizedBox(width: 16),
                      SocialButton(icon: "assets/images/Group.png", label: "Apple"),
                    ],
                  ),
                  const SizedBox(height: 30),
                  const FooterText(),
                ],
              ),
            ),
          ],
        ),
      ),),
    );
  }
}
