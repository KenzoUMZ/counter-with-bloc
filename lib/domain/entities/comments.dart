class Comments {
  final int? postId;
  final int? id;
  final String? name;
  final String? email;
  final String? body;

  const Comments({
    this.postId = 0,
    this.id = 0,
    this.name = '',
    this.email = '',
    this.body = '',
  });

  factory Comments.fromJson(Map<String, dynamic> json){
    return Comments(
      postId: json['postId'] as int,
      id: json['id'] as int,
      name: json['name'] as String,
      email: json['email'] as String,
      body: json['body'] as String,
    );
  }
}