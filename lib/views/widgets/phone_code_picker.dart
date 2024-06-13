import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_multi_formatter/formatters/masked_input_formatter.dart';
import 'package:get/get.dart';
import 'package:realfitzclient/constants/strings.dart';
import 'package:realfitzclient/views/resources/values_manager.dart';

import '../resources/colors_manager.dart';
import '../resources/styles/text_styles.dart';

class PhoneCodePicker extends StatelessWidget {
  final String? Function(String?) validator;
  final TextEditingController controller;
  final Function(String? code, String? name) countryDetails;

  const PhoneCodePicker({
    super.key,
    required this.validator,
    required this.controller,
    required this.countryDetails,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 58,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppSizes.s12),
                border: Border.all(color: AppColors.grey, width: 1)),
            width: Get.width * 0.25,
            height: 58,
            child: CountryCodePicker(
              padding: EdgeInsets.zero,
              textStyle: regularTextStyle,
              onChanged: (countryCode) {
                countryDetails(countryCode.dialCode, countryCode.name);
              },
              initialSelection: 'CM',
              favorite: const ['+237', 'CM'],
              showCountryOnly: false,
              showOnlyCountryWhenClosed: false,
              alignLeft: false,
              onInit: (countryCode) {
                countryDetails(countryCode?.dialCode, countryCode?.name);
              },
            ),
          ),
          SizedBox(
            width: Get.width * 0.05,
          ),
          SizedBox(
            width: Get.width * 0.58,
            child: TextFormField(
              autofocus: false,
              inputFormatters: [
                MaskedInputFormatter(
                    '### ### #### #### #### #### #### #### #### ####')
              ],
              controller: controller,
              validator: validator,
              style: regularTextStyle,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                // helperText:
                // AppStrings.youWillUseThisNumberForAccountRecoveryOrOTPSignIn,
                errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: AppColors.red,
                  ),
                  borderRadius: BorderRadius.circular(AppSizes.s12),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: AppColors.grey,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(AppSizes.s12),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: AppColors.grey,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(AppSizes.s12),
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: AppColors.grey,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(AppSizes.s12),
                ),
                // helperStyle: regularTextStyle.copyWith(color: AppColors.grey),
                // helperMaxLines: 2,
                // contentPadding: const EdgeInsets.symmetric(vertical: AppPadding.p8,),
                hintText: AppStrings.phone,

                constraints: BoxConstraints.expand(height: 100),
                // prefixIconConstraints: BoxConstraints.expand(height: 45),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
