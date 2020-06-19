import 'package:dio/dio.dart';
import 'dart:convert' as convert;

Dio dio = Dio();

// 获取轮播图数据
Future<List> getSwiperData() async {
  var dataRes = await dio
      .get('https://ichat.3g.ifeng.com/interface/getslide?format=json');
  var _swiperDataStr = dataRes.data;
  Map _swiperDataJson = convert.jsonDecode(_swiperDataStr);

  return _swiperDataJson['data']['data'];
}

// 获取所有栏目数据
Future<List> getColumnsList() async {
  var dataRes = await dio.get(
      'https://ichat.3g.ifeng.com/interface/getcolumnlist?format=json&recommend=1');
  var _columnsDataStr = dataRes.data;
  Map _columnsDataJson = convert.jsonDecode(_columnsDataStr);

  return _columnsDataJson['data']['data'];
}

// 获取直播间列表
Future<List> getLiveList(Map pagination) async {
  var dataRes = await dio.get(
      'https://ichat.3g.ifeng.com/interface/getlivelist?format=json&page=${pagination["page"]}&pagesize=${pagination["pageSize"]}');
  var _columnsDataStr = dataRes.data;
  Map _columnsDataJson = convert.jsonDecode(_columnsDataStr);

  return _columnsDataJson['data']['data'];
}
