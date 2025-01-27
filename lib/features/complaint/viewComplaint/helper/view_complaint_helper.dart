import 'package:customer_connect/features/complaint/viewComplaint/domain/model/complaint_model.dart';
import 'package:customer_connect/service/Apis.dart';
import 'package:customer_connect/service/server_request.dart';

class ViewComplaintHelper {

  static Future<dynamic> fetchComplaintData(
      {required String schema, required String dmaId})  async {
    try{
      String queryString =
          Uri(queryParameters: {
            "schema" : schema,
            "dma_id" : dmaId,
          }).query;
      var url = Apis.complaints + '?' + queryString;
      var res =  await ServerRequest.getData(urlEndPoint: url);
      if(res != null && res['status'] == 200 && res['data'] != null) {
        return complaintListResponse(res['data']);
      }
      return null;
    }catch(_){}
    return null;
  }
}