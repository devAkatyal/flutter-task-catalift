import 'package:flutter/material.dart';
import '../models/mentor_model.dart';
import '../utils/app_colors.dart'; // Assuming you created this

class MentorCard extends StatelessWidget {
  final Mentor mentor;

  const MentorCard({Key? key, required this.mentor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 32,
                  backgroundImage: NetworkImage(mentor.imageUrl),
                  // Or AssetImage
                  backgroundColor: Colors.grey[300],
                ),
                const SizedBox(width: 16.0),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Icon(
                            Icons.star_border,
                            color: Color(0xFFA2C1B2),
                            size: 16,
                          ),
                          const SizedBox(width: 2.0),
                          Text(
                            mentor.rating.toString(),
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              color: Color(0xFFA2C1B2),
                            ),
                          ),
                          const SizedBox(width: 16.0),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8.0,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12.0),
                              border: Border.all(
                                color: AppColors.tagYellowText.withOpacity(0.5),
                              ),
                            ),
                            child: Text(
                              mentor.sector,
                              style: const TextStyle(
                                color: AppColors.tagYellowText,
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 2.0),
                      Text(
                        mentor.name,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4.0),
                      Row(
                        children: [
                          const Icon(
                            Icons.alarm,
                            size: 16,
                            color: AppColors.textLight,
                          ),
                          const SizedBox(width: 4.0),
                          Text(
                            mentor.experience,
                            style: const TextStyle(
                              fontSize: 13,
                              color: AppColors.textLight,
                            ),
                          ),
                          const SizedBox(width: 16.0),
                          const Icon(
                            Icons.work_outline,
                            size: 16,
                            color: AppColors.textLight,
                          ),
                          const SizedBox(width: 4.0),
                          Expanded(
                            // To prevent overflow if text is long
                            child: Text(
                              mentor.specialization,
                              style: const TextStyle(
                                fontSize: 13,
                                color: AppColors.textLight,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4.0),
                      Row(
                        children: [
                          const Icon(
                            Icons.chat_outlined,
                            size: 16,
                            color: AppColors.textLight,
                          ),
                          const SizedBox(width: 4.0),
                          Text(
                            '${mentor.reviewCount} Reviews',
                            style: const TextStyle(
                              fontSize: 13,
                              color: AppColors.primaryBlue,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8.0),
                      Text(
                        mentor.description,
                        style: TextStyle(
                          fontSize: 12,
                          color: Color(0xFF888888),
                          height: 1.4,
                        ),
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 12.0),
                      Row(children: [
                        Text(
                          '${mentor.compatibility}%',
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: AppColors.compatibilityGreen,
                          ),
                        ),
                        Text(
                          ' compatibility',
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: AppColors.compatibilityGreen,
                          ),
                        ),
                      ],)
                    ],
                  ),
                ),
              ],
            ),

          ],
        ),
      ),
    );
  }
}
