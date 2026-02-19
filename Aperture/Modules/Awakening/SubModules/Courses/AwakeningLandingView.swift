// AwakeningLandingView.swift
// THE AWAKENING ACADEMY - Fully Navigable Course Hub with Sacred Geometry

import SwiftUI

// MARK: - Main View

struct AwakeningLandingView: View {
    
    @Environment(\.dismiss) private var dismiss
    @State private var rotation: Double = 0
    @State private var pulse: Double = 1.0
    
    var body: some View {
        NavigationStack {
            ZStack {
                // Deep cosmic background
                cosmicBackground
                
                // Sacred geometry layers
                sacredGeometryLayers
                
                // Stars (like auth)
                starsLayer
                
                // Floating particles
                floatingParticles
                
                ScrollView(showsIndicators: false) {
                    VStack(spacing: 24) {
                        
                        // Header
                        headerSection
                        
                        // SUNFLOW STATE - PREMIUM FEATURE
                        sunflowStateSection
                        
                        // DOCUMENTARIES (NEW - Top of list for discoverability)
                        documentariesSection
                        
                        // INSTITUTIONAL LIES - PRIMARY SOURCES
                        institutionalLiesSection
                        
                        // THE MATRIX EXPOSED
                        matrixExposedSection
                        
                        // RELIGION EXPOSED (NEW)
                        religionExposedSection
                        
                        // HIDDEN HISTORY
                        hiddenHistorySection
                        
                        // THE LIES EXPOSED
                        liesExposedSection
                        
                        // CONTROL SYSTEMS
                        controlSystemsSection
                        
                        // CONSCIOUSNESS
                        consciousnessSection
                        
                        // ANIME WISDOM
                        animeWisdomSection
                        
                        // SPIRITUAL TRADITIONS
                        spiritualTraditionsSection
                        
                        // Footer
                        footerSection
                        
                        Spacer(minLength: 100)
                    }
                    .padding(.horizontal, 20)
                    .padding(.top, 20)
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Text("SUNFLOW: REIGNITED")
                        .font(.system(size: 10, weight: .bold, design: .rounded))
                        .foregroundColor(Palette.accent.gold)
                        .tracking(2)
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: { dismiss() }) {
                        Image(systemName: "xmark")
                            .font(.system(size: 14, weight: .semibold))
                            .foregroundColor(.white)
                            .frame(width: 32, height: 32)
                            .background(Color.white.opacity(0.1))
                            .clipShape(Circle())
                    }
                }
            }
        }
        .onAppear {
            withAnimation(.linear(duration: 120).repeatForever(autoreverses: false)) {
                rotation = 360
            }
            withAnimation(.easeInOut(duration: 3).repeatForever(autoreverses: true)) {
                pulse = 1.1
            }
        }
    }
    
    // MARK: - Cosmic Background
    
    private var cosmicBackground: some View {
        LinearGradient(
            colors: [
                Color(hex: "#0a0a1a"),
                Color(hex: "#0d0d24"),
                Color(hex: "#12122e"),
                Color(hex: "#0a0a1a")
            ],
            startPoint: .top,
            endPoint: .bottom
        )
        .ignoresSafeArea()
    }
    
    // MARK: - Sacred Geometry Layers
    
    private var sacredGeometryLayers: some View {
        GeometryReader { geo in
            ZStack {
                // Flower of Life - large, behind everything
                FlowerOfLife()
                    .stroke(Color(hex: "#7C5CFF").opacity(0.08), lineWidth: 0.5)
                    .frame(width: geo.size.width * 1.5, height: geo.size.width * 1.5)
                    .position(x: geo.size.width / 2, y: geo.size.height * 0.3)
                    .rotationEffect(.degrees(rotation * 0.02))
                
                // Metatron's Cube - center
                AwakeningMetatronsCubeShape()
                    .stroke(Color(hex: "#00D9FF").opacity(0.06), lineWidth: 0.5)
                    .frame(width: 300, height: 300)
                    .position(x: geo.size.width / 2, y: geo.size.height * 0.5)
                    .rotationEffect(.degrees(-rotation * 0.03))
                
                // Sri Yantra triangles - lower
                AwakeningLandingSriYantraShape()
                    .stroke(Color(hex: "#FFD700").opacity(0.05), lineWidth: 0.5)
                    .frame(width: 250, height: 250)
                    .position(x: geo.size.width / 2, y: geo.size.height * 0.75)
                    .rotationEffect(.degrees(rotation * 0.01))
                    .scaleEffect(pulse)
            }
        }
    }
    
    // MARK: - Stars Layer (like Auth)
    
    private var starsLayer: some View {
        GeometryReader { geo in
            ForEach(0..<150, id: \.self) { i in
                Circle()
                    .fill(Color.white)
                    .frame(width: CGFloat(i % 3 + 1))
                    .position(
                        x: CGFloat((i * 31 + 17) % max(1, Int(geo.size.width))),
                        y: CGFloat((i * 47 + 23) % max(1, Int(geo.size.height)))
                    )
                    .opacity(Double(i % 5) * 0.15 + 0.1)
            }
        }
    }
    
    // MARK: - Floating Particles
    
    private var floatingParticles: some View {
        GeometryReader { geo in
            ForEach(0..<30, id: \.self) { i in
                Circle()
                    .fill(
                        [Color(hex: "#7C5CFF"), Color(hex: "#00D9FF"), Color(hex: "#FFD700"), Color(hex: "#E040FB")][i % 4]
                    )
                    .frame(width: CGFloat(i % 4 + 2))
                    .position(
                        x: CGFloat((i * 43 + 11) % max(1, Int(geo.size.width))),
                        y: CGFloat((i * 67 + 29) % max(1, Int(geo.size.height)))
                    )
                    .opacity(0.4)
                    .blur(radius: 1)
            }
        }
    }
    
    // MARK: - Header
    
    private var headerSection: some View {
        VStack(spacing: 16) {
            // Dragon with glow
            ZStack {
                Circle()
                    .fill(
                        RadialGradient(
                            colors: [Palette.accent.gold.opacity(0.4), Color.clear],
                            center: .center,
                            startRadius: 10,
                            endRadius: 60
                        )
                    )
                    .frame(width: 120, height: 120)
                    .scaleEffect(pulse)
                
                Text("🐉")
                    .font(.system(size: 60))
            }
            
            Text("Awakening Academy")
                .font(.system(size: 28, weight: .black, design: .rounded))
                .foregroundColor(.white)
            
            Text("The truth they don't want you to know")
                .font(.system(size: 14, weight: .medium))
                .foregroundColor(Palette.text.secondary)
            
            // Sacred geometry divider
            HStack(spacing: 8) {
                Rectangle().fill(Color(hex: "#7C5CFF").opacity(0.5)).frame(height: 1)
                Image(systemName: "star.fill")
                    .font(.system(size: 8))
                    .foregroundColor(Palette.accent.gold)
                Image(systemName: "sparkle")
                    .font(.system(size: 10))
                    .foregroundColor(Color(hex: "#7C5CFF"))
                Image(systemName: "star.fill")
                    .font(.system(size: 8))
                    .foregroundColor(Palette.accent.gold)
                Rectangle().fill(Color(hex: "#7C5CFF").opacity(0.5)).frame(height: 1)
            }
            .padding(.horizontal, 40)
        }
        .padding(.vertical, 20)
    }
    
    // MARK: - SunFlow State Section (PREMIUM)
    
    private var sunflowStateSection: some View {
        
        NavigationLink(destination: PremiumGateView(featureName: "SunFlow State") { SunFlowStateView() }) {
            
            VStack(spacing: 16) {
                
                HStack {
                    
                    HStack(spacing: 8) {
                        Image(systemName: "crown.fill")
                            .foregroundColor(Palette.accent.gold)
                        Text("PREMIUM")
                            .font(.system(size: 10, weight: .bold, design: .rounded))
                            .foregroundColor(Palette.accent.gold)
                            .tracking(1)
                    }
                    .padding(.horizontal, 10)
                    .padding(.vertical, 5)
                    .background(
                        Capsule()
                            .fill(Palette.accent.gold.opacity(0.15))
                    )
                    
                    Spacer()
                    
                }
                
                HStack(spacing: 16) {
                    
                    ZStack {
                        
                        Circle()
                            .fill(
                                RadialGradient(
                                    colors: [Palette.accent.gold.opacity(0.4), Palette.accent.gold.opacity(0.1)],
                                    center: .center,
                                    startRadius: 10,
                                    endRadius: 35
                                )
                            )
                            .frame(width: 70, height: 70)
                        
                        Image(systemName: "sun.max.trianglebadge.exclamationmark.fill")
                            .font(.system(size: 32))
                            .foregroundStyle(
                                LinearGradient(
                                    colors: [Palette.accent.gold, Palette.primary.orange],
                                    startPoint: .top,
                                    endPoint: .bottom
                                )
                            )
                        
                    }
                    
                    VStack(alignment: .leading, spacing: 6) {
                        
                        Text("SunFlow State")
                            .font(.system(size: 20, weight: .black, design: .rounded))
                            .foregroundColor(.white)
                        
                        Text("Enter flow on command • Calibrate your rhythm")
                            .font(.system(size: 12, weight: .medium))
                            .foregroundColor(Palette.text.secondary)
                        
                        HStack(spacing: 12) {
                            
                            HStack(spacing: 4) {
                                Image(systemName: "bolt.fill")
                                    .font(.system(size: 10))
                                Text("14 Triggers")
                                    .font(.system(size: 10, weight: .semibold))
                            }
                            .foregroundColor(Palette.accent.gold)
                            
                            HStack(spacing: 4) {
                                Image(systemName: "list.bullet.rectangle")
                                    .font(.system(size: 10))
                                Text("5 Protocols")
                                    .font(.system(size: 10, weight: .semibold))
                            }
                            .foregroundColor(Palette.primary.cyan)
                            
                        }
                        
                    }
                    
                    Spacer()
                    
                    Image(systemName: "chevron.right")
                        .font(.system(size: 14, weight: .semibold))
                        .foregroundColor(Palette.accent.gold)
                    
                }
                
                Text("\"The body moves on its own.\" — Whis")
                    .font(.system(size: 11, weight: .medium, design: .rounded))
                    .foregroundColor(Palette.text.muted)
                    .italic()
                
            }
            .padding(18)
            .background(
                RoundedRectangle(cornerRadius: 20, style: .continuous)
                    .fill(
                        LinearGradient(
                            colors: [
                                Palette.accent.gold.opacity(0.15),
                                Palette.accent.gold.opacity(0.05)
                            ],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
                    .overlay(
                        RoundedRectangle(cornerRadius: 20, style: .continuous)
                            .stroke(
                                LinearGradient(
                                    colors: [Palette.accent.gold.opacity(0.5), Palette.accent.gold.opacity(0.2)],
                                    startPoint: .topLeading,
                                    endPoint: .bottomTrailing
                                ),
                                lineWidth: 1.5
                            )
                    )
            )
            .shadow(color: Palette.accent.gold.opacity(0.2), radius: 15, x: 0, y: 8)
            
        }
        .buttonStyle(ScaleButtonStyle())
        
    }
    
    // MARK: - Documentaries Section (NEW)
    
    private var documentariesSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Text("📺 DOCUMENTARIES")
                    .font(.system(size: 14, weight: .bold, design: .rounded))
                    .foregroundColor(Color.red)
                
                Spacer()
                
                Text("NEW")
                    .font(.system(size: 10, weight: .bold, design: .rounded))
                    .foregroundColor(.black)
                    .padding(.horizontal, 8)
                    .padding(.vertical, 4)
                    .background(Palette.accent.gold)
                    .clipShape(Capsule())
            }
            
            Text("Watch the truth they don't show on TV")
                .font(.system(size: 12, weight: .medium))
                .foregroundColor(Palette.text.secondary)
            
            NavigationLink(destination: YouTubeDocumentariesView()) {
                HStack(spacing: 16) {
                    ZStack {
                        RoundedRectangle(cornerRadius: 12)
                            .fill(Color.red.opacity(0.2))
                            .frame(width: 60, height: 60)
                        
                        Image(systemName: "play.rectangle.fill")
                            .font(.system(size: 28))
                            .foregroundColor(.red)
                    }
                    
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Awakening Documentaries")
                            .font(.system(size: 16, weight: .bold, design: .rounded))
                            .foregroundColor(.white)
                        
                        Text("Searchable library with summaries")
                            .font(.system(size: 12, weight: .medium))
                            .foregroundColor(Palette.text.secondary)
                        
                        HStack(spacing: 4) {
                            Image(systemName: "film.fill")
                                .font(.system(size: 10))
                            Text("8+ documentaries • Embedded videos")
                                .font(.system(size: 11, weight: .medium))
                        }
                        .foregroundColor(Palette.text.muted)
                    }
                    
                    Spacer()
                    
                    Image(systemName: "chevron.right")
                        .font(.system(size: 14, weight: .semibold))
                        .foregroundColor(Palette.text.muted)
                }
                .padding(16)
                .background(
                    RoundedRectangle(cornerRadius: 16)
                        .fill(Color.white.opacity(0.05))
                        .overlay(
                            RoundedRectangle(cornerRadius: 16)
                                .stroke(Color.red.opacity(0.3), lineWidth: 1)
                        )
                )
            }
            .buttonStyle(ScaleButtonStyle())
        }
        .padding(16)
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color.white.opacity(0.03))
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(Color.red.opacity(0.2), lineWidth: 1)
                )
        )
    }
    
    // MARK: - Institutional Lies Section (PRIMARY SOURCES)
    
    private var institutionalLiesSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Text("📋 DOCUMENTED TRUTH")
                    .font(.system(size: 14, weight: .bold, design: .rounded))
                    .foregroundColor(Palette.accent.gold)
                
                Spacer()
                
                Text("SOURCED")
                    .font(.system(size: 10, weight: .bold, design: .rounded))
                    .foregroundColor(.black)
                    .padding(.horizontal, 8)
                    .padding(.vertical, 4)
                    .background(Palette.accent.gold)
                    .clipShape(Capsule())
            }
            
            Text("Government crimes, corporate lies, control mechanisms")
                .font(.system(size: 12, weight: .medium))
                .foregroundColor(Palette.text.secondary)
            
            NavigationLink(destination: InstitutionalLiesView()) {
                HStack(spacing: 16) {
                    ZStack {
                        RoundedRectangle(cornerRadius: 12)
                            .fill(Palette.accent.gold.opacity(0.2))
                            .frame(width: 60, height: 60)
                        
                        Image(systemName: "doc.text.magnifyingglass")
                            .font(.system(size: 28))
                            .foregroundColor(Palette.accent.gold)
                    }
                    
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Institutional Lies")
                            .font(.system(size: 16, weight: .bold, design: .rounded))
                            .foregroundColor(.white)
                        
                        Text("No theories - just primary sources")
                            .font(.system(size: 12, weight: .medium))
                            .foregroundColor(Palette.text.secondary)
                        
                        HStack(spacing: 4) {
                            Image(systemName: "checkmark.shield.fill")
                                .font(.system(size: 10))
                            Text("DOJ cases • Senate reports • Declassified docs")
                                .font(.system(size: 11, weight: .medium))
                        }
                        .foregroundColor(Palette.text.muted)
                    }
                    
                    Spacer()
                    
                    Image(systemName: "chevron.right")
                        .font(.system(size: 14, weight: .semibold))
                        .foregroundColor(Palette.text.muted)
                }
                .padding(16)
                .background(
                    RoundedRectangle(cornerRadius: 16)
                        .fill(Color.white.opacity(0.05))
                        .overlay(
                            RoundedRectangle(cornerRadius: 16)
                                .stroke(Palette.accent.gold.opacity(0.3), lineWidth: 1)
                        )
                )
            }
            .buttonStyle(ScaleButtonStyle())
        }
        .padding(16)
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color.white.opacity(0.03))
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(Palette.accent.gold.opacity(0.2), lineWidth: 1)
                )
        )
    }
    
    // MARK: - Religion Exposed Section (NEW)
    
    private var religionExposedSection: some View {
        CourseSectionView(
            title: "⛪ RELIGION EXPOSED",
            subtitle: "The lies they built empires on",
            color: Color(hex: "#8B0000"),
            courses: [
                CourseRowData(
                    id: "catholic_expose",
                    title: "The Vatican Exposed",
                    subtitle: "Crimes, lies, and hidden history",
                    icon: "building.columns.fill",
                    color: Color(hex: "#8B0000"),
                    destination: AnyView(GenericCourseView(
                        title: "The Vatican Exposed",
                        subtitle: "Crimes, lies, and hidden history",
                        icon: "building.columns.fill",
                        color: Color(hex: "#8B0000"),
                        geometryStyle: .treeOfLife,
                        modules: CatholicChurchExposeCourse.shared.modules.map { m in
                            GenericModule(id: m.id, number: m.number, title: m.title, subtitle: m.subtitle,
                                lessons: m.lessons.map { l in GenericLesson(id: l.id, title: l.title, content: l.content, keyPoints: l.keyPoints) })
                        }
                    ))
                ),
                CourseRowData(
                    id: "bible_decoded",
                    title: "The Bible Decoded",
                    subtitle: "Astrotheology and hidden meanings",
                    icon: "book.closed.fill",
                    color: Color(hex: "#5D4037"),
                    destination: AnyView(GenericCourseView(
                        title: "The Bible Decoded",
                        subtitle: "Astrotheology and hidden meanings",
                        icon: "book.closed.fill",
                        color: Color(hex: "#5D4037"),
                        geometryStyle: .flowerOfLife,
                        modules: BibleDecodedCourse.shared.modules.map { m in
                            GenericModule(id: m.id, number: m.number, title: m.title, subtitle: m.subtitle,
                                lessons: m.lessons.map { l in GenericLesson(id: l.id, title: l.title, content: l.content, keyPoints: l.keyPoints) })
                        }
                    ))
                ),
                CourseRowData(
                    id: "zodiac_connection",
                    title: "The Zodiac Decoded",
                    subtitle: "How solar mythology became religion",
                    icon: "sparkles",
                    color: Color(hex: "#FFD700"),
                    destination: AnyView(ZodiacConnectionCourseView())
                )
            ]
        )
    }
    
    // MARK: - Matrix Exposed Section (NEW)
    
    private var matrixExposedSection: some View {
        CourseSectionView(
            title: "🔴 THE MATRIX EXPOSED",
            subtitle: "See the system for what it is",
            color: Color(hex: "#00FF00"),
            courses: [
                CourseRowData(
                    id: "matrix_system",
                    title: "The Matrix",
                    subtitle: "The system is not based on love",
                    icon: "cube.transparent",
                    color: Color(hex: "#00FF00"),
                    destination: AnyView(GenericCourseView(
                        title: "The Matrix",
                        subtitle: "The system is not based on love",
                        icon: "cube.transparent",
                        color: Color(hex: "#00FF00"),
                        geometryStyle: .metatronsCube,
                        modules: MatrixSystemCourse.shared.modules.map { m in
                            GenericModule(id: m.id, number: m.number, title: m.title, subtitle: m.subtitle,
                                lessons: m.lessons.map { l in GenericLesson(id: l.id, title: l.title, content: l.content, keyPoints: l.keyPoints) })
                        }
                    ))
                ),
                CourseRowData(
                    id: "left_right",
                    title: "Left vs Right",
                    subtitle: "The divide-and-conquer programming",
                    icon: "arrow.left.arrow.right",
                    color: Color(hex: "#9E9E9E"),
                    destination: AnyView(GenericCourseView(
                        title: "Left vs Right",
                        subtitle: "The divide-and-conquer programming",
                        icon: "arrow.left.arrow.right",
                        color: Color(hex: "#9E9E9E"),
                        geometryStyle: .vesicaPiscis,
                        modules: LeftRightProgrammingCourse.shared.modules.map { m in
                            GenericModule(id: m.id, number: m.number, title: m.title, subtitle: m.subtitle,
                                lessons: m.lessons.map { l in GenericLesson(id: l.id, title: l.title, content: l.content, keyPoints: l.keyPoints) })
                        }
                    ))
                )
            ]
        )
    }
    
    // MARK: - Hidden History Section
    
    private var hiddenHistorySection: some View {
        CourseSectionView(
            title: "🔮 HIDDEN HISTORY",
            subtitle: "What they erased from the record",
            color: Color(hex: "#9C27B0"),
            courses: [
                CourseRowData(
                    id: "divine_feminine",
                    title: "The Divine Feminine",
                    subtitle: "The goddess they erased",
                    icon: "moon.stars.fill",
                    color: Color(hex: "#E040FB"),
                    destination: AnyView(GenericCourseView(
                        title: "The Divine Feminine",
                        subtitle: "The goddess they erased from history",
                        icon: "moon.stars.fill",
                        color: Color(hex: "#E040FB"),
                        geometryStyle: .sriYantra,
                        modules: DivineFeminineCourse.shared.modules.map { m in
                            GenericModule(id: m.id, number: m.number, title: m.title, subtitle: m.subtitle,
                                lessons: m.lessons.map { l in GenericLesson(id: l.id, title: l.title, content: l.content, keyPoints: l.keyPoints) })
                        }
                    ))
                ),
                CourseRowData(
                    id: "egypt_yeshua",
                    title: "Egypt & Yeshua",
                    subtitle: "The mystery school connection",
                    icon: "pyramid.fill",
                    color: Color(hex: "#FFD700"),
                    destination: AnyView(GenericCourseView(
                        title: "Egypt & Yeshua",
                        subtitle: "The mystery school connection they hid",
                        icon: "pyramid.fill",
                        color: Color(hex: "#FFD700"),
                        geometryStyle: .flowerOfLife,
                        modules: EgyptYeshuaCourse.shared.modules.map { m in
                            GenericModule(id: m.id, number: m.number, title: m.title, subtitle: m.subtitle,
                                lessons: m.lessons.map { l in GenericLesson(id: l.id, title: l.title, content: l.content, keyPoints: l.keyPoints) })
                        }
                    ))
                ),
                CourseRowData(
                    id: "colonial_christianity",
                    title: "The Conquest",
                    subtitle: "How Christianity erased the Americas",
                    icon: "cross.fill",
                    color: Color(hex: "#8B0000"),
                    destination: AnyView(GenericCourseView(
                        title: "The Conquest",
                        subtitle: "How Christianity erased the Americas",
                        icon: "cross.fill",
                        color: Color(hex: "#8B0000"),
                        geometryStyle: .treeOfLife,
                        modules: ColonialChristianityCourse.shared.modules.map { m in
                            GenericModule(id: m.id, number: m.number, title: m.title, subtitle: m.subtitle,
                                lessons: m.lessons.map { l in GenericLesson(id: l.id, title: l.title, content: l.content, keyPoints: l.keyPoints) })
                        }
                    ))
                )
            ]
        )
    }
    
    // MARK: - Lies Exposed Section
    
    private var liesExposedSection: some View {
        CourseSectionView(
            title: "⚠️ THE LIES EXPOSED",
            subtitle: "Everything they told you was wrong",
            color: Color(hex: "#FF1744"),
            courses: [
                CourseRowData(
                    id: "master_lies",
                    title: "The Master Lies",
                    subtitle: "35+ lies across 9 categories",
                    icon: "exclamationmark.triangle.fill",
                    color: Color(hex: "#FF1744"),
                    destination: AnyView(MasterLiesCourseView())
                ),
                CourseRowData(
                    id: "lgbtq_truth",
                    title: "Love Is Love",
                    subtitle: "The lies religion created about LGBTQ+",
                    icon: "heart.fill",
                    color: Color(hex: "#FF1493"),
                    destination: AnyView(GenericCourseView(
                        title: "Love Is Love",
                        subtitle: "The lies religion created about LGBTQ+",
                        icon: "heart.fill",
                        color: Color(hex: "#FF1493"),
                        geometryStyle: .seedOfLife,
                        modules: LGBTQTruthCourse.shared.modules.map { m in
                            GenericModule(id: m.id, number: m.number, title: m.title, subtitle: m.subtitle,
                                lessons: m.lessons.map { l in GenericLesson(id: l.id, title: l.title, content: l.content, keyPoints: l.keyPoints) })
                        }
                    ))
                ),
                CourseRowData(
                    id: "prolife_expose",
                    title: "The Birth Machine",
                    subtitle: "Why they really want more babies",
                    icon: "person.3.fill",
                    color: Color(hex: "#DC143C"),
                    destination: AnyView(GenericCourseView(
                        title: "The Birth Machine",
                        subtitle: "Why they really want more babies",
                        icon: "person.3.fill",
                        color: Color(hex: "#DC143C"),
                        geometryStyle: .torusField,
                        modules: ProLifeExposeCourse.shared.modules.map { m in
                            GenericModule(id: m.id, number: m.number, title: m.title, subtitle: m.subtitle,
                                lessons: m.lessons.map { l in GenericLesson(id: l.id, title: l.title, content: l.content, keyPoints: l.keyPoints) })
                        }
                    ))
                ),
                CourseRowData(
                    id: "race_lie",
                    title: "The Race Lie",
                    subtitle: "There is only one human race",
                    icon: "person.2.fill",
                    color: Color(hex: "#795548"),
                    destination: AnyView(GenericCourseView(
                        title: "The Race Lie",
                        subtitle: "There is only one human race",
                        icon: "person.2.fill",
                        color: Color(hex: "#795548"),
                        geometryStyle: .flowerOfLife,
                        modules: RaceLieCourse.shared.modules.map { m in
                            GenericModule(id: m.id, number: m.number, title: m.title, subtitle: m.subtitle,
                                lessons: m.lessons.map { l in GenericLesson(id: l.id, title: l.title, content: l.content, keyPoints: l.keyPoints) })
                        }
                    ))
                )
            ]
        )
    }
    
    // MARK: - Control Systems Section
    
    private var controlSystemsSection: some View {
        CourseSectionView(
            title: "⛓️ CONTROL SYSTEMS",
            subtitle: "How they keep you trapped",
            color: Color(hex: "#607D8B"),
            courses: [
                CourseRowData(
                    id: "scams",
                    title: "The Great Scams",
                    subtitle: "American Dream, College, Debt, Taxes",
                    icon: "dollarsign.arrow.circlepath",
                    color: Color(hex: "#FF5722"),
                    destination: AnyView(PlaceholderCourseView(title: "The Great Scams", subtitle: "Coming soon"))
                ),
                CourseRowData(
                    id: "systems_control",
                    title: "Systems of Control",
                    subtitle: "How power operates",
                    icon: "gearshape.2.fill",
                    color: Color(hex: "#455A64"),
                    destination: AnyView(PlaceholderCourseView(title: "Systems of Control", subtitle: "Coming soon"))
                )
            ]
        )
    }
    
    // MARK: - Consciousness Section
    
    private var consciousnessSection: some View {
        CourseSectionView(
            title: "🧠 CONSCIOUSNESS",
            subtitle: "The science & philosophy of mind",
            color: Color(hex: "#E91E63"),
            courses: [
                CourseRowData(
                    id: "phd_consciousness",
                    title: "PhD Consciousness",
                    subtitle: "Complete consciousness science",
                    icon: "brain.head.profile",
                    color: Color(hex: "#9C27B0"),
                    destination: AnyView(PlaceholderCourseView(title: "PhD Consciousness", subtitle: "Coming soon"))
                ),
                CourseRowData(
                    id: "quantum",
                    title: "Quantum Reality",
                    subtitle: "Physics that changed everything",
                    icon: "atom",
                    color: Color(hex: "#673AB7"),
                    destination: AnyView(PlaceholderCourseView(title: "Quantum Reality", subtitle: "Coming soon"))
                )
            ]
        )
    }
    
    // MARK: - Anime Wisdom Section
    
    private var animeWisdomSection: some View {
        CourseSectionView(
            title: "🐲 ANIME WISDOM",
            subtitle: "Pop culture consciousness teachings",
            color: Color(hex: "#FF6D00"),
            courses: [
                CourseRowData(
                    id: "dragonball",
                    title: "Dragon Ball Awakening",
                    subtitle: "DB • DBZ • DBS teachings",
                    icon: "sparkles",
                    color: Color(hex: "#FF6B00"),
                    destination: AnyView(DragonBallCourseView())
                ),
                CourseRowData(
                    id: "saint_seiya",
                    title: "Saint Seiya",
                    subtitle: "12 Houses & Gold Knights",
                    icon: "star.circle.fill",
                    color: Color(hex: "#FFC107"),
                    destination: AnyView(PlaceholderCourseView(title: "Saint Seiya", subtitle: "Coming soon"))
                )
            ]
        )
    }
    
    // MARK: - Spiritual Traditions Section
    
    private var spiritualTraditionsSection: some View {
        CourseSectionView(
            title: "✨ SPIRITUAL TRADITIONS",
            subtitle: "Ancient wisdom for modern minds",
            color: Color(hex: "#7C5CFF"),
            courses: [
                CourseRowData(
                    id: "buddha",
                    title: "Buddha's Path",
                    subtitle: "Original awakening technology",
                    icon: "figure.mind.and.body",
                    color: Color(hex: "#FF9800"),
                    destination: AnyView(PlaceholderCourseView(title: "Buddha's Path", subtitle: "Coming soon"))
                ),
                CourseRowData(
                    id: "sacred_geometry",
                    title: "Sacred Geometry",
                    subtitle: "The language of creation",
                    icon: "hexagon.fill",
                    color: Color(hex: "#7C5CFF"),
                    destination: AnyView(PlaceholderCourseView(title: "Sacred Geometry", subtitle: "Coming soon"))
                )
            ]
        )
    }
    
    // MARK: - Footer
    
    private var footerSection: some View {
        VStack(spacing: 12) {
            // Dragon context chip - removed, module deprecated
            // DragonContextChip(
            //     context: .awakening(courseId: nil),
            //     customText: "Ask the Dragon about your awakening"
            // )
            // .padding(.bottom, 8)
            
            // Sacred geometry divider
            HStack(spacing: 8) {
                Rectangle().fill(Palette.accent.gold.opacity(0.3)).frame(height: 1)
                FlowerOfLife()
                    .stroke(Palette.accent.gold.opacity(0.5), lineWidth: 0.5)
                    .frame(width: 30, height: 30)
                Rectangle().fill(Palette.accent.gold.opacity(0.3)).frame(height: 1)
            }
            
            Text("🔥")
                .font(.system(size: 30))
            
            Text("\"The truth will set you free—but first it will piss you off.\"")
                .font(.system(size: 13, weight: .medium, design: .rounded))
                .italic()
                .foregroundColor(Palette.text.secondary)
                .multilineTextAlignment(.center)
            
            Text("— Gloria Steinem")
                .font(.system(size: 11, weight: .bold, design: .rounded))
                .foregroundColor(Palette.text.muted)
            
            HStack(spacing: 4) {
                Text("Built with")
                Text("🐉")
                Text("by Ron")
            }
            .font(.system(size: 11, weight: .medium))
            .foregroundColor(Palette.text.muted)
            .padding(.top, 8)
            
            Text("SunFlow: Reignited")
                .font(.system(size: 10, weight: .bold))
                .foregroundColor(Palette.accent.gold)
        }
        .padding(.top, 20)
    }
}

// MARK: - Sacred Geometry Shapes

struct AwakeningMetatronsCubeShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let center = CGPoint(x: rect.midX, y: rect.midY)
        let r = min(rect.width, rect.height) / 2
        
        // 6 outer points + center
        var points: [CGPoint] = [center]
        for i in 0..<6 {
            let angle = Double(i) * .pi / 3 - .pi / 2
            points.append(CGPoint(x: center.x + CGFloat(cos(angle)) * r, y: center.y + CGFloat(sin(angle)) * r))
        }
        
        // Connect all points
        for i in 0..<points.count {
            for j in (i + 1)..<points.count {
                path.move(to: points[i])
                path.addLine(to: points[j])
            }
        }
        
        // Outer circles
        for point in points {
            path.addEllipse(in: CGRect(x: point.x - r/3, y: point.y - r/3, width: r*2/3, height: r*2/3))
        }
        
        return path
    }
}

struct AwakeningLandingSriYantraShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let center = CGPoint(x: rect.midX, y: rect.midY)
        let size = min(rect.width, rect.height)
        
        // Interlocking triangles
        for i in 0..<9 {
            let scale = 1.0 - Double(i) * 0.1
            let r = size / 2 * scale
            
            // Triangle up or down
            if i % 2 == 0 {
                path.move(to: CGPoint(x: center.x, y: center.y - r))
                path.addLine(to: CGPoint(x: center.x - r * 0.866, y: center.y + r * 0.5))
                path.addLine(to: CGPoint(x: center.x + r * 0.866, y: center.y + r * 0.5))
                path.closeSubpath()
            } else {
                path.move(to: CGPoint(x: center.x, y: center.y + r))
                path.addLine(to: CGPoint(x: center.x - r * 0.866, y: center.y - r * 0.5))
                path.addLine(to: CGPoint(x: center.x + r * 0.866, y: center.y - r * 0.5))
                path.closeSubpath()
            }
        }
        
        return path
    }
}

// MARK: - Course Section View

struct CourseSectionView: View {
    let title: String
    let subtitle: String
    let color: Color
    let courses: [CourseRowData]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Text(title)
                    .font(.system(size: 14, weight: .bold, design: .rounded))
                    .foregroundColor(color)
                
                Spacer()
                
                Text("\(courses.count) items")
                    .font(.system(size: 11, weight: .medium))
                    .foregroundColor(Palette.text.muted)
            }
            
            Text(subtitle)
                .font(.system(size: 12, weight: .medium))
                .foregroundColor(Palette.text.secondary)
            
            VStack(spacing: 8) {
                ForEach(courses) { course in
                    NavigationLink(destination: course.destination) {
                        CourseRowView(course: course)
                    }
                    .buttonStyle(ScaleButtonStyle())
                }
            }
        }
        .padding(16)
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color.white.opacity(0.03))
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(color.opacity(0.2), lineWidth: 1)
                )
        )
    }
}

// MARK: - Course Row Data & View

struct CourseRowData: Identifiable {
    let id: String
    let title: String
    let subtitle: String
    let icon: String
    let color: Color
    let destination: AnyView
}

struct CourseRowView: View {
    let course: CourseRowData
    
    var body: some View {
        HStack(spacing: 12) {
            ZStack {
                RoundedRectangle(cornerRadius: 8)
                    .fill(course.color.opacity(0.2))
                    .frame(width: 36, height: 36)
                
                Image(systemName: course.icon)
                    .font(.system(size: 14, weight: .semibold))
                    .foregroundColor(course.color)
            }
            
            VStack(alignment: .leading, spacing: 2) {
                Text(course.title)
                    .font(.system(size: 14, weight: .semibold, design: .rounded))
                    .foregroundColor(.white)
                
                Text(course.subtitle)
                    .font(.system(size: 11, weight: .medium))
                    .foregroundColor(Palette.text.muted)
                    .lineLimit(1)
            }
            
            Spacer()
            
            Text("COURSE")
                .font(.system(size: 9, weight: .bold, design: .rounded))
                .foregroundColor(Palette.primary.cyan)
                .padding(.horizontal, 6)
                .padding(.vertical, 3)
                .background(RoundedRectangle(cornerRadius: 4).fill(Palette.primary.cyan.opacity(0.2)))
            
            Image(systemName: "chevron.right")
                .font(.system(size: 11, weight: .semibold))
                .foregroundColor(Palette.text.muted)
        }
        .padding(10)
        .background(RoundedRectangle(cornerRadius: 10).fill(Color.white.opacity(0.03)))
    }
}

// MARK: - Placeholder & Generic Course Views

struct PlaceholderCourseView: View {
    let title: String
    let subtitle: String
    
    var body: some View {
        ZStack {
            PaletteGradients.cosmicBackground.ignoresSafeArea()
            
            VStack(spacing: 20) {
                Image(systemName: "hammer.fill")
                    .font(.system(size: 60))
                    .foregroundColor(Palette.accent.gold)
                
                Text(title)
                    .font(.system(size: 24, weight: .black, design: .rounded))
                    .foregroundColor(.white)
                
                Text(subtitle)
                    .font(.system(size: 16, weight: .medium))
                    .foregroundColor(Palette.text.secondary)
            }
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct GenericCourseView: View {
    let title: String
    let subtitle: String
    let icon: String
    let color: Color
    let geometryStyle: SacredGeometryStyle
    let modules: [GenericModule]
    
    @State private var completedLessons: Set<String> = []
    @State private var expandedModules: Set<String> = []
    @State private var selectedLesson: GenericLesson?
    
    var totalLessons: Int { modules.reduce(0) { $0 + $1.lessons.count } }
    var progressPercentage: CGFloat {
        guard totalLessons > 0 else { return 0 }
        return CGFloat(completedLessons.count) / CGFloat(totalLessons)
    }
    
    var body: some View {
        ZStack {
            SacredGeometryBackground(style: geometryStyle, opacity: 0.1)
            
            ScrollView(showsIndicators: false) {
                VStack(spacing: 24) {
                    courseHeader
                    progressSection
                    modulesSection
                    Spacer(minLength: 100)
                }
                .padding(.horizontal, 20)
                .padding(.top, 20)
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Text("\(completedLessons.count)/\(totalLessons)")
                    .font(.system(size: 12, weight: .bold, design: .rounded))
                    .foregroundColor(color)
                    .padding(.horizontal, 8)
                    .padding(.vertical, 4)
                    .background(color.opacity(0.15))
                    .clipShape(Capsule())
            }
        }
        .sheet(item: $selectedLesson) { lesson in
            GenericLessonDetailView(lesson: lesson, color: color, onComplete: { completedLessons.insert(lesson.id) })
        }
    }
    
    private var courseHeader: some View {
        VStack(spacing: 16) {
            ZStack {
                Circle()
                    .fill(RadialGradient(colors: [color.opacity(0.4), Color.clear], center: .center, startRadius: 20, endRadius: 60))
                    .frame(width: 120, height: 120)
                Image(systemName: icon)
                    .font(.system(size: 50, weight: .semibold))
                    .foregroundColor(color)
            }
            Text(title).font(.system(size: 24, weight: .black, design: .rounded)).foregroundColor(.white).multilineTextAlignment(.center)
            Text(subtitle).font(.system(size: 14, weight: .medium)).foregroundColor(Palette.text.secondary).multilineTextAlignment(.center)
        }
    }
    
    private var progressSection: some View {
        VStack(spacing: 12) {
            HStack {
                Text("PROGRESS").font(.system(size: 12, weight: .bold, design: .rounded)).foregroundColor(Palette.text.muted).tracking(2)
                Spacer()
                Text("\(Int(progressPercentage * 100))%").font(.system(size: 14, weight: .bold, design: .rounded)).foregroundColor(color)
            }
            GeometryReader { geo in
                ZStack(alignment: .leading) {
                    RoundedRectangle(cornerRadius: 4).fill(Color.white.opacity(0.1)).frame(height: 8)
                    RoundedRectangle(cornerRadius: 4).fill(color).frame(width: geo.size.width * progressPercentage, height: 8)
                }
            }.frame(height: 8)
        }
        .padding(16)
        .background(RoundedRectangle(cornerRadius: 16).fill(Color.white.opacity(0.05)))
    }
    
    private var modulesSection: some View {
        VStack(spacing: 16) {
            ForEach(modules) { module in
                GenericModuleCard(module: module, color: color, isExpanded: expandedModules.contains(module.id), completedLessons: completedLessons, onToggle: {
                    withAnimation(.spring()) {
                        if expandedModules.contains(module.id) { expandedModules.remove(module.id) }
                        else { expandedModules.insert(module.id) }
                    }
                }, onSelectLesson: { selectedLesson = $0 })
            }
        }
    }
}

struct GenericModule: Identifiable {
    let id: String; let number: Int; let title: String; let subtitle: String; let lessons: [GenericLesson]
}

struct GenericLesson: Identifiable {
    let id: String; let title: String; let content: String; let keyPoints: [String]
}

struct GenericModuleCard: View {
    let module: GenericModule; let color: Color; let isExpanded: Bool; let completedLessons: Set<String>
    let onToggle: () -> Void; let onSelectLesson: (GenericLesson) -> Void
    var completedCount: Int { module.lessons.filter { completedLessons.contains($0.id) }.count }
    
    var body: some View {
        VStack(spacing: 0) {
            Button(action: onToggle) {
                HStack(spacing: 16) {
                    Text("\(module.number)").font(.system(size: 16, weight: .black, design: .rounded)).foregroundColor(color).frame(width: 36, height: 36).background(color.opacity(0.15)).clipShape(Circle())
                    VStack(alignment: .leading, spacing: 2) {
                        Text(module.title).font(.system(size: 16, weight: .bold, design: .rounded)).foregroundColor(.white)
                        Text("\(completedCount)/\(module.lessons.count) lessons").font(.system(size: 12, weight: .medium)).foregroundColor(Palette.text.secondary)
                    }
                    Spacer()
                    Image(systemName: isExpanded ? "chevron.up" : "chevron.down").font(.system(size: 14, weight: .semibold)).foregroundColor(Palette.text.muted)
                }.padding(16)
            }
            if isExpanded {
                VStack(spacing: 8) {
                    ForEach(module.lessons) { lesson in
                        GenericLessonRow(lesson: lesson, color: color, isCompleted: completedLessons.contains(lesson.id), onTap: { onSelectLesson(lesson) })
                    }
                }.padding(.horizontal, 16).padding(.bottom, 16)
            }
        }
        .background(RoundedRectangle(cornerRadius: 16).fill(Color.white.opacity(0.05)).overlay(RoundedRectangle(cornerRadius: 16).stroke(color.opacity(isExpanded ? 0.3 : 0.1), lineWidth: 1)))
    }
}

struct GenericLessonRow: View {
    let lesson: GenericLesson; let color: Color; let isCompleted: Bool; let onTap: () -> Void
    
    var body: some View {
        Button(action: onTap) {
            HStack(spacing: 12) {
                ZStack {
                    Circle().stroke(isCompleted ? color : Color.white.opacity(0.3), lineWidth: 2).frame(width: 24, height: 24)
                    if isCompleted { Image(systemName: "checkmark").font(.system(size: 12, weight: .bold)).foregroundColor(color) }
                }
                Text(lesson.title).font(.system(size: 14, weight: .semibold, design: .rounded)).foregroundColor(isCompleted ? color : .white).lineLimit(2).multilineTextAlignment(.leading)
                Spacer()
                Image(systemName: "play.circle.fill").font(.system(size: 24)).foregroundColor(color.opacity(0.6))
            }.padding(12).background(RoundedRectangle(cornerRadius: 12).fill(Color.white.opacity(0.03)))
        }.buttonStyle(ScaleButtonStyle())
    }
}

struct GenericLessonDetailView: View {
    let lesson: GenericLesson; let color: Color; let onComplete: () -> Void
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        ZStack {
            PaletteGradients.cosmicBackground.ignoresSafeArea()
            ScrollView(showsIndicators: false) {
                VStack(alignment: .leading, spacing: 24) {
                    VStack(alignment: .leading, spacing: 8) {
                        Text("LESSON").font(.system(size: 12, weight: .bold, design: .rounded)).foregroundColor(color).tracking(2)
                        Text(lesson.title).font(.system(size: 24, weight: .black, design: .rounded)).foregroundColor(.white)
                    }
                    Text(lesson.content).font(.system(size: 16, weight: .regular, design: .rounded)).foregroundColor(Palette.text.primary).lineSpacing(6)
                    if !lesson.keyPoints.isEmpty {
                        VStack(alignment: .leading, spacing: 12) {
                            Text("🔑 KEY POINTS").font(.system(size: 12, weight: .bold, design: .rounded)).foregroundColor(color).tracking(2)
                            ForEach(lesson.keyPoints, id: \.self) { point in
                                HStack(alignment: .top, spacing: 12) {
                                    Circle().fill(color).frame(width: 6, height: 6).padding(.top, 6)
                                    Text(point).font(.system(size: 14, weight: .medium, design: .rounded)).foregroundColor(Palette.text.secondary)
                                }
                            }
                        }.padding(16).background(RoundedRectangle(cornerRadius: 16).fill(color.opacity(0.1)))
                    }
                    Button(action: { 
                        HapticManager.shared.courseCompleted()
                        onComplete()
                        dismiss() 
                    }) {
                        HStack { Image(systemName: "checkmark.circle.fill"); Text("Mark Complete") }
                            .font(.system(size: 16, weight: .bold, design: .rounded)).foregroundColor(.black).frame(maxWidth: .infinity).padding(.vertical, 16).background(color).clipShape(RoundedRectangle(cornerRadius: 14))
                    }
                    Spacer(minLength: 50)
                }.padding(.horizontal, 20).padding(.top, 60)
            }
            VStack {
                HStack { Spacer(); Button(action: { dismiss() }) { Image(systemName: "xmark").font(.system(size: 16, weight: .semibold)).foregroundColor(.white).frame(width: 36, height: 36).background(Color.white.opacity(0.1)).clipShape(Circle()) } }.padding(.horizontal, 20).padding(.top, 20)
                Spacer()
            }
        }
    }
}
