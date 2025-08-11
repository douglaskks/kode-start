import 'package:app_rick_and_morty/app/controller/home_controller.dart';
import 'package:app_rick_and_morty/app/ui/theme/app_colors.dart';
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
    final HomeController homeController = Get.find<HomeController>();
    
    return Obx(() => AppBar(
      toolbarHeight: appBarHeight,
      title: homeController.isSearchMode.value 
        ? _buildSearchField(homeController) 
        : _buildLogoAndTitle(),
      centerTitle: !homeController.isSearchMode.value,
      backgroundColor: backgroundColor ?? AppColors.primaryBackground,
      elevation: elevation,
      leading: leading ?? (showMenuIcon ? 
        Padding(
          padding: const EdgeInsets.only(bottom:80.0),
          child: IconButton(
            icon: const Icon(
              Icons.menu,
              color: AppColors.textWhite,
              size: 28,
            ),
            onPressed: () {

            },
          ),
        ) : null),
      actions: [
        Padding(
          padding: const EdgeInsets.only(bottom:80.0),
          child: IconButton(
            icon: Icon(
              homeController.isSearchMode.value ? Icons.close : Icons.search,
              color: AppColors.textWhite,
              size: 28,
            ),
            onPressed: () {
              if (homeController.isSearchMode.value) {
                homeController.exitSearchMode();
              } else {
                homeController.enterSearchMode();
              }
            },
          ),
        ),
        if (!homeController.isSearchMode.value && showProfileIcon)
          Padding(
            padding: const EdgeInsets.only(bottom:80.0),
            child: IconButton(
              icon: Container(
                padding: const EdgeInsets.all(2),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: AppColors.textWhite70, width: 1),
                ),
                child: const Icon(
                  Icons.person,
                  color: AppColors.textWhite,
                  size: 24,
                ),
              ),
              onPressed: () {
                
              },
            ),
          ),
      ],
    ));
  }

  Widget _buildSearchField(HomeController controller) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30, left: 16, right: 16),
      child: Container(
        height: 45,
        decoration: BoxDecoration(
          color: AppColors.searchFieldBg,
          borderRadius: BorderRadius.circular(25),
          border: Border.all(color: AppColors.borderWhite30),
        ),
        child: TextField(
          autofocus: true,
          style: const TextStyle(color: AppColors.textWhite, fontSize: 16),
          decoration: InputDecoration(
            hintText: 'Buscar personagens...',
            hintStyle: const TextStyle(color: AppColors.textWhite70),
            prefixIcon: Padding(
              padding: const EdgeInsets.only(left: 15, right: 10),
              child: Obx(() => controller.isSearching.value
                ? const SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      valueColor: AlwaysStoppedAnimation<Color>(AppColors.textWhite),
                    ),
                  )
                : const Icon(Icons.search, color: AppColors.textWhite70)),
            ),
            suffixIcon: Obx(() => controller.searchQuery.value.isNotEmpty
              ? IconButton(
                  icon: const Icon(Icons.clear, color: AppColors.textWhite70),
                  onPressed: () => controller.updateSearchQuery(''),
                )
              : const SizedBox()),
            border: InputBorder.none,
            contentPadding: const EdgeInsets.symmetric(vertical: 12),
          ),
          onChanged: controller.updateSearchQuery,
        ),
      ),
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
                return Container(
                  height: logoHeight,
                  width: logoHeight,
                  child: const Icon(
                    Icons.error,
                    color: AppColors.textWhite,
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
            color: titleColor ?? AppColors.textWhite,
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
      backgroundColor: AppColors.primaryBackground,
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

