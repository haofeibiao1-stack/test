// 导入Flutter Material组件库（包含所有用到的Widget：Container、Row、Image等）
import 'dart:ffi';

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
    home: Center(
      child: Container(
        width: 300,
        height: 400,
        color: Colors.blue,
        child: UnconstrainedBox(
          child: Image.network(
            imageUrl,
            fit: BoxFit.cover,
            width: 4000,
            height: 40,
          ),
        ),
      ),
    ),


  ));
}