import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:label_storemax/helpers/tools.dart';
import 'package:label_storemax/models/customer_country.dart';
import 'package:label_storemax/widgets/buttons.dart';
import 'package:label_storemax/widgets/woosignal_ui.dart';

class CustomerAddressInput extends StatelessWidget {
  const CustomerAddressInput(
      {Key key,
      @required this.txtControllerFirstName,
      @required this.txtControllerLastName,
      @required this.txtControllerAddressLine,
      @required this.txtControllerCity,
      @required this.txtControllerPostalCode,
      @required this.txtControllerEmailAddress,
      @required this.customerCountry,
      @required this.onTapCountry})
      : super(key: key);

  final TextEditingController txtControllerFirstName;
  final TextEditingController txtControllerLastName;
  final TextEditingController txtControllerAddressLine;
  final TextEditingController txtControllerCity;
  final TextEditingController txtControllerPostalCode;
  final TextEditingController txtControllerEmailAddress;
  final CustomerCountry customerCountry;
  final Function() onTapCountry;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Flexible(
          child: Row(
            children: <Widget>[
              Flexible(
                child: wsTextEditingRow(
                  context,
                  heading: trans(context, "First Name"),
                  controller: txtControllerFirstName,
                  shouldAutoFocus: true,
                ),
              ),
              Flexible(
                child: wsTextEditingRow(
                  context,
                  heading: trans(context, "Last Name"),
                  controller: txtControllerLastName,
                ),
              ),
            ],
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          ),
        ),
        Flexible(
          child: Row(
            children: <Widget>[
              Flexible(
                child: wsTextEditingRow(
                  context,
                  heading: trans(context, "Address Line"),
                  controller: txtControllerAddressLine,
                ),
              ),
              Flexible(
                child: wsTextEditingRow(
                  context,
                  heading: trans(context, "City"),
                  controller: txtControllerCity,
                ),
              ),
            ],
          ),
        ),
        Flexible(
          child: Row(
            children: <Widget>[
              Flexible(
                child: wsTextEditingRow(
                  context,
                  heading: trans(context, "Postal code"),
                  controller: txtControllerPostalCode,
                ),
              ),
              Flexible(
                child: wsTextEditingRow(context,
                    heading: trans(context, "Email address"),
                    keyboardType: TextInputType.emailAddress,
                    controller: txtControllerEmailAddress),
              ),
            ],
          ),
        ),
        Flexible(
          child: Row(
            children: <Widget>[
              (customerCountry.hasState()
                  ? Flexible(
                      child: Padding(
                        child: wsSecondaryButton(
                          context,
                          title: (customerCountry.state != null
                              ? "${trans(context, "Selected")}\n${customerCountry?.state?.name ?? ""}"
                              : trans(context, "Select state")),
                          action: onTapCountry,
                        ),
                        padding: EdgeInsets.all(8),
                      ),
                    )
                  : null),
              Flexible(
                child: Padding(
                  child: wsSecondaryButton(
                    context,
                    title: (customerCountry != null &&
                            (customerCountry?.name ?? "").isNotEmpty
                        ? "${trans(context, "Selected")}\n${customerCountry.name}"
                        : trans(context, "Select country")),
                    action: onTapCountry,
                  ),
                  padding: EdgeInsets.all(8),
                ),
              ),
            ].where((element) => element != null).toList(),
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          ),
        ),
      ].where((e) => e != null).toList(),
    );
  }
}
