import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:unblockmycar/features/home/widgets/floating_action2.dart';
import 'package:unblockmycar/shared/common_banner.dart';
import 'package:unblockmycar/shared/common_icon.dart';
import 'package:unblockmycar/shared/common_text.dart';
import 'package:unblockmycar/shared/status_chip.dart';
import 'package:unblockmycar/shared/vehicle_card.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeOut),
    );

    _slideAnimation =
        Tween<Offset>(begin: const Offset(0, 0.3), end: Offset.zero).animate(
          CurvedAnimation(
            parent: _animationController,
            curve: Curves.easeOutCubic,
          ),
        );

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(color: Colors.white),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // First container - Header
              FadeTransition(
                opacity: _fadeAnimation,
                child: Container(
                  padding: const EdgeInsets.all(30),
                  width: double.infinity,
                  height: 200,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [Color(0xFF0A3D62), Color(0xFF0F6E8C)],
                    ),
                  ),
                  child: Row(
                    children: [
                      CommonIcon(
                        onPressed: () {
                          context.pop();
                        },
                        icon: Icons.arrow_back_ios,
                        color: Colors.white,
                      ),
                      const SizedBox(width: 40),
                      const CommonText(
                        name: "Profile",
                        font: FontWeight.bold,
                        textcolor: Colors.white,
                        fontsize: 20,
                      ),
                    ],
                  ),
                ),
              ),

              // Floating Card - Now inside ScrollView
              Transform.translate(
                offset: const Offset(0, -50),
                child: SlideTransition(
                  position:
                      Tween<Offset>(
                        begin: const Offset(0, -0.5),
                        end: Offset.zero,
                      ).animate(
                        CurvedAnimation(
                          parent: _animationController,
                          curve: Curves.elasticOut,
                        ),
                      ),
                  child: FadeTransition(
                    opacity: _fadeAnimation,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: FloatingCard2(
                        name: "Guest User",
                        subtitle: "Manage Your vehicles",
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),

              // Second container - Content
              Transform.translate(
                offset: const Offset(0, -50),
                child: SlideTransition(
                  position: _slideAnimation,
                  child: FadeTransition(
                    opacity: _fadeAnimation,
                    //vehicle card
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      color: Colors.white,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              CommonText(name: "My Vehicles", fontsize: 18),
                              Spacer(),
                              Container(
                                padding: EdgeInsets.all(8),
                                width: 70,
                                height: 40,
                                decoration: BoxDecoration(
                                  color: Colors.blue[50],
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: Row(
                                  children: [
                                    Icon(Icons.add, size: 20),
                                    SizedBox(height: 10),
                                    CommonText(name: "Add"),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 20),

                          //vehicle card
                          VehicleCard(
                            title: "KL-07_AB-1234",
                            subtitle: "Hyundai Creta",
                            widget: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,

                              children: [
                                StatusChip(
                                  text: "Expiring",
                                  bgColor: Colors.amber[100]!,
                                  textColor: Colors.amber[800]!,
                                ),
                                const SizedBox(height: 6),
                                StatusChip(
                                  text: "1 Challan",
                                  bgColor: Colors.red[100]!,
                                  textColor: Colors.red[700]!,
                                ),
                              ],
                            ),
                          ),

                          const SizedBox(height: 30),
                          CommonBanner(
                            icon: Icons.shield_outlined,
                            title:
                                "Your vehicle data is stored locally on your device\nand never shared",
                          ),

                          const SizedBox(height: 40),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
