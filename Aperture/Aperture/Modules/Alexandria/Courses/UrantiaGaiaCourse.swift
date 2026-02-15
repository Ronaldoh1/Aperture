// UrantiaGaiaCourse.swift
import SwiftUI
struct UrantiaGaiaCourse {
    static let course = AlexandriaCourse(
        id: "urantia_gaia", title: "Urantia & Gaia", subtitle: "Two Names, One Living Earth",
        icon: "globe.europe.africa.fill", colorHex: "#27AE60", tier: 3, isPremium: false, isUltraPremium: false,
        modules: [
            ACModule(id: "ug1", number: 1, title: "A Planet With Two Names", subtitle: "The cosmic record and the sacred spirit", icon: "leaf.fill", lessons: [
                ACLesson(id: "ug1_1", title: "More Than Rock and Water",
                    content: """
**Our planet has two ancient names that reveal two dimensions of its being.**

**Urantia** — This name appeared in channeled writings at the beginning of the 20th century, in the Urantia Papers (published 1955). The text claims this is how other cosmic races and hierarchies know our planet — a code within a vast universal registry. Earth's stellar address.

The Urantia Book describes Earth as planet 606 of the Satania system, in the constellation of Norlatiadek, part of the universe of Nebadon. It provides a cosmic context for human existence — we are not isolated, but part of a managed, evolving universe.

**Gaia** — This name reaches back to Greek mythology, where Gaia was the primordial goddess — the Mother who gave rise to everything that exists. Over time, this name was adopted by spiritual and scientific traditions alike:

- **James Lovelock's Gaia Hypothesis (1970s):** The Earth functions as a single, self-regulating living system — adjusting temperature, atmospheric composition, and ocean salinity to maintain conditions suitable for life. This isn't metaphor. It's measurable science.
- **Indigenous traditions worldwide** — Pachamama (Andes), Bhumi (Hindu), Jord (Norse) — all describe Earth as a conscious, living being

**Urantia = the cosmic record.** Earth's address in the universe.
**Gaia = the sacred force.** The soul that inhabits the planet.

Perhaps this is the greatest mystery: we live on a planet that is not just rock and water traveling through space, but a **conscious, breathing being** that feels and communicates with us.

🔥 **Are we simple inhabitants of this world — or cells of its own spiritual body?**
""",
                    keyInsight: "Urantia is Earth's cosmic name in a universal registry. Gaia is her living spirit. Together they reveal a planet that is both addressed in the cosmos and alive with consciousness.",
                    practice: "Spend 10 minutes with bare feet on the ground. Not as exercise — as communion. Feel what the planet communicates through your body."
                )
            ])
        ],
        sources: ["The Urantia Book (1955) — Urantia Foundation", "James Lovelock, \"Gaia: A New Look at Life on Earth\" (1979)", "Greek cosmogony — Hesiod's Theogony", "Lynn Margulis, symbiosis and Gaia theory", "Indigenous Earth-as-mother traditions worldwide"],
        dragonComment: "Science says the Earth self-regulates like a living organism. Ancients said she IS a living organism. Maybe they weren't using metaphor. 🐉"
    )
}
