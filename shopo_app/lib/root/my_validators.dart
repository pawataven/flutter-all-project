class MyValidators {
  static String? displayNamevalidator(String? displayName) {
    if (displayName == null || displayName.isEmpty) {
      return 'Display name cannot be empty';
    }
    if (displayName.length < 3 || displayName.length > 20) {
      return 'Display name must be between 3 and 20 characters';
    }

    return null; // Return null if display name is valid
  }

  static String? emailValidator(String? value) {
    if (value!.isEmpty) {
      return 'กรุณากรอกอีเมล์';
    }
    if (!RegExp(
      r'\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Z|a-z]{2,}\b',
    ).hasMatch(value)) {
      return 'กรุณากรอกอีเมล์ที่ถูกต้อง';
    }
    return null;
  }

  static String? passwordValidator(String? value) {
    if (value!.isEmpty) {
      return 'กรุณากรอกรหัสผ่าน';
    }
    if (value.length < 6) {
      return "รหัสผ่านต้องมีความยาวอย่างน้อย 6 ตัวอักษร";
    }
    return null;
  }

  static String? repeatPasswordValidator({String? value, String? password}) {
    if (value != password) {
      return 'รหัสผ่านไม่ตรงกัน';
    }
    return null;
  }

  static String? uploadProdTexts({String? value, String? toBeReturnedString}) {
    if (value!.isEmpty) {
      return toBeReturnedString;
    }
    return null;
  }
}
