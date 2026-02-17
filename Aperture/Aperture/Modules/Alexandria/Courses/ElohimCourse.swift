// ElohimCourse.swift
import SwiftUI

enum ElohimCourse {
  static let course = AlexandriaCourse(
    id: "elohim", title: "The Divine Plural — Elohim", subtitle: "Who Was Never a Single God",
    icon: "person.3.fill", colorHex: "#7B68EE", tier: 3, isPremium: false, isUltraPremium: false,
    modules: [
      ACModule(
        id: "el1", number: 1, title: "Let US Make Man", subtitle: "The plural they couldn't erase",
        icon: "text.magnifyingglass",
        lessons: [
          ACLesson(
            id: "el1_1", title: "The Word That Breaks Monotheism",
            content: """
              **When we hear "God," our mind imagines a unique being — omnipotent, singular, alone.**

              But the oldest Hebrew texts reveal a secret that challenges this idea.

              The word used for God in Genesis is **Elohim** (אֱלֹהִים). And Elohim is **PLURAL.**

              Literally translated, it means "gods" or "divine beings." Not one creator, but a **higher intelligence council.** A chorus of forces acting together in creation.

              **Genesis 1:26:** *"Let US make man in OUR image."*

              "Let us." "Our image."

              This is not a translation error. It is not the "royal we." Hebrew scholars have debated this for millennia because the grammar is clear: the subject is plural.

              If God is ONE, why does God say "us" and "our"?

              **The answers the institutions give:**
              - "It's the Trinity" (invented at Nicaea in 325 CE — 1,000+ years after Genesis was written)
              - "It's the royal plural" (Hebrew has no royal plural tradition)
              - "It's God speaking to the angels" (then angels helped create humanity — which opens its own can of worms)

              **What the text actually suggests:**
              Creation was not a solo act but a **collective work** of beings who embodied and guided humanity. The Elohim were guardians, judges, teachers — interacting with humans on Earth.

              Some researchers connect Elohim directly to the **Anunnaki of Sumeria** — beings who shared knowledge and left their mark on human history.

              🔥 **This divine plural invites us to look beyond dogma, to question what we've been told, and to recognize that creation is a shared mystery — not a one-man show.**
              """,
            keyInsight:
              "Elohim (אֱלֹהִים) is grammatically plural — 'gods,' not 'God.' Genesis 1:26 ('Let US make man in OUR image') preserves the original understanding of creation by a council, not a single deity.",
            practice:
              "Read Genesis 1 in any translation. Circle every instance of 'us,' 'our,' and 'Elohim.' Notice how the singular interpretation requires ignoring the actual text."
          )
        ])
    ],
    sources: [
      "Genesis 1:26 — Hebrew grammatical analysis",
      "Michael Heiser, \"The Unseen Realm\" (Divine Council)",
      "Mark S. Smith, \"The Origins of Biblical Monotheism\"",
      "Mesopotamian divine council parallels", "Psalm 82 — 'God stands in the divine assembly'",
    ],
    dragonComment:
      "The very first page of the Bible says 'Let US make man in OUR image.' Plural. They built an entire monotheistic religion on a text that opens with a committee meeting. 🐉"
  )
}
