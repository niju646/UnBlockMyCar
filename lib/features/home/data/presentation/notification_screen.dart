import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:unblockmycar/shared/common_banner.dart';
import 'package:unblockmycar/shared/common_card.dart';
import 'package:unblockmycar/shared/common_text.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

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
                      Text(
                        "Mark all read",
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
            ],
            flexibleSpace: FlexibleSpaceBar(
              titlePadding: const EdgeInsets.only(
                left: 50,
                bottom: 40,
                top: 70,
              ),
              title: CommonText(
                name: "Notifications",
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
                  padding: const EdgeInsets.only(left: 50, bottom: 20),
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: CommonText(
                      name: "5 unread notifications",
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
                padding: EdgeInsets.only(left: 16, right: 16, top: 10),
                child: CommonCard(
                  isCrown: false,
                  icon: Icons.shield_outlined,
                  title: "Insurance Expiring Soon",
                  subtitle:
                      "Your vehicle insurance will\n expire soon on 2026-02-12 ",
                  lines: 2,
                ),
              );
            }, childCount: 6),
          ),

          SliverToBoxAdapter(
            child: Padding(
              // padding: const EdgeInsets.symmetric(horizontal: 16),
              padding: EdgeInsets.all(16),
              child: CommonBanner(
                icon: Icons.notifications_none,
                title:
                    "Notification are generated based on your added\nvehicle's insurance and challan status.Keep your\n vehicles updated for accurate alerts",
              ),
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 40)),
        ],
      ),
    );
  }
}
