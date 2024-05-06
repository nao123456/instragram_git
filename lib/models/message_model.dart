class Message {
  String authorName;
  String authorImageUrl;
  String text;

  Message({
    required this.authorName,
    required this.authorImageUrl,
    required this.text,
  });
}

final List<Message> messages = [
  Message(
    authorName: '伏黒 恵（ふしぐろ めぐみ）',
    authorImageUrl: 'assets/images/user2.jpg',
    text: 'この写真が大好きです!!',
  ),
  Message(
    authorName: '狗巻 棘（いぬまき とげ）',
    authorImageUrl: 'assets/images/user4.jpg',
    text: 'みんな、ありがとう ：）',
  ),
  Message(
    authorName: '虎杖 悠仁（いたどり ゆうじ）',
    authorImageUrl: 'assets/images/user3.jpg',
    text: 'もっと投稿してくれるのを待ちきれません!',
  ),
  Message(
    authorName: 'パンダ',
    authorImageUrl: 'assets/images/user6.jpg',
    text: '良くやった',
  ),
  Message(
    authorName: '釘崎 野薔薇（くぎさき のばら）',
    authorImageUrl: 'assets/images/user5.jpg',
    text: 'あなたの最高の写真の 1 枚...',
  ),
  Message(
    authorName: '五条 悟（ごじょう さとる）',
    authorImageUrl: 'assets/images/user0.png',
    text: '一番好き!!',
  ),
  Message(
    authorName: '両面宿儺（りょうめんすくな）',
    authorImageUrl: 'assets/images/user1.jpg',
    text: 'とてもかわいい!!',
  ),
  Message(
    authorName: '🌵🔆mekumi',
    authorImageUrl: 'assets/images/user7.png',
    text: 'とてもかわいい!!',
  ),
];
