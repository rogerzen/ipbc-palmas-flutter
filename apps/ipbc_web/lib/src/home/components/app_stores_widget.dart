import 'package:core_module/core_module.dart';
import 'package:flutter/material.dart';

class AppStoresWidget extends StatefulWidget {
  const AppStoresWidget({super.key});

  @override
  State<AppStoresWidget> createState() => _AppStoresWidgetState();
}

class _AppStoresWidgetState extends State<AppStoresWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.only(left: 120, top: 100),
          height: 734,
          decoration: const BoxDecoration(
            color: Color(0xff005b40),
          ),
          child: SizedBox(
            width: 1426.62,
            height: 699.81,
            child: Stack(
              children: [
                Positioned(
                  left: 352.341003418,
                  top: 15,
                  child: Align(
                    child: SizedBox(
                      width: 1074.28,
                      height: 684.81,
                      child: Image.asset(
                        'assets/page-1/images/telas-ipbc-app-1-2jh.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  child: SizedBox(
                    width: 571,
                    height: 253,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(bottom: 40),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: const EdgeInsets.only(bottom: 23),
                                child: Text(
                                  'Baixe o IPBC App',
                                  style: AppFonts.defaultFont(
                                    fontSize: 46,
                                    fontWeight: FontWeight.w600,
                                    color: const Color(0xffffffff),
                                  ),
                                ),
                              ),
                              Text(
                                'Acompanhe a liturgia dos cultos, as letras das músicas cantadas e eem breve, comunicações, eventos e mensagens pregadas.',
                                style: AppFonts.defaultFont(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400,
                                  color: const Color(0xffffffff),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 80,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                margin: const EdgeInsets.only(right: 24),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 32, vertical: 24),
                                decoration: BoxDecoration(
                                  color: const Color(0xff242426),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.only(right: 16),
                                      width: 32,
                                      height: 32,
                                      child: Image.asset(
                                        'assets/page-1/images/apple-icon-kto.png',
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(top: 1),
                                      child: Text(
                                        'Baixe na App Store',
                                        style: AppFonts.defaultFont(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500,
                                          color: const Color(0xffffffff),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 32, vertical: 24),
                                decoration: BoxDecoration(
                                  color: const Color(0xff242426),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.only(right: 16),
                                      width: 32,
                                      height: 32,
                                      child: Image.asset(
                                        'assets/page-1/images/playstore-icon-zqd.png',
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(top: 1),
                                      child: Text(
                                        'Baixe na PlayStore',
                                        style: AppFonts.defaultFont(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500,
                                          color: const Color(0xffffffff),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
