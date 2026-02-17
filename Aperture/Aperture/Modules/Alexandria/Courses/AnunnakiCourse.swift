// AnunnakiCourse.swift
import SwiftUI

enum AnunnakiCourse {
  static let course = AlexandriaCourse(
    id: "anunnaki", title: "The Anunnaki — Before the Beginning",
    subtitle: "Gods from Heaven, Remembered on Tablets",
    icon: "sparkles", colorHex: "#C0A060", tier: 3, isPremium: false, isUltraPremium: false,
    modules: [
      ACModule(
        id: "an1", number: 1, title: "The Timeline They Buried in Clay",
        subtitle: "450,000 years of history on stone tablets", icon: "clock.arrow.circlepath",
        lessons: [
          ACLesson(
            id: "an1_1", title: "Before Genesis, There Was Sumer",
            content: """
              **The Anunnaki. "Those who from heaven came to earth."**

              Remembered on Sumerian clay tablets — the oldest written records in human history, predating the Bible by at least 2,000 years — as the creators of humanity.

              **The Timeline:**

              **~450,000 years ago** — According to Sumerian texts, beings from Nibiru (a planet with a 3,600-year orbit) arrive on Earth. They are the Anunnaki — led by Anu, with his sons Enlil and Enki.

              **~400,000 years ago** — Gold mining operations begin in southeastern Africa. The Anunnaki need gold — not for jewelry, but to repair the deteriorating atmosphere of their world, Nibiru.

              **~300,000 years ago** — Enki, the scientist, proposes creating a new being by combining Anunnaki consciousness with existing hominids on Earth — a being that could think, feel, and grow.

              **~250,000 years ago** — After many experiments (documented in detail on the tablets), Enki and the birth goddess Ninhursag create **the Adamu** — the first human. But here's what matters: the texts say Enki didn't just create a tool. He gave humanity **a spark of the divine** — self-awareness, creativity, and the capacity for spiritual growth.

              **~100,000 years ago** — Humans develop rapidly. Knowledge is shared freely. Civilization accelerates.

              **~13,000 years ago** — The Anunnaki know a catastrophic flood is coming. Enlil decides to let events unfold. Enki secretly warns one human (Ziusudra/Noah/Utnapishtim) to build a vessel — because he valued the consciousness he helped create.

              **Post-flood** — The Anunnaki depart, leaving humanity with tools and knowledge to rebuild. Agriculture, astronomy, mathematics, writing — all "suddenly" appear in Sumer.

              🔥 **The key isn't WHO created us. It's WHAT was placed inside us. Every human carries the same divine spark — no hierarchy, no chosen bloodlines, no master race. The spark is universal. Your awakening is your birthright — not because of your DNA, but because of your consciousness.**
              """,
            keyInsight:
              "Sumerian texts predate the Bible by 2,000+ years and describe humanity's creation with a divine spark intentionally embedded — shared equally by all people, not reserved for any bloodline or chosen group.",
            practice:
              "Read the Epic of Atrahasis (available free online). Notice how many Genesis parallels you find — then ask which came first.",
            interactiveElement: .timeline(events: [
              (
                year: "~450,000 BCE", event: "Anunnaki arrival on Earth",
                significance: "Gold mining operations begin — atmospheric repair for Nibiru"
              ),
              (
                year: "~300,000 BCE", event: "Enki proposes a new creation",
                significance: "A conscious being blending cosmic awareness with earthly form"
              ),
              (
                year: "~250,000 BCE", event: "Creation of the Adamu",
                significance: "First human — carrying a divine spark of self-awareness"
              ),
              (
                year: "~100,000 BCE", event: "Knowledge transfer accelerates",
                significance: "Humans develop rapidly — civilization seeds planted"
              ),
              (
                year: "~13,000 BCE", event: "The Great Flood",
                significance:
                  "Enki secretly saves humanity — values the consciousness he helped create"
              ),
              (
                year: "~4,000 BCE", event: "Sumerian civilization 'appears'",
                significance: "Writing, agriculture, astronomy, mathematics — all at once"
              ),
            ]))
        ])
    ],
    sources: [
      "Zecharia Sitchin, \"The 12th Planet\" (1976)",
      "Samuel Noah Kramer, \"History Begins at Sumer\"",
      "The Epic of Atrahasis — Sumerian creation text", "Enuma Elish — Babylonian creation epic",
      "Archaeological records from Eridu, Ur, and Nippur",
    ],
    dragonComment:
      "The oldest written records on Earth say every human carries the same divine spark. Not some bloodline. Not a chosen few. Everyone. The Bible told you the story 2,000 years later and made it exclusive. 🐉"
  )
}
