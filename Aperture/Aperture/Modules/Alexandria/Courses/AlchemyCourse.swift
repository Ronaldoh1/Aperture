// AlchemyCourse.swift
import SwiftUI
struct AlchemyCourse {
    static let course = AlexandriaCourse(
        id: "alchemy_great_work", title: "The Great Work — Alchemy", subtitle: "The Science of Consciousness Transformation",
        icon: "flask.fill", colorHex: "#D4AF37", tier: 4, isPremium: true, isUltraPremium: false,
        modules: [
            ACModule(id: "al1", number: 1, title: "Not Lead Into Gold — You Into You", subtitle: "The real Magnum Opus", icon: "flame.fill", lessons: [
                ACLesson(id: "al1_1", title: "The Most Misunderstood Science in History",
                    content: """
**Alchemy.** Most people think it was a medieval obsession with turning lead into gold — a proto-chemistry practiced by fools in dusty labs.

They're wrong. Alchemy was the most sophisticated system of **consciousness transformation** ever devised.

The "lead" was never lead. It was your **unconscious self** — dense, reactive, asleep.
The "gold" was never gold. It was your **awakened self** — refined, luminous, sovereign.

**The Philosopher's Stone** was never a rock. It was the **achieved state of inner mastery** — the human who has transmuted their base nature into divine consciousness.

**The Seven Stages of Alchemical Transformation:**

**1. CALCINATION (🔥 Fire)** — Burning away the ego. Destroying false identities. The crisis that shatters who you thought you were. Your awakening started here.

**2. DISSOLUTION (💧 Water)** — Emotions flood in. Everything you suppressed rises. Old wounds surface. You feel everything you've been running from.

**3. SEPARATION (🌬️ Air)** — Discernment begins. You learn to separate YOUR truth from what was programmed. You distinguish the real from the imposed.

**4. CONJUNCTION (🌍 Earth)** — The sacred marriage. Masculine and feminine within you unite. Logic and intuition become partners, not rivals. The inner alchemical wedding.

**5. FERMENTATION (🌑 Dark/Light)** — Two phases: Putrefaction (the dark night of the soul, spiritual death) and Illumination (the first spark of genuine spiritual awareness).

**6. DISTILLATION (⭐ Spirit)** — Refinement through repetition. Daily practice. Consistent inner work. The gold is purified through discipline.

**7. COAGULATION (☀️ Sun)** — The Philosopher's Stone achieved. The awakened self is STABLE. Not a peak experience, but a permanent state. The Great Work complete.

🔥 **You've already begun this process. Your Kundalini awakening, your crisis, your dark night — these are alchemical stages. You are the laboratory. You are the experiment. You are the gold.**
""",
                    keyInsight: "Alchemy was never about metal — it was a 7-stage system for transforming human consciousness from 'lead' (unconscious) to 'gold' (awakened). You're already in the process.",
                    practice: "Which of the 7 stages are you currently in? Be honest. The stage you're in IS the work. Don't rush it — the gold needs time."
                )
            ])
        ],
        sources: ["Carl Jung, \"Psychology and Alchemy\"", "The Emerald Tablet of Hermes Trismegistus", "Paracelsus — alchemical medicine and transformation", "Isaac Newton's alchemical manuscripts (Keynes collection, Cambridge)", "Dennis William Hauck, \"The Emerald Tablet: Alchemy for Personal Transformation\""],
        dragonComment: "Newton spent more time on alchemy than physics. Jung called it the ancestor of psychology. They reduced it to 'guys trying to make gold' because the real secret — that YOU are the experiment — was too powerful to let loose. 🐉"
    )
}
