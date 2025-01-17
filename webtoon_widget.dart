import 'package:flutter/material.dart';
import 'package:untitled1/screens/detail_screen.dart';

class Webtoon extends StatelessWidget {
  final String title, thumb, id;

  const Webtoon({
    super.key,
    required this.title,
    required this.thumb,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          //pushReplacement를 사용하면 뒤로 가기 버튼을 지울 수 있음.
          context,
          MaterialPageRoute(
            builder: (context) => DetailScreen(
              title: title,
              thumb: thumb,
              id: id,
            ),
            fullscreenDialog: true,
          ),
        );
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Hero(
            tag: id,
            child: Container(
              clipBehavior: Clip.hardEdge,
              margin: const EdgeInsets.symmetric(
                vertical: 5,
                horizontal: 5,
              ),
              width: 300,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 5,
                    offset: const Offset(10, 10),
                    color: Colors.black.withOpacity(0.6),
                  ),
                ],
              ),
              child: Image.network(
                thumb,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            title.replaceAll(RegExp('amp;'), ""), //amp; 삭제
            style: const TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}