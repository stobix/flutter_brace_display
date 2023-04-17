part of 'size_wrapper.dart';

typedef OnWidgetSizeChange = void Function(Size size);

class SizeRenderObject extends RenderProxyBox {

  final OnWidgetSizeChange onSizeChange;
  Size? currentSize;

  SizeRenderObject(this.onSizeChange);

  @override
  void performLayout() {
    super.performLayout();

    try {
      Size? newSize = child?.size;

      if (newSize != null && currentSize != newSize) {
        currentSize = newSize;
        WidgetsBinding.instance.addPostFrameCallback((_) {
          onSizeChange(newSize);
        });
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }
}

enum OneDimRenderDirection {
  horizontal, vertical
}

class OneDimRenderObject extends RenderProxyBox {

  final OnWidgetSizeChange onDimChange;
  double? currentSize;

  final OneDimRenderDirection direction;
  OneDimRenderObject(
      this.onDimChange,
      [this.direction = OneDimRenderDirection.vertical]
      );
  @override
  void performLayout() {
    super.performLayout();

    try {
      Size? newSize = child?.size;

      if (newSize != null) {
        switch(direction){
          case OneDimRenderDirection.horizontal:
            if(currentSize != newSize.width){
              currentSize = newSize.width;
              WidgetsBinding.instance.addPostFrameCallback((_) {
                onDimChange(newSize);
              });
            }
            break;
          case OneDimRenderDirection.vertical:
            if(currentSize != newSize.height){
              currentSize = newSize.height;
              WidgetsBinding.instance.addPostFrameCallback((_) {
                onDimChange(newSize);
              });
            }
            break;
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }
}
