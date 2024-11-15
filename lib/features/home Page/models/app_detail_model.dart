class AppDetailsModel {
  String? message;
  String? code;
  String? status;
  Data? data;

  AppDetailsModel({this.message, this.code, this.status, this.data});

  AppDetailsModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    code = json['code'];
    status = json['status'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['code'] = this.code;
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? bannerMarquee;
  String? withdrawOpenTime;
  String? withdrawCloseTime;
  String? addFundNotice;
  String? withdrawNotice;
  String? appNotice;
  String? appLink;
  String? appStatus;
  String? adminMessage;
  String? shareMessage;
  ContactDetails? contactDetails;
  BannerImage? bannerImage;
  List<Banner>? banner;
  ProjectStatus? projectStatus;

  Data(
      {this.bannerMarquee,
      this.withdrawOpenTime,
      this.withdrawCloseTime,
      this.addFundNotice,
      this.withdrawNotice,
      this.appNotice,
      this.appLink,
      this.appStatus,
      this.adminMessage,
      this.shareMessage,
      this.contactDetails,
      this.bannerImage,
      this.banner,
      this.projectStatus});

  Data.fromJson(Map<String, dynamic> json) {
    bannerMarquee = json['banner_marquee'];
    withdrawOpenTime = json['withdraw_open_time'];
    withdrawCloseTime = json['withdraw_close_time'];
    addFundNotice = json['add_fund_notice'];
    withdrawNotice = json['withdraw_notice'];
    appNotice = json['app_notice'];
    appLink = json['app_link'];
    appStatus = json['app_status'];
    adminMessage = json['admin_message'];
    shareMessage = json['share_message'];
    contactDetails = json['contact_details'] != null
        ? new ContactDetails.fromJson(json['contact_details'])
        : null;
    bannerImage = json['banner_image'] != null
        ? new BannerImage.fromJson(json['banner_image'])
        : null;
    if (json['banner'] != null) {
      banner = <Banner>[];
      json['banner'].forEach((v) {
        banner!.add(new Banner.fromJson(v));
      });
    }
    projectStatus = json['project_status'] != null
        ? new ProjectStatus.fromJson(json['project_status'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['banner_marquee'] = this.bannerMarquee;
    data['withdraw_open_time'] = this.withdrawOpenTime;
    data['withdraw_close_time'] = this.withdrawCloseTime;
    data['add_fund_notice'] = this.addFundNotice;
    data['withdraw_notice'] = this.withdrawNotice;
    data['app_notice'] = this.appNotice;
    data['app_link'] = this.appLink;
    data['app_status'] = this.appStatus;
    data['admin_message'] = this.adminMessage;
    data['share_message'] = this.shareMessage;
    if (this.contactDetails != null) {
      data['contact_details'] = this.contactDetails!.toJson();
    }
    if (this.bannerImage != null) {
      data['banner_image'] = this.bannerImage!.toJson();
    }
    if (this.banner != null) {
      data['banner'] = this.banner!.map((v) => v.toJson()).toList();
    }
    if (this.projectStatus != null) {
      data['project_status'] = this.projectStatus!.toJson();
    }
    return data;
  }
}

class ContactDetails {
  String? whatsappNo;
  String? mobileNo1;
  String? mobileNo2;
  String? email1;
  String? telegramNo;
  String? withdrawProof;

  ContactDetails(
      {this.whatsappNo,
      this.mobileNo1,
      this.mobileNo2,
      this.email1,
      this.telegramNo,
      this.withdrawProof});

  ContactDetails.fromJson(Map<String, dynamic> json) {
    whatsappNo = json['whatsapp_no'];
    mobileNo1 = json['mobile_no_1'];
    mobileNo2 = json['mobile_no_2'];
    email1 = json['email_1'];
    telegramNo = json['telegram_no'];
    withdrawProof = json['withdraw_proof'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['whatsapp_no'] = this.whatsappNo;
    data['mobile_no_1'] = this.mobileNo1;
    data['mobile_no_2'] = this.mobileNo2;
    data['email_1'] = this.email1;
    data['telegram_no'] = this.telegramNo;
    data['withdraw_proof'] = this.withdrawProof;
    return data;
  }
}

class BannerImage {
  String? bannerImg1;
  String? bannerImg2;
  String? bannerImg3;

  BannerImage({this.bannerImg1, this.bannerImg2, this.bannerImg3});

  BannerImage.fromJson(Map<String, dynamic> json) {
    bannerImg1 = json['banner_img_1'];
    bannerImg2 = json['banner_img_2'];
    bannerImg3 = json['banner_img_3'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['banner_img_1'] = this.bannerImg1;
    data['banner_img_2'] = this.bannerImg2;
    data['banner_img_3'] = this.bannerImg3;
    return data;
  }
}

class Banner {
  String? image;

  Banner({this.image});

  Banner.fromJson(Map<String, dynamic> json) {
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['image'] = this.image;
    return data;
  }
}

class ProjectStatus {
  String? mainMarket;
  String? starlineMarket;
  String? galidesawarMarket;
  String? bannerStatus;
  String? marqueeStatus;

  ProjectStatus(
      {this.mainMarket,
      this.starlineMarket,
      this.galidesawarMarket,
      this.bannerStatus,
      this.marqueeStatus});

  ProjectStatus.fromJson(Map<String, dynamic> json) {
    mainMarket = json['main_market'];
    starlineMarket = json['starline_market'];
    galidesawarMarket = json['galidesawar_market'];
    bannerStatus = json['banner_status'];
    marqueeStatus = json['marquee_status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['main_market'] = this.mainMarket;
    data['starline_market'] = this.starlineMarket;
    data['galidesawar_market'] = this.galidesawarMarket;
    data['banner_status'] = this.bannerStatus;
    data['marquee_status'] = this.marqueeStatus;
    return data;
  }
}
