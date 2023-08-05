import 'package:e_commerce/core/constants.dart';
import 'package:e_commerce/core/widgets/custom_buttons.dart';
import 'package:e_commerce/core/widgets/custom_textfield.dart';
import 'package:e_commerce/core/widgets/item_model.dart';
import 'package:e_commerce/core/widgets/space_widget.dart';
import 'package:flutter/material.dart';
import '../../../../../../core/utils/size_config.dart';
import '../../../../../auth/firebase/store_data.dart';

class AddProduct extends StatefulWidget {
  const AddProduct({Key? key}) : super(key: key);

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  String? _name, _price, _description, _category, _imagePath;

  double? _star;

  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

  final store = Store();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //resizeToAvoidBottomInset: false,
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
              CustomTextFiled(
                onChanged: (value) {
                  _star = double.tryParse(value);
                },
                hint: 'Product Star',
              ),
              const VerticalSpace(2),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: SizeConfig.defultSize! * 8),
                child: CustomGeneralButton(
                  buttonTitle: 'Add Product',
                  onTap: () {
                    if (_globalKey.currentState!.validate()) {
                      _globalKey.currentState!.save();

                      store.addProduct(ItemModel(
                        name: _name!,
                        price: _price!,
                        description: _description!,
                        imagePath: _imagePath!,
                        category: _category!,
                        star: _star!,
                      ));

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
}

void showSuccessMessage(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Success'),
        content: const Text('Product added successfully!'),
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
