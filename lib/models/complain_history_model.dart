class ComplainHistoryModel {
  int? status;
  bool? error;
  List<Data>? data;

  ComplainHistoryModel({this.status, this.error, this.data});

  ComplainHistoryModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    error = json['error'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['error'] = this.error;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? id;
  String? dmaId;
  String? complainNo;
  String? dateOfComplaint;
  String? alternateContact;
  String? source;
  String? complainCat;
  String? complainSubcat;
  String? additionalComments;
  String? complaintReference;
  String? attendedDate;
  String? escalatedDate;
  String? escalatedDepartment;
  String? assignedBy;
  String? coOrdinater;
  String? closedBy;
  String? currentStatus;
  String? complaintDoc;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;
  String? uid;
  String? meter;
  String? description;
  String? attachedDoc;
  String? email;
  String? mobileNumber;
  String? actionStatus;
  String? technician;
  String? priority;
  String? remarksForCoordinater;
  String? remarksForTechnician;
  String? tankerRequired;
  String? tankerRequiredDate;
  String? tankerSend;
  String? tankerSendDate;
  String? areaId;
  String? firstName;
  String? middleName;
  String? lastName;
  String? guardianName;
  String? emailId;
  String? propertyCategoryId;
  String? propertyClassId;
  String? houseNumber;
  String? locality;
  String? town;
  String? district;
  String? state;
  String? pinCode;
  String? societyAllowedMdpe;
  String? residentStatus;
  String? noOfKitchen;
  String? noOfBathroom;
  String? existingCookingFuel;
  String? noOfFamilyMembers;
  String? ownerConsent;
  String? kycDocument1;
  String? kycDocument1Number;
  String? kycDocument2;
  String? kycDocument2Number;
  String? kycDocument3;
  String? kycDocument3Number;
  String? formStatus;
  String? dmaUserId;
  String? remarks;
  String? longitude;
  String? latitude;
  String? cgs;
  String? chargeAreaId;
  String? dateOfRegistration;
  String? nameOfBank;
  String? bankAccountNumber;
  String? bankIfscCode;
  String? bankAddress;
  String? dmaFormStatus;
  String? customerConsentStatus;
  String? reasonForHold;
  String? initialDepositeDate;
  String? modeOfDeposite;
  String? installmentNumber;
  String? payementBankName;
  String? paymentCreditStatus;
  String? dmaUserName;
  String? initialDepositeStatus;
  String? preferedBillingMode;
  String? acceptConversionPolicy;
  String? acceptExtraFittingCost;
  String? customerRegistrationNo;
  String? chequeNumber;
  String? marketingApprovStatus;
  String? accountApprovStatus;
  String? initialAmount;
  String? customerConsent;
  String? canceledCheque;
  String? crn;
  String? customerPhoto;
  String? housePhoto;
  String? kycDocument1Image;
  String? kycDocument2Image;
  String? kycDocument3Image;
  String? buildingNumber;
  String? address2;
  String? backside1;
  String? backside2;
  String? backside3;
  String? chequeBankAccount;
  String? chequePhoto;
  String? marketingApproval;
  String? markStatusTime;
  String? marketingRejectReason;
  String? accountingApproval;
  String? accountingTime;
  String? accontingRejectReason;
  String? isGasDepositApplicable;
  String? depositeType;
  String? depositSlipDate;
  String? depositSlip;
  String? transactionId;
  String? transactionTime;
  String? transactionResponseTime;
  String? bpNumber;
  String? interested;
  String? assignLmcId;
  String? refundedAmount;
  String? refundOrderid;
  String? isGasdepositCollected;
  String? typeOfRequest;
  String? propertyType;
  String? customerPlotArea;
  String? builtUpArea;
  String? existingHscDetails;
  String? sourceOfWater;
  String? waterTankCapacity;
  String? arnNo;
  String? kNo;
  String? alternateMobile;
  String? wardNumber;
  String? fromNode;
  String? toNode;
  String? parentId;
  String? title;
  String? escalationDays;
  String? complaintMobiles;
  String? name;
  String? address;
  String? phoneNumber;
  String? password;
  String? userAreaMappingTable;
  String? areaMappingId;
  String? adminId;
  String? userId;
  String? userIndentId;
  String? companyName;
  String? assigendGa;
  String? assignedChargearea;
  String? textpassword;
  String? craetedDate;
  String? activatedDate;
  String? deactivatedDate;
  String? status;
  String? cityTown;
  String? lead;
  String? level;
  String? isHo;
  String? closedByName;
  String? category;
  String? subcategory;
  String? catEscalationDays;
  String? subcatEscalationDays;
  String? assignedByName;
  String? coOrdinatorName;
  int? sno;
  String? fullname;
  String? remarksText;
  String? remarksForCoordinaterText;
  String? remarksForTechnicianText;
  String? sourceId;
  String? tankerSendSta;
  String? complainReference;
  String? priorityId;
  String? complainStatus;
  String? doc;
  String? actionStatusDrop;

  Data(
      {this.id,
        this.dmaId,
        this.complainNo,
        this.dateOfComplaint,
        this.alternateContact,
        this.source,
        this.complainCat,
        this.complainSubcat,
        this.additionalComments,
        this.complaintReference,
        this.attendedDate,
        this.escalatedDate,
        this.escalatedDepartment,
        this.assignedBy,
        this.coOrdinater,
        this.closedBy,
        this.currentStatus,
        this.complaintDoc,
        this.createdAt,
        this.updatedAt,
        this.deletedAt,
        this.uid,
        this.meter,
        this.description,
        this.attachedDoc,
        this.email,
        this.mobileNumber,
        this.actionStatus,
        this.technician,
        this.priority,
        this.remarksForCoordinater,
        this.remarksForTechnician,
        this.tankerRequired,
        this.tankerRequiredDate,
        this.tankerSend,
        this.tankerSendDate,
        this.areaId,
        this.firstName,
        this.middleName,
        this.lastName,
        this.guardianName,
        this.emailId,
        this.propertyCategoryId,
        this.propertyClassId,
        this.houseNumber,
        this.locality,
        this.town,
        this.district,
        this.state,
        this.pinCode,
        this.societyAllowedMdpe,
        this.residentStatus,
        this.noOfKitchen,
        this.noOfBathroom,
        this.existingCookingFuel,
        this.noOfFamilyMembers,
        this.ownerConsent,
        this.kycDocument1,
        this.kycDocument1Number,
        this.kycDocument2,
        this.kycDocument2Number,
        this.kycDocument3,
        this.kycDocument3Number,
        this.formStatus,
        this.dmaUserId,
        this.remarks,
        this.longitude,
        this.latitude,
        this.cgs,
        this.chargeAreaId,
        this.dateOfRegistration,
        this.nameOfBank,
        this.bankAccountNumber,
        this.bankIfscCode,
        this.bankAddress,
        this.dmaFormStatus,
        this.customerConsentStatus,
        this.reasonForHold,
        this.initialDepositeDate,
        this.modeOfDeposite,
        this.installmentNumber,
        this.payementBankName,
        this.paymentCreditStatus,
        this.dmaUserName,
        this.initialDepositeStatus,
        this.preferedBillingMode,
        this.acceptConversionPolicy,
        this.acceptExtraFittingCost,
        this.customerRegistrationNo,
        this.chequeNumber,
        this.marketingApprovStatus,
        this.accountApprovStatus,
        this.initialAmount,
        this.customerConsent,
        this.canceledCheque,
        this.crn,
        this.customerPhoto,
        this.housePhoto,
        this.kycDocument1Image,
        this.kycDocument2Image,
        this.kycDocument3Image,
        this.buildingNumber,
        this.address2,
        this.backside1,
        this.backside2,
        this.backside3,
        this.chequeBankAccount,
        this.chequePhoto,
        this.marketingApproval,
        this.markStatusTime,
        this.marketingRejectReason,
        this.accountingApproval,
        this.accountingTime,
        this.accontingRejectReason,
        this.isGasDepositApplicable,
        this.depositeType,
        this.depositSlipDate,
        this.depositSlip,
        this.transactionId,
        this.transactionTime,
        this.transactionResponseTime,
        this.bpNumber,
        this.interested,
        this.assignLmcId,
        this.refundedAmount,
        this.refundOrderid,
        this.isGasdepositCollected,
        this.typeOfRequest,
        this.propertyType,
        this.customerPlotArea,
        this.builtUpArea,
        this.existingHscDetails,
        this.sourceOfWater,
        this.waterTankCapacity,
        this.arnNo,
        this.kNo,
        this.alternateMobile,
        this.wardNumber,
        this.fromNode,
        this.toNode,
        this.parentId,
        this.title,
        this.escalationDays,
        this.complaintMobiles,
        this.name,
        this.address,
        this.phoneNumber,
        this.password,
        this.userAreaMappingTable,
        this.areaMappingId,
        this.adminId,
        this.userId,
        this.userIndentId,
        this.companyName,
        this.assigendGa,
        this.assignedChargearea,
        this.textpassword,
        this.craetedDate,
        this.activatedDate,
        this.deactivatedDate,
        this.status,
        this.cityTown,
        this.lead,
        this.level,
        this.isHo,
        this.closedByName,
        this.category,
        this.subcategory,
        this.catEscalationDays,
        this.subcatEscalationDays,
        this.assignedByName,
        this.coOrdinatorName,
        this.sno,
        this.fullname,
        this.remarksText,
        this.remarksForCoordinaterText,
        this.remarksForTechnicianText,
        this.sourceId,
        this.tankerSendSta,
        this.complainReference,
        this.priorityId,
        this.complainStatus,
        this.doc,
        this.actionStatusDrop});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    dmaId = json['dma_id'];
    complainNo = json['complain_no'];
    dateOfComplaint = json['date_of_complaint'];
    alternateContact = json['alternate_contact'];
    source = json['source'];
    complainCat = json['complain_cat'];
    complainSubcat = json['complain_subcat'];
    additionalComments = json['additional_comments'];
    complaintReference = json['complaint_reference'];
    attendedDate = json['attended_date'];
    escalatedDate = json['escalated_date'];
    escalatedDepartment = json['escalated_department'];
    assignedBy = json['assigned_by'];
    coOrdinater = json['co_ordinater'];
    closedBy = json['closed_by'];
    currentStatus = json['current_status'];
    complaintDoc = json['complaint_doc'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    uid = json['uid'];
    meter = json['meter'];
    description = json['description'];
    attachedDoc = json['attached_doc'];
    email = json['email'];
    mobileNumber = json['mobile_number'];
    actionStatus = json['action_status'];
    technician = json['technician'];
    priority = json['priority'];
    remarksForCoordinater = json['remarks_for_coordinater'];
    remarksForTechnician = json['remarks_for_technician'];
    tankerRequired = json['tanker_required'];
    tankerRequiredDate = json['tanker_required_date'];
    tankerSend = json['tanker_send'];
    tankerSendDate = json['tanker_send_date'];
    areaId = json['area_id'];
    firstName = json['first_name'];
    middleName = json['middle_name'];
    lastName = json['last_name'];
    guardianName = json['guardian_name'];
    emailId = json['email_id'];
    propertyCategoryId = json['property_category_id'];
    propertyClassId = json['property_class_id'];
    houseNumber = json['house_number'];
    locality = json['locality'];
    town = json['town'];
    district = json['district'];
    state = json['state'];
    pinCode = json['pin_code'];
    societyAllowedMdpe = json['society_allowed_mdpe'];
    residentStatus = json['resident_status'];
    noOfKitchen = json['no_of_kitchen'];
    noOfBathroom = json['no_of_bathroom'];
    existingCookingFuel = json['existing_cooking_fuel'];
    noOfFamilyMembers = json['no_of_family_members'];
    ownerConsent = json['owner_consent'];
    kycDocument1 = json['kyc_document_1'];
    kycDocument1Number = json['kyc_document_1_number'];
    kycDocument2 = json['kyc_document_2'];
    kycDocument2Number = json['kyc_document_2_number'];
    kycDocument3 = json['kyc_document_3'];
    kycDocument3Number = json['kyc_document_3_number'];
    formStatus = json['form_status'];
    dmaUserId = json['dma_user_id'];
    remarks = json['remarks'];
    longitude = json['longitude'];
    latitude = json['latitude'];
    cgs = json['cgs'];
    chargeAreaId = json['charge_area_id'];
    dateOfRegistration = json['date_of_registration'];
    nameOfBank = json['name_of_bank'];
    bankAccountNumber = json['bank_account_number'];
    bankIfscCode = json['bank_ifsc_code'];
    bankAddress = json['bank_address'];
    dmaFormStatus = json['dma_form_status'];
    customerConsentStatus = json['customer_consent_status'];
    reasonForHold = json['reason_for_hold'];
    initialDepositeDate = json['initial_deposite_date'];
    modeOfDeposite = json['mode_of_deposite'];
    installmentNumber = json['installment_number'];
    payementBankName = json['payement_bank_name'];
    paymentCreditStatus = json['payment_credit_status'];
    dmaUserName = json['dma_user_name'];
    initialDepositeStatus = json['initial_deposite_status'];
    preferedBillingMode = json['prefered_billing_mode'];
    acceptConversionPolicy = json['accept_conversion_policy'];
    acceptExtraFittingCost = json['accept_extra_fitting_cost'];
    customerRegistrationNo = json['customer_registration_no'];
    chequeNumber = json['cheque_number'];
    marketingApprovStatus = json['marketing_approv_status'];
    accountApprovStatus = json['account_approv_status'];
    initialAmount = json['initial_amount'];
    customerConsent = json['customer_consent'];
    canceledCheque = json['canceled_cheque'];
    crn = json['crn'];
    customerPhoto = json['customer_photo'];
    housePhoto = json['house_photo'];
    kycDocument1Image = json['kyc_document_1_image'];
    kycDocument2Image = json['kyc_document_2_image'];
    kycDocument3Image = json['kyc_document_3_image'];
    buildingNumber = json['building_number'];
    address2 = json['address2'];
    backside1 = json['backside1'];
    backside2 = json['backside2'];
    backside3 = json['backside3'];
    chequeBankAccount = json['cheque_bank_account'];
    chequePhoto = json['cheque_photo'];
    marketingApproval = json['marketing_approval'];
    markStatusTime = json['mark_status_time'];
    marketingRejectReason = json['marketing_reject_reason'];
    accountingApproval = json['accounting_approval'];
    accountingTime = json['accounting_time'];
    accontingRejectReason = json['acconting_reject_reason'];
    isGasDepositApplicable = json['is_gasDepositApplicable'];
    depositeType = json['deposite_type'];
    depositSlipDate = json['deposit_slip_date'];
    depositSlip = json['deposit_slip'];
    transactionId = json['transaction_id'];
    transactionTime = json['transaction_time'];
    transactionResponseTime = json['transaction_response_time'];
    bpNumber = json['bp_number'];
    interested = json['interested'];
    assignLmcId = json['assign_lmc_id'];
    refundedAmount = json['refunded_amount'];
    refundOrderid = json['refund_orderid'];
    isGasdepositCollected = json['is_gasdeposit_collected'];
    typeOfRequest = json['type_of_request'];
    propertyType = json['property_type'];
    customerPlotArea = json['customer_plot_area'];
    builtUpArea = json['built_up_area'];
    existingHscDetails = json['existing_hsc_details'];
    sourceOfWater = json['source_of_water'];
    waterTankCapacity = json['water_tank_capacity'];
    arnNo = json['arn_no'];
    kNo = json['k_no'];
    alternateMobile = json['alternate_mobile'];
    wardNumber = json['ward_number'];
    fromNode = json['from_node'];
    toNode = json['to_node'];
    parentId = json['parent_id'];
    title = json['title'];
    escalationDays = json['escalation_days'];
    complaintMobiles = json['complaint_mobiles'];
    name = json['name'];
    address = json['address'];
    phoneNumber = json['phone_number'];
    password = json['password'];
    userAreaMappingTable = json['user_area_mapping_table'];
    areaMappingId = json['area_mapping_id'];
    adminId = json['admin_id'];
    userId = json['user_id'];
    userIndentId = json['user_indent_id'];
    companyName = json['company_name'];
    assigendGa = json['assigend_ga'];
    assignedChargearea = json['assigned_chargearea'];
    textpassword = json['textpassword'];
    craetedDate = json['craeted_date'];
    activatedDate = json['activated_date'];
    deactivatedDate = json['deactivated_date'];
    status = json['status'];
    cityTown = json['city_town'];
    lead = json['lead'];
    level = json['level'];
    isHo = json['is_ho'];
    closedByName = json['closed_by_name'];
    category = json['category'];
    subcategory = json['subcategory'];
    catEscalationDays = json['cat_escalation_days'];
    subcatEscalationDays = json['subcat_escalation_days'];
    assignedByName = json['assigned_by_name'];
    coOrdinatorName = json['co_ordinator_name'];
    sno = json['sno'];
    fullname = json['fullname'];
    remarksText = json['remarksText'];
    remarksForCoordinaterText = json['remarks_for_coordinater_text'];
    remarksForTechnicianText = json['remarks_for_technician_text'];
    sourceId = json['sourceId'];
    tankerSendSta = json['tanker_send_sta'];
    complainReference = json['complainReference'];
    priorityId = json['priorityId'];
    complainStatus = json['complain_status'];
    doc = json['doc'];
    actionStatusDrop = json['action_status_drop'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['dma_id'] = this.dmaId;
    data['complain_no'] = this.complainNo;
    data['date_of_complaint'] = this.dateOfComplaint;
    data['alternate_contact'] = this.alternateContact;
    data['source'] = this.source;
    data['complain_cat'] = this.complainCat;
    data['complain_subcat'] = this.complainSubcat;
    data['additional_comments'] = this.additionalComments;
    data['complaint_reference'] = this.complaintReference;
    data['attended_date'] = this.attendedDate;
    data['escalated_date'] = this.escalatedDate;
    data['escalated_department'] = this.escalatedDepartment;
    data['assigned_by'] = this.assignedBy;
    data['co_ordinater'] = this.coOrdinater;
    data['closed_by'] = this.closedBy;
    data['current_status'] = this.currentStatus;
    data['complaint_doc'] = this.complaintDoc;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    data['uid'] = this.uid;
    data['meter'] = this.meter;
    data['description'] = this.description;
    data['attached_doc'] = this.attachedDoc;
    data['email'] = this.email;
    data['mobile_number'] = this.mobileNumber;
    data['action_status'] = this.actionStatus;
    data['technician'] = this.technician;
    data['priority'] = this.priority;
    data['remarks_for_coordinater'] = this.remarksForCoordinater;
    data['remarks_for_technician'] = this.remarksForTechnician;
    data['tanker_required'] = this.tankerRequired;
    data['tanker_required_date'] = this.tankerRequiredDate;
    data['tanker_send'] = this.tankerSend;
    data['tanker_send_date'] = this.tankerSendDate;
    data['area_id'] = this.areaId;
    data['first_name'] = this.firstName;
    data['middle_name'] = this.middleName;
    data['last_name'] = this.lastName;
    data['guardian_name'] = this.guardianName;
    data['email_id'] = this.emailId;
    data['property_category_id'] = this.propertyCategoryId;
    data['property_class_id'] = this.propertyClassId;
    data['house_number'] = this.houseNumber;
    data['locality'] = this.locality;
    data['town'] = this.town;
    data['district'] = this.district;
    data['state'] = this.state;
    data['pin_code'] = this.pinCode;
    data['society_allowed_mdpe'] = this.societyAllowedMdpe;
    data['resident_status'] = this.residentStatus;
    data['no_of_kitchen'] = this.noOfKitchen;
    data['no_of_bathroom'] = this.noOfBathroom;
    data['existing_cooking_fuel'] = this.existingCookingFuel;
    data['no_of_family_members'] = this.noOfFamilyMembers;
    data['owner_consent'] = this.ownerConsent;
    data['kyc_document_1'] = this.kycDocument1;
    data['kyc_document_1_number'] = this.kycDocument1Number;
    data['kyc_document_2'] = this.kycDocument2;
    data['kyc_document_2_number'] = this.kycDocument2Number;
    data['kyc_document_3'] = this.kycDocument3;
    data['kyc_document_3_number'] = this.kycDocument3Number;
    data['form_status'] = this.formStatus;
    data['dma_user_id'] = this.dmaUserId;
    data['remarks'] = this.remarks;
    data['longitude'] = this.longitude;
    data['latitude'] = this.latitude;
    data['cgs'] = this.cgs;
    data['charge_area_id'] = this.chargeAreaId;
    data['date_of_registration'] = this.dateOfRegistration;
    data['name_of_bank'] = this.nameOfBank;
    data['bank_account_number'] = this.bankAccountNumber;
    data['bank_ifsc_code'] = this.bankIfscCode;
    data['bank_address'] = this.bankAddress;
    data['dma_form_status'] = this.dmaFormStatus;
    data['customer_consent_status'] = this.customerConsentStatus;
    data['reason_for_hold'] = this.reasonForHold;
    data['initial_deposite_date'] = this.initialDepositeDate;
    data['mode_of_deposite'] = this.modeOfDeposite;
    data['installment_number'] = this.installmentNumber;
    data['payement_bank_name'] = this.payementBankName;
    data['payment_credit_status'] = this.paymentCreditStatus;
    data['dma_user_name'] = this.dmaUserName;
    data['initial_deposite_status'] = this.initialDepositeStatus;
    data['prefered_billing_mode'] = this.preferedBillingMode;
    data['accept_conversion_policy'] = this.acceptConversionPolicy;
    data['accept_extra_fitting_cost'] = this.acceptExtraFittingCost;
    data['customer_registration_no'] = this.customerRegistrationNo;
    data['cheque_number'] = this.chequeNumber;
    data['marketing_approv_status'] = this.marketingApprovStatus;
    data['account_approv_status'] = this.accountApprovStatus;
    data['initial_amount'] = this.initialAmount;
    data['customer_consent'] = this.customerConsent;
    data['canceled_cheque'] = this.canceledCheque;
    data['crn'] = this.crn;
    data['customer_photo'] = this.customerPhoto;
    data['house_photo'] = this.housePhoto;
    data['kyc_document_1_image'] = this.kycDocument1Image;
    data['kyc_document_2_image'] = this.kycDocument2Image;
    data['kyc_document_3_image'] = this.kycDocument3Image;
    data['building_number'] = this.buildingNumber;
    data['address2'] = this.address2;
    data['backside1'] = this.backside1;
    data['backside2'] = this.backside2;
    data['backside3'] = this.backside3;
    data['cheque_bank_account'] = this.chequeBankAccount;
    data['cheque_photo'] = this.chequePhoto;
    data['marketing_approval'] = this.marketingApproval;
    data['mark_status_time'] = this.markStatusTime;
    data['marketing_reject_reason'] = this.marketingRejectReason;
    data['accounting_approval'] = this.accountingApproval;
    data['accounting_time'] = this.accountingTime;
    data['acconting_reject_reason'] = this.accontingRejectReason;
    data['is_gasDepositApplicable'] = this.isGasDepositApplicable;
    data['deposite_type'] = this.depositeType;
    data['deposit_slip_date'] = this.depositSlipDate;
    data['deposit_slip'] = this.depositSlip;
    data['transaction_id'] = this.transactionId;
    data['transaction_time'] = this.transactionTime;
    data['transaction_response_time'] = this.transactionResponseTime;
    data['bp_number'] = this.bpNumber;
    data['interested'] = this.interested;
    data['assign_lmc_id'] = this.assignLmcId;
    data['refunded_amount'] = this.refundedAmount;
    data['refund_orderid'] = this.refundOrderid;
    data['is_gasdeposit_collected'] = this.isGasdepositCollected;
    data['type_of_request'] = this.typeOfRequest;
    data['property_type'] = this.propertyType;
    data['customer_plot_area'] = this.customerPlotArea;
    data['built_up_area'] = this.builtUpArea;
    data['existing_hsc_details'] = this.existingHscDetails;
    data['source_of_water'] = this.sourceOfWater;
    data['water_tank_capacity'] = this.waterTankCapacity;
    data['arn_no'] = this.arnNo;
    data['k_no'] = this.kNo;
    data['alternate_mobile'] = this.alternateMobile;
    data['ward_number'] = this.wardNumber;
    data['from_node'] = this.fromNode;
    data['to_node'] = this.toNode;
    data['parent_id'] = this.parentId;
    data['title'] = this.title;
    data['escalation_days'] = this.escalationDays;
    data['complaint_mobiles'] = this.complaintMobiles;
    data['name'] = this.name;
    data['address'] = this.address;
    data['phone_number'] = this.phoneNumber;
    data['password'] = this.password;
    data['user_area_mapping_table'] = this.userAreaMappingTable;
    data['area_mapping_id'] = this.areaMappingId;
    data['admin_id'] = this.adminId;
    data['user_id'] = this.userId;
    data['user_indent_id'] = this.userIndentId;
    data['company_name'] = this.companyName;
    data['assigend_ga'] = this.assigendGa;
    data['assigned_chargearea'] = this.assignedChargearea;
    data['textpassword'] = this.textpassword;
    data['craeted_date'] = this.craetedDate;
    data['activated_date'] = this.activatedDate;
    data['deactivated_date'] = this.deactivatedDate;
    data['status'] = this.status;
    data['city_town'] = this.cityTown;
    data['lead'] = this.lead;
    data['level'] = this.level;
    data['is_ho'] = this.isHo;
    data['closed_by_name'] = this.closedByName;
    data['category'] = this.category;
    data['subcategory'] = this.subcategory;
    data['cat_escalation_days'] = this.catEscalationDays;
    data['subcat_escalation_days'] = this.subcatEscalationDays;
    data['assigned_by_name'] = this.assignedByName;
    data['co_ordinator_name'] = this.coOrdinatorName;
    data['sno'] = this.sno;
    data['fullname'] = this.fullname;
    data['remarksText'] = this.remarksText;
    data['remarks_for_coordinater_text'] = this.remarksForCoordinaterText;
    data['remarks_for_technician_text'] = this.remarksForTechnicianText;
    data['sourceId'] = this.sourceId;
    data['tanker_send_sta'] = this.tankerSendSta;
    data['complainReference'] = this.complainReference;
    data['priorityId'] = this.priorityId;
    data['complain_status'] = this.complainStatus;
    data['doc'] = this.doc;
    data['action_status_drop'] = this.actionStatusDrop;
    return data;
  }
}



class ComplainHistoryRequestModel{
  final String? schema;
  final String? dmaId;
  ComplainHistoryRequestModel({ this.schema, this.dmaId,});
  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      "schema": schema.toString().trim(),
      "dma_id": dmaId.toString().trim(),
    };
    return map ;
  }
}
