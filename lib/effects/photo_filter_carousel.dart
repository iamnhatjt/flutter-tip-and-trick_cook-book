import 'package:flutter/material.dart';

class DisplayFilter extends StatefulWidget {
  const DisplayFilter({super.key});

  @override
  State<DisplayFilter> createState() => _DisplayFilterState();
}

class _DisplayFilterState extends State<DisplayFilter> {
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Positioned.fill(child: _builPhotoWithFilter()),
      const Positioned(
          left: 0.0, right: 0.0, bottom: 0.0, child: FilterSelecter())
    ]);
  }
}

class FilterSelecter extends StatefulWidget {
  const FilterSelecter({super.key});

  @override
  State<FilterSelecter> createState() => _FilterSelecterState();
}

class _FilterSelecterState extends State<FilterSelecter> {
  static const _filterPerScreen = 5;
  static const _viewportFactionPerItem = 1.0 / _filterPerScreen;
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints){
      final itemSize = constraints.maxWidth * _viewportFactionPerItem;
      return Stack(
        children: [
          _buildShadowGradient(itemSize),
          _buildCarousel(itemSize),
            _buildSelectionRing(itemSize),
            
        ],
      )
    });
  }

  
 Widget _buildShadowGradient(double itemSize) {
    return SizedBox(
      height: itemSize * 2 + widget.padding.vertical,
      child: const DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.transparent,
              Colors.black,
            ],
          ),
        ),
        child: SizedBox.expand(),
      ),
    );
  }

  Widget _buildSelectionRing(double itemSize) {
    return IgnorePointer(
      child: Padding(
        padding: widget.padding,
        child: SizedBox(
          width: itemSize,
          height: itemSize,
          child: const DecoratedBox(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.fromBorderSide(
                BorderSide(width: 6.0, color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }

Color itemColor(int index) => widget.filters[index % widget.filters.length];

Widget _buildCarousel(double itemSize) {
  return Container(
    height: itemSize,
    margin: widget.padding,
    child: PageView.builder(
      itemCount: widget.filters.length,
      itemBuilder: (context, index) {
        return Center(
          child: FilterItem(
            color: itemColor(index),
            onFilterSelected: () {},
          ),
        );
      },
    ),
  );
}
  

}


class FilterItem extends StatelessWidget {
  const FilterItem({
    super.key,
    required this.color,
    this.onFilterSelected,
  });

  final Color color;
  final VoidCallback? onFilterSelected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onFilterSelected,
      child: AspectRatio(
        aspectRatio: 1.0,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ClipOval(
            child: Image.network(
              'https://docs.flutter.dev/cookbook/img-files'
              '/effects/instagram-buttons/millenial-texture.jpg',
              color: color.withOpacity(0.5),
              colorBlendMode: BlendMode.hardLight,
            ),
          ),
        ),
      ),
    );
  }
}