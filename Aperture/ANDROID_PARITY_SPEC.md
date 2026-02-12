# Aperture Android Parity Specification
## Complete Feature Implementation Guide for 100% iOS Parity

**Version:** 1.0  
**iOS Build Reference:** Feb 10, 2026  
**Total iOS Swift Files:** 401 files  

---

## TABLE OF CONTENTS

1. [Architecture Overview](#1-architecture-overview)
2. [Tech Stack Recommendations](#2-tech-stack-recommendations)
3. [App Structure](#3-app-structure)
4. [Core Systems](#4-core-systems)
5. [Module Specifications](#5-module-specifications)
6. [Data Models](#6-data-models)
7. [UI Components](#7-ui-components)
8. [Course System](#8-course-system)
9. [Sacred Geometry Badge System](#9-sacred-geometry-badge-system)
10. [Implementation Checklist](#10-implementation-checklist)

---

## 1. ARCHITECTURE OVERVIEW

### iOS Architecture: VIPER + Clean Architecture
```
Module/
├── Assembly/      → Dependency injection setup
├── Contract/      → Protocols/interfaces
├── Entity/        → Data models
├── Interactor/    → Business logic
├── Presenter/     → UI state management
├── Router/        → Navigation
└── View/          → UI components
```

### Android Equivalent: MVVM + Clean Architecture
```
Module/
├── di/            → Hilt/Dagger modules
├── domain/
│   ├── model/     → Data classes
│   ├── usecase/   → Business logic
│   └── repository/→ Repository interfaces
├── data/
│   ├── repository/→ Repository implementations
│   └── local/     → Room DAOs, SharedPreferences
├── presentation/
│   ├── viewmodel/ → ViewModels
│   └── ui/        → Composables/Fragments
└── navigation/    → Navigation logic
```

---

## 2. TECH STACK RECOMMENDATIONS

### Core
| iOS | Android |
|-----|---------|
| SwiftUI | Jetpack Compose |
| Combine | Kotlin Flow + Coroutines |
| UserDefaults | SharedPreferences / DataStore |
| Keychain | EncryptedSharedPreferences |
| Core Data | Room Database |
| WidgetKit | Glance (App Widgets) |
| App Intents | App Actions / Shortcuts |

### Dependencies
```kotlin
// build.gradle.kts
dependencies {
    // Core
    implementation("androidx.compose.ui:ui:1.6.0")
    implementation("androidx.compose.material3:material3:1.2.0")
    implementation("androidx.navigation:navigation-compose:2.7.6")
    implementation("androidx.lifecycle:lifecycle-viewmodel-compose:2.7.0")
    
    // DI
    implementation("com.google.dagger:hilt-android:2.50")
    kapt("com.google.dagger:hilt-compiler:2.50")
    
    // Persistence
    implementation("androidx.datastore:datastore-preferences:1.0.0")
    implementation("androidx.room:room-runtime:2.6.1")
    implementation("androidx.room:room-ktx:2.6.1")
    kapt("androidx.room:room-compiler:2.6.1")
    
    // Firebase
    implementation(platform("com.google.firebase:firebase-bom:32.7.0"))
    implementation("com.google.firebase:firebase-auth-ktx")
    implementation("com.google.firebase:firebase-firestore-ktx")
    
    // Biometrics
    implementation("androidx.biometric:biometric:1.2.0-alpha05")
    
    // Google Sign-In
    implementation("com.google.android.gms:play-services-auth:20.7.0")
    
    // TTS
    implementation("androidx.core:core-ktx:1.12.0")
    
    // Widgets
    implementation("androidx.glance:glance-appwidget:1.0.0")
}
```

---

## 3. APP STRUCTURE

### Package Structure
```
com.sunflow.aperture/
├── ApertureApplication.kt
├── MainActivity.kt
├── core/
│   ├── achievements/
│   ├── auth/
│   ├── audio/
│   ├── bookmarks/
│   ├── colors/
│   ├── components/
│   ├── deeplinks/
│   ├── error/
│   ├── extensions/
│   ├── feedback/
│   ├── featureflags/
│   ├── flowstate/
│   ├── guestmode/
│   ├── haptics/
│   ├── iceemergency/
│   ├── intelligence/
│   ├── intents/
│   ├── legal/
│   ├── localization/
│   ├── logger/
│   ├── navigation/
│   ├── notifications/
│   ├── onboarding/
│   ├── performance/
│   ├── persistence/
│   ├── premium/
│   ├── progress/
│   ├── review/
│   ├── sacredgeometry/
│   ├── search/
│   ├── security/
│   ├── services/
│   ├── share/
│   ├── sharing/
│   ├── streaks/
│   ├── ui/
│   ├── userpersonas/
│   └── widget/
├── modules/
│   ├── alexandria/
│   ├── auth/
│   ├── awaketogether/
│   ├── awakening/
│   ├── cosmos/
│   ├── education/
│   ├── godmode/
│   ├── government/
│   ├── landing/
│   ├── more/
│   ├── profile/
│   ├── psyopscanner/
│   ├── roottabview/
│   ├── timeline/
│   └── tutorial/
└── di/
    └── AppModule.kt
```

---

## 4. CORE SYSTEMS

### 4.1 Color Palette (`core/colors/`)

```kotlin
// Palette.kt
object Palette {
    // Primary
    val cosmicBlack = Color(0xFF0a0a1a)
    val cosmicPurple = Color(0xFF1a0a2a)
    val deepSpace = Color(0xFF0d0d1f)
    
    // Accent
    object Accent {
        val gold = Color(0xFFFFD700)
        val cyan = Color(0xFF00CED1)
        val violet = Color(0xFF7C4DFF)
        val green = Color(0xFF00FF88)
        val rose = Color(0xFFFF6B9D)
    }
    
    // Gradients
    val cosmicGradient = Brush.linearGradient(
        colors = listOf(cosmicBlack, cosmicPurple, deepSpace)
    )
    
    val goldGradient = Brush.linearGradient(
        colors = listOf(Color(0xFFFFD700), Color(0xFFFF8C00))
    )
}
```

### 4.2 Haptic Manager (`core/haptics/`)

```kotlin
// HapticManager.kt
@Singleton
class HapticManager @Inject constructor(
    @ApplicationContext private val context: Context
) {
    private val vibrator = context.getSystemService(Vibrator::class.java)
    
    fun light() {
        vibrator?.vibrate(VibrationEffect.createOneShot(10, VibrationEffect.EFFECT_TICK))
    }
    
    fun medium() {
        vibrator?.vibrate(VibrationEffect.createOneShot(20, VibrationEffect.EFFECT_CLICK))
    }
    
    fun heavy() {
        vibrator?.vibrate(VibrationEffect.createOneShot(30, VibrationEffect.EFFECT_HEAVY_CLICK))
    }
    
    fun success() {
        vibrator?.vibrate(VibrationEffect.createWaveform(longArrayOf(0, 50, 50, 50), -1))
    }
    
    fun warning() {
        vibrator?.vibrate(VibrationEffect.createWaveform(longArrayOf(0, 100, 50, 100), -1))
    }
    
    fun error() {
        vibrator?.vibrate(VibrationEffect.createWaveform(longArrayOf(0, 200, 100, 200), -1))
    }
}
```

### 4.3 Authentication (`core/auth/`)

```kotlin
// AuthenticationManager.kt
@Singleton
class AuthenticationManager @Inject constructor(
    private val firebaseAuth: FirebaseAuth,
    private val biometricManager: BiometricManager,
    private val secureStorage: SecureStorage
) {
    private val _authState = MutableStateFlow<AuthState>(AuthState.Unknown)
    val authState: StateFlow<AuthState> = _authState.asStateFlow()
    
    sealed class AuthState {
        object Unknown : AuthState()
        object Unauthenticated : AuthState()
        data class Authenticated(val user: User) : AuthState()
        data class Error(val message: String) : AuthState()
    }
    
    suspend fun signInWithEmail(email: String, password: String): Result<User>
    suspend fun signInWithGoogle(idToken: String): Result<User>
    suspend fun signUpWithEmail(email: String, password: String): Result<User>
    suspend fun signOut()
    suspend fun resetPassword(email: String): Result<Unit>
    
    // Biometric
    fun isBiometricAvailable(): Boolean
    suspend fun authenticateWithBiometric(activity: FragmentActivity): Result<Unit>
}

// BiometricAuth.kt
class BiometricAuth @Inject constructor(
    @ApplicationContext private val context: Context
) {
    private val biometricManager = BiometricManager.from(context)
    
    fun canAuthenticate(): Boolean {
        return biometricManager.canAuthenticate(
            BiometricManager.Authenticators.BIOMETRIC_STRONG
        ) == BiometricManager.BIOMETRIC_SUCCESS
    }
    
    fun authenticate(
        activity: FragmentActivity,
        title: String = "Authenticate",
        subtitle: String = "Use your fingerprint or face",
        onSuccess: () -> Unit,
        onError: (String) -> Unit
    ) {
        val promptInfo = BiometricPrompt.PromptInfo.Builder()
            .setTitle(title)
            .setSubtitle(subtitle)
            .setNegativeButtonText("Cancel")
            .setAllowedAuthenticators(BiometricManager.Authenticators.BIOMETRIC_STRONG)
            .build()
            
        val biometricPrompt = BiometricPrompt(activity, executor,
            object : BiometricPrompt.AuthenticationCallback() {
                override fun onAuthenticationSucceeded(result: BiometricPrompt.AuthenticationResult) {
                    onSuccess()
                }
                override fun onAuthenticationError(errorCode: Int, errString: CharSequence) {
                    onError(errString.toString())
                }
            })
            
        biometricPrompt.authenticate(promptInfo)
    }
}
```

### 4.4 Progress Tracker (`core/progress/`)

```kotlin
// ProgressStats.kt
@Serializable
data class ProgressStats(
    val totalDaysActive: Int = 0,
    val currentStreak: Int = 0,
    val longestStreak: Int = 0,
    val totalPracticeMinutes: Int = 0,
    val coursesStarted: Int = 0,
    val coursesCompleted: Int = 0,
    val lessonsCompleted: Int = 0,
    val practicesCompleted: Int = 0,
    val cosmosExplored: Int = 0,
    val textsRead: Int = 0,
    val timelineEventsViewed: Int = 0,
    val insightsLogged: Int = 0,
    val lastActiveDate: Long? = null // Unix timestamp
) {
    val averagePracticeMinutes: Int
        get() = if (totalDaysActive > 0) totalPracticeMinutes / totalDaysActive else 0
    
    val completionRate: Float
        get() = if (coursesStarted > 0) coursesCompleted.toFloat() / coursesStarted else 0f
}

// TrackedCourseProgress.kt
@Serializable
data class TrackedCourseProgress(
    val id: String,
    val courseId: String,
    val courseName: String,
    val lessonsCompleted: Int,
    val totalLessons: Int,
    val lastLessonId: String? = null,
    val startDate: Long,
    val completionDate: Long? = null,
    val practiceMinutes: Int
) {
    val progress: Float
        get() = if (totalLessons > 0) lessonsCompleted.toFloat() / totalLessons else 0f
    
    val isCompleted: Boolean
        get() = lessonsCompleted >= totalLessons
}

// ProgressTracker.kt
@Singleton
class ProgressTracker @Inject constructor(
    private val dataStore: DataStore<Preferences>,
    private val notificationManager: ApertureNotificationManager
) {
    private val _stats = MutableStateFlow(ProgressStats())
    val stats: StateFlow<ProgressStats> = _stats.asStateFlow()
    
    private val _courseProgress = MutableStateFlow<List<TrackedCourseProgress>>(emptyList())
    val courseProgress: StateFlow<List<TrackedCourseProgress>> = _courseProgress.asStateFlow()
    
    suspend fun recordDailyActivity()
    suspend fun recordPractice(minutes: Int)
    suspend fun recordLessonComplete(courseId: String, lessonId: String)
    suspend fun recordCourseComplete(courseId: String)
    suspend fun recordCourseStarted(courseId: String, courseName: String, totalLessons: Int)
}
```

### 4.5 Streak Tracker (`core/streaks/`)

```kotlin
// StreakTracker.kt
@Singleton
class StreakTracker @Inject constructor(
    private val dataStore: DataStore<Preferences>
) {
    data class StreakData(
        val currentStreak: Int = 0,
        val longestStreak: Int = 0,
        val lastActiveDate: LocalDate? = null,
        val totalDaysActive: Int = 0
    )
    
    private val _streakData = MutableStateFlow(StreakData())
    val streakData: StateFlow<StreakData> = _streakData.asStateFlow()
    
    suspend fun checkIn() {
        val today = LocalDate.now()
        val current = _streakData.value
        
        when {
            current.lastActiveDate == today -> return // Already checked in
            current.lastActiveDate == today.minusDays(1) -> {
                // Consecutive day
                _streakData.value = current.copy(
                    currentStreak = current.currentStreak + 1,
                    longestStreak = maxOf(current.longestStreak, current.currentStreak + 1),
                    lastActiveDate = today,
                    totalDaysActive = current.totalDaysActive + 1
                )
            }
            else -> {
                // Streak broken
                _streakData.value = current.copy(
                    currentStreak = 1,
                    lastActiveDate = today,
                    totalDaysActive = current.totalDaysActive + 1
                )
            }
        }
        save()
    }
}
```

### 4.6 User Journey Store (`core/onboarding/`)

```kotlin
// UserJourneyType.kt
enum class UserJourneyType(
    val key: String,
    val title: String,
    val subtitle: String,
    val icon: String,
    val primaryModule: String,
    val primaryTabIndex: Int,
    val color: Color
) {
    GROUND_ME(
        key = "ground_me",
        title = "Ground me",
        subtitle = "I need stability and peace",
        icon = "🌙",
        primaryModule = "Awakening",
        primaryTabIndex = 3,
        color = Color(0xFF9C27B0) // Purple
    ),
    SHOW_PATTERNS(
        key = "show_patterns",
        title = "Show me patterns",
        subtitle = "I want to understand what's really happening",
        icon = "🔍",
        primaryModule = "Timeline",
        primaryTabIndex = 1,
        color = Color(0xFF00BCD4) // Cyan
    ),
    TEACH_PRACTICE(
        key = "teach_practice",
        title = "Teach me practice",
        subtitle = "I want methods to transform",
        icon = "🧘",
        primaryModule = "Awakening",
        primaryTabIndex = 3,
        color = Palette.Accent.gold
    ),
    GIVE_SOURCES(
        key = "give_sources",
        title = "Give me sources",
        subtitle = "I want primary texts and evidence",
        icon = "📚",
        primaryModule = "Alexandria",
        primaryTabIndex = 4,
        color = Color(0xFF4CAF50) // Green
    )
}

// QuickAccessDestination.kt
enum class QuickAccessDestination {
    PRACTICE,
    CURRENT_COURSE,
    BADGES,
    TIMELINE,
    COSMOS,
    ALEXANDRIA,
    CUSTOM
}

// QuickAccessItem.kt
@Serializable
data class QuickAccessItem(
    val id: String,
    val title: String,
    val icon: String,
    val destination: QuickAccessDestination
) {
    companion object {
        val defaultItems = listOf(
            QuickAccessItem("practice", "Practice", "figure.mind.and.body", QuickAccessDestination.PRACTICE),
            QuickAccessItem("course", "Course", "book.fill", QuickAccessDestination.CURRENT_COURSE),
            QuickAccessItem("badges", "Badges", "seal.fill", QuickAccessDestination.BADGES)
        )
    }
}

// UserJourneyStore.kt
@Singleton
class UserJourneyStore @Inject constructor(
    private val dataStore: DataStore<Preferences>
) {
    private val _journeyType = MutableStateFlow<UserJourneyType?>(null)
    val journeyType: StateFlow<UserJourneyType?> = _journeyType.asStateFlow()
    
    private val _hasCompletedOnboarding = MutableStateFlow(false)
    val hasCompletedOnboarding: StateFlow<Boolean> = _hasCompletedOnboarding.asStateFlow()
    
    private val _quickAccessItems = MutableStateFlow(QuickAccessItem.defaultItems)
    val quickAccessItems: StateFlow<List<QuickAccessItem>> = _quickAccessItems.asStateFlow()
    
    suspend fun setJourneyType(type: UserJourneyType)
    suspend fun completeOnboarding()
    suspend fun updateQuickAccess(items: List<QuickAccessItem>)
}
```

### 4.7 Flow State Manager (`core/flowstate/`)

```kotlin
// FlowPhase.kt
enum class FlowPhase(
    val displayName: String,
    val icon: String, // Material icon name
    val color: Color,
    val description: String
) {
    PREPARING("Preparing", "psychology", Color.Cyan, "Clear your space and mind"),
    ENTERING("Entering Flow", "waves", Color(0xFF9C27B0), "Building focus momentum"),
    DEEP_WORK("Deep Flow", "local_fire_department", Color(0xFFFF9800), "You're in the zone"),
    REST("Integration", "eco", Color.Green, "Let insights settle"),
    COMPLETE("Complete", "verified", Palette.Accent.gold, "Session complete")
}

// FlowMood.kt
enum class FlowMood(val display: String) {
    TRANSCENDENT("🌟 Transcendent"),
    FOCUSED("🎯 Focused"),
    CALM("🧘 Calm"),
    STRUGGLING("😤 Struggling"),
    DISTRACTED("🤔 Distracted")
}

// FlowSession.kt
@Serializable
data class FlowSession(
    val id: String,
    val startTime: Long,
    val endTime: Long? = null,
    val intention: String,
    val totalMinutes: Int,
    val deepFlowMinutes: Int,
    val distractionCount: Int,
    val notes: String? = null,
    val mood: FlowMood? = null
) {
    val durationMinutes: Int
        get() {
            val end = endTime ?: System.currentTimeMillis()
            return ((end - startTime) / 60000).toInt()
        }
}

// FlowStateManager.kt
@Singleton
class FlowStateManager @Inject constructor(
    private val dataStore: DataStore<Preferences>,
    private val notificationManager: ApertureNotificationManager,
    private val hapticManager: HapticManager
) {
    private val _isActive = MutableStateFlow(false)
    val isActive: StateFlow<Boolean> = _isActive.asStateFlow()
    
    private val _currentPhase = MutableStateFlow(FlowPhase.PREPARING)
    val currentPhase: StateFlow<FlowPhase> = _currentPhase.asStateFlow()
    
    private val _currentSession = MutableStateFlow<FlowSession?>(null)
    val currentSession: StateFlow<FlowSession?> = _currentSession.asStateFlow()
    
    private val _elapsedSeconds = MutableStateFlow(0)
    val elapsedSeconds: StateFlow<Int> = _elapsedSeconds.asStateFlow()
    
    // Settings
    var prepareDuration = 3 // minutes
    var enteringDuration = 5
    var deepWorkDuration = 45
    var restDuration = 5
    var enableSounds = true
    var enableHaptics = true
    
    private var timerJob: Job? = null
    
    suspend fun startSession(intention: String)
    suspend fun pauseSession()
    suspend fun resumeSession()
    suspend fun endSession(mood: FlowMood?, notes: String?)
    fun recordDistraction()
    
    private fun startTimer() {
        timerJob = CoroutineScope(Dispatchers.Default).launch {
            while (isActive) {
                delay(1000)
                _elapsedSeconds.value++
                checkPhaseTransition()
            }
        }
    }
}
```

### 4.8 Notification Manager (`core/notifications/`)

```kotlin
// ApertureNotificationManager.kt
@Singleton
class ApertureNotificationManager @Inject constructor(
    @ApplicationContext private val context: Context
) {
    companion object {
        const val CHANNEL_DAILY_REMINDER = "daily_reminder"
        const val CHANNEL_STREAK = "streak"
        const val CHANNEL_FLOW_STATE = "flow_state"
        const val CHANNEL_ACHIEVEMENT = "achievement"
    }
    
    fun createChannels() {
        val channels = listOf(
            NotificationChannel(CHANNEL_DAILY_REMINDER, "Daily Reminders", NotificationManager.IMPORTANCE_DEFAULT),
            NotificationChannel(CHANNEL_STREAK, "Streak Alerts", NotificationManager.IMPORTANCE_HIGH),
            NotificationChannel(CHANNEL_FLOW_STATE, "Flow State", NotificationManager.IMPORTANCE_LOW),
            NotificationChannel(CHANNEL_ACHIEVEMENT, "Achievements", NotificationManager.IMPORTANCE_HIGH)
        )
        val manager = context.getSystemService(NotificationManager::class.java)
        channels.forEach { manager.createNotificationChannel(it) }
    }
    
    fun showBadgeEarned(badge: SacredBadge)
    fun showStreakReminder(currentStreak: Int)
    fun showDailyPracticeReminder()
    fun showFlowPhaseChange(phase: FlowPhase)
}
```

### 4.9 Deep Link Handler (`core/deeplinks/`)

```kotlin
// DeepLinkHandler.kt
@Singleton
class DeepLinkHandler @Inject constructor(
    private val navController: NavController
) {
    sealed class DeepLink {
        object Home : DeepLink()
        object Badges : DeepLink()
        object FlowState : DeepLink()
        object Profile : DeepLink()
        object Settings : DeepLink()
        data class Course(val courseId: String) : DeepLink()
        data class Lesson(val courseId: String, val lessonId: String) : DeepLink()
        data class Timeline(val eraId: String? = null) : DeepLink()
        data class Alexandria(val sectionId: String? = null) : DeepLink()
    }
    
    fun handle(uri: Uri): Boolean {
        val deepLink = parseUri(uri) ?: return false
        navigate(deepLink)
        return true
    }
    
    private fun parseUri(uri: Uri): DeepLink? {
        // aperture://home
        // aperture://badges
        // aperture://course/{courseId}
        // aperture://course/{courseId}/lesson/{lessonId}
        // aperture://timeline/{eraId}
        // aperture://alexandria/{sectionId}
        return when (uri.host) {
            "home" -> DeepLink.Home
            "badges" -> DeepLink.Badges
            "flowstate" -> DeepLink.FlowState
            "profile" -> DeepLink.Profile
            "settings" -> DeepLink.Settings
            "course" -> {
                val pathSegments = uri.pathSegments
                if (pathSegments.size >= 3 && pathSegments[1] == "lesson") {
                    DeepLink.Lesson(pathSegments[0], pathSegments[2])
                } else {
                    DeepLink.Course(pathSegments.firstOrNull() ?: return null)
                }
            }
            "timeline" -> DeepLink.Timeline(uri.pathSegments.firstOrNull())
            "alexandria" -> DeepLink.Alexandria(uri.pathSegments.firstOrNull())
            else -> null
        }
    }
}
```

### 4.10 Text-to-Speech Manager (`core/audio/`)

```kotlin
// TextToSpeechManager.kt
@Singleton
class TextToSpeechManager @Inject constructor(
    @ApplicationContext private val context: Context
) {
    private var tts: TextToSpeech? = null
    private val _isSpeaking = MutableStateFlow(false)
    val isSpeaking: StateFlow<Boolean> = _isSpeaking.asStateFlow()
    
    private val _progress = MutableStateFlow(0f)
    val progress: StateFlow<Float> = _progress.asStateFlow()
    
    var rate: Float = 1.0f
    var pitch: Float = 1.0f
    
    fun initialize() {
        tts = TextToSpeech(context) { status ->
            if (status == TextToSpeech.SUCCESS) {
                tts?.language = Locale.US
            }
        }
    }
    
    fun speak(text: String) {
        tts?.setSpeechRate(rate)
        tts?.setPitch(pitch)
        _isSpeaking.value = true
        tts?.speak(text, TextToSpeech.QUEUE_FLUSH, null, UUID.randomUUID().toString())
    }
    
    fun stop() {
        tts?.stop()
        _isSpeaking.value = false
    }
    
    fun pause() {
        // Android TTS doesn't support pause natively
        // Would need to track position and restart
        stop()
    }
    
    fun shutdown() {
        tts?.shutdown()
    }
}
```

---

## 5. MODULE SPECIFICATIONS

### 5.1 Root Tab Navigation

**iOS:** `RootTabView.swift`  
**Android:** Bottom Navigation with 5 tabs

```kotlin
// MainNavigation.kt
enum class MainTab(
    val route: String,
    val title: String,
    val icon: ImageVector,
    val selectedIcon: ImageVector
) {
    HOME("home", "Home", Icons.Outlined.Home, Icons.Filled.Home),
    TIMELINE("timeline", "Timeline", Icons.Outlined.Timeline, Icons.Filled.Timeline),
    COSMOS("cosmos", "Cosmos", Icons.Outlined.Public, Icons.Filled.Public),
    AWAKENING("awakening", "Awakening", Icons.Outlined.SelfImprovement, Icons.Filled.SelfImprovement),
    MORE("more", "More", Icons.Outlined.MoreHoriz, Icons.Filled.MoreHoriz)
}

@Composable
fun MainScreen(navController: NavHostController) {
    var selectedTab by remember { mutableStateOf(MainTab.HOME) }
    
    Scaffold(
        bottomBar = {
            NavigationBar(
                containerColor = Palette.cosmicBlack
            ) {
                MainTab.entries.forEach { tab ->
                    NavigationBarItem(
                        selected = selectedTab == tab,
                        onClick = { selectedTab = tab },
                        icon = {
                            Icon(
                                if (selectedTab == tab) tab.selectedIcon else tab.icon,
                                contentDescription = tab.title
                            )
                        },
                        label = { Text(tab.title) },
                        colors = NavigationBarItemDefaults.colors(
                            selectedIconColor = Palette.Accent.gold,
                            selectedTextColor = Palette.Accent.gold,
                            unselectedIconColor = Color.White.copy(alpha = 0.6f),
                            indicatorColor = Palette.Accent.gold.copy(alpha = 0.2f)
                        )
                    )
                }
            }
        }
    ) { paddingValues ->
        NavHost(
            navController = navController,
            startDestination = selectedTab.route,
            modifier = Modifier.padding(paddingValues)
        ) {
            composable(MainTab.HOME.route) { LandingScreen() }
            composable(MainTab.TIMELINE.route) { TimelineScreen() }
            composable(MainTab.COSMOS.route) { CosmosScreen() }
            composable(MainTab.AWAKENING.route) { AwakeningScreen() }
            composable(MainTab.MORE.route) { MoreScreen() }
        }
    }
}
```

### 5.2 Landing/Home Module

**Features:**
- Personalized greeting based on time of day
- Quick access shortcuts (Practice, Course, Badges)
- Current streak display
- Course progress cards
- Sacred Geometry bubble (floating badge display)
- Navigation cards to main modules
- Alexandria call-to-action card

```kotlin
// LandingScreen.kt
@Composable
fun LandingScreen(
    viewModel: LandingViewModel = hiltViewModel(),
    onNavigateToCourse: (String) -> Unit,
    onNavigateToBadges: () -> Unit,
    onNavigateToFlowState: () -> Unit
) {
    val stats by viewModel.stats.collectAsState()
    val journeyType by viewModel.journeyType.collectAsState()
    val quickAccessItems by viewModel.quickAccessItems.collectAsState()
    val recentBadge by viewModel.recentBadge.collectAsState()
    
    Box(
        modifier = Modifier
            .fillMaxSize()
            .background(Palette.cosmicGradient)
    ) {
        LazyColumn(
            modifier = Modifier.fillMaxSize(),
            contentPadding = PaddingValues(16.dp)
        ) {
            // Header with greeting
            item {
                LandingHeaderSection(
                    userName = viewModel.userName,
                    journeyType = journeyType,
                    currentStreak = stats.currentStreak
                )
            }
            
            // Quick Access Row
            item {
                QuickAccessRow(
                    items = quickAccessItems,
                    onItemClick = { item ->
                        when (item.destination) {
                            QuickAccessDestination.BADGES -> onNavigateToBadges()
                            QuickAccessDestination.PRACTICE -> onNavigateToFlowState()
                            QuickAccessDestination.CURRENT_COURSE -> viewModel.currentCourseId?.let { 
                                onNavigateToCourse(it) 
                            }
                            else -> {}
                        }
                    }
                )
            }
            
            // Sacred Geometry Bubble (if badge earned recently)
            recentBadge?.let { badge ->
                item {
                    SacredGeometryBubble(
                        badge = badge,
                        onClick = onNavigateToBadges
                    )
                }
            }
            
            // Course Progress Cards
            item {
                CourseProgressSection(
                    courses = viewModel.activeCourses,
                    onCourseClick = onNavigateToCourse
                )
            }
            
            // Navigation Cards
            item {
                NavigationCardsGrid(
                    onTimelineClick = { /* navigate */ },
                    onCosmosClick = { /* navigate */ },
                    onAlexandriaClick = { /* navigate */ },
                    onAwakeningClick = { /* navigate */ }
                )
            }
        }
    }
}
```

### 5.3 Timeline Module

**Features:**
- Historical timeline with eras
- SceneKit 3D dragon view → **Android: Use OpenGL ES or Filament**
- Gnostic revelation cards
- Era detail views
- Timeline entry animations

```kotlin
// TimelineEra.kt
@Serializable
data class TimelineEra(
    val id: String,
    val name: String,
    val startYear: Int,
    val endYear: Int?,
    val description: String,
    val events: List<TimelineEvent>,
    val color: Long // Color as hex
)

@Serializable
data class TimelineEvent(
    val id: String,
    val year: Int,
    val title: String,
    val description: String,
    val significance: String,
    val sources: List<String>
)

// TimelineScreen.kt
@Composable
fun TimelineScreen(
    viewModel: TimelineViewModel = hiltViewModel()
) {
    val eras by viewModel.eras.collectAsState()
    val selectedEra by viewModel.selectedEra.collectAsState()
    
    Column(
        modifier = Modifier
            .fillMaxSize()
            .background(Palette.cosmicGradient)
    ) {
        // Era selector horizontal scroll
        LazyRow(
            contentPadding = PaddingValues(horizontal = 16.dp),
            horizontalArrangement = Arrangement.spacedBy(12.dp)
        ) {
            items(eras) { era ->
                EraChip(
                    era = era,
                    isSelected = era.id == selectedEra?.id,
                    onClick = { viewModel.selectEra(era) }
                )
            }
        }
        
        // Timeline content
        selectedEra?.let { era ->
            LazyColumn(
                modifier = Modifier.fillMaxSize(),
                contentPadding = PaddingValues(16.dp)
            ) {
                items(era.events) { event ->
                    TimelineEventCard(
                        event = event,
                        onClick = { viewModel.showEventDetail(event) }
                    )
                }
            }
        }
    }
}
```

### 5.4 Cosmos Module

**Features:**
- Segmented control for sections
- Astrology information
- Planetary alignments
- Zodiac connections
- Cosmic patterns visualization

```kotlin
// CosmosSection.kt
enum class CosmosSection(val title: String) {
    ZODIAC("Zodiac"),
    PLANETS("Planets"),
    ALIGNMENTS("Alignments"),
    CYCLES("Cycles")
}

// CosmosScreen.kt
@Composable
fun CosmosScreen(
    viewModel: CosmosViewModel = hiltViewModel()
) {
    var selectedSection by remember { mutableStateOf(CosmosSection.ZODIAC) }
    
    Column(
        modifier = Modifier
            .fillMaxSize()
            .background(Palette.cosmicGradient)
    ) {
        // Segmented Control
        CosmosSegmentedControl(
            sections = CosmosSection.entries,
            selected = selectedSection,
            onSelectionChange = { selectedSection = it }
        )
        
        // Content based on section
        when (selectedSection) {
            CosmosSection.ZODIAC -> ZodiacSection()
            CosmosSection.PLANETS -> PlanetsSection()
            CosmosSection.ALIGNMENTS -> AlignmentsSection()
            CosmosSection.CYCLES -> CyclesSection()
        }
    }
}

@Composable
fun CosmosSegmentedControl(
    sections: List<CosmosSection>,
    selected: CosmosSection,
    onSelectionChange: (CosmosSection) -> Unit
) {
    Row(
        modifier = Modifier
            .fillMaxWidth()
            .padding(16.dp)
            .background(Color.White.copy(alpha = 0.1f), RoundedCornerShape(12.dp))
            .padding(4.dp),
        horizontalArrangement = Arrangement.SpaceEvenly
    ) {
        sections.forEach { section ->
            val isSelected = section == selected
            Box(
                modifier = Modifier
                    .weight(1f)
                    .clip(RoundedCornerShape(8.dp))
                    .background(
                        if (isSelected) Palette.Accent.gold.copy(alpha = 0.3f)
                        else Color.Transparent
                    )
                    .clickable { onSelectionChange(section) }
                    .padding(vertical = 8.dp),
                contentAlignment = Alignment.Center
            ) {
                Text(
                    text = section.title,
                    color = if (isSelected) Palette.Accent.gold else Color.White.copy(alpha = 0.6f),
                    fontSize = 14.sp,
                    fontWeight = if (isSelected) FontWeight.Bold else FontWeight.Normal
                )
            }
        }
    }
}
```

### 5.5 Awakening Module

**Features:**
- Course hub with all courses
- Daily check-in sheets
- Emotional processing
- Reality audit
- Question bank
- Cognitive dissonance tracking
- SubModules (50+ courses)

```kotlin
// AwakeningScreen.kt
@Composable
fun AwakeningScreen(
    viewModel: AwakeningViewModel = hiltViewModel(),
    onNavigateToCourse: (String) -> Unit,
    onNavigateToSubModule: (String) -> Unit
) {
    val dailyCheckIn by viewModel.dailyCheckIn.collectAsState()
    val courseCategories by viewModel.courseCategories.collectAsState()
    
    LazyColumn(
        modifier = Modifier
            .fillMaxSize()
            .background(Palette.cosmicGradient),
        contentPadding = PaddingValues(16.dp)
    ) {
        // Daily Check-in Card
        item {
            DailyCheckInCard(
                checkIn = dailyCheckIn,
                onCheckIn = { viewModel.showDailyCheckIn() }
            )
        }
        
        // Course Categories
        courseCategories.forEach { category ->
            item {
                Text(
                    text = category.title.uppercase(),
                    color = Color.White.copy(alpha = 0.5f),
                    fontSize = 12.sp,
                    fontWeight = FontWeight.Bold,
                    letterSpacing = 1.sp,
                    modifier = Modifier.padding(vertical = 16.dp)
                )
            }
            
            items(category.courses) { course ->
                CourseCard(
                    course = course,
                    onClick = { onNavigateToCourse(course.id) }
                )
            }
        }
    }
}
```

### 5.6 Alexandria Module

**Features:**
- Gnostic library
- Forbidden gospels
- Mind defense
- History debugged
- Primary source texts
- Division deprogramming

```kotlin
// AlexandriaSection.kt
enum class AlexandriaSection(
    val title: String,
    val icon: ImageVector,
    val description: String
) {
    GNOSTIC_LIBRARY("Gnostic Library", Icons.Default.MenuBook, "Ancient wisdom texts"),
    FORBIDDEN_GOSPELS("Forbidden Gospels", Icons.Default.Lock, "Suppressed scriptures"),
    MIND_DEFENSE("Mind Defense", Icons.Default.Shield, "Protect your consciousness"),
    HISTORY_DEBUGGED("History Debugged", Icons.Default.BugReport, "What really happened"),
    PRIMARY_SOURCES("Primary Sources", Icons.Default.Source, "Original documents")
}

// AlexandriaScreen.kt
@Composable
fun AlexandriaScreen(
    viewModel: AlexandriaViewModel = hiltViewModel(),
    onNavigateToSection: (AlexandriaSection) -> Unit
) {
    LazyVerticalGrid(
        columns = GridCells.Fixed(2),
        modifier = Modifier
            .fillMaxSize()
            .background(Palette.cosmicGradient),
        contentPadding = PaddingValues(16.dp),
        horizontalArrangement = Arrangement.spacedBy(12.dp),
        verticalArrangement = Arrangement.spacedBy(12.dp)
    ) {
        items(AlexandriaSection.entries) { section ->
            AlexandriaSectionCard(
                section = section,
                onClick = { onNavigateToSection(section) }
            )
        }
    }
}

@Composable
fun AlexandriaSectionCard(
    section: AlexandriaSection,
    onClick: () -> Unit
) {
    Card(
        modifier = Modifier
            .fillMaxWidth()
            .aspectRatio(1f)
            .clickable(onClick = onClick),
        colors = CardDefaults.cardColors(
            containerColor = Color.White.copy(alpha = 0.05f)
        ),
        shape = RoundedCornerShape(16.dp)
    ) {
        Column(
            modifier = Modifier
                .fillMaxSize()
                .padding(16.dp),
            verticalArrangement = Arrangement.Center,
            horizontalAlignment = Alignment.CenterHorizontally
        ) {
            Icon(
                imageVector = section.icon,
                contentDescription = null,
                tint = Palette.Accent.gold,
                modifier = Modifier.size(48.dp)
            )
            Spacer(modifier = Modifier.height(12.dp))
            Text(
                text = section.title,
                color = Color.White,
                fontSize = 16.sp,
                fontWeight = FontWeight.Bold,
                textAlign = TextAlign.Center
            )
            Spacer(modifier = Modifier.height(4.dp))
            Text(
                text = section.description,
                color = Color.White.copy(alpha = 0.6f),
                fontSize = 12.sp,
                textAlign = TextAlign.Center
            )
        }
    }
}
```

### 5.7 GodMode Module

**Features:**
- Etymology course (word spells)
- Esoteric courses
- Hermetic principles
- Kybalion mastery
- 3-6-9 encoder
- Monad forge
- Gnostic texts
- Chosen one oracle

```kotlin
// GodModeScreen.kt
@Composable
fun GodModeHubScreen(
    viewModel: GodModeViewModel = hiltViewModel(),
    onNavigateToTool: (GodModeTool) -> Unit,
    onNavigateToCourse: (String) -> Unit
) {
    val isUnlocked by viewModel.isGodModeUnlocked.collectAsState()
    
    if (!isUnlocked) {
        GodModeLockedScreen(onUnlock = { viewModel.attemptUnlock() })
        return
    }
    
    LazyColumn(
        modifier = Modifier
            .fillMaxSize()
            .background(
                Brush.verticalGradient(
                    colors = listOf(
                        Color(0xFF1a0a2a),
                        Color(0xFF0a0a1a),
                        Color(0xFF2a1a0a)
                    )
                )
            ),
        contentPadding = PaddingValues(16.dp)
    ) {
        // Header
        item {
            GodModeHeader()
        }
        
        // Courses Section
        item {
            SectionHeader("ESOTERIC COURSES")
        }
        
        item {
            GodModeCourseCard(
                title = "Etymology: Word Spells",
                description = "Master the hidden power of language",
                progress = viewModel.etymologyProgress,
                onClick = { onNavigateToCourse("godmode_etymology") }
            )
        }
        
        item {
            GodModeCourseCard(
                title = "GodMode Esoteric",
                description = "Advanced consciousness training",
                progress = viewModel.esotericProgress,
                onClick = { onNavigateToCourse("godmode_esoteric") }
            )
        }
        
        // Tools Section
        item {
            SectionHeader("DIVINE TOOLS")
        }
        
        items(GodModeTool.entries) { tool ->
            GodModeToolCard(
                tool = tool,
                onClick = { onNavigateToTool(tool) }
            )
        }
    }
}

enum class GodModeTool(
    val title: String,
    val description: String,
    val icon: String
) {
    THREE_SIX_NINE("3-6-9 Encoder", "Tesla's vortex mathematics", "looks_3"),
    MONAD_FORGE("Monad Forge", "Create reality through intention", "auto_fix_high"),
    HERMETIC_PRINCIPLES("Hermetic Principles", "The 7 laws of the universe", "balance"),
    KYBALION("Kybalion Mastery", "Ancient wisdom decoded", "menu_book"),
    CHOSEN_ORACLE("Chosen One Oracle", "Divine guidance system", "visibility"),
    GNOSTIC_TEXTS("Gnostic Texts", "Hidden scriptures revealed", "library_books")
}
```

### 5.8 Profile Module

**Features:**
- User profile header
- Stats display
- Achievement showcase
- Badge collection link
- Settings access
- Progress visualization

```kotlin
// ProfileScreen.kt
@Composable
fun ProfileScreen(
    viewModel: ProfileViewModel = hiltViewModel(),
    onNavigateToBadges: () -> Unit,
    onNavigateToSettings: () -> Unit,
    onSignOut: () -> Unit
) {
    val user by viewModel.user.collectAsState()
    val stats by viewModel.stats.collectAsState()
    val recentBadges by viewModel.recentBadges.collectAsState()
    
    LazyColumn(
        modifier = Modifier
            .fillMaxSize()
            .background(Palette.cosmicGradient),
        contentPadding = PaddingValues(16.dp)
    ) {
        // Profile Header
        item {
            ProfileHeaderSection(
                user = user,
                journeyType = viewModel.journeyType
            )
        }
        
        // Stats Cards
        item {
            StatsGrid(stats = stats)
        }
        
        // Recent Badges
        item {
            RecentBadgesSection(
                badges = recentBadges,
                onViewAll = onNavigateToBadges
            )
        }
        
        // Menu Items
        item {
            ProfileMenuItem(
                icon = Icons.Default.Settings,
                title = "Settings",
                onClick = onNavigateToSettings
            )
        }
        
        item {
            ProfileMenuItem(
                icon = Icons.Default.Logout,
                title = "Sign Out",
                onClick = onSignOut,
                tint = Color.Red
            )
        }
    }
}

@Composable
fun StatsGrid(stats: ProgressStats) {
    val statItems = listOf(
        StatItem("🔥", stats.currentStreak.toString(), "Day Streak"),
        StatItem("📚", stats.coursesCompleted.toString(), "Courses"),
        StatItem("✅", stats.lessonsCompleted.toString(), "Lessons"),
        StatItem("🧘", "${stats.totalPracticeMinutes}m", "Practice")
    )
    
    LazyVerticalGrid(
        columns = GridCells.Fixed(2),
        horizontalArrangement = Arrangement.spacedBy(12.dp),
        verticalArrangement = Arrangement.spacedBy(12.dp),
        modifier = Modifier.height(200.dp)
    ) {
        items(statItems) { item ->
            StatCard(item)
        }
    }
}
```

### 5.9 More/Settings Module

**Features:**
- Settings (notifications, appearance, privacy)
- Security settings (biometric, PIN)
- About Aperture
- FAQ
- Legal documents
- Feature flags (debug)

```kotlin
// MoreScreen.kt
@Composable
fun MoreScreen(
    onNavigateToSettings: () -> Unit,
    onNavigateToSecurity: () -> Unit,
    onNavigateToAbout: () -> Unit,
    onNavigateToFAQ: () -> Unit,
    onNavigateToAlexandria: () -> Unit,
    onNavigateToGodMode: () -> Unit
) {
    LazyColumn(
        modifier = Modifier
            .fillMaxSize()
            .background(Palette.cosmicGradient),
        contentPadding = PaddingValues(16.dp)
    ) {
        // Quick Links
        item {
            SectionHeader("EXPLORE")
        }
        
        item {
            MoreMenuCard(
                icon = Icons.Default.LocalLibrary,
                title = "Alexandria",
                subtitle = "Primary sources & texts",
                onClick = onNavigateToAlexandria
            )
        }
        
        item {
            MoreMenuCard(
                icon = Icons.Default.Bolt,
                title = "GodMode",
                subtitle = "Advanced esoteric training",
                onClick = onNavigateToGodMode
            )
        }
        
        // Settings Section
        item {
            SectionHeader("SETTINGS")
        }
        
        item {
            MoreMenuCard(
                icon = Icons.Default.Settings,
                title = "Settings",
                subtitle = "Notifications, appearance",
                onClick = onNavigateToSettings
            )
        }
        
        item {
            MoreMenuCard(
                icon = Icons.Default.Security,
                title = "Security",
                subtitle = "Biometric, PIN protection",
                onClick = onNavigateToSecurity
            )
        }
        
        // Info Section
        item {
            SectionHeader("INFO")
        }
        
        item {
            MoreMenuCard(
                icon = Icons.Default.Info,
                title = "About Aperture",
                onClick = onNavigateToAbout
            )
        }
        
        item {
            MoreMenuCard(
                icon = Icons.Default.Help,
                title = "FAQ",
                onClick = onNavigateToFAQ
            )
        }
    }
}
```

---

## 6. DATA MODELS

### 6.1 User Model

```kotlin
@Serializable
data class User(
    val id: String,
    val email: String,
    val displayName: String?,
    val photoUrl: String?,
    val createdAt: Long,
    val journeyType: UserJourneyType?,
    val isPremium: Boolean = false,
    val premiumExpiresAt: Long? = null
)
```

### 6.2 Course Models

```kotlin
@Serializable
data class Course(
    val id: String,
    val title: String,
    val description: String,
    val category: CourseCategory,
    val modules: List<CourseModule>,
    val totalLessons: Int,
    val estimatedMinutes: Int,
    val difficulty: CourseDifficulty,
    val isPremium: Boolean = false,
    val badgeShape: SacredGeometryShape? = null
)

@Serializable
data class CourseModule(
    val id: String,
    val title: String,
    val lessons: List<Lesson>
)

@Serializable
data class Lesson(
    val id: String,
    val title: String,
    val content: String,
    val practicePrompt: String?,
    val reflectionQuestions: List<String>,
    val estimatedMinutes: Int,
    val badgeShape: SacredGeometryShape? = null
)

enum class CourseCategory {
    CONSCIOUSNESS,
    ESOTERIC,
    HISTORY,
    POLITICS,
    MEDIA,
    FINANCIAL,
    HEALTH,
    SPIRITUAL
}

enum class CourseDifficulty {
    BEGINNER,
    INTERMEDIATE,
    ADVANCED,
    MASTER
}
```

### 6.3 Achievement Model

```kotlin
@Serializable
data class Achievement(
    val id: String,
    val title: String,
    val description: String,
    val icon: String,
    val category: AchievementCategory,
    val requirement: AchievementRequirement,
    val unlockedAt: Long? = null
) {
    val isUnlocked: Boolean get() = unlockedAt != null
}

enum class AchievementCategory {
    STREAK,
    COURSES,
    PRACTICE,
    EXPLORATION,
    SPECIAL
}

@Serializable
sealed class AchievementRequirement {
    @Serializable
    data class StreakDays(val days: Int) : AchievementRequirement()
    @Serializable
    data class CoursesCompleted(val count: Int) : AchievementRequirement()
    @Serializable
    data class LessonsCompleted(val count: Int) : AchievementRequirement()
    @Serializable
    data class PracticeMinutes(val minutes: Int) : AchievementRequirement()
    @Serializable
    data class SpecificCourse(val courseId: String) : AchievementRequirement()
}
```

---

## 7. UI COMPONENTS

### 7.1 Cosmic Background

```kotlin
@Composable
fun CosmicBackground(
    modifier: Modifier = Modifier,
    content: @Composable () -> Unit
) {
    Box(
        modifier = modifier
            .fillMaxSize()
            .background(
                Brush.verticalGradient(
                    colors = listOf(
                        Palette.cosmicBlack,
                        Palette.cosmicPurple,
                        Palette.deepSpace
                    )
                )
            )
    ) {
        // Animated stars overlay
        StarField()
        content()
    }
}

@Composable
fun StarField() {
    val infiniteTransition = rememberInfiniteTransition(label = "stars")
    val alpha by infiniteTransition.animateFloat(
        initialValue = 0.3f,
        targetValue = 0.8f,
        animationSpec = infiniteRepeatable(
            animation = tween(2000),
            repeatMode = RepeatMode.Reverse
        ),
        label = "starAlpha"
    )
    
    Canvas(modifier = Modifier.fillMaxSize()) {
        // Draw random stars
        repeat(100) {
            val x = (it * 37 % size.width.toInt()).toFloat()
            val y = (it * 53 % size.height.toInt()).toFloat()
            val starAlpha = if (it % 3 == 0) alpha else 0.5f
            drawCircle(
                color = Color.White.copy(alpha = starAlpha),
                radius = if (it % 5 == 0) 2f else 1f,
                center = Offset(x, y)
            )
        }
    }
}
```

### 7.2 Cosmic Button

```kotlin
@Composable
fun CosmicButton(
    text: String,
    onClick: () -> Unit,
    modifier: Modifier = Modifier,
    enabled: Boolean = true,
    style: CosmicButtonStyle = CosmicButtonStyle.PRIMARY
) {
    val hapticManager = LocalHapticManager.current
    
    Button(
        onClick = {
            hapticManager.medium()
            onClick()
        },
        modifier = modifier
            .fillMaxWidth()
            .height(56.dp),
        enabled = enabled,
        colors = ButtonDefaults.buttonColors(
            containerColor = when (style) {
                CosmicButtonStyle.PRIMARY -> Palette.Accent.gold
                CosmicButtonStyle.SECONDARY -> Color.White.copy(alpha = 0.1f)
                CosmicButtonStyle.DANGER -> Color.Red.copy(alpha = 0.8f)
            },
            contentColor = when (style) {
                CosmicButtonStyle.PRIMARY -> Color.Black
                else -> Color.White
            },
            disabledContainerColor = Color.Gray.copy(alpha = 0.3f)
        ),
        shape = RoundedCornerShape(16.dp)
    ) {
        Text(
            text = text,
            fontWeight = FontWeight.Bold,
            fontSize = 16.sp
        )
    }
}

enum class CosmicButtonStyle {
    PRIMARY, SECONDARY, DANGER
}
```

### 7.3 Course Card

```kotlin
@Composable
fun CourseCard(
    course: Course,
    progress: Float = 0f,
    onClick: () -> Unit
) {
    Card(
        modifier = Modifier
            .fillMaxWidth()
            .clickable(onClick = onClick),
        colors = CardDefaults.cardColors(
            containerColor = Color.White.copy(alpha = 0.05f)
        ),
        shape = RoundedCornerShape(16.dp)
    ) {
        Column(
            modifier = Modifier.padding(16.dp)
        ) {
            Row(
                verticalAlignment = Alignment.CenterVertically
            ) {
                // Course icon/badge
                Box(
                    modifier = Modifier
                        .size(48.dp)
                        .background(
                            Palette.Accent.gold.copy(alpha = 0.2f),
                            CircleShape
                        ),
                    contentAlignment = Alignment.Center
                ) {
                    Icon(
                        imageVector = Icons.Default.MenuBook,
                        contentDescription = null,
                        tint = Palette.Accent.gold
                    )
                }
                
                Spacer(modifier = Modifier.width(12.dp))
                
                Column(modifier = Modifier.weight(1f)) {
                    Text(
                        text = course.title,
                        color = Color.White,
                        fontWeight = FontWeight.Bold,
                        fontSize = 16.sp
                    )
                    Text(
                        text = "${course.totalLessons} lessons • ${course.estimatedMinutes}min",
                        color = Color.White.copy(alpha = 0.6f),
                        fontSize = 12.sp
                    )
                }
                
                // Progress or arrow
                if (progress > 0) {
                    CircularProgressIndicator(
                        progress = { progress },
                        modifier = Modifier.size(32.dp),
                        color = Palette.Accent.gold,
                        strokeWidth = 3.dp
                    )
                } else {
                    Icon(
                        imageVector = Icons.Default.ChevronRight,
                        contentDescription = null,
                        tint = Color.White.copy(alpha = 0.5f)
                    )
                }
            }
            
            // Progress bar if started
            if (progress > 0) {
                Spacer(modifier = Modifier.height(12.dp))
                LinearProgressIndicator(
                    progress = { progress },
                    modifier = Modifier
                        .fillMaxWidth()
                        .height(4.dp)
                        .clip(RoundedCornerShape(2.dp)),
                    color = Palette.Accent.gold,
                    trackColor = Color.White.copy(alpha = 0.1f)
                )
            }
        }
    }
}
```

### 7.4 Loading Overlay

```kotlin
@Composable
fun LoadingOverlay(
    isVisible: Boolean,
    message: String = "Loading..."
) {
    AnimatedVisibility(
        visible = isVisible,
        enter = fadeIn(),
        exit = fadeOut()
    ) {
        Box(
            modifier = Modifier
                .fillMaxSize()
                .background(Color.Black.copy(alpha = 0.7f))
                .clickable(enabled = false) { },
            contentAlignment = Alignment.Center
        ) {
            Column(
                horizontalAlignment = Alignment.CenterHorizontally
            ) {
                CircularProgressIndicator(
                    color = Palette.Accent.gold
                )
                Spacer(modifier = Modifier.height(16.dp))
                Text(
                    text = message,
                    color = Color.White,
                    fontSize = 14.sp
                )
            }
        }
    }
}
```

---

## 8. COURSE SYSTEM

### 8.1 Complete Course List

The iOS app contains **50+ courses** organized into categories. Each must be implemented:

#### Consciousness & Awakening
- ConsciousnessCourse
- AwakeningEssentials
- MirrorPrinciple
- RationalAwakening
- SimulationTheory
- LevelsOfThinking
- MandelaEffects
- PatternRecognition

#### GodMode Courses
- EtymologyCourse (Word Spells)
- GodModeEsotericCourse
- HermeticPrinciples
- KybalionMastery

#### Spiritual/Esoteric
- EmeraldTablets
- ThothConsciousness
- SerpentDecoded
- DragonBallAwakening
- SaintSeiya
- BuddhaMeditation
- DivineFeminine
- SophiaAwakening
- CouncilOfNicaea
- BibleDecoded
- EgyptYeshua
- Demiurge
- SacredGeometry
- ZodiacConnection
- BirthChart
- PlanetaryCycles
- UjatCode

#### Political/History
- TrueAmericanHistory
- IsraelPalestineHistory
- PalestineHistory
- ZionismAndIsraelHistory
- USForeignPolicyExposed
- LeftRightProgramming
- ElectionsExposed
- AmericanDreamExposed
- HeritageFoundationExposed
- KnowYourRights

#### Media/Institutional
- CorporateMediaExposed
- TVNewsExposed
- IndependentMediaGuide
- EducationExposed
- CollegeIndustrialComplex
- FoodIndustryExposed
- CatholicChurchExpose
- ColonialChristianity

#### Specialized
- PsyopDetection
- SystemsOfControl
- MasterLies (4 parts)
- InstitutionalLies
- CorporationsExposed
- RaceLie
- LGBTQTruth
- ProLifeExpose
- FinancialLiteracy
- CryptoCourse
- StockMarket
- AntiScam
- WordSpells
- Recursion
- ArrowOfTime
- AIConsciousness
- QuantumPhysics
- EleventhDimension
- AwakeningThroughCode
- ScamsExposed
- Paradoxes
- MatrixSystem
- LivingName
- SolarSovereignty

### 8.2 Course Content Structure

Each course follows this structure:

```kotlin
data class CourseContent(
    val id: String,
    val title: String,
    val description: String,
    val modules: List<ModuleContent>
)

data class ModuleContent(
    val id: String,
    val title: String,
    val lessons: List<LessonContent>
)

data class LessonContent(
    val id: String,
    val title: String,
    val sections: List<ContentSection>,
    val practicePrompt: String?,
    val reflectionQuestions: List<String>,
    val sources: List<Source>?,
    val badgeId: String? // Maps to sacred geometry
)

sealed class ContentSection {
    data class Text(val content: String) : ContentSection()
    data class Quote(val text: String, val attribution: String?) : ContentSection()
    data class BulletList(val items: List<String>) : ContentSection()
    data class NumberedList(val items: List<String>) : ContentSection()
    data class Callout(val type: CalloutType, val content: String) : ContentSection()
    data class Image(val url: String, val caption: String?) : ContentSection()
}

enum class CalloutType {
    INFO, WARNING, TIP, IMPORTANT
}
```

---

## 9. SACRED GEOMETRY BADGE SYSTEM

### 9.1 Sacred Geometry Shapes

```kotlin
enum class SacredGeometryShape(
    val displayName: String,
    val complexity: Int,
    val gnosticMeaning: String
) {
    VESICA_PISCIS(
        "Vesica Piscis", 1,
        "The womb of creation. Where two circles intersect, new reality is born."
    ),
    SEED_OF_LIFE(
        "Seed of Life", 1,
        "The seven days of creation encoded in geometry."
    ),
    FLOWER_OF_LIFE(
        "Flower of Life", 3,
        "The blueprint of the universe. All forms emerge from this pattern."
    ),
    HEXAGRAM(
        "Hexagram", 2,
        "As above, so below. The union of masculine and feminine."
    ),
    METATRONS_CUBE(
        "Metatron's Cube", 5,
        "The throne of God. Contains all Platonic solids."
    ),
    INFINITY_LOOP(
        "Infinity Loop", 1,
        "The eternal return. No beginning, no end."
    ),
    TETRAHEDRON(
        "Tetrahedron", 2,
        "Fire element. Divine masculine energy and willpower."
    ),
    HEXAHEDRON(
        "Hexahedron", 2,
        "Earth element. Stability and foundation."
    ),
    OCTAHEDRON(
        "Octahedron", 3,
        "Air element. Bridge between physical and spiritual."
    ),
    ICOSAHEDRON(
        "Icosahedron", 4,
        "Water element. Emotional fluidity and flow state."
    ),
    DODECAHEDRON(
        "Dodecahedron", 4,
        "Ether/Spirit element. The universe container."
    ),
    TORUS(
        "Torus", 3,
        "The shape of the universe. Energy flows in and transforms."
    ),
    GOLDEN_SPIRAL(
        "Golden Spiral", 4,
        "The fingerprint of God. Pattern of natural growth."
    ),
    TREE_OF_LIFE(
        "Tree of Life", 5,
        "The map of consciousness. Ten spheres, 22 paths."
    ),
    SRI_YANTRA(
        "Sri Yantra", 6,
        "The supreme yantra. The cosmos in geometry."
    ),
    MERKABA_FIELD(
        "Merkaba Field", 5,
        "The light body vehicle. Dimensional travel activated."
    ),
    COSMIC_EGG(
        "Cosmic Egg", 7,
        "The primordial form. All potential before manifestation."
    ),
    YANTRA_64(
        "64 Tetrahedron", 7,
        "The structure of the vacuum. Unified field geometry."
    ),
    PLATONIC_SOLIDS(
        "Platonic Solids", 6,
        "The five perfect forms. Building blocks of reality."
    );
}
```

### 9.2 Badge Data Model

```kotlin
@Serializable
data class SacredBadge(
    val id: String,
    val shape: SacredGeometryShape,
    val lessonId: String,
    val lessonTitle: String,
    val courseId: String,
    val earnedDate: Long,
    val customColors: BadgeCustomColors? = null
)

@Serializable
data class BadgeCustomColors(
    val lineColorHex: String = "#FFD700",
    val backgroundColorHex: String = "#0a0a1a",
    val glowColorHex: String = "#7C4DFF"
)
```

### 9.3 Badge Manager

```kotlin
@Singleton
class SacredBadgeManager @Inject constructor(
    private val dataStore: DataStore<Preferences>,
    private val notificationManager: ApertureNotificationManager
) {
    private val _earnedBadges = MutableStateFlow<List<SacredBadge>>(emptyList())
    val earnedBadges: StateFlow<List<SacredBadge>> = _earnedBadges.asStateFlow()
    
    private val _recentlyEarnedBadge = MutableStateFlow<SacredBadge?>(null)
    val recentlyEarnedBadge: StateFlow<SacredBadge?> = _recentlyEarnedBadge.asStateFlow()
    
    val totalBadgeCount: Int get() = _earnedBadges.value.size
    
    fun uniqueShapesEarned(): Set<SacredGeometryShape> =
        _earnedBadges.value.map { it.shape }.toSet()
    
    suspend fun awardBadge(
        lessonId: String,
        lessonTitle: String,
        courseId: String
    ) {
        val shape = CourseGeometryMapping.geometry(lessonId)
        val badge = SacredBadge(
            id = UUID.randomUUID().toString(),
            shape = shape,
            lessonId = lessonId,
            lessonTitle = lessonTitle,
            courseId = courseId,
            earnedDate = System.currentTimeMillis()
        )
        
        _earnedBadges.value = _earnedBadges.value + badge
        _recentlyEarnedBadge.value = badge
        save()
        
        notificationManager.showBadgeEarned(badge)
    }
    
    fun updateBadgeColors(badgeId: String, colors: BadgeCustomColors) {
        _earnedBadges.value = _earnedBadges.value.map { badge ->
            if (badge.id == badgeId) badge.copy(customColors = colors)
            else badge
        }
        // Save updated badges
    }
    
    fun clearRecentBadge() {
        _recentlyEarnedBadge.value = null
    }
}
```

### 9.4 Course-to-Geometry Mapping

```kotlin
object CourseGeometryMapping {
    
    private val etymologyMappings = mapOf(
        "etym0_1" to SacredGeometryShape.VESICA_PISCIS,
        "etym0_2" to SacredGeometryShape.METATRONS_CUBE,
        "etym0_3" to SacredGeometryShape.FLOWER_OF_LIFE,
        "etym1_1" to SacredGeometryShape.SRI_YANTRA,
        "etym1_2" to SacredGeometryShape.TETRAHEDRON,
        "etym1_3" to SacredGeometryShape.TREE_OF_LIFE,
        "etym2_1" to SacredGeometryShape.ICOSAHEDRON,
        "etym2_2" to SacredGeometryShape.SEED_OF_LIFE,
        "etym2_3" to SacredGeometryShape.MERKABA_FIELD,
        "etym3_1" to SacredGeometryShape.OCTAHEDRON,
        "etym3_2" to SacredGeometryShape.DODECAHEDRON,
        "etym4_1" to SacredGeometryShape.TORUS,
        "etym4_2" to SacredGeometryShape.HEXAGRAM,
        "etym5_1" to SacredGeometryShape.SRI_YANTRA,
        "etym5_2" to SacredGeometryShape.COSMIC_EGG
    )
    
    private val godModeMappings = mapOf(
        "gm0_1" to SacredGeometryShape.SEED_OF_LIFE,
        "gm0_2" to SacredGeometryShape.VESICA_PISCIS,
        "gm0_3" to SacredGeometryShape.TETRAHEDRON,
        "gm1_1" to SacredGeometryShape.FLOWER_OF_LIFE,
        "gm1_2" to SacredGeometryShape.HEXAGRAM,
        "gm1_3" to SacredGeometryShape.TORUS,
        "gm2_1" to SacredGeometryShape.OCTAHEDRON,
        "gm2_2" to SacredGeometryShape.ICOSAHEDRON,
        "gm2_3" to SacredGeometryShape.METATRONS_CUBE,
        "gm3_1" to SacredGeometryShape.SRI_YANTRA,
        "gm3_2" to SacredGeometryShape.TREE_OF_LIFE,
        "gm4_1" to SacredGeometryShape.MERKABA_FIELD,
        "gm4_2" to SacredGeometryShape.DODECAHEDRON,
        "gm5_1" to SacredGeometryShape.GOLDEN_SPIRAL,
        "gm5_2" to SacredGeometryShape.YANTRA_64,
        "gm6_1" to SacredGeometryShape.PLATONIC_SOLIDS,
        "gm6_2" to SacredGeometryShape.COSMIC_EGG
    )
    
    fun geometry(lessonId: String): SacredGeometryShape {
        return etymologyMappings[lessonId]
            ?: godModeMappings[lessonId]
            ?: run {
                // Deterministic fallback based on hash
                val hash = abs(lessonId.hashCode())
                SacredGeometryShape.entries[hash % SacredGeometryShape.entries.size]
            }
    }
    
    fun completionGeometry(courseId: String): SacredGeometryShape {
        return when (courseId) {
            "godmode_etymology" -> SacredGeometryShape.COSMIC_EGG
            "godmode_esoteric" -> SacredGeometryShape.COSMIC_EGG
            "consciousness_course" -> SacredGeometryShape.FLOWER_OF_LIFE
            "pattern_recognition" -> SacredGeometryShape.METATRONS_CUBE
            "psyop_detection" -> SacredGeometryShape.SRI_YANTRA
            else -> SacredGeometryShape.SEED_OF_LIFE
        }
    }
}
```

### 9.5 Sacred Geometry Drawing (Canvas)

```kotlin
@Composable
fun SacredGeometryView(
    shape: SacredGeometryShape,
    lineColor: Color = Palette.Accent.gold,
    lineWidth: Float = 2f,
    modifier: Modifier = Modifier
) {
    Canvas(modifier = modifier) {
        val center = Offset(size.width / 2, size.height / 2)
        val radius = minOf(size.width, size.height) / 2 * 0.8f
        
        when (shape) {
            SacredGeometryShape.VESICA_PISCIS -> drawVesicaPiscis(center, radius, lineColor, lineWidth)
            SacredGeometryShape.SEED_OF_LIFE -> drawSeedOfLife(center, radius, lineColor, lineWidth)
            SacredGeometryShape.FLOWER_OF_LIFE -> drawFlowerOfLife(center, radius, lineColor, lineWidth)
            SacredGeometryShape.HEXAGRAM -> drawHexagram(center, radius, lineColor, lineWidth)
            SacredGeometryShape.INFINITY_LOOP -> drawInfinityLoop(center, radius, lineColor, lineWidth)
            SacredGeometryShape.TETRAHEDRON -> drawTetrahedron(center, radius, lineColor, lineWidth)
            SacredGeometryShape.TORUS -> drawTorus(center, radius, lineColor, lineWidth)
            SacredGeometryShape.GOLDEN_SPIRAL -> drawGoldenSpiral(center, radius, lineColor, lineWidth)
            SacredGeometryShape.TREE_OF_LIFE -> drawTreeOfLife(center, radius, lineColor, lineWidth)
            SacredGeometryShape.MERKABA_FIELD -> drawMerkaba(center, radius, lineColor, lineWidth)
            // ... implement all shapes
            else -> drawCircle(lineColor, radius, center, style = Stroke(lineWidth))
        }
    }
}

private fun DrawScope.drawVesicaPiscis(
    center: Offset,
    radius: Float,
    color: Color,
    strokeWidth: Float
) {
    val offset = radius * 0.5f
    drawCircle(color, radius, Offset(center.x - offset, center.y), style = Stroke(strokeWidth))
    drawCircle(color, radius, Offset(center.x + offset, center.y), style = Stroke(strokeWidth))
}

private fun DrawScope.drawSeedOfLife(
    center: Offset,
    radius: Float,
    color: Color,
    strokeWidth: Float
) {
    // Center circle
    drawCircle(color, radius * 0.5f, center, style = Stroke(strokeWidth))
    
    // 6 surrounding circles
    for (i in 0 until 6) {
        val angle = Math.toRadians(i * 60.0)
        val x = center.x + (radius * 0.5f * cos(angle)).toFloat()
        val y = center.y + (radius * 0.5f * sin(angle)).toFloat()
        drawCircle(color, radius * 0.5f, Offset(x, y), style = Stroke(strokeWidth))
    }
}

private fun DrawScope.drawFlowerOfLife(
    center: Offset,
    radius: Float,
    color: Color,
    strokeWidth: Float
) {
    val smallRadius = radius / 3
    
    // Draw multiple layers of circles
    drawCircle(color, smallRadius, center, style = Stroke(strokeWidth))
    
    // First ring - 6 circles
    for (i in 0 until 6) {
        val angle = Math.toRadians(i * 60.0)
        val x = center.x + (smallRadius * cos(angle)).toFloat()
        val y = center.y + (smallRadius * sin(angle)).toFloat()
        drawCircle(color, smallRadius, Offset(x, y), style = Stroke(strokeWidth))
    }
    
    // Second ring - 12 circles
    for (i in 0 until 12) {
        val angle = Math.toRadians(i * 30.0)
        val dist = smallRadius * sqrt(3f)
        val x = center.x + (dist * cos(angle)).toFloat()
        val y = center.y + (dist * sin(angle)).toFloat()
        drawCircle(color, smallRadius, Offset(x, y), style = Stroke(strokeWidth))
    }
}

private fun DrawScope.drawHexagram(
    center: Offset,
    radius: Float,
    color: Color,
    strokeWidth: Float
) {
    // Upward triangle
    val upPath = Path().apply {
        val top = Offset(center.x, center.y - radius)
        val bottomLeft = Offset(center.x - radius * 0.866f, center.y + radius * 0.5f)
        val bottomRight = Offset(center.x + radius * 0.866f, center.y + radius * 0.5f)
        moveTo(top.x, top.y)
        lineTo(bottomLeft.x, bottomLeft.y)
        lineTo(bottomRight.x, bottomRight.y)
        close()
    }
    drawPath(upPath, color, style = Stroke(strokeWidth))
    
    // Downward triangle
    val downPath = Path().apply {
        val bottom = Offset(center.x, center.y + radius)
        val topLeft = Offset(center.x - radius * 0.866f, center.y - radius * 0.5f)
        val topRight = Offset(center.x + radius * 0.866f, center.y - radius * 0.5f)
        moveTo(bottom.x, bottom.y)
        lineTo(topLeft.x, topLeft.y)
        lineTo(topRight.x, topRight.y)
        close()
    }
    drawPath(downPath, color, style = Stroke(strokeWidth))
}
```

### 9.6 Badge Collection UI

```kotlin
@Composable
fun BadgeCollectionScreen(
    viewModel: BadgeCollectionViewModel = hiltViewModel(),
    onBadgeClick: (SacredBadge) -> Unit
) {
    val badges by viewModel.badges.collectAsState()
    val stats by viewModel.stats.collectAsState()
    
    LazyColumn(
        modifier = Modifier
            .fillMaxSize()
            .background(Palette.cosmicGradient),
        contentPadding = PaddingValues(16.dp)
    ) {
        // Stats header
        item {
            BadgeStatsHeader(
                totalBadges = stats.totalBadges,
                uniqueShapes = stats.uniqueShapes,
                coursesCompleted = stats.coursesCompleted
            )
        }
        
        // Badges grid
        item {
            LazyVerticalGrid(
                columns = GridCells.Fixed(3),
                horizontalArrangement = Arrangement.spacedBy(12.dp),
                verticalArrangement = Arrangement.spacedBy(12.dp),
                modifier = Modifier.height((badges.size / 3 + 1) * 140.dp)
            ) {
                items(badges) { badge ->
                    BadgeCard(
                        badge = badge,
                        onClick = { onBadgeClick(badge) }
                    )
                }
            }
        }
    }
}

@Composable
fun BadgeCard(
    badge: SacredBadge,
    onClick: () -> Unit
) {
    val colors = badge.customColors ?: BadgeCustomColors()
    
    Card(
        modifier = Modifier
            .aspectRatio(1f)
            .clickable(onClick = onClick),
        colors = CardDefaults.cardColors(
            containerColor = Color(android.graphics.Color.parseColor(colors.backgroundColorHex))
        ),
        shape = RoundedCornerShape(16.dp)
    ) {
        Box(
            modifier = Modifier.fillMaxSize(),
            contentAlignment = Alignment.Center
        ) {
            // Glow effect
            Box(
                modifier = Modifier
                    .size(80.dp)
                    .background(
                        Brush.radialGradient(
                            colors = listOf(
                                Color(android.graphics.Color.parseColor(colors.glowColorHex)).copy(alpha = 0.4f),
                                Color.Transparent
                            )
                        ),
                        CircleShape
                    )
            )
            
            // Sacred geometry
            SacredGeometryView(
                shape = badge.shape,
                lineColor = Color(android.graphics.Color.parseColor(colors.lineColorHex)),
                lineWidth = 2f,
                modifier = Modifier.size(60.dp)
            )
        }
    }
}
```

### 9.7 Badge Detail/Customization Screen

```kotlin
@Composable
fun BadgeDetailScreen(
    badge: SacredBadge,
    viewModel: BadgeDetailViewModel = hiltViewModel(),
    onSaveImage: () -> Unit,
    onShare: () -> Unit
) {
    var lineColor by remember { mutableStateOf(
        Color(android.graphics.Color.parseColor(badge.customColors?.lineColorHex ?: "#FFD700"))
    )}
    var backgroundColor by remember { mutableStateOf(
        Color(android.graphics.Color.parseColor(badge.customColors?.backgroundColorHex ?: "#0a0a1a"))
    )}
    var glowColor by remember { mutableStateOf(
        Color(android.graphics.Color.parseColor(badge.customColors?.glowColorHex ?: "#7C4DFF"))
    )}
    
    LazyColumn(
        modifier = Modifier
            .fillMaxSize()
            .background(Palette.cosmicGradient),
        contentPadding = PaddingValues(16.dp),
        horizontalAlignment = Alignment.CenterHorizontally
    ) {
        // Large badge preview
        item {
            Box(
                modifier = Modifier
                    .size(280.dp)
                    .background(backgroundColor, RoundedCornerShape(24.dp)),
                contentAlignment = Alignment.Center
            ) {
                // Glow
                Box(
                    modifier = Modifier
                        .size(200.dp)
                        .background(
                            Brush.radialGradient(
                                colors = listOf(
                                    glowColor.copy(alpha = 0.5f),
                                    Color.Transparent
                                )
                            ),
                            CircleShape
                        )
                )
                
                SacredGeometryView(
                    shape = badge.shape,
                    lineColor = lineColor,
                    lineWidth = 3f,
                    modifier = Modifier.size(160.dp)
                )
            }
        }
        
        // Shape name and meaning
        item {
            Spacer(modifier = Modifier.height(24.dp))
            Text(
                text = badge.shape.displayName,
                color = Color.White,
                fontSize = 24.sp,
                fontWeight = FontWeight.Bold
            )
            Spacer(modifier = Modifier.height(8.dp))
            Text(
                text = badge.shape.gnosticMeaning,
                color = Color.White.copy(alpha = 0.7f),
                fontSize = 14.sp,
                textAlign = TextAlign.Center,
                modifier = Modifier.padding(horizontal = 16.dp)
            )
        }
        
        // Color customization
        item {
            Spacer(modifier = Modifier.height(32.dp))
            ColorCustomizationSection(
                lineColor = lineColor,
                onLineColorChange = { lineColor = it },
                backgroundColor = backgroundColor,
                onBackgroundColorChange = { backgroundColor = it },
                glowColor = glowColor,
                onGlowColorChange = { glowColor = it },
                onSave = {
                    viewModel.saveColors(
                        badge.id,
                        BadgeCustomColors(
                            lineColorHex = lineColor.toHex(),
                            backgroundColorHex = backgroundColor.toHex(),
                            glowColorHex = glowColor.toHex()
                        )
                    )
                }
            )
        }
        
        // Action buttons
        item {
            Spacer(modifier = Modifier.height(24.dp))
            Row(
                horizontalArrangement = Arrangement.spacedBy(16.dp)
            ) {
                CosmicButton(
                    text = "Save Image",
                    onClick = onSaveImage,
                    style = CosmicButtonStyle.SECONDARY,
                    modifier = Modifier.weight(1f)
                )
                CosmicButton(
                    text = "Share",
                    onClick = onShare,
                    modifier = Modifier.weight(1f)
                )
            }
        }
        
        // Earned info
        item {
            Spacer(modifier = Modifier.height(24.dp))
            EarnedInfoSection(
                lessonTitle = badge.lessonTitle,
                earnedDate = badge.earnedDate
            )
        }
    }
}

fun Color.toHex(): String {
    val red = (red * 255).toInt()
    val green = (green * 255).toInt()
    val blue = (blue * 255).toInt()
    return String.format("#%02X%02X%02X", red, green, blue)
}
```

---

## 10. IMPLEMENTATION CHECKLIST

### Phase 1: Foundation (Week 1-2)
- [ ] Project setup with Hilt DI
- [ ] Color palette and theme
- [ ] Base composables (CosmicBackground, CosmicButton, etc.)
- [ ] Navigation structure (Bottom nav + nested graphs)
- [ ] DataStore setup for persistence
- [ ] Haptic feedback manager

### Phase 2: Authentication (Week 2-3)
- [ ] Firebase Auth integration
- [ ] Email/password sign up & sign in
- [ ] Google Sign-In
- [ ] Biometric authentication
- [ ] Session management
- [ ] User model and storage

### Phase 3: Core Systems (Week 3-4)
- [ ] Progress tracker
- [ ] Streak tracker
- [ ] User journey store
- [ ] Onboarding flow
- [ ] Notification manager
- [ ] Deep link handler

### Phase 4: Main Modules (Week 4-6)
- [ ] Landing/Home screen
- [ ] Timeline module
- [ ] Cosmos module
- [ ] Awakening module (hub)
- [ ] Alexandria module
- [ ] Profile module
- [ ] More/Settings module

### Phase 5: Course System (Week 6-8)
- [ ] Course data models
- [ ] Course list screens
- [ ] Lesson view with sections
- [ ] Course progress tracking
- [ ] Practice prompts
- [ ] Reflection questions
- [ ] TTS integration for lessons

### Phase 6: Sacred Geometry (Week 8-9)
- [ ] All 20 geometry shapes (Canvas drawing)
- [ ] Badge data model
- [ ] Badge manager
- [ ] Course-to-geometry mapping
- [ ] Badge collection screen
- [ ] Badge detail/customization
- [ ] Image export (save to gallery)
- [ ] Share functionality

### Phase 7: Flow State (Week 9-10)
- [ ] Flow state manager
- [ ] Flow session UI
- [ ] Timer with phases
- [ ] Distraction tracking
- [ ] Session history
- [ ] Flow notifications

### Phase 8: GodMode (Week 10-11)
- [ ] GodMode hub
- [ ] Etymology course (all lessons)
- [ ] Esoteric course (all lessons)
- [ ] 3-6-9 encoder tool
- [ ] Monad forge tool
- [ ] Hermetic principles
- [ ] Kybalion mastery

### Phase 9: All Courses (Week 11-14)
- [ ] Implement all 50+ courses
- [ ] Course content migration from iOS
- [ ] Lesson completion badges
- [ ] Course completion badges

### Phase 10: Polish & Widgets (Week 14-15)
- [ ] App widget (Glance)
- [ ] App shortcuts/actions
- [ ] Animations and transitions
- [ ] Error handling
- [ ] Offline support
- [ ] Performance optimization

### Phase 11: Testing & Launch (Week 15-16)
- [ ] Unit tests for ViewModels
- [ ] UI tests for critical flows
- [ ] Beta testing
- [ ] Play Store listing
- [ ] Launch

---

## APPENDIX A: File Mapping (iOS → Android)

| iOS File | Android Equivalent |
|----------|-------------------|
| `Palette.swift` | `Palette.kt` |
| `HapticManager.swift` | `HapticManager.kt` |
| `AuthenticationManager.swift` | `AuthenticationManager.kt` |
| `BiometricAuth.swift` | `BiometricAuth.kt` |
| `ProgressTracker.swift` | `ProgressTracker.kt` |
| `StreakTracker.swift` | `StreakTracker.kt` |
| `UserJourneyStore.swift` | `UserJourneyStore.kt` |
| `FlowStateManager.swift` | `FlowStateManager.kt` |
| `NotificationManager.swift` | `ApertureNotificationManager.kt` |
| `DeepLinkHandler.swift` | `DeepLinkHandler.kt` |
| `TextToSpeechManager.swift` | `TextToSpeechManager.kt` |
| `SacredGeometryBadgeSystem.swift` | `SacredBadgeManager.kt` + `SacredGeometryShape.kt` |
| `RootTabView.swift` | `MainNavigation.kt` |
| `LandingView.swift` | `LandingScreen.kt` |
| `TimelineView.swift` | `TimelineScreen.kt` |
| `CosmosView.swift` | `CosmosScreen.kt` |
| `AwakeningView.swift` | `AwakeningScreen.kt` |
| `AlexandriaView.swift` | `AlexandriaScreen.kt` |
| `ProfileView.swift` | `ProfileScreen.kt` |
| `MoreView.swift` | `MoreScreen.kt` |
| `GodModeHubView.swift` | `GodModeHubScreen.kt` |
| `EtymologyCourseView.swift` | `EtymologyCourseScreen.kt` |
| `BadgeCollectionView.swift` | `BadgeCollectionScreen.kt` |
| `FlowStateView.swift` | `FlowStateScreen.kt` |

---

## APPENDIX B: Icon Mapping (SF Symbols → Material Icons)

| SF Symbol | Material Icon |
|-----------|--------------|
| `house.fill` | `Icons.Filled.Home` |
| `clock.fill` | `Icons.Filled.Schedule` |
| `globe` | `Icons.Filled.Public` |
| `figure.mind.and.body` | `Icons.Filled.SelfImprovement` |
| `ellipsis` | `Icons.Filled.MoreHoriz` |
| `book.fill` | `Icons.Filled.MenuBook` |
| `seal.fill` | `Icons.Filled.Verified` |
| `flame.fill` | `Icons.Filled.LocalFireDepartment` |
| `star.fill` | `Icons.Filled.Star` |
| `checkmark.seal.fill` | `Icons.Filled.CheckCircle` |
| `gear` | `Icons.Filled.Settings` |
| `person.fill` | `Icons.Filled.Person` |
| `lock.fill` | `Icons.Filled.Lock` |
| `infinity` | Custom drawable |
| `triangle` | Custom drawable |
| `hexagon` | Custom drawable |

---

**Document Complete**

This specification provides 100% feature parity guidance for Android implementation of Aperture. Follow the phases in order, and reference the iOS codebase for specific content (course text, lesson content, etc.) that needs to be migrated.
