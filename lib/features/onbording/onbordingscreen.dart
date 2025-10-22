import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trading_journey/app/route_names.dart';
import 'package:trading_journey/features/auth/login/loginsscreen.dart';
import '../../app/app_routes.dart';
import 'controller.dart';

class OnboardingScreen extends StatelessWidget {
  OnboardingScreen({super.key});

  final onboardingController = Get.find<OnbordingController>();

  // 🔹 Contenu des pages d’onboarding
  final List<Map<String, String>> onboardingPages = [
    {
      'image': 'assets/images/OBJECTS.png',
      'title': 'Suivi en temps réel',
      'gras': 'Bienvenu(e) sur Trading Journey ! ',
      'description':
      'Suivez vos performances de trading en toute simplicité. Obtenez des bilans automatiques, des statistiques détaillées et un suivi de votre capital en temps réel, où que vous soyez.'
    },
    {
      'image': 'assets/images/Illustration (1).png',
      'title': 'Analyse simplifiée',
      'gras': 'Optimisez vos décisions de trading !',
      'description':
      'Grâce à Trading Journey, accédez à des graphiques représentatifs et des données organisées pour visualiser vos gains, pertes et évolutions. Facilitez vos analyses sans complexité technique'
    },
    {
      'image': 'assets/images/Illustration.png',
      'title': 'Objectifs et alertes',
      'gras': 'Restez informé(e) et motivé(e).',
      'description':
      'Fixez-vous des objectifs, recevez des alertes personnalisées, et suivez vos progrès au quotidien. Avec Trading Journey, vous êtes accompagné pour atteindre vos ambitions financière'
    },
  ];

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final theme = Theme.of(context);

    return Scaffold(
      body: SafeArea(
        child: Obx(
              () => Column(
            children: [
              SizedBox(height: onboardingController.currentIndex.value == 2 ? 10 : 10),
              _builHeader(64, width),

              // 🔹 PageView (images + textes)
              Expanded(
                flex: 7,
                child: PageView.builder(
                  controller: onboardingController.pageController,
                  physics: const NeverScrollableScrollPhysics(),
                  onPageChanged: (index) =>
                  onboardingController.currentIndex.value = index,
                  itemCount: onboardingPages.length,
                  itemBuilder: (context, index) {
                    final page = onboardingPages[index];
                    return _buildContent(
                      context,
                      image: page['image']!,
                      title: page['title']!,
                      description: page['description']!,
                      gras: page['gras']!,
                      height: height,
                      width: width,
                      theme: theme,
                    );
                  },
                ),
              ),

              // 🔹 Indicateurs de progression (dots)
              _buildDots(width),

              const SizedBox(height: 10),

              // 🔹 Boutons de navigation
              _buildNavigationButtons(height, width),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  // ✅ Section principale d’une page
  Widget _buildContent(
      BuildContext context, {
        required String image,
        required String title,
        required String description,
        required String gras,
        required double height,
        required double width,
        required ThemeData theme,
      }) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Image
        SizedBox(
          height: height * 0.4,
          child: Image.asset(image, fit: BoxFit.contain),
        ),
        const SizedBox(height: 20),

        // Titre
        Text(
          title,
          textAlign: TextAlign.center,
          style: theme.textTheme.headlineLarge,
        ),
        const SizedBox(height: 15),

        // Description
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.08),
          child: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              children: [
                TextSpan(text: gras, style: theme.textTheme.headlineMedium),
                TextSpan(text: description, style: theme.textTheme.headlineSmall),
              ]
            ),
          ),
        ),
      ],
    );
  }

  // Indicateurs (les petits points)
  Widget _buildDots(double width) {
    return SizedBox(
      height: 30,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(3, (index) {
          bool isActive =
              index == onboardingController.currentIndex.value;
          return AnimatedContainer(
            duration: const Duration(milliseconds: 250),
            margin: const EdgeInsets.symmetric(horizontal: 4),
            height: 8,
            width: isActive ? 32 : 8,
            decoration: BoxDecoration(
              color: isActive ? Color(0xFFEB5E28) : Color(0xFFD9D9D9),
              borderRadius: BorderRadius.circular(15),
            ),
          );
        }),
      ),
    );
  }

  // Boutons “Suivant” / “Retour” / “Commencer”
  Widget _buildNavigationButtons(double height, double width) {
    final index = onboardingController.currentIndex.value;
    final isLastPage = index == 2;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Bouton précédent
          if (index > 0)
            TextButton(onPressed: (){
              onboardingController.previousPage();
            }, child: Text('Précédent', style: TextStyle(
                decoration: TextDecoration.underline,
                fontFamily: "poppins",
                color: Colors.grey
            ),))
          else
            const Spacer(),

          const SizedBox(width: 12),

          // Bouton suivant ou commencer
          index == 2 ? GestureDetector(
            onTap: (){
              Get.toNamed(AppPAges.pages[1].name);
            },
            child: Container(
              alignment: Alignment.center,
              width: 98,
              height: 48,
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Color(0xFFEB5E28),
                borderRadius: BorderRadius.circular(6)
              ),
              child: Text("Terminer", style: TextStyle(
                  fontFamily: "poppins",
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 0.2
              ),),
            ),
          ): TextButton(onPressed: (){
            onboardingController.nextPage(onboardingPages);
          }, child: Text('Suivant', style: TextStyle(
              decoration: TextDecoration.underline,
              fontFamily: "poppins",
              fontSize: 15,
              color: Color(0xFFEB5E28)
          ),)),
        ],
      ),
    );
  }

  Widget _builHeader(double height, double width){
    return Container(
      margin: EdgeInsets.all(16),
      height: 58,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(),
          if(onboardingController.currentIndex.value < 2) ...[
            GestureDetector(
              onTap: (){
                Get.offNamed(AppPAges.pages[1].name);
              },
              child: Container(
                alignment: Alignment.center,
                width: 98,
                height: 48,
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                    color: Color(0xFFEB5E28),
                    borderRadius: BorderRadius.circular(6)
                ),
                child: Text("Passer", style: TextStyle(
                    color: Colors.white,
                    fontFamily: "poppins",
                    fontWeight: FontWeight.w500,
                    letterSpacing: 0.2
                ),),
              ),
            )
          ]
        ],
      ),
    );
  }
}
