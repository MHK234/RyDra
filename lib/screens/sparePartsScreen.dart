import 'package:flutter/material.dart';
import 'package:rydra/components/bottomNavBar.dart';
import 'package:rydra/components/topNavBar.dart';

class SparePartsScreen extends StatefulWidget {
  const SparePartsScreen({Key? key}) : super(key: key);
  static const routeName = "/spareParts";

  @override
  State<SparePartsScreen> createState() => _SparePartsScreenState();
}

class _SparePartsScreenState extends State<SparePartsScreen> {
  final categories = ["All Parts", "Parts", "Electrical", "Suspension"];
  String selectedCat = "All Parts";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100),
        child: SafeArea(
          child: Column(children: [SizedBox(height: 18), topnavbar()]),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        shape: const CircleBorder(),
        child: const Icon(Icons.add, color: Colors.black),
        onPressed: () {},
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // SEARCH BAR
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            height: 45,
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                const Icon(Icons.search),
                const SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    decoration: const InputDecoration(
                      hintText: "Search for part name or number...",
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 12),

          // CATEGORY BUTTONS
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(categories.length, (index) {
                final active = categories[index] == selectedCat;
                return Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: GestureDetector(
                    onTap: () =>
                        setState(() => selectedCat = categories[index]),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: active ? Colors.red : Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Text(
                        categories[index],
                        style: TextStyle(
                          color: active ? Colors.white : Colors.black,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),

          const SizedBox(height: 20),

          // PRODUCT ITEMS
          _productCard(
            img: "assets/images/logo.png",
            title: "Honda CB350 Oil Filter",
            part: "Part # 15400-KFO-505",
            price: "350",
          ),

          _productCard(
            img: "assets/images/logo.png",
            title: "Oil Change - 10000 KM Svc",
            part: "Part # 15400-KFO-505",
            price: "350",
          ),

          _productCard(
            img: "assets/images/logo.png",
            title: "Oil Change & Filter",
            part: "Part # 15400-KFO-505",
            price: "35",
          ),
        ],
      ),

      bottomNavigationBar: bottomNavbar(),
    );
  }

  Widget _productCard({
    required String img,
    required String title,
    required String part,
    required String price,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(.07), blurRadius: 7),
        ],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Image.asset(img, width: 50),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 5),
                Text(
                  part,
                  style: const TextStyle(
                    color: Colors.black54,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const Text(
                  "Genuine OEM replacement part for optimal performance.",
                  style: TextStyle(fontSize: 13, color: Colors.black45),
                ),
              ],
            ),
          ),
          Text(
            "₹ $price",
            style: const TextStyle(
              color: Colors.red,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.add_circle, color: Colors.red),
          ),
        ],
      ),
    );
  }
}
