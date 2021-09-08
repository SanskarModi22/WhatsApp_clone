class ChatModel {
  final String? name;
  final bool? isGroup;
  final String? currentMessage;
  final String? time;
  final String? icon;

  ChatModel(
      {this.name, this.isGroup, this.currentMessage, this.time, this.icon});
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
