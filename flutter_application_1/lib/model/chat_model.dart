class ChatModel {
  String name = "";
  String comment = "";
  String avatar = " ";

  ChatModel({required this.name, required this.comment, required this.avatar});
}

List<ChatModel> listComment = [
  ChatModel(
      name: "James",
      comment: "Thank you! That very helpful!",
      avatar: "assets/images/Ellipse (1).png"),
  ChatModel(
      name: "Will Kenny",
      comment: "I know... I' trying to get the fund",
      avatar: "assets/images/Ellipse (2).png"),
  ChatModel(
      name: "Beth Williams",
      comment:
          "I'm looking for tips around capturing the milky way. I have a 6D with 24-100mm",
      avatar: "assets/images/Ellipse (3).png"),
  ChatModel(
      name: "Rev Shawn",
      comment:
          "Wanted to ask if you're available for a portrait shoot next week",
      avatar: "assets/images/Ellipse (4).png")
];
