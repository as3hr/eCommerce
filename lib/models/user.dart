class User {
  int? title;
  String? id;
  String? contact;
  String? name;
  String? password;
  String? email;
  String? image;
  bool? approved;
  bool? archived;
  String? names;
  String? surname;
  String? initials;
  String? rsaId;
  int? gender;
  int? race;
  DateTime? birthDate;
  int? userId;
  int? countryOfOriginId;
  int? userType;
  int? maritalStatus;
  int? marriageType;
  DateTime? marriageDate;
  int? language;
  int? userBranchId;
  int? userStatusId;
  int? userStatus;
  String? ncrReferenceNo;
  DateTime? ncrRegistrationDate;
  DateTime? applicationDate;
  DateTime? proposalSentDate;
  String? motivationforRestructuring;
  int? userWorkflowStatus;
  bool? isForm16Signed;
  DateTime? form16SignedDate;
  DateTime? form171SentDate;
  DateTime? form172SentDate;
  String? ncrDcNumber;
  String? userBranchName;
  int? ncrStatus;
  String? courtDistrict;
  String? caseNumber;
  DateTime? dateCaseNumberObtained;
  DateTime? firstCourtOrderDate;
  DateTime? nextCourtOrderDate;
  DateTime? dateCourtOrderGranted;
  String? internalRefNumber;
  DateTime? createdDate;

  User({
    this.id,
    this.contact,
    this.email,
    this.name,
    this.image,
    this.password,
    this.approved,
    this.archived,
    this.title,
    this.names,
    this.surname,
    this.initials,
    this.rsaId,
    this.gender,
    this.race,
    this.birthDate,
    this.userId,
    this.countryOfOriginId,
    this.userType,
    this.maritalStatus,
    this.marriageType,
    this.marriageDate,
    this.language,
    this.userBranchId,
    this.userStatusId,
    this.userStatus,
    this.ncrReferenceNo,
    this.ncrRegistrationDate,
    this.applicationDate,
    this.proposalSentDate,
    this.motivationforRestructuring,
    this.userWorkflowStatus,
    this.isForm16Signed,
    this.form16SignedDate,
    this.form171SentDate,
    this.form172SentDate,
    this.ncrDcNumber,
    this.userBranchName,
    this.ncrStatus,
    this.courtDistrict,
    this.caseNumber,
    this.dateCaseNumberObtained,
    this.firstCourtOrderDate,
    this.nextCourtOrderDate,
    this.dateCourtOrderGranted,
    this.internalRefNumber,
    this.createdDate,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json['_id'],
        email: json['email'],
        name: json['name'],
        image: json['image'],
        contact: json['contact'],
        approved: json['approved'],
        archived: json['archived'],
        title: json['title'],
        names: json['names'],
        surname: json['surname'],
        initials: json['initials'],
        rsaId: json['rsaId'],
        gender: json['gender'],
        race: json['race'],
        birthDate: DateTime.tryParse(json['birthDate'] ?? ''),
        userId: json['userId'],
        countryOfOriginId: json['countryOfOriginId'],
        userType: json['userType'],
        maritalStatus: json['maritalStatus'],
        marriageType: json['marriageType'],
        marriageDate: DateTime.tryParse(json['marriageDate'] ?? ''),
        language: json['language'],
        userBranchId: json['userBranchId'],
        userStatusId: json['userStatusId'],
        userStatus: json['UsurStatus'],
        ncrReferenceNo: json['ncrReferenceNo'],
        ncrRegistrationDate:
            DateTime.tryParse(json['ncrRegistrationDate'] ?? ''),
        applicationDate: DateTime.tryParse(json['applicationDate'] ?? ''),
        proposalSentDate: DateTime.tryParse(json['proposalSentDate'] ?? ''),
        motivationforRestructuring: json['motivationforRestructuring'],
        userWorkflowStatus: json['userWorkflowStatus'],
        isForm16Signed: json['isForm16Signed'],
        form16SignedDate: DateTime.tryParse(json['form16SignedDate'] ?? ''),
        form171SentDate: DateTime.tryParse(json['form171SentDate'] ?? ''),
        form172SentDate: DateTime.tryParse(json['form172SentDate'] ?? ''),
        ncrDcNumber: json['ncrDCNumber'],
        userBranchName: json['userBranchName'],
        ncrStatus: json['ncrStatus'],
        courtDistrict: json['courtDistrict'],
        caseNumber: json['caseNumber'],
        dateCaseNumberObtained:
            DateTime.tryParse(json['dateCaseNumberObtained'] ?? ''),
        firstCourtOrderDate:
            DateTime.tryParse(json['firstCourtOrderDate'] ?? ''),
        nextCourtOrderDate: DateTime.tryParse(json['nextCourtOrderDate'] ?? ''),
        dateCourtOrderGranted:
            DateTime.tryParse(json['dateCourtOrderGranted'] ?? ''),
        internalRefNumber: json['internalRefNumber'],
        createdDate: DateTime.tryParse(json['createdDate'] ?? ''),
      );

  Map<String, dynamic> toApiJson() => {
        'rsaId': rsaId,
        'email': email,
        'password': password,
        'name': name,
        'image': image,
        'contact': contact,
      }..removeWhere((key, value) => value == null || value == '');

  Map<String, dynamic> toJson() => {
        'contact': contact,
        'title': title,
        'names': names,
        'surname': surname,
        'initials': initials,
        'rsaId': rsaId,
        'gender': gender,
        'race': race,
        'birthDate': birthDate?.toIso8601String(),
        'userId': userId,
        'countryOfOriginId': countryOfOriginId,
        'userType': userType,
        'maritalStatus': maritalStatus,
        'marriageType': marriageType,
        'marriageDate': marriageDate?.toIso8601String(),
        'language': language,
        'userBranchId': userBranchId,
        'userStatusId': userStatusId,
        'userStatus': userStatus,
        'ncrReferenceNo': ncrReferenceNo,
        'ncrRegistrationDate': ncrRegistrationDate?.toIso8601String(),
        'applicationDate': applicationDate?.toIso8601String(),
        'proposalSentDate': proposalSentDate?.toIso8601String(),
        'motivationforRestructuring': motivationforRestructuring,
        'userWorkflowStatus': userWorkflowStatus,
        'isForm16Signed': isForm16Signed,
        'form16SignedDate': form16SignedDate?.toIso8601String(),
        'form171SentDate': form171SentDate?.toIso8601String(),
        'form172SentDate': form172SentDate?.toIso8601String(),
        'ncrDCNumber': ncrDcNumber,
        'userBranchName': userBranchName,
        'ncrStatus': ncrStatus,
        'courtDistrict': courtDistrict,
        'caseNumber': caseNumber,
        'dateCaseNumberObtained': dateCaseNumberObtained?.toIso8601String(),
        'firstCourtOrderDate': firstCourtOrderDate?.toIso8601String(),
        'nextCourtOrderDate': nextCourtOrderDate?.toIso8601String(),
        'dateCourtOrderGranted': dateCourtOrderGranted?.toIso8601String(),
        'internalRefNumber': internalRefNumber,
        'createdDate': createdDate?.toIso8601String(),
      };
}
