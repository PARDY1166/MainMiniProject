import 'package:get/get.dart';
import 'package:t_store/data/repositories/banners/banner_repository.dart';

import '../../shop/models/banner_modal.dart';

class BannerController extends GetxController {
  final carousalCurrentIndex = 0.obs;
  final RxList<BannerModel> banners = <BannerModel>[].obs;

  @override
  void onInit(){
    fetchBanners();
    super.onInit();
  }

  void updatePageIndicator(index) {
    carousalCurrentIndex.value = index;
  }

  Future<void> fetchBanners() async {
    try{
      final bannerRepo = Get.put(BannerRepository());
      final banners = await bannerRepo.fetchBanners();
      
      this.banners.assignAll(banners);
    }catch (e){
      throw "some error occured";
    }
  }
}
