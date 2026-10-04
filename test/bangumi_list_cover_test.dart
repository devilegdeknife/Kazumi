import 'package:flutter_test/flutter_test.dart';
import 'package:kazumi/modules/bangumi/bangumi_item.dart';

BangumiItem item(Map<String, String> images) => BangumiItem(
      id: 1,
      type: 2,
      name: 'n',
      nameCn: 'n',
      summary: '',
      airDate: '',
      airWeekday: 0,
      rank: 0,
      images: images,
      tags: const [],
      alias: const [],
      ratingScore: 0,
      votes: 0,
      votesCount: const [],
      info: '',
    );

void main() {
  test('list cover prefers the 400px common rendition', () {
    expect(
      item({'common': 'https://lain.bgm.tv/r/400/a.jpg', 'large': 'https://lain.bgm.tv/pic/a.jpg'}).listCover,
      'https://lain.bgm.tv/r/400/a.jpg',
    );
  });

  test('list cover falls back to large when common is missing', () {
    expect(item({'large': 'https://lain.bgm.tv/pic/a.jpg'}).listCover, 'https://lain.bgm.tv/pic/a.jpg');
    expect(item({'common': '', 'large': 'https://lain.bgm.tv/pic/a.jpg'}).listCover, 'https://lain.bgm.tv/pic/a.jpg');
    expect(item({}).listCover, '');
  });
}
