// TarotArcanaCourse.swift
import SwiftUI

enum TarotArcanaCourse {
  static let course = AlexandriaCourse(
    id: "tarot_arcana", title: "The Arcana Within",
    subtitle: "The Soul's Map They Called the Devil's Cards",
    icon: "suit.spade.fill", colorHex: "#8E44AD", tier: 3, isPremium: false, isUltraPremium: false,
    modules: [
      ACModule(
        id: "ta1", number: 1, title: "Not Fortune-Telling — Soul-Reading",
        subtitle: "The consciousness map hidden in 78 cards", icon: "rectangle.stack.fill",
        lessons: [
          ACLesson(
            id: "ta1_1", title: "Before Religion Feared It",
            content: """
              **For centuries, religious dogma did the work of the devil — by making you fear the Tarot.**

              But Tarot was never fortune-telling. It was **knowledge.** It was **harmony.** It was the **language of the soul.**

              Long before the religions we know today existed, Tarot symbols already spoke in ancient temples.

              **The Fool** — who starts the journey.
              **The Magician** — who awakens his power.
              **The High Priestess** — who guards the veil of mystery.

              Every card is not a prediction of the future, but a **reflection of the deeper present.** A map of consciousness that guides the human being on their journey back to themselves.

              Tarot does not predict. It **reveals.**
              It does not dominate. It **illuminates.**

              Every Arcana is a stepping stone on the path of awakening. From The Fool (0) to The World (21), the soul goes through trials, shadows, and rebirths. There is no condemnation or punishment — just learning.

              **The Fool's Journey — The 22 Major Arcana as consciousness stages:**

              0 → The Fool = Pure potential, the leap of faith
              I → The Magician = Discovering your creative power
              II → The High Priestess = Accessing intuition and hidden knowledge
              III → The Empress = The divine feminine, abundance, creation
              ...
              XII → The Hanged Man = Surrender, seeing from a new perspective
              XIII → Death = TRANSFORMATION (not ending)
              ...
              XXI → The World = Integration, completion, wholeness

              **That's why Tarot belongs neither to heaven nor to hell. It belongs to the SOUL and its eternal quest to remember who it is.**

              🔥 **The fear that dogma sowed was the most effective way to keep humans away from their inner truth. Tarot is speaking again — into the hands of those who listen with respect and consciousness.**
              """,
            keyInsight:
              "The Tarot is a 22-stage map of consciousness — from ignorance (The Fool) to integration (The World). It doesn't tell your future — it shows your present state of awakening.",
            practice:
              "Look up the Major Arcana. Which card resonates with where you are RIGHT NOW in your life? That's your current lesson."
          )
        ])
    ],
    sources: [
      "Antoine Court de Gébelin — first to link Tarot to ancient Egyptian wisdom (1781)",
      "The Rider-Waite-Smith Tarot — symbolism analysis",
      "Alejandro Jodorowsky, \"The Way of Tarot\"",
      "Joseph Campbell — Hero's Journey parallels in Major Arcana",
      "Pre-Christian divination traditions across cultures",
    ],
    dragonComment:
      "78 cards. 22 stages of the soul's journey. They made you think it was the devil's work so you'd never look at the map. The map of YOUR consciousness. 🐉"
  )
}
