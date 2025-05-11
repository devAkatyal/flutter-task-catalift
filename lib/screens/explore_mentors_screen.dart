import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/mentors_controller.dart';
import '../widgets/mentor_card.dart';
import '../utils/app_colors.dart';

class ExploreMentorsScreen extends StatelessWidget {
  ExploreMentorsScreen({Key? key}) : super(key: key);

  final MentorsController mentorsController = Get.put(MentorsController());

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFFFAFAFA),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Mentors',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w500,
                color: AppColors.primaryBlue,
              ),
            ),
            SizedBox(height: 16),
            Obx(() {
              final selectedIndex = mentorsController.topTabIndex.value;
              return Container(
                decoration: BoxDecoration(
                  color: AppColors.lightGrey,
                  borderRadius: BorderRadius.circular(12.0),
                ),
                padding: const EdgeInsets.all(4),
                child: Row(
                  children: List.generate(2, (index) {
                    final isSelected = selectedIndex == index;
                    final labels = ['My Mentors', 'Explore'];

                    return Expanded(
                      child: InkWell(
                        onTap: () => mentorsController.changeTopTabIndex(index),
                        borderRadius: BorderRadius.circular(8),
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 200),
                          curve: Curves.easeInOut,
                          height: 32,
                          decoration: BoxDecoration(
                            color:
                                isSelected
                                    ? AppColors.primaryBlue
                                    : Colors.transparent,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            labels[index],
                            style: TextStyle(
                              fontSize: 12,
                              color:
                                  isSelected
                                      ? Colors.white
                                      : AppColors.primaryBlue,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              );
            }),
            SizedBox(height: 16),
            SizedBox(
              height: 40,
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search',
                  hintStyle: const TextStyle(
                    color: Color(0xFFB0CBE7),
                  ),
                  prefixIcon: const Icon(
                    Icons.search,
                    color: Color(0xFFB0CBE7),
                  ),
                  filled: true,
                  fillColor: Color(0xFFFAFAFA),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0),
                    borderSide: const BorderSide(
                      color: Color(0xFFE7EFF7),
                      width: 1,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0),
                    borderSide: const BorderSide(
                      color: Color(0xFFE7EFF7),
                      width: 1.5,
                    ),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 0,
                    horizontal: 20,
                  ),
                ),
              ),
            ),
            SizedBox(height: 16),
            Expanded(
              child: Obx(() {
                if (mentorsController.currentMentorList.isEmpty) {
                  return Center(
                    child: Text(
                      mentorsController.topTabIndex.value == 0
                          ? 'No mentors in "My Mentors"'
                          : 'No mentors to explore yet.',
                    ),
                  );
                }
                return ListView.builder(
                  itemCount: mentorsController.currentMentorList.length,
                  itemBuilder: (context, index) {
                    final mentor = mentorsController.currentMentorList[index];
                    return MentorCard(mentor: mentor);
                  },
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
