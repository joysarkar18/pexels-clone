import 'package:pexels/api/feth_data.dart';
import 'package:pexels/models/photo_model.dart';

Future<List<PhotoModel>> fetchPhotos(
    {required int page, required int perPage}) async {
  Map<String, dynamic> responce = await fetchData(page, perPage);
  List<dynamic> rawPhotoList = responce["photos"];
  List<PhotoModel> photoList =
      rawPhotoList.map((e) => PhotoModel.fromJson(e)).toList();

  return photoList;
}
