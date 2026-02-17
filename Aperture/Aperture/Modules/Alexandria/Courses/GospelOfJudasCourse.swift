// GospelOfJudasCourse.swift
import SwiftUI

enum GospelOfJudasCourse {
  static let course = AlexandriaCourse(
    id: "gospel_judas",
    title: "The Gospel of Judas",
    subtitle: "The Traitor or the Guardian of the Forbidden Secret?",
    icon: "key.fill",
    colorHex: "#C0392B",
    tier: 3, isPremium: false, isUltraPremium: false,
    modules: [
      ACModule(
        id: "gj1", number: 1, title: "2,000 Years of Lies About One Man",
        subtitle: "What the Gnostic text reveals", icon: "scroll.fill",
        lessons: [
          ACLesson(
            id: "gj1_1", title: "The Name Synonymous With Betrayal",
            content: """
              **Judas Iscariot.** The name that has been synonymous with betrayal for over 2,000 years.

              But what if Judas was not the villain we were taught? What if he was the **guardian of the most dangerous secret in Christianity?**

              **The Gospel of Judas** — a Gnostic text discovered in Egypt in 1978, authenticated and published by National Geographic in 2006 — reveals a hidden and radical version of history.

              In this text, Judas does not hand Jesus over out of greed or weakness. He does it because he is **the only disciple who truly understands** the nature of his master — a spiritual being trapped in a physical body, destined to free his spirit from earthly prison.

              Jesus himself, according to this gospel, **chose Judas** for the sacred and necessary role of helping him break the chains of the material world and fulfill the divine plan.

              **Read that again.** Jesus ASKED Judas to do it.

              In the canonical gospels, Judas is paid 30 pieces of silver and hangs himself in shame. In the Gospel of Judas, he is the most **enlightened** disciple — the only one who accessed the supreme truth.

              Why was this buried? Because it suggests that:
              - The "betrayal" was a **sacred act**, not a crime
              - Judas was the most **awakened**, not the most fallen
              - The crucifixion was **planned liberation**, not punishment
              - The other 11 disciples didn't understand their own teacher

              🔥 **This truth was branded as heresy because it threatened the entire control structure: if Judas was right, the Church's narrative of sin, guilt, and betrayal collapses.**
              """,
            keyInsight:
              "The Gospel of Judas presents the 'betrayal' as a sacred act requested by Jesus himself — making Judas the most enlightened disciple, not the greatest villain.",
            practice:
              "Sit with this question: if the 'worst person in the Bible' was actually the most awake, what other inversions might be hiding in plain sight?"
          ),
          ACLesson(
            id: "gj1_2", title: "Why This Changes Everything",
            content: """
              **This gospel puts the official Church in check.** Here's why it was suppressed:

              **1. It redefines sacrifice.** If Jesus WANTED to leave the physical body, the crucifixion isn't a tragedy — it's a graduation. The Church's entire guilt economy (Jesus died FOR YOUR SINS) evaporates.

              **2. It elevates knowledge over faith.** The other disciples worshipped Jesus. Judas UNDERSTOOD him. In the Gnostic framework, knowledge (gnosis) is superior to blind devotion.

              **3. It questions who really understood Jesus.** If the closest disciples — Peter, James, John — didn't truly understand their teacher, what does that say about the Church they built?

              **4. It reveals the body as prison, not temple.** The material world, in this gospel, is the creation of a lesser god (the Demiurge). Liberation means LEAVING matter, not worshipping within it.

              **The Text Itself**

              Jesus tells Judas: *"Step away from the others and I shall tell you the mysteries of the kingdom. It is possible for you to reach it, but you will grieve a great deal."*

              And: *"You will exceed all of them. For you will sacrifice the man that clothes me."*

              "The man that clothes me." The body is clothing. The spirit is the wearer. Judas removes the clothing so the spirit can be free.

              🔥 **The Gospel of Judas opens a door to question the very nature of betrayal, truth, and sacrifice. This is the story that history does not want you to hear.**
              """,
            keyInsight:
              "If Judas was following Jesus's direct instructions, the entire framework of sin, guilt, betrayal, and the need for Church-mediated salvation collapses.",
            practice:
              "Read the Gospel of Judas yourself (National Geographic translation, freely available). Note how different Jesus sounds compared to the canonical gospels.",
            interactiveElement: .inversionTable(rows: [
              (
                told: "Judas betrayed Jesus for 30 silver coins",
                truth: "Judas fulfilled Jesus's direct request to free his spirit"
              ),
              (
                told: "Judas was the worst disciple",
                truth: "Judas was the ONLY one who understood Jesus's true nature"
              ),
              (
                told: "The crucifixion was punishment for humanity's sins",
                truth: "The crucifixion was planned spiritual liberation from matter"
              ),
              (
                told: "Judas hanged himself in shame",
                truth: "Judas carried the heaviest burden — being misunderstood forever"
              ),
              (
                told: "This gospel is heresy",
                truth:
                  "This gospel was suppressed because it removes the need for institutional mediation"
              ),
            ])),
        ])
    ],
    sources: [
      "The Gospel of Judas — National Geographic translation (2006)",
      "Rodolphe Kasser, Marvin Meyer, Gregor Wurst — critical edition",
      "Bart Ehrman, \"The Lost Gospel of Judas Iscariot\"",
      "Elaine Pagels, \"Reading Judas\"",
      "Codex Tchacos — original Coptic manuscript (3rd-4th century CE)",
    ],
    dragonComment:
      "The 'worst person in the Bible' might have been the only one who actually understood the teacher. If that doesn't make you question EVERYTHING you were taught, nothing will. 🐉"
  )
}
