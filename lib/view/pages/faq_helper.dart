import 'dart:convert';

import 'package:epics_pj/view/pages/faq.dart';
import 'package:get/get.dart';
// import 'package:memo_neet/MVVM/models/faqs/faqs_model.dart';

// List<FaqsModel> faqsData = [
//   FaqsModel(
//       details:
//           "Ans. Click the Update Question option on the menu and please wait for few minutes",
//       question: "Q 1. Why Some topics are missing?"),
//   FaqsModel(
//       details:
//           "Ans. To get the same subscription use the same Login Id(Gmail or Mobile Login) in the New Mobile which you have used previously",
//       question: "Q 2. How to Switch to Another Mobile after Subscription?"),
//   FaqsModel(
//       details:
//           "Ans. To get the same subscription use the same Login Id(Gmail or Mobile Login) in the New Mobile which you have used previously",
//       question: "Q 2. How to Switch to Another Mobile after Subscription?"),
//   FaqsModel(
//       details:
//           "Ans. Yes MemoNeet contains all the topics of 11th and 12th NCERT",
//       question: "Q 3. MemoNeet has all the topics of NCERT?"),
//   FaqsModel(
//       details:
//           "Ans. By using our Revision Algorithm and by Learning all our topics of NCERT you can easily score good marks in Neet Exam!",
//       question: "Q 4. How MemoNeet helps to score good marks in NEET Exam?"),
// ];

FaqsModel faqsModelFromJson(String str) => FaqsModel.fromJson(json.decode(str));

String faqsModelToJson(FaqsModel data) => json.encode(data.toJson());

class FaqsModel {
  String question;
  String details;
  int questionId;

  FaqsModel(
      {required this.question,
      required this.details,
      required this.questionId});

  factory FaqsModel.fromJson(Map<String, dynamic> json) => FaqsModel(
      question: json["question"],
      details: json["details"],
      questionId: json["questionId"]);

  Map<String, dynamic> toJson() => {
        "question": question,
        "details": details,
        "questionId": questionId,
      };
}

List<FaqsModel> faqsData = [
  FaqsModel(
      questionId: 1,
      details: AppStrings.faqAnswer1,
      question: AppStrings.faqQuestion1),
  FaqsModel(
      questionId: 2,
      details: AppStrings.faqAnswer2,
      question: AppStrings.faqQuestion2),
  FaqsModel(
      questionId: 3,
      details: AppStrings.faqAnswer3,
      question: AppStrings.faqQuestion3),
  // FaqsModel(
  //     questionId: 4, details: "faqAnswer4".tr, question: AppStrings.faqQuestion4),
  // FaqsModel(
  //     questionId: 5, details: , question: AppStrings.faqQuestion5),
];
