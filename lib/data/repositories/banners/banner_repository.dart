import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../../../features/shop/models/banner_modal.dart';

class BannerRepository extends GetxController{
  static BannerRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  Future<List<BannerModel>> fetchBanners() async{
    try{
      final result = await _db.collection('Banners').where('Active',isEqualTo:true).get();
      return result.docs.map((documentSnapShot)=>BannerModel.fromSnapShot(documentSnapShot)).toList();
    }catch(e){
      throw "something went wrong";
    }
  }
}