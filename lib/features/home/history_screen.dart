import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:unblockmycar/shared/common_text.dart';
import 'package:unblockmycar/shared/status_chip.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 155,
            pinned: true,
            backgroundColor: const Color(0xFF0A3D62),
            leading: GestureDetector(
              onTap: () => context.pop(),
              child: const Icon(Icons.arrow_back_ios, color: Colors.white),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 16),
                child: GestureDetector(
                  onTap: () {},
                  child: Row(
                    children: const [
                      Icon(
                        CupertinoIcons.delete,
                        size: 15,
                        color: Colors.white,
                      ),
                      SizedBox(width: 5),
                      Text("Clear", style: TextStyle(color: Colors.white)),
                    ],
                  ),
                ),
              ),
            ],
            flexibleSpace: FlexibleSpaceBar(
              titlePadding: const EdgeInsets.only(
                left: 50,
                bottom: 60,
                top: 70,
              ),
              title: CommonText(
                name: "History",
                fontsize: 18,
                textcolor: Colors.white,
              ),
              background: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Color(0xFF0A3D62), Color(0xFF0F6E8C)],
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 30, bottom: 20),
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: CommonText(
                      name: "5 notifications sent",
                      textcolor: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              return Padding(
                padding: EdgeInsets.only(
                  left: 16,
                  right: 16,
                  // bottom: 10,
                  top: 10,
                ),
                child: HistoryCard(),
              );
            }, childCount: 5),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 80)),
        ],
      ),
    );
  }
}

class HistoryCard extends StatelessWidget {
  const HistoryCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),

        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(39),
            blurRadius: 12,
            spreadRadius: 2,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.blue[50],
              borderRadius: BorderRadius.circular(20),
            ),
            child: Icon(CupertinoIcons.car_detailed),
          ),
          SizedBox(width: 10),
          Column(
            children: [
              CommonText(name: "KL-10-GH-3456", font: FontWeight.bold),
              CommonText(name: "Grey Tata Punch", textcolor: Colors.grey),
              SizedBox(height: 10),
              StatusChip(
                text: "Notification send",
                bgColor: Colors.grey.shade200,
                textColor: Colors.green,
              ),
            ],
          ),

          Spacer(),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.arrow_forward_ios, color: Colors.grey, size: 20),
          ),
        ],
      ),
    );
  }
}
