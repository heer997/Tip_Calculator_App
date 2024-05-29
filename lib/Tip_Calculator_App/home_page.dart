import "package:flutter/material.dart";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Home Page",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF03C9BD)),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  TextEditingController billAmtController = TextEditingController();

  int perCount = 1;
  int tipPercent = 0;
  num totalBillAmt = 0.0;
  num totalTipAmt = 0.0;
  num totalAmt = 0.0;
  num perPersonAmt = 0.0;
  bool isCustomTip = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: () {
          return FocusManager.instance.primaryFocus?.unfocus();
        },
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: const Color(0xFFF5F3F4),
          body: Padding(
            padding: const EdgeInsets.all(21.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  flex: 3,
                  child: getTitlePart1(),
                ),
                Expanded(
                  flex: 6,
                  child: getTipBoardPart2(),
                ),
                Expanded(
                  flex: 3,
                  child: getEnterBillPart3(),
                ),
                Expanded(
                  flex: 4,
                  child: getTipPart4(),
                ),
                Expanded(
                  flex: 3,
                  child: getSplitPart5(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Part 1
  Widget getTitlePart1() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Image.asset("assets/images/magician_Cap.jpg",
            width: 60.0, height: 60.0),
        const SizedBox(width: 11.0),
        const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text.rich(
              TextSpan(
                text: "Mr",
                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                children: [
                  TextSpan(
                    text: " TIP",
                    style:
                        TextStyle(fontSize: 21.0, fontWeight: FontWeight.w900),
                  ),
                ],
              ),
            ),
            Text(
              "Calculator",
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ],
    );
  }

  /// Part 2
  Widget getTipBoardPart2() {
    return Card(
      elevation: 7,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25.0),
      ),
      child: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(21.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              const Text(
                "Total p/person",
                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
              ),
              Text.rich(
                TextSpan(
                  text: "\$",
                  style: const TextStyle(
                      fontSize: 25.0, fontWeight: FontWeight.w900),
                  children: [
                    TextSpan(
                      text: perPersonAmt == 0.0
                          ? "000"
                          : perPersonAmt.toStringAsFixed(3),
                      style: const TextStyle(
                          fontSize: 47.0, fontWeight: FontWeight.w900),
                    ),
                  ],
                ),
              ),
              const Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      const Text(
                        "Total bill",
                        style: TextStyle(fontSize: 16.0),
                      ),
                      Text.rich(
                        TextSpan(
                          text: "\$",
                          style: const TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w900,
                            color: Color(0xFF03C9BD),
                          ),
                          children: [
                            TextSpan(
                              text: totalBillAmt == 0.0
                                  ? "000"
                                  : totalBillAmt.toStringAsFixed(3),
                              style: const TextStyle(
                                  fontSize: 21.0, fontWeight: FontWeight.w900),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      const Text(
                        "Total tip",
                        style: TextStyle(fontSize: 16.0),
                      ),
                      Text.rich(
                        TextSpan(
                          text: "\$",
                          style: const TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w900,
                            color: Color(0xFF03C9BD),
                          ),
                          children: [
                            TextSpan(
                              text: totalTipAmt == 0.0
                                  ? "000"
                                  : totalTipAmt.toStringAsFixed(3),
                              style: const TextStyle(
                                fontSize: 21.0,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Part 3
  Widget getEnterBillPart3() {
    return Row(
      children: <Widget>[
        const Expanded(
          child: Text.rich(
            TextSpan(
              text: "Enter\n",
              style: TextStyle(fontSize: 21.0, fontWeight: FontWeight.w900),
              children: [
                TextSpan(
                  text: "your bill",
                  style: TextStyle(fontSize: 21.0, fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          flex: 3,
          child: TextFormField(
            controller: billAmtController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              fillColor: Colors.white,
              filled: true,
              prefixText: "\$",
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  style: BorderStyle.none,
                  color: Colors.white,
                  width: 1.0,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  /// Part 4
  Widget getTipPart4() {
    return Row(
      children: <Widget>[
        const Expanded(
          child: Text.rich(
            TextSpan(
              text: "Choose\n",
              style: TextStyle(fontSize: 21.0, fontWeight: FontWeight.w900),
              children: [
                TextSpan(
                  text: "your tip",
                  style: TextStyle(fontSize: 21.0, fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          flex: 3,
          child: Column(
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(11.0),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            tipPercent = 10;
                            updateTheResult();
                          },
                          child: Container(
                            height: 80.0,
                            decoration: BoxDecoration(
                              color: const Color(0xFF03C9BD),
                              borderRadius: BorderRadius.circular(16.0),
                            ),
                            child: const Center(
                              child: Text.rich(
                                TextSpan(
                                  text: "10",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 25.0,
                                      fontWeight: FontWeight.w900),
                                  children: [
                                    TextSpan(
                                      text: "%",
                                      style: TextStyle(
                                          fontSize: 12.0,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10.0),
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            tipPercent = 15;
                            updateTheResult();
                          },
                          child: Container(
                            height: 80.0,
                            decoration: BoxDecoration(
                              color: const Color(0xFF03C9BD),
                              borderRadius: BorderRadius.circular(16.0),
                            ),
                            child: const Center(
                              child: Text.rich(
                                TextSpan(
                                  text: "15",
                                  style: TextStyle(
                                      fontSize: 25.0,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w900),
                                  children: [
                                    TextSpan(
                                      text: "%",
                                      style: TextStyle(
                                          fontSize: 12.0,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10.0),
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            tipPercent = 20;
                            updateTheResult();
                          },
                          child: Container(
                            height: 80.0,
                            decoration: BoxDecoration(
                              color: const Color(0xFF03C9BD),
                              borderRadius: BorderRadius.circular(16.0),
                            ),
                            child: const Center(
                              child: Text.rich(
                                TextSpan(
                                  text: "20",
                                  style: TextStyle(
                                      fontSize: 25.0,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w900),
                                  children: [
                                    TextSpan(
                                      text: "%",
                                      style: TextStyle(
                                          fontSize: 12.0,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(11.0),
                  child: Stack(
                    children: [
                      TextFormField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          prefixText: "\%",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16.0),
                            borderSide: const BorderSide(
                              style: BorderStyle.none,
                              color: Colors.white,
                              width: 1.0,
                            ),
                          ),
                        ),
                      ),
                      isCustomTip
                          ? Container()
                          : InkWell(
                              onTap: () {
                                isCustomTip = true;
                                setState(() {});
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: const Color(0xFF03C9BD),
                                  borderRadius: BorderRadius.circular(16.0),
                                ),
                                child: const Center(
                                  child: Text(
                                    "Custom Tip",
                                    style: TextStyle(
                                        fontSize: 21.0,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w900),
                                  ),
                                ),
                              ),
                            ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  /// Part 5
  Widget getSplitPart5() {
    return Row(
      children: <Widget>[
        const Expanded(
          child: Text.rich(
            TextSpan(
              text: "Split\n",
              style: TextStyle(fontSize: 21.0, fontWeight: FontWeight.w900),
              children: [
                TextSpan(
                  text: "the total",
                  style: TextStyle(fontSize: 21.0, fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          flex: 3,
          child: Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 30.0, horizontal: 11.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 3,
                  child: InkWell(
                    onTap: () {
                      if (perCount > 1) {
                        perCount--;
                        updateTheResult();
                      }
                    },
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Color(0xFF03C9BD),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(16.0),
                          bottomLeft: Radius.circular(16.0),
                        ),
                      ),
                      child: const Center(
                        child: Text("-",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 25.0,
                                fontWeight: FontWeight.w900)),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Container(
                    color: Colors.white,
                    child: Center(
                      child: Text("$perCount",
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 25.0,
                              fontWeight: FontWeight.w900)),
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: InkWell(
                    onTap: () {
                      perCount++;
                      updateTheResult();
                    },
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Color(0xFF03C9BD),
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(16.0),
                          bottomRight: Radius.circular(16.0),
                        ),
                      ),
                      child: const Center(
                        child: Text("+",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 25.0,
                                fontWeight: FontWeight.w900)),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  /// Calculation Tip Result
  void updateTheResult() {
    if (billAmtController.text != "") {
      totalBillAmt = double.parse(billAmtController.text.toString());
      totalTipAmt = totalBillAmt * (tipPercent / 100);
      totalAmt = totalBillAmt + totalTipAmt;
      perPersonAmt = totalAmt / perCount;

      setState(() {});
    } else {
      perCount = 1;
    }
  }
}
