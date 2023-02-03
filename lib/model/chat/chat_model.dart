
class ChatModel {
  String name;
  String profilePhoto;
  String email;
  String uid;

  ChatModel(
      {required this.name,
      required this.email,
      required this.uid,
      required this.profilePhoto});

  Map<String, dynamic> toJson() => {
        "name": name,
        "profilePhoto": profilePhoto,
        "email": email,
        "uid": uid,
      };

  static ChatModel fromSnap(snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return ChatModel(
      email: snapshot['email'],
      profilePhoto: snapshot['profilePhoto'],
      uid: snapshot['uid'],
      name: snapshot['name'],
    );
  }
}
