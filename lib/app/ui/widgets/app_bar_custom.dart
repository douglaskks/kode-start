import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomAppBar extends GetView implements PreferredSizeWidget {
  final String title;
  final String? logoPath;
  final List<Widget>? actions;
  final Widget? leading;
  final bool centerTitle;
  final Color? backgroundColor;
  final Color? titleColor;
  final double elevation;
  final double? logoHeight;
  final double appBarHeight;
  final bool showMenuIcon;
  final bool showProfileIcon;

  const CustomAppBar({
    Key? key,
    required this.title,
    this.logoPath,
    this.actions,
    this.leading,
    this.centerTitle = true,
    this.backgroundColor,
    this.titleColor,
    this.elevation = 0,
    this.logoHeight = 90,
    this.appBarHeight = 140,
    this.showMenuIcon = true,
    this.showProfileIcon = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: appBarHeight,
      title: _buildLogoAndTitle(),
      centerTitle: centerTitle,
      backgroundColor: backgroundColor ?? Color(0xFF1C1B1F),
      elevation: elevation,
      leading: leading ?? (showMenuIcon ? 
        Padding(
          padding: const EdgeInsets.only(bottom:80.0),
          child: IconButton(
            icon: const Icon(
              Icons.menu,
              color: Colors.white,
              size: 28,
            ),
            onPressed: () {
              print('Menu clicado');
            },
          ),
        ) : null),
      actions: actions ?? (showProfileIcon ? [
        Padding(
          padding: const EdgeInsets.only(bottom:80.0),
          child: IconButton(
            icon: Container(
              padding: const EdgeInsets.all(2),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white70, width: 1),
              ),
              child: const Icon(
                Icons.person,
                color: Colors.white,
                size: 24,
              ),
            ),
            onPressed: () {

              print('Perfil clicado');

            },
          ),
        ),
      ] : null),
    );
  }

  Widget _buildLogoAndTitle() {
  return Padding(
    padding: const EdgeInsets.only(bottom: 30),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
    
        if (logoPath != null)
          Container(
            child: Image.asset(
              logoPath!,
              height: logoHeight,
              fit: BoxFit.contain,
              errorBuilder: (context, error, stackTrace) {
                print('Erro ao carregar imagem: $error');
                return Container(
                  height: logoHeight,
                  width: logoHeight,
                  child: Icon(
                    Icons.error,
                    color: Colors.white,
                    size: 30,
                  ),
                );
              },
            ),
          ),
        
        if (logoPath != null) 
        const SizedBox(height: 4),
        
        Text(
          title,
          style: TextStyle(
            fontFamily: 'Lato-Regular.ttf',
            letterSpacing: 2.0,
            color: titleColor ?? Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    ),
  );
}

  @override
  Size get preferredSize => Size.fromHeight(appBarHeight);
}

class CustomAppBarController extends GetxController {
  RxBool isSearchMode = false.obs;
  
  void toggleSearch() {
    isSearchMode.toggle();
  }
}

class ReactiveCustomAppBar extends GetView<CustomAppBarController> implements PreferredSizeWidget {
  final String title;
  
  const ReactiveCustomAppBar({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => AppBar(
      title: controller.isSearchMode.value 
        ? const TextField(
            decoration: InputDecoration(
              hintText: 'Buscar personagens...',
              border: InputBorder.none,
            ),
          )
        : Text(title),
      backgroundColor: Color(0xFF1C1B1F),
      actions: [
        IconButton(
          icon: Icon(controller.isSearchMode.value ? Icons.close : Icons.search),
          onPressed: controller.toggleSearch,
        ),
      ],
    ));
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}