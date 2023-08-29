class SignDTO {
  SignDTO({required this.signName, required this.id});
  final String signName;
  final int id;

  factory SignDTO.fromJson(final Map<String, dynamic> json) {
    return SignDTO(signName: json["signName"] as String, id: json["id"] as int);
  }
}
