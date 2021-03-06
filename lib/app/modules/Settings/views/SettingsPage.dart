import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ui_x/ui_x.dart';

import '../../../shared/views/errors/NotConnectedErrorPage.dart';
import '../../../shared/views/layouts/MasterLayout.dart';
import '../../../shared/views/widgets/LoadingIconWidget.dart';
import '../controllers/SettingController.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SettingController>(
      init: SettingController(),
      builder: (SettingController controller) {
      return !controller.isConnected
          ? NotConnectedErrorPage()
          : controller.isBusy
              ? LoadingIconWidget(message: "Please wait...")
              : MasterLayout(
                  title: "Settings",
                  body: SafeArea(
                    child: Padding(
                      padding: EdgeInsets.all(12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Theme",
                            style: TextStyl.bodySm,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: GestureDetector(
                                  onTap: () => controller.changeTheme(context, "system"),
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(vertical: 16),
                                    decoration: BoxDecoration(
                                      color: Theme.of(context).backgroundColor,
                                      borderRadius: BorderRadius.circular(8),
                                      border: Border.all(color: controller.selectedTheme == 'system' ? kcPrimary : Colors.transparent, width: 2),
                                    ),
                                    child: Column(
                                      children: [
                                        Icon(Icons.brightness_4_rounded, size: 32),
                                        Text(
                                          'System',
                                          style: TextStyl.bodySm,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(width: 8),
                              Expanded(
                                child: GestureDetector(
                                  onTap: () => controller.changeTheme(context, "light"),
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(vertical: 16),
                                    decoration: BoxDecoration(
                                      color: Theme.of(context).backgroundColor,
                                      borderRadius: BorderRadius.circular(8),
                                      border: Border.all(color: controller.selectedTheme == 'light' ? kcPrimary : Colors.transparent, width: 2),
                                    ),
                                    child: Column(
                                      children: [
                                        Icon(Icons.brightness_5_rounded, size: 32),
                                        Text(
                                          'Light',
                                          style: TextStyl.bodySm,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(width: 8),
                              Expanded(
                                child: GestureDetector(
                                  onTap: () => controller.changeTheme(context, "dark"),
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(vertical: 16),
                                    decoration: BoxDecoration(
                                      color: Theme.of(context).backgroundColor,
                                      borderRadius: BorderRadius.circular(8),
                                      border: Border.all(color: controller.selectedTheme == 'dark' ? kcPrimary : Colors.transparent, width: 2),
                                    ),
                                    child: Column(
                                      children: [
                                        Icon(Icons.brightness_2_rounded, size: 32),
                                        Text(
                                          'Dark',
                                          style: TextStyl.bodySm,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
    },);
  }
}
