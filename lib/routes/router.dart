import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_pertama/pages/admin/admin_dashboard.dart';
import 'package:flutter_pertama/pages/splash_screen.dart';
import 'package:flutter_pertama/pages/user/dashboard.dart';
import 'package:flutter_pertama/pages/user/quiz_page.dart';
import 'package:flutter_pertama/pages/user/room_page.dart';
import 'package:flutter_pertama/pages/user/select_room_page.dart';
import 'package:go_router/go_router.dart';
import '../models/question_model.dart';
import '../pages/admin/add_question_page.dart';
import '../pages/admin/admin_profile_page.dart';
import '../pages/admin/category_page.dart';
import '../pages/admin/edit_question_page.dart';
import '../pages/admin/question_page.dart';
import '../pages/login_page.dart';
import '../pages/user/leaderboard.dart';
import '../pages/user/profil_page.dart';
import '../pages/register_page.dart';


final GoRouter router = GoRouter(
  initialLocation: '/splash', // Set '/splash' as the initial location
  redirect: (context, state) async {
    final auth = FirebaseAuth.instance;

    // Allow splash screen to display without redirect
    if (state.fullPath == '/splash') {
      return null; // Do not redirect from the splash screen
    }

    // Allow register page to be accessible without login
    if (state.fullPath == '/register') {
      return null; // Do not redirect from the register page
    }

    // Redirect to login if not authenticated
    if (auth.currentUser == null && state.fullPath != '/login') {
      return '/login'; // Redirect to login if not authenticated
    }

    return null;
  },
  routes: [
    GoRoute(
      path: '/splash',
      name: 'splash',
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: '/login',
      name: 'login',
      builder: (context, state) => LoginPage(),
    ),
    GoRoute(
      path: '/register',
      name: 'register',
      builder: (context, state) => RegisterPage(),
    ),
    GoRoute(
      path: '/admin/dashboard',
      name: 'adminDashboard',
      builder: (context, state) => AdminDashboard(),
      routes: [
        GoRoute(
          path: 'profile',
          name: 'adminprofile',
          builder: (context, state) => const AdminProfilePage(),
        ),
        GoRoute(
          path: 'category-page',
          name: 'categoryPage', // Routing untuk CRUD Category
          builder: (context, state) => CategoryPage(),
        ),
        GoRoute(
          path: 'question-page',
          name: 'questionPage', // Routing untuk CRUD Question
          builder: (context, state) => const QuestionPage(),
          routes: [
            GoRoute(
              path: 'add-question-page',
              name: 'addQuestion', // Routing untuk CRUD Add Question
              builder: (context, state) => AddQuestionPage(),
            ),
            GoRoute(
              path: 'edit-question-page',
              name: 'editQuestion',
              builder: (context, state) {
                // Mengambil argumen yang dikirimkan dari QuestionPage (question)
                final question = state.extra as QuestionModel;
                return EditQuestionPage(question: question);
              },
            ),
          ],
        ),
      ],
    ),
    GoRoute(
      path: '/user/dashboard',
      name: 'dashboard',
      builder: (context, state) => Dashboard(),
      routes: [
        GoRoute(
          path: 'profile',
          name: 'profile',
          builder: (context, state) => const ProfilPage(),
        ),
        GoRoute(
          path: 'leaderboard',
          name: 'leaderBoard',
          builder: (context, state) {
            return LeaderboardPage();
          },
        ),
        GoRoute(
          path: 'quiz', // Path relatif
          name: 'quizPage',
          builder: (context, state) => QuizPage(),
        ),
        GoRoute(
          path: 'selectRoomPage', // Path relatif
          name: 'selectRoomPage',
          builder: (context, state) => SelectRoomPage(),
        ),

        GoRoute(
          path: 'room/:roomCode',
          name: 'roomPage',
          builder: (context, state) {
            final roomCode = state.pathParameters['roomCode']!;
            return RoomPage(roomCode: roomCode);
          },
        ),
      ],
    ),
  ],
);
