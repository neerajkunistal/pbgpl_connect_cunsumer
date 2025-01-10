import 'package:customer_connect/features/selfBillHistory/domain/model/self_bill_model.dart';
import 'package:customer_connect/service/Apis.dart';
import 'package:customer_connect/service/server_request.dart';

class BillRequestHelper {

  static Future<dynamic> fetchSelfBillingData(
      {required String schema, required String dmaId}) async {

    try{
      String url =  Apis.getSelfBillingApi+"?schema=${schema}&dma_id=${dmaId}";
      var res =  await ServerRequest.getData(urlEndPoint: url);
      if(res != null && res['data'] != null && res['status'] == "success"){
        return selfBillingHistoryResponse(res['data']);
      }
      return null;
    }catch(_){}
    return null;
  }
}