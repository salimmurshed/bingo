part of '../../ui/add_credit_line_screen/add_credit_line_view.dart';

class QuestionAnswerPart extends StatelessWidget {
  QuestionAnswerPart(this.model, {Key? key}) : super(key: key);
  AddCreditLineViewModel model;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppString.questionAnswers,
          style: AppTextStyles.dashboardBodyTitle,
        ),
        const Divider(),
        for (var i = 0; i < model.listOfQuestion.length; i++)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              NameTextField(
                enable: model.retailerCreditLineReqDetails.data!
                        .fieQuestionAnswer![i].answer!.isEmpty
                    ? true
                    : false,
                readOnly: model.retailerCreditLineReqDetails.data!
                        .fieQuestionAnswer![i].answer!.isEmpty
                    ? false
                    : true,
                controller: model.answerController[i],
                fieldName: model.listOfQuestion[i].question!,
              ),
              if (model.replyData.isNotEmpty)
                if (model.replyData[i].documents!.isNotEmpty)
                  Wrap(
                    runSpacing: 10.0,
                    spacing: 10.0,
                    children: [
                      for (var image in model.replyData[i].documents!)
                        SizedBox(
                          height: 100.0,
                          width: 100.0,
                          child: Image.file(
                            File(image.path),
                            fit: BoxFit.cover,
                          ),
                        ),
                    ],
                  ),
              if (model.retailerCreditLineReqDetails.data!.fieQuestionAnswer![i]
                  .answer!.isEmpty)
                model.isAnswerButtonBusy[i]
                    ? const SizedBox(
                        height: 40.0,
                        child: Center(
                          child: SizedBox(
                            height: 10.0,
                            width: 10.0,
                            child: CircularProgressIndicator(
                              color: AppColors.loader1,
                            ),
                          ),
                        ),
                      )
                    : Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SubmitButton(
                            onPressed: () {
                              model.submitAnswers(i, context);
                            },
                            width: 100.0,
                            text: 'Reply',
                          ),
                          SubmitButton(
                            onPressed: () {
                              model.pickFilesForAnswer(i);
                            },
                            width: 100.0,
                            text: AppString.chooseFiles,
                          ),
                        ],
                      ),
              10.0.giveHeight,
              const Divider(),
            ],
          ),
      ],
    );
  }
}
