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
      backgroundColor: Colors.blue[300],
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
                    Image.network('https://th.bing.com/th/id/OIP.5KSpgZ-1K29lnDx4SczzbgHaDm?w=350&h=170&c=7&r=0&o=7&cb=iwp2&pid=1.7&rm=3'),
                    const Text('Tienda de Guitarras', style: TextStyle(fontSize: 32, fontWeight: FontWeight.w800)),
                    Image.network('https://th.bing.com/th/id/OIP.5KSpgZ-1K29lnDx4SczzbgHaDm?w=350&h=170&c=7&r=0&o=7&cb=iwp2&pid=1.7&rm=3')
                  ],
                ),
              ),
              // Lista de guitarras
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.only(left: 20, top: 20, right: 20, bottom: 100),
                  itemCount: guitarraList.length,
                  itemBuilder: (context, index) {
                    final guitarra = guitarraList[index];
                    return GuitarraWidget(
                      guitarra,
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => GuitarraDetailsPage(guitarra),
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
                      _NavIcon('https://static.vecteezy.com/system/resources/previews/000/366/438/original/home-vector-icon.jpg'),
                      _NavIcon('https://cdn-icons-png.flaticon.com/512/92/92455.png'),
                      _NavIcon('https://static.vecteezy.com/system/resources/previews/002/205/880/large_2x/heart-icon-free-vector.jpg'),
                      _NavIcon('https://static.vecteezy.com/system/resources/previews/007/335/692/non_2x/account-icon-template-vector.jpg'),
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

class GuitarraEntity {
  final String name;
  final String image;
  final String fullImage;
  final String price;
  final Color color;

  GuitarraEntity({
    required this.name,
    required this.image,
    required this.fullImage,
    required this.price,
    required this.color,
  });
}

final guitarraList = [
  GuitarraEntity(
    name: 'Gibson Les Paul',
    image: 'https://cdn.shopify.com/s/files/1/0343/4368/2183/products/gibson-electric-guitars-solid-body-gibson-les-paul-custom-cherry-sunburst-1988-u4131235101-29787290140807_720x720@3x.jpg?v=1664559451',
    fullImage: 'https://cdn.shopify.com/s/files/1/0343/4368/2183/products/gibson-electric-guitars-solid-body-gibson-les-paul-custom-cherry-sunburst-1988-u4131235101-29787290140807_720x720@3x.jpg?v=1664559451',
    price: '9247.50',
    color: const Color(0xFF201E1E),
  ),
  GuitarraEntity(
    name: 'Fender Stratocaster',
    image: 'https://th.bing.com/th/id/R.226225c795e2b35f0455ac725fa710af?rik=jGpYHXFK3pEu7g&pid=ImgRaw&r=0',
    fullImage: 'https://th.bing.com/th/id/R.226225c795e2b35f0455ac725fa710af?rik=jGpYHXFK3pEu7g&pid=ImgRaw&r=0',
    price: '17230.79',
    color: const Color(0xFF9C360A),
  ),
  GuitarraEntity(
    name: 'Jackson Superstrat',
    image: 'https://th.bing.com/th?id=OPHS.fLbuB%2bMh%2f9siog474C474&w=200&h=150&c=17&pid=21.1',
    fullImage: 'https://th.bing.com/th?id=OPHS.fLbuB%2bMh%2f9siog474C474&w=200&h=150&c=17&pid=21.1',
    price: '7799',
    color: const Color(0xFF444444),
  ),
  GuitarraEntity(
    name: 'Gibson SG',
    image: 'https://th.bing.com/th/id/R.826f0363ffea6d4053d7e75866d7ff73?rik=e3ExZ4yKjNCXEg&pid=ImgRaw&r=0',
    fullImage: 'https://th.bing.com/th/id/R.826f0363ffea6d4053d7e75866d7ff73?rik=e3ExZ4yKjNCXEg&pid=ImgRaw&r=0',
    price: '15137.79',
    color: const Color(0xFF990000),
  ),
];

class GuitarraWidget extends StatelessWidget {
  final GuitarraEntity guitarra;
  final VoidCallback? onTap;

  const GuitarraWidget(this.guitarra, {super.key, this.onTap});

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
                  decoration: BoxDecoration(color: guitarra.color, borderRadius: BorderRadius.circular(24)),
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
                            Text(guitarra.name, style: textStyle.copyWith(fontSize: 20)),
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(text: '\$', style: textStyle.copyWith(fontSize: 16)),
                                  TextSpan(
                                    text: guitarra.price,
                                    style: textStyle.copyWith(fontSize: 30, fontWeight: FontWeight.w800),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 32,
                              width: 80,
                              child: MyButton(text: 'Comprar', textColor: guitarra.color),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: imageWidth,
                      child: Image.network(guitarra.image),
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



class GuitarraDetailsPage extends StatefulWidget {
  final GuitarraEntity guitarra;
  const GuitarraDetailsPage(this.guitarra, {super.key});

  @override
  State<GuitarraDetailsPage> createState() => _GuitarraDetailsPageState();
}

class _GuitarraDetailsPageState extends State<GuitarraDetailsPage> {
  int count = 0;
  final double bottomSectionHeight = 100;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[300],
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
                            color: widget.guitarra.color,
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
                                widget.guitarra.fullImage,
                                height: imageHeight,
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: CounterWidget(
                            currentCount: count,
                            color: widget.guitarra.color,
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
                          widget.guitarra.name,
                          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                        ),
                        const SimpleRatingBar(),
                      ],
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'Esta guitarra tiene lo que necesitas, balance perfecto entre armonicos y crudeza.',
                      style: TextStyle(color: Color(0xFF141415), fontSize: 16),
                    ),
                    const SizedBox(height: 24),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text('Reviews', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700)),
                        Text(
                          'Ver todo',
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
            color: widget.guitarra.color,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () => Navigator.of(context).pop(),
                  child: Image.network(
                    'https://th.bing.com/th/id/OIP.5KSpgZ-1K29lnDx4SczzbgHaDm?w=350&h=170&c=7&r=0&o=7&cb=iwp2&pid=1.7&rm=3',
                    width: 32,
                  ),
                ),
                const Text(
                  'Tienda de Guitarras',
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.w800, color: Colors.white),
                ),
                Image.network(
                  'https://th.bing.com/th/id/OIP.5KSpgZ-1K29lnDx4SczzbgHaDm?w=350&h=170&c=7&r=0&o=7&cb=iwp2&pid=1.7&rm=3',
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
                            text: widget.guitarra.price,
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
                      text: 'Comprar',
                      bgColor: widget.guitarra.color,
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
      'data:image/webp;base64,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',
      'data:image/webp;base64,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',
      'data:image/webp;base64,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',
      'data:image/webp;base64,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',
    ];
    const addImageUrl = 'https://cdn-icons-png.flaticon.com/128/814/814208.png';

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
