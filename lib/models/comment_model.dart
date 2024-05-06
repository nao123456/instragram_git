class Comment {
  String authorName;
  String authorImageUrl;
  String text;
  String like;

  Comment({
    required this.authorName,
    required this.authorImageUrl,
    required this.text,
    required this.like,
  });
}

final List<Comment> comments = [
  Comment(
    authorName: '伏黒 恵（ふしぐろ めぐみ）',
    authorImageUrl: 'assets/images/user2.jpg',
    text: 'この写真が大好きです!!',
    like: 'm0',
  ),
  Comment(
    authorName: '虎杖 悠仁（いたどり ゆうじ）',
    authorImageUrl: 'assets/images/user3.jpg',
    text: 'あなたの最高の写真の 1 枚...',
    like: 'm1',
  ),
  Comment(
    authorName: '狗巻 棘（いぬまき とげ）',
    authorImageUrl: 'assets/images/user4.jpg',
    text: 'もっと投稿してくれるのを待ちきれません!',
    like: 'm2',
  ),
  Comment(
    authorName: '両面宿儺（りょうめんすくな）',
    authorImageUrl: 'assets/images/user1.jpg',
    text: '良くやった',
    like: 'm3',
  ),
  Comment(
    authorName: '五条 悟（ごじょう さとる）',
    authorImageUrl: 'assets/images/user0.png',
    text: 'みんな、ありがとう ：）',
    like: 'm4',
  ),
  Comment(
    authorName: 'パンダ',
    authorImageUrl: 'assets/images/user6.jpg',
    text: 'みんな、ありがとう ：）',
    like: 'm5',
  ),
];
