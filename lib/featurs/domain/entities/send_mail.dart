class SendMessageEntities {
  String mail;
  String name;
  String phone;
  String message;

  SendMessageEntities(
      {required this.mail,
      required this.name,
      required this.phone,
      required this.message});
}

class SendMessageResponseEntities {
  String mail;
  String name;
  String phone;
  String message;
  String createdAt;
  String updatedAt;
  String id;

  SendMessageResponseEntities(
      {required this.mail,
      required this.name,
      required this.phone,
      required this.message,
      required this.createdAt,
      required this.updatedAt,
      required this.id});

}
