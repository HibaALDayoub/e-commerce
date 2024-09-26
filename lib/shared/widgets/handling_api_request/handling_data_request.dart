import 'package:e_comerce/shared/widgets/loading/loading_widget.dart';
import 'package:flutter/material.dart';
import '../../../core/classes/status_request.dart';
import 'retry_button.dart';

class HandlingDataRequest extends StatelessWidget {
  const HandlingDataRequest(
      {super.key,
      required this.statusRequest,
      required this.retryFunction,
      required this.child,
      this.height});
  final StatusRequest statusRequest;
  final void Function() retryFunction;
  final Widget child;
  final double? height;
  @override
  Widget build(BuildContext context) {
    return statusRequest == StatusRequest.loading
        ? const Center(child: LoadingWidget())
        : statusRequest == StatusRequest.failure
            ? RetryButton(
                onTap: retryFunction,
              )
            : statusRequest == StatusRequest.loadingPartOfPage
                ? Center(
                    child: Column(children: [
                      SizedBox(
                        height: height,
                      ),
                      const LoadingWidget()
                    ]),
                  )
                : statusRequest == StatusRequest.errorPartOfPage
                    ? Center(
                        child: Column(children: [
                          SizedBox(
                            height: height,
                          ),
                          RetryButton(
                            onTap: retryFunction,
                          )
                        ]),
                      )
                    : child;
  }
}
