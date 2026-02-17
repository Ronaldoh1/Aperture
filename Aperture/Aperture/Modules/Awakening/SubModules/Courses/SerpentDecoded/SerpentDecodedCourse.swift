// SerpentDecodedCourse.swift
// THE SERPENT DECODED - The Forbidden Truth They Hid For 2,000 Years
// ☀️ SunFlow: Reignited

import SwiftUI

// MARK: - Course Data

struct SerpentDecodedCourse {
  static let shared = SerpentDecodedCourse()

  let id = "serpent_decoded"
  let title = "The Serpent Decoded"
  let subtitle = "The forbidden truth hidden for 2,000 years"
  let icon = "waveform.path"  // Serpentine wave
  let colorHex = "#00FF66"  // Cosmic green

  var color: Color {
    Color(hex: colorHex)
  }

  let modules: [SerpentModule] = [
    // ═══════════════════════════════════════════════════════════════
    // MODULE 1: THE UNIVERSAL SERPENT
    // ═══════════════════════════════════════════════════════════════
    SerpentModule(
      id: "serpent1",
      number: 1,
      title: "The Universal Serpent",
      subtitle: "What every civilization knew before Genesis",
      icon: "globe.americas.fill",
      lessons: [
        SerpentLesson(
          id: "s1_1",
          title: "The Pattern They Don't Want You to See",
          content: """
            **Before we decode Genesis, you need to see something strange.**

            Something the church never explains.

            The serpent didn't start in the Bible. The serpent was already ancient, already sacred, already worshipped across every civilization that came before the Hebrews ever wrote Genesis.

            **In Egypt**, the serpent was the Uraeus—the cobra on Pharaoh's crown. It symbolized divine authority, protection, the awakened third eye. It wasn't evil. It was the mark of kingship. The symbol of one who could see beyond the veil.

            **In Mesopotamia**, where Abraham came from, where the Genesis story has its roots, the god Ningishzida was depicted as a serpent. His symbol? Two serpents coiled around a staff. That's the Caduceus. The same symbol we use today for medicine and healing. The serpent was the healer, not the destroyer.

            **In Greece**, the god of medicine Asclepius carried a rod with a single serpent wrapped around it. Temples dedicated to him were places of healing and spiritual awakening. The serpent shedding its skin became the ultimate symbol of transformation—death and rebirth, the soul's journey through mortality into divine life.

            **In India**, long before the Bible was written, the serpent represents Kundalini—the coiled divine energy at the base of the spine that, when awakened, rises and unites the soul with God.

            **Do you see the pattern?**

            Egypt. Mesopotamia. Greece. India. Every ancient culture that sought the mysteries of life and death revered the serpent. It represented:
            - Wisdom
            - Healing  
            - Awakening
            - Ascension

            🔥 **So here's the question nobody asks: Why would Genesis suddenly make it evil?**
            """,
          keyInsight:
            "The serpent was universally sacred before Genesis. Every ancient civilization associated it with wisdom, healing, and divine awakening.",
          practice:
            "Research one ancient serpent symbol (Uraeus, Caduceus, Kundalini) and reflect on what it meant to that culture."
        ),

        SerpentLesson(
          id: "s1_2",
          title: "The Inversion",
          content: """
            **Part of you already sensed this didn't add up.**

            Why would the Hebrew scribes—who lived surrounded by serpent symbolism, who knew what it meant—suddenly flip the script and turn the awakener into the enemy?

            Was it theology? Or was it politics?

            **The Political Reality**

            The Israelites were coming out of Egypt. Coming out of Babylon. Coming out of cultures where the serpent was sacred.

            And the priests of Yahweh needed to separate them from the old gods.

            So they did what every religious revolution does: **They demonized the symbols of the previous system.** They inverted the serpent. They made the awakener into the deceiver.

            **But here's what they couldn't erase.**

            Even in the Hebrew Bible, the serpent keeps showing up as a symbol of God's power:
            - Moses and the bronze serpent (Numbers 21)
            - The Seraphim—the "fiery serpents" that surround God's throne (Isaiah 6)

            Have you ever noticed the church avoids preaching on those verses?

            **The Hebrew Word Itself**

            Even the word for serpent reveals the truth. The Hebrew word is **Nachash** (נָחָשׁ).

            But Nachash doesn't just mean "snake." It also means:
            - To shine
            - To whisper
            - To divine
            - To know hidden things

            The serpent was **the illuminator**. And the Torah couldn't fully suppress that.

            🔥 **The serpent wasn't demonized because it was evil. It was demonized because it represented the wisdom of the systems the new religion needed to replace.**
            """,
          keyInsight:
            "The Hebrew word Nachash means both 'serpent' and 'to shine, to divine, to know hidden things.' The serpent was the illuminator.",
          practice:
            "Look up the Hebrew word Nachash. Notice how the meaning 'shining one' changes everything about how you read Genesis 3."
        ),

        SerpentLesson(
          id: "s1_3",
          title: "The Question That Changes Everything",
          content: """
            **So if the serpent was sacred everywhere else...**

            If even the Hebrew language connects it to divine knowledge...

            Then why did Genesis cast it as the villain?

            And what was it really doing in the Garden?

            **This is where everything turns.**

            The doctrine you were taught—that the serpent is Satan, that it deceived Eve, that it caused the fall of humanity—is an interpretation. A very late interpretation.

            The word "Satan" doesn't appear in Genesis 3. The serpent is called "more cunning than any beast of the field"—but cunning isn't evil. It's awareness. It's wisdom.

            **What if the serpent was never God's enemy?**

            What if everything the church taught you about the fall was inverted?

            What if Jesus himself pointed to the serpent as a symbol of salvation—and they've been hiding it from you for 2,000 years?

            **The Questions Nobody Asks:**

            1. Why would God put a tree in the garden that he didn't want eaten from?
            2. Why would the serpent tell Eve something that turned out to be true—that her eyes would be opened?
            3. Why does Genesis 3:22 say humans "became like God" after eating?
            4. Why would Jesus later compare himself to the serpent?

            These aren't heretical questions. They're the questions the text itself raises.

            And the answers will transform everything you thought you knew about Eden, about the serpent, and about the power sleeping inside your own body.

            🔥 **This is the forbidden decode. What you're about to discover changes everything.**
            """,
          keyInsight:
            "The word 'Satan' never appears in Genesis 3. The serpent being evil is an interpretation—a very late one.",
          practice:
            "Read Genesis 3 fresh, without assuming the serpent is Satan. Notice what the text actually says versus what you were taught it says."
        ),
      ]
    ),

    // ═══════════════════════════════════════════════════════════════
    // MODULE 2: EDEN DECODED
    // ═══════════════════════════════════════════════════════════════
    SerpentModule(
      id: "serpent2",
      number: 2,
      title: "Eden Decoded",
      subtitle: "The garden was never a location",
      icon: "tree.fill",
      lessons: [
        SerpentLesson(
          id: "s2_1",
          title: "Eden: A State of Consciousness",
          content: """
            **Here's the first decode: Eden was not a location.**

            It was not a garden in ancient Iraq between two rivers. Eden was a **state of consciousness**.

            And the moment you see that, the entire story transforms from mythology into a map of your soul.

            **The Hebrew Word**

            Look at the word. Eden (עֵדֶן) in Hebrew means:
            - Delight
            - Pleasure  
            - Bliss

            Not a place. A **state of being**. A state of unity with God before the soul fragmented into duality.

            **This is where you began.**

            Not in a physical paradise, but in the unified consciousness you had before you learned to divide the world into:
            - Good and evil
            - Light and dark
            - Self and other

            Eden is the womb. The cosmic innocence. The state before knowledge descended.

            **But here's the mystery most people miss: You were never meant to stay there.**

            Something in you knows this. Because Eden is not the destination. Eden is the starting point.

            **The Direction of Awakening**

            Look at Genesis 2:8: "And the Lord God planted a garden **eastward** in Eden."

            Most Christians read right past that word. But in the ancient world, east wasn't just a direction. East was where the sun rises. East was the direction of **illumination**, of awakening.

            God placed humanity in a garden **facing the rising light**.

            🔥 **Eden wasn't where you were meant to stay. It's where your journey toward awakening began.**
            """,
          keyInsight:
            "Eden means 'delight' or 'bliss' in Hebrew—not a place but a state of unified consciousness before the descent into duality.",
          practice:
            "Recall a moment when you felt complete unity—no separation between self and world. That was Eden consciousness."
        ),

        SerpentLesson(
          id: "s2_2",
          title: "The Two Trees",
          content: """
            **In the middle of that garden were two trees.**

            The Tree of Life. And the Tree of the Knowledge of Good and Evil.

            Two trees. Two paths. Two possibilities.

            **The Tree of Life** represents:
            - Unity
            - Eternal flow
            - Oneness with God

            **The Tree of Knowledge** represents:
            - Duality
            - The fracturing of consciousness into opposites
            - The experience of separation

            **And here's what the church never told you:**

            The Tree of Knowledge wasn't forbidden because it was evil. It was forbidden because **humanity wasn't ready**.

            Knowledge without wisdom becomes distortion.
            Awareness without love becomes judgment.
            Consciousness without unity becomes separation.

            **But the tree was always going to be eaten.**

            Because the journey required it.

            **The Necessary Descent**

            You cannot know light without experiencing dark.
            You cannot know yourself without experiencing otherness.
            You cannot choose God without the possibility of choosing not-God.

            The Tree of Knowledge wasn't a trap. It was a **threshold**. A doorway into the experience that would eventually make conscious reunion with God possible.

            Not as a blind child. But as a conscious co-creator.

            🔥 **The fall wasn't a mistake. It was an initiation. The descent that makes ascent meaningful.**
            """,
          keyInsight:
            "The Tree of Knowledge wasn't evil—it represented the descent into duality that makes conscious reunion with God possible.",
          practice:
            "Consider: What has your experience of duality (good/evil, self/other) taught you that innocence never could?"
        ),

        SerpentLesson(
          id: "s2_3",
          title: "What the Serpent Actually Said",
          content: """
            **Now watch what happens in Genesis 3.**

            "The serpent was more cunning than any beast of the field."

            More cunning. More subtle. More aware.

            **The serpent isn't an external demon. The serpent is the voice of awakening consciousness within the soul.**

            The whisper that says: "You are more than this. You can know. You can become like God."

            And it speaks to Eve—not to Adam. To the feminine. To the intuitive, receptive, creative force within consciousness. The part that feels before it thinks. The part willing to reach for the fruit even when the gatekeepers say it's forbidden.

            **The Exchange**

            The serpent says: "Has God indeed said you shall not eat of every tree?"

            Eve answers: "We may eat from the trees, but not from the tree in the midst of the garden, or we will die."

            Then the serpent says something the church calls "the original lie":

            **"You will not surely die. For God knows that when you eat of it, your eyes will be opened and you will be like God, knowing good and evil."**

            Read that again. "You will be like God."

            This is what 2,000 years of doctrine have been built on calling a deception.

            **But look what happens next:**

            Genesis 3:7 — "Then the eyes of both of them were **opened**."

            Not blinded. **Opened.**

            They became aware. They gained knowledge. They moved from unconscious unity into conscious duality.

            🔥 **The serpent told the truth. Their eyes were opened. They became like God. The "lie" wasn't a lie at all.**
            """,
          keyInsight:
            "The serpent said their eyes would be opened—and they were. The 'original lie' turned out to be the truth.",
          practice:
            "Read Genesis 3:1-7 slowly. Notice: Did the serpent lie? What actually happened?"
        ),

        SerpentLesson(
          id: "s2_4",
          title: "The Verse the Church Never Preaches",
          content: """
            **This is the verse that destroys the entire doctrine of original sin.**

            After Adam and Eve eat from the tree, after they gain knowledge, after they hide in shame—God speaks.

            Genesis 3:22:

            **"Then the Lord God said, 'Behold, the man has become like one of us, knowing good and evil.'"**

            Read that slowly.

            "The man **has become like one of us**."

            Not "the man has rebelled."
            Not "the man has sinned and is now cursed."

            **"The man has become like us."**

            Like the divine council. Like God. Knowing good and evil.

            Just as the serpent said.

            **Have you ever noticed the church never preaches on this verse?**

            Because it destroys the narrative.

            So where's the lie? Where's the deception? **The serpent told the truth.**

            **The Real Fall**

            The knowledge of good and evil isn't sin. It's the descent into duality. It's the fracturing of consciousness into opposites—light and dark, self and other, sacred and profane.

            This descent is necessary for:
            - Individuation
            - Free will
            - The soul's journey toward reunion with God

            But without the Tree of Life—without divine unity sustaining you—this knowledge becomes a burden. It becomes judgment. It becomes shame.

            **That is the real fall.** Not rebellion, but forgetfulness. The descent into the illusion of separation.

            🔥 **You are not fallen because of Adam and Eve. The 'fall' is the forgetting that happens to every soul when it descends into duality. And the 'rising' is remembering.**
            """,
          keyInsight:
            "Genesis 3:22 confirms humans 'became like God'—exactly what the serpent said. The church avoids this verse because it destroys the standard narrative.",
          practice: "Memorize Genesis 3:22. Let it dissolve the inherited shame of 'original sin.'"
        ),
      ]
    ),

    // ═══════════════════════════════════════════════════════════════
    // MODULE 3: THE BRONZE SERPENT
    // ═══════════════════════════════════════════════════════════════
    SerpentModule(
      id: "serpent3",
      number: 3,
      title: "The Bronze Serpent",
      subtitle: "What Moses knew about salvation",
      icon: "staroflife.fill",
      lessons: [
        SerpentLesson(
          id: "s3_1",
          title: "Numbers 21: The Verse That Makes No Sense",
          content: """
            **Now let me show you something that makes no sense—if the serpent is Satan.**

            Turn to Numbers chapter 21.

            The Israelites are in the wilderness, complaining against God and Moses. And verse 6 says:

            "So the Lord sent **fiery serpents** among the people, and they bit the people, and many died."

            The people repent and ask Moses to pray. Moses prays. And here's where it gets shocking.

            **Verse 8:**

            "Then the Lord said to Moses, 'Make a fiery serpent and set it on a pole, and everyone who is bitten, **when he looks at it, shall live**.'"

            Stop.

            **God told Moses to make a serpent.** A bronze serpent. Lift it on a pole. And everyone who looked at it would be healed.

            Most Christians have never heard a sermon on this.

            **If the serpent represents Satan...**
            If it's the embodiment of evil and deception...
            Then why would God command this?

            **Why would the symbol of the curse become the instrument of salvation?**

            Did you notice what God actually says here? He doesn't say "sacrifice a lamb." He doesn't say "perform a ritual."

            He says: **Look at the serpent and live.**

            The serpent = healing.
            The serpent = salvation.

            🔥 **This isn't random. This is prophetic. This is an encoded image that Jesus himself would later decode.**
            """,
          keyInsight:
            "God commanded Moses to make a bronze serpent for healing. If the serpent represents Satan, this command makes no sense.",
          practice:
            "Read Numbers 21:4-9. Sit with the strangeness: Why would looking at a serpent bring healing?"
        ),

        SerpentLesson(
          id: "s3_2",
          title: "The Hebrew Hidden in Plain Sight",
          content: """
            **Look at the Hebrew and the mystery deepens.**

            The bronze serpent is **Nachash Nechoshet** (נְחַשׁ נְחֹשֶׁת).

            Nachash = serpent
            Nechoshet = bronze

            Both words share the same root: **the shining one, the illuminated one.**

            **Bronze in the Ancient World**

            Bronze symbolized:
            - Divine judgment
            - Refinement through fire
            - Glory

            When God appeared to Daniel, his feet were "like fine bronze, refined in a furnace."

            When John saw the risen Christ in Revelation, "his feet were like fine brass, refined in fire."

            **The Connection**

            The bronze serpent on the pole was a foreshadowing. A mystery. An image planted in the wilderness for those with eyes to see.

            The serpent—the shining one—would one day be lifted up. And all who looked upon it would be saved.

            **What Moses Knew**

            Moses was trained in the wisdom of Egypt. He knew what the serpent meant. He knew about the Uraeus. He knew about divine serpent power.

            When God told him to make a bronze serpent, Moses understood something the later church would suppress:

            The serpent isn't the enemy.
            The serpent is the symbol of what must rise within you for healing to occur.

            🔥 **Jesus reveals what Moses only foreshadowed. And what he reveals will flip everything you've been taught.**
            """,
          keyInsight:
            "Nachash (serpent) and Nechoshet (bronze) share the same root meaning 'shining one'—the serpent on the pole was the illuminated one lifted up.",
          practice:
            "Research what bronze symbolized in ancient cultures. Notice how it connects to divine presence and refinement."
        ),

        SerpentLesson(
          id: "s3_3",
          title: "The Question That Breaks the Doctrine",
          content: """
            **Here's the question that breaks the entire doctrine.**

            If the serpent in Genesis is Satan...
            If it represents pure evil and deception...
            If it caused the fall of humanity...

            **Then why would Jesus compare himself to it?**

            Because he did.

            This one detail flips everything. And the church has no good answer for it.

            **The Setup**

            In John chapter 3, Jesus is speaking to Nicodemus—a Pharisee, a teacher of the law. Someone who knew the Torah intimately.

            And Jesus says something that should have been explosive:

            **John 3:14-15:**

            "And as Moses lifted up the serpent in the wilderness, **even so must the Son of Man be lifted up**, that whoever believes in him should not perish but have eternal life."

            Read that again.

            "As Moses lifted up the serpent in the wilderness, **even so must the Son of Man be lifted up**."

            **Jesus isn't distancing himself from the serpent. He's identifying with it.**

            He's saying: "What Moses did with the bronze serpent is a picture of what will happen to me. I am the serpent that must be lifted up. I am the one who will be elevated so that all who look upon me will be healed."

            🔥 **Have you ever heard a pastor explain this verse? Most avoid it entirely. Because it destroys the teaching that the serpent is Satan.**
            """,
          keyInsight:
            "Jesus directly compared his crucifixion to the bronze serpent being lifted up. He identified himself with the serpent symbol.",
          practice:
            "Memorize John 3:14. Let the radical nature of Jesus identifying with the serpent settle into your understanding."
        ),
      ]
    ),

    // ═══════════════════════════════════════════════════════════════
    // MODULE 4: JESUS AND THE SERPENT
    // ═══════════════════════════════════════════════════════════════
    SerpentModule(
      id: "serpent4",
      number: 4,
      title: "Jesus and the Serpent",
      subtitle: "The identification that changes everything",
      icon: "cross.fill",
      lessons: [
        SerpentLesson(
          id: "s4_1",
          title: "The Explicit Connection",
          content: """
            **This is not metaphor. This is not loose symbolism.**

            Jesus is directly, explicitly, intentionally connecting his crucifixion to the elevation of the serpent in the wilderness.

            **John 3:14-15:**

            "As Moses lifted up the serpent in the wilderness, even so must the Son of Man be lifted up, that whoever believes in him should not perish but have eternal life."

            **If the serpent in Genesis is Satan:**
            Then Jesus just compared himself to Satan.

            **If the serpent represents evil and deception:**
            Then Jesus just aligned his work with the symbol of humanity's fall.

            But that makes no sense.

            **Unless the serpent never represented what the church says it does.**

            **The Greek**

            The Greek word Jesus uses here is **hypsōthēnai** (ὑψωθῆναι). It means:
            - To be lifted up
            - To be elevated
            - To be exalted

            The same word appears in John 12:32:

            "And I, if I am **lifted up** from the earth, will draw all peoples to myself."

            Lifted up on a cross. On a pole. On the axis between heaven and earth.

            **Just like the serpent.**

            🔥 **The serpent on the pole is the Christ on the cross. The shining one elevated. The awakener made visible.**
            """,
          keyInsight:
            "Jesus used the same Greek word for his crucifixion that describes the serpent being 'lifted up'—he intentionally connected the two.",
          practice:
            "Sit with this: If Jesus identified with the serpent, what does the serpent actually represent?"
        ),

        SerpentLesson(
          id: "s4_2",
          title: "What Nicodemus Understood",
          content: """
            **Nicodemus would have understood this.**

            He knew the story of the bronze serpent. He knew the imagery. And he heard Jesus say something radical:

            "I am that serpent. I am the one who will be lifted up. I am the fulfillment of what Moses foreshadowed."

            **Jesus Completes the Mystery**

            Just as Moses lifted the bronze serpent so the dying could look and live, Jesus would be lifted on Golgotha so that all who look upon him in faith could be healed.

            The pattern:
            - Something deadly was happening (serpent bites / sin)
            - God provided something to look upon (bronze serpent / Christ on cross)
            - Those who looked were healed

            **But here's the question that goes even deeper:**

            What exactly is rising here?

            A man on a cross?

            Or something inside every human being?

            **What is Jesus really pointing to** when he calls himself the serpent that must be lifted up?

            Is he saying "Look at me and you'll be saved"?

            Or is he saying: "The same power that lifts me up must rise within you"?

            The same serpent energy.
            The same divine fire.
            The same consciousness that ascends within the human body—from the base to the crown.

            🔥 **Because if Jesus is the serpent, and Jesus is the Christ, and the Christ is the anointed awareness of God—then what is the serpent? It's the inner power that was always meant to rise within you.**
            """,
          keyInsight:
            "Jesus didn't just die as a serpent symbol—he revealed that what rose in him must rise in us. The serpent is the ascending consciousness.",
          practice:
            "Contemplate: What if 'looking upon the lifted serpent' means recognizing and activating that same rising power within yourself?"
        ),

        SerpentLesson(
          id: "s4_3",
          title: "Why They Fear This Teaching",
          content: """
            **The church has spent 2,000 years telling you to fear the serpent.**

            Because the moment you realize the serpent is inside you...
            The moment you realize the Christ is within you...
            The moment you understand that "the kingdom of God is within you" (Luke 17:21)...

            **You don't need them anymore.**

            **Jesus said it clearly:**

            John 14:12: "Most assuredly I say to you, he who believes in me, the works that I do he will do also—**and greater works than these he will do**."

            Greater works.

            Not because you worship him as an external figure.
            But because **you become like him**.
            Because the same serpent that rose in him **rises in you**.

            **The Pattern of Suppression:**
            - Council of Nicaea
            - The burning of Gnostic texts
            - The Inquisition
            - Every act of control throughout history

            They don't want you to know you carry the power within you.
            They don't want you to know the serpent is not evil.
            They don't want you to know the kingdom is within you.

            **Because if you knew:**
            - You would stop depending on institutions
            - You would start activating your inner temple
            - You would stop begging for salvation and start embodying the Christ
            - You would stop fearing the serpent and start becoming it

            🔥 **The serpent isn't your enemy. It's the part of you the gatekeepers need you to fear—so you never discover what you really are.**
            """,
          keyInsight:
            "The serpent teaching was suppressed because it reveals that the power of Christ is within you. Institutions lose control when you know this.",
          practice:
            "Notice where you've been taught to seek salvation outside yourself. Ask: What if it was always within?"
        ),
      ]
    ),

    // ═══════════════════════════════════════════════════════════════
    // MODULE 5: THE INNER TEMPLE
    // ═══════════════════════════════════════════════════════════════
    SerpentModule(
      id: "serpent5",
      number: 5,
      title: "The Inner Temple",
      subtitle: "Your body as the dwelling place of God",
      icon: "figure.mind.and.body",
      lessons: [
        SerpentLesson(
          id: "s5_1",
          title: "The Spine and the Pole",
          content: """
            **Now we go where most won't follow.**

            But if you're still here, you're ready. Because what I'm about to show you will connect:
            - The serpent of Genesis
            - The bronze serpent of Moses  
            - The risen Christ

            Into one unified mystery. The mystery of the inner tree. The mystery of the serpent rising within the body.

            **The Spine**

            In the biblical tradition, the spine isn't just bone.

            Moses lifted the serpent **on a pole** in the wilderness.
            Jesus was lifted **on the cross**—the tree, the pole—at Golgotha.
            Paul said: "**Your body is the temple of God**" (1 Corinthians 6:19).

            Both are symbols of the same thing: **The central channel within the human body through which divine energy rises.**

            **The Tree of Life Revealed**

            The Tree of Life in Genesis wasn't just a literal tree. It was a symbol of the human body as the dwelling place of God.

            The Kabbalistic Tree of Life—rooted in Hebrew mysticism—maps the soul. It has 10 Sephirot (emanations of divine energy) arranged along three pillars.

            The central pillar is called the **Pillar of Balance**. It runs from:
            - **Malkuth** at the base (the Kingdom, the physical realm)
            - Up through the center
            - To **Keter** at the crown (union with God)

            Sound familiar?

            🔥 **The central pillar is the spine. The Sephirot are the energy centers. The journey from Malkuth to Keter is the ascent of consciousness from the base of the spine to the crown of the head.**
            """,
          keyInsight:
            "The Tree of Life is a map of the human body. The central pillar is the spine. The journey is the ascent of consciousness.",
          practice:
            "Sit with awareness at the base of your spine. Breathe. Notice any sensation. This is where the journey begins."
        ),

        SerpentLesson(
          id: "s5_2",
          title: "What Moses and Jesus Knew",
          content: """
            **This is Hebrew mysticism.**

            This is what Moses knew.
            This is what Jesus embodied.
            This is what the church suppressed.

            **Look at the Garden Again**

            The Tree of Life was "in the midst of the garden"—in the center, at the axis. And the serpent was there to activate the knowledge that would set the ascent in motion.

            The serpent didn't deceive Eve. **The serpent initiated her.**

            It whispered: "You can ascend. You can know. You can be like God."

            But humanity descended into duality before it could ascend in unity. So the Tree of Life was guarded.

            Genesis 3:24: "So he drove out the man, and he placed cherubim at the east of the garden of Eden, and a flaming sword which turned every way, **to guard the way to the tree of life**."

            The way to the Tree of Life was blocked.

            Not forever. But **until humanity was ready**. Until the Christ came.

            **The Living Tree**

            And Jesus was the first to fully activate the serpent power **in unity with God**. To raise the divine fire from base to crown without ego, without distortion, without separation.

            He became the **living Tree of Life**—the axis between heaven and earth.

            When he said in John 14:6, "I am the way, the truth, and the life. No one comes to the Father except through me"—he wasn't saying you must worship him as an external figure.

            **He was saying: "I am the path. I am the way the inner tree is activated. I am the consciousness that ascends."**

            🔥 **And unless you awaken the Christ within you, unless you activate the serpent within you, you cannot reach the Father.**
            """,
          keyInsight:
            "Jesus embodied the fully activated Tree of Life. 'I am the way' means: the path of inner ascent that he demonstrated is the path.",
          practice:
            "Re-read John 14:6. Instead of 'only through worshipping Jesus,' read it as 'only through the path of inner ascent he demonstrated.'"
        ),

        SerpentLesson(
          id: "s5_3",
          title: "The Temple Is Your Body",
          content: """
            **Paul said it clearly:**

            1 Corinthians 3:16: "Do you not know that **you are the temple of God**, and that the Spirit of God dwells **in you**?"

            Not in a building. In you.

            The temple is your body.
            The holy of holies is your crown.
            The serpent is the divine fire rising to meet it.

            **The Structure:**
            - The serpent at the base
            - The tree in the center (spine)
            - The crown at the top

            This is the human being as the temple of God.

            **What This Means**

            Jesus embodied this fully.
            Moses pointed to it.
            Paul taught it.
            The early mystics lived it.
            And the church erased it.

            **The Divine Fire**

            This energy—this divine fire rising through the spine—has been known across traditions:

            In the East, it's called Kundalini: the coiled serpent at the base of the spine.

            But this is not borrowed from Hinduism. **This is what the Hebrews knew first.** This is what the early Christians practiced before the councils banned it.

            The serpent was never the enemy.
            The serpent was always the power sleeping within you.
            The power waiting to rise.
            The power that unites you with God.

            🔥 **And this is where everything flips. The serpent at the base. The tree in the center. The crown at the top. This is who you really are.**
            """,
          keyInsight:
            "Your body is the temple. The serpent is the divine fire at the base. The spine is the tree. The crown is union with God.",
          practice:
            "Place one hand on your lower belly, one on your crown. Breathe. Feel the axis. You are the temple."
        ),
      ]
    ),

    // ═══════════════════════════════════════════════════════════════
    // MODULE 6: THE AWAKENING
    // ═══════════════════════════════════════════════════════════════
    SerpentModule(
      id: "serpent6",
      number: 6,
      title: "The Awakening",
      subtitle: "Remembering who you really are",
      icon: "sunrise.fill",
      lessons: [
        SerpentLesson(
          id: "s6_1",
          title: "The Secret Hidden for 2,000 Years",
          content: """
            **Let me bring it all together.**

            Jesus did not come to condemn the serpent. He came to **reveal its true meaning**.

            He came to show you that:
            - The serpent is not your enemy
            - The serpent is the inner power of awakening
            - The divine fire that sleeps at the base of your being
            - Waiting to rise
            - Waiting to unite you with the Father

            **The fall was not a curse.** The fall was the descent of consciousness into duality—so it could learn, grow, and choose to return.

            **The serpent was not the deceiver.** The serpent was the initiator—the one who set the journey in motion.

            **And Jesus, the Christ, was the fulfillment.** The one who completed the journey. The one who showed us the way back to the Tree of Life.

            **What Jesus Said About You**

            When he quoted Psalm 82:6 in John 10:34 and said, "Is it not written in your law, **'I said, you are gods'**?"—he was reminding you of who you are.

            Not fallen.
            Not broken.
            Not inherently sinful.

            But **divine**. Created in the image of God. Carrying within you the same power, the same light, the same Christ consciousness he embodied.

            🔥 **Your heart recognizes this. Because it's truth.**
            """,
          keyInsight:
            "Jesus quoted 'you are gods' to remind you of your true nature. You are divine, carrying the same consciousness he embodied.",
          practice:
            "Say aloud: 'I am made in the image of God. The power of Christ is within me.' Notice what arises."
        ),

        SerpentLesson(
          id: "s6_2",
          title: "The Two Lies",
          content: """
            **The serpent in Genesis said: "You will be like God."**

            And the church called that a lie.

            **But Jesus said: "You are gods."**

            And the church tried to explain it away.

            **Which one is the lie?**

            The serpent who told Eve she could awaken?
            Or the institution that told you you're too broken to know God without their permission?

            **What Was Really Suppressed**

            Jesus revealed the serpent as the symbol of inner transformation—the ascent of divine awareness within the human being.

            He pointed to the bronze serpent and said: "That's me."
            He was lifted up on the cross—the tree, the pole—just like the serpent in the wilderness.
            And he said: "When you look upon this, when you understand this, you will live."

            Not because of transactional atonement.
            But because **he showed you the way**.

            He showed you:
            - The serpent can be lifted
            - The divine fire can rise
            - You can return to the Father

            **What Was Lost**

            This is what was suppressed at Nicaea.
            In the burning of the Gnostic texts.
            In the Inquisition.
            In every act of control throughout history.

            They don't want you to know:
            - You carry the power within you
            - The serpent is not evil
            - The kingdom is within you

            🔥 **Because if you knew, you would never need them again.**
            """,
          keyInsight:
            "Both the serpent and Jesus said the same thing: 'You can be like God.' Only one was called a lie. Ask why.",
          practice:
            "Write down three things you were taught about your 'fallen nature.' Question each one. What if they were control mechanisms?"
        ),

        SerpentLesson(
          id: "s6_3",
          title: "Your Declaration",
          content: """
            **So the real question is not what happened in Eden.**

            The real question is: **What is happening inside you right now?**

            Is the serpent stirring?
            Is the inner voice whispering: "You are more than you've been told"?
            Is the divine fire beginning to rise?

            **And why does the church work so hard to keep you afraid of what God placed within you?**

            **Something in you always knew this.**

            Something in you has been waiting for permission to remember.

            **This is that permission.**

            You are not fallen.
            You are descending and ascending.
            You are not broken.
            You are being refined.
            You are not separate from God.
            You forgot—and now you are remembering.

            **The Real Declaration**

            Say this—not to an institution, but to yourself and to the divine:

            "I am waking up.
            The serpent within me is not my enemy.
            The Christ within me is rising.
            The kingdom of God is within me.
            I am made in the image of the divine.
            I need no permission to know God.
            I am a conscious son/daughter of the Most High.
            **I remember.**"

            🔥 **Go. Walk as the awakened one. Walk as the one who knows. Walk as the serpent lifted up, shining with the glory of the Father. The kingdom is within you. The Christ is within you. The power is within you. Remember.**
            """,
          keyInsight:
            "This is your permission to remember. The serpent is not your enemy. The kingdom is within you. You are waking up.",
          practice:
            "Speak the declaration aloud. Not once—daily. Until it moves from words to knowing."
        ),
      ]
    ),
  ]
}

// MARK: - Models

struct SerpentModule: Identifiable {
  let id: String
  let number: Int
  let title: String
  let subtitle: String
  let icon: String
  let lessons: [SerpentLesson]
}

struct SerpentLesson: Identifiable {
  let id: String
  let title: String
  let content: String
  let keyInsight: String
  let practice: String
}
