import 'package:flutter/material.dart';
import 'package:flutter_news/screens/coupon_screen.dart';
import 'package:flutter_news/screens/transaction_screen.dart';
import 'package:flutter_news/widgets/logo.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Logo(),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          Container(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ClipOval(
                    child: Image.network(
                      'https://i.pravatar.cc/300?img=3',
                      width: 120.0,
                      height: 120.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const Text(
                    "Warman Suganda",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 24.0),
                  ),
                  Text(
                    "warman.suganda@gmail.com",
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                ],
              ),
            ),
          ),
          Container(
            alignment: Alignment.center,
            color: Colors.grey[200],
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Wallet",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18.0),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context)
                              .pushNamed(TransactionScreen.routeName);
                        },
                        child: const Row(
                          children: [
                            Text(
                              "View Transaction",
                              style: TextStyle(color: Colors.blue),
                            ),
                            Icon(
                              Icons.chevron_right,
                              color: Colors.blue,
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  const Card(
                    margin: EdgeInsets.all(0),
                    child: Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          CardSection(
                            icon: Icons.paid,
                            content: "\$ 100k",
                            title: "Balance",
                          ),
                          SectionDivider(),
                          CardSection(
                            icon: Icons.cloud_download,
                            content: "0",
                            title: "Income",
                          ),
                          SectionDivider(),
                          CardSection(
                            icon: Icons.cloud_upload,
                            content: "0",
                            title: "Expense",
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 24.0,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Subscription",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18.0),
                      ),
                      Row(
                        children: [
                          Text(
                            "View Library",
                            style: TextStyle(color: Colors.blue),
                          ),
                          Icon(
                            Icons.chevron_right,
                            color: Colors.blue,
                          )
                        ],
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  const Card(
                    margin: EdgeInsets.all(0),
                    child: Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          CardSection(
                            content: "0",
                            title: "Library",
                          ),
                          SectionDivider(),
                          CardSection(
                            content: "0",
                            title: "Premium",
                          ),
                          SectionDivider(),
                          CardSection(
                            content: "0",
                            title: "Free",
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 24.0,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushNamed(CouponScreen.routeName);
                    },
                    child: Card(
                      margin: const EdgeInsets.all(0),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Icon(
                              Icons.verified,
                              color: Colors.green,
                              size: 32.0,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Coupon",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(
                                  height: 4.0,
                                ),
                                Text(
                                  "Redeem your coupon, and get the prize",
                                  style: TextStyle(color: Colors.grey[600]),
                                ),
                              ],
                            ),
                            const Icon(
                              Icons.chevron_right,
                              color: Colors.grey,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 24.0,
                  ),
                  OutlinedButton(
                      style: OutlinedButton.styleFrom(
                          side: const BorderSide(color: Colors.red),
                          backgroundColor: Colors.white,
                          minimumSize: const Size.fromHeight(42.0),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50.0))),
                      onPressed: () {},
                      child: const Text(
                        "CLEAR ALL DATA",
                        style: TextStyle(color: Colors.red),
                      ))
                ],
              ),
            ),
          )
        ],
      )),
    );
  }
}

class SectionDivider extends StatelessWidget {
  const SectionDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.0,
      color: Colors.grey[200],
      width: 1,
    );
  }
}

class CardSection extends StatelessWidget {
  final IconData? icon;
  final String content;
  final String title;

  const CardSection(
      {super.key, this.icon, required this.content, required this.title});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 5.0,
      direction: Axis.vertical,
      alignment: WrapAlignment.center,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        if (icon != null)
          Icon(
            icon,
            color: Colors.blue,
          ),
        Text(
          content,
          style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 20.0),
        ),
        Text(
          title,
          style: TextStyle(color: Colors.grey[600]),
        ),
      ],
    );
  }
}
