import 'package:flutter/material.dart';
import 'package:tugas_motionintern_week_3/model/kategori.dart';

class grid extends StatelessWidget {
  final int index;

  grid(this.index);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 50),
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: Color.fromARGB(255, 143, 74, 74),
                blurRadius: 1,
                offset: Offset(8, 8)),
          ],
          color: Color.fromARGB(255, 247, 243, 243),
          border: Border.all(
              color: const Color.fromARGB(255, 99, 82, 82), width: 3),
          borderRadius: index == 0 || index % 3 == 0
              ? BorderRadius.only(
                  topRight: Radius.circular(100),
                  bottomLeft: Radius.circular(100),
                )
              : BorderRadius.only(
                  topLeft: Radius.circular(100),
                  bottomRight: Radius.circular(100),
                )),
      child: Column(
        children: [
          Image(
            image: AssetImage("assets/images/${kategorigrid[index].imageUrl}"),
            width: 180,
            height: index % 3 == 0 ? 100 : 200,
            fit: BoxFit.contain,
          ),
          SizedBox(
            height: 4,
          ),
          Text(
            kategorigrid[index].nama,
            style: TextStyle(
                color: Colors.black, fontSize: 22, fontWeight: FontWeight.w500),
          ),
          SizedBox(
            height: 4,
          ),
          Text(
            kategorigrid[index].harga,
            style: TextStyle(
                color: const Color.fromARGB(255, 148, 71, 71),
                fontSize: 22,
                fontWeight: FontWeight.w500),
          )
        ],
      ),
    );
  }
}
