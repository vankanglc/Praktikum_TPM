import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'camera_page.dart';
import 'kesanpesan.dart';

class KonveksiPage extends StatefulWidget {
  @override
  _KonveksiPageState createState() => _KonveksiPageState();
}

class _KonveksiPageState extends State<KonveksiPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Money and Time Converter'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 20.0),
              Image.asset(
                'images/pic1.png',
                width: 200.0,
                height: 200.0,
              ),
              SizedBox(height: 15.0),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  textStyle:
                      TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  minimumSize: Size.fromHeight(52),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
                child: Text("Convert Money"),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) {
                      return ConvertMoneyPage();
                    }),
                  );
                },
              ),
              SizedBox(height: 30.0),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  textStyle:
                      TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  minimumSize: Size.fromHeight(52),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
                child: Text("Convert Time"),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) {
                      return ConvertTimePage();
                    }),
                  );
                },
              ),
              SizedBox(height: 30.0),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  textStyle:
                  TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  minimumSize: Size.fromHeight(52),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
                child: Text("Kesan dan Pesan"),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) {
                      return KesanPesanPage();
                    }),
                  );
                },
              ),
              SizedBox(height: 30.0),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  textStyle:
                      TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  minimumSize: Size.fromHeight(52),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
                child: Text("Camera"),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) {
                      return CameraPage();
                    }),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ConvertMoneyPage extends StatefulWidget {
  @override
  _ConvertMoneyPageState createState() => _ConvertMoneyPageState();
}

class _ConvertMoneyPageState extends State<ConvertMoneyPage> {
  double inputAmount = 0;
  double outputAmount = 0;
  String selectedCurrencyFrom = 'Rupiah';
  String selectedCurrencyTo = 'USD';

  Map<String, double> conversionRates = {
    'Rupiah': 10000,
    'USD': 0.67,
    'Yen': 92.37,
    'Poundsterling': 0.54,
    'Euro': 0.62,
  };

  void convertMoney() {
    double conversionRateFrom = conversionRates[selectedCurrencyFrom] ?? 1;
    double conversionRateTo = conversionRates[selectedCurrencyTo] ?? 1;

    setState(() {
      outputAmount = inputAmount * (conversionRateTo / conversionRateFrom);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Money Converter'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Convert Money',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8.0),
              Row(
                children: [
                  Expanded(
                    child: LayoutBuilder(
                      builder:
                          (BuildContext context, BoxConstraints constraints) {
                        return Container(
                          padding: EdgeInsets.symmetric(horizontal: 12.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            border: Border.all(color: Colors.grey),
                          ),
                          child: DropdownButton<String>(
                            value: selectedCurrencyFrom,
                            onChanged: (String? newValue) {
                              setState(() {
                                selectedCurrencyFrom = newValue ?? '';
                              });
                            },
                            items: conversionRates.keys.map((String currency) {
                              return DropdownMenuItem<String>(
                                value: currency,
                                child: Text(currency),
                              );
                            }).toList(),
                            isExpanded: true,
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(width: 16.0),
                  Icon(Icons.arrow_forward),
                  SizedBox(width: 16.0),
                  Expanded(
                    child: LayoutBuilder(
                      builder:
                          (BuildContext context, BoxConstraints constraints) {
                        return Container(
                          padding: EdgeInsets.symmetric(horizontal: 12.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            border: Border.all(color: Colors.grey),
                          ),
                          child: DropdownButton<String>(
                            value: selectedCurrencyTo,
                            onChanged: (String? newValue) {
                              setState(() {
                                selectedCurrencyTo = newValue ?? '';
                              });
                            },
                            items: conversionRates.keys.map((String currency) {
                              return DropdownMenuItem<String>(
                                value: currency,
                                child: Text(currency),
                              );
                            }).toList(),
                            isExpanded: true,
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16.0),
              Text(
                'Amount:',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8.0),
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Amount',
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) {
                  setState(() {
                    inputAmount = double.tryParse(value) ?? 0;
                  });
                },
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: convertMoney,
                child: Text('Convert Money'),
              ),
              SizedBox(height: 8.0),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      'Result: ',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(width: 8.0),
                  Text(
                    '$outputAmount $selectedCurrencyTo',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ConvertTimePage extends StatefulWidget {
  @override
  _ConvertTimePageState createState() => _ConvertTimePageState();
}

class _ConvertTimePageState extends State<ConvertTimePage> {
  String selectedTimeZone = 'WIB';
  DateTime selectedTime = DateTime.now();
  List<String> timeZones = [
    'WIB',
    'WIT',
    'WITA',
    'Sydney',
    'New York',
    'Tokyo',
    'Seoul',
  ];

  String convertTime(String timeZone) {
    DateTime convertedTime;

    switch (timeZone) {
      case 'WIT':
        convertedTime = selectedTime.add(Duration(hours: 2));
        break;
      case 'WITA':
        convertedTime = selectedTime.add(Duration(hours: 1));
        break;
      case 'Sydney':
        convertedTime = selectedTime.add(Duration(hours: 3));
        break;
      case 'New York':
        convertedTime = selectedTime.add(Duration(hours: -12));
        break;
      case 'Tokyo':
        convertedTime = selectedTime.add(Duration(hours: 2));
        break;
      case 'Seoul':
        convertedTime = selectedTime.add(Duration(hours: 2));
        break;
      default:
        convertedTime = selectedTime;
    }
    DateFormat formatter = DateFormat.Hms(); // Format jam, menit, detik
    String formattedTime = formatter.format(convertedTime);

    return formattedTime.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Time Converter'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Convert Time',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8.0),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  border: Border.all(color: Colors.grey),
                ),
                child: DropdownButton<String>(
                  value: selectedTimeZone,
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedTimeZone = newValue ?? '';
                    });
                  },
                  items: timeZones.map((String timeZone) {
                    return DropdownMenuItem<String>(
                      value: timeZone,
                      child: Text(timeZone),
                    );
                  }).toList(),
                ),
              ),
              SizedBox(height: 16.0),
              Text(
                'Selected Time: ${selectedTime.toString()}',
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16.0),
              Text(
                'Converted Time:',
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8.0),
              Text(
                convertTime(selectedTimeZone),
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
