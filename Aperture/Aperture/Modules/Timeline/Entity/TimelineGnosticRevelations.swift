// TimelineGnosticRevelations.swift
// Aperture
//
// Gnostic revelations that appear as users travel through the Timeline
// Based on Jordan Maxwell's research - connecting historical dots

import SwiftUI

// MARK: - Gnostic Revelation Model

struct GnosticRevelation: Identifiable {
  let id: String
  let title: String
  let hook: String  // Short attention-grabber
  let revelation: String  // The reveal
  let sourceConnection: String  // What it connects to
  let icon: String
  let accentColor: Color
  let relatedEras: [String]  // Timeline eras where this appears
  let revealType: RevealType

  enum RevealType {
    case etymology  // Word origin reveal
    case symbolism  // Symbol comparison
    case calendar  // Astronomical connection
    case institutional  // Power structure reveal
    case mythology  // Cross-tradition connection
  }
}

// MARK: - Revelation Database

enum GnosticRevelationDatabase {
  static let all: [GnosticRevelation] = [
    // ANCIENT ERA REVELATIONS

    GnosticRevelation(
      id: "brahma_abraham",
      title: "The Name Hidden in Plain Sight",
      hook: "What if Abraham wasn't a person... but a borrowed concept?",
      revelation:
        "In India, the highest priests were called BRAHMANS. Their supreme god was BRAHMA. Put an 'A' in front of Brahman... A-BRAHM. The Bible says Abraham's name was originally ABRAM.\n\nThe Brahman priests bathed in the sacred SARASWATI River.\n\nAbraham + Sarah = Brahman + Saraswati\n\nJudaism traces directly back to Hindu India.",
      sourceConnection: "Hindu → Judaism",
      icon: "textformat.abc",
      accentColor: Color(hex: "#FF9800"),
      relatedEras: ["ancient_india", "abraham_era", "early_judaism"],
      revealType: .etymology
    ),

    GnosticRevelation(
      id: "star_of_david",
      title: "The Star That Isn't David's",
      hook: "The Star of David is only about 130 years old.",
      revelation:
        "The six-pointed star was a HINDU symbol called the Shatkona—representing the union of Shiva and Shakti.\n\nIt was later adopted by Buddhists.\n\nIt only became 'Star of David' in the 1890s.\n\nBefore that, Jews had never heard of any 'Star of David.'\n\nThere was no King David. He never existed.",
      sourceConnection: "Hindu → Buddhist → Jewish",
      icon: "star.fill",
      accentColor: Color(hex: "#2196F3"),
      relatedEras: ["ancient_india", "buddhist_era", "modern_zionism"],
      revealType: .symbolism
    ),

    GnosticRevelation(
      id: "trinity_pattern",
      title: "The Same God, Different Names",
      hook: "Every religion has the same trinity. Coincidence?",
      revelation:
        "Hinduism: Brahma, Vishnu, Shiva\nEgypt: Osiris, Isis, Horus\nChristianity: Father, Son, Holy Spirit\nJudaism: Abraham, Isaac, Jacob\n\nCreator, Preserver, Destroyer.\nFather, Mother/Wife, Son.\n\nAll religions are based on a triangle—a pyramid. Three points. Same pattern, different costumes.",
      sourceConnection: "Universal Pattern",
      icon: "triangle",
      accentColor: Color(hex: "#9C27B0"),
      relatedEras: ["ancient_egypt", "ancient_india", "early_christianity"],
      revealType: .mythology
    ),

    // EGYPTIAN ERA REVELATIONS

    GnosticRevelation(
      id: "thutmose_moses",
      title: "Moses Was a Pharaoh's Title",
      hook: "There was a line of pharaohs called Thut-Moses.",
      revelation:
        "THUT = gives us the English word THOUGHT\nMOSES = 'son of' in Egyptian\n\nThutmose = 'Son of Thought' = 'God's Thought'\n\nRa-mses = Son of Ra\nAh-mose = Son of Ah (the Moon)\n\n'Moses' alone is incomplete—it just means 'son of [something].'\n\nThere probably was no Moses as described in the Bible.",
      sourceConnection: "Egyptian Etymology",
      icon: "scroll",
      accentColor: Color(hex: "#00BCD4"),
      relatedEras: ["ancient_egypt", "exodus_era", "egyptian_pharaohs"],
      revealType: .etymology
    ),

    GnosticRevelation(
      id: "mount_sinai",
      title: "The Moon God's Mountain",
      hook: "Mount Sinai wasn't holy. It was lunar worship.",
      revelation:
        "In ancient Arabic, the MOON GOD was named SIN (S-I-N).\n\nA MOUNTAIN in old Arabic was 'AI.'\n\nSIN + AI = SINAI\n\nMount Sinai = The Moon God's Mountain\n\nThe people saw the moon rise from behind the mountains every night. Obviously, the moon must LIVE in the mountain.\n\nThere's nothing holy in Jerusalem.",
      sourceConnection: "Arabic Etymology",
      icon: "moon.fill",
      accentColor: Color(hex: "#607D8B"),
      relatedEras: ["exodus_era", "ancient_arabia", "sinai_covenant"],
      revealType: .etymology
    ),

    // SOLAR CALENDAR REVELATIONS

    GnosticRevelation(
      id: "december_25",
      title: "The Real Christmas",
      hook: "On December 22-24, the sun doesn't move. It's dead.",
      revelation:
        "December 21st: Winter solstice. The sun hits its lowest point.\n\nDecember 22, 23, 24: The sun sits on the same degree. It doesn't move for THREE DAYS.\n\nAnything that stops moving for three days... is DEAD.\n\nDecember 25th: The sun moves one degree north. It has been BORN AGAIN.\n\n'On the third day, He rose again.'\n\nChristmas is the birthday of God's SUN, not Son.",
      sourceConnection: "Astronomical Calendar",
      icon: "sun.max.fill",
      accentColor: Color(hex: "#FFD700"),
      relatedEras: ["winter_solstice", "christmas_origins", "roman_saturnalia"],
      revealType: .calendar
    ),

    GnosticRevelation(
      id: "passover_easter",
      title: "Passover = The Sun Passes Over",
      hook: "Both holidays celebrate the same astronomical event.",
      revelation:
        "90 days after December 25th, the sun crosses back over the equator.\n\nJews call it PASSOVER—the sun PASSES OVER the equator.\n\nChristians call it RESURRECTION—the sun is RISEN again.\n\nSame event. Different branding.\n\nThe constellation that represents spring? VIRGO, the Virgin.\n\nGod's SUN is born of a VIRGIN constellation.",
      sourceConnection: "Astronomical Calendar",
      icon: "sunrise.fill",
      accentColor: Color(hex: "#4CAF50"),
      relatedEras: ["spring_equinox", "passover_origins", "easter_origins"],
      revealType: .calendar
    ),

    GnosticRevelation(
      id: "twelve_apostles",
      title: "The 12 Followers",
      hook: "Jesus said: 'I am the truth and the light.'",
      revelation:
        "What is the truth and the light? THE SUN.\n\nYou can do anything in the dark. But at 12:00 noon, in the SUN... everybody sees you.\n\nJesus had 12 apostles.\nThe sun has:\n• 12 signs of the zodiac\n• 12 months of the year\n• 12 hours of day, 12 hours of night\n\nThe apostles ARE the zodiac signs following the sun through the heavens.",
      sourceConnection: "Zodiac → Apostles",
      icon: "person.3.fill",
      accentColor: Color(hex: "#E91E63"),
      relatedEras: ["jesus_ministry", "zodiac_origins", "early_christianity"],
      revealType: .calendar
    ),

    GnosticRevelation(
      id: "lion_king",
      title: "The Lion King",
      hook: "Why does Disney make movies about the Lion King?",
      revelation:
        "On the first day of summer, the sun is at its highest point.\n\nThe constellation that begins summer is LEO, the Lion.\n\nGod's SUN, when at its most powerful, is the LION KING.\n\n'King of Kings, Lord of Lords.'\n\nEvery badge, every state symbol, every institution has a SUN on it.\n\nWhy? Because it's the only thing that causes life on Earth.",
      sourceConnection: "Leo → Lion King",
      icon: "crown.fill",
      accentColor: Color(hex: "#FF5722"),
      relatedEras: ["summer_solstice", "egyptian_sun_worship", "modern_symbolism"],
      revealType: .symbolism
    ),

    GnosticRevelation(
      id: "fall_spring",
      title: "Why We Call It Fall",
      hook: "The seasons aren't random names.",
      revelation:
        "SUMMER: The sun is high and hot.\n\n90 days later, it's FALLING—losing power. We call it FALL.\n\nIt falls until December 21st. Now it's DEAD.\n\n90 days later, it's SPRINGING back to life. We call it SPRING.\n\nThe entire calendar is sun worship encoded in language.",
      sourceConnection: "Etymology of Seasons",
      icon: "leaf.fill",
      accentColor: Color(hex: "#795548"),
      relatedEras: ["seasonal_worship", "agricultural_religions", "druid_traditions"],
      revealType: .etymology
    ),

    // ROMAN ERA REVELATIONS

    GnosticRevelation(
      id: "rome_vatican",
      title: "Rome Never Fell",
      hook: "The Roman Empire didn't end. It changed clothes.",
      revelation:
        "700 years under the CAESARS.\n1,600 years under the VATICAN.\n\nIt's still Caesar. He's still 'God.' Everyone still crawls on their knees.\n\nEurope dominated the entire Earth.\nRome dominated Europe.\n\nALL ROADS LEAD TO ROME.\n\nFor 2,300 years, Rome has controlled the Western world.",
      sourceConnection: "Roman → Vatican",
      icon: "building.columns.fill",
      accentColor: Color(hex: "#B71C1C"),
      relatedEras: ["roman_empire", "fall_of_rome", "medieval_church", "vatican_power"],
      revealType: .institutional
    ),

    GnosticRevelation(
      id: "vatican_intelligence",
      title: "The World's Best Spy Agency",
      hook: "It's not the CIA. It's not MI6.",
      revelation:
        "The best intelligence agency on Earth is the VATICAN.\n\nFar superior to MI5, MI6, NSA, or CIA.\n\nWhy?\n\nThey've been doing it for 1,600 YEARS.\n\nYou just came into existence 200 years ago. They've had 16 centuries of practice.",
      sourceConnection: "Vatican Intelligence",
      icon: "eye.fill",
      accentColor: Color(hex: "#212121"),
      relatedEras: ["vatican_power", "cold_war", "cia_origins"],
      revealType: .institutional
    ),

    // ISLAMIC ERA REVELATIONS

    GnosticRevelation(
      id: "islam_before_muhammad",
      title: "Islam Existed Before Muhammad",
      hook: "The religion we call Islam was already fully developed.",
      revelation:
        "The whole Islamic religion was already in place—worship of SATURN and the MOON.\n\nAll Islamic flags are GREEN (Venus's color).\nMosques display a CRESCENT and STAR.\n\nThe star = Venus (morning star)\nThe crescent = Venus rising (always appears as a crescent)\n\nSame celestial symbols, rebranded centuries later.",
      sourceConnection: "Pre-Islamic → Islamic",
      icon: "moon.stars.fill",
      accentColor: Color(hex: "#4CAF50"),
      relatedEras: ["pre_islamic_arabia", "muhammad_era", "islamic_golden_age"],
      revealType: .symbolism
    ),

    GnosticRevelation(
      id: "holy_days_sundown",
      title: "Why Holy Days Start at Sundown",
      hook: "Jewish holy days begin at sundown. Why?",
      revelation:
        "Because that's when the MOON comes out.\n\nJudaism at its core is MOON WORSHIP.\n\nLunar calendar.\nLunar holidays.\nCelebrations when the moon appears.\n\nShabbat begins at sunset Friday—when the moon rises.",
      sourceConnection: "Moon Worship",
      icon: "sunset.fill",
      accentColor: Color(hex: "#3F51B5"),
      relatedEras: ["ancient_judaism", "lunar_calendars", "sabbath_origins"],
      revealType: .calendar
    ),

    // MODERN ERA REVELATIONS

    GnosticRevelation(
      id: "pirates_federal_reserve",
      title: "Pirates of the Caribbean",
      hook: "Where is the Federal Reserve's home office?",
      revelation:
        "Puerto Rico.\n\nPIRATES OF THE CARIBBEAN.\n\nThe pirates' flag: Skull and crossbones on a BLACK SQUARE.\n\nThe black square represents SATURN.\nThe skull and bones was the KNIGHTS TEMPLAR symbol.\n\nThe Templars WERE the pirates.\nThey never went away—they became the banking system.",
      sourceConnection: "Templars → Banking",
      icon: "dollarsign.circle.fill",
      accentColor: Color(hex: "#4CAF50"),
      relatedEras: ["knights_templar", "age_of_piracy", "central_banking"],
      revealType: .institutional
    ),

    GnosticRevelation(
      id: "court_game",
      title: "Why You Go to COURT",
      hook: "You play basketball on a court. Tennis on a court.",
      revelation:
        "Why do you go to COURT?\n\nA court 'hearing' says the event starts at a certain time.\n\nIt's nothing but a big GAME. A show.\n\nThe legal system is theater—and you're the unwitting participant.\n\nThe world is crawling with occult symbols, but it's over the head of 99% of people.",
      sourceConnection: "Legal Etymology",
      icon: "sportscourt.fill",
      accentColor: Color(hex: "#FF9800"),
      relatedEras: ["legal_system", "maritime_law", "corporate_personhood"],
      revealType: .etymology
    ),

    GnosticRevelation(
      id: "divide_conquer",
      title: "How Truth Was Fragmented",
      hook: "One monastery got HALF the truth. Another got the other HALF.",
      revelation:
        "When priests were ordered to translate texts, the Vatican gave:\n\n• One monastery HALF the truth\n• Another monastery the OTHER HALF\n\nThese monasteries would never meet.\n\nNo one could ever know the WHOLE truth.\n\nDivide and conquer. Keep everybody stupid.\nThe guys on top control everything.",
      sourceConnection: "Information Control",
      icon: "rectangle.split.2x1.fill",
      accentColor: Color(hex: "#9E9E9E"),
      relatedEras: ["medieval_church", "library_of_alexandria", "vatican_archives"],
      revealType: .institutional
    ),

    GnosticRevelation(
      id: "phoenician_architects",
      title: "The Architects of Civilization",
      hook: "The Phoenician Canaanites designed everything.",
      revelation:
        "They designed:\n• Our political system\n• Our judicial system\n• Our monetary system\n\nIt's the story of Cain and Abel—the betrayal of humanity.\n\nThe Swiss Cross.\nSkull and Bones at Yale.\nThe two-sided political system.\n\nAll traced back to the Venetian Canaanites.",
      sourceConnection: "Phoenician → Modern",
      icon: "building.2.fill",
      accentColor: Color(hex: "#795548"),
      relatedEras: ["phoenician_empire", "venetian_republic", "modern_banking"],
      revealType: .institutional
    ),
  ]

  /// Get revelations for a specific era
  static func revelations(for eraId: String) -> [GnosticRevelation] {
    all.filter { $0.relatedEras.contains(eraId) }
  }

  /// Get random revelation
  static func randomRevelation() -> GnosticRevelation {
    all.randomElement() ?? all[0]
  }

  /// Get revelations by type
  static func revelations(ofType type: GnosticRevelation.RevealType) -> [GnosticRevelation] {
    all.filter { $0.revealType == type }
  }
}

// MARK: - Timeline Revelation Card View

struct TimelineRevelationCard: View {
  let revelation: GnosticRevelation
  @State private var isRevealed = false
  @State private var showFullScreen = false

  var body: some View {
    Button {
      showFullScreen = true
    } label: {
      VStack(alignment: .leading, spacing: 12) {
        // Header
        HStack {
          Image(systemName: "eye.trianglebadge.exclamationmark")
            .font(.caption)
            .foregroundColor(revelation.accentColor)

          Text("GNOSTIC REVELATION")
            .font(.caption.bold())
            .foregroundColor(revelation.accentColor)
            .tracking(1)

          Spacer()

          Image(systemName: revelation.icon)
            .foregroundColor(revelation.accentColor.opacity(0.5))
        }

        // Hook
        Text(revelation.hook)
          .font(.subheadline.bold())
          .foregroundColor(.white)
          .multilineTextAlignment(.leading)

        // Tap to reveal
        HStack {
          Text("Tap to reveal hidden knowledge")
            .font(.caption)
            .foregroundColor(.white.opacity(0.5))

          Spacer()

          Image(systemName: "chevron.right")
            .font(.caption)
            .foregroundColor(revelation.accentColor)
        }
      }
      .padding()
      .background(
        RoundedRectangle(cornerRadius: 16)
          .fill(Color.black.opacity(0.6))
          .overlay(
            RoundedRectangle(cornerRadius: 16)
              .stroke(revelation.accentColor.opacity(0.5), lineWidth: 1)
          )
      )
    }
    .buttonStyle(PlainButtonStyle())
    .sheet(isPresented: $showFullScreen) {
      RevelationFullScreenView(revelation: revelation)
    }
  }
}

// MARK: - Full Screen Revelation View

struct RevelationFullScreenView: View {
  let revelation: GnosticRevelation
  @Environment(\.dismiss) private var dismiss
  @State private var showContent = false
  @State private var contentOpacity: Double = 0

  var body: some View {
    ZStack {
      // Background
      Color(hex: "#0a0a1a")
        .ignoresSafeArea()

      // Animated background glow
      RadialGradient(
        colors: [
          revelation.accentColor.opacity(0.2),
          Color.clear,
        ],
        center: .center,
        startRadius: 0,
        endRadius: 300
      )
      .ignoresSafeArea()
      .opacity(showContent ? 1 : 0)

      VStack(spacing: 24) {
        // Close button
        HStack {
          Spacer()
          Button {
            dismiss()
          } label: {
            Image(systemName: "xmark.circle.fill")
              .font(.title2)
              .foregroundStyle(.white.opacity(0.5))
          }
        }
        .padding()

        Spacer()

        // Icon
        ZStack {
          Circle()
            .fill(revelation.accentColor.opacity(0.2))
            .frame(width: 100, height: 100)

          Image(systemName: revelation.icon)
            .font(.system(size: 40))
            .foregroundColor(revelation.accentColor)
        }
        .scaleEffect(showContent ? 1 : 0.5)
        .opacity(showContent ? 1 : 0)

        // Title
        Text(revelation.title)
          .font(.title.bold())
          .foregroundColor(.white)
          .multilineTextAlignment(.center)
          .opacity(showContent ? 1 : 0)

        // Hook
        Text(revelation.hook)
          .font(.headline)
          .foregroundColor(revelation.accentColor)
          .multilineTextAlignment(.center)
          .padding(.horizontal)
          .opacity(showContent ? 1 : 0)

        // Revelation content
        ScrollView(showsIndicators: false) {
          Text(revelation.revelation)
            .font(.body)
            .foregroundColor(.white.opacity(0.9))
            .multilineTextAlignment(.center)
            .padding()
            .background(
              RoundedRectangle(cornerRadius: 16)
                .fill(Color.white.opacity(0.05))
            )
            .padding(.horizontal)
        }
        .opacity(contentOpacity)

        // Source connection
        HStack {
          Image(systemName: "arrow.right.circle.fill")
            .foregroundColor(revelation.accentColor)

          Text(revelation.sourceConnection)
            .font(.caption.bold())
            .foregroundColor(revelation.accentColor)
        }
        .opacity(contentOpacity)

        Spacer()

        // Continue button
        Button {
          dismiss()
        } label: {
          Text("Continue Journey")
            .font(.headline)
            .foregroundColor(.black)
            .frame(maxWidth: .infinity)
            .padding()
            .background(revelation.accentColor)
            .cornerRadius(12)
        }
        .padding(.horizontal)
        .padding(.bottom, 30)
        .opacity(contentOpacity)
      }
    }
    .onAppear {
      withAnimation(.spring(response: 0.5, dampingFraction: 0.7)) {
        showContent = true
      }

      withAnimation(.easeIn(duration: 0.5).delay(0.3)) {
        contentOpacity = 1
      }
    }
  }
}

// MARK: - Timeline Integration Helper

enum TimelineRevelationHelper {
  /// Check if an era should show a revelation
  static func shouldShowRevelation(for eraId: String) -> Bool {
    !GnosticRevelationDatabase.revelations(for: eraId).isEmpty
  }

  /// Get the most relevant revelation for an era
  static func primaryRevelation(for eraId: String) -> GnosticRevelation? {
    GnosticRevelationDatabase.revelations(for: eraId).first
  }

  /// Get all revelations user hasn't seen yet (stored in UserDefaults)
  static func unseenRevelations() -> [GnosticRevelation] {
    let seenIds = UserDefaults.standard.stringArray(forKey: "seenRevelations") ?? []
    return GnosticRevelationDatabase.all.filter { !seenIds.contains($0.id) }
  }

  /// Mark revelation as seen
  static func markAsSeen(_ revelation: GnosticRevelation) {
    var seenIds = UserDefaults.standard.stringArray(forKey: "seenRevelations") ?? []
    if !seenIds.contains(revelation.id) {
      seenIds.append(revelation.id)
      UserDefaults.standard.set(seenIds, forKey: "seenRevelations")
    }
  }
}

// MARK: - Preview

#Preview {
  ZStack {
    Color(hex: "#0a0a1a")
      .ignoresSafeArea()

    VStack(spacing: 20) {
      TimelineRevelationCard(revelation: GnosticRevelationDatabase.all[0])
      TimelineRevelationCard(revelation: GnosticRevelationDatabase.all[5])
    }
    .padding()
  }
}
