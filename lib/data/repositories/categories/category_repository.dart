import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:t_store/utils/exceptions/platform_exceptions.dart';

import '../../../features/shop/models/category_model.dart';
import '../../../firebase_storage_service.dart';
import '../../../utils/exceptions/firebase_exceptions.dart';

class CategoryRepository extends GetxController {
  static CategoryRepository get instance => Get.find();

  /// Variables
  final _db = FirebaseFirestore.instance;

  /// Get all categories
  Future<List<CategoryModel>> getAllCategories() async {
    try {
      final snapshot = await _db.collection('Categories').get();
      final list = snapshot.docs
          .map((document) => CategoryModel.fromSnapshot(document))
          .toList();
      return list;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'something went wrong';
    }
  }

  Future<void> uploadDummyData(List<CategoryModel> categories)async{
    try{
      final storage = Get.put(TFirebaseStorageService());

      for(var category in categories){
        final file = await storage.getImageDataFromAssets(category.image);
        final url = await storage.uploadImageData('Categories',file,category.name);
        category.image = url;
        await _db.collection("Categories").doc(category.id).set(category.toJson());
      }
    } on FirebaseException catch(e){
      throw TFirebaseException(e.code).message;
    }on PlatformException catch(e){
      throw TPlatformException(e.code).message;
    }catch (e){
      throw "something went wrong";
    }
  }

}
