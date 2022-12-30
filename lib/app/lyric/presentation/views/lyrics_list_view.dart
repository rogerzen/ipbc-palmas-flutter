import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ipbc_palmas/app/shared/components/back-button/back_button_widget.dart';
import 'package:ipbc_palmas/app/shared/components/circle-avatar/circle_avatar_widget.dart';
import 'package:ipbc_palmas/app/shared/components/next-button/next_button_widget.dart';
import '../../../shared/components/search-bar/search_bar_widget.dart';
import '../../../shared/components/top-bar/top_bar_widget.dart';
import '../../../shared/configs/app_configs.dart';
import '../blocs/lyric_bloc.dart';
import '../../domain/entities/lyric_entity.dart';
import '../../../shared/components/side-bar/side_bar_widget.dart';

import '../../../shared/configs/app_routes.dart';

class LyricsListView extends StatefulWidget {
  const LyricsListView({super.key});

  @override
  State<LyricsListView> createState() => _LyricsListViewState();
}

class _LyricsListViewState extends State<LyricsListView>
    with TickerProviderStateMixin {
  late List<LyricEntity> lyricsFetched;
  late List<LyricEntity> lyricsFiltered;
  late List<String> drawerNames;
  late LyricBloc bloc;
  bool isSelected = false;
  String selectedValue = '';

  fillLettersCarousel() {
    drawerNames = [
      'Sobre IPB Palmas',
      'Músicas/Letras',
      'Agenda',
      'Playlist de sermões',
      'Pastoral',
      'Dízimos e Ofertas',
      'Sociedades internas'
    ];
  }

  @override
  void initState() {
    lyricsFetched = [];
    lyricsFiltered = [];
    fillLettersCarousel();
    bloc = context.read<LyricBloc>();
    bloc.add(GetLyricsEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawerScrimColor: Colors.black26,
      endDrawer: SideBarWidget(
        drawerNames: drawerNames,
      ),
      drawerEnableOpenDragGesture: true,
      backgroundColor: AppColors.white,
      body: BlocBuilder<LyricBloc, LyricState>(
        bloc: bloc,
        builder: (context, state) {
          if (state is InitialState) {
            return const Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(
                  AppColors.darkGreen,
                ),
              ),
            );
          } else if (state is SuccessfullyFetchedLyricsState ||
              state is SuccessfullyFilteredLyricsState) {
            if (state is SuccessfullyFetchedLyricsState &&
                selectedValue == '') {
              lyricsFetched = state.entities;
              lyricsFiltered = state.entities;
            } else {
              if (state is SuccessfullyFilteredLyricsState &&
                  selectedValue != '') {
                lyricsFiltered = state.entities;
              } else {
                lyricsFiltered = lyricsFetched;
              }
            }
            //TODO: autor, ano de produçao, todos os diretos reservados
            //TODO: ADICIONAR MENSAGEM DE NENHUM RESULTADO ENCONTRADO
            return SafeArea(
              child: SingleChildScrollView(
                child: RefreshIndicator(
                  color: AppColors.darkGreen,
                  onRefresh: () async {
                    bloc.add(
                      GetLyricsEvent(),
                    );
                  },
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 17),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(left: 11.0),
                              child: BackButtonWidget(),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 7.0),
                              child: Text(
                                "Músicas/Letras",
                                style: AppFonts.titleLyricView,
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(left: 4.0),
                              child: CircleAvatarWidget(),
                            ),
                          ],
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(
                          left: 19,
                          top: 30,
                        ),
                        child: SearchBarWidget(),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          right: 136,
                          top: 33.0,
                        ),
                        child: Text(
                          "Adicionados recentemente",
                          style: AppFonts.headline,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 15.0,
                        ),
                        child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemCount: lyricsFiltered.length,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return ListTile(
                              contentPadding: const EdgeInsets.only(
                                top: 4,
                                bottom: 4,
                                left: 25,
                                right: 17,
                              ),
                              dense: true,
                              minVerticalPadding: 0,
                              minLeadingWidth: 0,
                              horizontalTitleGap: 8,
                              leading: ClipRRect(
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(12),
                                ),
                                child: SizedBox(
                                  width: 50,
                                  height: 50,
                                  child: Image.asset(
                                    AppImages.userAvatar,
                                  ),
                                ),
                              ),
                              title: Padding(
                                padding: const EdgeInsets.only(
                                  bottom: 6.5,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      lyricsFiltered[index].title,
                                      style: AppFonts.titleTile,
                                    ),
                                  ],
                                ),
                              ),
                              subtitle: Text(
                                lyricsFiltered[index].group,
                                style: AppFonts.subtitleTile,
                              ),
                              trailing: Container(
                                /*  decoration: BoxDecoration(
                                  border: Border.all(
                                    width: 1,
                                    color: Colors.orange,
                                  ),
                                ),*/
                                child: NextButtonWidget(
                                    route:AppRoutes.lyricRoute,
                                    arguments: lyricsFiltered[index])
                              ),
                              onTap: () {
                                Navigator.pushNamed(
                                  context,
                                  AppRoutes.lyricRoute,
                                  arguments: lyricsFiltered[index],
                                );
                              },
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          } else {
            return const Text('aconteceu um erro [Lyrics_List_view]');
          }
        },
      ),
      floatingActionButton: SizedBox(
        height: 58,
        width: 58,
        child: FloatingActionButton(
          elevation: 1.8,
          highlightElevation: 1.8,
          focusElevation: 1.8,
          hoverElevation: 1.8,
          onPressed: () {},
          backgroundColor: AppColors.darkBlue,
          child: const Icon(
            size: 45,
            Icons.add_rounded,
            color: AppColors.white,
          ),
          // icon: Icon(Icons.map, size: 15, color: Colors.white)
        ),
      ),
    );
  }
}
