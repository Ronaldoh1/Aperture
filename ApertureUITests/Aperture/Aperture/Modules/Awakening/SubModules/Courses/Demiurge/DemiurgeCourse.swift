// DemiurgeCourse.swift
// THE DEMIURGE - Gnostic Cosmology & The False Creator

import SwiftUI

struct DemiurgeCourse {
  static let shared = DemiurgeCourse()

  let id = "demiurge"
  let title = "The Demiurge & Gnostic Truth"
  let subtitle = "The false god and imprisoned light"
  let icon = "eye.trianglebadge.exclamationmark"
  let colorHex = "#8B0000"

  var color: Color {
    Color(hex: colorHex)
  }

  let modules: [DemiurgeModule] = [
    // MODULE 1: GNOSTIC COSMOLOGY
    DemiurgeModule(
      id: "dem_1",
      number: 1,
      title: "Gnostic Cosmology",
      subtitle: "The hidden truth about creation",
      lessons: [
        DemiurgeLesson(
          id: "d1_1",
          title: "The True God vs The Creator God",
          content: """
            **The Gnostic Revelation**

            Gnosticism (from Greek "gnosis" = knowledge) teaches a radical truth: The god who created the material world is NOT the true, ultimate God.

            **The Hierarchy:**

            **The True God (The Monad/The One)**
            • Unknowable, infinite, perfect
            • Beyond all description or comprehension
            • Pure consciousness, pure light
            • Did NOT create the material world

            **The Pleroma (Fullness)**
            • Divine realm of light
            • Contains Aeons—divine emanations
            • Sophia (Wisdom) is the youngest Aeon
            • Perfect, harmonious, spiritual

            **The Demiurge (Yaldabaoth)**
            • Created the material world
            • Believes himself to be the only God
            • Ignorant of the True God above him
            • Not evil by nature, but BLIND

            **The Material World**
            • Created by the Demiurge
            • A flawed copy of the Pleroma
            • Traps divine sparks in matter
            • A prison, not a gift

            🔥 **The Core Teaching**: The "God" of the Old Testament who creates, judges, gets angry, demands worship—that's the Demiurge. The TRUE God is beyond all that.
            """,
          revelation: "The creator god is not the true God. There's something higher."
        ),

        DemiurgeLesson(
          id: "d1_2",
          title: "The Fall of Sophia",
          content: """
            **How The Demiurge Came To Be**

            The Gnostic creation myth centers on Sophia (Wisdom), an Aeon in the Pleroma.

            **The Story:**

            1. **Sophia's Desire**
            Sophia wanted to know the unknowable Father directly, without her consort. This was a mistake—divine emanation requires balance.

            2. **The Abortion**
            Her unbalanced desire produced an offspring—not divine light, but something malformed. She cast it away in shame.

            3. **Yaldabaoth Is Born**
            This rejected offspring became Yaldabaoth (the Demiurge)—a being with creative power but NO knowledge of what exists above him.

            4. **"I Am God"**
            Yaldabaoth declared: "I am God, and there is no other." This wasn't a lie to him—he genuinely didn't know better.

            5. **Creation as Compensation**
            The Demiurge created the material world and its rulers (Archons) to fill his emptiness. But you can't create fullness from lack.

            **Sophia's Redemption**
            Sophia repented. The True God forgave her. She now works to reclaim the divine sparks trapped in matter—including the one in YOU.

            🔥 **The Pattern**: The Demiurge isn't evil—he's IGNORANT. He genuinely believes he's the supreme being. This ignorance shapes everything he creates.
            """,
          revelation:
            "The Demiurge was born from a cosmic mistake. He doesn't know what he doesn't know."
        ),

        DemiurgeLesson(
          id: "d1_3",
          title: "The Archons: Rulers of This World",
          content: """
            **The Demiurge's Hierarchy**

            The Demiurge created beings called ARCHONS (Greek: "rulers") to govern the material world.

            **Who Are The Archons?**
            • Subordinate creators/rulers under the Demiurge
            • Each governs a planetary sphere
            • They maintain the prison of matter
            • They feed on human energy (fear, worship, suffering)

            **The Seven Archons**
            Often associated with the seven classical planets:
            1. Moon
            2. Mercury
            3. Venus
            4. Sun
            5. Mars
            6. Jupiter
            7. Saturn (sometimes equated with the Demiurge himself)

            **How They Control:**
            • **Fate/Astrology**: The archons impose "destiny" through planetary influence
            • **Religious Law**: Rules that bind rather than liberate
            • **Fear of Death**: Keeping souls cycling through reincarnation
            • **Ignorance**: Suppressing gnosis (direct knowledge)

            **The Counterfeit Spirit**
            The archons install a "counterfeit spirit" in humans—a false self that mistakes itself for the true self. This is the EGO.

            🔥 **Modern Application**: Any system that keeps you:
            • In fear
            • Externally focused
            • Ignorant of your divine nature
            • Dependent on authorities for salvation

            ...is archonic in nature.
            """,
          revelation:
            "The Archons are the prison guards. They don't want you to know you're already free."
        ),
      ]
    ),

    // MODULE 2: THE DIVINE SPARK
    DemiurgeModule(
      id: "dem_2",
      number: 2,
      title: "The Divine Spark",
      subtitle: "The light trapped within you",
      lessons: [
        DemiurgeLesson(
          id: "d2_1",
          title: "The Imprisoned Light",
          content: """
            **How Divine Light Got Trapped**

            When the Demiurge created humanity, something unexpected happened.

            **The Creation of Adam:**
            The Demiurge and Archons created the human body—material, dense, limited. But it wouldn't come alive.

            Sophia (or the True God, depending on the text) breathed divine light INTO the clay form. This is the divine spark—a fragment of the True God placed inside material creation.

            **The Accident:**
            This wasn't supposed to happen. Now there's divine light TRAPPED in matter, in bodies created by the Demiurge.

            **The Demiurge's Reaction:**
            When he saw that humans had light HE didn't create, the Demiurge became jealous. He tried to suppress this light:
            • Creating ignorance (the Garden story)
            • Imposing laws
            • Installing the ego
            • Making humanity forget its true origin

            **YOU Are That Spark:**
            The divine spark is not your body, not your personality, not your history. It's the AWARENESS that's aware. The consciousness that witnesses everything.

            🔥 **The Recognition**: You are not a body with a soul. You are divine light temporarily housed in a Demiurgic creation.
            """,
          revelation:
            "You have divine light within you that the Demiurge didn't create and can't control."
        ),

        DemiurgeLesson(
          id: "d2_2",
          title: "Gnosis: The Way Out",
          content: """
            **Knowledge That Liberates**

            Gnosis isn't intellectual knowledge—it's direct experiential RECOGNITION of your true nature.

            **What Gnosis Is:**
            • Direct knowing (not believing)
            • Remembering your divine origin
            • Seeing through the illusion
            • Experiential, not theoretical

            **What Gnosis Is NOT:**
            • Faith in doctrines
            • Obedience to authority
            • Salvation through an intermediary
            • Belief without experience

            **How Gnosis Liberates:**
            1. You recognize you are NOT the body
            2. You recognize you are NOT the ego
            3. You recognize you are divine light
            4. The prison was always unlocked—you just forgot

            **The Role of Christ (in Gnosticism):**
            Many Gnostic texts present Christ as a messenger from the True God who came to:
            • Reveal the existence of the True God
            • Wake up the divine sparks
            • Teach gnosis (not just belief)
            • Model the escape from archonic control

            Note: Gnostic Christ ≠ Orthodox Christ. Gnostic Christ is a consciousness, not a blood sacrifice.

            🔥 **The Core Message**: You don't need someone to save you. You need someone to WAKE you up. Salvation is recognition, not transaction.
            """,
          revelation:
            "Gnosis is direct knowledge that liberates. You don't need saving—you need waking."
        ),

        DemiurgeLesson(
          id: "d2_3",
          title: "The Escape From The Matrix",
          content: """
            **Breaking Free From Archonic Control**

            The Gnostic path is about escaping the prison of matter and returning to the Pleroma.

            **Step 1: Recognize The Prison**
            You can't escape what you don't see. First, recognize:
            • Material reality is not ultimate reality
            • The "god" demanding worship may not be the True God
            • Systems of control exist to keep you asleep
            • Your ego is not your true self

            **Step 2: Cultivate Gnosis**
            • Meditation and contemplation
            • Study of Gnostic texts
            • Direct inquiry: "What am I?"
            • Recognizing the light within

            **Step 3: Purify The Vehicles**
            • Body: Discipline without punishment
            • Emotions: Mastery without suppression
            • Mind: Clarity without attachment
            • Spirit: Alignment with the Pleroma

            **Step 4: Pass Through The Archons**
            At death (or in mystical experience), the soul must pass through the archonic spheres. Each archon demands:
            • Passwords (spiritual knowledge)
            • Energy (which they try to harvest)
            • Worship (which they're not owed)

            The awakened soul knows: "I am from the Father. I pass through."

            **Step 5: Return To The Pleroma**
            The divine spark reunites with its source. The journey is complete. The prison is escaped.

            🔥 **The Bottom Line**: The archons control through ignorance. Gnosis ends their power. Know yourself, and you are free.
            """,
          revelation:
            "The prison has no lock—only the illusion of one. Gnosis reveals the door was always open."
        ),
      ]
    ),

    // MODULE 3: MODERN IMPLICATIONS
    DemiurgeModule(
      id: "dem_3",
      number: 3,
      title: "The Demiurge Today",
      subtitle: "Archonic systems in modern life",
      lessons: [
        DemiurgeLesson(
          id: "d3_1",
          title: "Recognizing Archonic Systems",
          content: """
            **The Archons Didn't Disappear**

            If the Gnostic framework is true (or even metaphorically useful), archonic control didn't end in ancient times. It evolved.

            **Characteristics of Archonic Systems:**

            1. **Demand Worship/Compliance**
            Any system that demands you surrender your sovereignty in exchange for "salvation" or "security."

            2. **Create Fear**
            Fear of death, hell, poverty, social rejection—fear is the primary control mechanism.

            3. **Suppress Direct Knowledge**
            "Don't trust your experience—trust authorities." Gnosis is dangerous to control systems.

            4. **Harvest Energy**
            Systems that feed on your attention, emotion, labor—without returning equivalent value.

            5. **Promote Ignorance of True Nature**
            Keep you identified with the body, the ego, the social role—never asking "What am I really?"

            6. **Claim Ultimate Authority**
            "There is no god but me." Any system claiming absolute truth IS archonic.

            **Modern Examples:**
            • Religious institutions that demand obedience over experience
            • Economic systems that require endless labor
            • Media that keeps attention in fear/outrage
            • Education that rewards compliance over curiosity
            • Medical systems that treat symptoms, not causes

            🔥 **Discernment**: Not all institutions are archonic. Some genuinely serve. The test is: Does it LIBERATE or CONTROL? Does it encourage YOUR gnosis or demand YOUR submission?
            """,
          revelation: "Archonic patterns repeat in modern systems. Learn to recognize them."
        ),

        DemiurgeLesson(
          id: "d3_2",
          title: "The Counterfeit Spirit (Ego)",
          content: """
            **The Archon Within**

            The archons installed something in humanity—the "counterfeit spirit." In modern terms: the EGO.

            **What The Ego Does:**
            • Mistakes itself for the true self
            • Fears death (because it IS mortal)
            • Seeks external validation
            • Creates separation from others and from Source
            • Maintains the illusion of being a separate entity

            **The Ego's Relationship To Archons:**
            The internal ego resonates with external archonic systems. It WANTS:
            • To be told what's true
            • To fit in and be accepted
            • To have enemies to fight
            • To be special (or specially victimized)
            • To never face its own mortality

            Archonic systems and the internal ego are SYMBIOTIC. Each reinforces the other.

            **Dissolving The Counterfeit Spirit:**

            1. **Witness It**: Watch the ego operate without identifying with it

            2. **Question It**: "Is this really me? Or is this the installed program?"

            3. **Starve It**: Don't feed it with reaction. Observe without engaging.

            4. **Replace It**: Let awareness of the divine spark grow until it eclipses the ego

            **Not Destruction—Transcendence:**
            You don't kill the ego. You recognize it as a tool, not the master. It has its uses. But it's not who you are.

            🔥 **The Liberation**: When you stop mistaking the counterfeit spirit for yourself, its power over you ends.
            """,
          revelation: "The ego is the archon within—the prison guard you carry inside yourself."
        ),

        DemiurgeLesson(
          id: "d3_3",
          title: "Becoming Sovereign",
          content: """
            **The End of Archonic Control**

            True gnosis doesn't just reveal the prison—it ends it. Here's what sovereignty looks like:

            **Sovereignty Means:**

            • **Internal Authority**: Your direct experience is your guide. Not scriptures, not gurus, not governments—though all can be consulted.

            • **No Fear of Death**: The body dies. You don't. When you know this, fear loses its power.

            • **Discernment Without Paranoia**: Yes, archonic systems exist. No, not everything is a conspiracy. Pattern recognition, not persecution complex.

            • **Responsibility**: If you're sovereign, you're responsible. No more blaming the archons for your choices.

            • **Compassion**: Others are trapped in the same prison. Sovereignty includes helping—not judging—those still asleep.

            **The Gnostic Goal:**
            Return to the Pleroma while still in the body. Live as divine light having a human experience—not as a human trying to become divine.

            **What Changes:**
            • World looks the same
            • You are different
            • Actions arise from clarity, not compulsion
            • Fear no longer drives decisions
            • The prison is seen as transparent—still there, but powerless

            🔥 **The Final Teaching**: The Demiurge and archons were never your enemies. They were your teachers—showing you, through opposition, who you really are. Thank them. Then walk free.
            """,
          revelation: "Sovereignty is knowing what you are—and living from that knowledge."
        ),
      ]
    ),
  ]
}

/// Supporting Types
struct DemiurgeModule: Identifiable {
  let id: String
  let number: Int
  let title: String
  let subtitle: String
  let lessons: [DemiurgeLesson]
}

struct DemiurgeLesson: Identifiable {
  let id: String
  let title: String
  let content: String
  let revelation: String
}

struct DemiurgeProgress: Codable {
  var completedLessons: [String]
  var lastAccessed: Date?
  static var `default`: DemiurgeProgress {
    DemiurgeProgress(completedLessons: [], lastAccessed: nil)
  }
}
