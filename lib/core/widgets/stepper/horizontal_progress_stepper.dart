import '../../../src/main_index.dart';
import 'dashed_line_horizontal.dart';

class HorizontalProgressStepper extends StatelessWidget {
  final double _width;

  final List<String>? _titles;
  final List<Widget>? _widgets;
  final int _curStep;
  final Color _activeColor;
  final Color _inactiveColor = Colors.grey;
  final double lineWidth = 1.5;
  final PageController controller;

  HorizontalProgressStepper(
      {Key? key,
      int curStep = 1,
      List<String>? titles,
      List<Widget>? widgets,
      double width = double.infinity,
      controller,
      required Color color})
      : _titles = titles,
        _widgets = widgets,
        _curStep = curStep,
        _width = width,
        _activeColor = color,
        controller = controller ?? PageController(),
        assert(width > 0),
        super(key: key);

  StreamStateInitial<int> stepsStream = StreamStateInitial<int>();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: _width,
        child: Column(
          children: <Widget>[
            const SizedBox(
              height: 8,
            ),
            if ((_titles != null && _titles!.length > 1) ||
                (_widgets != null && _widgets!.length > 1))
              StreamBuilder<int>(
                  initialData: _curStep,
                  stream: stepsStream.stream,
                  builder: (context, snapshot) {
                    return Row(
                      children: _iconViews(snapshot.data ?? _curStep),
                    );
                  }),
            const SizedBox(
              height: 8,
            ),
            _titles != null
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: (_titles != null && _titles!.length > 1) ||
                            (_widgets != null && _widgets!.length > 1)
                        ? _titleViews()
                        : [],
                  )
                : Expanded(child: pages()),
          ],
        ));
  }

  List<Widget> _iconViews(int curStep) {
    var list = <Widget>[];
    (_titles ?? _widgets)?.asMap().forEach((i, icon) {
      var circleColor = (i == 0 || curStep > i) ? _activeColor : _inactiveColor;
      var lineColor = curStep > i ? _activeColor : _inactiveColor;
      var iconColor = (i == 0 || curStep > i) ? _activeColor : _inactiveColor;

      list.add(
        Container(
          width: 20.0,
          height: 20.0,
          padding: const EdgeInsets.all(0),
          decoration: BoxDecoration(
            /* color: circleColor,*/
            borderRadius: const BorderRadius.all(Radius.circular(22.0)),
            border: Border.all(
              color: circleColor,
              width: 1.0,
            ),
          ),
          child: Icon(
            Icons.circle,
            color: iconColor,
            size: 17.0,
          ),
        ),
      );

      //line between icons
      if (i != (_titles?.length ?? _widgets?.length)! - 1) {
        list.add(Expanded(
          child: curStep > i + 1
              ? Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  height: lineWidth,
                  color: lineColor,
                )
              : const DashedLineHorizontal(
                  // color: lineColor,
                  // height: lineWidth,
                  ),
        ));
      }
    });

    return list;
  }

  List<Widget> _titleViews() {
    var list = <Widget>[];
    _titles?.asMap().forEach((i, text) {
      list.add(Text(text, style: const TextStyle(color: Colors.red)));
    });
    return list;
  }

  Widget pages() {
    return PageView.builder(
      itemCount: _widgets?.length,
      controller: controller,
      physics: const NeverScrollableScrollPhysics(),
      onPageChanged: (index) {
        stepsStream.setData(index + 1);
      },
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: _widgets![index],
        );
      },
    );
  }
}
