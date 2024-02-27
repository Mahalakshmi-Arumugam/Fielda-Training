import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Scrollable Cards'),
        ),
        body: Column(
          children: [
            TopCard(),
            Expanded(
              child: AllCardsList(),
            ),
          ],
        ),
      ),
    );
  }
}

class TopCard extends StatefulWidget {
  @override
  _TopCardState createState() => _TopCardState();
}

class _TopCardState extends State<TopCard> {
  Color topCardColor = Colors.yellow; 

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150.0,
      color: topCardColor, 
      alignment: Alignment.center,
      child: Text(
        'Top Card',
        style: TextStyle(color: Colors.white),
      ),
    );
  }


  void updateTopCardColor(Color color) {
    setState(() {
      topCardColor = color;
    });
  }
}

class AllCardsList extends StatefulWidget {
  @override
  _AllCardsListState createState() => _AllCardsListState();
}

class _AllCardsListState extends State<AllCardsList> {
  final scrollController = ScrollController();
  final colors = [
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.orange,
    Colors.purple,
  ];

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: scrollController,
      itemCount: 10, 
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: () {
              print('Card $index tapped!');
            },
            child: AnimatedBuilder(
              animation: scrollController,
              builder: (context, _) {
                final topCardHeight = 150.0;
                final cardHeight = 100.0;
                final scrollOffset =
                    scrollController.hasClients ? scrollController.offset : 0.0;
                final scrollPosition =
                    index * (cardHeight + 8.0) - scrollOffset;

                if (scrollPosition <= topCardHeight && index == 0) {
                 
                  final scrollPercentage =
                      (scrollPosition / topCardHeight).clamp(0.0, 1.0);

                 
                  final newColor = Color.lerp(Colors.yellow,
                      colors[index % colors.length], scrollPercentage)!;

               
                  final topCardState =
                      context.findAncestorStateOfType<_TopCardState>();
                  if (topCardState != null) {
                    topCardState.updateTopCardColor(newColor);
                  }
                }

                return Container(
                  height: cardHeight,
                  color: colors[index % colors.length],
                  child: Center(
                    child: Text(
                      'Card $index',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
