List<ComplaintModel> complaintListResponse(var json) {
  return List<ComplaintModel>.from(json.map((x) => ComplaintModel.fromJson(x)));
}

class ComplaintModel {
  String? id;
  String? dmaId;
  String? complainNo;
  String? dateOfComplaint;
  dynamic alternateContact;
  String? source;
  String? complainCat;
  String? complainSubcat;
  dynamic additionalComments;
  String? complaintReference;
  dynamic attendedDate;
  dynamic escalatedDate;
  dynamic escalatedDepartment;
  dynamic assignedBy;
  dynamic coOrdinater;
  dynamic closedBy;
  String? currentStatus;
  dynamic complaintDoc;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;
  dynamic uid;
  dynamic meter;
  String? description;
  String? attachedDoc;
  dynamic email;
  String? mobileNumber;
  String? actionStatus;
  dynamic technician;
  String? priority;
  dynamic remarksForCoordinater;
  dynamic remarksForTechnician;
  String? tankerRequired;
  dynamic tankerRequiredDate;
  String? tankerSend;
  dynamic tankerSendDate;
  dynamic requestedQty;
  String? customerRating;
  dynamic customerFeedback;
  dynamic customerFeedbackDate;
  String? requestedRefundAmount;
  dynamic refundMktStatus;
  dynamic refundMktDate;
  dynamic refundMktRejectReason;
  dynamic refundAccStatus;
  dynamic refundAccDate;
  dynamic refundAccRejectReason;
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
  dynamic district;
  dynamic state;
  String? pinCode;
  String? societyAllowedMdpe;
  String? residentStatus;
  String? noOfKitchen;
  String? noOfBathroom;
  String? existingCookingFuel;
  String? noOfFamilyMembers;
  dynamic ownerConsent;
  String? kycDocument1;
  String? kycDocument1Number;
  String? kycDocument2;
  String? kycDocument2Number;
  String? kycDocument3;
  dynamic kycDocument3Number;
  dynamic formStatus;
  String? dmaUserId;
  String? remarks;
  String? longitude;
  String? latitude;
  dynamic cgs;
  String? chargeAreaId;
  String? dateOfRegistration;
  dynamic nameOfBank;
  dynamic bankAccountNumber;
  dynamic bankIfscCode;
  dynamic bankAddress;
  dynamic dmaFormStatus;
  dynamic customerConsentStatus;
  dynamic reasonForHold;
  dynamic initialDepositeDate;
  String? modeOfDeposite;
  dynamic installmentNumber;
  dynamic payementBankName;
  String? paymentCreditStatus;
  String? dmaUserName;
  String? initialDepositeStatus;
  String? preferedBillingMode;
  String? acceptConversionPolicy;
  String? acceptExtraFittingCost;
  dynamic customerRegistrationNo;
  dynamic chequeNumber;
  String? marketingApprovStatus;
  String? accountApprovStatus;
  String? initialAmount;
  dynamic customerConsent;
  dynamic canceledCheque;
  String? crn;
  dynamic customerPhoto;
  dynamic housePhoto;
  dynamic kycDocument1Image;
  dynamic kycDocument2Image;
  dynamic kycDocument3Image;
  String? buildingNumber;
  dynamic address1;
  String? address2;
  dynamic backside1;
  dynamic backside2;
  dynamic backside3;
  dynamic chequeBankAccount;
  dynamic chequePhoto;
  String? isGasDepositApplicable;
  String? marketingApproval;
  String? markStatusTime;
  dynamic marketingRejectReason;
  String? accountingApproval;
  String? accountingTime;
  dynamic accontingRejectReason;
  String? depositeType;
  dynamic depositSlipDate;
  dynamic depositSlip;
  String? transactionId;
  String? transactionTime;
  String? transactionResponseTime;
  String? bpNumber;
  String? interested;
  String? assignLmcId;
  dynamic refundedAmount;
  dynamic refundOrderid;
  dynamic isGasdepositCollected;
  String? guardianType;
  String? selfRegistration;
  String? customerStatus;
  dynamic chequeBounceReason;
  dynamic micr;
  dynamic mobileResponseTime;
  String? isEdited;
  String? inAccount;
  String? bounceAmount;
  String? adjustableAmount;
  String? defermentAmount;
  String? districtId;
  String? disconnectionStatus;
  dynamic refundableStatu;
  String? saleId;
  String? collectionId;
  String? ageingId;
  String? trNumber;
  String? alternateMobile;
  String? dmaDirPath;
  String? refundableStatus;
  dynamic futureRegNgcEligibleStatus;
  dynamic futureRegisDate;
  dynamic futureRegisUserId;
  String? manualTransactionUpdateUserId;
  dynamic manualTransactionUpdateRemarks;
  dynamic manualTransactionPaymentMethod;
  dynamic customerSurveyId;
  dynamic upload;
  String? oldMobile;
  String? schemeChangeStatus;
  dynamic schemeChangeDate;
  String? parentId;
  String? title;
  String? escalationDays;
  dynamic complaintMobiles;
  String? formType;
  String? price;
  String? qty;
  String? unit;
  String? servicePrice;
  String? priceTax;
  dynamic status;
  String? slg;
  dynamic name;
  dynamic address;
  dynamic phoneNumber;
  dynamic password;
  dynamic userAreaMappingTable;
  dynamic areaMappingId;
  dynamic adminId;
  dynamic userId;
  dynamic userIndentId;
  dynamic companyName;
  dynamic assigendGa;
  dynamic assignedChargearea;
  dynamic textpassword;
  dynamic craetedDate;
  dynamic activatedDate;
  dynamic deactivatedDate;
  dynamic cityTown;
  dynamic lead;
  dynamic isHo;
  dynamic level;
  dynamic pwdChanged;
  dynamic moduleId;
  dynamic userTypeId;
  dynamic userImage;
  dynamic signImage;
  dynamic otpCreatedDate;
  dynamic otpUpdatedAt;
  dynamic otpExpiration;
  dynamic otp;
  dynamic changePwdDate;
  dynamic closedByName;
  String? category;
  String? subcategory;
  String? catEscalationDays;
  String? subcatEscalationDays;
  dynamic assignedByName;
  dynamic coOrdinatorName;

  ComplaintModel(
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
        this.requestedQty,
        this.customerRating,
        this.customerFeedback,
        this.customerFeedbackDate,
        this.requestedRefundAmount,
        this.refundMktStatus,
        this.refundMktDate,
        this.refundMktRejectReason,
        this.refundAccStatus,
        this.refundAccDate,
        this.refundAccRejectReason,
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
        this.address1,
        this.address2,
        this.backside1,
        this.backside2,
        this.backside3,
        this.chequeBankAccount,
        this.chequePhoto,
        this.isGasDepositApplicable,
        this.marketingApproval,
        this.markStatusTime,
        this.marketingRejectReason,
        this.accountingApproval,
        this.accountingTime,
        this.accontingRejectReason,
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
        this.guardianType,
        this.selfRegistration,
        this.customerStatus,
        this.chequeBounceReason,
        this.micr,
        this.mobileResponseTime,
        this.isEdited,
        this.inAccount,
        this.bounceAmount,
        this.adjustableAmount,
        this.defermentAmount,
        this.districtId,
        this.disconnectionStatus,
        this.refundableStatu,
        this.saleId,
        this.collectionId,
        this.ageingId,
        this.trNumber,
        this.alternateMobile,
        this.dmaDirPath,
        this.refundableStatus,
        this.futureRegNgcEligibleStatus,
        this.futureRegisDate,
        this.futureRegisUserId,
        this.manualTransactionUpdateUserId,
        this.manualTransactionUpdateRemarks,
        this.manualTransactionPaymentMethod,
        this.customerSurveyId,
        this.upload,
        this.oldMobile,
        this.schemeChangeStatus,
        this.schemeChangeDate,
        this.parentId,
        this.title,
        this.escalationDays,
        this.complaintMobiles,
        this.formType,
        this.price,
        this.qty,
        this.unit,
        this.servicePrice,
        this.priceTax,
        this.status,
        this.slg,
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
        this.cityTown,
        this.lead,
        this.isHo,
        this.level,
        this.pwdChanged,
        this.moduleId,
        this.userTypeId,
        this.userImage,
        this.signImage,
        this.otpCreatedDate,
        this.otpUpdatedAt,
        this.otpExpiration,
        this.otp,
        this.changePwdDate,
        this.closedByName,
        this.category,
        this.subcategory,
        this.catEscalationDays,
        this.subcatEscalationDays,
        this.assignedByName,
        this.coOrdinatorName});

  ComplaintModel.fromJson(Map<String, dynamic> json) {
    id = json['id']  ?? "" ;
    dmaId = json['dma_id']  ?? "" ;
    complainNo = json['complain_no']  ?? "" ;
    dateOfComplaint = json['date_of_complaint']  ?? "" ;
    alternateContact = json['alternate_contact']  ?? "" ;
    source = json['source']  ?? "" ;
    complainCat = json['complain_cat']  ?? "" ;
    complainSubcat = json['complain_subcat']  ?? "" ;
    additionalComments = json['additional_comments']  ?? "" ;
    complaintReference = json['complaint_reference']  ?? "" ;
    attendedDate = json['attended_date']  ?? "" ;
    escalatedDate = json['escalated_date']  ?? "" ;
    escalatedDepartment = json['escalated_department']  ?? "" ;
    assignedBy = json['assigned_by']  ?? "" ;
    coOrdinater = json['co_ordinater']  ?? "" ;
    closedBy = json['closed_by']  ?? "" ;
    currentStatus = json['current_status']  ?? "" ;
    complaintDoc = json['complaint_doc']  ?? "" ;
    createdAt = json['created_at']  ?? "" ;
    updatedAt = json['updated_at']  ?? "" ;
    deletedAt = json['deleted_at']  ?? "" ;
    uid = json['uid']  ?? "" ;
    meter = json['meter']  ?? "" ;
    description = json['description']  ?? "" ;
    attachedDoc = json['attached_doc']  ?? "" ;
    email = json['email']  ?? "" ;
    mobileNumber = json['mobile_number']  ?? "" ;
    actionStatus = json['action_status']  ?? "" ;
    technician = json['technician']  ?? "" ;
    priority = json['priority']  ?? "" ;
    remarksForCoordinater = json['remarks_for_coordinater']  ?? "" ;
    remarksForTechnician = json['remarks_for_technician']  ?? "" ;
    tankerRequired = json['tanker_required']  ?? "" ;
    tankerRequiredDate = json['tanker_required_date']  ?? "" ;
    tankerSend = json['tanker_send']  ?? "" ;
    tankerSendDate = json['tanker_send_date']  ?? "" ;
    requestedQty = json['requested_qty']  ?? "" ;
    customerRating = json['customer_rating']  ?? "" ;
    customerFeedback = json['customer_feedback']  ?? "" ;
    customerFeedbackDate = json['customer_feedback_date']  ?? "" ;
    requestedRefundAmount = json['requested_refund_amount']  ?? "" ;
    refundMktStatus = json['refund_mkt_status']  ?? "" ;
    refundMktDate = json['refund_mkt_date']  ?? "" ;
    refundMktRejectReason = json['refund_mkt_reject_reason']  ?? "" ;
    refundAccStatus = json['refund_acc_status']  ?? "" ;
    refundAccDate = json['refund_acc_date']  ?? "" ;
    refundAccRejectReason = json['refund_acc_reject_reason']  ?? "" ;
    areaId = json['area_id']  ?? "" ;
    firstName = json['first_name']  ?? "" ;
    middleName = json['middle_name']  ?? "" ;
    lastName = json['last_name']  ?? "" ;
    guardianName = json['guardian_name']  ?? "" ;
    emailId = json['email_id']  ?? "" ;
    propertyCategoryId = json['property_category_id']  ?? "" ;
    propertyClassId = json['property_class_id']  ?? "" ;
    houseNumber = json['house_number']  ?? "" ;
    locality = json['locality']  ?? "" ;
    town = json['town']  ?? "" ;
    district = json['district']  ?? "" ;
    state = json['state']  ?? "" ;
    pinCode = json['pin_code']  ?? "" ;
    societyAllowedMdpe = json['society_allowed_mdpe']  ?? "" ;
    residentStatus = json['resident_status']  ?? "" ;
    noOfKitchen = json['no_of_kitchen']  ?? "" ;
    noOfBathroom = json['no_of_bathroom']  ?? "" ;
    existingCookingFuel = json['existing_cooking_fuel']  ?? "" ;
    noOfFamilyMembers = json['no_of_family_members']  ?? "" ;
    ownerConsent = json['owner_consent']  ?? "" ;
    kycDocument1 = json['kyc_document_1']  ?? "" ;
    kycDocument1Number = json['kyc_document_1_number']  ?? "" ;
    kycDocument2 = json['kyc_document_2']  ?? "" ;
    kycDocument2Number = json['kyc_document_2_number']  ?? "" ;
    kycDocument3 = json['kyc_document_3']  ?? "" ;
    kycDocument3Number = json['kyc_document_3_number']  ?? "" ;
    formStatus = json['form_status']  ?? "" ;
    dmaUserId = json['dma_user_id']  ?? "" ;
    remarks = json['remarks']  ?? "" ;
    longitude = json['longitude']  ?? "" ;
    latitude = json['latitude']  ?? "" ;
    cgs = json['cgs']  ?? "" ;
    chargeAreaId = json['charge_area_id']  ?? "" ;
    dateOfRegistration = json['date_of_registration']  ?? "" ;
    nameOfBank = json['name_of_bank']  ?? "" ;
    bankAccountNumber = json['bank_account_number']  ?? "" ;
    bankIfscCode = json['bank_ifsc_code']  ?? "" ;
    bankAddress = json['bank_address']  ?? "" ;
    dmaFormStatus = json['dma_form_status']  ?? "" ;
    customerConsentStatus = json['customer_consent_status']  ?? "" ;
    reasonForHold = json['reason_for_hold']  ?? "" ;
    initialDepositeDate = json['initial_deposite_date']  ?? "" ;
    modeOfDeposite = json['mode_of_deposite']  ?? "" ;
    installmentNumber = json['installment_number']  ?? "" ;
    payementBankName = json['payement_bank_name']  ?? "" ;
    paymentCreditStatus = json['payment_credit_status']  ?? "" ;
    dmaUserName = json['dma_user_name']  ?? "" ;
    initialDepositeStatus = json['initial_deposite_status']  ?? "" ;
    preferedBillingMode = json['prefered_billing_mode']  ?? "" ;
    acceptConversionPolicy = json['accept_conversion_policy']  ?? "" ;
    acceptExtraFittingCost = json['accept_extra_fitting_cost']  ?? "" ;
    customerRegistrationNo = json['customer_registration_no']  ?? "" ;
    chequeNumber = json['cheque_number']  ?? "" ;
    marketingApprovStatus = json['marketing_approv_status']  ?? "" ;
    accountApprovStatus = json['account_approv_status']  ?? "" ;
    initialAmount = json['initial_amount']  ?? "" ;
    customerConsent = json['customer_consent']  ?? "" ;
    canceledCheque = json['canceled_cheque']  ?? "" ;
    crn = json['crn']  ?? "" ;
    customerPhoto = json['customer_photo']  ?? "" ;
    housePhoto = json['house_photo']  ?? "" ;
    kycDocument1Image = json['kyc_document_1_image']  ?? "" ;
    kycDocument2Image = json['kyc_document_2_image']  ?? "" ;
    kycDocument3Image = json['kyc_document_3_image']  ?? "" ;
    buildingNumber = json['building_number']  ?? "" ;
    address1 = json['address1']  ?? "" ;
    address2 = json['address2']  ?? "" ;
    backside1 = json['backside1']  ?? "" ;
    backside2 = json['backside2']  ?? "" ;
    backside3 = json['backside3']  ?? "" ;
    chequeBankAccount = json['cheque_bank_account']  ?? "" ;
    chequePhoto = json['cheque_photo']  ?? "" ;
    isGasDepositApplicable = json['is_gasDepositApplicable']  ?? "" ;
    marketingApproval = json['marketing_approval']  ?? "" ;
    markStatusTime = json['mark_status_time']  ?? "" ;
    marketingRejectReason = json['marketing_reject_reason']  ?? "" ;
    accountingApproval = json['accounting_approval']  ?? "" ;
    accountingTime = json['accounting_time']  ?? "" ;
    accontingRejectReason = json['acconting_reject_reason']  ?? "" ;
    depositeType = json['deposite_type']  ?? "" ;
    depositSlipDate = json['deposit_slip_date']  ?? "" ;
    depositSlip = json['deposit_slip']  ?? "" ;
    transactionId = json['transaction_id']  ?? "" ;
    transactionTime = json['transaction_time']  ?? "" ;
    transactionResponseTime = json['transaction_response_time']  ?? "" ;
    bpNumber = json['bp_number']  ?? "" ;
    interested = json['interested']  ?? "" ;
    assignLmcId = json['assign_lmc_id']  ?? "" ;
    refundedAmount = json['refunded_amount']  ?? "" ;
    refundOrderid = json['refund_orderid']  ?? "" ;
    isGasdepositCollected = json['is_gasdeposit_collected']  ?? "" ;
    guardianType = json['guardian_type']  ?? "" ;
    selfRegistration = json['self_registration']  ?? "" ;
    customerStatus = json['customer_status']  ?? "" ;
    chequeBounceReason = json['cheque_bounce_reason']  ?? "" ;
    micr = json['micr']  ?? "" ;
    mobileResponseTime = json['mobile_response_time']  ?? "" ;
    isEdited = json['is_edited']  ?? "" ;
    inAccount = json['in_account']  ?? "" ;
    bounceAmount = json['bounce_amount']  ?? "" ;
    adjustableAmount = json['adjustable_amount']  ?? "" ;
    defermentAmount = json['deferment_amount']  ?? "" ;
    districtId = json['district_id']  ?? "" ;
    disconnectionStatus = json['disconnection_status']  ?? "" ;
    refundableStatu = json['refundable_statu']  ?? "" ;
    saleId = json['sale_id']  ?? "" ;
    collectionId = json['collection_id']  ?? "" ;
    ageingId = json['ageing_id']  ?? "" ;
    trNumber = json['tr_number']  ?? "" ;
    alternateMobile = json['alternateMobile']  ?? "" ;
    dmaDirPath = json['dma_dir_path']  ?? "" ;
    refundableStatus = json['refundable_status']  ?? "" ;
    futureRegNgcEligibleStatus = json['future_reg_ngc_eligible_status']  ?? "" ;
    futureRegisDate = json['future_regis_date']  ?? "" ;
    futureRegisUserId = json['future_regis_user_id']  ?? "" ;
    manualTransactionUpdateUserId = json['manual_transaction_update_user_id']  ?? "" ;
    manualTransactionUpdateRemarks = json['manual_transaction_update_remarks']  ?? "" ;
    manualTransactionPaymentMethod = json['manual_transaction_payment_method']  ?? "" ;
    customerSurveyId = json['customer_survey_id']  ?? "" ;
    upload = json['upload']  ?? "" ;
    oldMobile = json['old_mobile']  ?? "" ;
    schemeChangeStatus = json['scheme_change_status']  ?? "" ;
    schemeChangeDate = json['scheme_change_date']  ?? "" ;
    parentId = json['parent_id']  ?? "" ;
    title = json['title']  ?? "" ;
    escalationDays = json['escalation_days']  ?? "" ;
    complaintMobiles = json['complaint_mobiles']  ?? "" ;
    formType = json['form_type']  ?? "" ;
    price = json['price']  ?? "" ;
    qty = json['qty']  ?? "" ;
    unit = json['unit']  ?? "" ;
    servicePrice = json['service_price']  ?? "" ;
    priceTax = json['price_tax']  ?? "" ;
    status = json['status']  ?? "" ;
    slg = json['slg']  ?? "" ;
    name = json['name']  ?? "" ;
    address = json['address']  ?? "" ;
    phoneNumber = json['phone_number']  ?? "" ;
    password = json['password']  ?? "" ;
    userAreaMappingTable = json['user_area_mapping_table']  ?? "" ;
    areaMappingId = json['area_mapping_id']  ?? "" ;
    adminId = json['admin_id']  ?? "" ;
    userId = json['user_id']  ?? "" ;
    userIndentId = json['user_indent_id']  ?? "" ;
    companyName = json['company_name']  ?? "" ;
    assigendGa = json['assigend_ga']  ?? "" ;
    assignedChargearea = json['assigned_chargearea']  ?? "" ;
    textpassword = json['textpassword']  ?? "" ;
    craetedDate = json['craeted_date']  ?? "" ;
    activatedDate = json['activated_date']  ?? "" ;
    deactivatedDate = json['deactivated_date']  ?? "" ;
    cityTown = json['city_town']  ?? "" ;
    lead = json['lead']  ?? "" ;
    isHo = json['is_ho']  ?? "" ;
    level = json['level']  ?? "" ;
    pwdChanged = json['pwd_changed']  ?? "" ;
    moduleId = json['module_id']  ?? "" ;
    userTypeId = json['user_type_id']  ?? "" ;
    userImage = json['user_image']  ?? "" ;
    signImage = json['sign_image']  ?? "" ;
    otpCreatedDate = json['otp_created_date']  ?? "" ;
    otpUpdatedAt = json['otp_updated_at']  ?? "" ;
    otpExpiration = json['otp_expiration']  ?? "" ;
    otp = json['otp']  ?? "" ;
    changePwdDate = json['change_pwd_date']  ?? "" ;
    closedByName = json['closed_by_name']  ?? "" ;
    category = json['category']  ?? "" ;
    subcategory = json['subcategory']  ?? "" ;
    catEscalationDays = json['cat_escalation_days']  ?? "" ;
    subcatEscalationDays = json['subcat_escalation_days']  ?? "" ;
    assignedByName = json['assigned_by_name']  ?? "" ;
    coOrdinatorName = json['co_ordinator_name']  ?? "" ;
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
    data['requested_qty'] = this.requestedQty;
    data['customer_rating'] = this.customerRating;
    data['customer_feedback'] = this.customerFeedback;
    data['customer_feedback_date'] = this.customerFeedbackDate;
    data['requested_refund_amount'] = this.requestedRefundAmount;
    data['refund_mkt_status'] = this.refundMktStatus;
    data['refund_mkt_date'] = this.refundMktDate;
    data['refund_mkt_reject_reason'] = this.refundMktRejectReason;
    data['refund_acc_status'] = this.refundAccStatus;
    data['refund_acc_date'] = this.refundAccDate;
    data['refund_acc_reject_reason'] = this.refundAccRejectReason;
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
    data['address1'] = this.address1;
    data['address2'] = this.address2;
    data['backside1'] = this.backside1;
    data['backside2'] = this.backside2;
    data['backside3'] = this.backside3;
    data['cheque_bank_account'] = this.chequeBankAccount;
    data['cheque_photo'] = this.chequePhoto;
    data['is_gasDepositApplicable'] = this.isGasDepositApplicable;
    data['marketing_approval'] = this.marketingApproval;
    data['mark_status_time'] = this.markStatusTime;
    data['marketing_reject_reason'] = this.marketingRejectReason;
    data['accounting_approval'] = this.accountingApproval;
    data['accounting_time'] = this.accountingTime;
    data['acconting_reject_reason'] = this.accontingRejectReason;
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
    data['guardian_type'] = this.guardianType;
    data['self_registration'] = this.selfRegistration;
    data['customer_status'] = this.customerStatus;
    data['cheque_bounce_reason'] = this.chequeBounceReason;
    data['micr'] = this.micr;
    data['mobile_response_time'] = this.mobileResponseTime;
    data['is_edited'] = this.isEdited;
    data['in_account'] = this.inAccount;
    data['bounce_amount'] = this.bounceAmount;
    data['adjustable_amount'] = this.adjustableAmount;
    data['deferment_amount'] = this.defermentAmount;
    data['district_id'] = this.districtId;
    data['disconnection_status'] = this.disconnectionStatus;
    data['refundable_statu'] = this.refundableStatu;
    data['sale_id'] = this.saleId;
    data['collection_id'] = this.collectionId;
    data['ageing_id'] = this.ageingId;
    data['tr_number'] = this.trNumber;
    data['alternateMobile'] = this.alternateMobile;
    data['dma_dir_path'] = this.dmaDirPath;
    data['refundable_status'] = this.refundableStatus;
    data['future_reg_ngc_eligible_status'] = this.futureRegNgcEligibleStatus;
    data['future_regis_date'] = this.futureRegisDate;
    data['future_regis_user_id'] = this.futureRegisUserId;
    data['manual_transaction_update_user_id'] =
        this.manualTransactionUpdateUserId;
    data['manual_transaction_update_remarks'] =
        this.manualTransactionUpdateRemarks;
    data['manual_transaction_payment_method'] =
        this.manualTransactionPaymentMethod;
    data['customer_survey_id'] = this.customerSurveyId;
    data['upload'] = this.upload;
    data['old_mobile'] = this.oldMobile;
    data['scheme_change_status'] = this.schemeChangeStatus;
    data['scheme_change_date'] = this.schemeChangeDate;
    data['parent_id'] = this.parentId;
    data['title'] = this.title;
    data['escalation_days'] = this.escalationDays;
    data['complaint_mobiles'] = this.complaintMobiles;
    data['form_type'] = this.formType;
    data['price'] = this.price;
    data['qty'] = this.qty;
    data['unit'] = this.unit;
    data['service_price'] = this.servicePrice;
    data['price_tax'] = this.priceTax;
    data['status'] = this.status;
    data['slg'] = this.slg;
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
    data['city_town'] = this.cityTown;
    data['lead'] = this.lead;
    data['is_ho'] = this.isHo;
    data['level'] = this.level;
    data['pwd_changed'] = this.pwdChanged;
    data['module_id'] = this.moduleId;
    data['user_type_id'] = this.userTypeId;
    data['user_image'] = this.userImage;
    data['sign_image'] = this.signImage;
    data['otp_created_date'] = this.otpCreatedDate;
    data['otp_updated_at'] = this.otpUpdatedAt;
    data['otp_expiration'] = this.otpExpiration;
    data['otp'] = this.otp;
    data['change_pwd_date'] = this.changePwdDate;
    data['closed_by_name'] = this.closedByName;
    data['category'] = this.category;
    data['subcategory'] = this.subcategory;
    data['cat_escalation_days'] = this.catEscalationDays;
    data['subcat_escalation_days'] = this.subcatEscalationDays;
    data['assigned_by_name'] = this.assignedByName;
    data['co_ordinator_name'] = this.coOrdinatorName;
    return data;
  }
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
