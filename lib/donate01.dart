import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'paymentdonate.dart';

class Donate extends StatefulWidget {
  final String foundationName;
  final String foundationImage;
  final String imagePath;
  final String accountName;
  final String bankName;
  final String accountNumber;
  final String thankYouTitle;
  final String thankYouSubTitle;
  final String thankYouBodyText;

  const Donate({
    super.key,
    required this.foundationName,
    required this.foundationImage,
    required this.imagePath,
    required this.accountName,
    required this.bankName,
    required this.accountNumber,
    required this.thankYouTitle,
    required this.thankYouSubTitle,
    required this.thankYouBodyText,
  });

  @override
  DonateState createState() => DonateState();
}

class DonateState extends State<Donate> {
  String selectedCategory = '';
  final TextEditingController amountController = TextEditingController();
  final NumberFormat formatter = NumberFormat("#,##0.##", "en_US");

  @override
  void initState() {
    super.initState();
    amountController.addListener(_formatAmount);
  }

  @override
  void dispose() {
    amountController.removeListener(_formatAmount);
    amountController.dispose();
    super.dispose();
  }

  void _formatAmount() {
    String rawText = amountController.text.replaceAll(',', '');
    if (rawText.isEmpty) return;

    double? value = double.tryParse(rawText);
    if (value == null) return;

    String newText = value % 1 == 0
        ? formatter.format(value)
        : NumberFormat("#,##0.00", "en_US").format(value);

    if (amountController.text != newText) {
      amountController.value = TextEditingValue(
        text: newText,
        selection: TextSelection.collapsed(offset: newText.length),
      );
    }
  }

  void selectCategory(String category) {
    setState(() {
      selectedCategory = category;
    });
  }

  Widget categoryButton(String text) {
    bool isSelected = selectedCategory == text;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: isSelected ? const Color(0xFF19C3A3) : Colors.grey[300],
        borderRadius: BorderRadius.circular(15),
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  Widget _buildImage(String path) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Image.asset(
        path,
        width: 40,
        height: 40,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isAmountFilled = amountController.text.isNotEmpty;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 18),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildImage('assets/images/menu.png'),
                  _buildImage('assets/images/time.png'),
                ],
              ),
              const SizedBox(height: 50),
              Center(
                child: Column(
                  children: [
                    Text(
                      "รายละเอียดผู้รับบริจาค",
                      style: TextStyle(
                        color: const Color(0xFF2E8B58),
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 15),
                    Text(
                      widget.foundationName,
                      style: TextStyle(fontSize: 20),
                    ),
                    const SizedBox(height: 20),
                    Image.asset(
                      'assets/images/${widget.foundationImage}',
                      width: 189,
                      height: 182,
                      fit: BoxFit.contain,
                    ),
                    const SizedBox(height: 20),
                    Text("จำนวนเงิน", style: TextStyle(fontSize: 20)),
                    const SizedBox(height: 16),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 33),
                      child: TextField(
                        controller: amountController,
                        keyboardType: const TextInputType.numberWithOptions(decimal: true),
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(RegExp(r'[\d.,]')),
                        ],
                        decoration: InputDecoration(
                          hintText: 'ใส่จำนวนเงิน เช่น 1,000.00',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: const BorderSide(color: Color(0xFF19C3A3)),
                          ),
                        ),
                        textAlign: TextAlign.right,
                      ),
                    ),
                    const SizedBox(height: 14),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 33),
                      child: Row(
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap: () => selectCategory("สุขภาพดี"),
                              child: categoryButton("สุขภาพดี"),
                            ),
                          ),
                          Expanded(
                            child: GestureDetector(
                              onTap: () => selectCategory("โชคลาภ"),
                              child: categoryButton("โชคลาภ"),
                            ),
                          ),
                          Expanded(
                            child: GestureDetector(
                              onTap: () => selectCategory("การงานดี"),
                              child: categoryButton("การงานดี"),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 47),
                    GestureDetector(
                      onTap: isAmountFilled
                          ? () {
                        String raw = amountController.text.replaceAll(',', '');
                        double? value = double.tryParse(raw);

                        if (value == null || value <= 0) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('กรุณาใส่จำนวนเงินให้ถูกต้อง')),
                          );
                          return;
                        }

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PaymentDonate(
                              amount: value.toStringAsFixed(2),
                              imagePath: widget.imagePath,
                              accountName: widget.accountName,
                              bankName: widget.bankName,
                              accountNumber: widget.accountNumber,
                              thankYouTitle: widget.thankYouTitle,
                              thankYouSubTitle: widget.thankYouSubTitle,
                              thankYouBodyText: widget.thankYouBodyText,
                            ),
                          ),
                        );
                      }
                          : null,
                      child: Container(
                        width: 91,
                        height: 45,
                        decoration: BoxDecoration(
                          color: isAmountFilled ? const Color(0xFF19C3A3) : Colors.grey,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Center(
                          child: Text(
                            "บริจาค",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
