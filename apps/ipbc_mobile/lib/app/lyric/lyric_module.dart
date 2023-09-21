import 'package:core_module/core_module.dart';
import 'package:ipbc_palmas/app/service/service_module.dart';

import '../shared/view-models/services_view_model.dart';
import 'views/lyric_view.dart';
import 'views/lyrics_list_view.dart';
import 'blocs/lyric_bloc.dart';

class LyricModule extends Module {

  static const String initialRoute = "/";
  static const String insertLyricsRoute = "/insert-lyrics";
  static const String lyricsListRoute = "/lyrics-list";
  static const String lyricRoute = "/lyric";

  @override
  void exportedBinds(i) {
    i.addSingleton<LyricBloc>(() =>
        LyricBloc(
          fireUseCase: LyricsUseCases(
            repository: i.get<Repository<List<Map>>>(),
          ),
          hiveUseCase: LyricsUseCases(
            repository: Repository(
              datasource: HiveDatasource<HiveLyricDTO>(boxLabel: 'lyrics'),
            ),
          ),
          viewModel: i.get<ServicesViewModel>(),
          analyticsUtil: i.get<AnalyticsUtil>(),
        ),
      config: CoreModule.blocConfig(),
    );
  }

  @override
  List<Module> get imports => [CoreModule(), ServiceModule()];

  @override
  void routes(r) {
    r.child(lyricsListRoute, child: (_) => const LyricsListView());
    r.child(lyricRoute, child: (_) => LyricView(entity: r.args.data as LyricEntity));
  }
}