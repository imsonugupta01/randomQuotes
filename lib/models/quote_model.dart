class Quote {
  final String id;
  final String content;
  final String author;
  final String authorSlug;
  final int length;
  final List<String> tags;

  Quote({
    required this.id,
    required this.content,
    required this.author,
    required this.authorSlug,
    required this.length,
    required this.tags,
  });

  factory Quote.fromJson(Map<String, dynamic> json) {
    return Quote(
      id: json["id"] ?? "unknown",
      content: json["q"],
      author: json["a"],
      authorSlug: json["a"].toLowerCase().replaceAll(" ", "-"),
      length: json["q"].length,
      tags: ["motivational"],
    );
  }
}
