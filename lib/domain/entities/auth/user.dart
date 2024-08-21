class UserEntity {
  String ?  userId;
  String ? fullName;
  String ? email;

  UserEntity({
    required this.userId,
    this.fullName,
    this.email});
}