import 'package:flutter/material.dart';
import 'package:tugas_motionintern_week_3/model/kategori.dart';

class CartPage extends StatefulWidget {
  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  List<int> quantities = List<int>.filled(kategorigrid.length, 1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 217, 214, 214),
      appBar: AppBar(
        title: Text('Keranjang'),
        backgroundColor: Color.fromARGB(255, 156, 153, 153),
      ),
      body: ListView.builder(
        itemCount: kategorigrid.length + 1,
        itemBuilder: (context, index) {
          if (index == kategorigrid.length) {
            return buildTotalPayment();
          } else {
            return buildCartCard(index);
          }
        },
      ),
    );
  }

  Widget buildCartCard(int index) {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 10,
      ),
      decoration: BoxDecoration(
        border: Border.all(
          color: Color.fromARGB(255, 171, 142, 25),
          width: 2.5,
        ),
        boxShadow: [
          BoxShadow(
            color: const Color.fromARGB(255, 244, 235, 235),
            blurRadius: 1,
            offset: Offset(2.6, 2.7),
          ),
        ],
        color: Color.fromARGB(255, 237, 226, 226),
        borderRadius: index == 0 || index % 2 == 0
            ? BorderRadius.only(
                topRight: Radius.circular(65),
                bottomLeft: Radius.circular(65),
              )
            : BorderRadius.only(
                topLeft: Radius.circular(65),
                bottomRight: Radius.circular(65),
              ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.all(8),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                "assets/images/${kategorigrid[index].imageUrl}",
                height: 80,
                width: 165,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  kategorigrid[index].namalengkap,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                  textAlign: TextAlign.center,
                ),
                Text(
                  kategorigrid[index].harga,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: Icon(Icons.add),
                onPressed: () {
                  setState(() {
                    quantities[index]++;
                  });
                },
              ),
              Text(
                quantities[index].toString(),
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              IconButton(
                icon: Icon(Icons.remove),
                onPressed: () {
                  setState(() {
                    if (quantities[index] > 1) {
                      quantities[index]--;
                    }
                  });
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildTotalPayment() {
    double totalPayment = 0;

    // Hitung total pembayaran berdasarkan jumlah dan harga
    for (int i = 0; i < kategorigrid.length; i++) {
      totalPayment += quantities[i] *
          double.parse(kategorigrid[i].harga.replaceAll(RegExp(r'[^\d.]'), ''));
    }

    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        border: Border.all(
          color: Color.fromARGB(255, 171, 142, 25),
          width: 1.5,
        ),
        boxShadow: [
          BoxShadow(
            color: const Color.fromARGB(255, 244, 235, 235),
            blurRadius: 1,
            offset: Offset(2.6, 2.7),
          ),
        ],
        color: Color.fromARGB(255, 227, 233, 215),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Total Pembayaran',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          SizedBox(height: 10),
          Text(
            '\$ ${totalPayment.toStringAsFixed(0)} M',
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey,
            ),
          ),
          SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              // Tambahkan logika checkout di sini
            },
            child: Text('Checkout'),
          ),
        ],
      ),
    );
  }
}
