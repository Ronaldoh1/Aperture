// NephilimWatchersCourse.swift
import SwiftUI
struct NephilimWatchersCourse {
    static let course = AlexandriaCourse(
        id: "nephilim_watchers", title: "Nephilim & The Watchers", subtitle: "The Forbidden Union That Changed Everything",
        icon: "figure.stand.line.dotted.figure.stand", colorHex: "#4ECDC4", tier: 3, isPremium: false, isUltraPremium: false,
        modules: [
            ACModule(id: "nw1", number: 1, title: "Those Who Descended", subtitle: "The Book of Enoch's dangerous truth", icon: "arrow.down.to.line", lessons: [
                ACLesson(id: "nw1_1", title: "The Teachers They Called Fallen",
                    content: """
**Since ancient times, myths speak of beings who descended from heaven — the Watchers.**

Custodians of cosmic secrets. Carriers of prohibited knowledge. For some, they are the Anunnaki. For others, fallen angels. Their arrival marked a turning point in human history.

**The Book of Enoch** — removed from the biblical canon by the Council of Laodicea (~363 CE) — tells their story in terrifying detail:

**200 Watchers**, led by Semjaza, descended to Mount Hermon. They made a pact and took human wives. But they didn't just come for love. They came with **knowledge:**

| Watcher | What They Taught |
|---------|-----------------|
| **Azazel** | Metallurgy — swords, shields, jewelry, cosmetics |
| **Semjaza** | Enchantments and root-cutting (herbal medicine/magic) |
| **Armaros** | How to resolve enchantments (counter-magic) |
| **Baraqiel** | Astrology — reading the stars |
| **Kokabiel** | Constellations — mapping the heavens |
| **Tamiel** | Astronomy — the science of celestial bodies |
| **Asradel** | The course of the moon — lunar cycles |

From the union of Watchers and humans were born the **Nephilim** — described as beings of enormous strength and spirit. They represent the meeting point between cosmic knowledge and human experience — not a superior race, but a **bridge** of understanding between two worlds.

**The uncomfortable question:** Was this really a "fall"? Or was it a deliberate knowledge transfer? Were the Watchers rebels — or teachers who believed every being deserves access to wisdom?

🔥 **The old stories are not fantasy — they are fragments of an origin that connects ALL of us with the divine and the cosmic. Not through bloodlines. Through consciousness. The knowledge was given freely, to everyone.**
""",
                    keyInsight: "The Watchers brought specific, catalogued knowledge to humanity (metallurgy, medicine, astronomy). This isn't a myth about 'falling' — it's a record of technology transfer.",
                    practice: "Read 1 Enoch chapters 6-8 (freely available online). Note how specific the knowledge transfer is — names, subjects, technologies. Does this read like mythology or a report?"
                )
            ])
        ],
        sources: ["1 Enoch (Book of the Watchers) chapters 6-36", "Genesis 6:1-4 — the Nephilim reference", "Council of Laodicea (~363 CE) — removal of 1 Enoch from canon", "Michael Heiser, \"Reversing Hermon\"", "Dead Sea Scrolls — Enoch fragments (oldest copies found)"],
        dragonComment: "They removed the Book of Enoch from the Bible because it names specific beings who taught humanity specific skills. A mythology doesn't come with a curriculum. A record does. 🐉"
    )
}
