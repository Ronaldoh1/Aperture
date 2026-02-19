// GuiltAndPowerCourse.swift
// POR MI CULPA, POR MI GRAN CULPA — Guilt and Power
// ☀️ SunFlow: Reignited

import SwiftUI

struct GuiltAndPowerCourse {
    static let course = AlexandriaCourse(
        id: "guilt_power",
        title: "Por Mi Culpa, Por Mi Gran Culpa",
        subtitle: "Guilt & Power — The Prayer That Broke the Spirit",
        icon: "heart.slash.fill",
        colorHex: "#8B0000",
        tier: 2,
        isPremium: false,
        isUltraPremium: false,
        modules: [
            ACModule(
                id: "gp1", number: 1,
                title: "The Words That Broke Millions",
                subtitle: "A prayer designed to imprison, not liberate",
                icon: "text.quote",
                lessons: [
                    ACLesson(
                        id: "gp1_1",
                        title: "An Act of Collective Self-Incrimination",
                        content: """
**"Por mi culpa, por mi culpa, por mi gran culpa."**

*"Through my fault, through my fault, through my most grievous fault."*

Words repeated in temples and masses for centuries. Beaten into the minds of millions. But did you ever stop to think about what repeating them actually DOES?

This is not a simple prayer. This is an **act of collective self-incrimination.** An imposed confession. A reminder that you are guilty — even without having done anything.

**The Confiteor** — the Catholic prayer of confession — wasn't born as an act of spiritual liberation. It was born as an **instrument of control.**

Because a human being who carries constant guilt becomes:
- **Docile** — guilt makes you submissive
- **Manipulable** — guilty people don't question authority
- **Dependent** — always in debt, always in need of an external Savior
- **Afraid** — guilt breeds fear, fear breeds obedience

Since childhood, Catholics are taught to kneel and say they are **unworthy.** That they were born tainted by an **Original Sin they never committed.** That merely existing makes them guilty.

Repeat over and over that it's all your fault. The mind records it. The heart believes it. The spirit is extinguished.

🔥 **The question is: who benefits from a population living in permanent guilt?**
""",
                        keyInsight: "The Confiteor prayer functions as psychological conditioning — programming guilt to produce obedience and dependency.",
                        practice: "If you grew up Catholic, recall the first time you said this prayer. How old were you? Did anyone explain what you were confessing to?",
                        interactiveElement: .bilingualText(
                            spanish: "Por mi culpa, por mi culpa, por mi gran culpa. Yo confieso ante Dios todopoderoso, y ante ustedes hermanos, que he pecado mucho de pensamiento, palabra, obra y omisión.",
                            english: "Through my fault, through my fault, through my most grievous fault. I confess to almighty God, and to you my brothers and sisters, that I have greatly sinned in my thoughts and in my words, in what I have done and what I have failed to do."
                        )
                    ),
                    ACLesson(
                        id: "gp1_2",
                        title: "Who Created This — And Why",
                        content: """
**The Confiteor has its roots in the early medieval Church, formalized in the 11th century.**

But the concept of ritualized guilt goes deeper. The Council of Orange (529 CE) formalized Original Sin as dogma. The Council of Trent (1545-1563) made the Confiteor mandatory in every Mass.

**The engineering is precise:**

1. **Tell a child they are born guilty** (Original Sin)
2. **Make them confess sins weekly** (Confession/Reconciliation)
3. **Have them repeat "my fault" in every Mass** (The Confiteor)
4. **Offer the ONLY solution: the Church** (Sacraments, priests, obedience)

This is a closed loop. The Church creates the disease (guilt) and sells the only cure (absolution). You can never fully heal because the sin is *original* — it came with your birth. You are guilty for existing.

**The psychological impact is measurable:**
- Catholic guilt is a recognized psychological phenomenon
- Studies show higher rates of shame-based thinking in communities with ritualized confession
- Children who internalize "born sinful" messaging show decreased self-efficacy

**The truth?** The divine spark that dwells in you never asked for sacrifices, shame, or chains of guilt. Divinity does not condemn your existence — it celebrates it.

🔥 **Perhaps the real heresy is not questioning these words — but continuing to repeat them without thinking.**
""",
                        keyInsight: "The Church created a closed loop: manufacture guilt through Original Sin, then sell the cure through sacraments. The disease and the remedy — same institution.",
                        practice: "The path of awakening doesn't begin with guilt — it begins with consciousness. Not with kneeling, but with rising up. What would your spirituality look like without guilt?"
                    )
                ]
            )
        ],
        sources: [
            "Council of Orange (529 CE) — Original Sin dogma",
            "Council of Trent (1545-1563) — Confiteor mandate",
            "History of the Confiteor prayer (Catholic Encyclopedia)",
            "Psychology of religious guilt — peer-reviewed research",
            "Matthew Fox, \"Original Blessing\" — alternative theology"
        ],
        dragonComment: "They made you apologize for being born. Let that sink in. A prayer that begins with 'my fault' before you've done anything is not worship — it's programming. 🐉"
    )
}
