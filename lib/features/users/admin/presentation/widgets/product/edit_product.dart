import 'package:flutter/material.dart';
import '../../../../../../core/constants.dart';
import '../../../../../../core/utils/size_config.dart';
import '../../../../../../core/widgets/custom_buttons.dart';
import '../../../../../../core/widgets/custom_textfield.dart';
import '../../../../../../core/widgets/item_model.dart';
import '../../../../../../core/widgets/space_widget.dart';
import '../../../../../auth/firebase/store_data.dart';

// ignore: must_be_immutable
class EditProduct extends StatelessWidget {
  static const String id = 'EditProduct';

  EditProduct({Key? key, required this.products}) : super(key: key);
  final List<ItemModel> products;

  String? _name, _price, _description, _category, _imagePath;
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

  final _store = Store();

  @override
  Widget build(BuildContext context) {
    ItemModel? product =
        ModalRoute.of(context)!.settings.arguments as ItemModel?;

    return Scaffold(
      body: Form(
        key: _globalKey,
        child: Center(
          child: ListView(
            shrinkWrap: true,
            children: [
              CustomTextFiled(
                hint: 'Product Name',
                onChanged: (value) {
                  _name = value;
                },
              ),
              const VerticalSpace(2),
              CustomTextFiled(
                onChanged: (value) {
                  _price = value;
                },
                hint: 'Product Price',
              ),
              const VerticalSpace(2),
              CustomTextFiled(
                onChanged: (value) {
                  _description = value;
                },
                hint: 'Product Description',
              ),
              const VerticalSpace(2),
              CustomTextFiled(
                onChanged: (value) {
                  _category = value;
                },
                hint: 'Product Category',
              ),
              const VerticalSpace(2),
              CustomTextFiled(
                onChanged: (value) {
                  _imagePath = value;
                },
                hint: 'Product image',
              ),
              const VerticalSpace(2),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: SizeConfig.defultSize! * 8),
                child: CustomGeneralButton(
                  buttonTitle: 'Edit Product',
                  onTap: () {
                    if (_globalKey.currentState!.validate()) {
                      _globalKey.currentState!.save();
                      if (product != null) {
                        _store.editProduct(
                          {
                            KProductName: _name,
                            KProductLocation: _imagePath,
                            KProductCategory: _category,
                            KProductDescription: _description,
                            KProductPrice: _price
                          },
                          product.ProductID,
                        );
                      }
                      // Show success message
                      showSuccessMessage(context);
                    }
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void showSuccessMessage(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Success'),
          content: const Text('Product edited successfully.'),
          backgroundColor: KMC,
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK',
                  style: TextStyle(
                    color: KWC,
                    fontWeight: FontWeight.bold,
                  )),
            ),
          ],
        );
      },
    );
  }
}
