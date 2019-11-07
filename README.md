# CDTitleSlideWrapView

[![CI Status](https://img.shields.io/travis/lyluoyuan@126.com/CDTitleSlideWrapView.svg?style=flat)](https://travis-ci.org/lyluoyuan@126.com/CDTitleSlideWrapView)
[![Version](https://img.shields.io/cocoapods/v/CDTitleSlideWrapView.svg?style=flat)](https://cocoapods.org/pods/CDTitleSlideWrapView)
[![License](https://img.shields.io/cocoapods/l/CDTitleSlideWrapView.svg?style=flat)](https://cocoapods.org/pods/CDTitleSlideWrapView)
[![Platform](https://img.shields.io/cocoapods/p/CDTitleSlideWrapView.svg?style=flat)](https://cocoapods.org/pods/CDTitleSlideWrapView)


<img src="https://raw.githubusercontent.com/lyluoyuan/CDTitleSlideWrapView/master/backup/demo.gif"  width = "112" height = "200"  align=left />

## Example
```
CDTitleSlideWrapView *slideWrapView = [CDTitleSlideWrapView new];
slideWrapView.frame = self.view.bounds;
[self.view addSubview:slideWrapView];

NSArray *rawTitles = @[@"title1",@"title2",@"title3"];
slideWrapView.items = rawTitles;

UIViewController *vc1 = [UIViewController new];
vc1.view.backgroundColor = [UIColor whiteColor];
UIViewController *vc2 = [UIViewController new];
vc2.view.backgroundColor = [UIColor yellowColor];
UIViewController *vc3 = [UIViewController new];
vc3.view.backgroundColor = [UIColor blueColor];
slideWrapView.viewControllers = @[vc1,vc2,vc3];
```
## Requirements

## Installation

CDTitleSlideWrapView is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'CDTitleSlideWrapView'
```

## Author

lyluoyuan@126.com, lyluoyuan@126.com

## License

CDTitleSlideWrapView is available under the MIT license. See the LICENSE file for more info.
