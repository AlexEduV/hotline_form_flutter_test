class CustomFormData {
  final String name;
  final String email;
  final String phone;

  const CustomFormData({
    required this.name,
    required this.email,
    required this.phone,
  });

  Map<String, dynamic> toMap() => <String, dynamic>{
      'name': name,
      'email': email,
      'phone': phone,
  };
}