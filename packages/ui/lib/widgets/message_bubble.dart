import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/text_styles.dart';


class MessageBubble extends StatelessWidget {
final String message;
final bool isUser;


const MessageBubble({
super.key,
required this.message,
required this.isUser,
});


@override
Widget build(BuildContext context) {
return Align(
alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
child: Container(
margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 14),
decoration: BoxDecoration(
color: isUser ? AppColors.black : AppColors.white,
borderRadius: BorderRadius.circular(14),
border: Border.all(color: AppColors.black.withOpacity(0.2)),
),
child: Text(
message,
style: isUser
? AppTextStyles.body.copyWith(color: AppColors.white)
: AppTextStyles.body.copyWith(color: AppColors.black),
),
),
);
}
}