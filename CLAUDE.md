# MovieLand Mobile App - Android to Flutter Refactor

## Application Overview

This project involves refactoring a simple movie application from Android (Java) to Flutter for iOS and Android platforms only. The application fetches movie data from a third-party API with API key authentication and displays movies in different categories.

### Key Features

- Browse movies by categories: Popular, Top Rated, Upcoming
- View detailed movie information (title, poster, overview, rating, release date)
- Infinite scroll/pagination for movie lists
- Tab-based navigation between categories
- Clean, responsive mobile UI optimized for iOS and Android
- Native mobile performance and user experience

### API Details

- **API Provider**: The Movie Database (TMDb) or similar
- **Authentication**: API Key in headers or query parameters
- **Base URL**: `https://api.themoviedb.org/3/`
- **Key Endpoints**:
  - Popular Movies: `/movie/popular`
  - Top Rated: `/movie/top_rated`
  - Upcoming: `/movie/upcoming`
  - Movie Details: `/movie/{movie_id}`
- **Response Format**: JSON with pagination support

## Current Android Architecture (MVP)

### Project Location

The existing Android project is located at `../MovieLand-Android-App` relative to this Flutter project.

### Key Android Project Structure

The Android application follows the Model-View-Presenter (MVP) pattern with the following key folders:

#### **Java Source Code** (`src/main/java/com/movieapp/`)

- **`model/`** - Data models and business entities

  - Contains POJOs for Movie, MovieResponse, and API data structures
  - Handles data parsing and business logic entities

- **`view/`** - UI components and activities

  - Activities and fragments that handle user interface
  - Adapters for RecyclerViews and other UI components
  - User interaction handling and UI state management

- **`presenter/`** - Business logic and MVP presenters

  - Contains presenter classes that handle business logic
  - Acts as intermediary between Model and View layers
  - Manages API calls and data transformation for UI

- **`network/`** - API communication and networking
  - Retrofit service interfaces and API client setup
  - Network utilities and HTTP request handling
  - API response parsing and error handling

#### **Android Resources** (`src/main/res/`)

- **`layout/`** - XML layout files

  - Activity and fragment layouts
  - RecyclerView item layouts
  - Custom view layouts and UI components

- **`values/colors.xml`** - Color definitions

  - App color palette and theme colors
  - Primary, secondary, and accent colors
  - Status bar and UI element colors

- **`drawable/`** - Graphics and drawable resources
  - Vector drawables and image assets
  - Background shapes and gradients
  - Icons and visual elements

```
../MovieLand-Android-App/
├── app/src/main/java/com/movieapp/
│   ├── model/          # Data models and entities
│   ├── view/           # UI components and activities
│   ├── presenter/      # MVP presenters and business logic
│   └── network/        # API services and networking
└── app/src/main/res/
    ├── layout/         # XML UI layouts
    ├── values/colors.xml  # Color definitions
    └── drawable/       # Graphics and icons
```

### Technology Stack

- **Architecture**: Model View Presenter (MVP)
- **Networking**: Retrofit 2 with Gson converter
- **UI**: XML layouts with RecyclerView
- **Image Loading**: Picasso

### Key Components

- **ApiService**: Retrofit interface defining API endpoints
- **MovieAdapter**: RecyclerView adapter with ViewHolder pattern
- **Presenters**: Business logic handling API calls and data transformation
- **Activities/Fragments**: UI controllers managing user interactions

## Target Flutter Architecture

### Clean Architecture Structure (Layer-First Approach)

```
lib/
├── core/
│   ├── constants/
│   │   ├── api_constants.dart
│   │   └── app_constants.dart
│   ├── error/
│   │   ├── exceptions.dart
│   │   └── failures.dart
│   ├── network/
│   │   ├── dio_client.dart
│   │   └── api_interceptor.dart
│   ├── theme/
│   │   ├── app_theme.dart
│   │   └── app_colors.dart
│   └── utils/
│       └── extensions.dart
├── data/
│   ├── api/
│   │   ├── api_service.dart          # Retrofit API service
│   │   └── api_service.g.dart        # Generated Retrofit implementation
│   ├── models/
│   │   ├── movie_model.dart          # JsonSerializable models
│   │   ├── movie_model.g.dart        # Generated serialization code
│   │   └── movie_response_model.dart # JsonSerializable response models
│   └── repositories/
│       └── movie_api_repository.dart
├── domain/
│   ├── entities/
│   │   └── movie.dart
│   ├── repositories/
│   │   └── movie_repository.dart
│   └── use_cases/
│       ├── get_popular_movies_use_case.dart
│       ├── get_top_rated_movies_use_case.dart
│       ├── get_upcoming_movies_use_case.dart
│       └── get_movie_details_use_case.dart
├── presentation/
│   ├── bloc/
│   │   ├── home/
│   │   │   ├── home_bloc.dart
│   │   │   ├── home_event.dart
│   │   │   └── home_state.dart
│   │   ├── popular_movies/
│   │   │   ├── popular_movies_bloc.dart
│   │   │   ├── popular_movies_event.dart
│   │   │   └── popular_movies_state.dart
│   │   ├── top_rated_movies/
│   │   │   ├── top_rated_movies_bloc.dart
│   │   │   ├── top_rated_movies_event.dart
│   │   │   └── top_rated_movies_state.dart
│   │   ├── upcoming_movies/
│   │   │   ├── upcoming_movies_bloc.dart
│   │   │   ├── upcoming_movies_event.dart
│   │   │   └── upcoming_movies_state.dart
│   │   ├── movie_detail/
│   │   │   ├── movie_detail_bloc.dart
│   │   │   ├── movie_detail_event.dart
│   │   │   └── movie_detail_state.dart
│   │   └── search/
│   │       ├── search_bloc.dart
│   │       ├── search_event.dart
│   │       └── search_state.dart
│   ├── pages/
│   │   ├── home_page.dart
│   │   ├── movie_detail_page.dart
│   │   └── movie_list_page.dart
│   └── widgets/
│       ├── movie_card.dart
│       ├── movie_list_view.dart
│       ├── loading_indicator.dart
│       └── error_widget.dart
└── main.dart
```

### Layer-First Architecture Benefits

The layer-first approach organizes code by architectural concerns rather than features:

#### **Advantages:**
- **Clear Separation of Concerns**: Each layer has a distinct responsibility (data, business logic, UI)
- **Easier Navigation**: Developers can quickly find code by layer rather than hunting through feature folders
- **Better Dependency Management**: Import paths are cleaner and layer dependencies are more obvious
- **Scalable Structure**: As the app grows, new features fit naturally into existing layers
- **Team Collaboration**: Different team members can work on different layers with minimal conflicts

#### **Layer Responsibilities:**
- **`core/`**: Shared utilities, constants, themes, and cross-cutting concerns
- **`data/`**: API services, data models, and repository implementations
- **`domain/`**: Business entities, repository contracts, and use cases
- **`presentation/`**: UI components, BLoCs, pages, and widgets

#### **Import Examples:**
```dart
// Clean imports with layer-first approach
import '../../../data/models/movie_model.dart';
import '../../../domain/entities/movie.dart';
import '../../../domain/use_cases/get_popular_movies_use_case.dart';

// vs feature-first (more nested and complex)
import '../../../features/movies/data/models/movie_model.dart';
import '../../../features/movies/domain/entities/movie.dart';
```

## Implementation Guidelines

### 1. BLoC-per-Page Pattern Implementation

#### Popular Movies BLoC with Infinite Scroll

```dart
// Popular Movies Events
abstract class PopularMoviesEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class LoadPopularMovies extends PopularMoviesEvent {}

class LoadMorePopularMovies extends PopularMoviesEvent {}

class RefreshPopularMovies extends PopularMoviesEvent {}

// Popular Movies States
abstract class PopularMoviesState extends Equatable {
  @override
  List<Object> get props => [];
}

class PopularMoviesInitial extends PopularMoviesState {}

class PopularMoviesLoading extends PopularMoviesState {}

class PopularMoviesLoaded extends PopularMoviesState {
  final List<Movie> movies;
  final bool hasReachedMax;
  final int currentPage;

  const PopularMoviesLoaded({
    required this.movies,
    this.hasReachedMax = false,
    this.currentPage = 1,
  });

  @override
  List<Object> get props => [movies, hasReachedMax, currentPage];

  PopularMoviesLoaded copyWith({
    List<Movie>? movies,
    bool? hasReachedMax,
    int? currentPage,
  }) {
    return PopularMoviesLoaded(
      movies: movies ?? this.movies,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      currentPage: currentPage ?? this.currentPage,
    );
  }
}

class PopularMoviesError extends PopularMoviesState {
  final String message;

  const PopularMoviesError(this.message);

  @override
  List<Object> get props => [message];
}

// Popular Movies BLoC Implementation
class PopularMoviesBloc extends Bloc<PopularMoviesEvent, PopularMoviesState> {
  final GetPopularMoviesUseCase getPopularMoviesUseCase;

  PopularMoviesBloc({
    required this.getPopularMoviesUseCase,
  }) : super(PopularMoviesInitial()) {
    on<LoadPopularMovies>(_onLoadPopularMovies);
    on<LoadMorePopularMovies>(_onLoadMorePopularMovies);
    on<RefreshPopularMovies>(_onRefreshPopularMovies);
  }

  Future<void> _onLoadPopularMovies(
    LoadPopularMovies event,
    Emitter<PopularMoviesState> emit,
  ) async {
    emit(PopularMoviesLoading());

    try {
      final movieResponse = await getPopularMoviesUseCase.call(page: 1);
      emit(PopularMoviesLoaded(
        movies: movieResponse.movies,
        hasReachedMax: movieResponse.page >= movieResponse.totalPages,
        currentPage: 1,
      ));
    } catch (e) {
      emit(PopularMoviesError(e.toString()));
    }
  }

  Future<void> _onLoadMorePopularMovies(
    LoadMorePopularMovies event,
    Emitter<PopularMoviesState> emit,
  ) async {
    if (state is PopularMoviesLoaded) {
      final currentState = state as PopularMoviesLoaded;

      if (!currentState.hasReachedMax) {
        try {
          final nextPage = currentState.currentPage + 1;
          final movieResponse = await getPopularMoviesUseCase.call(page: nextPage);

          emit(currentState.copyWith(
            movies: [...currentState.movies, ...movieResponse.movies],
            hasReachedMax: nextPage >= movieResponse.totalPages,
            currentPage: nextPage,
          ));
        } catch (e) {
          emit(PopularMoviesError(e.toString()));
        }
      }
    }
  }

  Future<void> _onRefreshPopularMovies(
    RefreshPopularMovies event,
    Emitter<PopularMoviesState> emit,
  ) async {
    emit(PopularMoviesLoading());
    add(LoadPopularMovies());
  }
}
```

#### Top Rated Movies BLoC

```dart
// Similar structure as PopularMoviesBloc but for top rated movies
class TopRatedMoviesBloc extends Bloc<TopRatedMoviesEvent, TopRatedMoviesState> {
  final GetTopRatedMoviesUseCase getTopRatedMoviesUseCase;

  TopRatedMoviesBloc({
    required this.getTopRatedMoviesUseCase,
  }) : super(TopRatedMoviesInitial()) {
    on<LoadTopRatedMovies>(_onLoadTopRatedMovies);
    on<LoadMoreTopRatedMovies>(_onLoadMoreTopRatedMovies);
    on<RefreshTopRatedMovies>(_onRefreshTopRatedMovies);
  }

  // Implementation similar to PopularMoviesBloc
  // but uses GetTopRatedMoviesUseCase
}
```

#### Upcoming Movies BLoC

```dart
// Similar structure as PopularMoviesBloc but for upcoming movies
class UpcomingMoviesBloc extends Bloc<UpcomingMoviesEvent, UpcomingMoviesState> {
  final GetUpcomingMoviesUseCase getUpcomingMoviesUseCase;

  UpcomingMoviesBloc({
    required this.getUpcomingMoviesUseCase,
  }) : super(UpcomingMoviesInitial()) {
    on<LoadUpcomingMovies>(_onLoadUpcomingMovies);
    on<LoadMoreUpcomingMovies>(_onLoadMoreUpcomingMovies);
    on<RefreshUpcomingMovies>(_onRefreshUpcomingMovies);
  }

  // Implementation similar to PopularMoviesBloc
  // but uses GetUpcomingMoviesUseCase
}
```

### 2. JsonSerializer Models with Clean Architecture

#### Data Models with JsonSerializer

```dart
import 'package:json_serializable/json_serializable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'movie_model.g.dart';

@JsonSerializable()
class MovieModel {
  final int id;
  final String title;
  @JsonKey(name: 'poster_path')
  final String? posterPath;
  @JsonKey(name: 'backdrop_path')
  final String? backdropPath;
  final String overview;
  @JsonKey(name: 'release_date')
  final String releaseDate;
  @JsonKey(name: 'vote_average')
  final double voteAverage;
  @JsonKey(name: 'vote_count')
  final int voteCount;

  const MovieModel({
    required this.id,
    required this.title,
    this.posterPath,
    this.backdropPath,
    required this.overview,
    required this.releaseDate,
    required this.voteAverage,
    required this.voteCount,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) => _$MovieModelFromJson(json);
  Map<String, dynamic> toJson() => _$MovieModelToJson(this);

  // Convert to domain entity (Clean Architecture)
  Movie toEntity() {
    return Movie(
      id: id,
      title: title,
      posterPath: posterPath,
      backdropPath: backdropPath,
      overview: overview,
      releaseDate: DateTime.tryParse(releaseDate) ?? DateTime.now(),
      voteAverage: voteAverage,
      voteCount: voteCount,
    );
  }
}

@JsonSerializable()
class MovieResponseModel {
  final int page;
  @JsonKey(name: 'total_pages')
  final int totalPages;
  @JsonKey(name: 'total_results')
  final int totalResults;
  final List<MovieModel> results;

  const MovieResponseModel({
    required this.page,
    required this.totalPages,
    required this.totalResults,
    required this.results,
  });

  factory MovieResponseModel.fromJson(Map<String, dynamic> json) =>
      _$MovieResponseModelFromJson(json);
  Map<String, dynamic> toJson() => _$MovieResponseModelToJson(this);
}
```

### 3. Dio Configuration with Clean Architecture Data Source

```dart
class DioClient {
  late final Dio _dio;

  DioClient() {
    _dio = Dio(BaseOptions(
      baseUrl: ApiConstants.baseUrl,
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
      headers: {
        'Content-Type': 'application/json',
      },
    ));

    _dio.interceptors.add(ApiInterceptor());
    _dio.interceptors.add(LogInterceptor(
      requestBody: true,
      responseBody: true,
    ));
  }

  Dio get dio => _dio;
}

class ApiInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.queryParameters['api_key'] = ApiConstants.apiKey;
    super.onRequest(options, handler);
  }
}

// API Service with Retrofit and Dio
@RestApi(baseUrl: 'https://api.themoviedb.org/3')
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @GET('/movie/popular')
  Future<MovieResponseModel> getPopularMovies(
    @Query('page') int page,
  );

  @GET('/movie/top_rated')
  Future<MovieResponseModel> getTopRatedMovies(
    @Query('page') int page,
  );

  @GET('/movie/upcoming')
  Future<MovieResponseModel> getUpcomingMovies(
    @Query('page') int page,
  );

  @GET('/movie/{movie_id}')
  Future<MovieModel> getMovieDetails(
    @Path('movie_id') int movieId,
  );
}
```

### 4. ListView Implementation with Page-Specific BLoCs

#### Popular Movies List View

```dart
class PopularMoviesListView extends StatefulWidget {
  const PopularMoviesListView({Key? key}) : super(key: key);

  @override
  State<PopularMoviesListView> createState() => _PopularMoviesListViewState();
}

class _PopularMoviesListViewState extends State<PopularMoviesListView> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
    // Load initial data
    context.read<PopularMoviesBloc>().add(LoadPopularMovies());
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_isBottomReached) {
      context.read<PopularMoviesBloc>().add(LoadMorePopularMovies());
    }
  }

  bool get _isBottomReached {
    return _scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 200;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PopularMoviesBloc, PopularMoviesState>(
      builder: (context, state) {
        if (state is PopularMoviesLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state is PopularMoviesError) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Error: ${state.message}'),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () => context.read<PopularMoviesBloc>().add(LoadPopularMovies()),
                  child: const Text('Retry'),
                ),
              ],
            ),
          );
        }

        if (state is PopularMoviesLoaded) {
          return RefreshIndicator(
            onRefresh: () async {
              context.read<PopularMoviesBloc>().add(RefreshPopularMovies());
            },
            child: ListView.builder(
              controller: _scrollController,
              physics: const AlwaysScrollableScrollPhysics(),
              itemCount: state.hasReachedMax
                  ? state.movies.length
                  : state.movies.length + 1,
              itemBuilder: (context, index) {
                if (index >= state.movies.length) {
                  return const Center(
                    child: Padding(
                      padding: EdgeInsets.all(16.0),
                      child: CircularProgressIndicator(),
                    ),
                  );
                }
                return MovieCard(movie: state.movies[index]);
              },
            ),
          );
        }

        return const SizedBox.shrink();
      },
    );
  }
}
```

#### Top Rated Movies List View

```dart
class TopRatedMoviesListView extends StatefulWidget {
  const TopRatedMoviesListView({Key? key}) : super(key: key);

  @override
  State<TopRatedMoviesListView> createState() => _TopRatedMoviesListViewState();
}

class _TopRatedMoviesListViewState extends State<TopRatedMoviesListView> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
    context.read<TopRatedMoviesBloc>().add(LoadTopRatedMovies());
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_isBottomReached) {
      context.read<TopRatedMoviesBloc>().add(LoadMoreTopRatedMovies());
    }
  }

  bool get _isBottomReached {
    return _scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 200;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TopRatedMoviesBloc, TopRatedMoviesState>(
      builder: (context, state) {
        if (state is TopRatedMoviesLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state is TopRatedMoviesError) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Error: ${state.message}'),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () => context.read<TopRatedMoviesBloc>().add(LoadTopRatedMovies()),
                  child: const Text('Retry'),
                ),
              ],
            ),
          );
        }

        if (state is TopRatedMoviesLoaded) {
          return RefreshIndicator(
            onRefresh: () async {
              context.read<TopRatedMoviesBloc>().add(RefreshTopRatedMovies());
            },
            child: ListView.builder(
              controller: _scrollController,
              physics: const AlwaysScrollableScrollPhysics(),
              itemCount: state.hasReachedMax
                  ? state.movies.length
                  : state.movies.length + 1,
              itemBuilder: (context, index) {
                if (index >= state.movies.length) {
                  return const Center(
                    child: Padding(
                      padding: EdgeInsets.all(16.0),
                      child: CircularProgressIndicator(),
                    ),
                  );
                }
                return MovieCard(movie: state.movies[index]);
              },
            ),
          );
        }

        return const SizedBox.shrink();
      },
    );
  }
}
```

### 5. TabView Implementation with Multiple BLoC Providers

```dart
class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<PopularMoviesBloc>(
          create: (context) => GetIt.instance<PopularMoviesBloc>(),
        ),
        BlocProvider<TopRatedMoviesBloc>(
          create: (context) => GetIt.instance<TopRatedMoviesBloc>(),
        ),
        BlocProvider<UpcomingMoviesBloc>(
          create: (context) => GetIt.instance<UpcomingMoviesBloc>(),
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Movies'),
          bottom: TabBar(
            controller: _tabController,
            tabs: const [
              Tab(text: 'Popular'),
              Tab(text: 'Top Rated'),
              Tab(text: 'Upcoming'),
            ],
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: const [
            PopularMoviesListView(),
            TopRatedMoviesListView(),
            UpcomingMoviesListView(),
          ],
        ),
      ),
    );
  }
}
```

#### Alternative: Using BlocProvider.value for Pre-created BLoCs

```dart
class HomePage extends StatelessWidget {
  final PopularMoviesBloc popularMoviesBloc;
  final TopRatedMoviesBloc topRatedMoviesBloc;
  final UpcomingMoviesBloc upcomingMoviesBloc;

  const HomePage({
    Key? key,
    required this.popularMoviesBloc,
    required this.topRatedMoviesBloc,
    required this.upcomingMoviesBloc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<PopularMoviesBloc>.value(value: popularMoviesBloc),
        BlocProvider<TopRatedMoviesBloc>.value(value: topRatedMoviesBloc),
        BlocProvider<UpcomingMoviesBloc>.value(value: upcomingMoviesBloc),
      ],
      child: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Movies'),
            bottom: const TabBar(
              tabs: [
                Tab(text: 'Popular'),
                Tab(text: 'Top Rated'),
                Tab(text: 'Upcoming'),
              ],
            ),
          ),
          body: const TabBarView(
            children: [
              PopularMoviesListView(),
              TopRatedMoviesListView(),
              UpcomingMoviesListView(),
            ],
          ),
        ),
      ),
    );
  }
}
```

### 6. Widget Architecture

#### Small, Reusable Widgets

```dart
class MovieCard extends StatelessWidget {
  final Movie movie;

  const MovieCard({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () => Navigator.pushNamed(
          context,
          '/movie-detail',
          arguments: movie.id,
        ),
        child: Row(
          children: [
            MoviePoster(posterPath: movie.posterPath),
            Expanded(
              child: MovieInfo(movie: movie),
            ),
          ],
        ),
      ),
    );
  }
}

class MoviePoster extends StatelessWidget {
  final String? posterPath;

  const MoviePoster({Key? key, this.posterPath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        image: posterPath != null
            ? DecorationImage(
                image: NetworkImage('${ApiConstants.imageBaseUrl}$posterPath'),
                fit: BoxFit.cover,
              )
            : null,
      ),
      child: posterPath == null
          ? const Icon(Icons.movie, size: 50)
          : null,
    );
  }
}
```

### 7. Theming Configuration

```dart
class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.primary,
        brightness: Brightness.light,
      ),
      appBarTheme: const AppBarTheme(
        elevation: 0,
        centerTitle: true,
        titleTextStyle: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      cardTheme: CardTheme(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      tabBarTheme: const TabBarTheme(
        labelColor: AppColors.primary,
        unselectedLabelColor: AppColors.grey,
        indicatorColor: AppColors.primary,
      ),
      textTheme: const TextTheme(
        headlineLarge: TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.bold,
        ),
        bodyLarge: TextStyle(
          fontSize: 16,
          height: 1.5,
        ),
      ),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.primary,
        brightness: Brightness.dark,
      ),
      // Dark theme configurations
    );
  }
}

class AppColors {
  static const Color primary = Color(0xFF1976D2);
  static const Color secondary = Color(0xFF424242);
  static const Color grey = Color(0xFF9E9E9E);
  static const Color error = Color(0xFFD32F2F);
}
```

## Dependencies

Add these dependencies to `pubspec.yaml`:

```yaml
dependencies:
  flutter:
    sdk: flutter

  # State Management
  flutter_bloc: ^8.1.3
  equatable: ^2.0.5

  # Networking
  dio: ^5.3.2
  retrofit: ^4.0.3

  # JSON Serialization
  json_annotation: ^4.8.1

  # Dependency Injection
  get_it: ^7.6.4

  # Navigation
  go_router: ^12.1.1

  # UI
  cached_network_image: ^3.3.0

dev_dependencies:
  flutter_test:
    sdk: flutter
  mockito: ^5.4.2
  build_runner: ^2.4.7
  json_serializable: ^6.7.1
  retrofit_generator: ^8.0.6
```

### Code Generation

Run this command to generate JsonSerializer and Retrofit code:

```bash
flutter packages pub run build_runner build
```

For continuous code generation during development:

```bash
flutter packages pub run build_runner watch
```

This will generate:

- `movie_model.g.dart` - JsonSerializer code
- `api_service.g.dart` - Retrofit API service implementation

## BLoC-per-Page Architecture Benefits

### Why Choose BLoC-per-Page Over Shared BLoC?

The BLoC-per-page approach provides several significant advantages over using a single shared BLoC for similar features:

#### 1. **Separation of Concerns**

- Each BLoC focuses on a single responsibility and page-specific logic
- Clear boundaries between different features and their state management
- Easier to understand and maintain as each BLoC has a specific purpose

#### 2. **Independent State Management**

- Each page can have its own loading states, error handling, and data structures
- Popular movies, top-rated movies, and upcoming movies can have different business rules
- No risk of state interference between different categories

#### 3. **Scalability and Maintainability**

- Easy to add new features or modify existing ones without affecting others
- Each BLoC can evolve independently as requirements change
- Simplified debugging as issues are isolated to specific BLoCs

#### 4. **Better Testing**

- Unit tests can focus on specific BLoC functionality
- Mocking dependencies is simpler with focused BLoCs
- Test coverage is more granular and comprehensive

#### 5. **Performance Benefits**

- Only the relevant BLoC rebuilds when state changes occur
- Memory usage is more efficient as unused BLoCs can be disposed
- Better resource management with page-specific lifecycle

#### 6. **Team Development**

- Different team members can work on different BLoCs simultaneously
- Reduced merge conflicts as changes are isolated
- Clear ownership of different features

### Implementation Patterns

#### BLoC Lifecycle Management

```dart
// Good: BLoC created when page is accessed
class PopularMoviesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PopularMoviesBloc(
        getPopularMoviesUseCase: GetIt.instance(),
      )..add(LoadPopularMovies()),
      child: PopularMoviesListView(),
    );
  }
}
```

#### Error Handling Per Page

```dart
// Each BLoC can have its own error handling strategy
class PopularMoviesBloc extends Bloc<PopularMoviesEvent, PopularMoviesState> {
  Future<void> _onLoadPopularMovies(
    LoadPopularMovies event,
    Emitter<PopularMoviesState> emit,
  ) async {
    try {
      final movies = await getPopularMoviesUseCase.call(page: 1);
      emit(PopularMoviesLoaded(movies: movies));
    } on NetworkException catch (e) {
      emit(PopularMoviesError('Network error: ${e.message}'));
    } on ServerException catch (e) {
      emit(PopularMoviesError('Server error: ${e.message}'));
    } catch (e) {
      emit(PopularMoviesError('Unexpected error occurred'));
    }
  }
}
```

#### Feature-Specific State Models

```dart
// Popular movies might need different state properties
class PopularMoviesLoaded extends PopularMoviesState {
  final List<Movie> movies;
  final bool hasReachedMax;
  final DateTime lastUpdated;
  final String? nextPageToken; // Specific to popular movies API
}

// Top rated movies might have different requirements
class TopRatedMoviesLoaded extends TopRatedMoviesState {
  final List<Movie> movies;
  final bool hasReachedMax;
  final double minimumRating; // Specific to top rated movies
  final int totalCount;
}
```

### Trade-offs to Consider

#### Advantages

- ✅ Clear separation of concerns
- ✅ Better testability and maintainability
- ✅ Independent feature evolution
- ✅ Reduced complexity per BLoC
- ✅ Better performance and memory management

#### Disadvantages

- ❌ More boilerplate code initially
- ❌ Potential code duplication for similar features
- ❌ Need for more dependency injection setup
- ❌ Slightly more complex navigation between pages

### Recommended Usage

Use BLoC-per-page when:

- Features have different business logic or requirements
- You expect features to evolve independently
- Team size is large and features need clear ownership
- Testing and maintenance are high priorities
- Performance optimization is important

Consider shared BLoC when:

- Features are truly identical in behavior and requirements
- Codebase is small and simple
- Development team is very small
- Quick prototyping is the primary goal

## Key Considerations

- **Performance**: Use ListView.builder for efficient list rendering
- **Error Handling**: Create comprehensive error states and user feedback
- **Accessibility**: Ensure proper semantic labels and contrast ratios
- **Responsive Design**: Handle different screen sizes and orientations

This refactor will result in a more maintainable, testable, and scalable Flutter application following modern development practices.
