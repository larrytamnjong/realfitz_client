import 'package:form_field_validator/form_field_validator.dart';

import '../constants/strings.dart';

RequiredValidator requiredValidator =
    RequiredValidator(errorText: AppStrings.required);
MultiValidator emailValidator = MultiValidator([
  RequiredValidator(errorText: AppStrings.required),
  EmailValidator(errorText: AppStrings.invalidEmail)
]);

MultiValidator phoneValidator = MultiValidator([
  RequiredValidator(errorText: AppStrings.required),
  MinLengthValidator(6, errorText: AppStrings.invalidLength),
  MaxLengthValidator(15, errorText: AppStrings.invalidLength),
  PatternValidator(r'^(?=.*?[0-9])', errorText: AppStrings.invalidCharacter),
]);
