import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:openfashion/core/constants/app_colors.dart';
import 'package:openfashion/features/CheckOut/data/address_model.dart';
import 'package:openfashion/features/CheckOut/widgets/checkout_header.dart';
import 'package:openfashion/widgets/custom_appbar_widget.dart';
import 'package:openfashion/widgets/custom_button.dart';

class AddAddress extends StatefulWidget {
  const AddAddress({super.key, this.editData});

  final AddressModel? editData;

  @override
  State<AddAddress> createState() => _AddAddressState();
}

class _AddAddressState extends State<AddAddress> {
  final _formKey = GlobalKey<FormState>();

  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _addressController = TextEditingController();
  final _cityController = TextEditingController();
  final _stateController = TextEditingController();
  final _zipCodeController = TextEditingController();
  final _phoneController = TextEditingController();

  void _saveAddress() {
    if (_formKey.currentState!.validate()) {
      final addressData = AddressModel(
        firstName: _firstNameController.text.trim(),
        lastName: _lastNameController.text.trim(),
        address: _addressController.text.trim(),
        city: _cityController.text.trim(),
        state: _stateController.text.trim(),
        zipCode: _zipCodeController.text.trim(),
        phoneNumber: _phoneController.text.trim(),
      );
      Navigator.pop(context, addressData);
    }
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _addressController.dispose();
    _cityController.dispose();
    _stateController.dispose();
    _zipCodeController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    if (widget.editData != null) {
      _firstNameController.text = widget.editData!.firstName;
      _lastNameController.text = widget.editData!.lastName;
      _addressController.text = widget.editData!.address;
      _cityController.text = widget.editData!.city;
      _stateController.text = widget.editData!.state;
      _zipCodeController.text = widget.editData!.zipCode;
      _phoneController.text = widget.editData!.phoneNumber;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(isBlack: false),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8.0),
          child: Column(
            children: [
              Form(
                key: _formKey,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Gap(20),
                      CheckoutHeader(title: 'Add Shipping Address', size: 19),
                      const Gap(40),
                      Row(
                        children: [
                          Expanded(
                            child: _buildTextField(
                              controller: _firstNameController,
                              hint: 'First name',
                              validator: (val) =>
                                  val!.isEmpty ? 'Required' : null,
                            ),
                          ),
                          const Gap(20),
                          Expanded(
                            child: _buildTextField(
                              controller: _lastNameController,
                              hint: 'Last name',
                              validator: (val) =>
                                  val!.isEmpty ? 'Required' : null,
                            ),
                          ),
                        ],
                      ),
                      const Gap(25),
                      _buildTextField(
                        controller: _addressController,
                        hint: 'Adress',
                        validator: (val) => val!.isEmpty ? 'Required' : null,
                      ),
                      const Gap(25),
                      _buildTextField(
                        controller: _cityController,
                        hint: 'City',
                        validator: (val) => val!.isEmpty ? 'Required' : null,
                      ),
                      const Gap(25),
                      Row(
                        children: [
                          Expanded(
                            child: _buildTextField(
                              controller: _stateController,
                              hint: 'State',
                              validator: (val) =>
                                  val!.isEmpty ? 'Required' : null,
                            ),
                          ),
                          const Gap(20),
                          Expanded(
                            child: _buildTextField(
                              controller: _zipCodeController,
                              hint: 'ZIP code',
                              keyboardType: TextInputType.number,
                              validator: (val) =>
                                  val!.isEmpty ? 'Required' : null,
                            ),
                          ),
                        ],
                      ),
                      const Gap(25),
                      _buildTextField(
                        controller: _phoneController,
                        hint: 'Phone number',
                        keyboardType: TextInputType.phone,
                        validator: (val) {
                          if (val == null || val.isEmpty) return 'Required';
                          if (val.length < 10) return 'Invalid number';
                          return null;
                        },
                      ),
                      const Gap(3),
                    ],
                  ),
                ),
              ),
              Spacer(),
              CustomButton(
                title: 'Add Now',
                onTap: _saveAddress,
                is_Svg: false,
              ),
              const Gap(10),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String hint,
    TextInputType keyboardType = TextInputType.text,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      validator: validator,
      style: const TextStyle(fontSize: 14, color: AppColors.primary),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(
          color: AppColors.secondary.withOpacity(0.5),
          fontSize: 14,
          fontFamily: 'TenorSans',
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.secondary.withOpacity(0.3)),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.primary),
        ),
        errorBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.error),
        ),
        focusedErrorBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.error),
        ),
        contentPadding: const EdgeInsets.symmetric(vertical: 10),
        isDense: true,
      ),
    );
  }
}
