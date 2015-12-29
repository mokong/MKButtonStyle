# MKButtonStyle
MKButtonStyle是通过category自定义button的titleLabel和imageView的位置，方便使用


##	使用
下载项目，将MKButtonCategory下的文件拖入项目里，在要使用的地方导入头文件，然后直接调用方法即可。

**注意:** 如果用xib的话，必须给button的图片和按钮初始化的内容，否则会发现图片显示不出来；

## 原理
1.	titleEdgeInsets是title相对于其上下左右的inset，跟tableView的contentInset是类似的;
2.	**如果**只有title，那它上下左右都是相对于button的，image也是一样；
3.	**如果**同时有image和label，那这时候image的上左下是相对于button，右边是相对于label的；title的上右下是相对于button，左边是相对于image的。

##	参考
1.	[UIButton的titleEdgeInsets属性和imageEdgeInsets属性实现图片文字按要求排列](http://www.cnblogs.com/Phelthas/p/4452235.html)，这篇博客里介绍了上面的原理，建议仔细看，理解之后就可以明白
2. [UIButton 的 imageEdgeInsets 和 titleEdgeInsets](http://www.jianshu.com/p/62850b201049)，这篇博客末尾有github地址，我写的时候没有理解原理，所以设置的时候，参照了他的代码
3. [如何布局包含Image和Title的UIButton](http://victorchee.github.io/blog/button-layout-with-image-and-title/)，这篇是我最开始参考的，只有代码，没有原理
