// TwelvePlusOneCourse.swift
import SwiftUI
struct TwelvePlusOneCourse {
    static let course = AlexandriaCourse(
        id: "twelve_plus_one", title: "12 + 1 = 13", subtitle: "The Sacred Code Hidden in Plain Sight",
        icon: "circle.hexagongrid.fill", colorHex: "#00BCD4", tier: 2, isPremium: false, isUltraPremium: false,
        modules: [
            ACModule(id: "tp1", number: 1, title: "The Number They Made You Fear", subtitle: "13 is not bad luck — it's the hidden key", icon: "number", lessons: [
                ACLesson(id: "tp1_1", title: "The Pattern That Keeps Appearing",
                    content: """
**Since time immemorial, the number 12 has marked human life.** 12 months. 12 hours of day. 12 hours of night. 12 signs of the zodiac.

But behind this perfect order, a mystery always appears: **number 13.** Twelve plus one. A sacred code repeated across cultures, religions, and myths.

12 represents the complete cycle — order, fullness, what is contained. But that **plus one** is the center. The divine spark that unites the scattered. This is how the ancient sages understood it:

**In Arthurian Legend:** 12 knights surrounded King Arthur — the 13th, the axis of the Round Table.

**In Greek Mythology:** 12 gods occupied Olympus, with Zeus as the 13th — the center that contained them.

**In Christian Tradition:** Jesus surrounded by his 12 apostles. The 13th. The sun and its 12 houses.

**In the Zodiac:** 12 signs, with the SUN as the 13th — the center around which all revolve.

**In Esoteric Teachings:** 12 + 1 = the Galactic Council. 12 races, 12 consciousnesses, 12 archetypes surrounding the 13th — solar consciousness, the creator's principle.

**In the Tarot:** Card 13 = Death. NOT ending — **TRANSFORMATION.** The card most feared is actually the card of metamorphosis.

**13 is not bad luck.** 13 is the return to origin. The connection between the human and the divine. 12 is the circle — the 1 is the center. Without the center, all 12 are lost. Without the 12, the center does not manifest.

🔥 **Who made 13 "unlucky"? The same people who demonized the serpent, the cross, and the divine feminine. They fear what organizes, what centers, what awakens.**
""",
                    keyInsight: "13 = the center of 12. It appears in every major tradition as the organizing principle — the solar consciousness around which all else revolves. It was demonized to keep you from seeing the pattern.",
                    practice: "Count the 12+1 patterns in your own life: 12 hours + noon. 12 months + the new year. 12 notes + the octave. The pattern is everywhere — start seeing it."
                )
            ])
        ],
        sources: ["Sacred number symbolism across traditions", "Tarot Arcana XIII analysis", "Solar mythology — 12 houses of the zodiac", "Arthurian Round Table symbolism", "Joseph Campbell — mythological number patterns"],
        dragonComment: "12 hours, 12 months, 12 apostles, 12 zodiac signs — and always a 13th at the center. They made you fear the most important number because it's the key to the pattern. 🐉"
    )
}
