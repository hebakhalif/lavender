class Validators {
  static String? required(String? value, String message) {
    if (value == null || value.trim().isEmpty) {
      return message;
    }
    return null;
  }

  static String? minLength(String? value, int length, String message) {
    if (value != null && value.length < length) {
      return message;
    }
    return null;
  }

  static String? email(String? value) {
    if (value == null || value.isEmpty) return 'الإيميل مطلوب';
    final emailRegex = RegExp(r'^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(value)) return 'إيميل غير صالح';
    return null;
  }
}
