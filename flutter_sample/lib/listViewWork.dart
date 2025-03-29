import 'package:flutter/material.dart';

class MylistViewWork extends StatelessWidget {
  const MylistViewWork({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('รายชื่อเพื่อนของ นายภวัฒ 1130'),
          centerTitle: true,
        ),
        body: ListView(
          scrollDirection: Axis.vertical,
          padding: const EdgeInsets.all(20),
          children: buildListTiles(context),
        ),
      );

  List<Widget> buildListTiles(BuildContext context) {
    var friends = [
      {
        'name': 'พีรพัฒ เเก้วธานี',
        'nickname': 'โฟค',
        'height': '175 ซม.',
        'weight': '65 กก.',
        'hobby': 'เดินป่า ล่าคนป่า กับ ภวัฒ',
      },
      {
        'name': 'ชาคริต อสังกรุณา',
        'nickname': 'บลู',
        'height': '180 ซม.',
        'weight': '70 กก.',
        'hobby': 'เล่นเกม TFT , MARVEL',
      },
      {
        'name': 'บัณฑิต ทองประเสริฐ',
        'nickname': 'เซฟ',
        'height': '168 ซม.',
        'weight': '60 กก.',
        'hobby': 'กินเเล้วนอน, ทำการบ้านคณิต',
      },
    ];

    var leadingicons = [Icons.person, Icons.person, Icons.person];

    var list = <Widget>[];

    for (int i = 0; i < friends.length; i++) {
      list.add(
        ListTile(
          leading: Icon(
            leadingicons[i],
            size: 36,
          ),
          title: Text(friends[i]['name']!),
          subtitle: Text(friends[i]['nickname']!),
          iconColor: Colors.orangeAccent,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 5,
          ),
          trailing: IconButton(
            icon: const Icon(Icons.arrow_forward_rounded),
            onPressed: () => _showinfoFriends(context, friends[i]),
          ),
          tileColor: const Color.fromARGB(255, 255, 255, 255),
          shape: RoundedRectangleBorder(
              side: const BorderSide(
                width: 1,
                color: Colors.blueGrey,
              ),
              borderRadius: BorderRadius.circular(10)),
        ),
      );
      list.add(const SizedBox(
        height: 10,
      ));
    }
    return list;
  }

  void _showinfoFriends(BuildContext context, Map<String, String> friend) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(friend['name']!,textAlign: TextAlign.center,),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('ส่วนสูง: ${friend['height']}'),
            Text('น้ำหนัก: ${friend['weight']}'),
            Text('สิ่งที่ชอบ: ${friend['hobby']}'),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('ปิดหน่าต่างป็อปอัพ'),
          ),
        ],
      ),
    );
  }
}
