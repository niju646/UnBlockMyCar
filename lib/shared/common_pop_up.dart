import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:unblockmycar/shared/common_text.dart';

class CommonPopUp extends StatefulWidget {
  final String title;
  final String subtitle;
  final String iconText;
  final bool iscancel;
  final VoidCallback? onPressed;
  const CommonPopUp({
    super.key,
    required this.subtitle,
    required this.title,
    required this.iconText,
    this.onPressed,
    this.iscancel = true,
  });

  @override
  State<CommonPopUp> createState() => _CommonPopUpState();
}

class _CommonPopUpState extends State<CommonPopUp>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _scaleAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOutBack,
    );
    _fadeAnimation = CurvedAnimation(parent: _controller, curve: Curves.easeIn);
    _controller.forward();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _fadeAnimation,
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: Dialog(
          insetPadding: const EdgeInsets.symmetric(
            horizontal: 24,
            vertical: 24,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          backgroundColor: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: IntrinsicHeight(
              child: Column(
                mainAxisSize: MainAxisSize.min, // ⭐ important
                children: [
                  const SizedBox(height: 12),

                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.blue[50],
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Icon(
                      Icons.warning_amber_rounded,
                      size: 30,
                      color: Colors.amber,
                    ),
                  ),

                  const SizedBox(height: 16),

                  CommonText(
                    name: widget.title,
                    font: FontWeight.bold,
                    fontsize: 20,
                    align: TextAlign.center,
                  ),

                  const SizedBox(height: 12),

                  CommonText(name: widget.subtitle, align: TextAlign.center),

                  const SizedBox(height: 24),

                  Row(
                    children: [
                      if (widget.iscancel) ...[
                        Expanded(
                          child: OutlinedButton(
                            onPressed: () => context.pop(),
                            style: OutlinedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(vertical: 14),
                              side: BorderSide(
                                color: Colors.grey.shade300,
                                width: 1.5,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            child: CommonText(
                              name: "Cancel",
                              fontsize: 15,
                              font: FontWeight.w600,
                              textcolor: Colors.grey.shade700,
                            ),
                          ),
                        ),
                        const SizedBox(width: 16),
                      ],

                      Expanded(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF0F6E8C),
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(vertical: 14),
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          onPressed: widget.onPressed,
                          child: Text(
                            widget.iconText,
                            style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
