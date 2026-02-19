// CrucifixionInitiationCourse.swift
import SwiftUI

struct CrucifixionInitiationCourse {
    static let course = AlexandriaCourse(
        id: "crucifixion_initiation",
        title: "The Crucifixion — Death as Initiation",
        subtitle: "Was it punishment... or ascension ritual?",
        icon: "arrow.up.to.line.alt",
        colorHex: "#E8D44D",
        tier: 3, isPremium: false, isUltraPremium: false,
        modules: [
            ACModule(id: "ci1", number: 1, title: "The Initiation Pattern", subtitle: "The universal death-rebirth mystery", icon: "arrow.triangle.2.circlepath", lessons: [
                ACLesson(id: "ci1_1", title: "Not Execution — Graduation",
                    content: """
**The official story speaks of the crucifixion as brutal punishment. A torture that led to death.**

But the ancient mystery schools invite a different question: **Was it really a death — or an ascension ritual?**

In every ancient tradition, the highest initiation follows the same pattern:

**1. The Symbolic Death** — Renunciation of the ego. Delivery of the body. Surrender of everything the initiate believes themselves to be.

**2. The Descent** — The darkness of emptiness. The descent into the underworld. The dark night of the soul. Confrontation with everything you've avoided.

**3. The Resurrection** — Not simply a physical return, but SPIRITUAL REBIRTH. Victory over matter. Union with the divine. The light that springs after the shadow.

**This is not a Christian invention.** This is the oldest ritual pattern in human consciousness:

| Tradition | The Death | The Descent | The Rebirth |
|-----------|-----------|-------------|-------------|
| **Egypt** | Osiris murdered by Set | Dismembered, scattered | Reassembled, Lord of the Beyond |
| **Greece** | Dionysus torn apart | Scattered through the underworld | Reborn as God of Immortality |
| **Mesoamerica** | Quetzalcoatl self-immolates | Descends to Mictlan (underworld) | Reborn as the Morning Star |
| **Christianity** | Jesus crucified | Three days in the tomb | Resurrection |

Same pattern. Same sequence. Same meaning.

🔥 **The crucifixion wasn't unique. It was the latest expression of the oldest mystery on Earth: you must die to who you think you are to become who you truly are.**
""",
                    keyInsight: "The crucifixion follows the universal initiation pattern (death → descent → rebirth) found in Egypt, Greece, and Mesoamerica. It's not unique — it's archetypal.",
                    practice: "Identify a 'death' you've already experienced — a breakup, a job loss, a crisis. Can you see the initiation pattern in your own life?"
                )
            ])
        ],
        sources: [
            "Ancient Mystery School initiation rites — Egypt, Eleusis, Mithras",
            "Joseph Campbell, \"The Hero With a Thousand Faces\"",
            "Mircea Eliade, \"Rites and Symbols of Initiation\"",
            "Osiris-Dionysus-Quetzalcoatl comparative mythology",
            "Gnostic interpretation of the crucifixion (Nag Hammadi texts)"
        ],
        dragonComment: "Every ancient tradition knew: the ego must die for the spirit to live. They just called it different names. The cross is the same door everyone walks through. 🐉"
    )
}
