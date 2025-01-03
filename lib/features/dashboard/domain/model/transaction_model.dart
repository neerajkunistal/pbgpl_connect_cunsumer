List<TransactionModel> transactionListResponse(var json) {
  return List<TransactionModel>.from(json.map((x) => TransactionModel.fromJson(x)));
}

class TransactionModel {
  String? id;
  String? billNo;
  String? billAmt;
  String? billDueDate;
  dynamic billPayDate;
  String? custId;
  String? billSta;
  String? billGeneratedDate;
  dynamic paymentMode;
  dynamic trn;
  String? differAmt;
  dynamic differType;
  String? cycleStartDate;
  String? cycleEndDate;
  String? genrerateByCustomer;
  String? billReadingOld;
  String? billApproved;
  String? currentBillReading;
  String? isFirstBill;
  String? actualReadingPrice;
  String? billingTaxAmount;
  String? amountAfterTax;
  String? lateFeePeriod;
  String? billingCycle;
  String? lateFee;
  String? prevLateFee;
  dynamic amountAfterLateFee;
  String? gasDepositAmount;
  String? amountAfterGasDeposit;
  String? depositAmount;
  String? amountAfterDeposit;
  String? rebateAmount;
  String? amountAfterRebate;
  String? meterImage;
  dynamic rejectReason;
  dynamic rejectDate;
  String? billConfigId;
  String? billingTaxId;
  String? extraCharges;
  String? afterExtraCharge;
  dynamic installmentNos;
  String? equipmentDeposit;
  String? afterEquipmentDeposit;
  String? prevBillAmount;
  String? billLat;
  String? billLong;
  String? adjustment;
  String? paidAmount;
  String? remarks;
  String? balSecurityCharge;
  String? balExtraCharge;
  String? balGasConsumptionCharge;
  String? extraPipe;
  dynamic userId;
  String? prevSecuritydepositAmount;
  String? prevExtrachargeAmount;
  String? unitCharge;
  dynamic lateFeeStatus;
  String? isLastBill;
  dynamic disconnectionId;
  dynamic modificationRequestOutstandingId;
  dynamic isReconnectBill;
  dynamic reconnectionId;
  dynamic replacementId;
  dynamic meterId;
  String? rentAmount;
  String? billSq;
  String? saleId;
  String? billDirPath;
  String? collectionId;
  String? refundableStatus;
  String? ageingId;
  dynamic manualTransactionId;
  String? consumption;
  String? billType;
  dynamic averageBillReading;
  String? adjustAverageBill;
  String? creditBalance;
  String? billTakenType;
  String? meterReadingDate;
  String? billTypeStatus;
  dynamic prevAverageBillAmount;
  String? prevMeterReadingDate;
  dynamic avgNoDaysConsumption;
  dynamic avgBillScm;
  String? averageBillAmount;
  String? averageBillReadings;
  String? smsSent;
  String? genDate;
  dynamic billDueDateOld;
  String? paymentOther;
  String? credit;
  dynamic paymentDate;
  dynamic paymentMethod;
  dynamic paymentEntryDate;
  dynamic paymentTransactionId;
  dynamic paymentType;
  dynamic currentInvoiceStatus;
  dynamic lastMeterConsumption;
  dynamic currentInvoiceAmt;
  dynamic currentInvoicePaidAmt;
  String? billingCode;
  String? fromDate;
  dynamic toDate;
  String? pricePerUnit;
  String? billingCycleId;
  dynamic createdAt;
  dynamic updatedAt;
  dynamic deletedAt;
  String? status;
  dynamic sameAsBillCustGrace;
  String? sameAsBillActGrace;
  String? custGrace;
  String? actGrace;
  String? disconnectionPeriod;
  dynamic isTaxApplicable;
  dynamic taxId;
  String? approvalStatus;
  dynamic approvalComments;
  dynamic statusDate;
  String? minimumCharges;
  dynamic minimumReading;
  dynamic minimumCondition;
  dynamic replacementNo;
  String? dmaId;
  dynamic dateOfRequest;
  dynamic oldMeterId;
  dynamic oldMeterNo;
  dynamic oldMeterLastReading;
  dynamic newMeterId;
  dynamic newMeterNo;
  dynamic newMeterReading;
  dynamic replacementAmount;
  dynamic requestStatus;
  dynamic replacementStatus;
  dynamic dateOfReplacement;
  dynamic replacementReason;
  dynamic otherReason;
  dynamic replacementDocument;
  dynamic oldMeterCurrentReading;
  dynamic oldMeterImg;
  dynamic newMeterImg;
  dynamic billId;
  dynamic customerRequestId;
  dynamic lmcId;
  dynamic lmcAssignDatetime;
  dynamic storeFaultyStatus;
  dynamic storeFaultyDatetime;
  dynamic storeRemark;
  String? password;
  String? isActive;
  String? schema;
  String? mobileNumber;
  String? bpPassword;
  String? bpTextPassword;
  String? isPrimary;
  dynamic loginOtp;
  dynamic otpExpiration;
  String? areaId;
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
  dynamic longitude;
  dynamic latitude;
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
  String? trNumber;
  dynamic alternateMobile;
  dynamic dmaDirPath;
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
  String? depositName;
  String? createdOn;
  String? schemeMonth;
  String? schemeType;
  String? dateFrom;
  dynamic dateTo;
  String? schemeCode;
  String? equipmentDepositAmount;
  String? interestAmount;
  dynamic rejectComments;
  String? customerCount;
  String? registrationGst;
  dynamic interestTax;
  String? rebateId;
  String? totalAmount;
  String? firstDepositAmount;
  String? nextCycleAmount;
  String? equipmentIncludeInBill;
  String? registrationRefunded;
  String? equipmentRefunded;
  String? gasRefunded;
  String? totalAmountWith;
  String? firstDepositAmountWith;
  String? depositAmountExcludingTaxWith;
  String? registrationGstWith;
  String? depositAmountWith;
  String? benifitApplicable;
  dynamic approvalDate;
  String? depositFree;
  String? depositAmountBeforeNgc;
  String? gasDepositAmountStatus;
  String? gasDepositInFirstBill;
  String? ruleNo;
  String? taxPer;
  String? taxName;
  String? taxType;
  String? amtType;
  String? cgstTax;
  String? igstTax;
  String? gid;
  dynamic objectid;
  String? areaName;
  dynamic shapeLeng;
  String? areacode;
  dynamic cityId;
  dynamic subareacod;
  dynamic shapeLe1;
  dynamic shapeArea;
  String? readyForConnection;
  String? chargeAreaCode;
  dynamic projectId;
  String? chargeAreaName;
  String? name;
  String? address;
  String? phoneNumber;
  String? email;
  dynamic userAreaMappingTable;
  dynamic areaMappingId;
  String? adminId;
  String? userIndentId;
  String? companyName;
  String? assigendGa;
  dynamic assignedChargearea;
  String? textpassword;
  String? craetedDate;
  dynamic activatedDate;
  dynamic deactivatedDate;
  String? cityTown;
  String? lead;
  String? isHo;
  String? level;
  String? pwdChanged;
  String? moduleId;
  dynamic userTypeId;
  dynamic userImage;
  dynamic signImage;
  dynamic otpCreatedDate;
  dynamic otpUpdatedAt;
  dynamic otp;
  dynamic changePwdDate;
  dynamic objectid1;
  String? add;
  String? projectCode;
  String? dbname;
  dynamic labelForDashboard;
  String? gstNumber;
  dynamic panNumber;
  String? gaAddress;
  String? cinNumber;
  dynamic branchEmail;
  String? customerCare;
  String? vat;
  dynamic fax;
  dynamic cst;
  String? website;
  String? billingAddress;
  String? gaLabel;
  String? projectLogo;
  dynamic clientLogo;
  dynamic pmcLogo;
  dynamic contractorLogo;
  String? client;
  String? projectDesc;
  String? businessObject;
  dynamic pmc;
  dynamic contractor;
  String? gaCustomCode;
  String? gaLatitude;
  String? gaLongitude;
  String? meterreaderuser;
  String? textPwd;
  String? billTypeData;
  String? depositTaxPer;
  String? taxPerWith;
  dynamic billRemarks;
  dynamic invoiceLink;
  dynamic totalInvoiceAmount;
  dynamic billTypeNameStatus;

  TransactionModel(
      {this.id,
        this.billNo,
        this.billAmt,
        this.billDueDate,
        this.billPayDate,
        this.custId,
        this.billSta,
        this.billGeneratedDate,
        this.paymentMode,
        this.trn,
        this.differAmt,
        this.differType,
        this.cycleStartDate,
        this.cycleEndDate,
        this.genrerateByCustomer,
        this.billReadingOld,
        this.billApproved,
        this.currentBillReading,
        this.isFirstBill,
        this.actualReadingPrice,
        this.billingTaxAmount,
        this.amountAfterTax,
        this.lateFeePeriod,
        this.billingCycle,
        this.lateFee,
        this.prevLateFee,
        this.amountAfterLateFee,
        this.gasDepositAmount,
        this.amountAfterGasDeposit,
        this.depositAmount,
        this.amountAfterDeposit,
        this.rebateAmount,
        this.amountAfterRebate,
        this.meterImage,
        this.rejectReason,
        this.rejectDate,
        this.billConfigId,
        this.billingTaxId,
        this.extraCharges,
        this.afterExtraCharge,
        this.installmentNos,
        this.equipmentDeposit,
        this.afterEquipmentDeposit,
        this.prevBillAmount,
        this.billLat,
        this.billLong,
        this.adjustment,
        this.paidAmount,
        this.remarks,
        this.balSecurityCharge,
        this.balExtraCharge,
        this.balGasConsumptionCharge,
        this.extraPipe,
        this.userId,
        this.prevSecuritydepositAmount,
        this.prevExtrachargeAmount,
        this.unitCharge,
        this.lateFeeStatus,
        this.isLastBill,
        this.disconnectionId,
        this.modificationRequestOutstandingId,
        this.isReconnectBill,
        this.reconnectionId,
        this.replacementId,
        this.meterId,
        this.rentAmount,
        this.billSq,
        this.saleId,
        this.billDirPath,
        this.collectionId,
        this.refundableStatus,
        this.ageingId,
        this.manualTransactionId,
        this.consumption,
        this.billType,
        this.averageBillReading,
        this.adjustAverageBill,
        this.creditBalance,
        this.billTakenType,
        this.meterReadingDate,
        this.billTypeStatus,
        this.prevAverageBillAmount,
        this.prevMeterReadingDate,
        this.avgNoDaysConsumption,
        this.avgBillScm,
        this.averageBillAmount,
        this.averageBillReadings,
        this.smsSent,
        this.genDate,
        this.billDueDateOld,
        this.paymentOther,
        this.credit,
        this.paymentDate,
        this.paymentMethod,
        this.paymentEntryDate,
        this.paymentTransactionId,
        this.paymentType,
        this.currentInvoiceStatus,
        this.lastMeterConsumption,
        this.currentInvoiceAmt,
        this.currentInvoicePaidAmt,
        this.billingCode,
        this.fromDate,
        this.toDate,
        this.pricePerUnit,
        this.billingCycleId,
        this.createdAt,
        this.updatedAt,
        this.deletedAt,
        this.status,
        this.sameAsBillCustGrace,
        this.sameAsBillActGrace,
        this.custGrace,
        this.actGrace,
        this.disconnectionPeriod,
        this.isTaxApplicable,
        this.taxId,
        this.approvalStatus,
        this.approvalComments,
        this.statusDate,
        this.minimumCharges,
        this.minimumReading,
        this.minimumCondition,
        this.replacementNo,
        this.dmaId,
        this.dateOfRequest,
        this.oldMeterId,
        this.oldMeterNo,
        this.oldMeterLastReading,
        this.newMeterId,
        this.newMeterNo,
        this.newMeterReading,
        this.replacementAmount,
        this.requestStatus,
        this.replacementStatus,
        this.dateOfReplacement,
        this.replacementReason,
        this.otherReason,
        this.replacementDocument,
        this.oldMeterCurrentReading,
        this.oldMeterImg,
        this.newMeterImg,
        this.billId,
        this.customerRequestId,
        this.lmcId,
        this.lmcAssignDatetime,
        this.storeFaultyStatus,
        this.storeFaultyDatetime,
        this.storeRemark,
        this.password,
        this.isActive,
        this.schema,
        this.mobileNumber,
        this.bpPassword,
        this.bpTextPassword,
        this.isPrimary,
        this.loginOtp,
        this.otpExpiration,
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
        this.trNumber,
        this.alternateMobile,
        this.dmaDirPath,
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
        this.depositName,
        this.createdOn,
        this.schemeMonth,
        this.schemeType,
        this.dateFrom,
        this.dateTo,
        this.schemeCode,
        this.equipmentDepositAmount,
        this.interestAmount,
        this.rejectComments,
        this.customerCount,
        this.registrationGst,
        this.interestTax,
        this.rebateId,
        this.totalAmount,
        this.firstDepositAmount,
        this.nextCycleAmount,
        this.equipmentIncludeInBill,
        this.registrationRefunded,
        this.equipmentRefunded,
        this.gasRefunded,
        this.totalAmountWith,
        this.firstDepositAmountWith,
        this.depositAmountExcludingTaxWith,
        this.registrationGstWith,
        this.depositAmountWith,
        this.benifitApplicable,
        this.approvalDate,
        this.depositFree,
        this.depositAmountBeforeNgc,
        this.gasDepositAmountStatus,
        this.gasDepositInFirstBill,
        this.ruleNo,
        this.taxPer,
        this.taxName,
        this.taxType,
        this.amtType,
        this.cgstTax,
        this.igstTax,
        this.gid,
        this.objectid,
        this.areaName,
        this.shapeLeng,
        this.areacode,
        this.cityId,
        this.subareacod,
        this.shapeLe1,
        this.shapeArea,
        this.readyForConnection,
        this.chargeAreaCode,
        this.projectId,
        this.chargeAreaName,
        this.name,
        this.address,
        this.phoneNumber,
        this.email,
        this.userAreaMappingTable,
        this.areaMappingId,
        this.adminId,
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
        this.otp,
        this.changePwdDate,
        this.objectid1,
        this.add,
        this.projectCode,
        this.dbname,
        this.labelForDashboard,
        this.gstNumber,
        this.panNumber,
        this.gaAddress,
        this.cinNumber,
        this.branchEmail,
        this.customerCare,
        this.vat,
        this.fax,
        this.cst,
        this.website,
        this.billingAddress,
        this.gaLabel,
        this.projectLogo,
        this.clientLogo,
        this.pmcLogo,
        this.contractorLogo,
        this.client,
        this.projectDesc,
        this.businessObject,
        this.pmc,
        this.contractor,
        this.gaCustomCode,
        this.gaLatitude,
        this.gaLongitude,
        this.meterreaderuser,
        this.textPwd,
        this.billTypeData,
        this.depositTaxPer,
        this.taxPerWith,
        this.billRemarks,
        this.invoiceLink,
        this.totalInvoiceAmount,
        this.billTypeNameStatus,
      });

  TransactionModel.fromJson(Map<String, dynamic> json) {
    id = json['id'] ??  "" ;
    billNo = json['bill_no'] ??  "" ;
    billAmt = json['bill_amt'] ??  "" ;
    billDueDate = json['bill_due_date'] ??  "" ;
    billPayDate = json['bill_pay_date'] ??  "" ;
    custId = json['cust_id'] ??  "" ;
    billSta = json['bill_sta'] ??  "" ;
    billGeneratedDate = json['bill_generated_date'] ??  "" ;
    paymentMode = json['payment_mode'] ??  "" ;
    trn = json['trn'] ??  "" ;
    differAmt = json['differ_amt'] ??  "" ;
    differType = json['differ_type'] ??  "" ;
    cycleStartDate = json['cycle_start_date'] ??  "" ;
    cycleEndDate = json['cycle_end_date'] ??  "" ;
    genrerateByCustomer = json['genrerate_by_customer'] ??  "" ;
    billReadingOld = json['bill_reading_old'] ??  "" ;
    billApproved = json['bill_approved'] ??  "" ;
    currentBillReading = json['current_bill_reading'] ??  "" ;
    isFirstBill = json['is_first_bill'] ??  "" ;
    actualReadingPrice = json['actual_reading_price'] ??  "" ;
    billingTaxAmount = json['billing_tax_amount'] ??  "" ;
    amountAfterTax = json['amount_after_tax'] ??  "" ;
    lateFeePeriod = json['late_fee_period'] ??  "" ;
    billingCycle = json['billing_cycle'] ??  "" ;
    lateFee = json['late_fee'] ??  "" ;
    prevLateFee = json['prev_late_fee'] ??  "" ;
    amountAfterLateFee = json['amount_after_late_fee'] ??  "" ;
    gasDepositAmount = json['gas_deposit_amount'] ??  "" ;
    amountAfterGasDeposit = json['amount_after_gas_deposit'] ??  "" ;
    depositAmount = json['deposit_amount'] ??  "" ;
    amountAfterDeposit = json['amount_after_deposit'] ??  "" ;
    rebateAmount = json['rebate_amount'] ??  "" ;
    amountAfterRebate = json['amount_after_rebate'] ??  "" ;
    meterImage = json['meter_image'] ??  "" ;
    rejectReason = json['reject_reason'] ??  "" ;
    rejectDate = json['reject_date'] ??  "" ;
    billConfigId = json['bill_config_id'] ??  "" ;
    billingTaxId = json['billing_tax_id'] ??  "" ;
    extraCharges = json['extra_charges'] ??  "" ;
    afterExtraCharge = json['after_extra_charge'] ??  "" ;
    installmentNos = json['installment_nos'] ??  "" ;
    equipmentDeposit = json['equipment_deposit'] ??  "" ;
    afterEquipmentDeposit = json['after_equipment_deposit'] ??  "" ;
    prevBillAmount = json['prev_bill_amount'] ??  "" ;
    billLat = json['bill_lat'] ??  "" ;
    billLong = json['bill_long'] ??  "" ;
    adjustment = json['adjustment'] ??  "" ;
    paidAmount = json['paid_amount'] ??  "" ;
    remarks = json['remarks'] ??  "" ;
    balSecurityCharge = json['bal_security_charge'] ??  "" ;
    balExtraCharge = json['bal_extra_charge'] ??  "" ;
    balGasConsumptionCharge = json['bal_gas_consumption_charge'] ??  "" ;
    extraPipe = json['extra_pipe'] ??  "" ;
    userId = json['user_id'] ??  "" ;
    prevSecuritydepositAmount = json['prev_securitydeposit_amount'] ??  "" ;
    prevExtrachargeAmount = json['prev_extracharge_amount'] ??  "" ;
    unitCharge = json['unit_charge'] ??  "" ;
    lateFeeStatus = json['late_fee_status'] ??  "" ;
    isLastBill = json['is_last_bill'] ??  "" ;
    disconnectionId = json['disconnection_id'] ??  "" ;
    modificationRequestOutstandingId =
    json['modification_request_outstanding_id'] ??  "" ;
    isReconnectBill = json['is_reconnect_bill'] ??  "" ;
    reconnectionId = json['reconnection_id'] ??  "" ;
    replacementId = json['replacement_id'] ??  "" ;
    meterId = json['meter_id'] ??  "" ;
    rentAmount = json['rent_amount'] ??  "" ;
    billSq = json['bill_sq'] ??  "" ;
    saleId = json['sale_id'] ??  "" ;
    billDirPath = json['bill_dir_path'] ??  "" ;
    collectionId = json['collection_id'] ??  "" ;
    refundableStatus = json['refundable_status'] ??  "" ;
    ageingId = json['ageing_id'] ??  "" ;
    manualTransactionId = json['manual_transaction_id'] ??  "" ;
    consumption = json['consumption'] ??  "" ;
    billType = json['bill_type'] ??  "" ;
    averageBillReading = json['average_bill_reading'] ??  "" ;
    adjustAverageBill = json['adjust_average_bill'] ??  "" ;
    creditBalance = json['credit_balance'] ??  "" ;
    billTakenType = json['bill_taken_type'] ??  "" ;
    meterReadingDate = json['meter_reading_date'] ??  "" ;
    billTypeStatus = json['bill_type_status'] ??  "" ;
    prevAverageBillAmount = json['prev_average_bill_amount'] ??  "" ;
    prevMeterReadingDate = json['prev_meter_reading_date'] ??  "" ;
    avgNoDaysConsumption = json['avg_no_days_consumption'] ??  "" ;
    avgBillScm = json['avg_bill_scm'] ??  "" ;
    averageBillAmount = json['average_bill_amount'] ??  "" ;
    averageBillReadings = json['average_bill_readings'] ??  "" ;
    smsSent = json['sms_sent'] ??  "" ;
    genDate = json['gen_date'] ??  "" ;
    billDueDateOld = json['bill_due_date_old'] ??  "" ;
    paymentOther = json['payment_other'] ??  "" ;
    credit = json['credit'] ??  "" ;
    paymentDate = json['payment_date'] ??  "" ;
    paymentMethod = json['payment_method'] ??  "" ;
    paymentEntryDate = json['payment_entry_date'] ??  "" ;
    paymentTransactionId = json['payment_transaction_id'] ??  "" ;
    paymentType = json['payment_type'] ??  "" ;
    currentInvoiceStatus = json['current_invoice_status'] ??  "" ;
    lastMeterConsumption = json['last_meter_consumption'] ??  "" ;
    currentInvoiceAmt = json['current_invoice_amt'] ??  "" ;
    currentInvoicePaidAmt = json['current_invoice_paid_amt'] ??  "" ;
    billingCode = json['billing_code'] ??  "" ;
    fromDate = json['from_date'] ??  "" ;
    toDate = json['to_date'] ??  "" ;
    pricePerUnit = json['price_per_unit'] ??  "" ;
    billingCycleId = json['billing_cycle_id'] ??  "" ;
    createdAt = json['created_at'] ??  "" ;
    updatedAt = json['updated_at'] ??  "" ;
    deletedAt = json['deleted_at'] ??  "" ;
    status = json['status'] ??  "" ;
    sameAsBillCustGrace = json['same_as_bill_cust_grace'] ??  "" ;
    sameAsBillActGrace = json['same_as_bill_act_grace'] ??  "" ;
    custGrace = json['cust_grace'] ??  "" ;
    actGrace = json['act_grace'] ??  "" ;
    disconnectionPeriod = json['disconnection_period'] ??  "" ;
    isTaxApplicable = json['is_tax_applicable'] ??  "" ;
    taxId = json['tax_id'] ??  "" ;
    approvalStatus = json['approval_status'] ??  "" ;
    approvalComments = json['approval_comments'] ??  "" ;
    statusDate = json['status_date'] ??  "" ;
    minimumCharges = json['minimum_charges'] ??  "" ;
    minimumReading = json['minimum_reading'] ??  "" ;
    minimumCondition = json['minimum_condition'] ??  "" ;
    replacementNo = json['replacement_no'] ??  "" ;
    dmaId = json['dma_id'] ??  "" ;
    dateOfRequest = json['date_of_request'] ??  "" ;
    oldMeterId = json['old_meter_id'] ??  "" ;
    oldMeterNo = json['old_meter_no'] ??  "" ;
    oldMeterLastReading = json['old_meter_last_reading'] ??  "" ;
    newMeterId = json['new_meter_id'] ??  "" ;
    newMeterNo = json['new_meter_no'] ??  "" ;
    newMeterReading = json['new_meter_reading'] ??  "" ;
    replacementAmount = json['replacement_amount'] ??  "" ;
    requestStatus = json['request_status'] ??  "" ;
    replacementStatus = json['replacement_status'] ??  "" ;
    dateOfReplacement = json['date_of_replacement'] ??  "" ;
    replacementReason = json['replacement_reason'] ??  "" ;
    otherReason = json['other_reason'] ??  "" ;
    replacementDocument = json['replacement_document'] ??  "" ;
    oldMeterCurrentReading = json['old_meter_current_reading'] ??  "" ;
    oldMeterImg = json['old_meter_img'] ??  "" ;
    newMeterImg = json['new_meter_img'] ??  "" ;
    billId = json['bill_id'] ??  "" ;
    customerRequestId = json['customer_request_id'] ??  "" ;
    lmcId = json['lmc_id'] ??  "" ;
    lmcAssignDatetime = json['lmc_assign_datetime'] ??  "" ;
    storeFaultyStatus = json['store_faulty_status'] ??  "" ;
    storeFaultyDatetime = json['store_faulty_datetime'] ??  "" ;
    storeRemark = json['store_remark'] ??  "" ;
    password = json['password'] ??  "" ;
    isActive = json['is_active'] ??  "" ;
    schema = json['schema'] ??  "" ;
    mobileNumber = json['mobile_number'] ??  "" ;
    bpPassword = json['bp_password'] ??  "" ;
    bpTextPassword = json['bp_text_password'] ??  "" ;
    isPrimary = json['is_primary'] ??  "" ;
    loginOtp = json['login_otp'] ??  "" ;
    otpExpiration = json['otp_expiration'] ??  "" ;
    areaId = json['area_id'] ??  "" ;
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
    trNumber = json['tr_number'] ??  "" ;
    alternateMobile = json['alternateMobile'] ??  "" ;
    dmaDirPath = json['dma_dir_path'] ??  "" ;
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
    depositName = json['deposit_name'] ??  "" ;
    createdOn = json['created_on'] ??  "" ;
    schemeMonth = json['scheme_month'] ??  "" ;
    schemeType = json['scheme_type'] ??  "" ;
    dateFrom = json['date_from'] ??  "" ;
    dateTo = json['date_to'] ??  "" ;
    schemeCode = json['scheme_code'] ??  "" ;
    equipmentDepositAmount = json['equipment_deposit_amount'] ??  "" ;
    interestAmount = json['interest_amount'] ??  "" ;
    rejectComments = json['reject_comments'] ??  "" ;
    customerCount = json['customer_count'] ??  "" ;
    registrationGst = json['registration_gst'] ??  "" ;
    interestTax = json['interest_tax'] ??  "" ;
    rebateId = json['rebate_id'] ??  "" ;
    totalAmount = json['totalAmount'] ??  "" ;
    firstDepositAmount = json['firstDepositAmount'] ??  "" ;
    nextCycleAmount = json['nextCycleAmount'] ??  "" ;
    equipmentIncludeInBill = json['equipment_include_in_bill'] ??  "" ;
    registrationRefunded = json['registration_refunded'] ??  "" ;
    equipmentRefunded = json['equipment_refunded'] ??  "" ;
    gasRefunded = json['gas_refunded'] ??  "" ;
    totalAmountWith = json['totalAmountWith'] ??  "" ;
    firstDepositAmountWith = json['firstDepositAmountWith'] ??  "" ;
    depositAmountExcludingTaxWith = json['deposit_amount_excluding_tax_with'] ??  "" ;
    registrationGstWith = json['registration_gst_with'] ??  "" ;
    depositAmountWith = json['deposit_amount_with'] ??  "" ;
    benifitApplicable = json['benifit_applicable'] ??  "" ;
    approvalDate = json['approval_date'] ??  "" ;
    depositFree = json['deposit_free'] ??  "" ;
    depositAmountBeforeNgc = json['deposit_amount_before_ngc'] ??  "" ;
    gasDepositAmountStatus = json['gas_deposit_amount_status'] ??  "" ;
    gasDepositInFirstBill = json['gas_deposit_in_first_bill'] ??  "" ;
    ruleNo = json['rule_no'] ??  "" ;
    taxPer = json['tax_per'] ??  "" ;
    taxName = json['tax_name'] ??  "" ;
    taxType = json['tax_type'] ??  "" ;
    amtType = json['amt_type'] ??  "" ;
    cgstTax = json['cgst_tax'] ??  "" ;
    igstTax = json['igst_tax'] ??  "" ;
    gid = json['gid'] ??  "" ;
    objectid = json['objectid'] ??  "" ;
    areaName = json['area_name'] ??  "" ;
    shapeLeng = json['shape_leng'] ??  "" ;
    areacode = json['areacode'] ??  "" ;
    cityId = json['city_id'] ??  "" ;
    subareacod = json['subareacod'] ??  "" ;
    shapeLe1 = json['shape_le_1'] ??  "" ;
    shapeArea = json['shape_area'] ??  "" ;
    readyForConnection = json['ready_for_connection'] ??  "" ;
    chargeAreaCode = json['charge_area_code'] ??  "" ;
    projectId = json['project_id'] ??  "" ;
    chargeAreaName = json['charge_area_name'] ??  "" ;
    name = json['name'] ??  "" ;
    address = json['address'] ??  "" ;
    phoneNumber = json['phone_number'] ??  "" ;
    email = json['email'] ??  "" ;
    userAreaMappingTable = json['user_area_mapping_table'] ??  "" ;
    areaMappingId = json['area_mapping_id'] ??  "" ;
    adminId = json['admin_id'] ??  "" ;
    userIndentId = json['user_indent_id'] ??  "" ;
    companyName = json['company_name'] ??  "" ;
    assigendGa = json['assigend_ga'] ??  "" ;
    assignedChargearea = json['assigned_chargearea'] ??  "" ;
    textpassword = json['textpassword'] ??  "" ;
    craetedDate = json['craeted_date'] ??  "" ;
    activatedDate = json['activated_date'] ??  "" ;
    deactivatedDate = json['deactivated_date'] ??  "" ;
    cityTown = json['city_town'] ??  "" ;
    lead = json['lead'] ??  "" ;
    isHo = json['is_ho'] ??  "" ;
    level = json['level'] ??  "" ;
    pwdChanged = json['pwd_changed'] ??  "" ;
    moduleId = json['module_id'] ??  "" ;
    userTypeId = json['user_type_id'] ??  "" ;
    userImage = json['user_image'] ??  "" ;
    signImage = json['sign_image'] ??  "" ;
    otpCreatedDate = json['otp_created_date'] ??  "" ;
    otpUpdatedAt = json['otp_updated_at'] ??  "" ;
    otp = json['otp'] ??  "" ;
    changePwdDate = json['change_pwd_date'] ??  "" ;
    objectid1 = json['objectid_1'] ??  "" ;
    add = json['add_'] ??  "" ;
    projectCode = json['project_code'] ??  "" ;
    dbname = json['dbname'] ??  "" ;
    labelForDashboard = json['label_for_dashboard'] ??  "" ;
    gstNumber = json['gst_number'] ??  "" ;
    panNumber = json['pan_number'] ??  "" ;
    gaAddress = json['ga_address'] ??  "" ;
    cinNumber = json['cin_number'] ??  "" ;
    branchEmail = json['branch_email'] ??  "" ;
    customerCare = json['customer_care'] ??  "" ;
    vat = json['vat'] ??  "" ;
    fax = json['fax'] ??  "" ;
    cst = json['cst'] ??  "" ;
    website = json['website'] ??  "" ;
    billingAddress = json['billing_address'] ??  "" ;
    gaLabel = json['ga_label'] ??  "" ;
    projectLogo = json['project_logo'] ??  "" ;
    clientLogo = json['client_logo'] ??  "" ;
    pmcLogo = json['pmc_logo'] ??  "" ;
    contractorLogo = json['contractor_logo'] ??  "" ;
    client = json['client'] ??  "" ;
    projectDesc = json['project_desc'] ??  "" ;
    businessObject = json['business_object'] ??  "" ;
    pmc = json['pmc'] ??  "" ;
    contractor = json['contractor'] ??  "" ;
    gaCustomCode = json['ga_custom_code'] ??  "" ;
    gaLatitude = json['ga_latitude'] ??  "" ;
    gaLongitude = json['ga_longitude'] ??  "" ;
    meterreaderuser = json['meterreaderuser'] ??  "" ;
    textPwd = json['text_pwd'] ??  "" ;
    billId = json['BillId'] ??  "" ;
    billTypeData = json['bill_type_data'] ??  "" ;
    depositTaxPer = json['deposit_tax_per'] ??  "" ;
    taxPerWith = json['tax_per_with'] ??  "" ;
    billRemarks = json['bill_remarks'] ??  "" ;
    invoiceLink = json['invoice_link'] ??  "" ;
    totalInvoiceAmount = json['total_invoice_amt'] ??  "" ;
    billTypeNameStatus = json['bill_type_status_name'] ??  "" ;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['bill_no'] = this.billNo;
    data['bill_amt'] = this.billAmt;
    data['bill_due_date'] = this.billDueDate;
    data['bill_pay_date'] = this.billPayDate;
    data['cust_id'] = this.custId;
    data['bill_sta'] = this.billSta;
    data['bill_generated_date'] = this.billGeneratedDate;
    data['payment_mode'] = this.paymentMode;
    data['trn'] = this.trn;
    data['differ_amt'] = this.differAmt;
    data['differ_type'] = this.differType;
    data['cycle_start_date'] = this.cycleStartDate;
    data['cycle_end_date'] = this.cycleEndDate;
    data['genrerate_by_customer'] = this.genrerateByCustomer;
    data['bill_reading_old'] = this.billReadingOld;
    data['bill_approved'] = this.billApproved;
    data['current_bill_reading'] = this.currentBillReading;
    data['is_first_bill'] = this.isFirstBill;
    data['actual_reading_price'] = this.actualReadingPrice;
    data['billing_tax_amount'] = this.billingTaxAmount;
    data['amount_after_tax'] = this.amountAfterTax;
    data['late_fee_period'] = this.lateFeePeriod;
    data['billing_cycle'] = this.billingCycle;
    data['late_fee'] = this.lateFee;
    data['prev_late_fee'] = this.prevLateFee;
    data['amount_after_late_fee'] = this.amountAfterLateFee;
    data['gas_deposit_amount'] = this.gasDepositAmount;
    data['amount_after_gas_deposit'] = this.amountAfterGasDeposit;
    data['deposit_amount'] = this.depositAmount;
    data['amount_after_deposit'] = this.amountAfterDeposit;
    data['rebate_amount'] = this.rebateAmount;
    data['amount_after_rebate'] = this.amountAfterRebate;
    data['meter_image'] = this.meterImage;
    data['reject_reason'] = this.rejectReason;
    data['reject_date'] = this.rejectDate;
    data['bill_config_id'] = this.billConfigId;
    data['billing_tax_id'] = this.billingTaxId;
    data['extra_charges'] = this.extraCharges;
    data['after_extra_charge'] = this.afterExtraCharge;
    data['installment_nos'] = this.installmentNos;
    data['equipment_deposit'] = this.equipmentDeposit;
    data['after_equipment_deposit'] = this.afterEquipmentDeposit;
    data['prev_bill_amount'] = this.prevBillAmount;
    data['bill_lat'] = this.billLat;
    data['bill_long'] = this.billLong;
    data['adjustment'] = this.adjustment;
    data['paid_amount'] = this.paidAmount;
    data['remarks'] = this.remarks;
    data['bal_security_charge'] = this.balSecurityCharge;
    data['bal_extra_charge'] = this.balExtraCharge;
    data['bal_gas_consumption_charge'] = this.balGasConsumptionCharge;
    data['extra_pipe'] = this.extraPipe;
    data['user_id'] = this.userId;
    data['prev_securitydeposit_amount'] = this.prevSecuritydepositAmount;
    data['prev_extracharge_amount'] = this.prevExtrachargeAmount;
    data['unit_charge'] = this.unitCharge;
    data['late_fee_status'] = this.lateFeeStatus;
    data['is_last_bill'] = this.isLastBill;
    data['disconnection_id'] = this.disconnectionId;
    data['modification_request_outstanding_id'] =
        this.modificationRequestOutstandingId;
    data['is_reconnect_bill'] = this.isReconnectBill;
    data['reconnection_id'] = this.reconnectionId;
    data['replacement_id'] = this.replacementId;
    data['meter_id'] = this.meterId;
    data['rent_amount'] = this.rentAmount;
    data['bill_sq'] = this.billSq;
    data['sale_id'] = this.saleId;
    data['bill_dir_path'] = this.billDirPath;
    data['collection_id'] = this.collectionId;
    data['refundable_status'] = this.refundableStatus;
    data['ageing_id'] = this.ageingId;
    data['manual_transaction_id'] = this.manualTransactionId;
    data['consumption'] = this.consumption;
    data['bill_type'] = this.billType;
    data['average_bill_reading'] = this.averageBillReading;
    data['adjust_average_bill'] = this.adjustAverageBill;
    data['credit_balance'] = this.creditBalance;
    data['bill_taken_type'] = this.billTakenType;
    data['meter_reading_date'] = this.meterReadingDate;
    data['bill_type_status'] = this.billTypeStatus;
    data['prev_average_bill_amount'] = this.prevAverageBillAmount;
    data['prev_meter_reading_date'] = this.prevMeterReadingDate;
    data['avg_no_days_consumption'] = this.avgNoDaysConsumption;
    data['avg_bill_scm'] = this.avgBillScm;
    data['average_bill_amount'] = this.averageBillAmount;
    data['average_bill_readings'] = this.averageBillReadings;
    data['sms_sent'] = this.smsSent;
    data['gen_date'] = this.genDate;
    data['bill_due_date_old'] = this.billDueDateOld;
    data['payment_other'] = this.paymentOther;
    data['credit'] = this.credit;
    data['payment_date'] = this.paymentDate;
    data['payment_method'] = this.paymentMethod;
    data['payment_entry_date'] = this.paymentEntryDate;
    data['payment_transaction_id'] = this.paymentTransactionId;
    data['payment_type'] = this.paymentType;
    data['current_invoice_status'] = this.currentInvoiceStatus;
    data['last_meter_consumption'] = this.lastMeterConsumption;
    data['current_invoice_amt'] = this.currentInvoiceAmt;
    data['current_invoice_paid_amt'] = this.currentInvoicePaidAmt;
    data['billing_code'] = this.billingCode;
    data['from_date'] = this.fromDate;
    data['to_date'] = this.toDate;
    data['price_per_unit'] = this.pricePerUnit;
    data['billing_cycle_id'] = this.billingCycleId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    data['status'] = this.status;
    data['same_as_bill_cust_grace'] = this.sameAsBillCustGrace;
    data['same_as_bill_act_grace'] = this.sameAsBillActGrace;
    data['cust_grace'] = this.custGrace;
    data['act_grace'] = this.actGrace;
    data['disconnection_period'] = this.disconnectionPeriod;
    data['is_tax_applicable'] = this.isTaxApplicable;
    data['tax_id'] = this.taxId;
    data['approval_status'] = this.approvalStatus;
    data['approval_comments'] = this.approvalComments;
    data['status_date'] = this.statusDate;
    data['minimum_charges'] = this.minimumCharges;
    data['minimum_reading'] = this.minimumReading;
    data['minimum_condition'] = this.minimumCondition;
    data['replacement_no'] = this.replacementNo;
    data['dma_id'] = this.dmaId;
    data['date_of_request'] = this.dateOfRequest;
    data['old_meter_id'] = this.oldMeterId;
    data['old_meter_no'] = this.oldMeterNo;
    data['old_meter_last_reading'] = this.oldMeterLastReading;
    data['new_meter_id'] = this.newMeterId;
    data['new_meter_no'] = this.newMeterNo;
    data['new_meter_reading'] = this.newMeterReading;
    data['replacement_amount'] = this.replacementAmount;
    data['request_status'] = this.requestStatus;
    data['replacement_status'] = this.replacementStatus;
    data['date_of_replacement'] = this.dateOfReplacement;
    data['replacement_reason'] = this.replacementReason;
    data['other_reason'] = this.otherReason;
    data['replacement_document'] = this.replacementDocument;
    data['old_meter_current_reading'] = this.oldMeterCurrentReading;
    data['old_meter_img'] = this.oldMeterImg;
    data['new_meter_img'] = this.newMeterImg;
    data['bill_id'] = this.billId;
    data['customer_request_id'] = this.customerRequestId;
    data['lmc_id'] = this.lmcId;
    data['lmc_assign_datetime'] = this.lmcAssignDatetime;
    data['store_faulty_status'] = this.storeFaultyStatus;
    data['store_faulty_datetime'] = this.storeFaultyDatetime;
    data['store_remark'] = this.storeRemark;
    data['password'] = this.password;
    data['is_active'] = this.isActive;
    data['schema'] = this.schema;
    data['mobile_number'] = this.mobileNumber;
    data['bp_password'] = this.bpPassword;
    data['bp_text_password'] = this.bpTextPassword;
    data['is_primary'] = this.isPrimary;
    data['login_otp'] = this.loginOtp;
    data['otp_expiration'] = this.otpExpiration;
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
    data['tr_number'] = this.trNumber;
    data['alternateMobile'] = this.alternateMobile;
    data['dma_dir_path'] = this.dmaDirPath;
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
    data['deposit_name'] = this.depositName;
    data['created_on'] = this.createdOn;
    data['scheme_month'] = this.schemeMonth;
    data['scheme_type'] = this.schemeType;
    data['date_from'] = this.dateFrom;
    data['date_to'] = this.dateTo;
    data['scheme_code'] = this.schemeCode;
    data['equipment_deposit_amount'] = this.equipmentDepositAmount;
    data['interest_amount'] = this.interestAmount;
    data['reject_comments'] = this.rejectComments;
    data['customer_count'] = this.customerCount;
    data['registration_gst'] = this.registrationGst;
    data['interest_tax'] = this.interestTax;
    data['rebate_id'] = this.rebateId;
    data['totalAmount'] = this.totalAmount;
    data['firstDepositAmount'] = this.firstDepositAmount;
    data['nextCycleAmount'] = this.nextCycleAmount;
    data['equipment_include_in_bill'] = this.equipmentIncludeInBill;
    data['registration_refunded'] = this.registrationRefunded;
    data['equipment_refunded'] = this.equipmentRefunded;
    data['gas_refunded'] = this.gasRefunded;
    data['totalAmountWith'] = this.totalAmountWith;
    data['firstDepositAmountWith'] = this.firstDepositAmountWith;
    data['deposit_amount_excluding_tax_with'] =
        this.depositAmountExcludingTaxWith;
    data['registration_gst_with'] = this.registrationGstWith;
    data['deposit_amount_with'] = this.depositAmountWith;
    data['benifit_applicable'] = this.benifitApplicable;
    data['approval_date'] = this.approvalDate;
    data['deposit_free'] = this.depositFree;
    data['deposit_amount_before_ngc'] = this.depositAmountBeforeNgc;
    data['gas_deposit_amount_status'] = this.gasDepositAmountStatus;
    data['gas_deposit_in_first_bill'] = this.gasDepositInFirstBill;
    data['rule_no'] = this.ruleNo;
    data['tax_per'] = this.taxPer;
    data['tax_name'] = this.taxName;
    data['tax_type'] = this.taxType;
    data['amt_type'] = this.amtType;
    data['cgst_tax'] = this.cgstTax;
    data['igst_tax'] = this.igstTax;
    data['gid'] = this.gid;
    data['objectid'] = this.objectid;
    data['area_name'] = this.areaName;
    data['shape_leng'] = this.shapeLeng;
    data['areacode'] = this.areacode;
    data['city_id'] = this.cityId;
    data['subareacod'] = this.subareacod;
    data['shape_le_1'] = this.shapeLe1;
    data['shape_area'] = this.shapeArea;
    data['ready_for_connection'] = this.readyForConnection;
    data['charge_area_code'] = this.chargeAreaCode;
    data['project_id'] = this.projectId;
    data['charge_area_name'] = this.chargeAreaName;
    data['name'] = this.name;
    data['address'] = this.address;
    data['phone_number'] = this.phoneNumber;
    data['email'] = this.email;
    data['user_area_mapping_table'] = this.userAreaMappingTable;
    data['area_mapping_id'] = this.areaMappingId;
    data['admin_id'] = this.adminId;
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
    data['otp'] = this.otp;
    data['change_pwd_date'] = this.changePwdDate;
    data['objectid_1'] = this.objectid1;
    data['add_'] = this.add;
    data['project_code'] = this.projectCode;
    data['dbname'] = this.dbname;
    data['label_for_dashboard'] = this.labelForDashboard;
    data['gst_number'] = this.gstNumber;
    data['pan_number'] = this.panNumber;
    data['ga_address'] = this.gaAddress;
    data['cin_number'] = this.cinNumber;
    data['branch_email'] = this.branchEmail;
    data['customer_care'] = this.customerCare;
    data['vat'] = this.vat;
    data['fax'] = this.fax;
    data['cst'] = this.cst;
    data['website'] = this.website;
    data['billing_address'] = this.billingAddress;
    data['ga_label'] = this.gaLabel;
    data['project_logo'] = this.projectLogo;
    data['client_logo'] = this.clientLogo;
    data['pmc_logo'] = this.pmcLogo;
    data['contractor_logo'] = this.contractorLogo;
    data['client'] = this.client;
    data['project_desc'] = this.projectDesc;
    data['business_object'] = this.businessObject;
    data['pmc'] = this.pmc;
    data['contractor'] = this.contractor;
    data['ga_custom_code'] = this.gaCustomCode;
    data['ga_latitude'] = this.gaLatitude;
    data['ga_longitude'] = this.gaLongitude;
    data['meterreaderuser'] = this.meterreaderuser;
    data['text_pwd'] = this.textPwd;
    data['BillId'] = this.billId;
    data['bill_type_data'] = this.billTypeData;
    data['deposit_tax_per'] = this.depositTaxPer;
    data['tax_per_with'] = this.taxPerWith;
    data['bill_remarks'] = this.billRemarks;
    return data;
  }
}