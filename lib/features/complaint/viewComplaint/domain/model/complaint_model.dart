class ComplaintModel {

}

class ComplaintSaveRequestModel {
  final String? schema;
  final String? dmaId;
  final String? complainCat;
  final String? complainSubCat;
  final String? description;
  final String? priority;
  final String? attachedDoc;

  const ComplaintSaveRequestModel({
    this.schema,
    this.dmaId,
    this.complainCat,
    this.complainSubCat,
    this.description,
    this.priority,
    this.attachedDoc,
  });

  Map<String, String> toJson() {
    Map<String, String> map = {
      "schema": schema.toString().trim(),
      "dma_id": dmaId!.trim(),
      "complain_cat": complainCat.toString().trim(),
      "complain_subcat": complainSubCat.toString().trim(),
      "description": description.toString().trim(),
      "priority": priority.toString().trim(),
    };
    return map;
  }
}
