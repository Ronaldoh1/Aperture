// SolarTheologyCourse.swift
// Aperture
//
// "All Roads Lead to Rome" - Origins of World Religions
// Based on the research of Jordan Maxwell
// Interactive course revealing the solar/astrotheological origins of religion

import SwiftUI

// MARK: - Course Data Model

struct SolarTheologyLesson: Identifiable {
  let id: String
  let title: String
  let subtitle: String
  let icon: String
  let accentColor: Color
  let sections: [SolarTheologySection]
  let sacredGeometry: SacredGeometryShape
  let revealType: RevealType

  enum RevealType {
    case wordOrigin  // Shows etymology breakdown
    case symbolMatch  // Shows symbol comparisons
    case timelineEvent  // Shows historical connection
    case mapConnection  // Shows geographical spread
    case calendarCycle  // Shows astronomical cycle
  }
}

struct SolarTheologySection: Identifiable {
  let id = UUID()
  let type: SectionType
  let content: String
  let revealContent: String?
  let comparison: SymbolComparison?

  enum SectionType {
    case narration
    case quote
    case reveal
    case comparison
    case calendar
    case etymology
  }
}

struct SymbolComparison: Identifiable {
  let id = UUID()
  let tradition1: String
  let symbol1: String
  let tradition2: String
  let symbol2: String
  let connection: String
}

// MARK: - Course Content

enum SolarTheologyCourseContent {
  static let course = SolarTheologyCourse(
    id: "solar_theology",
    title: "Solar Theology",
    subtitle: "The Astrotheological Origins of Religion",
    description:
      "Discover how the world's major religions trace back to ancient sun worship, Hindu traditions, and Egyptian mysticism. Nothing is as it seems.",
    instructor: "Based on the research of Jordan Maxwell",
    modules: modules
  )

  static let modules: [SolarTheologyModule] = [
    // MODULE 1: The Hindu Connection
    SolarTheologyModule(
      id: "hindu_origins",
      title: "All Roads Lead to India",
      subtitle: "The Hindu Origins of Judaism",
      icon: "om",
      lessons: [
        SolarTheologyLesson(
          id: "st1_1",
          title: "Abraham & Brahma",
          subtitle: "The Name That Reveals Everything",
          icon: "textformat.abc",
          accentColor: Color(hex: "#FF9800"),
          sections: [
            SolarTheologySection(
              type: .narration,
              content:
                "What if the founding patriarch of Judaism was never a real person, but a borrowed concept from a much older tradition?",
              revealContent: nil,
              comparison: nil
            ),
            SolarTheologySection(
              type: .etymology,
              content:
                "In India, the highest priests who represented God were called BRAHMANS. The supreme creator deity was BRAHMA.",
              revealContent:
                "Put an 'A' in front of Brahman... and you get A-BRAHM. The Bible itself tells us Abraham's original name was ABRAM before becoming Abraham.",
              comparison: nil
            ),
            SolarTheologySection(
              type: .comparison,
              content: "The connection goes deeper than the name.",
              revealContent: nil,
              comparison: SymbolComparison(
                tradition1: "Hinduism",
                symbol1: "Brahma (Creator God)",
                tradition2: "Judaism",
                symbol2: "Abraham (Patriarch)",
                connection:
                  "Both are the 'founding fathers' of their traditions. Both names share the same root: BRM/BRHM."
              )
            ),
            SolarTheologySection(
              type: .quote,
              content:
                "\"The Brahman priests in India had a very special river that they would bathe in, called the waters of God. That river was called the Saraswati River. So there you have it—Abraham and Sarah. No, it's Brahman and Saraswati.\"",
              revealContent: "— Jordan Maxwell",
              comparison: nil
            ),
          ],
          sacredGeometry: .seedOfLife,
          revealType: .wordOrigin
        ),

        SolarTheologyLesson(
          id: "st1_2",
          title: "The Star of David",
          subtitle: "A Symbol Older Than Judaism",
          icon: "star.fill",
          accentColor: Color(hex: "#2196F3"),
          sections: [
            SolarTheologySection(
              type: .narration,
              content:
                "The six-pointed star is perhaps the most recognizable symbol of Judaism. But its origins tell a very different story.",
              revealContent: nil,
              comparison: nil
            ),
            SolarTheologySection(
              type: .reveal,
              content:
                "The six-pointed star, the 'Star of David,' was originally a Hindu symbol. It was later adopted by the Buddhists.",
              revealContent:
                "It only became known as the 'Star of David' in the 1890s. Before then, Jews had never heard of any 'Star of David.' There was a hexagram, yes—but it was not called the Star of David.",
              comparison: nil
            ),
            SolarTheologySection(
              type: .comparison,
              content: "The hexagram appears across many traditions:",
              revealContent: nil,
              comparison: SymbolComparison(
                tradition1: "Hinduism",
                symbol1: "Shatkona (Union of Shiva & Shakti)",
                tradition2: "Judaism",
                symbol2: "Magen David (Shield of David)",
                connection:
                  "Both represent the union of opposites—masculine/feminine, fire/water, above/below. Same symbol, different branding."
              )
            ),
            SolarTheologySection(
              type: .quote,
              content:
                "\"Point of fact: there was no King David. He never existed. The Jewish religion is filled with Hindu and Buddhist symbols borrowed thousands of years after their original creation.\"",
              revealContent: "— Jordan Maxwell",
              comparison: nil
            ),
          ],
          sacredGeometry: .hexagram,
          revealType: .symbolMatch
        ),

        SolarTheologyLesson(
          id: "st1_3",
          title: "The Triune Godhead",
          subtitle: "Three Gods, One Pattern",
          icon: "triangle",
          accentColor: Color(hex: "#9C27B0"),
          sections: [
            SolarTheologySection(
              type: .narration,
              content:
                "All religions in the world are based on a triangle—a pyramid. Three points. Three aspects of God. This is no coincidence.",
              revealContent: nil,
              comparison: nil
            ),
            SolarTheologySection(
              type: .comparison,
              content: "The Trinity appears in every major tradition:",
              revealContent: nil,
              comparison: SymbolComparison(
                tradition1: "Hinduism",
                symbol1: "Brahma, Vishnu, Shiva",
                tradition2: "Christianity",
                symbol2: "Father, Son, Holy Spirit",
                connection:
                  "Creator, Preserver, Destroyer — the same cosmic functions under different names."
              )
            ),
            SolarTheologySection(
              type: .comparison,
              content: "Egypt had the same pattern thousands of years earlier:",
              revealContent: nil,
              comparison: SymbolComparison(
                tradition1: "Egypt",
                symbol1: "Osiris, Isis, Horus",
                tradition2: "Judaism",
                symbol2: "Abraham, Isaac, Jacob",
                connection:
                  "Father, Mother/Wife, Son — the archetypal family replicated across all traditions."
              )
            ),
            SolarTheologySection(
              type: .quote,
              content:
                "\"A rabbi once told me: 'Was there a Brahma, Vishnu, Shiva?' I said, 'No, those are just metaphor names for gods.' He said, 'Well, that's what Abraham, Isaac, and Jacob is.' There was no Abraham, Isaac, or Jacob.\"",
              revealContent: "— Jordan Maxwell",
              comparison: nil
            ),
          ],
          sacredGeometry: .tetrahedron,
          revealType: .symbolMatch
        ),
      ]
    ),

    // MODULE 2: The Solar Year
    SolarTheologyModule(
      id: "solar_year",
      title: "God's Son / God's Sun",
      subtitle: "The Astrotheological Calendar",
      icon: "sun.max.fill",
      lessons: [
        SolarTheologyLesson(
          id: "st2_1",
          title: "The Annual Journey",
          subtitle: "How the Sun Became the Son",
          icon: "calendar",
          accentColor: Color(hex: "#FFD700"),
          sections: [
            SolarTheologySection(
              type: .narration,
              content:
                "On the first day of summer, the sun is at its highest point in the northern hemisphere. The constellation that begins summer is LEO, the Lion.",
              revealContent: nil,
              comparison: nil
            ),
            SolarTheologySection(
              type: .reveal,
              content: "This is why Disney makes movies about the LION KING.",
              revealContent:
                "God's SUN, the light of the world, our risen savior, is Lord of Lords and King of Kings. Every badge, every state symbol, every institution has a SUN on it. Why? Because it's the only thing that causes life on Earth.",
              comparison: nil
            ),
            SolarTheologySection(
              type: .calendar,
              content:
                "SUMMER → FALL → WINTER → SPRING\n\nThe sun was hot. 90 days later, it's FALLING—losing power. We call it FALL.\n\nIt falls all the way down until December 21st. Now it's DEAD.\n\n90 days later, it's SPRINGING back to life. We call it SPRING.",
              revealContent: nil,
              comparison: nil
            ),
          ],
          sacredGeometry: .flowerOfLife,
          revealType: .calendarCycle
        ),

        SolarTheologyLesson(
          id: "st2_2",
          title: "December 25th",
          subtitle: "The Birth of God's Sun",
          icon: "star.fill",
          accentColor: Color(hex: "#FFD700"),
          sections: [
            SolarTheologySection(
              type: .narration,
              content:
                "On December 21st, the sun hits its lowest point—the winter solstice. Something remarkable happens for the next three days.",
              revealContent: nil,
              comparison: nil
            ),
            SolarTheologySection(
              type: .reveal,
              content:
                "On December 22nd, 23rd, and 24th, the sun does not move. It sits on the same degree for THREE DAYS.",
              revealContent:
                "Anything that has been moving every day and suddenly stops for three days... is DEAD.\n\nGod's SUN was DEAD in its tomb for THREE DAYS.",
              comparison: nil
            ),
            SolarTheologySection(
              type: .reveal,
              content: "Then on DECEMBER 25th, the sun moves one degree northward.",
              revealContent:
                "It has been BORN AGAIN. It's come back to life. It begins its annual journey back to the northern hemisphere.\n\nThis is the REAL meaning of Christmas—the birth of God's SUN.",
              comparison: nil
            ),
            SolarTheologySection(
              type: .quote,
              content: "\"On the third day, He rose again.\" Sound familiar?",
              revealContent: "The entire Christian narrative is an astronomical allegory.",
              comparison: nil
            ),
          ],
          sacredGeometry: .torus,
          revealType: .calendarCycle
        ),

        SolarTheologyLesson(
          id: "st2_3",
          title: "Passover & Easter",
          subtitle: "The Spring Resurrection",
          icon: "arrow.up.right.circle",
          accentColor: Color(hex: "#4CAF50"),
          sections: [
            SolarTheologySection(
              type: .narration,
              content:
                "90 days after December 25th, the sun crosses back over the equator. A great celebration occurs—God's sun is returning!",
              revealContent: nil,
              comparison: nil
            ),
            SolarTheologySection(
              type: .reveal,
              content: "The constellation that represents spring is VIRGO, the Virgin.",
              revealContent:
                "God's SUN is born of a VIRGIN.\n\nVirgo the constellation—not a literal virgin birth, but an astronomical event encoded in mythology.",
              comparison: nil
            ),
            SolarTheologySection(
              type: .comparison,
              content: "Two names for the same event:",
              revealContent: nil,
              comparison: SymbolComparison(
                tradition1: "Judaism",
                symbol1: "PASSOVER",
                tradition2: "Christianity",
                symbol2: "EASTER / RESURRECTION",
                connection:
                  "The sun PASSES OVER the equator. It is RESURRECTED from its winter death. Same astronomical event, different religious branding."
              )
            ),
            SolarTheologySection(
              type: .quote,
              content:
                "\"When someone dies, we say they 'passed.' Grandmother passed last night. Passed over. Passed away. Passed on. The SUN was dead in winter, but it has PASSED OVER the equator.\"",
              revealContent: "— Jordan Maxwell",
              comparison: nil
            ),
          ],
          sacredGeometry: .goldenSpiral,
          revealType: .calendarCycle
        ),

        SolarTheologyLesson(
          id: "st2_4",
          title: "The 12 Apostles",
          subtitle: "Following the Zodiac",
          icon: "circle.grid.3x3",
          accentColor: Color(hex: "#E91E63"),
          sections: [
            SolarTheologySection(
              type: .narration,
              content:
                "Jesus said, 'I am the way, the truth, and the light. No man comes to the Father except through me.'",
              revealContent: nil,
              comparison: nil
            ),
            SolarTheologySection(
              type: .reveal,
              content: "What is the TRUTH and the LIGHT?",
              revealContent:
                "You can do anything in the dark—nobody sees you.\n\nBut anything done at 12:00 noon, in the SUN... everybody sees you.\n\nThat's the truth and the light. The SUN reveals all.",
              comparison: nil
            ),
            SolarTheologySection(
              type: .reveal,
              content: "Jesus had 12 apostles who followed him.",
              revealContent:
                "The SUN has 12 followers:\n\n• 12 signs of the zodiac\n• 12 months of the year\n• 12 hours of day, 12 hours of night\n\nThe apostles are the zodiac signs that follow the sun through the heavens.",
              comparison: nil
            ),
            SolarTheologySection(
              type: .quote,
              content:
                "\"Once you understand that Jesus did not exist as a man—there was no such man as Jesus—it's a story. A metaphor. A symbolic story. Jesus represents the SUN, the light of the world.\"",
              revealContent: "— Jordan Maxwell",
              comparison: nil
            ),
          ],
          sacredGeometry: .metatronsCube,
          revealType: .calendarCycle
        ),
      ]
    ),

    // MODULE 3: Moon Worship & Islam
    SolarTheologyModule(
      id: "moon_worship",
      title: "Sin & The Moon God",
      subtitle: "The Hidden Origins of Islam",
      icon: "moon.fill",
      lessons: [
        SolarTheologyLesson(
          id: "st3_1",
          title: "Mount Sinai Decoded",
          subtitle: "The Moon God's Mountain",
          icon: "mountain.2.fill",
          accentColor: Color(hex: "#607D8B"),
          sections: [
            SolarTheologySection(
              type: .narration,
              content:
                "Moses received the Ten Commandments on Mount Sinai. But what does 'Sinai' actually mean?",
              revealContent: nil,
              comparison: nil
            ),
            SolarTheologySection(
              type: .etymology,
              content:
                "In ancient Arabic, the MOON GOD was named SIN (S-I-N). Look it up in any dictionary—it was the name of the moon deity.",
              revealContent:
                "The people in Egypt and Sinai would see the moon rise from behind the mountains every night. Obviously, the moon must LIVE in the mountain.",
              comparison: nil
            ),
            SolarTheologySection(
              type: .reveal,
              content: "In ancient Arabic, a MOUNTAIN was called 'AI.'",
              revealContent:
                "SIN (moon god) + AI (mountain) = SINAI\n\nMount Sinai = The Moon God's Mountain\n\nThe 'holy mountain' is a temple to lunar worship.",
              comparison: nil
            ),
            SolarTheologySection(
              type: .quote,
              content:
                "\"There's nothing holy in Jerusalem. The only thing holy in Israel are the stories that come out of it—they're full of HOLES.\"",
              revealContent: "— Jordan Maxwell",
              comparison: nil
            ),
          ],
          sacredGeometry: .vesicaPiscis,
          revealType: .wordOrigin
        ),

        SolarTheologyLesson(
          id: "st3_2",
          title: "Islam Before Muhammad",
          subtitle: "The Religion That Already Existed",
          icon: "moon.stars.fill",
          accentColor: Color(hex: "#4CAF50"),
          sections: [
            SolarTheologySection(
              type: .narration,
              content:
                "The religion we call Islam was already fully developed and in existence centuries before any Muhammad would have lived.",
              revealContent: nil,
              comparison: nil
            ),
            SolarTheologySection(
              type: .reveal,
              content:
                "The whole Islamic religion was already in place—it was worship of the planet SATURN and the MOON.",
              revealContent:
                "This is why:\n\n• All Islamic flags are GREEN (Venus's color)\n• Mosques display a CRESCENT and STAR\n• The star = Venus (morning star)\n• The crescent = Venus rising, always appearing as a crescent",
              comparison: nil
            ),
            SolarTheologySection(
              type: .comparison,
              content: "The symbols reveal the truth:",
              revealContent: nil,
              comparison: SymbolComparison(
                tradition1: "Ancient Venus Worship",
                symbol1: "Crescent + Morning Star",
                tradition2: "Islam",
                symbol2: "Crescent Moon + Star",
                connection:
                  "Same celestial symbols, rebranded as 'Islamic.' The worship predates the religion by millennia."
              )
            ),
            SolarTheologySection(
              type: .quote,
              content:
                "\"I got news for you—Muhammad never existed. There was no such man named Muhammad. As far as I'm concerned, no such man ever existed.\"",
              revealContent: "— Jordan Maxwell",
              comparison: nil
            ),
          ],
          sacredGeometry: .infinityLoop,
          revealType: .symbolMatch
        ),

        SolarTheologyLesson(
          id: "st3_3",
          title: "Holy Days After Sundown",
          subtitle: "Why Judaism is Moon Worship",
          icon: "sunset.fill",
          accentColor: Color(hex: "#3F51B5"),
          sections: [
            SolarTheologySection(
              type: .narration,
              content: "Have you ever wondered why Jewish holy days begin at sundown, not sunrise?",
              revealContent: nil,
              comparison: nil
            ),
            SolarTheologySection(
              type: .reveal,
              content: "The Hebrews still have their holy days AFTER SUNDOWN.",
              revealContent:
                "Why? Because that's when the MOON comes out.\n\nJudaism at its core is MOON WORSHIP—lunar calendar, lunar holidays, celebrations when the moon appears.",
              comparison: nil
            ),
            SolarTheologySection(
              type: .narration,
              content:
                "This is why the Jewish calendar is lunar-based, why the High Holy Days shift each year, and why Shabbat begins at sunset Friday.",
              revealContent: nil,
              comparison: nil
            ),
          ],
          sacredGeometry: .octahedron,
          revealType: .calendarCycle
        ),
      ]
    ),

    // MODULE 4: Rome Never Fell
    SolarTheologyModule(
      id: "rome_vatican",
      title: "All Roads Lead to Rome",
      subtitle: "The Empire That Never Ended",
      icon: "building.columns.fill",
      lessons: [
        SolarTheologyLesson(
          id: "st4_1",
          title: "Rome Morphed Into Vatican",
          subtitle: "2,300 Years of Domination",
          icon: "crown.fill",
          accentColor: Color(hex: "#B71C1C"),
          sections: [
            SolarTheologySection(
              type: .narration,
              content: "Rome hasn't gone anywhere. It just changed its clothes.",
              revealContent: nil,
              comparison: nil
            ),
            SolarTheologySection(
              type: .reveal,
              content: "For 2,300 years, Rome has dominated Europe.",
              revealContent:
                "First under the CAESARS (700 years)\nThen under the VATICAN (1,600 years)\n\nIt's still Caesar. He's still 'God.' And everyone still crawls on their knees.",
              comparison: nil
            ),
            SolarTheologySection(
              type: .reveal,
              content:
                "Europe dominated the entire Earth—Portuguese, Spanish, British, French, Germans.",
              revealContent:
                "The whole world has been dominated by Europe.\nEurope has been dominated by Rome.\n\nALL ROADS LEAD TO ROME.",
              comparison: nil
            ),
            SolarTheologySection(
              type: .narration,
              content:
                "All the drug cartels in South America, the Nazis in Brazil and Argentina—all these countries are very Catholic, very Roman. Paraguay and Uruguay were founded by the Jesuits.",
              revealContent: nil,
              comparison: nil
            ),
          ],
          sacredGeometry: .dodecahedron,
          revealType: .timelineEvent
        ),

        SolarTheologyLesson(
          id: "st4_2",
          title: "The Vatican Spy Agency",
          subtitle: "1,600 Years of Intelligence",
          icon: "eye.fill",
          accentColor: Color(hex: "#212121"),
          sections: [
            SolarTheologySection(
              type: .narration,
              content: "The best spy agency on Earth is not the CIA, MI6, or Mossad.",
              revealContent: nil,
              comparison: nil
            ),
            SolarTheologySection(
              type: .reveal,
              content: "The best intelligence agency on Earth is the VATICAN.",
              revealContent:
                "They're far superior to MI5, MI6, NSA, or CIA.\n\nWhy? They've been doing it for 1,600 YEARS.\n\nYou just came into existence 200 years ago. They've had 16 centuries of practice.",
              comparison: nil
            ),
            SolarTheologySection(
              type: .narration,
              content:
                "The CIA was originally called the OSS. The Vatican actually helped create it during World War II, sharing their intelligence methodologies.",
              revealContent: nil,
              comparison: nil
            ),
            SolarTheologySection(
              type: .quote,
              content:
                "\"If you want to know what's going on on Earth today, you better look at Rome. I hear all this stuff about 'the Jews doing this'—no, it's not the Jews as much as the guys who've been in power for 2,300 years.\"",
              revealContent: "— Jordan Maxwell",
              comparison: nil
            ),
          ],
          sacredGeometry: .sriYantra,
          revealType: .mapConnection
        ),

        SolarTheologyLesson(
          id: "st4_3",
          title: "The Phoenician Architects",
          subtitle: "Cain's Children Built This System",
          icon: "building.2.fill",
          accentColor: Color(hex: "#795548"),
          sections: [
            SolarTheologySection(
              type: .narration,
              content:
                "The Roman system is based on an ancient Venetian-Canaanite system that predates Rome itself.",
              revealContent: nil,
              comparison: nil
            ),
            SolarTheologySection(
              type: .reveal,
              content: "The Phoenician Canaanites were the architects of our entire civilization.",
              revealContent:
                "They designed:\n• Our political system\n• Our judicial system\n• Our monetary system\n\nIt's the story of Cain and Abel—the betrayal of humanity by these ancient people.",
              comparison: nil
            ),
            SolarTheologySection(
              type: .comparison,
              content: "The symbols persist:",
              revealContent: nil,
              comparison: SymbolComparison(
                tradition1: "Knights Templar",
                symbol1: "Skull & Crossbones (Jolly Roger)",
                tradition2: "Yale University",
                symbol2: "Skull & Bones Society",
                connection:
                  "Same secret society, same symbols. The black square represents Saturn. The pirates of the Caribbean were Templars."
              )
            ),
          ],
          sacredGeometry: .treeOfLife,
          revealType: .symbolMatch
        ),
      ]
    ),

    // MODULE 5: Moses Decoded
    SolarTheologyModule(
      id: "moses_decoded",
      title: "Thoth-Moses",
      subtitle: "The Pharaoh Behind the Prophet",
      icon: "scroll.fill",
      lessons: [
        SolarTheologyLesson(
          id: "st5_1",
          title: "The Son of Thought",
          subtitle: "Egyptian Etymology of Moses",
          icon: "brain.head.profile",
          accentColor: Color(hex: "#00BCD4"),
          sections: [
            SolarTheologySection(
              type: .narration,
              content:
                "There probably was no Moses—at least not as described in the Bible. But there WAS a line of pharaohs whose name reveals everything.",
              revealContent: nil,
              comparison: nil
            ),
            SolarTheologySection(
              type: .etymology,
              content: "There was a line of pharaohs called THUTMOSE (Thutmose I, II, III).",
              revealContent:
                "THUT = gives us our English word THOUGHT\nMOSE/MOSES = 'son of' in Egyptian\n\nThutmose = 'Son of Thought' = 'The Thought of God'\n\nGod THOUGHT up Thutmose.",
              comparison: nil
            ),
            SolarTheologySection(
              type: .reveal,
              content: "The name 'Moses' simply means 'son of' in Egyptian.",
              revealContent:
                "Ra-mses = Son of Ra\nThut-moses = Son of Thoth\nAh-mose = Son of Ah (the Moon)\n\n'Moses' alone is incomplete—it means 'son of [something].'",
              comparison: nil
            ),
          ],
          sacredGeometry: .merkabaField,
          revealType: .wordOrigin
        ),

        SolarTheologyLesson(
          id: "st5_2",
          title: "Divide & Conquer",
          subtitle: "How Truth Was Fragmented",
          icon: "rectangle.split.2x1.fill",
          accentColor: Color(hex: "#9E9E9E"),
          sections: [
            SolarTheologySection(
              type: .narration,
              content:
                "The Vatican didn't just hide the truth—they systematically fragmented it so no one could reassemble the whole picture.",
              revealContent: nil,
              comparison: nil
            ),
            SolarTheologySection(
              type: .reveal,
              content:
                "When priests were ordered to translate texts, the Vatican gave one monastery HALF the truth, and another monastery the OTHER HALF.",
              revealContent:
                "These monasteries would never meet.\n\nNo one could ever know the WHOLE truth.\n\nDivide and conquer. Keep everybody stupid.\n\nThe guys on top control everything.",
              comparison: nil
            ),
            SolarTheologySection(
              type: .quote,
              content:
                "\"People will finance and support what they WANT to hear. They will NOT finance what they DON'T want to hear. The truth hurts—so they're not going to pay you to tell them the truth.\"",
              revealContent: "— Jordan Maxwell",
              comparison: nil
            ),
          ],
          sacredGeometry: .icosahedron,
          revealType: .timelineEvent
        ),
      ]
    ),

    // MODULE 6: The Financial Matrix
    SolarTheologyModule(
      id: "financial_matrix",
      title: "Pirates of the Caribbean",
      subtitle: "The Banking Conspiracy",
      icon: "dollarsign.circle.fill",
      lessons: [
        SolarTheologyLesson(
          id: "st6_1",
          title: "Federal Reserve & Puerto Rico",
          subtitle: "The Pirates' Home Office",
          icon: "building.columns.circle.fill",
          accentColor: Color(hex: "#4CAF50"),
          sections: [
            SolarTheologySection(
              type: .narration,
              content:
                "Where is the home office of the Federal Reserve and Internal Revenue Service? The answer will surprise you.",
              revealContent: nil,
              comparison: nil
            ),
            SolarTheologySection(
              type: .reveal,
              content: "The home office for the Federal Reserve and IRS is in PUERTO RICO.",
              revealContent:
                "Why Puerto Rico?\n\nPIRATES OF THE CARIBBEAN.\n\nWho were the Pirates? Their flag was the Jolly Roger—skull and crossbones on a BLACK SQUARE.",
              comparison: nil
            ),
            SolarTheologySection(
              type: .reveal,
              content: "The black square represents the planet SATURN.",
              revealContent:
                "The skull and bones was the symbol of a secret society called the KNIGHTS TEMPLAR.\n\nThe Templars WERE the pirates.\n\nThey never went away—they became the banking system.",
              comparison: nil
            ),
          ],
          sacredGeometry: .hexahedron,
          revealType: .mapConnection
        ),

        SolarTheologyLesson(
          id: "st6_2",
          title: "Plans for Permanent Peace",
          subtitle: "The 1938 Blueprint",
          icon: "doc.text.fill",
          accentColor: Color(hex: "#F44336"),
          sections: [
            SolarTheologySection(
              type: .narration,
              content:
                "In 1938, Dr. Hans Heyman of Rutgers University published a book that predicted everything.",
              revealContent: nil,
              comparison: nil
            ),
            SolarTheologySection(
              type: .reveal,
              content:
                "The book 'Plans for Permanent Peace' said a world war would start next year in Germany and end around 1945.",
              revealContent:
                "The book contained FOUR FOLD-OUT CHARTS showing:\n\n• How the world would be reorganized after the war\n• A new monetary system\n• A political super-government\n• How all banks would be connected worldwide\n\nAll planned years in advance.",
              comparison: nil
            ),
            SolarTheologySection(
              type: .quote,
              content:
                "\"All the money around the world is being manipulated by the bankers. It's always been controlled by a handful of families.\"",
              revealContent: "— Jordan Maxwell",
              comparison: nil
            ),
          ],
          sacredGeometry: .cosmicEgg,
          revealType: .timelineEvent
        ),

        SolarTheologyLesson(
          id: "st6_3",
          title: "Why Go to Court?",
          subtitle: "The Game They Play",
          icon: "sportscourt.fill",
          accentColor: Color(hex: "#FF9800"),
          sections: [
            SolarTheologySection(
              type: .narration,
              content: "Why do you go to COURT? Think about it.",
              revealContent: nil,
              comparison: nil
            ),
            SolarTheologySection(
              type: .reveal,
              content: "You play basketball on a COURT. You play tennis on a COURT.",
              revealContent:
                "A court 'hearing' says the event starts at a certain time.\n\nIt's nothing but a big GAME. A show.\n\nThe legal system is theater—and you're the unwitting participant.",
              comparison: nil
            ),
            SolarTheologySection(
              type: .quote,
              content:
                "\"The world today is crawling with occult symbols, words, terms, numbers, numerology—but it's over the head of 99% of people. They have no idea what's going on. None. Nobody ever tells them anything.\"",
              revealContent: "— Jordan Maxwell",
              comparison: nil
            ),
          ],
          sacredGeometry: .yantra64,
          revealType: .wordOrigin
        ),
      ]
    ),

    // MARK: - Module 7: The God Show

    SolarTheologyModule(
      id: "st_module_7",
      title: "The God Show",
      subtitle: "Astro-Theology Decoded",
      icon: "theatermasks.fill",
      lessons: [
        SolarTheologyLesson(
          id: "st7_1",
          title: "HORUS → HOURS",
          subtitle: "Time Itself Is Sun Worship",
          icon: "clock.fill",
          accentColor: Color(hex: "#FFD700"),
          sections: [
            SolarTheologySection(
              type: .narration,
              content:
                "The Egyptian sun god was named HORUS. His life was divided into 12 parts as he walked across the sky.",
              revealContent: nil,
              comparison: nil
            ),
            SolarTheologySection(
              type: .etymology,
              content: "H-O-R-U-S",
              revealContent:
                "Swap the R and U:\n\nH-O-R-U-S → H-O-U-R-S\n\nThe 12 HOURS of daylight are the 12 steps of HORUS walking across heaven.\n\nEvery time you check the time, you're tracking the sun god.",
              comparison: nil
            ),
            SolarTheologySection(
              type: .reveal,
              content: "This is why we have 12-step programs everywhere.",
              revealContent:
                "• 12 grades in school (1st through 12th)\n• 12 jurors in court\n• 12-step recovery programs\n• 12 hours on the clock\n\nAll honoring the 12 steps of Horus.",
              comparison: nil
            ),
          ],
          sacredGeometry: .flowerOfLife,
          revealType: .wordOrigin
        ),

        SolarTheologyLesson(
          id: "st7_2",
          title: "HORIZON",
          subtitle: "Horus Rising",
          icon: "sunrise.fill",
          accentColor: Color(hex: "#FF6B35"),
          sections: [
            SolarTheologySection(
              type: .narration,
              content: "Every morning, you watch the sun come up. Where does it appear?",
              revealContent: nil,
              comparison: nil
            ),
            SolarTheologySection(
              type: .etymology,
              content: "HORIZON",
              revealContent:
                "HORUS + RISING = HORIZON\n\nThe HORIZON is literally 'Horus Rising.'\n\nEvery sunrise, you witness the Egyptian sun god being born again.",
              comparison: nil
            ),
            SolarTheologySection(
              type: .quote,
              content:
                "\"Horus is risen! Even today when the sun comes up, we call it the sun rising on the HORIZON—Horus Rising.\"",
              revealContent: "— Jordan Maxwell",
              comparison: nil
            ),
          ],
          sacredGeometry: .vesicaPiscis,
          revealType: .wordOrigin
        ),

        SolarTheologyLesson(
          id: "st7_3",
          title: "SET → SUNSET",
          subtitle: "The Prince of Darkness",
          icon: "sunset.fill",
          accentColor: Color(hex: "#8B0000"),
          sections: [
            SolarTheologySection(
              type: .narration,
              content: "In Egyptian mythology, Horus had an evil brother—the god of darkness.",
              revealContent: nil,
              comparison: nil
            ),
            SolarTheologySection(
              type: .etymology,
              content: "SET / SETH",
              revealContent:
                "The Egyptian god of darkness was named SET (or SETH).\n\nWhen God's sun dies each evening, the world is left in the hands of the prince of darkness.\n\nSUN + SET = SUNSET\n\nEvery evening at SUNSET, Set takes over.",
              comparison: nil
            ),
            SolarTheologySection(
              type: .reveal,
              content: "This is why evil things happen at night.",
              revealContent:
                "Robberies, crimes, dark deeds—all called 'works of darkness.'\n\nThe night is ruled by SET, the prince of darkness.\n\nThe battle between light and dark is the oldest story ever told.",
              comparison: nil
            ),
          ],
          sacredGeometry: .seedOfLife,
          revealType: .wordOrigin
        ),

        SolarTheologyLesson(
          id: "st7_4",
          title: "GOD & DEVIL",
          subtitle: "Hidden in Plain Sight",
          icon: "light.max",
          accentColor: Color(hex: "#FFFFFF"),
          sections: [
            SolarTheologySection(
              type: .narration,
              content: "The words GOD and DEVIL contain their own definitions.",
              revealContent: nil,
              comparison: nil
            ),
            SolarTheologySection(
              type: .etymology,
              content: "G-O-O-D → G-O-D",
              revealContent:
                "Take an 'O' out of GOOD:\n\nGOOD → GOD\n\nGod IS good. The word tells you.",
              comparison: nil
            ),
            SolarTheologySection(
              type: .etymology,
              content: "E-V-I-L → D-EVIL",
              revealContent:
                "Put a 'D' in front of EVIL:\n\nEVIL → DEVIL\n\nThe devil IS evil. The word tells you.\n\nLight = Good = God\nDark = Evil = Devil",
              comparison: nil
            ),
          ],
          sacredGeometry: .metatronsCube,
          revealType: .wordOrigin
        ),

        SolarTheologyLesson(
          id: "st7_5",
          title: "AMEN",
          subtitle: "The Egyptian Sun God",
          icon: "hands.clap.fill",
          accentColor: Color(hex: "#DAA520"),
          sections: [
            SolarTheologySection(
              type: .narration,
              content: "At the end of every Christian prayer, people say 'Amen.' But why?",
              revealContent: nil,
              comparison: nil
            ),
            SolarTheologySection(
              type: .etymology,
              content: "AMEN / AMUN-RA",
              revealContent:
                "AMEN = AMUN (also spelled AMON, AMEN)\n\nAMUN-RA was the Egyptian sun god—'King of the Gods.'\n\nChristians say: 'You can't talk to God directly, only through his Son.'\n\nSo they end prayers with AMEN—invoking the sun god to deliver their prayer.",
              comparison: nil
            ),
            SolarTheologySection(
              type: .quote,
              content:
                "\"Christians pray to God's son, the light of the world. And at the end of their prayer, they say AMEN—because they're sending their prayer to God through God's son.\"",
              revealContent: "— Jordan Maxwell",
              comparison: nil
            ),
          ],
          sacredGeometry: .sriYantra,
          revealType: .wordOrigin
        ),

        SolarTheologyLesson(
          id: "st7_6",
          title: "SOLACE",
          subtitle: "Comfort from the Sun",
          icon: "sun.max.fill",
          accentColor: Color(hex: "#FFA500"),
          sections: [
            SolarTheologySection(
              type: .narration,
              content:
                "When you're troubled, you seek comfort. There's a word for this peace of mind.",
              revealContent: nil,
              comparison: nil
            ),
            SolarTheologySection(
              type: .etymology,
              content: "SOLACE",
              revealContent:
                "SOLACE comes from SOLAR (the sun).\n\nS-O-L-A-C-E ← S-O-L-A-R\n\nThe comfort and peace that God's sun brings to your life is called SOLACE.\n\nThe sun literally gives you comfort.",
              comparison: nil
            ),
            SolarTheologySection(
              type: .reveal,
              content: "Related words from SOL (sun):",
              revealContent:
                "• SOLAR - of the sun\n• SOLACE - comfort from the sun\n• SOLSTICE - sun standing still\n• SOUL - your inner sun/light\n• SOLE - the only one (like our sun)",
              comparison: nil
            ),
          ],
          sacredGeometry: .treeOfLife,
          revealType: .wordOrigin
        ),

        SolarTheologyLesson(
          id: "st7_7",
          title: "CORONA",
          subtitle: "The Crown of Thorns",
          icon: "crown.fill",
          accentColor: Color(hex: "#FFD700"),
          sections: [
            SolarTheologySection(
              type: .narration,
              content:
                "Jesus died wearing a 'crown of thorns.' But what is a crown of thorns really?",
              revealContent: nil,
              comparison: nil
            ),
            SolarTheologySection(
              type: .etymology,
              content: "CORONA = Crown",
              revealContent:
                "When a child draws the sun, they draw a circle with SPOKES coming out.\n\nThose spokes are called the CORONA—the sun's rays.\n\nThe 'crown of thorns' = the SUN RAYS.\n\nJesus (God's sun) died wearing the corona—the sunburst.",
              comparison: nil
            ),
            SolarTheologySection(
              type: .reveal,
              content: "Look at the Statue of Liberty.",
              revealContent:
                "She wears a CROWN OF THORNS on her head.\n\nThose are SUN RAYS—the corona.\n\nThis is why when kings are crowned, it's called a CORONATION.\n\nCORONA = crown = sun rays",
              comparison: nil
            ),
          ],
          sacredGeometry: .flowerOfLife,
          revealType: .symbolMatch
        ),

        SolarTheologyLesson(
          id: "st7_8",
          title: "GOLGOTHA",
          subtitle: "Place of the Skull",
          icon: "brain.head.profile",
          accentColor: Color(hex: "#696969"),
          sections: [
            SolarTheologySection(
              type: .narration,
              content: "Jesus was crucified at a place called Golgotha. What does that word mean?",
              revealContent: nil,
              comparison: nil
            ),
            SolarTheologySection(
              type: .etymology,
              content: "GOLGOTHA = Skull Place",
              revealContent:
                "GOLGOTHA literally means 'Place of the Skull.'\n\nWhere do you put TRUTH to death?\n\nIN YOUR HEAD. In your skull.\n\nWhen you reject truth, you crucify it in the place of the skull—somewhere between your ears.",
              comparison: nil
            ),
            SolarTheologySection(
              type: .reveal,
              content: "The Two Thieves on either side of Jesus:",
              revealContent:
                "LEFT THIEF: Regret for the past\nRIGHT THIEF: Fear of the future\n\nTruth (the present moment) is always crucified between regret and fear.\n\nThis happens in YOUR MIND—Golgotha, the skull place.",
              comparison: nil
            ),
          ],
          sacredGeometry: .hexahedron,
          revealType: .wordOrigin
        ),

        SolarTheologyLesson(
          id: "st7_9",
          title: "The Trinity Decoded",
          subtitle: "Three Stages of the Sun",
          icon: "triangle.fill",
          accentColor: Color(hex: "#9B59B6"),
          sections: [
            SolarTheologySection(
              type: .narration,
              content:
                "The Trinity is said to be a 'great mystery.' But it's not mysterious at all.",
              revealContent: nil,
              comparison: nil
            ),
            SolarTheologySection(
              type: .reveal,
              content: "The Trinity is the THREE STAGES of the sun each day:",
              revealContent:
                "☀️ MORNING: The newborn child (Horus the Younger)\n\n☀️ NOON: The mature, full-grown god (Most High)\n\n☀️ EVENING: The old man, dying, returning to the Father\n\nThree divine persons. One God. The SUN.",
              comparison: nil
            ),
            SolarTheologySection(
              type: .etymology,
              content: "HIGH NOON",
              revealContent:
                "Why is it called 'HIGH noon'?\n\nBecause the sun is at its HIGHEST point.\n\nThe 'Most High God' = the sun at noon.\n\nIt doesn't get any higher than 12 o'clock.",
              comparison: nil
            ),
          ],
          sacredGeometry: .sriYantra,
          revealType: .calendarCycle
        ),

        SolarTheologyLesson(
          id: "st7_10",
          title: "12 in the Temple",
          subtitle: "The Sun at Noon",
          icon: "building.columns.fill",
          accentColor: Color(hex: "#4169E1"),
          sections: [
            SolarTheologySection(
              type: .narration,
              content:
                "The Bible says Jesus was teaching in the temple at age 12. But is that what it really means?",
              revealContent: nil,
              comparison: nil
            ),
            SolarTheologySection(
              type: .reveal,
              content: "The sky is God's heavenly temple.",
              revealContent:
                "The sun at 12 NOON is in 'the temple' (heaven) teaching wisdom.\n\nNot 12 YEARS old.\n12 O'CLOCK.\n\nThe sun at noon—the Most High—illuminating all truth.\n\nAt HIGH NOON, no shadow is cast. All is revealed.",
              comparison: nil
            ),
            SolarTheologySection(
              type: .quote,
              content:
                "\"If you can't learn anything at 12 noon, then you're really in the dark.\"",
              revealContent: "— Jordan Maxwell",
              comparison: nil
            ),
          ],
          sacredGeometry: .metatronsCube,
          revealType: .calendarCycle
        ),

        SolarTheologyLesson(
          id: "st7_11",
          title: "4 Gospels = 4 Seasons",
          subtitle: "Matthew, Mark, Luke, John",
          icon: "leaf.fill",
          accentColor: Color(hex: "#228B22"),
          sections: [
            SolarTheologySection(
              type: .narration,
              content: "Why are there exactly FOUR gospels in the New Testament?",
              revealContent: nil,
              comparison: nil
            ),
            SolarTheologySection(
              type: .reveal,
              content: "The early Church Fathers admitted this openly.",
              revealContent:
                "The FOUR GOSPELS represent the FOUR SEASONS:\n\n🌸 Matthew = Spring\n☀️ Mark = Summer\n🍂 Luke = Autumn\n❄️ John = Winter\n\nThe complete story of God's sun through the year.",
              comparison: nil
            ),
            SolarTheologySection(
              type: .reveal,
              content: "The Last Supper painting reveals it all:",
              revealContent:
                "Look at Da Vinci's Last Supper:\n\n• Jesus (the sun) in the CENTER\n• 12 apostles = 12 months/zodiac signs\n• Grouped in FOUR SETS OF THREE\n\n4 groups × 3 apostles = 4 seasons × 3 months\n\nThe whole solar year, painted on a wall.",
              comparison: nil
            ),
          ],
          sacredGeometry: .treeOfLife,
          revealType: .calendarCycle
        ),

        SolarTheologyLesson(
          id: "st7_12",
          title: "THEATER / THEOLOGY",
          subtitle: "The God Show",
          icon: "theatermasks.fill",
          accentColor: Color(hex: "#E74C3C"),
          sections: [
            SolarTheologySection(
              type: .narration,
              content: "What do THEATER and THEOLOGY have in common?",
              revealContent: nil,
              comparison: nil
            ),
            SolarTheologySection(
              type: .etymology,
              content: "THEO = God (Greek)",
              revealContent:
                "THEO (θεός) = God in Greek\n\nTHEO + LOGY = Study of God = THEOLOGY\n\nTHEA + TER = The God Show = THEATER\n\nThe ancient Greeks had open-air theaters where they performed plays teaching moral lessons about the gods.",
              comparison: nil
            ),
            SolarTheologySection(
              type: .reveal,
              content: "A church is just a theater.",
              revealContent:
                "You go in.\nYou pay money.\nYou get a show.\nYou feel good about yourself.\nYou leave.\n\nIt's THE GOD SHOW.\n\nEntertainment dressed as salvation.",
              comparison: nil
            ),
            SolarTheologySection(
              type: .quote,
              content:
                "\"I want to get past the God Show and get down to the actual facts of how our world religions came about.\"",
              revealContent: "— Jordan Maxwell",
              comparison: nil
            ),
          ],
          sacredGeometry: .cosmicEgg,
          revealType: .wordOrigin
        ),
      ]
    ),
  ]
}

// MARK: - Supporting Types

struct SolarTheologyCourse {
  let id: String
  let title: String
  let subtitle: String
  let description: String
  let instructor: String
  let modules: [SolarTheologyModule]
}

struct SolarTheologyModule: Identifiable {
  let id: String
  let title: String
  let subtitle: String
  let icon: String
  let lessons: [SolarTheologyLesson]
}
