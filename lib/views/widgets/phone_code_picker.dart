import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_multi_formatter/formatters/masked_input_formatter.dart';
import 'package:realfitzclient/constants/strings.dart';
import 'package:realfitzclient/views/resources/values_manager.dart';

import '../resources/colors_manager.dart';
import '../styles/text_styles.dart';

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
    return TextFormField(
      autofocus: true,
      inputFormatters: [MaskedInputFormatter('# ## ## ## ## ### ######')],
      controller: controller,
      validator: validator,
      keyboardType: TextInputType.phone,
      decoration: InputDecoration(
        helperText:
            AppStrings.youWillUseThisNumberForAccountRecoveryOrOTPSignIn,
        helperStyle: regularTextStyle.copyWith(color: AppColors.grey),
        helperMaxLines: 2,
        contentPadding: const EdgeInsets.symmetric(vertical: AppPadding.p0),
        hintText: AppStrings.phone,
        hintStyle: regularTextStyle,
        prefix: CountryCodePicker(
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
    );
  }
}
