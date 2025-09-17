// 导入Flutter Material组件库（包含所有用到的Widget：Container、Row、Image等）
import 'package:flutter/material.dart';

void main() {
  // 1. 有效公开图片URL（选用Flutter官方图标，确保稳定访问）
  final String imageUrl = "https://p1.qhimg.com/dr/512__/t11ebd0e733047f77c9bb6b5594.jpg";
  // 2. 文本方向（从左到右，避免文本渲染警告）
  final TextDirection direct = TextDirection.ltr;
  // 3. 文本样式（黑色字体，可补充字体大小增强显示效果）
  final TextStyle style = TextStyle(
    color: Colors.black,
    fontSize: 18, // 增加字体大小，让文字更清晰
    fontWeight: FontWeight.w500,
  );

  // 4. 启动应用：用MaterialApp包裹根Widget（确保基础主题、导航等功能正常）
  runApp(MaterialApp(
    // 关闭调试横幅（可选，提升显示效果）
    debugShowCheckedModeBanner: false,
    // 根页面内容（原案例的Container结构）
    home: Container(
      // 容器背景色（白色，与原案例一致）
      color: Colors.white,
      // 子Widget：Row（横向排列Image和Text）
      child: Row(
        textDirection: direct, // 必传，否则文本会报错
        // 垂直居中对齐（可选，让子组件在Row中垂直居中，提升美观度）
        crossAxisAlignment: CrossAxisAlignment.center,
        // 水平居中（可选，让Row整体在屏幕水平居中，原案例未提但体验更好）
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // 5. 网络图片：修复excludeFromSemantics拼写（原代码少了s）
          Image.network(
            imageUrl,
            width: 1000, // 原案例指定的宽度
            height: 1000, // 补充高度，避免图片拉伸变形
            excludeFromSemantics: true, // 修复拼写错误
            // 图片加载中/失败的占位（可选，提升用户体验）
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) return child;
              return const CircularProgressIndicator(
                color: Colors.blue,
                strokeWidth: 2,
              );
            },
            errorBuilder: (context, error, stackTrace) {
              return const Icon(Icons.error, color: Colors.red, size: 100);
            },
          ),
          // 6. 文本：与图片之间增加间距（可选，避免拥挤）
          const SizedBox(width: 20),
          Text(
            "测试",
            textDirection: direct,
            style: style,
          ),
        ],
      ),
    ),
  ));
}