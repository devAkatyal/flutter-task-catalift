import 'package:get/get.dart';
import '../models/mentor_model.dart';

class MentorsController extends GetxController {
  var topTabIndex = 1.obs;


  final RxList<Mentor> _allMentors = <Mentor>[
    Mentor(
      id: '1',
      imageUrl: 'https://fastly.picsum.photos/id/10/2500/1667.jpg?hmac=J04WWC_ebchx3WwzbM-Z4_KC_LeLBWr5LZMaAkWkF68',
      name: 'Gaurav Samant',
      rating: 4.9,
      sector: 'IT Sector',
      experience: '4 years',
      specialization: 'Business Administration',
      reviewCount: 175,
      description: 'Strategy Manager @CEO Office | Ex-eBay & L&T | MDI Gurgaon . ESCP Europe | 32+ National Case Comps Podiums',
      compatibility: 98,
    ),
    Mentor(
      id: '2',
      imageUrl: 'https://fastly.picsum.photos/id/567/200/200.jpg?hmac=S36MAHt-ylBTK3Xv7FsIbcN71oDHJpgvjWRzbRiBb48',
      name: 'Gaurav Samant',
      rating: 4.9,
      sector: 'IT Sector',
      experience: '4 years',
      specialization: 'Business Administration',
      reviewCount: 175,
      description: 'Strategy Manager @CEO Office | Ex-eBay & L&T | MDI Gurgaon . ESCP Europe | 32+ National Case Comps Podiums',
      compatibility: 82,
    ),
    Mentor(
      id: '3',
      imageUrl: 'https://fastly.picsum.photos/id/10/2500/1667.jpg?hmac=J04WWC_ebchx3WwzbM-Z4_KC_LeLBWr5LZMaAkWkF68',
      name: 'Gaurav Samant',
      rating: 4.9,
      sector: 'IT Sector',
      experience: '4 years',
      specialization: 'Business Administration',
      reviewCount: 175,
      description: 'Another description for a mentor.',
      compatibility: 75,
    ),
  ].obs;

  final RxList<Mentor> _myMentors = <Mentor>[
    Mentor(
      id: '10',
      imageUrl: 'https://fastly.picsum.photos/id/567/200/200.jpg?hmac=S36MAHt-ylBTK3Xv7FsIbcN71oDHJpgvjWRzbRiBb48',
      name: 'My Mentor One',
      rating: 4.8,
      sector: 'Finance',
      experience: '5 years',
      specialization: 'Investment Banking',
      reviewCount: 120,
      description: 'Experienced in finance and investment strategies.',
      compatibility: 95,
    ),
  ].obs;


  RxList<Mentor> get currentMentorList {
    if (topTabIndex.value == 0) {
      return _myMentors;
    } else {
      return _allMentors;
    }
  }

  void changeTopTabIndex(int index) {
    topTabIndex.value = index;
  }

  @override
  void onInit() {
    super.onInit();
  }
}