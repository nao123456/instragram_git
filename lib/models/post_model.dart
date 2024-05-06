class Post {
  String id;
  String authorName;
  String authorImageUrl;
  String timeAgo;
  String imageUrl;
  String message;
  String like;
  String msCount;
  String mark;

  Post(
      {required this.id,
      required this.authorName,
      required this.authorImageUrl,
      required this.timeAgo,
      required this.imageUrl,
      required this.message,
      required this.like,
      required this.msCount,
      required this.mark});
}

final List<Post> posts = [
  Post(
    authorName: '五条 悟（ごじょう さとる）',
    authorImageUrl: 'assets/images/user0.png',
    timeAgo: '5 min',
    imageUrl: 'assets/images/post0.jpg',
    message:
        '誕生日：1989年12月7日（射手座）、身長・体重：190cm以上、体重89kg東京呪術専門学校1年生クラスの家庭教師、28歳。四人の超魔術師の一人。',
    like: '4352',
    msCount: '259',
    id: '0',
    mark: 'a',
  ),
  Post(
    authorName: '伏黒 恵（ふしぐろ めぐみ）',
    authorImageUrl: 'assets/images/user2.jpg',
    timeAgo: '10 min',
    imageUrl: 'assets/images/post1.jpg',
    message:
        '誕生日：2002年12月22日（山羊座）、身長・体重：175cm、イタドリで体重を補うクラスメイト、禅学園の血を引く天才少年、東京呪術専門学校1年生の男子生徒、第 2 レベルの魔術師 (1 レベルの評価)。',
    like: '1366',
    msCount: '468',
    id: '1',
    mark: 'b',
  ),
  Post(
    authorName: '虎杖 悠仁（いたどり ゆうじ）',
    authorImageUrl: 'assets/images/user3.jpg',
    timeAgo: '20 min',
    imageUrl: 'assets/images/post2.jpg',
    message:
        '誕生日：2003年3月20日（魚座） 身長・体重：173cm、80kg ピンクと黒の2色の髪が特徴で、非常に運動神経が強く、超人的な身体能力を持った主人公です。',
    like: '16548',
    msCount: '3655',
    id: '2',
    mark: 'c',
  ),
  Post(
    authorName: '狗巻 棘（いぬまき とげ）',
    authorImageUrl: 'assets/images/user4.jpg',
    timeAgo: '1 hr',
    imageUrl: 'assets/images/post3.jpg',
    message:
        '誕生日は10月23日です。東京奇術高等学校の2年生で準一級の奇術師。いつも口を覆っている。呪文の達人で、言葉に呪文を込めることができる。他人を傷つけないように、おにぎりの具について話すことが多い。「鮭」は肯定、「カツオ」は「辛口」という意味否定的; 私の好きなおにぎりの味は「鮭のマヨネーズ」です。コミュニケーションが難しそうに見えますが、実はとても思いやりのある人です。',
    like: '1622',
    msCount: '584',
    id: '3',
    mark: 'd',
  ),
  Post(
    authorName: 'パンダ',
    authorImageUrl: 'assets/images/user6.jpg',
    timeAgo: '1 day',
    imageUrl: 'assets/images/post4.jpg',
    message:
        '誕生日は3月5日です。東京奇術高等学校の2年生で、2級手品師の卵。パンダのような姿をしているが、その正体はノクチュア校長の呪いであり、感情を持つことから「突然変異の呪い」と呼ばれ、通常の呪いとは異なり3つの核を持っている。',
    like: '822',
    msCount: '384',
    id: '4',
    mark: 'e',
  ),
];

final List<String> stories = [
  'assets/images/user0.png',
  'assets/images/user5.jpg',
  'assets/images/user6.jpg',
  'assets/images/user3.jpg',
  'assets/images/user4.jpg',
  'assets/images/user0.png',
  'assets/images/user1.jpg',
  'assets/images/user2.jpg',
  'assets/images/post0.jpg',
  'assets/images/post1.jpg',
  'assets/images/post2.jpg',
  'assets/images/post3.jpg',
];
