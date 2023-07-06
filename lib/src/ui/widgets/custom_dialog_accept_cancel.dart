import 'package:clothing_store_firestore_crud/src/domain/models/exception_model.dart';
import 'package:clothing_store_firestore_crud/src/ui/widgets/custom_button.dart';
import 'package:flutter/material.dart';

void customDialogAcceptCancel({
  required BuildContext context,
  required ExceptionModel exception,
  required VoidCallback changeState,
  required VoidCallback accept,
}) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      return Dialog(
        shadowColor: Colors.black12,
        elevation: 5,
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                exception.title,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Text(
                  exception.message,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
              SizedBox(
                height: 50,
                child: Row(
                  children: [
                    Expanded(
                      child: CustomButton(
                        color: Colors.black,
                        text: 'Cancel',
                        textColor: Colors.white,
                        onTap: () {
                          changeState();
                          Navigator.pop(context);
                        },
                      ),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: CustomButton(
                        text: 'Accept',
                        onTap: () {
                          changeState();
                          Navigator.pop(context);
                          accept();
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
