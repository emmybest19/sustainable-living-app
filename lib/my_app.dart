
import 'package:flutter/material.dart';

import 'package:sustainable_app/auth_screens/splash_screen.dart';
import 'package:sustainable_app/screens/page_01_ingredient_impact.dart';
import 'package:sustainable_app/screens/page_02_recommended_products.dart';
import 'package:sustainable_app/screens/page_03_sort_options_modal.dart';
import 'package:sustainable_app/screens/page_04_recipes_list.dart';
import 'package:sustainable_app/screens/page_05_product_search.dart';
import 'package:sustainable_app/screens/page_06_product_filters.dart';
import 'package:sustainable_app/screens/page_07_recipe_detail.dart';
import 'package:sustainable_app/screens/page_08_weekly_meal_plan.dart';
import 'package:sustainable_app/screens/page_09_personalized_suggestions.dart';
import 'package:sustainable_app/screens/page_10_tip_detail_led_lighting.dart';
import 'package:sustainable_app/screens/page_11_energy_saving_tips_list.dart';
import 'package:sustainable_app/screens/page_12_sustainable_travel_tips_list.dart';
import 'package:sustainable_app/screens/page_13_eco_trip_planner.dart';
import 'package:sustainable_app/screens/page_14_sustainable_travel_options.dart';
import 'package:sustainable_app/screens/page_15_recommended_travel.dart';
import 'package:sustainable_app/screens/page_16_recommended_products_feed.dart';
import 'package:sustainable_app/screens/page_17_sustainable_recipes_list.dart';
import 'package:sustainable_app/screens/page_18_recipe_filter.dart';
import 'package:sustainable_app/screens/page_19_product_search_initial.dart';
import 'package:sustainable_app/screens/page_20_product_filter.dart';
import 'package:sustainable_app/screens/page_21_product_sort.dart';
import 'package:sustainable_app/screens/page_22_explore_dashboard.dart';
import 'package:sustainable_app/screens/page_23_product_detail_bamboo_toothbrush.dart';
import 'package:sustainable_app/screens/page_24_product_list_by_category.dart';
import 'package:sustainable_app/screens/page_25_product_categories.dart';
import 'package:sustainable_app/screens/page_26_recommended_products_carousel.dart';
import 'package:sustainable_app/screens/page_27_low_impact_swaps_detail.dart';
import 'package:sustainable_app/screens/page_28_log_waste_entry.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),


      initialRoute: '/page0',

      routes: {
        // keep your full mapping here (constructor names must match)
        '/page0': (context) => const SplashScreen(),
        '/page1': (context) => const Page01IngredientImpact(),
        '/page2': (context) => const Page02RecommendedProducts(),
        '/page3': (context) => const Page03SortOptionsModal(),
        '/page4': (context) => const Page04RecipesList(),
        '/page5': (context) => const Page05ProductSearch(),
        '/page6': (context) => const Page06ProductFilters(),
        '/page7': (context) => const Page07RecipeDetail(),
        '/page8': (context) => const Page08WeeklyMealPlan(),
        '/page9': (context) => const Page09PersonalizedSuggestions(),
        '/page10': (context) => const Page10TipDetailLEDLighting(),
        '/page11': (context) => const Page11EnergySavingTipsList(),
        '/page12': (context) => const Page12SustainableTravelTipsList(),
        '/page13': (context) => const Page13EcoTripPlanner(),
        '/page14': (context) => const Page14SustainableTravelOptions(),
        '/page15': (context) => const Page15RecommendedTravel(),
        '/page16': (context) => const Page16RecommendedProductsFeed(),
        '/page17': (context) => const Page17SustainableRecipesList(),
        '/page18': (context) => const Page18RecipeFilter(),
        '/page19': (context) => const Page19ProductSearchInitial(),
        '/page20': (context) => const Page20ProductFilter(),
        '/page21': (context) => const Page21ProductSort(),
        // This is the route you want as initial. You can point it to MainNavigation
        // if MainNavigation should be the host of BottomNavigationBar.
        '/page22': (context) => const Page22ExploreDashboard(),
        '/page23': (context) => const Page23ProductDetailBambooToothbrush(),
        '/page24': (context) => const Page24ProductListByCategory(),
        '/page25': (context) => const Page25ProductCategories(),
        '/page26': (context) => const Page26RecommendedProductsCarousel(),
        '/page27': (context) => const Page27LowImpactSwapsDetail(),
        '/page28': (context) => const Page28LogWasteEntry(),
      },
    );
  }
}