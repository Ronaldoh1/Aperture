// BirthChartCourse.swift
// BIRTH CHART - Your Cosmic Blueprint

import SwiftUI
import Foundation

struct BirthChartCourse {
    static let shared = BirthChartCourse()
    
    let id = "birth_chart"
    let title = "Birth Chart & Astrology"
    let subtitle = "Your cosmic blueprint decoded"
    let icon = "star.circle.fill"
    let colorHex = "#673AB7"
    
    var color: Color { Color(hex: colorHex) }
    
    let modules: [AstroModule] = [
        
        AstroModule(
            id: "astro_1",
            number: 1,
            title: "What Is A Birth Chart?",
            subtitle: "The cosmic snapshot of your birth",
            lessons: [
                AstroLesson(
                    id: "a1_1",
                    title: "Your Cosmic Fingerprint",
                    content: """
**The Birth Chart Defined**

A birth chart (natal chart) is a map of where all the planets were at the EXACT moment you were born, as seen from your birth LOCATION.

It's like a cosmic photograph of the sky at your first breath.

**What You Need**
To calculate an accurate chart:
1. Birth DATE (month, day, year)
2. Birth TIME (as exact as possible)
3. Birth LOCATION (city, country)

Time and location matter because:
• The Ascendant (rising sign) changes every 2 hours
• The Moon changes signs every 2.5 days
• House positions depend on exact time and location

**What The Chart Shows**
• **Planets**: Different energies/drives in your psyche
• **Signs**: How those energies express
• **Houses**: In what life areas they manifest
• **Aspects**: How the energies interact with each other

**Not Fortune-Telling**
Astrology isn't about predicting specific events. It's a symbolic language for understanding psychological patterns, tendencies, and potentials.

Think of it as a user manual for your psyche—not a script for your life.

🔥 **Key Insight**: The chart shows tendencies, not destiny. You have free will within your cosmic pattern.
""",
                    keyFact: "Your birth chart requires exact time and location—not just your date."
                ),
                
                AstroLesson(
                    id: "a1_2",
                    title: "The Three Big Ones",
                    content: """
**Sun, Moon, and Rising: Your Core**

Most people only know their Sun sign. But you need all three for a basic picture.

**Sun Sign** ☉
• Your core identity, ego, conscious self
• What you're becoming, your life purpose
• "What sign are you?" = Sun sign
• Represents: The father, authority, vitality

**Moon Sign** ☽
• Your emotional nature, instincts, needs
• How you feel, react, nurture
• Your inner child, unconscious patterns
• Represents: The mother, emotions, intuition

**Rising Sign (Ascendant)** ⬆
• Your mask, first impression, appearance
• How others see you before they know you
• Your approach to new situations
• Represents: The persona, physical body, beginnings

**Example**
Sun in Leo: Core drive to shine, create, be recognized
Moon in Cancer: Emotional need for security, nurturing
Rising in Aries: Comes across as bold, direct, energetic

Same person might feel like a confident performer (Leo) who needs emotional safety (Cancer) and appears aggressive (Aries).

🔥 **Why This Matters**: "I'm a Scorpio but I don't relate" probably means your Moon or Rising tells a different story. The Sun is only part of you.
""",
                    keyFact: "Sun = who you're becoming, Moon = how you feel, Rising = how you appear."
                ),
                
                AstroLesson(
                    id: "a1_3",
                    title: "The 12 Houses",
                    content: """
**Life Areas**

The chart is divided into 12 houses, each governing a life domain:

**1st House** - Self, identity, appearance, beginnings
**2nd House** - Money, possessions, values, self-worth
**3rd House** - Communication, siblings, short trips, learning
**4th House** - Home, family, roots, private self
**5th House** - Creativity, romance, children, fun
**6th House** - Health, daily work, service, routines
**7th House** - Partnerships, marriage, contracts, open enemies
**8th House** - Death, transformation, shared resources, sex, occult
**9th House** - Travel, philosophy, higher education, publishing
**10th House** - Career, reputation, public image, authority
**11th House** - Friends, groups, hopes, humanitarian causes
**12th House** - Unconscious, isolation, spirituality, hidden enemies

**How It Works**
Planets in a house activate that life area. Saturn in 7th? Partnerships require work. Venus in 10th? Career involves beauty or diplomacy.

**Empty Houses**
Empty houses aren't "missing" anything. They're simply not where your main action is. Look to the ruling planet for clues.

🔥 **Application**: Find where your planets cluster. That's where your life energy concentrates.
""",
                    keyFact: "12 houses = 12 life areas. Planets in houses show where your energy goes."
                )
            ]
        ),
        
        AstroModule(
            id: "astro_2",
            number: 2,
            title: "The Planets",
            subtitle: "Cosmic forces within you",
            lessons: [
                AstroLesson(
                    id: "a2_1",
                    title: "The Personal Planets",
                    content: """
**Fast-Moving Planets (Personal)**

These planets move quickly and represent individual traits:

**Sun** ☉
• Core identity, purpose, vitality
• Rules Leo
• Cycle: 1 year through zodiac
• In your chart: Where you shine

**Moon** ☽
• Emotions, instincts, needs
• Rules Cancer
• Cycle: 28 days
• In your chart: What you need to feel safe

**Mercury** ☿
• Mind, communication, learning
• Rules Gemini & Virgo
• Cycle: ~88 days
• In your chart: How you think and communicate

**Venus** ♀
• Love, beauty, values, pleasure
• Rules Taurus & Libra
• Cycle: ~225 days
• In your chart: What you love, how you attract

**Mars** ♂
• Action, desire, aggression, drive
• Rules Aries (& traditionally Scorpio)
• Cycle: ~2 years
• In your chart: How you fight and pursue

🔥 **Note**: These planets shape your personality directly. Everyone born the same week has similar Mercury/Venus/Mars positions—but different Moon and definitely different Rising.
""",
                    keyFact: "Personal planets (Sun through Mars) define your individual personality traits."
                ),
                
                AstroLesson(
                    id: "a2_2",
                    title: "The Social & Outer Planets",
                    content: """
**Slow-Moving Planets (Generational)**

These planets move slowly and represent generational/collective themes:

**Jupiter** ♃
• Expansion, luck, philosophy, abundance
• Rules Sagittarius (& traditionally Pisces)
• Cycle: ~12 years
• In your chart: Where you grow and have luck

**Saturn** ♄
• Structure, limitation, karma, mastery
• Rules Capricorn (& traditionally Aquarius)
• Cycle: ~29 years
• In your chart: Where you face challenges and must mature

**Uranus** ♅
• Revolution, freedom, awakening, technology
• Rules Aquarius
• Cycle: ~84 years
• In your chart: Where you're unconventional, rebel

**Neptune** ♆
• Dreams, illusion, spirituality, dissolution
• Rules Pisces
• Cycle: ~165 years
• In your chart: Where you're idealistic or confused

**Pluto** ♇
• Transformation, power, death/rebirth, shadow
• Rules Scorpio
• Cycle: ~248 years
• In your chart: Where you undergo deep transformation

🔥 **Generational Markers**: Everyone born within a few years shares Uranus, Neptune, Pluto positions. These define generations: Pluto in Scorpio (1983-1995) are the "transformation generation."
""",
                    keyFact: "Outer planets define generational themes—everyone your age shares them."
                ),
                
                AstroLesson(
                    id: "a2_3",
                    title: "The 12 Signs",
                    content: """
**Zodiac Signs = HOW Planets Express**

Each sign is an archetype with distinct qualities:

**Fire Signs** (initiative, spirit)
• **Aries** ♈: Pioneer, warrior, leader
• **Leo** ♌: Performer, creator, king
• **Sagittarius** ♐: Explorer, philosopher, archer

**Earth Signs** (manifestation, material)
• **Taurus** ♉: Builder, sensualist, stabilizer
• **Virgo** ♍: Analyst, healer, perfectionist
• **Capricorn** ♑: Achiever, authority, master

**Air Signs** (intellect, connection)
• **Gemini** ♊: Communicator, trickster, twin
• **Libra** ♎: Harmonizer, diplomat, artist
• **Aquarius** ♒: Innovator, humanitarian, rebel

**Water Signs** (emotion, intuition)
• **Cancer** ♋: Nurturer, protector, mother
• **Scorpio** ♏: Transformer, detective, phoenix
• **Pisces** ♓: Mystic, healer, dreamer

**Modalities**
• Cardinal (Aries, Cancer, Libra, Cap): Initiates
• Fixed (Taurus, Leo, Scorpio, Aquarius): Sustains
• Mutable (Gemini, Virgo, Sag, Pisces): Adapts

🔥 **Application**: Mars in Aries = direct aggression. Mars in Pisces = passive aggression or spiritual warrior. Same planet, different expression.
""",
                    keyFact: "Signs show HOW planets express—the style and flavor of each energy."
                )
            ]
        ),
        
        AstroModule(
            id: "astro_3",
            number: 3,
            title: "Aspects & Interpretation",
            subtitle: "How planets talk to each other",
            lessons: [
                AstroLesson(
                    id: "a3_1",
                    title: "Major Aspects",
                    content: """
**Aspects = Planetary Conversations**

When planets form specific angles, they interact:

**Conjunction (0°)** ☌
• Planets merge, intensify each other
• Can be harmonious or tense depending on planets
• Example: Sun conjunct Moon = integrated personality

**Opposition (180°)** ☍
• Tension, awareness, projection
• Need to balance both sides
• Example: Mars opposite Saturn = drive vs restriction

**Trine (120°)** △
• Flow, ease, natural talent
• Can be taken for granted
• Example: Venus trine Jupiter = luck in love

**Square (90°)** □
• Friction, challenge, growth
• Requires effort, builds strength
• Example: Moon square Pluto = emotional intensity

**Sextile (60°)** ⚹
• Opportunity, mild harmony
• Requires action to activate
• Example: Mercury sextile Uranus = innovative thinking

**Orbs**
Aspects don't have to be exact. An "orb" of a few degrees still counts. Tighter orbs = stronger effects.

🔥 **Squares aren't bad**: They're where you grow. A chart with all trines might have ease but lacks drive to develop.
""",
                    keyFact: "Aspects show how planets interact—trines flow, squares challenge, conjunctions merge."
                ),
                
                AstroLesson(
                    id: "a3_2",
                    title: "Reading Your Chart",
                    content: """
**The Art of Synthesis**

Reading a chart isn't just listing planets. It's seeing the whole pattern.

**Step 1: Get The Big Picture**
• Element balance (Fire/Earth/Air/Water)
• Modality balance (Cardinal/Fixed/Mutable)
• Hemisphere emphasis (upper/lower, left/right)
• Chart shape patterns

**Step 2: The Core Trinity**
• Sun sign, house, aspects
• Moon sign, house, aspects
• Rising sign, ruler, aspects

**Step 3: Find Standouts**
• Stelliums (3+ planets in one sign/house)
• Planets on angles (Ascendant, Midheaven)
• The most aspected planet
• Unaspected planets ("wild cards")

**Step 4: Tell The Story**
Weave it together. A Cancer Sun in the 10th house with Moon in Capricorn in the 4th suggests a career/home reversal—nurturing professionally, structured privately.

**Step 5: Current Transits**
Where are the planets NOW relative to your birth chart? This shows current themes.

🔥 **Remember**: The chart is a map, not a cage. It shows tendencies you can work with or against. Awareness is freedom.
""",
                    keyFact: "Chart reading is synthesis—weaving individual factors into a coherent story."
                )
            ]
        )
    ]
}

// Supporting Types
struct AstroModule: Identifiable {
    let id: String
    let number: Int
    let title: String
    let subtitle: String
    let lessons: [AstroLesson]
}

struct AstroLesson: Identifiable {
    let id: String
    let title: String
    let content: String
    let keyFact: String
}

// MARK: - Birth Chart Calculator

struct BirthChartCalculator {
    
    // Simplified Sun sign calculation
    static func getSunSign(month: Int, day: Int) -> ZodiacSign {
        let dates: [(ZodiacSign, Int, Int, Int, Int)] = [
            (.aries, 3, 21, 4, 19),
            (.taurus, 4, 20, 5, 20),
            (.gemini, 5, 21, 6, 20),
            (.cancer, 6, 21, 7, 22),
            (.leo, 7, 23, 8, 22),
            (.virgo, 8, 23, 9, 22),
            (.libra, 9, 23, 10, 22),
            (.scorpio, 10, 23, 11, 21),
            (.sagittarius, 11, 22, 12, 21),
            (.capricorn, 12, 22, 1, 19),
            (.aquarius, 1, 20, 2, 18),
            (.pisces, 2, 19, 3, 20)
        ]
        
        for (sign, startM, startD, endM, endD) in dates {
            if (month == startM && day >= startD) || (month == endM && day <= endD) {
                return sign
            }
        }
        // Handle Capricorn wrapping around year
        if month == 12 && day >= 22 || month == 1 && day <= 19 {
            return .capricorn
        }
        return .aries // Default
    }
    
    // Simplified Moon sign (approximate based on day of lunar cycle)
    static func getMoonSignApprox(month: Int, day: Int, year: Int) -> ZodiacSign {
        // This is a simplified calculation - real calculation requires ephemeris
        let dayOfYear = (month - 1) * 30 + day
        let yearOffset = (year - 2000) * 13 // Approximate
        let moonPosition = (dayOfYear + yearOffset) % 30
        let signIndex = (moonPosition * 12) / 30
        return ZodiacSign.allCases[signIndex % 12]
    }
    
    // Rising sign (requires birth time - this is approximate)
    static func getRisingSignApprox(sunSign: ZodiacSign, hourOfBirth: Int) -> ZodiacSign {
        // Very rough approximation
        // Rising sign moves ~1 sign every 2 hours
        // At sunrise, rising = sun sign
        let signOffset = (hourOfBirth - 6) / 2 // 6am = sunrise approximate
        let risingIndex = (sunSign.index + signOffset + 12) % 12
        return ZodiacSign.allCases[risingIndex]
    }
    
    // Personal Year calculation (numerology)
    static func getPersonalYear(birthMonth: Int, birthDay: Int, currentYear: Int) -> Int {
        let sum = birthMonth + birthDay + currentYear
        var reduced = sum
        while reduced > 9 && reduced != 11 && reduced != 22 {
            reduced = String(reduced).compactMap { $0.wholeNumberValue }.reduce(0, +)
        }
        return reduced
    }
}

// MARK: - ZodiacSign Extensions for BirthChart
// Main ZodiacSign enum is in UserProfileEntity.swift

extension ZodiacSign: Identifiable {
    var id: String { rawValue }
    
    var index: Int {
        ZodiacSign.allCases.firstIndex(of: self) ?? 0
    }
    
    var elementString: String {
        switch self {
        case .aries, .leo, .sagittarius: return "Fire 🔥"
        case .taurus, .virgo, .capricorn: return "Earth 🌍"
        case .gemini, .libra, .aquarius: return "Air 💨"
        case .cancer, .scorpio, .pisces: return "Water 💧"
        }
    }
    
    var modality: String {
        switch self {
        case .aries, .cancer, .libra, .capricorn: return "Cardinal"
        case .taurus, .leo, .scorpio, .aquarius: return "Fixed"
        case .gemini, .virgo, .sagittarius, .pisces: return "Mutable"
        }
    }
    
    var ruler: String {
        switch self {
        case .aries: return "Mars ♂"
        case .taurus: return "Venus ♀"
        case .gemini: return "Mercury ☿"
        case .cancer: return "Moon ☽"
        case .leo: return "Sun ☉"
        case .virgo: return "Mercury ☿"
        case .libra: return "Venus ♀"
        case .scorpio: return "Pluto ♇ / Mars ♂"
        case .sagittarius: return "Jupiter ♃"
        case .capricorn: return "Saturn ♄"
        case .aquarius: return "Uranus ♅ / Saturn ♄"
        case .pisces: return "Neptune ♆ / Jupiter ♃"
        }
    }
    
    var traits: [String] {
        switch self {
        case .aries: return ["Courageous", "Pioneering", "Impulsive", "Competitive"]
        case .taurus: return ["Stable", "Sensual", "Stubborn", "Practical"]
        case .gemini: return ["Curious", "Communicative", "Scattered", "Witty"]
        case .cancer: return ["Nurturing", "Emotional", "Protective", "Moody"]
        case .leo: return ["Confident", "Creative", "Dramatic", "Generous"]
        case .virgo: return ["Analytical", "Helpful", "Critical", "Practical"]
        case .libra: return ["Diplomatic", "Aesthetic", "Indecisive", "Fair"]
        case .scorpio: return ["Intense", "Transformative", "Secretive", "Powerful"]
        case .sagittarius: return ["Adventurous", "Philosophical", "Blunt", "Optimistic"]
        case .capricorn: return ["Ambitious", "Disciplined", "Pessimistic", "Responsible"]
        case .aquarius: return ["Innovative", "Humanitarian", "Detached", "Rebellious"]
        case .pisces: return ["Intuitive", "Compassionate", "Escapist", "Dreamy"]
        }
    }
    
    var color: Color {
        switch self {
        case .aries: return .red
        case .taurus: return .green
        case .gemini: return .yellow
        case .cancer: return .gray
        case .leo: return .orange
        case .virgo: return Color(hex: "#8B4513")
        case .libra: return .pink
        case .scorpio: return Color(hex: "#8B0000")
        case .sagittarius: return .purple
        case .capricorn: return Color(hex: "#2F4F4F")
        case .aquarius: return .cyan
        case .pisces: return Color(hex: "#48D1CC")
        }
    }
}

// MARK: - Birth Data & Results

struct BirthData: Codable {
    var month: Int
    var day: Int
    var year: Int
    var hour: Int
    var minute: Int
    var city: String
    var country: String
}

struct ChartResult: Codable {
    let sunSign: ZodiacSign
    let moonSign: ZodiacSign
    let risingSign: ZodiacSign
    let personalYear: Int
}

struct AstroProgress: Codable {
    var completedLessons: [String]
    var savedBirthData: BirthData?
    var savedChart: ChartResult?
    static var `default`: AstroProgress { AstroProgress(completedLessons: [], savedBirthData: nil, savedChart: nil) }
}
