class CustomerModel {
  String? id;
  String? areaId;
  String? mobileNumber;
  String? firstName;
  dynamic middleName;
  String? lastName;
  dynamic guardianName;
  dynamic emailId;
  String? propertyCategoryId;
  String? propertyClassId;
  dynamic houseNumber;
  dynamic locality;
  dynamic town;
  String? district;
  String? state;
  dynamic pinCode;
  String? societyAllowedMdpe;
  String? residentStatus;
  String? noOfKitchen;
  String? noOfBathroom;
  String? existingCookingFuel;
  String? noOfFamilyMembers;
  dynamic ownerConsent;
  dynamic kycDocument1;
  dynamic kycDocument1Number;
  dynamic kycDocument2;
  dynamic kycDocument2Number;
  dynamic kycDocument3;
  dynamic kycDocument3Number;
  dynamic formStatus;
  String? dmaUserId;
  String? remarks;
  dynamic longitude;
  dynamic latitude;
  dynamic cgs;
  dynamic chargeAreaId;
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
  dynamic buildingNumber;
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
  dynamic alternateMobile;
  dynamic dmaDirPath;
  String? refundableStatus;
  String? source;
  dynamic futureRegNgcEligibleStatus;
  dynamic futureRegisDate;
  dynamic futureRegisUserId;
  String? manualTransactionUpdateUserId;
  dynamic manualTransactionUpdateRemarks;
  dynamic manualTransactionPaymentMethod;
  dynamic customerSurveyId;
  String? upload;
  String? oldMobile;
  String? schemeChangeStatus;
  dynamic schemeChangeDate;
  String? registrationDt;
  String? lmcFeasiDate;
  dynamic rfcDate;
  String? ngcDate;
  String? billGenDate;
  String? lmcContractor;
  String? lmcAssignDate;
  String? schemeName;
  String? billDueDate;
  String? billPayDate;

  CustomerModel(
      {this.id,
        this.areaId,
        this.mobileNumber,
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
        this.source,
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
        this.registrationDt,
        this.lmcFeasiDate,
        this.rfcDate,
        this.ngcDate,
        this.billGenDate,
        this.lmcContractor,
        this.lmcAssignDate,
        this.schemeName,
        this.billDueDate,
        this.billPayDate});

  CustomerModel.fromJson(Map<String, dynamic> json) {
    id = json['id'] ??  "" ;
    areaId = json['area_id'] ??  "" ;
    mobileNumber = json['mobile_number'] ??  "" ;
    firstName = json['first_name'] ??  "" ;
    middleName = json['middle_name'] ??  "" ;
    lastName = json['last_name'] ??  "" ;
    guardianName = json['guardian_name'] ??  "" ;
    emailId = json['email_id'] ??  "" ;
    propertyCategoryId = json['property_category_id'] ??  "" ;
    propertyClassId = json['property_class_id'] ??  "" ;
    houseNumber = json['house_number'] ??  "" ;
    locality = json['locality'] ??  "" ;
    town = json['town'] ??  "" ;
    district = json['district'] ??  "" ;
    state = json['state'] ??  "" ;
    pinCode = json['pin_code'] ??  "" ;
    societyAllowedMdpe = json['society_allowed_mdpe'] ??  "" ;
    residentStatus = json['resident_status'] ??  "" ;
    noOfKitchen = json['no_of_kitchen'] ??  "" ;
    noOfBathroom = json['no_of_bathroom'] ??  "" ;
    existingCookingFuel = json['existing_cooking_fuel'] ??  "" ;
    noOfFamilyMembers = json['no_of_family_members'] ??  "" ;
    ownerConsent = json['owner_consent'] ??  "" ;
    kycDocument1 = json['kyc_document_1'] ??  "" ;
    kycDocument1Number = json['kyc_document_1_number'] ??  "" ;
    kycDocument2 = json['kyc_document_2'] ??  "" ;
    kycDocument2Number = json['kyc_document_2_number'] ??  "" ;
    kycDocument3 = json['kyc_document_3'] ??  "" ;
    kycDocument3Number = json['kyc_document_3_number'] ??  "" ;
    formStatus = json['form_status'] ??  "" ;
    dmaUserId = json['dma_user_id'] ??  "" ;
    remarks = json['remarks'] ??  "" ;
    longitude = json['longitude'] ??  "" ;
    latitude = json['latitude'] ??  "" ;
    cgs = json['cgs'] ??  "" ;
    chargeAreaId = json['charge_area_id'] ??  "" ;
    dateOfRegistration = json['date_of_registration'] ??  "" ;
    nameOfBank = json['name_of_bank'] ??  "" ;
    bankAccountNumber = json['bank_account_number'] ??  "" ;
    bankIfscCode = json['bank_ifsc_code'] ??  "" ;
    bankAddress = json['bank_address'] ??  "" ;
    dmaFormStatus = json['dma_form_status'] ??  "" ;
    customerConsentStatus = json['customer_consent_status'] ??  "" ;
    reasonForHold = json['reason_for_hold'] ??  "" ;
    initialDepositeDate = json['initial_deposite_date'] ??  "" ;
    modeOfDeposite = json['mode_of_deposite'] ??  "" ;
    installmentNumber = json['installment_number'] ??  "" ;
    payementBankName = json['payement_bank_name'] ??  "" ;
    paymentCreditStatus = json['payment_credit_status'] ??  "" ;
    dmaUserName = json['dma_user_name'] ??  "" ;
    initialDepositeStatus = json['initial_deposite_status'] ??  "" ;
    preferedBillingMode = json['prefered_billing_mode'] ??  "" ;
    acceptConversionPolicy = json['accept_conversion_policy'] ??  "" ;
    acceptExtraFittingCost = json['accept_extra_fitting_cost'] ??  "" ;
    customerRegistrationNo = json['customer_registration_no'] ??  "" ;
    chequeNumber = json['cheque_number'] ??  "" ;
    marketingApprovStatus = json['marketing_approv_status'] ??  "" ;
    accountApprovStatus = json['account_approv_status'] ??  "" ;
    initialAmount = json['initial_amount'] ??  "" ;
    customerConsent = json['customer_consent'] ??  "" ;
    canceledCheque = json['canceled_cheque'] ??  "" ;
    crn = json['crn'] ??  "" ;
    customerPhoto = json['customer_photo'] ??  "" ;
    housePhoto = json['house_photo'] ??  "" ;
    kycDocument1Image = json['kyc_document_1_image'] ??  "" ;
    kycDocument2Image = json['kyc_document_2_image'] ??  "" ;
    kycDocument3Image = json['kyc_document_3_image'] ??  "" ;
    buildingNumber = json['building_number'] ??  "" ;
    address1 = json['address1'] ??  "" ;
    address2 = json['address2'] ??  "" ;
    backside1 = json['backside1'] ??  "" ;
    backside2 = json['backside2'] ??  "" ;
    backside3 = json['backside3'] ??  "" ;
    chequeBankAccount = json['cheque_bank_account'] ??  "" ;
    chequePhoto = json['cheque_photo'] ??  "" ;
    isGasDepositApplicable = json['is_gasDepositApplicable'] ??  "" ;
    marketingApproval = json['marketing_approval'] ??  "" ;
    markStatusTime = json['mark_status_time'] ??  "" ;
    marketingRejectReason = json['marketing_reject_reason'] ??  "" ;
    accountingApproval = json['accounting_approval'] ??  "" ;
    accountingTime = json['accounting_time'] ??  "" ;
    accontingRejectReason = json['acconting_reject_reason'] ??  "" ;
    depositeType = json['deposite_type'] ??  "" ;
    depositSlipDate = json['deposit_slip_date'] ??  "" ;
    depositSlip = json['deposit_slip'] ??  "" ;
    transactionId = json['transaction_id'] ??  "" ;
    transactionTime = json['transaction_time'] ??  "" ;
    transactionResponseTime = json['transaction_response_time'] ??  "" ;
    bpNumber = json['bp_number'] ??  "" ;
    interested = json['interested'] ??  "" ;
    assignLmcId = json['assign_lmc_id'] ??  "" ;
    refundedAmount = json['refunded_amount'] ??  "" ;
    refundOrderid = json['refund_orderid'] ??  "" ;
    isGasdepositCollected = json['is_gasdeposit_collected'] ??  "" ;
    guardianType = json['guardian_type'] ??  "" ;
    selfRegistration = json['self_registration'] ??  "" ;
    customerStatus = json['customer_status'] ??  "" ;
    chequeBounceReason = json['cheque_bounce_reason'] ??  "" ;
    micr = json['micr'] ??  "" ;
    mobileResponseTime = json['mobile_response_time'] ??  "" ;
    isEdited = json['is_edited'] ??  "" ;
    inAccount = json['in_account'] ??  "" ;
    bounceAmount = json['bounce_amount'] ??  "" ;
    adjustableAmount = json['adjustable_amount'] ??  "" ;
    defermentAmount = json['deferment_amount'] ??  "" ;
    districtId = json['district_id'] ??  "" ;
    disconnectionStatus = json['disconnection_status'] ??  "" ;
    refundableStatu = json['refundable_statu'] ??  "" ;
    saleId = json['sale_id'] ??  "" ;
    collectionId = json['collection_id'] ??  "" ;
    ageingId = json['ageing_id'] ??  "" ;
    trNumber = json['tr_number'] ??  "" ;
    alternateMobile = json['alternateMobile'] ??  "" ;
    dmaDirPath = json['dma_dir_path'] ??  "" ;
    refundableStatus = json['refundable_status'] ??  "" ;
    source = json['source'] ??  "" ;
    futureRegNgcEligibleStatus = json['future_reg_ngc_eligible_status'] ??  "" ;
    futureRegisDate = json['future_regis_date'] ??  "" ;
    futureRegisUserId = json['future_regis_user_id'] ??  "" ;
    manualTransactionUpdateUserId = json['manual_transaction_update_user_id'] ??  "" ;
    manualTransactionUpdateRemarks = json['manual_transaction_update_remarks'] ??  "" ;
    manualTransactionPaymentMethod = json['manual_transaction_payment_method'] ??  "" ;
    customerSurveyId = json['customer_survey_id'] ??  "" ;
    upload = json['upload'] ??  "" ;
    oldMobile = json['old_mobile'] ??  "" ;
    schemeChangeStatus = json['scheme_change_status'] ??  "" ;
    schemeChangeDate = json['scheme_change_date'] ??  "" ;
    registrationDt = json['registration_dt'] ??  "" ;
    lmcFeasiDate = json['lmc_feasi_date'] ??  "" ;
    rfcDate = json['rfc_date'] ??  "" ;
    ngcDate = json['ngc_date'] ??  "" ;
    billGenDate = json['bill_gen_date'] ??  "" ;
    lmcContractor = json['lmc_contractor'] ??  "" ;
    lmcAssignDate = json['lmc_assign_date'] ??  "" ;
    schemeName = json['scheme_name'] ??  "" ;
    billDueDate = json['bill_due_date'] ??  "" ;
    billPayDate = json['bill_pay_date'] ??  "" ;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['area_id'] = this.areaId;
    data['mobile_number'] = this.mobileNumber;
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
    data['source'] = this.source;
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
    data['registration_dt'] = this.registrationDt;
    data['lmc_feasi_date'] = this.lmcFeasiDate;
    data['rfc_date'] = this.rfcDate;
    data['ngc_date'] = this.ngcDate;
    data['bill_gen_date'] = this.billGenDate;
    data['lmc_contractor'] = this.lmcContractor;
    data['lmc_assign_date'] = this.lmcAssignDate;
    data['scheme_name'] = this.schemeName;
    data['bill_due_date'] = this.billDueDate;
    data['bill_pay_date'] = this.billPayDate;
    return data;
  }
}