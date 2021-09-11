class ChatModel {
  final String? name;
  final bool? isGroup;
  final String? currentMessage;
  final String? time;
  final String? icon;
  final String? status;
   bool select=false;

  ChatModel(
      {this.select=false,this.status,this.name, this.isGroup, this.currentMessage, this.time, this.icon});
}
List<ChatModel> chats = [
  ChatModel(
    name: "Sanskar Modi",
    currentMessage: "Main hu Khalnayak",
    icon: "assets/person.svg",
    time: "7:32",
    isGroup: false,
  ),
  ChatModel(
    name: "Naman Agarwal",
    currentMessage: "Main hu ladka",
    icon: "assets/groups.svg",
    time: "7:36",
    isGroup: false,
  ),
  ChatModel(
    name: "Harsh Bokan",
    currentMessage: "Main padhaku",
    icon: "assets/person.svg",
    time: "7:38",
    isGroup: false,
  ),
];
List<ChatModel> contacts = [
  ChatModel(
    name: "Sanskar Modi",
    status:"App Developer"
  ),
  ChatModel(
    name: "Naman Agarwal",
    status: "Web Developer"
  ),
  ChatModel(
    name: "Harsh Bokan",
    status: "Software Developer"
  ),
];
