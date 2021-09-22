SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                //Top half of the screen with the scanner
                ResponsiveContainer(
                  height: 0.5,
                  child: Container(
                    color: Theme.of(context).primaryColor,
                  ),
                ),

                //Bottom half of the screen where they can manually enter the code
                Flexible(
                  fit: FlexFit.loose,
                  child: Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: FormHelper.sidePadding,
                        vertical: FormHelper.formFieldSpacing),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        //Top half with the input and label
                        Container(
                          child: Column(
                            children: [
                              Text('Code won\'t scan?',
                                  style: darkSubHeader,
                                  textAlign: TextAlign.left),
                              SizedBox(height: FormHelper.formFieldSpacing),
                              TextField(
                                controller: barCodeController,
                                keyboardType: TextInputType.number,
                                decoration: FormHelper.buildInputDecoration(
                                    controller: barCodeController,
                                    labelText: 'Enter Code'),
                              ),
                            ],
                          ),
                        ),

                        SizedBox(height: FormHelper.formFieldSpacing * 2),

                        AppButton(
                          buttonType: ButtonType.Primary,
                          text: 'START SCAN',
                          onPressed: () async {
//                          model.customersCollection.getAllCustomers();
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                //Removed Expanded widget of flex factor 5 containing the CartCard
              ],
            ),
          )