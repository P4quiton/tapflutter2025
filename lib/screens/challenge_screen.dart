import 'dart:ui';
import 'package:flutter/material.dart';

class ChallengeScreen extends StatefulWidget {
  const ChallengeScreen({super.key});

  @override
  State<ChallengeScreen> createState() => _ChallengeScreenState();
}

class _ChallengeScreenState extends State<ChallengeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              // Encabezado
              Container(
                height: 38,
                margin: const EdgeInsets.only(left: 20, top: 32, right: 20, bottom: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.network('https://flutter4fun.com/wp-content/uploads/2021/09/menu.png'),
                    const Text('Besom.', style: TextStyle(fontSize: 32, fontWeight: FontWeight.w800)),
                    Image.network('https://flutter4fun.com/wp-content/uploads/2021/09/bag.png')
                  ],
                ),
              ),
              // Lista de jugos
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.only(left: 20, top: 20, right: 20, bottom: 100),
                  itemCount: juiceList.length,
                  itemBuilder: (context, index) {
                    final juice = juiceList[index];
                    return JuiceWidget(
                      juice,
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => JuiceDetailsPage(juice),
                        ));
                      },
                    );
                  },
                ),
              )
            ],
          ),
          // Barra inferior translúcida
          Align(
            alignment: Alignment.bottomCenter,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(topLeft: Radius.circular(24), topRight: Radius.circular(24)),
              child: Container(
                height: 64,
                color: Colors.white.withOpacity(0.2),
                padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 18.0, sigmaY: 18.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      _NavIcon('https://flutter4fun.com/wp-content/uploads/2021/09/Home.png'),
                      _NavIcon('https://flutter4fun.com/wp-content/uploads/2021/09/Search.png'),
                      _NavIcon('https://flutter4fun.com/wp-content/uploads/2021/09/Heart.png'),
                      _NavIcon('https://flutter4fun.com/wp-content/uploads/2021/09/account.png'),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ========== COMPONENTES Y CLASES DE APOYO ==========

class _NavIcon extends StatelessWidget {
  final String url;
  const _NavIcon(this.url);
  @override
  Widget build(BuildContext context) {
    return Image.network(url, width: 24);
  }
}

class JuiceEntity {
  final String name;
  final String image;
  final String fullImage;
  final String price;
  final Color color;

  JuiceEntity({
    required this.name,
    required this.image,
    required this.fullImage,
    required this.price,
    required this.color,
  });
}

final juiceList = [
  JuiceEntity(
    name: 'Besom Yellow Juice',
    image: 'https://flutter4fun.com/wp-content/uploads/2021/09/juice1.png',
    fullImage: 'https://flutter4fun.com/wp-content/uploads/2021/09/full.png',
    price: '19.99',
    color: const Color(0xFFF3BE39),
  ),
  JuiceEntity(
    name: 'Besom Orange Juice',
    image: 'https://flutter4fun.com/wp-content/uploads/2021/09/juice2.png',
    fullImage: 'https://flutter4fun.com/wp-content/uploads/2021/09/full.png',
    price: '25.99',
    color: const Color(0xFFDC691F),
  ),
];

class JuiceWidget extends StatelessWidget {
  final JuiceEntity juice;
  final VoidCallback? onTap;

  const JuiceWidget(this.juice, {super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    final textStyle = const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600);
    return AspectRatio(
      aspectRatio: 1.25,
      child: LayoutBuilder(
        builder: (context, constraints) {
          final topPadding = constraints.maxHeight * 0.2;
          final leftPadding = constraints.maxWidth * 0.1;
          final imageWidth = constraints.maxWidth * 0.35;
          return GestureDetector(
            onTap: onTap,
            child: Stack(
              children: [
                Container(
                  margin: EdgeInsets.only(top: topPadding),
                  decoration: BoxDecoration(color: juice.color, borderRadius: BorderRadius.circular(24)),
                ),
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(top: topPadding, left: leftPadding),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(juice.name, style: textStyle.copyWith(fontSize: 20)),
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(text: '\$', style: textStyle.copyWith(fontSize: 16)),
                                  TextSpan(
                                    text: juice.price,
                                    style: textStyle.copyWith(fontSize: 30, fontWeight: FontWeight.w800),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 32,
                              width: 80,
                              child: MyButton(text: 'Buy Now', textColor: juice.color),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: imageWidth,
                      child: Image.network(juice.image),
                    )
                  ],
                )
              ],
            ),
          );
        },
      ),
    );
  }
}

class MyButton extends StatelessWidget {
  final String text;
  final Color bgColor;
  final Color textColor;

  const MyButton({
    super.key,
    required this.text,
    this.bgColor = Colors.white,
    this.textColor = Colors.black,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        elevation: 0,
        backgroundColor: bgColor,
        foregroundColor: textColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      child: Text(text, style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 12)),
    );
  }
}

// Puedes pedirme aparte la clase JuiceDetailsPage si la quieres integrada también.


class JuiceDetailsPage extends StatefulWidget {
  final JuiceEntity juice;
  const JuiceDetailsPage(this.juice, {super.key});

  @override
  State<JuiceDetailsPage> createState() => _JuiceDetailsPageState();
}

class _JuiceDetailsPageState extends State<JuiceDetailsPage> {
  int count = 0;
  final double bottomSectionHeight = 100;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          ListView(
            padding: EdgeInsets.only(bottom: bottomSectionHeight),
            children: [
              AspectRatio(
                aspectRatio: 0.86,
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    final imageHeight = constraints.maxHeight * 0.7;
                    final imageMargin = constraints.maxWidth * 0.15;
                    final imageBottom = constraints.maxHeight * 0.07;

                    return Stack(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(bottom: 26),
                          decoration: BoxDecoration(
                            color: widget.juice.color,
                            borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(32),
                              bottomRight: Radius.circular(32),
                            ),
                          ),
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: Padding(
                              padding: EdgeInsets.only(
                                left: imageMargin,
                                right: imageMargin,
                                bottom: imageBottom,
                              ),
                              child: Image.network(
                                widget.juice.fullImage,
                                height: imageHeight,
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: CounterWidget(
                            currentCount: count,
                            color: widget.juice.color,
                            onIncreaseClicked: () {
                              setState(() => count++);
                            },
                            onDecreaseClicked: () {
                              if (count > 0) setState(() => count--);
                            },
                          ),
                        )
                      ],
                    );
                  },
                ),
              ),
              const SizedBox(height: 32),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          widget.juice.name,
                          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                        ),
                        const SimpleRatingBar(),
                      ],
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'Drinking Orange Juice not only enhances health but also strengthens muscles.',
                      style: TextStyle(color: Color(0xFFB0B1B4), fontSize: 16),
                    ),
                    const SizedBox(height: 24),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text('Reviews', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700)),
                        Text(
                          'See all',
                          style: TextStyle(
                            color: Color(0xFFD81C33),
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    const ReviewsList(),
                  ],
                ),
              )
            ],
          ),
          Container(
            padding: const EdgeInsets.only(left: 24, right: 24, top: 26, bottom: 8),
            color: widget.juice.color,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () => Navigator.of(context).pop(),
                  child: Image.network(
                    'https://flutter4fun.com/wp-content/uploads/2021/09/back.png',
                    width: 32,
                  ),
                ),
                const Text(
                  'Besom.',
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.w800, color: Colors.white),
                ),
                Image.network(
                  'https://flutter4fun.com/wp-content/uploads/2021/09/shop_white.png',
                  width: 32,
                )
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: bottomSectionHeight,
              color: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Row(
                children: [
                  Expanded(
                    child: RichText(
                      text: TextSpan(
                        style: const TextStyle(color: Colors.black),
                        children: [
                          const TextSpan(
                            text: '\$',
                            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                          ),
                          TextSpan(
                            text: widget.juice.price,
                            style: const TextStyle(fontSize: 36, fontWeight: FontWeight.w800),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 120,
                    height: 48,
                    child: MyButton(
                      text: 'Buy Now',
                      bgColor: widget.juice.color,
                      textColor: Colors.white,
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

// === Widgets adicionales ===

class CounterWidget extends StatelessWidget {
  final int currentCount;
  final Color color;
  final VoidCallback? onIncreaseClicked;
  final VoidCallback? onDecreaseClicked;

  const CounterWidget({
    super.key,
    required this.currentCount,
    required this.color,
    this.onIncreaseClicked,
    this.onDecreaseClicked,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 52,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: Colors.white),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(width: 16),
          GestureDetector(
            onTap: onDecreaseClicked,
            child: const Icon(Icons.remove, color: Colors.white),
          ),
          const SizedBox(width: 10),
          SizedBox(
            width: 30,
            child: Text(
              currentCount.toString(),
              style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 18),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(width: 10),
          GestureDetector(
            onTap: onIncreaseClicked,
            child: const Icon(Icons.add, color: Colors.white),
          ),
          const SizedBox(width: 16),
        ],
      ),
    );
  }
}

class SimpleRatingBar extends StatelessWidget {
  const SimpleRatingBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
        5,
            (index) => const Icon(Icons.star, color: Color(0xFFFFBA00), size: 18),
      ),
    );
  }
}

class ReviewsList extends StatelessWidget {
  const ReviewsList({super.key});

  @override
  Widget build(BuildContext context) {
    final reviewImages = [
      'https://flutter4fun.com/wp-content/uploads/2021/09/1.png',
      'https://flutter4fun.com/wp-content/uploads/2021/09/2.png',
      'https://flutter4fun.com/wp-content/uploads/2021/09/3.png',
      'https://flutter4fun.com/wp-content/uploads/2021/09/4.png',
    ];
    const addImageUrl = 'https://flutter4fun.com/wp-content/uploads/2021/09/add.png';

    return SizedBox(
      height: 48,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        separatorBuilder: (_, __) => const SizedBox(width: 18),
        itemCount: reviewImages.length + 1,
        itemBuilder: (_, index) {
          if (index == reviewImages.length) {
            return Image.network(addImageUrl);
          }
          return Image.network(reviewImages[index]);
        },
      ),
    );
  }
}
