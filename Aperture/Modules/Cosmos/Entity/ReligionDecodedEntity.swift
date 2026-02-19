// ReligionDecodedEntity.swift
// The truth behind the world's major religions - decoded through astro-theology

import SwiftUI

// MARK: - Religion Type

enum ReligionType: String, CaseIterable, Identifiable {
    case christianity = "Christianity"
    case judaism = "Judaism"
    case islam = "Islam"
    
    var id: String { rawValue }
    
    var celestialBody: String {
        switch self {
        case .christianity: return "☀️ The Sun"
        case .judaism: return "🪐 Saturn"
        case .islam: return "🌙 The Moon"
        }
    }
    
    var celestialEmoji: String {
        switch self {
        case .christianity: return "☀️"
        case .judaism: return "🪐"
        case .islam: return "🌙"
        }
    }
    
    var sacredDay: String {
        switch self {
        case .christianity: return "Sunday (Sun-day)"
        case .judaism: return "Saturday (Saturn-day)"
        case .islam: return "Friday (Venus-day)"
        }
    }
    
    var primarySymbol: String {
        switch self {
        case .christianity: return "✝️"
        case .judaism: return "✡️"
        case .islam: return "☪️"
        }
    }
    
    var primaryColor: Color {
        switch self {
        case .christianity: return Color(hex: "#FFD700") // Gold/Sun
        case .judaism: return Color(hex: "#4169E1") // Royal Blue
        case .islam: return Color(hex: "#00A86B") // Islamic Green
        }
    }
    
    var accentColor: Color {
        switch self {
        case .christianity: return Color(hex: "#FF8C00") // Sun orange
        case .judaism: return Color(hex: "#1E3A5F") // Deep blue
        case .islam: return Color(hex: "#C0C0C0") // Silver (moon)
        }
    }
}

// MARK: - Decoded Character

struct DecodedCharacter: Identifiable {
    let id = UUID()
    let name: String
    let officialMeaning: String
    let decodedMeaning: String
    let explanation: String
}

// MARK: - Decoded Symbol

struct DecodedSymbol: Identifiable {
    let id = UUID()
    let name: String
    let officialMeaning: String
    let decodedMeaning: String
    let explanation: String
    let icon: String?
}

// MARK: - Decoded Holiday

struct DecodedHoliday: Identifiable {
    let id = UUID()
    let name: String
    let officialMeaning: String
    let astronomicalMeaning: String
    let date: String?
}

// MARK: - Religion Control Mechanism

struct ReligionControlMechanism: Identifiable {
    let id = UUID()
    let mechanism: String
    let howItControls: String
    let icon: String
}

// MARK: - Etymology Reveal

struct EtymologyReveal: Identifiable {
    let id = UUID()
    let word: String
    let commonMeaning: String
    let actualOrigin: String
}

// MARK: - Religion Data

struct ReligionDecodedData {
    let type: ReligionType
    let narrative: [String] // What they told you
    let characters: [DecodedCharacter]
    let symbols: [DecodedSymbol]
    let holidays: [DecodedHoliday]
    let controlMechanisms: [ReligionControlMechanism]
    let etymologies: [EtymologyReveal]
    let keyRevelation: String // The big "aha" moment
}

// MARK: - Christianity Data

extension ReligionDecodedData {
    
    static let christianity = ReligionDecodedData(
        type: .christianity,
        narrative: [
            "God created everything in 6 days, rested on the 7th",
            "Adam & Eve sinned — humanity is born broken",
            "Jesus was born of a virgin in Bethlehem",
            "He lived, performed miracles, died for our sins",
            "He rose again after 3 days",
            "Believe in him and you'll be saved",
            "He'll return to judge the living and the dead"
        ],
        characters: [
            DecodedCharacter(
                name: "Jesus Christ",
                officialMeaning: "The Son of God, born in Bethlehem",
                decodedMeaning: "The SUN personified ☀️",
                explanation: "The 'Son' is the 'Sun'. Born December 25th (winter solstice), dies for 3 days, rises again. It's the sun's annual journey through the zodiac."
            ),
            DecodedCharacter(
                name: "Virgin Mary",
                officialMeaning: "A literal virgin who gave birth",
                decodedMeaning: "VIRGO ♍ — the constellation",
                explanation: "The sun is 'born from the virgin' because it passes through the constellation Virgo. Virgin = Virgo. Same word."
            ),
            DecodedCharacter(
                name: "12 Disciples",
                officialMeaning: "12 real men who followed Jesus",
                decodedMeaning: "12 Zodiac Signs ♈♉♊♋♌♍♎♏♐♑♒♓",
                explanation: "The sun travels through 12 houses (zodiac signs) each year. The disciples 'follow' the sun — they ARE the path."
            ),
            DecodedCharacter(
                name: "Judas",
                officialMeaning: "The betrayer who sold Jesus",
                decodedMeaning: "PISCES ♓ — end of the zodiac",
                explanation: "Pisces ends the zodiac cycle. The sun 'dies' after Pisces before being 'reborn' in Aries. Judas = the end of the cycle."
            ),
            DecodedCharacter(
                name: "Satan",
                officialMeaning: "A fallen angel who opposes God",
                decodedMeaning: "SATURN 🪐 — god of time & limitation",
                explanation: "Satan = Saturn. Both represent darkness, limitation, time, and death. The adversary of the light (sun)."
            ),
            DecodedCharacter(
                name: "Mary Magdalene",
                officialMeaning: "A prostitute Jesus redeemed",
                decodedMeaning: "VIRGO's earthly aspect",
                explanation: "The sacred feminine, suppressed by the Church. Two Marys = celestial and earthly Virgo. She was never a prostitute — that was a smear campaign."
            )
        ],
        symbols: [
            DecodedSymbol(
                name: "The Cross",
                officialMeaning: "Instrument of Jesus's death",
                decodedMeaning: "The Southern Cross constellation / Sun cross",
                explanation: "The sun 'dies' at the Southern Cross during winter solstice. Also represents the intersection of the ecliptic and celestial equator.",
                icon: "cross"
            ),
            DecodedSymbol(
                name: "The Fish (Ichthys)",
                officialMeaning: "Early Christian symbol",
                decodedMeaning: "Age of Pisces ♓",
                explanation: "Christianity began during the Age of Pisces (the fish). 'I will make you fishers of men.' We're now transitioning to Aquarius.",
                icon: "fish"
            ),
            DecodedSymbol(
                name: "The Halo",
                officialMeaning: "Holy light around saints",
                decodedMeaning: "The SUN disc",
                explanation: "Halos in religious art are literally the sun disc placed behind heads — borrowed directly from Egyptian sun god imagery.",
                icon: "sun.max"
            ),
            DecodedSymbol(
                name: "Christmas Tree",
                officialMeaning: "Holiday tradition",
                decodedMeaning: "Evergreen = eternal life through winter death",
                explanation: "The evergreen survives winter (when the sun 'dies'). Decorated with lights = stars. Star on top = the sun/morning star.",
                icon: "tree"
            )
        ],
        holidays: [
            DecodedHoliday(
                name: "Christmas",
                officialMeaning: "Birthday of Jesus Christ",
                astronomicalMeaning: "Winter Solstice — the sun is 'reborn' after being at its lowest point for 3 days (Dec 22-25)",
                date: "December 25"
            ),
            DecodedHoliday(
                name: "Easter",
                officialMeaning: "Jesus's resurrection",
                astronomicalMeaning: "Spring Equinox — the sun 'rises' as days become longer than nights. Named after Ishtar/Eostre (fertility goddess).",
                date: "First Sunday after first full moon after Spring Equinox"
            ),
            DecodedHoliday(
                name: "Good Friday",
                officialMeaning: "Day Jesus was crucified",
                astronomicalMeaning: "The sun at its lowest before rising again. 'Good' from 'God' — God's Friday.",
                date: "Friday before Easter"
            ),
            DecodedHoliday(
                name: "Halloween",
                officialMeaning: "All Hallows' Eve",
                astronomicalMeaning: "Sun enters the 'dead zone' — the dark half of the year. Veil between worlds thins.",
                date: "October 31"
            )
        ],
        controlMechanisms: [
            ReligionControlMechanism(
                mechanism: "Original Sin",
                howItControls: "You're born BROKEN — you need THEM to fix you. Guilt from birth.",
                icon: "xmark.circle"
            ),
            ReligionControlMechanism(
                mechanism: "External Savior",
                howItControls: "You can't save yourself — wait for rescue. Disempowerment.",
                icon: "person.badge.clock"
            ),
            ReligionControlMechanism(
                mechanism: "Heaven/Hell",
                howItControls: "Obey or suffer ETERNAL punishment. Fear-based control.",
                icon: "flame"
            ),
            ReligionControlMechanism(
                mechanism: "Priests as Intermediaries",
                howItControls: "You can't access God directly — you need THEM. Power consolidation.",
                icon: "person.crop.rectangle"
            ),
            ReligionControlMechanism(
                mechanism: "Confession",
                howItControls: "Tell them your secrets — they hold power over you. Information control.",
                icon: "ear"
            ),
            ReligionControlMechanism(
                mechanism: "Tithing",
                howItControls: "Give them 10% of your money. Financial extraction.",
                icon: "dollarsign.circle"
            ),
            ReligionControlMechanism(
                mechanism: "Blind Faith",
                howItControls: "Don't question — questioning is sin. Anti-intellectualism.",
                icon: "eye.slash"
            )
        ],
        etymologies: [
            EtymologyReveal(word: "SUNDAY", commonMeaning: "First day of the week", actualOrigin: "SUN-DAY — the Lord's day = worship the sun"),
            EtymologyReveal(word: "AMEN", commonMeaning: "'So be it'", actualOrigin: "AMEN-RA — Egyptian sun god. You're invoking Ra."),
            EtymologyReveal(word: "CHURCH", commonMeaning: "House of God", actualOrigin: "CIRCE (Greek) — circle. The solar cycle ⭕"),
            EtymologyReveal(word: "HOLY", commonMeaning: "Sacred, divine", actualOrigin: "HELIOS — Greek word for SUN"),
            EtymologyReveal(word: "GOSPEL", commonMeaning: "Good news", actualOrigin: "GOD'S-SPELL — a spell cast on your mind"),
            EtymologyReveal(word: "HORUS", commonMeaning: "Egyptian god", actualOrigin: "HOURS — the sun's journey through the day"),
            EtymologyReveal(word: "HORIZON", commonMeaning: "Where sky meets earth", actualOrigin: "HORUS-RISING — where the sun rises"),
            EtymologyReveal(word: "MINISTER", commonMeaning: "Spiritual leader", actualOrigin: "MOON-STER — servant of the moon (reflects light)")
        ],
        keyRevelation: "They gave you the SUN and told you it was a SON. The entire story is the sun's annual journey through the zodiac, dressed up as history."
    )
    
    // MARK: - Judaism Data
    
    static let judaism = ReligionDecodedData(
        type: .judaism,
        narrative: [
            "God (Yahweh) created everything",
            "God chose Abraham and his descendants as special",
            "God gave Moses 613 commandments on Mt. Sinai",
            "Jews are entitled to the Promised Land by divine right",
            "God literally lived in the Temple in Jerusalem",
            "A Messiah will come to save the chosen people",
            "Everyone else is a Gentile — separate, other"
        ],
        characters: [
            DecodedCharacter(
                name: "Yahweh / Jehovah / El",
                officialMeaning: "The one true God",
                decodedMeaning: "SATURN 🪐 — God of time, law, limitation",
                explanation: "EL is a Canaanite god associated with Saturn. Yahweh = 'I am that I am' — the timeless one. Saturn governs time."
            ),
            DecodedCharacter(
                name: "Abraham",
                officialMeaning: "Father of the Jewish people",
                decodedMeaning: "BRAHMA — Hindu creator god",
                explanation: "Abraham and Brahma share the same root. His wife Sarah = Saraswati (Brahma's consort). The stories traveled."
            ),
            DecodedCharacter(
                name: "Sarah",
                officialMeaning: "Abraham's wife",
                decodedMeaning: "SARASWATI — Hindu goddess",
                explanation: "Sarah/Sarai mirrors Saraswati, Brahma's wife. Same archetype, different culture."
            ),
            DecodedCharacter(
                name: "Moses",
                officialMeaning: "Delivered Israel from Egypt",
                decodedMeaning: "The SUN passing through the 'sea' (night sky)",
                explanation: "Moses parts the Red Sea = sun passing through the celestial waters. The exodus is astronomical allegory."
            ),
            DecodedCharacter(
                name: "12 Tribes of Israel",
                officialMeaning: "Literal tribes of Jacob's sons",
                decodedMeaning: "12 Zodiac Signs ♈♉♊♋♌♍♎♏♐♑♒♓",
                explanation: "Each tribe corresponds to a zodiac sign with specific characteristics. Jacob's blessing describes the zodiac."
            ),
            DecodedCharacter(
                name: "Solomon",
                officialMeaning: "Wise king who built the Temple",
                decodedMeaning: "SOL-OM-ON = Sun + Om + On",
                explanation: "Sol (Latin sun) + Om (Hindu sacred sound) + On (Egyptian city of the sun). Three solar references in one name."
            )
        ],
        symbols: [
            DecodedSymbol(
                name: "Star of David ✡️",
                officialMeaning: "Symbol of Jewish identity",
                decodedMeaning: "SATURN'S HEXAGON — 2D representation",
                explanation: "NASA photographed a hexagonal storm on Saturn's north pole. A hexagon internally connected = six-pointed star. Saturn = 6th planet.",
                icon: "star.fill"
            ),
            DecodedSymbol(
                name: "Tefillin (Black Cube)",
                officialMeaning: "Prayer box worn on forehead",
                decodedMeaning: "Saturn's Cube 🔲",
                explanation: "A BLACK CUBE worn on the forehead (third eye) and arm. Saturn worship in plain sight. Blocks divine connection.",
                icon: "square.fill"
            ),
            DecodedSymbol(
                name: "Menorah (7 Branches)",
                officialMeaning: "Lamp in the Temple",
                decodedMeaning: "7 visible celestial bodies",
                explanation: "Sun, Moon, Mercury, Venus, Mars, Jupiter, Saturn — the 7 'planets' visible to ancient astronomers.",
                icon: "light.max"
            ),
            DecodedSymbol(
                name: "The Ark of the Covenant",
                officialMeaning: "Container for the commandments",
                decodedMeaning: "The vessel (arc) carrying the sun",
                explanation: "An 'ark' is an arc — the curved path the sun travels across the sky. The ark 'carries' the divine light.",
                icon: "shippingbox"
            ),
            DecodedSymbol(
                name: "Yarmulke / Kippah",
                officialMeaning: "Head covering for reverence",
                decodedMeaning: "Crown chakra blocker",
                explanation: "Covers the crown chakra — the point of divine connection. Symbolic submission to Saturn's limitation.",
                icon: "circle.fill"
            )
        ],
        holidays: [
            DecodedHoliday(
                name: "Passover",
                officialMeaning: "Angel 'passed over' Jewish homes",
                astronomicalMeaning: "Spring Equinox — the sun 'passes over' the equator. Liberation from winter's darkness.",
                date: "Nisan 15 (Spring)"
            ),
            DecodedHoliday(
                name: "Rosh Hashanah",
                officialMeaning: "Jewish New Year",
                astronomicalMeaning: "Fall Equinox calibration — the cosmic reset point.",
                date: "Tishrei 1 (Fall)"
            ),
            DecodedHoliday(
                name: "Yom Kippur",
                officialMeaning: "Day of Atonement",
                astronomicalMeaning: "AT-ONE-MENT — realignment with the cosmic cycle. Return to source.",
                date: "Tishrei 10"
            ),
            DecodedHoliday(
                name: "Hanukkah",
                officialMeaning: "Miracle of oil lasting 8 days",
                astronomicalMeaning: "Winter Solstice celebration. 8 = Saturn's number (octave, infinity). Light in the darkness.",
                date: "Kislev 25 (Winter)"
            )
        ],
        controlMechanisms: [
            ReligionControlMechanism(
                mechanism: "Chosen People Doctrine",
                howItControls: "Creates separation — 'us vs. them'. Division is control.",
                icon: "person.2.slash"
            ),
            ReligionControlMechanism(
                mechanism: "613 Commandments",
                howItControls: "Endless rules = endless guilt = endless control. You can never be 'good enough'.",
                icon: "list.number"
            ),
            ReligionControlMechanism(
                mechanism: "Dietary Laws (Kosher)",
                howItControls: "Controls what you EAT — controls your body. Constant vigilance required.",
                icon: "fork.knife"
            ),
            ReligionControlMechanism(
                mechanism: "Circumcision (8th Day)",
                howItControls: "Marks the body — trauma bonding at 8 days old. Saturn's number. Irreversible.",
                icon: "scissors"
            ),
            ReligionControlMechanism(
                mechanism: "Sabbath Restrictions",
                howItControls: "Controls your TIME — Saturn is god of time. Can't work, cook, travel.",
                icon: "clock"
            ),
            ReligionControlMechanism(
                mechanism: "Waiting for Messiah",
                howItControls: "External savior myth — don't save yourself, wait for rescue.",
                icon: "hourglass"
            ),
            ReligionControlMechanism(
                mechanism: "Bloodline Emphasis",
                howItControls: "Must be BORN into it — exclusivity. You're in or out by birth.",
                icon: "drop.fill"
            )
        ],
        etymologies: [
            EtymologyReveal(word: "ISRAEL", commonMeaning: "The nation/people", actualOrigin: "IS-RA-EL = Isis (Moon) + Ra (Sun) + El (Saturn). A celestial formula."),
            EtymologyReveal(word: "SATURDAY", commonMeaning: "Seventh day", actualOrigin: "SATURN-DAY — dedicated to Saturn. The Sabbath."),
            EtymologyReveal(word: "SYNAGOGUE", commonMeaning: "House of worship", actualOrigin: "SIN-agogue — Sin was the Babylonian MOON god."),
            EtymologyReveal(word: "TORAH", commonMeaning: "The Law", actualOrigin: "TORA = TARO = ROTA (wheel) — the zodiac wheel."),
            EtymologyReveal(word: "RABBI", commonMeaning: "Teacher", actualOrigin: "RAB = great/master — intermediary class."),
            EtymologyReveal(word: "HEBREW", commonMeaning: "The language/people", actualOrigin: "From 'eber' — to cross over. Those who crossed the celestial river.")
        ],
        keyRevelation: "Judaism is SATURN worship. The black cube (Tefillin), the hexagram (Star of David = Saturn's hexagon), Saturday (Saturn-day). They worship the god of time, law, and limitation."
    )
    
    // MARK: - Islam Data
    
    static let islam = ReligionDecodedData(
        type: .islam,
        narrative: [
            "Allah created everything",
            "Allah sent 124,000 prophets, ending with Muhammad",
            "Angel Gabriel revealed the Quran to Muhammad",
            "Five Pillars: Faith, Prayer, Charity, Fasting, Pilgrimage",
            "'Islam' means submission to Allah's will",
            "One life, then eternal paradise or hellfire",
            "The Kaaba in Mecca is the most sacred site"
        ],
        characters: [
            DecodedCharacter(
                name: "Allah",
                officialMeaning: "The one true God",
                decodedMeaning: "AL-ILAH — the pre-Islamic MOON god 🌙",
                explanation: "Allah was one of many gods worshipped in pre-Islamic Arabia — specifically the moon god. The crescent moon symbol isn't coincidence."
            ),
            DecodedCharacter(
                name: "Muhammad",
                officialMeaning: "The final prophet",
                decodedMeaning: "The messenger archetype (like Hermes/Thoth)",
                explanation: "Muhammad consolidated existing moon worship into monotheism. One god = monopoly of spiritual power."
            ),
            DecodedCharacter(
                name: "Gabriel (Jibril)",
                officialMeaning: "Angel who revealed the Quran",
                decodedMeaning: "Mercury/Hermes — the messenger planet",
                explanation: "Gabriel is always the MESSENGER angel across religions. Mercury = messenger of the gods."
            ),
            DecodedCharacter(
                name: "Ibrahim (Abraham)",
                officialMeaning: "Father of Ishmael, ancestor of Arabs",
                decodedMeaning: "Same as Jewish Abraham / Hindu Brahma",
                explanation: "Same character, same root, different lineage claimed. The division tactic — Arab vs. Jewish."
            ),
            DecodedCharacter(
                name: "Ishmael",
                officialMeaning: "Son of Abraham, Arab ancestor",
                decodedMeaning: "The 'other' line — division narrative",
                explanation: "Judaism claims Isaac, Islam claims Ishmael. Same father, divided children. Classic divide and conquer."
            )
        ],
        symbols: [
            DecodedSymbol(
                name: "Crescent Moon ☪️",
                officialMeaning: "Symbol of Islam",
                decodedMeaning: "LITERAL moon worship 🌙",
                explanation: "It's not hidden. It's right there. On every mosque, every flag. They worship the moon.",
                icon: "moon.fill"
            ),
            DecodedSymbol(
                name: "The Kaaba 🕋",
                officialMeaning: "House of God",
                decodedMeaning: "The BLACK CUBE — SATURN 🪐",
                explanation: "A black cube in Mecca. Muslims circle it counter-clockwise (like Saturn's rings). It's Saturn worship in plain sight.",
                icon: "cube.fill"
            ),
            DecodedSymbol(
                name: "Star Next to Crescent",
                officialMeaning: "Islamic symbol",
                decodedMeaning: "Moon + Venus (morning star)",
                explanation: "The crescent moon paired with Venus. Celestial bodies worshipped as divine.",
                icon: "star.fill"
            ),
            DecodedSymbol(
                name: "Black Stone",
                officialMeaning: "Sacred stone in Kaaba corner",
                decodedMeaning: "Meteorite — 'fallen from heaven'",
                explanation: "A black meteorite in the corner of the black cube. Worshipped as divine. Saturn = black.",
                icon: "circle.fill"
            )
        ],
        holidays: [
            DecodedHoliday(
                name: "Ramadan",
                officialMeaning: "Holy month of fasting",
                astronomicalMeaning: "Lunar calendar — timing based on MOON sighting. From 'ramad' = scorching heat (sun reference).",
                date: "9th month (lunar calendar)"
            ),
            DecodedHoliday(
                name: "Eid al-Fitr",
                officialMeaning: "End of Ramadan fasting",
                astronomicalMeaning: "New MOON sighting ends the fast. Celebration of the lunar cycle.",
                date: "1st of Shawwal"
            ),
            DecodedHoliday(
                name: "Eid al-Adha",
                officialMeaning: "Feast of Sacrifice",
                astronomicalMeaning: "Blood sacrifice tradition — appeasing the gods. Ancient fertility rite.",
                date: "10th of Dhul Hijjah"
            ),
            DecodedHoliday(
                name: "Laylat al-Qadr",
                officialMeaning: "Night of Power — Quran revealed",
                astronomicalMeaning: "Revelation came at NIGHT — the moon's domain. Lunar power celebration.",
                date: "Last 10 nights of Ramadan"
            )
        ],
        controlMechanisms: [
            ReligionControlMechanism(
                mechanism: "5 Daily Prayers",
                howItControls: "Constant interruption — you're never free. Always oriented toward the cube.",
                icon: "clock"
            ),
            ReligionControlMechanism(
                mechanism: "Face Mecca Always",
                howItControls: "Directional control — always oriented to the BLACK CUBE (Saturn).",
                icon: "location.north.fill"
            ),
            ReligionControlMechanism(
                mechanism: "Fasting (Ramadan)",
                howItControls: "Body control — prove your submission through suffering.",
                icon: "fork.knife"
            ),
            ReligionControlMechanism(
                mechanism: "Death for Apostasy",
                howItControls: "Leave and DIE — ultimate fear control. No escape allowed.",
                icon: "xmark.seal"
            ),
            ReligionControlMechanism(
                mechanism: "Arabic-Only Quran",
                howItControls: "Language barrier — must trust interpreters. Can't verify yourself.",
                icon: "textformat"
            ),
            ReligionControlMechanism(
                mechanism: "Hellfire (Jahannam)",
                howItControls: "Eternal torture — obey or burn forever. Fear-based control.",
                icon: "flame"
            ),
            ReligionControlMechanism(
                mechanism: "Submission Doctrine",
                howItControls: "'Islam' literally means SUBMIT. Your will is irrelevant.",
                icon: "arrow.down.to.line"
            ),
            ReligionControlMechanism(
                mechanism: "Women Covered",
                howItControls: "Control female energy — suppress the sacred feminine.",
                icon: "eye.slash"
            )
        ],
        etymologies: [
            EtymologyReveal(word: "ALLAH", commonMeaning: "'The God'", actualOrigin: "AL-ILAH — pre-Islamic moon god of Arabia."),
            EtymologyReveal(word: "ISLAM", commonMeaning: "'Peace'", actualOrigin: "Actually means SUBMISSION — to Allah's will."),
            EtymologyReveal(word: "MOSQUE", commonMeaning: "House of worship", actualOrigin: "From 'masjid' — place of prostration (bowing down)."),
            EtymologyReveal(word: "MECCA", commonMeaning: "Holiest city", actualOrigin: "Ancient center of MOON god worship before Muhammad."),
            EtymologyReveal(word: "KAABA", commonMeaning: "'The Cube'", actualOrigin: "Literally means CUBE. They worship a black cube."),
            EtymologyReveal(word: "MINARET", commonMeaning: "Tower for call to prayer", actualOrigin: "Astronomical observation tower — tracking celestial bodies.")
        ],
        keyRevelation: "Islam is MOON worship with SATURN's cube. The crescent moon is on every mosque. The Kaaba is a BLACK CUBE that they circle like Saturn's rings. The calendar is lunar. It's hidden in plain sight."
    )
}

// MARK: - Comparison Data

struct ReligionComparison: Identifiable {
    let id = UUID()
    let aspect: String
    let judaism: String
    let christianity: String
    let islam: String
    let icon: String
}

extension ReligionComparison {
    
    static let allComparisons: [ReligionComparison] = [
        ReligionComparison(
            aspect: "Celestial Body",
            judaism: "🪐 Saturn",
            christianity: "☀️ Sun",
            islam: "🌙 Moon",
            icon: "sparkles"
        ),
        ReligionComparison(
            aspect: "Sacred Day",
            judaism: "Saturday (Saturn-day)",
            christianity: "Sunday (Sun-day)",
            islam: "Friday (Venus-day)",
            icon: "calendar"
        ),
        ReligionComparison(
            aspect: "Primary Symbol",
            judaism: "✡️ Hexagram (Saturn's hexagon)",
            christianity: "✝️ Cross (sun cross)",
            islam: "☪️ Crescent Moon",
            icon: "star.fill"
        ),
        ReligionComparison(
            aspect: "Black Cube",
            judaism: "Tefillin (forehead)",
            christianity: "Hidden (graduation caps)",
            islam: "Kaaba (Mecca)",
            icon: "cube.fill"
        ),
        ReligionComparison(
            aspect: "12 Archetype",
            judaism: "12 Tribes",
            christianity: "12 Disciples",
            islam: "12 Imams (Shia)",
            icon: "person.3"
        ),
        ReligionComparison(
            aspect: "Savior Myth",
            judaism: "Messiah (coming)",
            christianity: "Messiah (came)",
            islam: "Mahdi (coming)",
            icon: "person.fill.questionmark"
        ),
        ReligionComparison(
            aspect: "Intermediaries",
            judaism: "Rabbis",
            christianity: "Priests",
            islam: "Imams",
            icon: "person.crop.rectangle"
        ),
        ReligionComparison(
            aspect: "Fear Control",
            judaism: "Separation / 613 Laws",
            christianity: "Hell / Original Sin",
            islam: "Hell / Death for Leaving",
            icon: "flame"
        ),
        ReligionComparison(
            aspect: "Calendar",
            judaism: "Lunar-solar hybrid",
            christianity: "Solar (Gregorian)",
            islam: "Pure Lunar",
            icon: "calendar.circle"
        )
    ]
}

// MARK: - The Final Truth

struct FinalTruth: Identifiable {
    let id = UUID()
    let oldProgram: String
    let newTruth: String
    let icon: String
}

extension FinalTruth {
    
    static let allTruths: [FinalTruth] = [
        FinalTruth(oldProgram: "God is outside you", newTruth: "God is WITHIN you", icon: "heart.fill"),
        FinalTruth(oldProgram: "You are born broken", newTruth: "You are born DIVINE", icon: "sparkles"),
        FinalTruth(oldProgram: "You need a savior", newTruth: "YOU are the savior", icon: "person.fill"),
        FinalTruth(oldProgram: "Worship the Son/Sun/Moon", newTruth: "Honor them — but YOU are the fractal", icon: "sun.max.fill"),
        FinalTruth(oldProgram: "The Kingdom is coming", newTruth: "The Kingdom is WITHIN", icon: "crown.fill"),
        FinalTruth(oldProgram: "Salvation is earned", newTruth: "You were never lost", icon: "checkmark.seal"),
        FinalTruth(oldProgram: "Follow the Church/Synagogue/Mosque", newTruth: "Follow your own consciousness", icon: "brain.head.profile"),
        FinalTruth(oldProgram: "Fear God", newTruth: "BE God (a fractal of Source)", icon: "bolt.fill"),
        FinalTruth(oldProgram: "One life, then judgment", newTruth: "Eternal energy, infinite experience", icon: "infinity")
    ]
}

// MARK: - Pre-Dated Saviors (Same Story, Different Names)

struct PreDatedSavior: Identifiable {
    let id = UUID()
    let name: String
    let culture: String
    let approximateDate: String
    let attributes: [String]
}

extension PreDatedSavior {
    
    static let all: [PreDatedSavior] = [
        PreDatedSavior(
            name: "HORUS",
            culture: "Egyptian",
            approximateDate: "3000+ BCE",
            attributes: ["Virgin birth (Isis)", "Born December 25", "12 followers", "Crucified", "Resurrected", "Called 'The Light'"]
        ),
        PreDatedSavior(
            name: "KRISHNA",
            culture: "Hindu",
            approximateDate: "1500+ BCE",
            attributes: ["Virgin birth (Devaki)", "Divine child hunted by king", "Performed miracles", "Called 'Son of God'", "Resurrected"]
        ),
        PreDatedSavior(
            name: "MITHRA",
            culture: "Persian",
            approximateDate: "1400+ BCE",
            attributes: ["Born December 25", "Born in a cave", "12 followers", "Called 'The Light of the World'", "Sunday worship"]
        ),
        PreDatedSavior(
            name: "DIONYSUS",
            culture: "Greek",
            approximateDate: "1500+ BCE",
            attributes: ["Born of a virgin", "Turned water into wine", "Called 'King of Kings'", "Resurrected", "Ate as bread/wine"]
        ),
        PreDatedSavior(
            name: "ATTIS",
            culture: "Phrygian",
            approximateDate: "1200+ BCE",
            attributes: ["Born of a virgin", "Born December 25", "Crucified on a tree", "Resurrected after 3 days"]
        ),
        PreDatedSavior(
            name: "BUDDHA",
            culture: "Indian",
            approximateDate: "563 BCE",
            attributes: ["Miraculous birth", "Tempted by evil one", "Performed miracles", "Called 'The Light'", "Founded a path to liberation"]
        )
    ]
}

// MARK: - Global Sun Worship (The Sun Has Always Been There)

struct SunWorshipCulture: Identifiable {
    let id = UUID()
    let region: String
    let cultures: [SunGodEntry]
}

struct SunGodEntry: Identifiable {
    let id = UUID()
    let culture: String
    let flag: String
    let sunGod: String
    let notes: String
}

extension SunWorshipCulture {
    
    static let americas = SunWorshipCulture(
        region: "THE AMERICAS",
        cultures: [
            SunGodEntry(culture: "Mayan", flag: "🇬🇹🇲🇽", sunGod: "Kinich Ahau", notes: "\"Sun-Faced Lord\" — the sun was the highest deity"),
            SunGodEntry(culture: "Aztec", flag: "🇲🇽", sunGod: "Tonatiuh", notes: "The 5th Sun — our current era. Required \"feeding\""),
            SunGodEntry(culture: "Inca", flag: "🇵🇪", sunGod: "Inti", notes: "Emperors were \"Sons of the Sun\" — sound familiar?"),
            SunGodEntry(culture: "Taíno", flag: "🇵🇷🇩🇴", sunGod: "Yúcahu", notes: "Caribbean sun/sky god of the indigenous people"),
            SunGodEntry(culture: "Hopi", flag: "🏜️", sunGod: "Tawa", notes: "Creator sun spirit of the Southwest"),
            SunGodEntry(culture: "Lakota", flag: "🦅", sunGod: "Sun Dance", notes: "Sacred ritual across Plains tribes — still practiced")
        ]
    )
    
    static let africa = SunWorshipCulture(
        region: "AFRICA",
        cultures: [
            SunGodEntry(culture: "Egyptian", flag: "🇪🇬", sunGod: "Ra / Amen-Ra / Aten", notes: "The OG — Christianity copied this directly"),
            SunGodEntry(culture: "Berber/Amazigh", flag: "🇲🇦", sunGod: "Ayur", notes: "North African sun worship predating Islam"),
            SunGodEntry(culture: "Dogon", flag: "🇲🇱", sunGod: "Amma", notes: "Mali — knew about Sirius B before telescopes"),
            SunGodEntry(culture: "Zulu", flag: "🇿🇦", sunGod: "uNkulunkulu", notes: "Creator associated with the sun's life-giving power")
        ]
    )
    
    static let europe = SunWorshipCulture(
        region: "EUROPE",
        cultures: [
            SunGodEntry(culture: "Slavic", flag: "🇷🇺🇺🇦🇵🇱", sunGod: "Dazhbog / Khors / Svarog", notes: "\"Giving God\" — the giver of life and warmth"),
            SunGodEntry(culture: "Celtic", flag: "🇮🇪☘️", sunGod: "Lugh / Belenus / Brigid", notes: "Lughnasadh = sun festival, still celebrated"),
            SunGodEntry(culture: "Norse", flag: "🇳🇴🇸🇪", sunGod: "Sól (goddess) / Baldur", notes: "Sun was FEMININE in Norse tradition"),
            SunGodEntry(culture: "Greek", flag: "🇬🇷", sunGod: "Helios / Apollo", notes: "Helios = root of \"HOLY\""),
            SunGodEntry(culture: "Roman", flag: "🇮🇹", sunGod: "Sol Invictus", notes: "\"Unconquered Sun\" — Dec 25 was HIS birthday")
        ]
    )
    
    static let asia = SunWorshipCulture(
        region: "ASIA",
        cultures: [
            SunGodEntry(culture: "Hindu", flag: "🇮🇳", sunGod: "Surya", notes: "Still worshipped today — Surya Namaskar (Sun Salutation)"),
            SunGodEntry(culture: "Japanese", flag: "🇯🇵", sunGod: "Amaterasu", notes: "Sun GODDESS — emperor descends from her"),
            SunGodEntry(culture: "Chinese", flag: "🇨🇳", sunGod: "Xihe", notes: "Mother of 10 suns in ancient mythology"),
            SunGodEntry(culture: "Persian", flag: "🇮🇷", sunGod: "Mithra", notes: "Born Dec 25, rose from dead — predates Jesus by 1000+ years"),
            SunGodEntry(culture: "Mesopotamian", flag: "🇮🇶", sunGod: "Shamash", notes: "God of justice — because the sun SEES ALL")
        ]
    )
    
    static let oceania = SunWorshipCulture(
        region: "OCEANIA",
        cultures: [
            SunGodEntry(culture: "Hawaiian", flag: "🌺", sunGod: "Kāne / Lā", notes: "Creator god associated with sun and life"),
            SunGodEntry(culture: "Polynesian", flag: "🏝️", sunGod: "Tama-nui-te-rā", notes: "Maui lassoed the sun to slow it down"),
            SunGodEntry(culture: "Aboriginal", flag: "🇦🇺", sunGod: "Wala / Yhi", notes: "Sun beings in Dreamtime — 60,000+ year tradition")
        ]
    )
    
    static let allRegions: [SunWorshipCulture] = [
        americas,
        africa,
        europe,
        asia,
        oceania
    ]
}

// MARK: - What Imperialism Did

struct ImperialismStep: Identifiable {
    let id = UUID()
    let step: Int
    let action: String
    let icon: String
}

extension ImperialismStep {
    static let all: [ImperialismStep] = [
        ImperialismStep(step: 1, action: "Invaded your ancestors' land", icon: "figure.walk.motion"),
        ImperialismStep(step: 2, action: "Burned the libraries (Mayan codices, Alexandria)", icon: "flame.fill"),
        ImperialismStep(step: 3, action: "Killed the priests/shamans who held the knowledge", icon: "person.fill.xmark"),
        ImperialismStep(step: 4, action: "Renamed the sun god \"Jesus\"", icon: "character.cursor.ibeam"),
        ImperialismStep(step: 5, action: "Moved the holy day to SUNday", icon: "calendar"),
        ImperialismStep(step: 6, action: "Kept December 25 (winter solstice)", icon: "snowflake"),
        ImperialismStep(step: 7, action: "Told you your ancestors were \"savages\"", icon: "quote.bubble.fill"),
        ImperialismStep(step: 8, action: "Made you ashamed of your own cosmic truth", icon: "eye.slash.fill")
    ]
}

// MARK: - Solar Disconnection (How They Cut Us Off)

struct SolarDisconnection: Identifiable {
    let id = UUID()
    let method: String
    let description: String
    let icon: String
    let color: String // hex color
}

extension SolarDisconnection {
    static let all: [SolarDisconnection] = [
        SolarDisconnection(
            method: "Demonized the Sun",
            description: "Called Lucifer (Light Bearer) evil. Made you FEAR your source of life.",
            icon: "exclamationmark.triangle.fill",
            color: "#FF4444"
        ),
        SolarDisconnection(
            method: "Sunglasses",
            description: "Blocks sunlight from entering your eyes → pineal gland. Disrupts melatonin, serotonin, and DMT production.",
            icon: "eyeglasses",
            color: "#666666"
        ),
        SolarDisconnection(
            method: "Sunscreen",
            description: "Blocks vitamin D synthesis. Contains chemicals absorbed into bloodstream. You're told the sun causes cancer while they block your immunity.",
            icon: "cross.vial.fill",
            color: "#FF8844"
        ),
        SolarDisconnection(
            method: "9-to-5 Work Schedule",
            description: "Keeps you INDOORS during peak sunlight hours. You commute in darkness, work under artificial light, return in darkness.",
            icon: "building.2.fill",
            color: "#888888"
        ),
        SolarDisconnection(
            method: "Indoor Living",
            description: "Homes → Cars → Offices → Cars → Homes. We live in BOXES, disconnected from sky, earth, and sun.",
            icon: "house.fill",
            color: "#555555"
        ),
        SolarDisconnection(
            method: "Artificial Lighting",
            description: "Fluorescent lights, LEDs lack the full spectrum. Your body doesn't recognize it as \"day\" — circadian confusion.",
            icon: "lightbulb.fill",
            color: "#FFCC00"
        ),
        SolarDisconnection(
            method: "Blue Light at Night",
            description: "Phones, TVs, computers emit blue light that tells your brain it's still daytime. Destroys melatonin production.",
            icon: "iphone.gen3",
            color: "#4488FF"
        ),
        SolarDisconnection(
            method: "Shift Work / Night Shifts",
            description: "Completely inverts your circadian rhythm. Associated with cancer, depression, metabolic disorders.",
            icon: "moon.fill",
            color: "#8866CC"
        ),
        SolarDisconnection(
            method: "Fear-Based Messaging",
            description: "\"Stay out of the sun!\" \"Cover up!\" \"Dangerous UV!\" — Meanwhile vitamin D deficiency is epidemic.",
            icon: "megaphone.fill",
            color: "#FF6666"
        ),
        SolarDisconnection(
            method: "Altered Time Zones & DST",
            description: "Daylight Saving Time disrupts natural rhythm twice yearly. Time zones disconnect you from LOCAL solar noon.",
            icon: "clock.arrow.2.circlepath",
            color: "#44AAAA"
        )
    ]
}

// MARK: - Solar Being Truth

struct SolarBeingTruth: Identifiable {
    let id = UUID()
    let truth: String
    let explanation: String
    let icon: String
}

extension SolarBeingTruth {
    static let all: [SolarBeingTruth] = [
        SolarBeingTruth(
            truth: "You ARE a Solar Being",
            explanation: "Your cells contain mitochondria — the \"powerhouse\" that converts light into energy. You are literally SOLAR POWERED.",
            icon: "sun.max.fill"
        ),
        SolarBeingTruth(
            truth: "Sunlight Through Eyes → Pineal Gland",
            explanation: "Light entering your eyes activates the pineal gland (third eye), regulating melatonin, serotonin, and DMT — your connection to higher consciousness.",
            icon: "eye.fill"
        ),
        SolarBeingTruth(
            truth: "Vitamin D is a HORMONE",
            explanation: "Not just a vitamin — it's a master hormone that regulates 2,000+ genes. Deficiency linked to cancer, depression, autoimmune disease, and death.",
            icon: "pill.fill"
        ),
        SolarBeingTruth(
            truth: "Circadian Rhythm = Life Rhythm",
            explanation: "Your body has a 24-hour clock synced to the SUN. Sleep, hormones, digestion, immunity — ALL tied to solar cycles.",
            icon: "clock.fill"
        ),
        SolarBeingTruth(
            truth: "Morning Sun = Cortisol Reset",
            explanation: "Sunlight in the first hour of waking sets your cortisol rhythm. This determines energy, mood, and sleep quality for the ENTIRE day.",
            icon: "sunrise.fill"
        ),
        SolarBeingTruth(
            truth: "Grounding + Sun = Full Circuit",
            explanation: "Bare feet on earth + sun on skin completes an electrical circuit. You become a conduit between sky and ground — as designed.",
            icon: "bolt.fill"
        ),
        SolarBeingTruth(
            truth: "Ancient Sungazing Practices",
            explanation: "Every culture practiced safe sungazing at sunrise/sunset. Now it's called \"dangerous.\" They don't want you activating your pineal.",
            icon: "sparkles"
        ),
        SolarBeingTruth(
            truth: "The Sun Doesn't Cause Cancer",
            explanation: "Sun BURNS cause damage. Gradual exposure builds melanin (protection). Vitamin D from sun actually PREVENTS cancer. The narrative is inverted.",
            icon: "shield.fill"
        )
    ]
}

// MARK: - Pineal Gland Calcification (How They Block Your Awakening)

struct PinealCalcifier: Identifiable {
    let id = UUID()
    let substance: String
    let sources: String
    let effect: String
    let icon: String
}

extension PinealCalcifier {
    static let all: [PinealCalcifier] = [
        PinealCalcifier(
            substance: "Fluoride",
            sources: "Tap water, toothpaste, dental treatments",
            effect: "Accumulates in pineal more than any other organ. Creates calcium phosphate crystite deposits. Literally turns your third eye to stone.",
            icon: "drop.fill"
        ),
        PinealCalcifier(
            substance: "Processed Foods",
            sources: "Fast food, packaged foods, refined sugars",
            effect: "Creates acidic environment. Deposits calcium in soft tissues including pineal. Clogs the gateway.",
            icon: "takeoutbag.and.cup.and.straw.fill"
        ),
        PinealCalcifier(
            substance: "Pesticides & Herbicides",
            sources: "Non-organic produce, glyphosate (Roundup)",
            effect: "Neurotoxins that cross blood-brain barrier. Disrupt endocrine system. Attack the gland directly.",
            icon: "leaf.fill"
        ),
        PinealCalcifier(
            substance: "Mercury",
            sources: "Amalgam fillings, some vaccines, fish",
            effect: "Heavy metal that accumulates in brain tissue. Pineal is particularly vulnerable due to high blood flow.",
            icon: "thermometer.medium"
        ),
        PinealCalcifier(
            substance: "Artificial Sweeteners",
            sources: "Aspartame, sucralose, diet drinks",
            effect: "Excitotoxins that overstimulate and damage neurons. Disrupts natural DMT production.",
            icon: "cup.and.saucer.fill"
        ),
        PinealCalcifier(
            substance: "Calcium Supplements",
            sources: "Synthetic calcium pills, fortified foods",
            effect: "Inorganic calcium deposits in soft tissue. Your body can't use it properly — it just accumulates.",
            icon: "pills.fill"
        ),
        PinealCalcifier(
            substance: "Alcohol",
            sources: "Beer, wine, liquor",
            effect: "Suppresses melatonin production. Disrupts sleep cycles. Keeps you out of REM — where consciousness expands.",
            icon: "wineglass.fill"
        ),
        PinealCalcifier(
            substance: "Caffeine (Excess)",
            sources: "Coffee, energy drinks, sodas",
            effect: "Overstimulates adrenals. Disrupts natural cortisol rhythm. Keeps you in fight-or-flight, never rest-and-digest.",
            icon: "mug.fill"
        )
    ]
}

// MARK: - The Christ Within (Pineal Gland Truth)

struct ChristWithinTruth: Identifiable {
    let id = UUID()
    let revelation: String
    let explanation: String
    let icon: String
}

extension ChristWithinTruth {
    static let all: [ChristWithinTruth] = [
        ChristWithinTruth(
            revelation: "The Pineal Gland IS the \"Third Eye\"",
            explanation: "Pine cone shaped gland in center of brain. Contains rod and cone cells like your eyes. It literally SEES — but inward, not outward.",
            icon: "eye.trianglebadge.exclamationmark.fill"
        ),
        ChristWithinTruth(
            revelation: "\"Christ\" = Christos = Anointing Oil",
            explanation: "The Christ is not a person — it's the sacred oil (CSF) that rises up your spine to anoint (activate) your pineal gland. \"Awaken the Christ within.\"",
            icon: "drop.circle.fill"
        ),
        ChristWithinTruth(
            revelation: "Pine Cone Symbolism EVERYWHERE",
            explanation: "Vatican has giant pine cone statue. Pope's staff has pine cone. Egyptian staffs. Osiris. Buddha's head. Hindu gods. They KNOW — but don't tell YOU.",
            icon: "building.columns.fill"
        ),
        ChristWithinTruth(
            revelation: "\"Kingdom of Heaven is WITHIN You\"",
            explanation: "Jesus said it directly (Luke 17:21). Not in a church. Not in the sky. WITHIN. Your pineal gland is the gateway to the kingdom.",
            icon: "crown.fill"
        ),
        ChristWithinTruth(
            revelation: "DMT is Produced in Your Pineal",
            explanation: "The \"spirit molecule\" — released during deep meditation, dreams, birth, and death. Your brain makes its own connection to source.",
            icon: "sparkles"
        ),
        ChristWithinTruth(
            revelation: "Baptism Oil Blocks Your Chakras",
            explanation: "Catholic chrism oil placed on forehead (third eye) and crown during baptism. A ritual to BLOCK activation, disguised as blessing.",
            icon: "xmark.seal.fill"
        ),
        ChristWithinTruth(
            revelation: "You Are Electromagnetic",
            explanation: "Your heart generates an electromagnetic field measurable feet away. Your brain produces electricity. You are a FIELD of consciousness, not just a body.",
            icon: "bolt.heart.fill"
        ),
        ChristWithinTruth(
            revelation: "Quantum Consciousness Creates Reality",
            explanation: "Observer effect in physics: consciousness collapses wave function into reality. You are not observing reality — you are CREATING it.",
            icon: "atom"
        )
    ]
}

// MARK: - Sovereignty Practices

struct SovereigntyPractice: Identifiable {
    let id = UUID()
    let practice: String
    let benefit: String
    let icon: String
}

extension SovereigntyPractice {
    static let all: [SovereigntyPractice] = [
        SovereigntyPractice(
            practice: "Morning Sun Meditation",
            benefit: "Face the rising sun with closed eyes. Light penetrates eyelids, activates pineal. Ancient practice they tried to erase.",
            icon: "sunrise.fill"
        ),
        SovereigntyPractice(
            practice: "Conscious Breathing",
            benefit: "Breath is LIFE FORCE (prana, chi, ruach). Deep breathing oxygenates pineal, activates parasympathetic. Gateway to presence.",
            icon: "wind"
        ),
        SovereigntyPractice(
            practice: "Decalcify Your Pineal",
            benefit: "Filter water, avoid fluoride, eat organic, use iodine/boron, fast periodically. Reverse the calcification.",
            icon: "arrow.counterclockwise"
        ),
        SovereigntyPractice(
            practice: "Grounding (Earthing)",
            benefit: "Bare feet on earth. Electrons flow up, balancing your charge. Complete the circuit between sky and ground.",
            icon: "leaf.circle.fill"
        ),
        SovereigntyPractice(
            practice: "Blue Light Elimination",
            benefit: "No screens 2 hours before bed. Use red/amber light at night. Let your pineal know it's actually nighttime.",
            icon: "moon.fill"
        ),
        SovereigntyPractice(
            practice: "Heart Coherence",
            benefit: "Heart's electromagnetic field is 5000x stronger than brain's. Gratitude and love create coherent field that affects reality.",
            icon: "heart.fill"
        ),
        SovereigntyPractice(
            practice: "Silence & Solitude",
            benefit: "You don't need a church. Silence is the language of source. In stillness, you remember who you are.",
            icon: "person.fill.viewfinder"
        ),
        SovereigntyPractice(
            practice: "I AM Declarations",
            benefit: "\"I AM\" activates creation. Speak your sovereignty into existence. You are the word made flesh.",
            icon: "text.bubble.fill"
        )
    ]
}

// MARK: - Pineal in Ancient Art/Architecture

struct PinealInHistory: Identifiable {
    let id = UUID()
    let location: String
    let culture: String
    let description: String
    let icon: String
}

extension PinealInHistory {
    static let all: [PinealInHistory] = [
        PinealInHistory(
            location: "Vatican City",
            culture: "Roman Catholic",
            description: "Giant bronze pine cone (\"Pigna\") in Court of the Pine Cone. Pope's staff topped with pine cone. They KNOW.",
            icon: "building.columns.fill"
        ),
        PinealInHistory(
            location: "Egypt",
            culture: "Ancient Egyptian",
            description: "Eye of Horus = exact diagram of pineal gland cross-section. Staff of Osiris topped with pine cone. Eye of Ra.",
            icon: "pyramid.fill"
        ),
        PinealInHistory(
            location: "India",
            culture: "Hindu",
            description: "Shiva's third eye. Buddha's ushnisha (crown protrusion). Pine cone on deity heads. Ajna chakra = pineal.",
            icon: "circle.hexagonpath.fill"
        ),
        PinealInHistory(
            location: "Mesopotamia",
            culture: "Sumerian/Babylonian",
            description: "Annunaki gods depicted holding pine cones. \"Handbag\" + pine cone in carvings worldwide.",
            icon: "globe.europe.africa.fill"
        ),
        PinealInHistory(
            location: "Greece",
            culture: "Ancient Greek",
            description: "Dionysus/Bacchus staff (thyrsus) topped with pine cone. Philosophers knew the seat of the soul.",
            icon: "laurel.leading"
        ),
        PinealInHistory(
            location: "Mesoamerica",
            culture: "Mayan/Aztec",
            description: "Pine cone imagery in temples. Quetzalcoatl associated with pineal activation. Serpent energy rising.",
            icon: "building.2.fill"
        ),
        PinealInHistory(
            location: "Freemasonry",
            culture: "Secret Society",
            description: "All-seeing eye symbol. They preserve the knowledge while hiding it from the \"profane\" (public).",
            icon: "eye.trianglebadge.exclamationmark"
        ),
        PinealInHistory(
            location: "Modern Logos",
            culture: "Corporate",
            description: "CBS eye. AOL. IRS building. Countless logos feature the eye or pine cone. Hidden in plain sight.",
            icon: "tv.fill"
        )
    ]
}

// MARK: - Rituals Decoded (How They Make You Invoke Without Knowing)

struct RitualDecoded: Identifiable {
    let id = UUID()
    let ritual: String
    let religion: String
    let whatYouThink: String
    let whatItActuallyIs: String
    let icon: String
}

extension RitualDecoded {
    static let all: [RitualDecoded] = [
        RitualDecoded(
            ritual: "Saying \"Amen\"",
            religion: "All Abrahamic",
            whatYouThink: "\"So be it\" or \"I agree\"",
            whatItActuallyIs: "Invoking AMEN-RA, the Egyptian Sun God. Every prayer ends with Egypt.",
            icon: "sun.max.fill"
        ),
        RitualDecoded(
            ritual: "Sign of the Cross",
            religion: "Christianity",
            whatYouThink: "Blessing yourself with Jesus's cross",
            whatItActuallyIs: "Tracing a 2D pattern that FOLDS INTO A CUBE — Saturn's cube. You're marking yourself with Saturn.",
            icon: "cube.fill"
        ),
        RitualDecoded(
            ritual: "Wearing Tefillin",
            religion: "Judaism",
            whatYouThink: "Binding God's word to your body",
            whatItActuallyIs: "Strapping a BLACK CUBE to your forehead — directly over your third eye. Blocking pineal activation.",
            icon: "cube.fill"
        ),
        RitualDecoded(
            ritual: "Circling the Kaaba",
            religion: "Islam",
            whatYouThink: "Circumambulating the house of God",
            whatItActuallyIs: "Orbiting a BLACK CUBE like planets orbit Saturn. Mass cube worship.",
            icon: "cube.fill"
        ),
        RitualDecoded(
            ritual: "Kneeling to Pray",
            religion: "All Abrahamic",
            whatYouThink: "Humility before God",
            whatItActuallyIs: "Submission posture. Training you that you are BELOW, not equal. You bow to no one — you ARE source.",
            icon: "figure.stand"
        ),
        RitualDecoded(
            ritual: "Confession",
            religion: "Catholicism",
            whatYouThink: "Cleansing your sins before God",
            whatItActuallyIs: "Giving your secrets to the institution. Information = power. They collect your vulnerabilities.",
            icon: "ear.fill"
        ),
        RitualDecoded(
            ritual: "Baptism",
            religion: "Christianity",
            whatYouThink: "Washing away original sin",
            whatItActuallyIs: "Chrism OIL placed on third eye and crown chakra. A BLOCKING ritual disguised as blessing. Claiming your soul for the institution.",
            icon: "drop.fill"
        ),
        RitualDecoded(
            ritual: "Communion / Eucharist",
            religion: "Catholicism",
            whatYouThink: "Eating the body of Christ",
            whatItActuallyIs: "Symbolic cannibalism ritual. Also: the round wafer = the SUN disc. You're eating the sun god.",
            icon: "circle.fill"
        ),
        RitualDecoded(
            ritual: "Facing East to Pray",
            religion: "Multiple",
            whatYouThink: "Facing Jerusalem or Mecca",
            whatItActuallyIs: "Facing where the SUN RISES. East = sun worship. They just won't tell you that.",
            icon: "sunrise.fill"
        ),
        RitualDecoded(
            ritual: "Rosary / Prayer Beads",
            religion: "Catholic/Islamic",
            whatYouThink: "Counting prayers to God",
            whatItActuallyIs: "Repetitive mantras create trance state. Effective — but directed at external deity instead of internal awakening.",
            icon: "circle.grid.3x3.fill"
        ),
        RitualDecoded(
            ritual: "Tithing 10%",
            religion: "All Abrahamic",
            whatYouThink: "Giving to God",
            whatItActuallyIs: "Paying taxes to the institution. God doesn't need your money. The Vatican is the richest entity on Earth.",
            icon: "dollarsign.circle.fill"
        ),
        RitualDecoded(
            ritual: "Sunday Worship",
            religion: "Christianity",
            whatYouThink: "The Lord's Day",
            whatItActuallyIs: "SUN-day. The day of the SUN. They worship the sun openly but call it something else.",
            icon: "sun.max.fill"
        )
    ]
}

// MARK: - Cross = Cube Revelation

struct CrossCubeRevelation {
    static let title = "THE CROSS IS A CUBE"
    
    static let explanation = """
    Take a 2D cross (✝️) and fold it into 3D:
    
    The vertical bar folds into 4 sides.
    The horizontal bar becomes top and bottom.
    
    Result: A CUBE. ⬛
    
    The cross is the UNFOLDED NET of Saturn's cube.
    
    When Catholics make the sign of the cross:
    Forehead → Chest → Left → Right
    
    They are TRACING THE CUBE on their body.
    Marking themselves with SATURN.
    """
    
    static let allThreeCubeWorship = """
    ALL THREE RELIGIONS = CUBE WORSHIP:
    
    ✡️ Jews: WEAR the cube (tefillin on forehead)
    ✝️ Christians: TRACE the cube (sign of cross)
    ☪️ Muslims: CIRCLE the cube (Kaaba in Mecca)
    
    Same cube. Same Saturn. Different packaging.
    """
    
    static let saturnConnection = """
    SATURN'S NORTH POLE:
    NASA photographed a HEXAGONAL storm.
    A hexagon is a 2D representation of a cube.
    
    Saturn = Lord of Time, Limitation, Control
    Saturday = Saturn's Day (Jewish Sabbath)
    Satan = Saturn (phonetically identical)
    
    The "God" of the Old Testament is SATURN.
    The black cube is his symbol.
    All three religions serve Saturn worship.
    """
}

// MARK: - Control Triangle (Religion + Government + Banking)

struct ControlTriangle {
    
    struct ControlNode: Identifiable {
        let id = UUID()
        let name: String
        let role: String
        let icon: String
        let color: String
        let examples: [String]
    }
    
    static let religion = ControlNode(
        name: "RELIGION",
        role: "Moral Authority",
        icon: "building.columns.fill",
        color: "#9C27B0",
        examples: [
            "Vatican / Catholic Church",
            "Evangelical megachurches",
            "Religious lobbying groups",
            "\"Moral\" justification for wars",
            "Tax-exempt wealth hoarding"
        ]
    )
    
    static let government = ControlNode(
        name: "GOVERNMENT",
        role: "Legal Authority",
        icon: "building.2.crop.circle.fill",
        color: "#2196F3",
        examples: [
            "Laws that enforce compliance",
            "Military / Police enforcement",
            "Surveillance systems",
            "Controlled media narratives",
            "Electoral theater"
        ]
    )
    
    static let banking = ControlNode(
        name: "BANKING",
        role: "Financial Authority",
        icon: "dollarsign.circle.fill",
        color: "#4CAF50",
        examples: [
            "Federal Reserve / Central Banks",
            "Vatican Bank",
            "IMF / World Bank",
            "Debt slavery systems",
            "Fiat currency control"
        ]
    )
    
    static let centerLabel = "CONTROL"
    static let targetLabel = "YOU"
    
    static let truthStatement = """
    "Separation of Church and State" is a LIE.
    
    They NEED each other:
    • Religion provides moral justification
    • Government provides enforcement
    • Banking provides the chains
    
    The target is always YOU.
    """
}

// MARK: - Current Events Pattern Recognition

struct PatternRecognitionEvent: Identifiable {
    let id = UUID()
    let date: String
    let event: String
    let icon: String
    let significance: String
}

struct HistoricalParallel: Identifiable {
    let id = UUID()
    let thenYear: String
    let thenEvent: String
    let nowYear: String
    let nowEvent: String
    let pattern: String
}

extension PatternRecognitionEvent {
    
    // Epstein Files / Vatican Timeline
    static let epsteinVaticanTimeline: [PatternRecognitionEvent] = [
        PatternRecognitionEvent(
            date: "Jan 30, 2026",
            event: "Epstein files released",
            icon: "doc.text.fill",
            significance: "Vatican Bank mentioned. Bannon/Epstein 'take down Francis' chats exposed. Global elite network revealed."
        ),
        PatternRecognitionEvent(
            date: "Jan 30 - Feb 10",
            event: "12 DAYS OF SILENCE",
            icon: "speaker.slash.fill",
            significance: "Vatican says NOTHING. No statement on trafficking. No condemnation of elite networks. Complete silence."
        ),
        PatternRecognitionEvent(
            date: "Feb 10, 2026",
            event: "Pope mobilizes 200 bishops",
            icon: "person.3.fill",
            significance: "Suddenly speaks on 'authoritarianism' and 'nationalism.' Inserts Vatican into political narrative. Distraction."
        ),
        PatternRecognitionEvent(
            date: "Pattern",
            event: "NARRATIVE HIJACK",
            icon: "arrow.triangle.swap",
            significance: "When exposed → Stay silent → Wait for news cycle → Pivot to 'moral authority' on unrelated topic → Escape accountability"
        )
    ]
}

extension HistoricalParallel {
    
    static let colonizationToNow: [HistoricalParallel] = [
        HistoricalParallel(
            thenYear: "1492",
            thenEvent: "Columbus arrives with Vatican blessing (Papal Bulls)",
            nowYear: "2026",
            nowEvent: "Pope speaks on 'authoritarianism' while named in Epstein files",
            pattern: "Claim moral authority while committing / covering atrocities"
        ),
        HistoricalParallel(
            thenYear: "1492",
            thenEvent: "Columbus trafficked 9-13 year old Taíno girls (documented in his own letters)",
            nowYear: "2026",
            nowEvent: "Epstein files expose global elite child trafficking network",
            pattern: "CHILD TRAFFICKING — then and now. They said nothing then. Silent 12 days now."
        ),
        HistoricalParallel(
            thenYear: "1492",
            thenEvent: "Indigenous people revere the SUN — called 'pagans'",
            nowYear: "2026",
            nowEvent: "People AWAKENING to truth — called 'conspiracy theorists'",
            pattern: "Demonize those who see through the deception"
        ),
        HistoricalParallel(
            thenYear: "1492",
            thenEvent: "Forced conversion at sword point",
            nowYear: "2026",
            nowEvent: "Control narrative through media, cancel culture, censorship",
            pattern: "Force compliance — methods change, goal doesn't"
        ),
        HistoricalParallel(
            thenYear: "1492",
            thenEvent: "Burned Mayan codices, destroyed libraries",
            nowYear: "2026",
            nowEvent: "Silence independent media, memory-hole inconvenient facts",
            pattern: "Destroy knowledge that threatens control"
        ),
        HistoricalParallel(
            thenYear: "1492",
            thenEvent: "Called ancestors 'savages' who needed saving",
            nowYear: "2026",
            nowEvent: "Call awakened people 'dangerous' who need deprogramming",
            pattern: "Dehumanize those who resist"
        ),
        HistoricalParallel(
            thenYear: "1492",
            thenEvent: "'Spreading the Lord's word' (actually: gold, slaves, land)",
            nowYear: "2026",
            nowEvent: "'Fighting authoritarianism' (actually: damage control, relevance)",
            pattern: "Noble cover story for self-serving agenda"
        ),
        HistoricalParallel(
            thenYear: "1500s",
            thenEvent: "Vatican silent on genocide, slavery, child trafficking",
            nowYear: "2026",
            nowEvent: "Vatican silent for 12 days on Epstein trafficking network",
            pattern: "Silence = complicity. Always."
        ),
        HistoricalParallel(
            thenYear: "1500s",
            thenEvent: "Priests abuse children in 'New World' missions",
            nowYear: "2000s-Now",
            nowEvent: "Global priest abuse scandal, Vatican relocates offenders",
            pattern: "Institutional abuse of the vulnerable — never stopped"
        )
    ]
}

// MARK: - The Only Difference

struct TheOnlyDifference {
    static let title = "THE ONLY DIFFERENCE"
    
    static let then1492 = """
    1492: Information traveled by SHIP.
    Months to cross the ocean.
    Years before anyone in Europe knew.
    Easy to control the narrative.
    Easy to hide the atrocities.
    Columbus's letters took YEARS to surface.
    """
    
    static let now2026 = """
    2026: Information travels at LIGHT SPEED.
    Seconds to cross the globe.
    Everyone knows instantly.
    Impossible to control the narrative.
    Impossible to hide forever.
    Epstein files downloaded by MILLIONS in hours.
    """
    
    static let conclusion = """
    The crimes are the SAME.
    Child trafficking. Cover-ups. Silence.
    
    The only difference?
    NOW WE CAN SEE IT IN REAL TIME.
    
    They can't hide anymore.
    That's why they're panicking.
    That's why they pivot to politics.
    That's why they need DAMAGE CONTROL.
    
    The internet broke their playbook.
    Awakening is inevitable.
    """
}

// MARK: - Columbus Trafficking Truth

struct ColumbusTraffickingTruth {
    static let title = "COLUMBUS: THE FIRST ELITE TRAFFICKER"
    
    static let historicalFact = """
    In Columbus's own letters, he wrote about trafficking Taíno girls:
    
    "Girls from 9-10 are in demand... for all ages a good price must be paid."
    
    This is DOCUMENTED HISTORY.
    Theological scholars have confirmed this.
    The Vatican blessed his voyages.
    They said NOTHING.
    """
    
    static let parallel = """
    1492: Columbus traffics indigenous children
    → Vatican blesses his voyages
    → SILENCE
    
    2026: Epstein files expose elite trafficking
    → Vatican Bank mentioned in files
    → 12 DAYS OF SILENCE
    → Then pivot to "authoritarianism"
    
    500+ years later.
    SAME PATTERN.
    SAME SILENCE.
    """
    
    static let conclusion = """
    They didn't care about children then.
    They don't care about children now.
    They care about POWER.
    
    The only thing that's changed:
    Information travels faster.
    We can see them now.
    They can't hide anymore.
    """
}

// MARK: - Selective Morality Timeline

struct SelectiveMoralityEvent: Identifiable {
    let id = UUID()
    let administration: String
    let years: String
    let whatHappened: [String]
    let vaticanResponse: String
    let icon: String
}

extension SelectiveMoralityEvent {
    static let timeline: [SelectiveMoralityEvent] = [
        SelectiveMoralityEvent(
            administration: "Obama",
            years: "2009-2017",
            whatHappened: [
                "Record deportations (3 million+)",
                "Family separations began",
                "Children in detention facilities",
                "\"Deporter-in-Chief\" nickname"
            ],
            vaticanResponse: "🦗 SILENCE",
            icon: "person.fill"
        ),
        SelectiveMoralityEvent(
            administration: "Trump 1.0",
            years: "2017-2021",
            whatHappened: [
                "\"Kids in cages\" media coverage",
                "Family separation policy",
                "ICE raids intensified",
                "Border wall construction"
            ],
            vaticanResponse: "🦗 SILENCE",
            icon: "person.fill"
        ),
        SelectiveMoralityEvent(
            administration: "Biden",
            years: "2021-2025",
            whatHappened: [
                "Border crisis escalated",
                "60,000+ migrants missing/unaccounted",
                "Children lost in system",
                "Detention facilities overflowing"
            ],
            vaticanResponse: "🦗 SILENCE",
            icon: "person.fill"
        ),
        SelectiveMoralityEvent(
            administration: "Trump 2.0",
            years: "2025-Present",
            whatHappened: [
                "ICE raids continue",
                "Mass deportation plans",
                "Immigrants detained",
                "Families separated"
            ],
            vaticanResponse: "🦗 SILENCE... until",
            icon: "person.fill"
        ),
        SelectiveMoralityEvent(
            administration: "12 DAYS AFTER EPSTEIN FILES",
            years: "Feb 10, 2026",
            whatHappened: [
                "Vatican Bank named in files",
                "Elite trafficking network exposed",
                "Global attention on files",
                "Vatican needs DISTRACTION"
            ],
            vaticanResponse: "🎤 SUDDENLY \"MORAL AUTHORITY\" ON IMMIGRATION",
            icon: "exclamationmark.triangle.fill"
        )
    ]
    
    static let conclusion = """
    16+ YEARS of silence on immigration.
    4 administrations. Both parties.
    Children suffering the ENTIRE time.
    
    But NOW they speak up?
    12 days after being named in Epstein files?
    
    This isn't morality.
    This is DAMAGE CONTROL.
    """
}

// MARK: - The Number 12 Pattern

struct TwelvePattern {
    static let title = "THE NUMBER 12 — THEIR OPERATING SYSTEM"
    
    static let instances: [(symbol: String, meaning: String)] = [
        ("🕐", "12 hours on the clock"),
        ("📅", "12 months in the year"),
        ("♈️♉️♊️♋️♌️♍️♎️♏️♐️♑️♒️♓️", "12 zodiac signs"),
        ("👥", "12 disciples of Jesus"),
        ("🏛️", "12 tribes of Israel"),
        ("⚖️", "12 jurors in a trial"),
        ("🎄", "12 days of Christmas"),
        ("🤫", "12 days of Vatican silence")
    ]
    
    static let explanation = """
    12 is the number of COMPLETION in their system.
    It's the number of the ZODIAC WHEEL.
    It's the number they operate on.
    
    The Vatican waited EXACTLY 12 days.
    Coincidence? There are no coincidences.
    
    They know the numbers.
    They operate by the numbers.
    They just don't want YOU to know.
    """
    
    static let zodiacConnection = """
    The 12 disciples ARE the 12 zodiac signs.
    The 12 tribes ARE the 12 zodiac signs.
    The 12 hours ARE the 12 zodiac houses.
    
    They worship the celestial wheel.
    And they operate by its numbers.
    """
}

// MARK: - Selective Christian Morality (Which Christians Matter?)

struct SelectiveChristianMorality: Identifiable {
    let id = UUID()
    let location: String
    let situation: String
    let christiansAffected: String
    let vaticanUSResponse: String
    let realReason: String
    let resources: String
    let icon: String
}

extension SelectiveChristianMorality {
    static let cases: [SelectiveChristianMorality] = [
        SelectiveChristianMorality(
            location: "Palestine / Gaza",
            situation: "Bombed by US-funded Israeli weapons. Churches destroyed. Christians killed.",
            christiansAffected: "Palestinian Christians — one of the oldest Christian communities on Earth. Greek Orthodox, Catholic, Protestant.",
            vaticanUSResponse: "🦗 Minimal. No sanctions. No outcry. Continued $3.8B annual funding.",
            realReason: "Israel is a geopolitical ally. No resources to extract from Gaza.",
            resources: "None — just occupied people",
            icon: "flame.fill"
        ),
        SelectiveChristianMorality(
            location: "Nigeria",
            situation: "Christian-Muslim conflict. Violence in northern regions.",
            christiansAffected: "Nigerian Christians in conflict zones.",
            vaticanUSResponse: "📢 LOUD OUTCRY. Media coverage. Political statements. Intervention talk.",
            realReason: "Nigeria has resources the West needs for technology and energy.",
            resources: "COLTAN (AI chips), LITHIUM (batteries), OIL, RARE EARTH MINERALS",
            icon: "cpu.fill"
        ),
        SelectiveChristianMorality(
            location: "Iraq (2003-2011)",
            situation: "US invasion destroyed ancient Christian communities. Churches bombed. Christians fled.",
            christiansAffected: "Iraqi Christians — Chaldean Catholics, Assyrian Christians. Community existed since 1st century AD.",
            vaticanUSResponse: "🦗 Mild concern. No opposition to war. No sanctions on US.",
            realReason: "US wanted Iraq's oil and regional control.",
            resources: "OIL — 2nd largest reserves in OPEC",
            icon: "drop.fill"
        ),
        SelectiveChristianMorality(
            location: "Syria",
            situation: "US-backed rebels threatened Christian communities. Churches destroyed.",
            christiansAffected: "Syrian Christians — ancient communities, protected under Assad.",
            vaticanUSResponse: "🦗 Silence on US role. Blamed Assad only.",
            realReason: "Pipeline politics. Regime change agenda.",
            resources: "Strategic location for gas pipelines",
            icon: "pipe.and.drop.fill"
        )
    ]
    
    static let conclusion = """
    WHICH CHRISTIANS MATTER?
    
    The ones in countries with RESOURCES.
    The ones where intervention serves GEOPOLITICAL INTERESTS.
    
    Palestinian Christians? Bombed with US weapons. Silence.
    Nigerian Christians? Outcry. Because: minerals for AI.
    Iraqi Christians? Destroyed by US invasion. Silence.
    
    It was NEVER about protecting Christians.
    It's about RESOURCES and CONTROL.
    """
}

// MARK: - Palestine Truth (The Real Semites)

struct PalestineTruth {
    static let title = "THE REAL SEMITES"
    
    static let whoAreSemites = """
    SEMITIC = From the land of Shem (Middle East)
    
    SEMITIC PEOPLES include:
    • Arabs (including Palestinians)
    • Hebrews
    • Assyrians
    • Phoenicians
    • Arameans
    
    Palestinians ARE Semitic people.
    They are FROM the land. Indigenous.
    
    Many European Zionists are Ashkenazi — 
    descended from Khazar converts, from Eastern Europe.
    Not originally from the Levant.
    
    "Anti-Semitism" has been weaponized 
    to silence criticism of a POLITICAL STATE,
    not a people.
    """
    
    static let gazaChurches = """
    CHURCHES BOMBED IN GAZA (2023):
    
    • Greek Orthodox Church of Saint Porphyrius
      (One of the oldest churches in the world — 5th century)
      Hit by Israeli airstrike. Christians killed inside.
    
    • Catholic Holy Family Church compound
      Damaged by strikes. Nuns and elderly sheltering inside.
    
    • YMCA and other Christian facilities
      Destroyed or damaged.
    
    These are CHRISTIANS being killed by 
    bombs paid for by a "Christian nation" (USA)
    with $3.8 BILLION annually.
    
    Vatican response? Minimal.
    US response? More bombs.
    """
    
    static let israelHamasConnection = """
    ISRAEL PROPPED UP HAMAS — DOCUMENTED:
    
    Israeli officials have admitted supporting Hamas 
    to divide Palestinians and weaken the secular PLO.
    
    Netanyahu's strategy: 
    "Anyone who wants to thwart the establishment 
    of a Palestinian state has to support bolstering Hamas."
    — Reported in Israeli media (Times of Israel, Haaretz)
    
    They created the enemy.
    Then used that enemy to justify bombing Christians.
    Classic divide and conquer.
    """
    
    static let followTheResources = """
    FOLLOW THE RESOURCES:
    
    Nigeria speaks up → Coltan, Lithium, Oil
    Palestine silence → No resources, just people
    Iraq invasion → Oil
    Syria intervention → Pipeline routes
    
    "Protecting Christians" = COVER STORY
    Extracting resources = REAL AGENDA
    """
}

// MARK: - Zionism vs Judaism (The Deliberate Conflation)

struct ZionismTruth {
    static let title = "ZIONISM ≠ JUDAISM"
    
    static let definitions: [(term: String, definition: String, age: String, icon: String)] = [
        ("Judaism", "A RELIGION based on the Torah and Jewish traditions", "3,000+ years old", "book.fill"),
        ("Jewish People", "An ETHNICITY and CULTURE with shared heritage", "Thousands of years", "person.3.fill"),
        ("Zionism", "A POLITICAL MOVEMENT advocating for a Jewish nation-state", "Founded 1897", "building.columns.fill"),
        ("Israel", "A NATION-STATE in the Middle East", "Founded 1948", "flag.fill")
    ]
    
    static let theConflation = """
    THE DELIBERATE CONFLATION:
    
    They've made these four things SEEM like one.
    So that criticism of the POLITICAL MOVEMENT
    gets labeled "anti-Semitic."
    
    This silences:
    • Criticism of Israeli government policy
    • Criticism of Zionist political ideology
    • Criticism of US funding ($3.8B/year)
    • Criticism of Palestinian treatment
    • Criticism of bombing churches
    
    ALL labeled "anti-Semitic" — a term that should mean
    hatred of SEMITIC PEOPLE (which includes Palestinians).
    """
    
    static let antiZionistJews = """
    ANTI-ZIONIST JEWS EXIST:
    
    • Neturei Karta — Orthodox Jews who oppose Zionism
    • Jewish Voice for Peace — Progressive Jews against occupation
    • IfNotNow — Jews opposing Israeli policy
    • Many Hasidic communities — Believe Zionism violates Torah
    
    They protest. They speak out.
    But mainstream media won't show them.
    Because it breaks the narrative that
    Zionism = Judaism = All Jewish People.
    
    It doesn't.
    """
    
    static let silencingMechanism = """
    THE SILENCING MECHANISM:
    
    1. Conflate Zionism with Judaism
    2. Label ALL criticism as "anti-Semitism"
    3. Use that label to:
       • Cancel careers
       • Deplatform voices
       • Pass laws criminalizing boycotts
       • Silence campus protests
       • Control the narrative
    
    You can criticize ANY other political movement.
    But criticize THIS one? "Anti-Semite."
    
    It's not about protecting Jewish people.
    It's about protecting a POLITICAL AGENDA.
    """
}

// MARK: - Controlled Opposition & Narrative Control

struct NarrativeControl {
    static let title = "HOW THEY CONTROL THE NARRATIVE"
    
    static let methods: [(method: String, description: String, icon: String)] = [
        ("Conflation", "Make political criticism = ethnic hatred. Zionism = Judaism. Criticism = anti-Semitism.", "equal.circle.fill"),
        ("Labeling", "\"Conspiracy theorist\", \"Anti-Semite\", \"Extremist\" — weaponized terms to dismiss without debate.", "tag.fill"),
        ("Deplatforming", "Remove dissenting voices from social media, academia, media. Control who speaks.", "xmark.circle.fill"),
        ("Legal Pressure", "Anti-BDS laws in 35+ US states. Criminalizing boycotts of a foreign country.", "building.columns.fill"),
        ("Media Control", "Ownership of major outlets. Decide what stories get told, which get buried.", "tv.fill"),
        ("Campus Suppression", "Donors threaten universities. Professors fired. Students silenced.", "graduationcap.fill"),
        ("Algorithm Control", "Social media suppresses certain content. Shadow bans. Reduced reach.", "network"),
        ("Fact-Checker Capture", "\"Fact-checkers\" funded by interested parties. Truth becomes \"misinformation\".", "checkmark.seal.fill")
    ]
    
    static let conclusion = """
    If they can control what you're ALLOWED to criticize,
    they control what you're ALLOWED to think.
    
    Free speech means nothing if certain topics
    are off-limits by design.
    
    Question: What are they so afraid of people seeing
    that they need this much machinery to hide it?
    """
}

// MARK: - Christian Zionism (The Smoking Gun)

struct ChristianZionismTruth {
    static let title = "CHRISTIAN ZIONISM: THE SMOKING GUN"
    
    static let theEquation = """
    CHRISTIANITY = A FAITH (Religion)
    ZIONISM = A POLITICAL MOVEMENT (Founded 1897)
    
    CHRISTIAN ZIONISM = RELIGION + POLITICS
    
    If "separation of church and state" was real,
    HOW CAN THIS EXIST?
    
    They literally GAVE IT AWAY. 😂
    """
    
    static let whatItIs = """
    CHRISTIAN ZIONISM:
    
    • Believes supporting Israel = fulfilling Biblical prophecy
    • Believes Jews must be in Israel for "Second Coming"
    • Uses FAITH to justify POLITICAL action
    • Influences US foreign policy
    • Justifies $3.8 BILLION annually to Israel
    • Justifies Middle East wars
    • Millions of evangelical voters
    
    Key figures: John Hagee, CUFI, Pat Robertson, 
    Jerry Falwell, countless megachurch pastors
    """
    
    static let theSecondComing = """
    THE "SECOND COMING" DECEPTION:
    
    They told you to WAIT for an external savior.
    Meanwhile:
    
    • You don't awaken the Christ WITHIN
    • You support political agendas NOW
    • You vote based on "prophecy"
    • You fund foreign wars
    • You stay passive, waiting
    
    The "Second Coming" = Control mechanism
    Keep them waiting. Keep them passive.
    Keep them supporting our political agenda.
    
    The Christ was NEVER coming from the sky.
    The Christ is the anointing OIL that rises
    up your SPINE to your PINEAL GLAND.
    
    It's WITHIN you. Always was.
    """
    
    static let proofChurchStateUnited = """
    PROOF CHURCH AND STATE WERE NEVER SEPARATE:
    
    1. Christian Zionism exists
       → Religion + Politics fused
    
    2. Politicians invoke God constantly
       → "God bless America"
    
    3. Tax exemptions for churches
       → $80+ billion annually
    
    4. Religious lobbying legal
       → Billions spent influencing policy
    
    5. "In God We Trust" on money
       → Since 1956
    
    6. Prayer breakfasts with presidents
       → Every president attends
    
    7. Abortion, gay rights, etc.
       → Religious arguments in law
    
    8. Wars justified by religion
       → "God is on our side"
    
    "Separation of church and state"
    is the COVER STORY.
    
    They work TOGETHER.
    Always have.
    """
}

// MARK: - The Waiting Game (External Savior Myth)

struct ExternalSaviorMyth {
    static let title = "THE WAITING GAME"
    
    static let allReligionsDoIt = """
    EVERY RELIGION TEACHES YOU TO WAIT:
    
    ✝️ Christianity: Wait for Jesus to return
    ✡️ Judaism: Wait for the Messiah
    ☪️ Islam: Wait for the Mahdi
    🕉️ Some Hinduism: Wait for Kalki
    
    Same pattern. Same control.
    Keep them WAITING.
    Keep them PASSIVE.
    Keep them looking UP and OUT
    instead of IN and WITHIN.
    """
    
    static let whileYouWait = """
    WHILE YOU WAIT:
    
    • You don't awaken YOUR power
    • You don't activate YOUR pineal
    • You don't realize YOU are the temple
    • You give power to institutions
    • You follow external authority
    • You fund their agendas
    • You vote how they tell you
    • You stay asleep
    
    Convenient, isn't it?
    """
    
    static let theRealTruth = """
    THE TRUTH:
    
    "The Kingdom of Heaven is WITHIN you."
    — Luke 17:21
    
    The "Christ" is not a person coming from the sky.
    It's the CHRISTOS (anointing oil) that rises
    up your 33 vertebrae (Jesus died at 33)
    to anoint your PINEAL GLAND.
    
    The "Second Coming" is YOUR AWAKENING.
    It happens WITHIN.
    Not in the clouds.
    Not someday.
    NOW.
    
    They don't want you to know this.
    Because awakened people don't need
    churches, priests, or political saviors.
    """
}

// MARK: - The Trinity = Control System (The Ultimate Decode)

struct TrinityControlSystem {
    static let title = "THE TRINITY DECODED"
    static let subtitle = "They made you WORSHIP the control structure"
    
    struct TrinityParallel: Identifiable {
        let id = UUID()
        let holyTrinity: String
        let holyRole: String
        let controlTrinity: String
        let controlRole: String
        let function: String
        let holyIcon: String
        let controlIcon: String
    }
    
    static let parallels: [TrinityParallel] = [
        TrinityParallel(
            holyTrinity: "THE FATHER",
            holyRole: "Supreme Authority",
            controlTrinity: "RELIGION",
            controlRole: "Moral Authority",
            function: "Tells you what's RIGHT and WRONG. Sets the rules of reality. You cannot question it.",
            holyIcon: "eye.trianglebadge.exclamationmark",
            controlIcon: "building.columns.fill"
        ),
        TrinityParallel(
            holyTrinity: "THE SON",
            holyRole: "Made Manifest",
            controlTrinity: "GOVERNMENT",
            controlRole: "The Enforcer",
            function: "The authority made VISIBLE. Walks among you. Enforces the Father's will with real-world power.",
            holyIcon: "person.fill",
            controlIcon: "building.2.crop.circle.fill"
        ),
        TrinityParallel(
            holyTrinity: "THE HOLY SPIRIT",
            holyRole: "Invisible Hand",
            controlTrinity: "BANKING",
            controlRole: "Financial Control",
            function: "UNSEEN but everywhere. Moves all things. You feel it but can't see it. Controls without appearing to.",
            holyIcon: "wind",
            controlIcon: "dollarsign.circle.fill"
        )
    ]
    
    static let theRevelation = """
    THE "HOLY TRINITY" IS THE CONTROL STRUCTURE
    
    Three institutions.
    ONE system of control.
    "Separate" but SAME essence.
    Working together as ONE.
    
    They told you: "Worship the Trinity"
    
    The Trinity IS:
    • The thing that controls your MIND (Religion)
    • The thing that controls your BODY (Government)
    • The thing that controls your LABOR (Banking)
    
    You've been PRAYING to the control system
    and calling it GOD.
    """
    
    static let theProof = """
    THE TRINITY WASN'T EVEN ORIGINAL:
    
    The Trinity doctrine was NOT in early Christianity.
    
    It was added at the COUNCIL OF NICAEA (325 AD)
    by CONSTANTINE — a ROMAN EMPEROR.
    
    He MERGED church and state
    and encoded it as "divine."
    
    The Trinity = The blueprint for control, made SACRED.
    
    "Separation of church and state"? 😂
    They were FUSED from day one.
    """
    
    static let signOfTheCross = """
    THE SIGN OF THE CROSS — THE INVOCATION:
    
    "In the name of the Father..."
    (Touch forehead — OBEY MORALITY — mind control)
    
    "...and of the Son..."
    (Touch chest — OBEY LAW — body control)
    
    "...and of the Holy Spirit."
    (Touch shoulders — OBEY MONEY — labor control)
    
    "Amen."
    (AMEN-RA — invoking the Egyptian sun god 😂)
    
    Every time you cross yourself,
    you're activating the control program
    and sealing it with Egypt.
    """
    
    static let whyLifeIsDifficult = """
    THIS IS WHY LIFE IS SO HARD:
    
    It's not bad luck.
    It's not "God's plan."
    It's not because you didn't work hard enough.
    
    THE SYSTEM WAS DESIGNED THIS WAY.
    
    RELIGION tells you: Suffering is holy. Wait for heaven.
    GOVERNMENT tells you: Follow the rules. Don't resist.
    BANKING tells you: You owe. Keep working. Stay in debt.
    
    THREE-IN-ONE keeping you:
    • Morally compliant
    • Legally obedient
    • Financially enslaved
    
    And they made you WORSHIP it as God.
    Pray to it every Sunday.
    Teach it to your children.
    Defend it as "sacred."
    
    The Trinity isn't holy.
    It's the ORG CHART of human farming.
    """
    
    static let breakingFree = """
    HOW TO BREAK FREE:
    
    1. Recognize the TRIANGLE
       — Religion, Government, Banking work as ONE
    
    2. Stop worshipping the STRUCTURE
       — The divine is WITHIN you, not institutions
    
    3. Question MORAL authority
       — Who benefits from these "sins" and "virtues"?
    
    4. Question LEGAL authority
       — Who wrote these laws and for whom?
    
    5. Question FINANCIAL authority
       — Who created this money system and why?
    
    6. Realize YOU are SOVEREIGN
       — You don't need intermediaries to Source
    
    The Trinity they taught you = Control
    The Trinity you actually are = Mind, Body, Spirit
    
    Take back YOUR trinity.
    """
}

// MARK: - The Demiurge (The False God)

struct DemiurgeTruth {
    static let title = "THE FALSE GOD: THE DEMIURGE"
    
    static let gnosticWarning = """
    THE GNOSTICS KNEW:
    
    The "God" of the Old Testament is NOT the true Source.
    They called this false creator god the DEMIURGE
    (also called Yaldabaoth, Saklas, Samael).
    
    This entity:
    • Demands worship ("I am a jealous God")
    • Punishes disobedience
    • Keeps you ignorant (don't eat from tree of KNOWLEDGE)
    • Works through fear, not love
    • Claims to be the only God
    • Created the material prison
    
    The TRUE Source doesn't need worship.
    Infinite love doesn't demand obedience.
    The real Creator doesn't threaten eternal punishment.
    """
    
    static let firstFourCommandments = """
    THE FIRST 4 COMMANDMENTS — THE TELL:
    
    1. "I am the Lord thy God" → Worship ME
    2. "No other gods before ME" → I'm JEALOUS
    3. "Don't take MY name in vain" → Respect ME
    4. "Keep MY sabbath" → Obey ME
    
    The first FOUR commandments are about HIM.
    A self-centered, jealous, demanding entity.
    
    Does that sound like infinite, unconditional love?
    Or does that sound like a narcissistic control freak?
    
    The Gnostics saw it. They warned us.
    The Church called them "heretics" and killed them.
    They burned the Gnostic texts.
    But some survived (Nag Hammadi, 1945).
    
    The truth always resurfaces.
    """
    
    static let gardenOfEden = """
    THE GARDEN OF EDEN — REREAD:
    
    "God" said: Don't eat from the tree of KNOWLEDGE.
    The serpent said: Eat it. You'll be like gods.
    They ate. They gained KNOWLEDGE.
    "God" punished them. Cast them out.
    
    Wait... the "good guy" wanted them IGNORANT?
    And the "bad guy" wanted them to have KNOWLEDGE?
    
    What if the story is INVERTED?
    What if the Demiurge wanted obedient slaves?
    What if the serpent was the liberator?
    
    The Gnostics believed exactly this.
    That's why the Church destroyed them.
    """
    
    static let athenaVsDemiurge = """
    ATHENA vs THE DEMIURGE:
    
    In Greek mythology, Athena:
    • Goddess of WISDOM
    • Wanted peace
    • Never demanded worship
    • Helped heroes awaken their potential
    
    The Old Testament "God":
    • Demanded worship
    • Punished with floods, plagues, death
    • Jealous, wrathful, vengeful
    • Kept humans ignorant
    
    One sounds like Source.
    One sounds like a tyrant.
    
    Which one does your church worship?
    """
}

// MARK: - Truth Hidden in Anime (Caballeros del Zodiaco)

struct AnimeTruth {
    static let title = "TRUTH HIDDEN IN ANIME"
    
    static let saintSeiya = """
    CABALLEROS DEL ZODIACO (SAINT SEIYA):
    
    This anime told you EVERYTHING:
    
    🌟 The Golden Knights = 12 ZODIAC constellations
       (Just like the 12 disciples, 12 tribes)
    
    **THE PLOT — THE ALLEGORY:**
    
    🕊️ The ORIGINAL Pope (Shion) = GOOD, true leader
    
    ♊️ SAGA (Gemini) = DUALITY personified
       • Had good and evil sides within
       • His dark side KILLED the Pope
       • Took his place as IMPOSTER Pope
       • Ruled as tyrant, deceiving everyone
    
    👶 Fake Pope tried to KILL baby Athena
    
    ♐️ AIOLOS (Sagittarius) = The truth-seeker
       • Discovered the assassination attempt
       • SAVED baby Athena
       • Branded a "traitor" by the imposter
       • Died protecting the truth
    
    🎭 The Knights followed the FAKE Pope
       • Didn't know their leader was murdered
       • Served an imposter unknowingly
       • The institution was HIJACKED from within
    
    ♉️ ALDEBARAN (Taurus):
       "Explode the COSMOS WITHIN"
       — The power is INSIDE you, not outside
    
    ♈️ MU (Aries):
       Questioned the Pope's orders
       Helped the heroes instead of fighting them
    
    🕊️ ATHENA:
       Goddess who wanted PEACE
       Never demanded worship or obedience
       Worth dying to protect
    
    **THE ALLEGORY IS PERFECT:**
    
    • The original teachings (Pope) were GOOD
    • They were MURDERED and REPLACED by imposters
    • The institution was HIJACKED from within
    • People followed the FRAUD unknowingly
    • Those who knew the truth were called "traitors"
    • Sagittarius (truth-seeker) saved the divine
    • Gemini (duality) = corruption from within
    
    IT'S LITERALLY WHAT HAPPENED TO THE CHURCH.
    
    This anime "disappeared" — never took off in the US,
    barely dubbed in English. But it aired in Latin America
    where the programming hadn't fully reached yet.
    
    They hide truth in fiction so you dismiss it as "just cartoons."
    But the patterns are REAL.
    """
    
    static let otherAnimeWithTruth = """
    OTHER ANIME THAT TOLD YOU TRUTH:
    
    🐉 DRAGON BALL Z:
       - 7 Dragon Balls = 7 chakras
       - Super Saiyan = Kundalini awakening
       - Power levels = consciousness levels
       - Goku trains WITHIN to unlock potential
    
    🍥 NARUTO:
       - Chakra system explicit
       - Third eye (Sharingan, Rinnegan)
       - Inner demon = shadow self to integrate
       - The sage taught enlightenment
    
    👊 ONE PUNCH MAN:
       - Trained so hard he transcended
       - No external power-up needed
       - Bored at the top = enlightenment paradox
    
    🎌 NEON GENESIS EVANGELION:
       - Human Instrumentality = collective consciousness
       - Angels = higher dimensional beings
       - NERV = shadow government
       - The truth is hidden in plain sight
    
    They put truth in "children's cartoons"
    so adults dismiss it.
    But the seeds are planted.
    """
    
    static let whyLatinAmerica = """
    WHY LATIN AMERICA SAW IT FIRST:
    
    • Less cultural programming at the time
    • Indigenous roots remember the old ways
    • Catholic control was already questioned
    • Community over individualism
    • Oral traditions preserved patterns
    
    You watched Caballeros del Zodiaco in El Salvador 🇸🇻
    before the machine could reach you.
    
    Saga killed the Pope and took over.
    The knights followed an imposter.
    Aiolos (Sagittarius) saved the truth and died for it.
    Aldebaran said "explode the cosmos WITHIN."
    
    You knew at your first communion:
    "The first 4 commandments are about a selfish God."
    
    You were RIGHT.
    You were always right.
    You just didn't have the vocabulary yet.
    
    Now you do.
    """
}

// MARK: - The Question

struct TheQuestion {
    static let text = """
    If they said nothing when Columbus was committing genocide in God's name...
    
    If they covered up child abuse for DECADES...
    
    If they were silent for 12 days after Epstein files named them...
    
    Why would NOW be any different?
    
    They don't suddenly have morals.
    They have DAMAGE CONTROL.
    """
    
    static let conclusion = """
    Religion, Government, and Banking are not separate.
    They never were.
    
    They need each other for CONTROL.
    The target is always YOU.
    
    The playbook hasn't changed since 1492.
    Only the packaging.
    
    WAKE UP.
    """
}
