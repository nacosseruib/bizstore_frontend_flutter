
class ChatModel {
  String? username;
  String? firstName;
  String? lastName;
  String? name;
  String? profilePhoto;
  String? email;
  String? uid;
  String chatMessage;
  String? seenStatusColor;
  String? dateTime;

  ChatModel(
      {
        this.name,
        this.username,
        this.firstName,
        this.lastName,
        this.email,
        required this.uid,
        this.profilePhoto,
        required this.chatMessage,
        this.seenStatusColor,
        this.dateTime,
      });

  Map<String, dynamic> toJson() => {
        "name": name,
        "username": username,
        "firstname": firstName,
        "lastname": lastName,
        "profilePhoto": profilePhoto,
        "email": email,
        "uid": uid,
        "chatMessage": chatMessage,
        "seenStatusColor": seenStatusColor,
        "dateTime": dateTime,
      };

  static ChatModel fromSnap(snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return ChatModel(
      name: snapshot['name'],
      username: snapshot['username'],
      firstName: snapshot['firstname'],
      lastName: snapshot['lastname'],
      email: snapshot['email'],
      profilePhoto: snapshot['profilePhoto'],
      uid: snapshot['uid'],
      chatMessage: snapshot['chatMessage'],
      seenStatusColor: snapshot['seenStatusColor'],
      dateTime: snapshot['dateTime'],
    );
  }

}

List<ChatModel> dummyChatModel = [

  ChatModel(
      username: "Stark",
      firstName: "Arya Stark",
      lastName: "Arya Stark",
      chatMessage: 'I wish GoT had better ending I wish GoT had better ending I wish GoT had better ending',
      seenStatusColor: '',
      profilePhoto: 'https://static-koimoi.akamaized.net/wp-content/new-galleries/2020/09/maisie-williams-aka-arya-stark-of-game-of-thrones-someone-told-me-in-season-three-that-i-was-going-to-kill-the-night-king001.jpg',
      email: 'testing@admin.com',
      uid: "1",
      dateTime: ''
  ),

  ChatModel(
      username: "Robb",
      firstName: "Robb",
      lastName: "Stark",
      chatMessage: 'Did you check Maisie\'s latest post?',
      seenStatusColor: '',
      profilePhoto: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRDXCC-UB67rk0HtbmrDvVsIGvnPfTAMc_tSg&usqp=CAU',
      email: 'testing@admin.com',
      uid: "2",
      dateTime: ''),

  ChatModel(
      username: "Jaqen",
      firstName: "Jaqen",
      lastName: "H'ghar",
      chatMessage: 'Valar Morghulis Valar Morghulis Valar Morghulis Valar Morghulis Valar Morghulis v Valar Morghulis Valar Morghulis',
      seenStatusColor: '',
      profilePhoto: 'https://static3.srcdn.com/wordpress/wp-content/uploads/2017/06/Jaqen-Hghar-Game-of-Thrones.jpg',
      email: 'testing@admin.com',
      uid: "3",
      dateTime: ''),

  ChatModel(
      username: "Sansa",
      firstName: "Jaqen",
      lastName: "Sansa",
      chatMessage: 'The North Remembers',
      seenStatusColor: '',
      profilePhoto: 'https://i.insider.com/5ce420e193a15232821d3084?width=700',
      email: 'testing@admin.com',
      uid: "4",
      dateTime: ''),

  ChatModel(
      username: "Snow",
      firstName: "Snow",
      lastName: "Jon",
      chatMessage: 'Stick em\' with the pointy end',
      seenStatusColor: '',
      profilePhoto: 'https://i.insider.com/5cb3c8e96afbee373d4f2b62?width=700',
      email: 'testing@admin.com',
      uid: "5",
      dateTime: ''),

  ChatModel(
      username: "wish",
      firstName: "wish",
      lastName: "Jon",
      chatMessage: 'I wish GoT had better ending',
      seenStatusColor: '',
      profilePhoto: 'https://i.insider.com/5cb3c8e96afbee373d4f2b62?width=700',
      email: 'testing@admin.com',
      uid: "6",
      dateTime: ''),

  ChatModel(
      username: "Robb",
      firstName: "wish",
      lastName: "Stark",
      chatMessage: 'Did you check Maisie\'s latest post?',
      seenStatusColor: '',
      profilePhoto: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRDXCC-UB67rk0HtbmrDvVsIGvnPfTAMc_tSg&usqp=CAU',
      email: 'testing@admin.com',
      uid: "7",
      dateTime: ''),

  ChatModel(
      username: "Robb",
      firstName: "wish",
      lastName: "Stark",
      chatMessage: 'Valar Morghulis',
      seenStatusColor: '',
      profilePhoto: 'https://static3.srcdn.com/wordpress/wp-content/uploads/2017/06/Jaqen-Hghar-Game-of-Thrones.jpg',
      email: 'testing@admin.com',
      uid: "8",
      dateTime: ''),

  ChatModel(
      username: "Robb",
      firstName: "wish",
      lastName: "Stark",
      chatMessage: 'The North Remembers',
      seenStatusColor: '',
      profilePhoto: 'https://i.insider.com/5ce420e193a15232821d3084?width=700',
      email: 'testing@admin.com',
      uid: "9",
      dateTime: ''),

  ChatModel(
      username: "Robb",
      firstName: "wish",
      lastName: "Stark",
      chatMessage: 'Stick em\' with the pointy end',
      seenStatusColor: '',
      profilePhoto: 'https://i.insider.com/5cb3c8e96afbee373d4f2b62?width=700',
      email: 'testing@admin.com',
      uid: "10",
      dateTime: ''),

  ChatModel(
      username: "Robb",
      firstName: "wish",
      lastName: "Stark",
      chatMessage: 'I wish GoT had better ending',
      seenStatusColor: '',
      profilePhoto: 'https://static-koimoi.akamaized.net/wp-content/new-galleries/2020/09/maisie-williams-aka-arya-stark-of-game-of-thrones-someone-told-me-in-season-three-that-i-was-going-to-kill-the-night-king001.jpg',
      email: 'testing@admin.com',
      uid: "11",
      dateTime: ''),

  ChatModel(
      username: "Robb",
      firstName: "wish",
      lastName: "Stark",
      chatMessage: 'Did you check Maisie\'s latest post?',
      seenStatusColor: '',
      profilePhoto: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRDXCC-UB67rk0HtbmrDvVsIGvnPfTAMc_tSg&usqp=CAU',
      email: 'testing@admin.com',
      uid: "12",
      dateTime: ''),

  ChatModel(
      username: "Robb",
      firstName: "wish",
      lastName: "Stark",
      chatMessage: 'Valar Morghulis',
      seenStatusColor: '',
      profilePhoto: 'https://static3.srcdn.com/wordpress/wp-content/uploads/2017/06/Jaqen-Hghar-Game-of-Thrones.jpg',
      email: 'testing@admin.com',
      uid: "13",
      dateTime: ''),

  ChatModel(
      username: "Robb",
      firstName: "wish",
      lastName: "Stark",
      chatMessage: 'The North Remembers',
      seenStatusColor: '',
      profilePhoto: 'https://i.insider.com/5ce420e193a15232821d3084?width=700',
      email: 'testing@admin.com',
      uid: "14",
      dateTime: ''),

  ChatModel(
      username: "Robb",
      firstName: "wish",
      lastName: "Stark",
      chatMessage: 'Stick em\' with the pointy end',
      seenStatusColor: '',
      profilePhoto: 'https://i.insider.com/5cb3c8e96afbee373d4f2b62?width=700',
      email: 'testing@admin.com',
      uid: "15",
      dateTime: ''),

  ChatModel(
      username: "Robb",
      firstName: "wish",
      lastName: "Stark",
      chatMessage: 'I wish GoT had better ending',
      seenStatusColor: '',
      profilePhoto: 'https://i.insider.com/5cb3c8e96afbee373d4f2b62?width=700',
      email: 'testing@admin.com',
      uid: "16",
      dateTime: ''),

  ChatModel(
      username: "Robb",
      firstName: "wish",
      lastName: "Stark",
      chatMessage: 'Did you check Maisie\'s latest post?',
      seenStatusColor: '',
      profilePhoto: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRDXCC-UB67rk0HtbmrDvVsIGvnPfTAMc_tSg&usqp=CAU',
      email: 'testing@admin.com',
      uid: "17",
      dateTime: ''),

  ChatModel(
      username: "Robb",
      firstName: "wish",
      lastName: "Stark",
      chatMessage: 'Valar Morghulis',
      seenStatusColor: '',
      profilePhoto: 'https://static3.srcdn.com/wordpress/wp-content/uploads/2017/06/Jaqen-Hghar-Game-of-Thrones.jpg',
      email: 'testing@admin.com',
      uid: "18",
      dateTime: ''),

  ChatModel(
      username: "Robb",
      firstName: "wish",
      lastName: "Stark",
      chatMessage: 'The North Remembers',
      seenStatusColor: '',
      profilePhoto: 'https://i.insider.com/5ce420e193a15232821d3084?width=700',
      email: 'testing@admin.com',
      uid: "19",
      dateTime: ''),

  ChatModel(
      username: "Robb",
      firstName: "wish",
      lastName: "Stark",
      chatMessage: 'Stick em\' with the pointy end',
      seenStatusColor: '',
      profilePhoto: 'https://i.insider.com/5cb3c8e96afbee373d4f2b62?width=700',
      email: 'testing@admin.com',
      uid: "20",
      dateTime: ''),

];
