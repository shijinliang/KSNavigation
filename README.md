# KSNavigation
##封装导航控制器

现在的应用一般都需要导航一致（返回按钮统一，标题背景统一等等）所以就根据UINavigationController封装了一个导航，具体核心如下：
* 统一设置返回按钮
* 统一设置UINavigationBar
* 由于封装会使右滑返回失效，需要添加代理设置

以下为解决方案：
####统一设置返回按钮

```
/**
 *  能拦截所有push进来的子控制器
 */
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (self.viewControllers.count > 0) { // 如果现在push的不是栈底控制器(最先push进来的那个控制器)
        viewController.hidesBottomBarWhenPushed = YES;
    // 设置导航栏按钮
        UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 22, 22)];
        [button setImage:[UIImage imageNamed:@"fanhui"] forState:UIControlStateNormal];
        [button setImageEdgeInsets:UIEdgeInsetsMake(0, -20, 0, 0)];
        [button addTarget:self action:@selector(popView) forControlEvents:UIControlEventTouchUpInside];
        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:button];
        }
    [super pushViewController:viewController animated:animated];
}
```
####设置右滑返回代理

* 第一部分

```
@interface KSNavigationController ()<UIGestureRecognizerDelegate>

@end
```
* 第二部分

```
- (void)viewDidLoad {
    …………
    //设置手势代理
    self.interactivePopGestureRecognizer.delegate = self;
    …………
}
```
* 第三部分

```
//手势代理
- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer
{
    return self.childViewControllers.count > 1;
}
```

####设置导航栏主题

```
//设置导航栏主题
- (void)setupNavigationBar
{
    UINavigationBar *appearance = [UINavigationBar appearance];
    //统一设置导航栏颜色，如果单个界面需要设置，可以在viewWillAppear里面设置，在viewWillDisappear设置回统一格式。
    [appearance setBarTintColor:[UIColor getColor:@"fb9c0a"]];
    
    //导航栏title格式
    NSMutableDictionary *textAttribute = [NSMutableDictionary dictionary];
    textAttribute[NSForegroundColorAttributeName] = [UIColor whiteColor];
    textAttribute[NSFontAttributeName] = [UIFont systemFontOfSize:15];
    [appearance setTitleTextAttributes:textAttribute];
}
```
