// NumerologyCourse.swift
// NUMEROLOGY - The Code Behind the Numbers
// Understanding the ancient system of numeric symbolism
// From Life Path to Master Numbers

import Foundation
import SwiftUI

// MARK: - Numerology Course

struct NumerologyCourse {
    static let shared = NumerologyCourse()
    
    let id = "numerology"
    let title = "Numerology"
    let subtitle = "The Code Behind the Numbers"
    let icon = "number.circle.fill"
    let colorHex = "#3F51B5"
    let totalMinutes = 180
    
    var color: Color { Color(hex: colorHex) }
    
    // MARK: - Core Numbers
    
    struct CoreNumber: Identifiable {
        let id: Int
        let name: String
        let keywords: [String]
        let meaning: String
        let shadow: String
        let lifeLesson: String
        let famousExamples: [String]
        let color: String
        let element: String
    }
    
    static let coreNumbers: [CoreNumber] = [
        CoreNumber(
            id: 1,
            name: "The Pioneer",
            keywords: ["Leadership", "Independence", "Innovation", "Courage"],
            meaning: """
            ONE is the number of new beginnings, individuality, and self-determination.
            
            1s are natural leaders who forge their own path. They don't follow — they create. The energy is masculine, assertive, and pioneering.
            
            In numerology, 1 represents the divine spark of creation — the point before the line, the seed before the tree, the thought before the action.
            
            Life Path 1s are here to learn independence and self-reliance. They must overcome the fear of standing alone.
            """,
            shadow: "Ego, stubbornness, isolation, aggression, domination. The shadow 1 mistakes independence for superiority.",
            lifeLesson: "Lead without dominating. Stand alone without being lonely. Create without destroying others' creations.",
            famousExamples: ["Martin Luther King Jr.", "Steve Jobs", "Lady Gaga"],
            color: "Red/Gold",
            element: "Fire"
        ),
        
        CoreNumber(
            id: 2,
            name: "The Diplomat",
            keywords: ["Partnership", "Balance", "Sensitivity", "Cooperation"],
            meaning: """
            TWO is the number of duality, partnership, and harmony.
            
            2s are natural mediators and peacemakers. They sense the needs of others and work to create balance. The energy is feminine, receptive, and collaborative.
            
            In numerology, 2 represents the first division — one becomes two, unity becomes relationship, self becomes other.
            
            Life Path 2s are here to learn cooperation without losing themselves. They must balance giving with receiving.
            """,
            shadow: "Codependency, over-sensitivity, indecision, manipulation through emotion, passive-aggression.",
            lifeLesson: "Partner without losing yourself. Support without enabling. Balance your needs with others'.",
            famousExamples: ["Barack Obama", "Jennifer Aniston", "Kanye West"],
            color: "Orange/Peach",
            element: "Water"
        ),
        
        CoreNumber(
            id: 3,
            name: "The Communicator",
            keywords: ["Expression", "Creativity", "Joy", "Inspiration"],
            meaning: """
            THREE is the number of self-expression, creativity, and communication.
            
            3s are natural artists, speakers, and entertainers. They bring joy and inspiration to others through their creative gifts.
            
            In numerology, 3 represents the trinity — thought, word, action. It's the synthesis of 1 (thesis) and 2 (antithesis) into something new.
            
            Life Path 3s are here to express their authentic voice. They must overcome self-doubt and share their gifts.
            """,
            shadow: "Scattered energy, superficiality, gossip, drama, inability to focus, emotional volatility.",
            lifeLesson: "Express without seeking validation. Create for the joy of creating. Communicate truth, not just charm.",
            famousExamples: ["John Lennon", "Celine Dion", "Snoop Dogg"],
            color: "Yellow",
            element: "Fire/Air"
        ),
        
        CoreNumber(
            id: 4,
            name: "The Builder",
            keywords: ["Foundation", "Structure", "Discipline", "Hard Work"],
            meaning: """
            FOUR is the number of stability, foundation, and manifestation.
            
            4s are the builders of the world — they take ideas and make them real through discipline and persistent effort. The energy is practical, grounded, and reliable.
            
            In numerology, 4 represents the four elements, four directions, four seasons — the complete structure of physical reality.
            
            Life Path 4s are here to build lasting foundations. They must learn that shortcuts lead to collapse.
            """,
            shadow: "Rigidity, workaholism, stubbornness, limitation thinking, resistance to change, control issues.",
            lifeLesson: "Build with flexibility. Work hard but know when to rest. Create structure that serves life, not restricts it.",
            famousExamples: ["Oprah Winfrey", "Bill Gates", "Elton John"],
            color: "Green",
            element: "Earth"
        ),
        
        CoreNumber(
            id: 5,
            name: "The Freedom Seeker",
            keywords: ["Change", "Adventure", "Freedom", "Versatility"],
            meaning: """
            FIVE is the number of change, freedom, and experience.
            
            5s crave variety and resist routine. They're adventurers, travelers, and experimenters who learn through experience.
            
            In numerology, 5 is the midpoint (between 1-9), representing the human being — five senses, five fingers, five pointed star (humanity reaching upward).
            
            Life Path 5s are here to embrace change and learn through experience. They must find freedom within responsibility.
            """,
            shadow: "Restlessness, addiction, irresponsibility, commitment phobia, scattered energy, excess in all forms.",
            lifeLesson: "Find freedom within commitment. Change without running away. Experience without addiction.",
            famousExamples: ["Abraham Lincoln", "Angelina Jolie", "Mick Jagger"],
            color: "Turquoise/Blue",
            element: "Air"
        ),
        
        CoreNumber(
            id: 6,
            name: "The Nurturer",
            keywords: ["Responsibility", "Love", "Family", "Healing"],
            meaning: """
            SIX is the number of love, responsibility, and service.
            
            6s are natural caregivers and healers. They feel responsible for the wellbeing of others and create harmonious environments.
            
            In numerology, 6 is the most harmonious number — the hexagon is nature's most efficient structure (honeycomb, snowflakes).
            
            Life Path 6s are here to learn unconditional love. They must balance caring for others with caring for self.
            """,
            shadow: "Martyrdom, control through caretaking, perfectionism, self-righteousness, meddling in others' lives.",
            lifeLesson: "Love without enabling. Help without controlling. Accept imperfection in self and others.",
            famousExamples: ["John Lennon", "Michael Jackson", "Sylvester Stallone"],
            color: "Pink/Indigo",
            element: "Earth/Water"
        ),
        
        CoreNumber(
            id: 7,
            name: "The Seeker",
            keywords: ["Wisdom", "Introspection", "Spirituality", "Analysis"],
            meaning: """
            SEVEN is the number of seeking, wisdom, and spiritual depth.
            
            7s are natural philosophers, researchers, and mystics. They need solitude to process their deep inner world.
            
            In numerology, 7 is the most spiritual number — 7 chakras, 7 days of creation, 7 notes in music, 7 colors in rainbow.
            
            Life Path 7s are here to seek truth beneath the surface. They must balance isolation with connection.
            """,
            shadow: "Isolation, cynicism, overthinking, emotional repression, superiority complex, spiritual bypassing.",
            lifeLesson: "Seek truth without losing love. Think deeply but stay connected. Find the sacred in the ordinary.",
            famousExamples: ["Leonardo DiCaprio", "Princess Diana", "Julia Roberts"],
            color: "Violet/Purple",
            element: "Water"
        ),
        
        CoreNumber(
            id: 8,
            name: "The Powerhouse",
            keywords: ["Abundance", "Power", "Achievement", "Karma"],
            meaning: """
            EIGHT is the number of power, abundance, and karmic balance.
            
            8s are here to master the material world — money, business, authority. The 8 turned sideways is infinity.
            
            In numerology, 8 represents the balance of spiritual and material, above and below. It's the number of manifestation.
            
            Life Path 8s are here to learn responsible use of power. They must balance acquisition with generosity.
            """,
            shadow: "Greed, workaholism, power abuse, materialism, fear of loss, karmic debt from past actions.",
            lifeLesson: "Gain power to empower others. Acquire abundance to share it. Lead with integrity.",
            famousExamples: ["Nelson Mandela", "Pablo Picasso", "Sandra Bullock"],
            color: "Gold/Bronze",
            element: "Earth"
        ),
        
        CoreNumber(
            id: 9,
            name: "The Humanitarian",
            keywords: ["Completion", "Wisdom", "Service", "Universal Love"],
            meaning: """
            NINE is the number of completion, wisdom, and universal service.
            
            9s are old souls with a broad perspective. They're here to serve humanity through their accumulated wisdom.
            
            In numerology, 9 contains all numbers (1+2+3+4+5+6+7+8=36=3+6=9). It's the end of the cycle, holding all lessons.
            
            Life Path 9s are here to let go and serve. They must release attachment to outcomes and trust the bigger picture.
            """,
            shadow: "Martyrdom, spiritual superiority, inability to receive, holding onto the past, scattered philanthropy.",
            lifeLesson: "Give without attachment. Serve without sacrifice. Complete cycles before starting new ones.",
            famousExamples: ["Mahatma Gandhi", "Mother Teresa", "Jim Carrey"],
            color: "White/All Colors",
            element: "Fire"
        )
    ]
    
    // MARK: - Master Numbers
    
    static let masterNumbers: [MasterNumber] = [
        MasterNumber(
            id: 11,
            name: "The Illuminator",
            baseNumber: 2,
            keywords: ["Intuition", "Inspiration", "Visionary", "Spiritual Messenger"],
            meaning: """
            ELEVEN is the first Master Number — the intuitive visionary.
            
            11s have heightened intuition and spiritual sensitivity. They receive downloads, visions, and insights that aren't available to others.
            
            The challenge: Handling the intensity. 11 energy is electric, unstable, and can be overwhelming.
            
            11s often oscillate between their master potential (visionary leader) and their base number (2 = sensitive, indecisive).
            
            Famous 11s channel inspiration into form that changes the world — or they collapse under the pressure and live as wounded 2s.
            """,
            challenge: "Ground the visions into reality. Don't get lost in the spiritual realm. The lightning must reach the ground.",
            gift: "Direct access to higher dimensions. Ability to inspire and illuminate others. Natural spiritual teacher."
        ),
        
        MasterNumber(
            id: 22,
            name: "The Master Builder",
            baseNumber: 4,
            keywords: ["Manifestation", "Large-scale creation", "Practical visionary", "Legacy"],
            meaning: """
            TWENTY-TWO is the Master Builder — the most powerful number in numerology.
            
            22s can turn the grandest visions into physical reality. They build empires, movements, institutions that outlast them.
            
            The challenge: The pressure is immense. 22 carries the vision of 11 plus the building capacity of 4, doubled.
            
            22s often feel they're meant for something huge but struggle to manifest it. When they do, they change the world.
            
            Many 22s live as 4s — hardworking but not reaching their master potential. The leap requires tremendous courage and support.
            """,
            challenge: "Don't shrink from the bigness of your calling. Build what scares you. Leave a legacy.",
            gift: "Ability to manifest the impossible. Turning dreams into tangible structures. Architecting the future."
        ),
        
        MasterNumber(
            id: 33,
            name: "The Master Teacher",
            baseNumber: 6,
            keywords: ["Compassion", "Healing", "Spiritual service", "Selfless love"],
            meaning: """
            THIRTY-THREE is the Master Teacher — the rarest and most evolved vibration.
            
            33s are here to teach through example, radiating unconditional love and healing without ego.
            
            The challenge: Few can sustain 33 energy. It requires complete selflessness — the individual dissolves into service.
            
            Most people with 33 in their chart live as 6s with occasional flashes of master energy.
            
            True 33 expression is the spiritual master — one who teaches by being, heals by presence, loves without condition.
            """,
            challenge: "Complete surrender of ego. Service without seeking recognition. Loving without attachment.",
            gift: "Pure channel for divine love. Ability to heal and transform through presence. The embodiment of compassion."
        ),
        
        MasterNumber(
            id: 44,
            name: "The Master Healer",
            baseNumber: 8,
            keywords: ["Material mastery", "Discipline", "Metamorphosis", "Sacred materialist"],
            meaning: """
            FORTY-FOUR is the Master Healer of the material realm.
            
            44s master both spiritual and material worlds completely. They heal through practical transformation.
            
            The challenge: Extremely rare and demanding. 44 requires mastering 8's power lessons at the highest level.
            
            44s might be found healing economic systems, transforming institutions, or channeling resources to where they're needed most.
            
            This is the number of someone who can hold immense material power without corruption — and use it for healing.
            """,
            challenge: "Complete integrity with power. Using material mastery for service. Transforming broken systems.",
            gift: "Healing through practical action. Transforming material reality. Sacred mastery of resources."
        )
    ]
    
    // MARK: - Life Path Calculation
    
    static func calculateLifePath(birthdate: Date) -> (number: Int, isMaster: Bool) {
        let calendar = Calendar.current
        let components = calendar.dateComponents([.year, .month, .day], from: birthdate)
        
        guard let year = components.year,
              let month = components.month,
              let day = components.day else {
            return (0, false)
        }
        
        // Reduce each component
        let reducedMonth = reduceNumber(month)
        let reducedDay = reduceNumber(day)
        let reducedYear = reduceNumber(year)
        
        // Sum and reduce (but check for master numbers)
        let sum = reducedMonth + reducedDay + reducedYear
        
        // Check for master numbers before final reduction
        if sum == 11 || sum == 22 || sum == 33 || sum == 44 {
            return (sum, true)
        }
        
        let finalNumber = reduceNumber(sum)
        return (finalNumber, false)
    }
    
    static func reduceNumber(_ number: Int) -> Int {
        var n = number
        while n > 9 && n != 11 && n != 22 && n != 33 && n != 44 {
            n = String(n).compactMap { $0.wholeNumberValue }.reduce(0, +)
        }
        return n
    }
    
    // MARK: - Modules
    
    let modules: [NumModule] = [
        NumModule(
            id: "num_1",
            number: 1,
            title: "What Is Numerology?",
            subtitle: "The ancient system of number meaning",
            content: """
**NUMEROLOGY: THE CODE BEHIND NUMBERS**

Numerology is the study of the symbolic meaning of numbers and their influence on human life.

**Ancient Origins:**
• Pythagoras (570-495 BCE) — "Numbers rule the universe"
• Kabbalah — Hebrew letter-number correspondences
• Chinese numerology — luck and energy of numbers
• Vedic numerology — planetary associations

**The Core Premise:**
Numbers aren't just quantities — they're qualities. Each number from 1-9 has a distinct vibration, personality, and life lesson.

**How It Works:**
Your birth date contains a code. When you reduce it to single digits (or master numbers), you reveal your Life Path Number — the central theme of your existence.

**Is It "Real"?**
Numerology isn't science. It's a symbolic system — like astrology, tarot, or dream interpretation.

You don't have to believe numbers literally control your life. You can use numerology as:
• A framework for self-reflection
• A language for discussing life themes
• A pattern recognition tool
• A way to understand different personality types

**The Test:**
Calculate your Life Path Number. Read the description. Does it resonate? Does it illuminate patterns you've observed in your life?

If yes, the system has utility — regardless of mechanism.
"""
        ),
        
        NumModule(
            id: "num_2",
            number: 2,
            title: "Calculating Your Life Path",
            subtitle: "The most important number in your chart",
            content: """
**LIFE PATH NUMBER**

Your Life Path is the most significant number in numerology. It's calculated from your full birth date and represents:
• Your life's central theme
• Your natural talents
• Your challenges to overcome
• The lessons you're here to learn

**HOW TO CALCULATE:**

Add all digits of your birth date, then reduce to a single digit (or master number).

**Example: July 4, 1984**

Month: 7
Day: 4
Year: 1+9+8+4 = 22 (Master Number, don't reduce)

Total: 7 + 4 + 22 = 33 (Master Number!)

If the person was born July 5, 1984:
7 + 5 + 22 = 34 → 3+4 = 7

**MASTER NUMBER RULES:**
When you encounter 11, 22, 33, or 44 at any step, don't reduce further. These are Master Numbers with special significance.

**INTERPRETATION:**
Your Life Path isn't your destiny — it's your curriculum. You have free will in how you express the energy.

A Life Path 8 might express as:
• Corporate CEO (positive power)
• Criminal boss (negative power)
• Bankrupt gambler (failed power lesson)
• Philanthropist (transcended power)

Same number. Different choices.
"""
        ),
        
        NumModule(
            id: "num_3",
            number: 3,
            title: "The Numbers 1-9",
            subtitle: "Core vibrations and meanings",
            content: """
**THE SINGLE DIGITS**

Each number 1-9 has a core vibration:

**1 - The Pioneer**
Keywords: Leadership, independence, innovation
Challenge: Ego, isolation
Lesson: Lead without dominating

**2 - The Diplomat**
Keywords: Partnership, balance, sensitivity
Challenge: Codependency, indecision
Lesson: Cooperate without losing self

**3 - The Communicator**
Keywords: Expression, creativity, joy
Challenge: Scattered energy, superficiality
Lesson: Express authentically

**4 - The Builder**
Keywords: Foundation, discipline, hard work
Challenge: Rigidity, workaholism
Lesson: Build with flexibility

**5 - The Freedom Seeker**
Keywords: Change, adventure, experience
Challenge: Restlessness, addiction
Lesson: Freedom within responsibility

**6 - The Nurturer**
Keywords: Love, family, healing
Challenge: Martyrdom, control
Lesson: Love without enabling

**7 - The Seeker**
Keywords: Wisdom, spirituality, analysis
Challenge: Isolation, cynicism
Lesson: Seek truth, stay connected

**8 - The Powerhouse**
Keywords: Abundance, power, karma
Challenge: Greed, power abuse
Lesson: Power to empower others

**9 - The Humanitarian**
Keywords: Completion, service, wisdom
Challenge: Martyrdom, holding on
Lesson: Let go and serve
"""
        ),
        
        NumModule(
            id: "num_4",
            number: 4,
            title: "Master Numbers",
            subtitle: "11, 22, 33 — The higher octaves",
            content: """
**MASTER NUMBERS**

Master Numbers are double digits that aren't reduced: 11, 22, 33 (and sometimes 44).

They represent higher potential — but also higher pressure.

**11 - The Illuminator**
Base: 2 (sensitivity) amplified
Gift: Visionary intuition, spiritual insight
Challenge: Can you handle the intensity?
Many 11s oscillate between genius and instability.

**22 - The Master Builder**
Base: 4 (builder) amplified
Gift: Manifesting grand visions into reality
Challenge: The pressure to build something huge
Many 22s feel called to something big but struggle to start.

**33 - The Master Teacher**
Base: 6 (nurturer) amplified
Gift: Teaching through unconditional love
Challenge: Complete selflessness required
True 33 expression is rare — most live as 6s.

**THE CATCH:**
Having a Master Number doesn't make you special. It makes your lessons harder.

Master Number people often feel:
• Intense pressure they can't explain
• Like they're meant for something big
• Unable to live "normal" lives
• Oscillating between their potential and their base number

**THE INTEGRATION:**
Master Numbers must integrate their base number first. An 11 who can't function as a 2 (balanced, cooperative) will be an unstable 11. A 22 who can't be a 4 (disciplined, hardworking) will be a dreamer, not a builder.
"""
        ),
        
        NumModule(
            id: "num_5",
            number: 5,
            title: "Other Core Numbers",
            subtitle: "Expression, Soul Urge, Personality",
            content: """
**BEYOND LIFE PATH**

Numerology includes several other significant numbers calculated from your name:

**EXPRESSION NUMBER (Destiny Number)**
Calculated from: Full birth name
Represents: Your natural abilities, how you express in the world
It's what you DO with your life.

**SOUL URGE NUMBER (Heart's Desire)**
Calculated from: Vowels in your name
Represents: Your deepest motivations, what you truly want
It's what DRIVES you from within.

**PERSONALITY NUMBER**
Calculated from: Consonants in your name
Represents: How others perceive you, your outer mask
It's what others SEE.

**NAME CALCULATION:**
Each letter corresponds to a number:

A=1, B=2, C=3, D=4, E=5, F=6, G=7, H=8, I=9
J=1, K=2, L=3, M=4, N=5, O=6, P=7, Q=8, R=9
S=1, T=2, U=3, V=4, W=5, X=6, Y=7, Z=8

Add all letters, reduce to single digit (or master number).

**THE FULL PICTURE:**
Life Path + Expression + Soul Urge + Personality = Your numerology profile.

These can harmonize or conflict. A Life Path 7 (seeker, solitary) with Expression 3 (communicator, social) might struggle to reconcile inner need for solitude with outer role as performer.

Understanding the tensions helps you integrate the different parts of yourself.
"""
        ),
        
        NumModule(
            id: "num_6",
            number: 6,
            title: "Personal Year Cycles",
            subtitle: "The 9-year rhythm of life",
            content: """
**PERSONAL YEAR CYCLES**

Life moves in 9-year cycles. Each year has a different theme.

**CALCULATION:**
Add your birth month + birth day + current year, reduce.

Example: Born July 4, current year 2026
7 + 4 + 2+0+2+6 = 21 → 2+1 = 3
Personal Year 3 in 2026

**THE CYCLE:**

**Year 1 - New Beginnings**
Plant seeds. Start projects. Assert yourself.

**Year 2 - Patience & Partnership**
Wait. Cooperate. Build relationships.

**Year 3 - Expression & Creativity**
Create. Communicate. Enjoy life.

**Year 4 - Foundation & Hard Work**
Build. Organize. Discipline.

**Year 5 - Change & Freedom**
Embrace change. Travel. Expand.

**Year 6 - Responsibility & Love**
Family. Home. Service. Commitment.

**Year 7 - Introspection & Spirituality**
Go inward. Study. Seek wisdom.

**Year 8 - Abundance & Power**
Harvest. Business. Recognition.

**Year 9 - Completion & Release**
Let go. Finish cycles. Prepare for renewal.

**PRACTICAL USE:**
Don't fight the cycle. A Year 7 isn't for starting new businesses — it's for reflection. A Year 1 isn't for passive waiting — it's for bold action.

Working WITH the cycle makes life flow easier.
"""
        )
    ]
}

// MARK: - Supporting Types

struct NumModule: Identifiable {
    let id: String
    let number: Int
    let title: String
    let subtitle: String
    let content: String
}

struct MasterNumber: Identifiable {
    let id: Int
    let name: String
    let baseNumber: Int
    let keywords: [String]
    let meaning: String
    let challenge: String
    let gift: String
}

// MARK: - Letter Values for Name Calculations
// Pythagorean numerology: A=1, B=2... I=9, J=1, K=2... (cycles 1-9)

struct NumerologyLetterValues {
    
    /// Letter to number mapping (Pythagorean system)
    /// A-I = 1-9, J-R = 1-9, S-Z = 1-8
    static func value(for character: Character) -> Int {
        guard let char = character.lowercased().first else { return 0 }
        switch char {
        case "a", "j", "s": return 1
        case "b", "k", "t": return 2
        case "c", "l", "u": return 3
        case "d", "m", "v": return 4
        case "e", "n", "w": return 5
        case "f", "o", "x": return 6
        case "g", "p", "y": return 7
        case "h", "q", "z": return 8
        case "i", "r": return 9
        default: return 0
        }
    }
    
    /// Check if character is a vowel (for Soul Urge calculation)
    static func isVowel(_ character: Character) -> Bool {
        guard let char = character.lowercased().first else { return false }
        return ["a", "e", "i", "o", "u"].contains(char)
    }
    
    /// The letter-number chart for reference
    static let chart: [(letter: String, value: Int)] = [
        ("A", 1), ("B", 2), ("C", 3), ("D", 4), ("E", 5), ("F", 6), ("G", 7), ("H", 8), ("I", 9),
        ("J", 1), ("K", 2), ("L", 3), ("M", 4), ("N", 5), ("O", 6), ("P", 7), ("Q", 8), ("R", 9),
        ("S", 1), ("T", 2), ("U", 3), ("V", 4), ("W", 5), ("X", 6), ("Y", 7), ("Z", 8)
    ]
}

// MARK: - Numerology Calculator Helper

struct NumerologyCalculator {
    
    static func calculateExpression(name: String) -> Int {
        let letters = name.filter { $0.isLetter }
        let sum = letters.reduce(0) { $0 + NumerologyLetterValues.value(for: $1) }
        return NumerologyCourse.reduceNumber(sum)
    }
    
    static func calculateSoulUrge(name: String) -> Int {
        let vowels = name.filter { $0.isLetter && NumerologyLetterValues.isVowel($0) }
        let sum = vowels.reduce(0) { $0 + NumerologyLetterValues.value(for: $1) }
        return NumerologyCourse.reduceNumber(sum)
    }
    
    static func calculatePersonality(name: String) -> Int {
        let consonants = name.filter { $0.isLetter && !NumerologyLetterValues.isVowel($0) }
        let sum = consonants.reduce(0) { $0 + NumerologyLetterValues.value(for: $1) }
        return NumerologyCourse.reduceNumber(sum)
    }
    
    static func calculatePersonalYear(birthMonth: Int, birthDay: Int, currentYear: Int) -> Int {
        let sum = birthMonth + birthDay + NumerologyCourse.reduceNumber(currentYear)
        return NumerologyCourse.reduceNumber(sum)
    }
}
