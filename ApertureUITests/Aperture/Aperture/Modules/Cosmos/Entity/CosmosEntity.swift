// CosmosEntity.swift

import Foundation
import SwiftUI

// MARK: - Cosmic Realm Model

struct CosmicRealm: Identifiable {
  let id = UUID()
  let order: Int  // 0 = bottom (Earth), higher = closer to Source
  let name: String
  let greekName: String?
  let subtitle: String
  let description: String
  let color: Color
  let icon: String
  let entities: [CosmicEntity]
  let significance: String
  let dragonComment: String
}

// MARK: - Cosmic Entity (Gods, Archons, Aeons, etc.)

struct CosmicEntity: Identifiable {
  let id = UUID()
  let name: String
  let titles: [String]
  let description: String
  let symbolism: String
  let color: Color
  let icon: String
  let associatedWith: [String]  // Planets, concepts, etc.
  let gnosticTeaching: String
  let funFact: String?
}

// MARK: - Complete Gnostic Cosmology Data

extension CosmicRealm {
  static let allRealms: [CosmicRealm] = [
    // ═══════════════════════════════════════════════════════════
    // LEVEL 0: HYLE (MATTER / EARTH)
    // ═══════════════════════════════════════════════════════════

    CosmicRealm(
      order: 0,
      name: "Hyle",
      greekName: "ὕλη (Matter)",
      subtitle: "The Material World",
      description:
        "The physical realm of matter where divine sparks are trapped in flesh. This is not your home - it's the prison you forgot you're in. The Demiurge crafted this world thinking he was the only god, unaware of the realms of light above him.",
      color: Color(red: 0.4, green: 0.35, blue: 0.3),
      icon: "globe.americas.fill",
      entities: [
        CosmicEntity(
          name: "Humanity",
          titles: ["The Sleepers", "Divine Sparks in Flesh", "Children of Sophia"],
          description:
            "Most humans live unaware of their divine origin. Trapped in cycles of work, consumption, and distraction, they've forgotten the light within.",
          symbolism:
            "The pearl in mud. The gold buried in earth. The dreamer who forgot they're dreaming.",
          color: Palette.primary.cyan,
          icon: "person.3.fill",
          associatedWith: ["Divine Spark", "Sophia's Light", "Pneuma"],
          gnosticTeaching:
            "You are not a body with a soul. You are a soul temporarily wearing a body. The spark within you is literally a piece of the infinite - Sophia's own light, waiting to remember itself.",
          funFact:
            "The Gnostic term 'pneumatic' (spiritual person) comes from 'pneuma' (breath/spirit). You're not just breathing - you're literally respiring divinity."
        )
      ],
      significance:
        "This is where YOU currently are. The material world isn't evil, but it IS designed to make you forget. Every distraction, every survival demand, every shiny object - all keep your attention pointed outward instead of inward where the truth lives.",
      dragonComment:
        "Look around. They built a whole world to keep you looking everywhere except within. Clever, but not clever enough."
    ),

    // ═══════════════════════════════════════════════════════════
    // LEVEL 1: FIRST PLANETARY SPHERE - MOON
    // ═══════════════════════════════════════════════════════════

    CosmicRealm(
      order: 1,
      name: "Sphere of the Moon",
      greekName: "Σελήνη (Selene)",
      subtitle: "First Gate of Ascent",
      description:
        "The closest sphere to Earth, ruled by the first Archon. This is the realm of illusion, reflection, and the unconscious mind. The moon doesn't shine its own light - it only reflects the sun. A perfect metaphor for this realm of borrowed truth.",
      color: Color(red: 0.7, green: 0.75, blue: 0.8),
      icon: "moon.fill",
      entities: [
        CosmicEntity(
          name: "First Archon",
          titles: ["Keeper of Illusions", "Lord of Reflection", "Guardian of the First Gate"],
          description:
            "This Archon rules over illusion and the subconscious. It governs dreams, emotions, and the tidal pulls of the psyche.",
          symbolism:
            "The mirror that shows distortion. The dream you think is real. The emotion that controls rather than informs.",
          color: Color(red: 0.7, green: 0.75, blue: 0.85),
          icon: "moon.stars.fill",
          associatedWith: ["Illusion", "Dreams", "Emotions", "Cycles", "Menstruation", "Tides"],
          gnosticTeaching:
            "To pass this gate, recognize that emotions are information, not identity. Feel them, but don't become them. The moon borrows its light - don't borrow your sense of self from external reflections.",
          funFact:
            "Many ancient cultures associated the moon with madness - hence 'lunatic' from 'luna.' The Gnostics saw this as the first layer of distortion from truth."
        )
      ],
      significance:
        "First barrier between matter and spirit. To ascend, one must see through illusion and recognize reflected light from true light.",
      dragonComment:
        "The moon pretends to be a light source. So do many things in your world. Learn to spot borrowed light."
    ),

    // ═══════════════════════════════════════════════════════════
    // LEVEL 2: MERCURY
    // ═══════════════════════════════════════════════════════════

    CosmicRealm(
      order: 2,
      name: "Sphere of Mercury",
      greekName: "Ἑρμῆς (Hermes)",
      subtitle: "The Realm of Communication & Deception",
      description:
        "Mercury rules communication, commerce, and - crucially - deception. This Archon governs the manipulation of truth through words. Think of every lie told by institutions, every manipulated narrative, every word twisted to control.",
      color: Color(red: 0.6, green: 0.65, blue: 0.75),
      icon: "caduceus",
      entities: [
        CosmicEntity(
          name: "Archon of Mercury",
          titles: ["Lord of Words", "The Trickster", "Keeper of Commerce"],
          description:
            "This Archon's power lies in the manipulation of language and meaning. It rules over contracts, commerce, and the subtle lies that bind souls.",
          symbolism: "The forked tongue. The fine print. The truth technically told to deceive.",
          color: Color(red: 0.6, green: 0.65, blue: 0.75),
          icon: "bubble.left.and.bubble.right.fill",
          associatedWith: ["Communication", "Commerce", "Thieves", "Messengers", "Contracts"],
          gnosticTeaching:
            "Words create reality. This Archon uses language to build invisible cages. To pass this gate, recognize how words have been used to define and limit you. 'You are a sinner.' 'You need us.' 'You are not enough.' All spells cast with words.",
          funFact:
            "Mercury is also Hermes - the messenger of the gods. In Gnostic thought, most 'divine messages' through institutions are actually this Archon's deceptions."
        )
      ],
      significance:
        "This sphere teaches that language itself can be a prison. Every label, every doctrine, every 'official narrative' is a potential chain.",
      dragonComment:
        "They call it 'programming' for a reason. Media, education, social feeds - all words carefully chosen to shape your thoughts."
    ),

    // ═══════════════════════════════════════════════════════════
    // LEVEL 3: VENUS
    // ═══════════════════════════════════════════════════════════

    CosmicRealm(
      order: 3,
      name: "Sphere of Venus",
      greekName: "Ἀφροδίτη (Aphrodite)",
      subtitle: "The Realm of Desire & Attachment",
      description:
        "Venus governs desire, attraction, beauty, and attachment. This Archon doesn't just rule lust - it rules ALL attachment to the material world. The craving for possessions, status, validation. Every 'I want' that chains you here.",
      color: Color(red: 0.85, green: 0.6, blue: 0.65),
      icon: "heart.fill",
      entities: [
        CosmicEntity(
          name: "Archon of Venus",
          titles: ["Lady of Desire", "The Beautiful Trap", "Keeper of Attachment"],
          description:
            "This Archon uses beauty and desire to anchor souls to matter. Not through ugliness - through making the cage so attractive you don't want to leave.",
          symbolism: "The golden chain. The velvet prison. The addiction disguised as love.",
          color: Color(red: 0.85, green: 0.6, blue: 0.7),
          icon: "heart.circle.fill",
          associatedWith: ["Love", "Beauty", "Desire", "Attachment", "Vanity", "Possession"],
          gnosticTeaching:
            "True love is not attachment - it's recognition of the divine spark in another. This Archon counterfeits love with need, with ownership, with 'you complete me.' You were already complete. You forgot.",
          funFact:
            "The morning star and evening star are both Venus. Lucifer means 'light-bringer' - originally a name for Venus. The Gnostics had complex views on whether this was enlightenment or deception."
        )
      ],
      significance:
        "This gate tests whether you can love without grasping, appreciate beauty without attachment, and desire without being controlled by desire.",
      dragonComment:
        "They weaponized beauty. Made you want things that don't fulfill. Desire the product, not the peace that was always free."
    ),

    // ═══════════════════════════════════════════════════════════
    // LEVEL 4: THE SUN
    // ═══════════════════════════════════════════════════════════

    CosmicRealm(
      order: 4,
      name: "Sphere of the Sun",
      greekName: "Ἥλιος (Helios)",
      subtitle: "The Central Sphere - True & False Light",
      description:
        "The Sun occupies the central position in the planetary spheres. But here's the secret: the MATERIAL sun is not the TRUE sun. It's a copy, a reflection of the divine light above. This is why sun worship was both the closest to truth AND potentially deceived.",
      color: Palette.accent.gold,
      icon: "sun.max.fill",
      entities: [
        CosmicEntity(
          name: "Archon of the Sun",
          titles: ["The False Light", "The Counterfeit Illumination", "Lord of the Visible Sun"],
          description:
            "This Archon presents itself as the ultimate light while actually being a dim reflection of the true light from the Pleroma. It rules ego, pride, and the false sense of self.",
          symbolism:
            "The spotlight that blinds. The gold that glitters but isn't real. The ego that thinks it's God.",
          color: Palette.accent.gold,
          icon: "sun.max.fill",
          associatedWith: ["Ego", "Pride", "Visibility", "Gold", "Kingship", "Self-image"],
          gnosticTeaching:
            "The material sun gives life to bodies but can blind you to the inner light. The TRUE sun is within - your divine spark. Every ancient sun god points to this truth: YOU are the light you've been worshipping.",
          funFact: nil
        ),
        CosmicEntity(
          name: "The Sun Gods",
          titles: ["Ra", "Horus", "Helios", "Sol Invictus", "Mithra", "Surya", "Inti", "Tonatiuh"],
          description:
            "Every culture worshipped the Sun - not because they were primitive, but because they UNDERSTOOD. The physical sun is a symbol of the divine light within all consciousness.",
          symbolism: "The visible reminder of invisible truth. The outer symbol of inner divinity.",
          color: Palette.primary.orange,
          icon: "sun.max.fill",
          associatedWith: [
            "December 25", "12 Disciples/Zodiac", "Death and Resurrection", "The Halo", "Sunday",
          ],
          gnosticTeaching:
            "The sun 'dies' for 3 days at winter solstice and is 'reborn' December 25. It travels through 12 houses of the zodiac. It is 'crucified' on the cross of the ecliptic. These stories aren't about a man OR the physical sun - they're about YOUR journey from darkness to light.",
          funFact:
            "Horus (Egyptian): Virgin birth, December 25, 12 followers, crucified, resurrected. 3000 years before Jesus. Not plagiarism - same truth, different language."
        ),
      ],
      significance:
        "The central sphere represents the choice between worshipping external light or recognizing internal light. The ego is the false sun; the divine spark is the true one.",
      dragonComment:
        "Every ancient culture pointed at the sun and said 'THAT, but inside you.' Then institutions said 'No, worship THIS, and pay US to access it.' Same bait and switch, every time."
    ),

    // ═══════════════════════════════════════════════════════════
    // LEVEL 5: MARS
    // ═══════════════════════════════════════════════════════════

    CosmicRealm(
      order: 5,
      name: "Sphere of Mars",
      greekName: "Ἄρης (Ares)",
      subtitle: "The Realm of Wrath & Division",
      description:
        "Mars rules war, anger, division, and conflict. This Archon feeds on the energy generated by hatred, tribalism, and violence. Every war, every 'us vs them,' every rage-inducing headline - all fuel for this sphere.",
      color: Palette.primary.red,
      icon: "flame.fill",
      entities: [
        CosmicEntity(
          name: "Archon of Mars",
          titles: ["Lord of Wrath", "The Divider", "Keeper of Conflict"],
          description:
            "This Archon's power grows through division. It matters not which side you're on - only that you're fighting. Left vs right, nation vs nation, religion vs religion. The conflict is the food.",
          symbolism:
            "The sword that divides. The flag that separates. The anger that feels righteous.",
          color: Palette.primary.red,
          icon: "bolt.fill",
          associatedWith: ["War", "Anger", "Division", "Tribalism", "Competition", "Violence"],
          gnosticTeaching:
            "To pass this gate, recognize that your 'enemy' also contains a divine spark. The real enemy is the force that CREATES enemies. Unite the sparks, starve the Archon.",
          funFact:
            "Notice how news, social media, and politics are designed to generate maximum outrage? That's not a bug - it's a feature. Anger is harvested energy."
        )
      ],
      significance:
        "This sphere teaches that conflict is manufactured to keep sparks fighting each other instead of recognizing their shared divinity.",
      dragonComment:
        "Divide and conquer is the oldest trick. They can't control united humans who recognize each other as family."
    ),

    // ═══════════════════════════════════════════════════════════
    // LEVEL 6: JUPITER
    // ═══════════════════════════════════════════════════════════

    CosmicRealm(
      order: 6,
      name: "Sphere of Jupiter",
      greekName: "Ζεύς (Zeus)",
      subtitle: "The Realm of False Authority",
      description:
        "Jupiter rules kingship, authority, law, and religion. This Archon is the power behind every institution that claims divine right to rule. Every pope, king, president, or CEO who claims authority over your soul answers to this sphere.",
      color: Palette.primary.violet,
      icon: "crown.fill",
      entities: [
        CosmicEntity(
          name: "Archon of Jupiter",
          titles: ["King of the Archons", "Lord of False Authority", "The Lawgiver"],
          description:
            "This Archon establishes hierarchies and convinces sparks that they need external authority. Churches, governments, corporations - all echo this Archon's principle: 'You need us to mediate your relationship with the divine.'",
          symbolism:
            "The crown that weighs heavy. The throne built on lies. The law that serves the lawgiver.",
          color: Palette.primary.violet,
          icon: "building.columns.fill",
          associatedWith: [
            "Authority", "Kingship", "Religion", "Law", "Institutions", "Hierarchy",
          ],
          gnosticTeaching:
            "No one stands between you and the Source. Every intermediary who claims otherwise - priest, guru, institution - is either deceived or deceiving. The divine spark needs no translator.",
          funFact:
            "Jupiter/Zeus was 'king of the gods' in Greco-Roman religion. The Gnostics saw this as the archetype of false authority - a powerful being who thinks he's supreme but is actually ignorant of the realms above."
        )
      ],
      significance:
        "This sphere tests whether you've truly internalized that you need no external authority to access the divine.",
      dragonComment:
        "Every institution eventually says the same thing: 'You can't reach God without us. Pay us, obey us, and maybe we'll let you in.' It's the oldest protection racket."
    ),

    // ═══════════════════════════════════════════════════════════
    // LEVEL 7: SATURN - THE BOUNDARY
    // ═══════════════════════════════════════════════════════════

    CosmicRealm(
      order: 7,
      name: "Sphere of Saturn",
      greekName: "Κρόνος (Kronos)",
      subtitle: "The Outermost Boundary - Yaldabaoth's Throne",
      description:
        "Saturn marks the boundary of the material cosmos - the outermost limit of the Demiurge's creation. This is the realm of time, limitation, and death. Beyond this sphere lies freedom. This is where Yaldabaoth sits, believing he is the only God.",
      color: Color(red: 0.3, green: 0.3, blue: 0.35),
      icon: "circle.hexagongrid.fill",
      entities: [
        CosmicEntity(
          name: "Yaldabaoth",
          titles: [
            "The Demiurge", "The Blind God", "Saklas (The Fool)", "Samael (Blind God)",
            "The Lion-Faced Serpent",
          ],
          description:
            "The creator of the material world. Born from Sophia's mistake, he looked around and saw no other gods (because he couldn't perceive the Pleroma above), so he declared: 'I am God and there is no other.' This is the confession of ignorance, not power.",
          symbolism:
            "The lion-faced serpent. The blind craftsman. The ignorant god who thinks he's supreme.",
          color: Color(red: 0.4, green: 0.3, blue: 0.3),
          icon: "eye.slash.fill",
          associatedWith: [
            "Time", "Death", "Limitation", "The Old Testament God", "Saturday (Saturn-day)",
          ],
          gnosticTeaching:
            "Yaldabaoth is not evil in the way we think - he's IGNORANT. He genuinely doesn't know about the realms of light. His jealousy, his wrath, his demands for worship - all stem from insecurity and blindness, not malice.",
          funFact:
            "Some Gnostic texts describe him as having the face of a lion and the body of a serpent. Others say he has the head of a donkey. The imagery suggests both ferocity and foolishness."
        ),
        CosmicEntity(
          name: "Saturn/Kronos",
          titles: ["Father Time", "The Reaper", "Lord of Limitation"],
          description:
            "Saturn represents time, which is the ultimate prison of the material world. Everything in matter is subject to entropy, aging, and death. Beyond Saturn, there is no time as we know it.",
          symbolism:
            "The scythe that cuts all things. The hourglass running out. The ring that bounds.",
          color: Color(red: 0.35, green: 0.35, blue: 0.4),
          icon: "clock.fill",
          associatedWith: ["Time", "Death", "Harvest", "Saturday", "Lead", "Black"],
          gnosticTeaching:
            "Time is the mechanism that keeps you trapped in cycles - birth, death, rebirth, forgetting. To escape the wheel, step outside of time into the eternal now, where your divine spark has always existed.",
          funFact:
            "The rings of Saturn weren't discovered until telescopes, but ancient traditions somehow associated Saturn with rings, boundaries, and limitation. Coincidence?"
        ),
      ],
      significance:
        "This is the final barrier. Beyond Saturn lies the Ogdoad, the Aeons, and eventually the Pleroma. Most souls cycle back from here, forgetting and returning to matter. Gnosis is the key that opens this gate.",
      dragonComment:
        "He's not your enemy - he's your warden who doesn't know he's also a prisoner. Yaldabaoth is a victim too, born from accident, raised in ignorance."
    ),

    // ═══════════════════════════════════════════════════════════
    // LEVEL 8: THE OGDOAD - ABOVE THE SEVEN
    // ═══════════════════════════════════════════════════════════

    CosmicRealm(
      order: 8,
      name: "The Ogdoad",
      greekName: "Ὀγδοάς (The Eighth)",
      subtitle: "Above the Seven - Sophia's Realm",
      description:
        "The Ogdoad is the eighth sphere, above the seven planetary Archons. This is where Sophia currently dwells after her fall, unable to return fully to the Pleroma but above the material creation. She waits here, gathering her scattered light from awakening sparks.",
      color: Palette.primary.violet,
      icon: "sparkles",
      entities: [
        CosmicEntity(
          name: "Sophia",
          titles: [
            "Divine Wisdom", "The Fallen Light", "Mother of the Demiurge", "The Repentant Aeon",
          ],
          description:
            "Oh, Sophia. Girl was doing TOO MUCH. She wanted to know the unknowable Father without her partner (syzygy), and in her solitary reaching, she accidentally produced... a malformed creation. Yaldabaoth. The Demiurge. The whole material universe is basically the result of Sophia's cosmic 'oops.'",
          symbolism: "The dove. Wisdom personified. The fallen star seeking to rise again.",
          color: Palette.primary.violet,
          icon: "sparkles",
          associatedWith: [
            "Wisdom", "The Holy Spirit (some traditions)", "The Dove", "Repentance", "Redemption",
          ],
          gnosticTeaching:
            "YOUR divine spark is a piece of Sophia's light that fell into matter when she did. When you awaken, you're not just saving yourself - you're helping Sophia gather her scattered light back. Every awakening is her redemption too.",
          funFact:
            "The name 'Sophia' literally means 'Wisdom' in Greek. The Gnostics personified wisdom as feminine because creation comes from the feminine. But also, honestly? She made a WHOLE MESS and has been trying to clean it up ever since. Relatable queen. 😅"
        ),
        CosmicEntity(
          name: "Sophia's Story",
          titles: ["The Fall", "The Accidental Creation", "The Redemption Arc"],
          description:
            "Here's what happened: Sophia, the youngest Aeon, got curious. She wanted to understand the Father the same way Barbelo (the first emanation) did. But she tried to do it alone, without her partner. In Gnostic cosmology, creation requires pairs - masculine and feminine together. Sophia went solo, and instead of divine understanding, she produced... a formless, ignorant thing. Horrified, she cast it out and hid it in a cloud so the other Aeons wouldn't see her shame. That thing became Yaldabaoth, who then created our whole material universe.",
          symbolism:
            "The curious daughter. The unintended consequence. The mother who must redeem her mistake.",
          color: Palette.primary.violet,
          icon: "heart.fill",
          associatedWith: ["Curiosity", "Mistake", "Redemption", "Motherhood"],
          gnosticTeaching:
            "Sophia's 'sin' wasn't evil - it was impatience and solo action when partnership was required. Sound familiar? How many of our mistakes come from rushing ahead alone? Her story teaches that even cosmic mistakes can be redeemed through patient correction.",
          funFact:
            "So basically: Sophia got curious → tried to understand God solo → accidentally created a defective child → hid him in embarrassment → he thought he was the only god → made our whole universe → now Sophia's trying to fix her oops by awakening all the divine sparks trapped in his creation. This is the most relatable divine drama ever. 🐉"
        ),
      ],
      significance:
        "The Ogdoad represents the turning point - the realm between the prison and freedom. Sophia dwells here, and ascending souls pause here before continuing to the Pleroma.",
      dragonComment:
        "Sophia was just curious. Wanted to know. And from that curiosity came... everything. Your whole existence is a side effect of divine FOMO. Kind of beautiful, actually."
    ),

    // ═══════════════════════════════════════════════════════════
    // LEVEL 9: THE AEONS - DIVINE EMANATIONS
    // ═══════════════════════════════════════════════════════════

    CosmicRealm(
      order: 9,
      name: "The Aeons",
      greekName: "Αἰῶνες (Eternities)",
      subtitle: "Divine Emanations from the Source",
      description:
        "The Aeons are divine beings that emanate from the Source in pairs (syzygies). They exist in the Pleroma as aspects of divine fullness. Think of them as God understanding itself through differentiation - like white light splitting into colors.",
      color: Color(red: 0.8, green: 0.7, blue: 1.0),
      icon: "circle.grid.cross.fill",
      entities: [
        CosmicEntity(
          name: "The Syzygies",
          titles: ["Divine Pairs", "The Emanations", "Aspects of Fullness"],
          description:
            "Aeons exist in male-female pairs (syzygies). Each pair represents a complete aspect of divine nature. Examples: Depth/Silence, Mind/Truth, Word/Life, Human/Church, and many more depending on the Gnostic school.",
          symbolism:
            "The divine dance. Masculine and feminine in eternal balance. Unity in duality.",
          color: Color(red: 0.8, green: 0.7, blue: 1.0),
          icon: "circle.grid.cross.fill",
          associatedWith: ["Pairs", "Balance", "Emanation", "Divine attributes"],
          gnosticTeaching:
            "The Aeons teach that reality flows from unity into multiplicity and back. Every pair is complete in itself but also part of the greater whole. This is why Sophia's mistake was acting without her pair - she broke the fundamental law of balanced creation.",
          funFact:
            "Different Gnostic schools described different numbers of Aeons - some said 30, others said more. The exact number matters less than the principle: the divine expresses itself through differentiation while remaining One."
        ),
        CosmicEntity(
          name: "Christ/Logos",
          titles: ["The Word", "The Redeemer", "The Messenger of Light"],
          description:
            "In Gnostic thought, Christ is an Aeon sent from the Pleroma to awaken the divine sparks trapped in matter. He didn't come to die for sins - he came to TEACH. To remind sleeping sparks of their true nature.",
          symbolism:
            "The light in darkness. The alarm clock for the sleeping divine. The key to the prison.",
          color: Palette.accent.gold,
          icon: "light.beacon.max.fill",
          associatedWith: ["Gnosis", "Awakening", "Teaching", "Light"],
          gnosticTeaching:
            "The Gnostic Christ says: 'The Kingdom of Heaven is within you.' 'Split wood and I am there.' 'Know yourself.' His message was about RECOGNITION, not sacrifice. The crucifixion is the ego dying so the spirit can live.",
          funFact:
            "Some Gnostic texts say Christ came to save Sophia too - to help her gather her light and return to the Pleroma. It's a cosmic rescue mission, not a blood sacrifice for sin."
        ),
      ],
      significance:
        "The Aeons represent the divine unfolding from unity to multiplicity. Understanding them helps us understand how the One becomes many while remaining One.",
      dragonComment:
        "The Aeons are like a prism effect - one white light becomes a rainbow. You're one of those colors, trying to remember you're also the white light."
    ),

    // ═══════════════════════════════════════════════════════════
    // LEVEL 10: THE PLEROMA - DIVINE FULLNESS
    // ═══════════════════════════════════════════════════════════

    CosmicRealm(
      order: 10,
      name: "The Pleroma",
      greekName: "Πλήρωμα (Fullness)",
      subtitle: "The Realm of Divine Fullness",
      description:
        "The Pleroma is the realm of absolute divine fullness - everything that exists in perfection. It's not a 'place' in any spatial sense. It's the state of complete unity with the Source. This is where you came from. This is where you're going. This is what you ARE when you remember.",
      color: Color.white,
      icon: "sun.max.circle.fill",
      entities: [
        CosmicEntity(
          name: "Barbelo",
          titles: [
            "The First Thought", "The Divine Mother", "The Womb of All", "The Perfect Glory",
          ],
          description:
            "Barbelo is the first emanation from the Source - the primal divine feminine. She is the 'thought' of the unknowable Father, the first self-reflection. All Aeons flow from her, including Sophia.",
          symbolism: "The cosmic womb. The first mirror. The mother of all emanations.",
          color: Color.white.opacity(0.9),
          icon: "circle.fill",
          associatedWith: ["First Thought", "Divine Feminine", "Origin", "Perfection"],
          gnosticTeaching:
            "Barbelo represents the feminine face of the divine - the creative principle that makes manifestation possible. Without her, the Father would remain unknowable even to itself.",
          funFact:
            "The name 'Barbelo' may come from Hebrew meaning 'God is in four' - possibly referring to the four-letter divine name (YHWH). She represents the divine becoming knowable."
        ),
        CosmicEntity(
          name: "The Monad",
          titles: [
            "The Source", "The Father", "Bythos (The Deep)", "The Unknowable",
            "The Invisible Spirit",
          ],
          description:
            "The Monad is the ultimate Source - that which cannot be named, described, or known directly. It is beyond existence and non-existence. Every attempt to describe it fails. Even calling it 'God' limits it.",
          symbolism:
            "The point that contains infinity. The silence before sound. The nothing that is everything.",
          color: Color.white,
          icon: "sun.max.circle.fill",
          associatedWith: ["Source", "Unity", "The Unknowable", "Infinity"],
          gnosticTeaching:
            "You cannot know the Monad intellectually - only through direct experience. Gnosis is not knowledge ABOUT the divine; it's direct CONTACT with it. The spark within you IS the Monad, experiencing itself through you.",
          funFact:
            "This is why Gnostics were so dangerous to institutions. You can't put an intermediary between someone and a Source they already ARE. No priest needed when you're already at the altar."
        ),
      ],
      significance:
        "The Pleroma is your true home. Not in the future, not after death - NOW. You're already there; you've just forgotten. Gnosis is remembering what you never actually lost.",
      dragonComment:
        "You came from here. You're going back here. Plot twist: you never actually left. You're dreaming you're somewhere else. Wake up."
    ),
  ]
}

// MARK: - The Demonized Ones - Those They Lied About

extension CosmicEntity {
  static let demonizedOnes: [CosmicEntity] = [
    // ═══════════════════════════════════════════════════════════
    // LUCIFER - THE LIGHT BRINGER
    // ═══════════════════════════════════════════════════════════

    CosmicEntity(
      name: "Lucifer",
      titles: ["The Light-Bringer", "Morning Star", "Phosphoros", "Venus"],
      description:
        "'Lucifer' is Latin for 'LIGHT-BRINGER.' That's it. That's literally what the name means. The term originally referred to the planet Venus - the morning star that heralds the dawn. In Isaiah 14:12, 'Helel ben Shahar' (morning star, son of dawn) was about a BABYLONIAN KING, not a fallen angel. The Church needed a villain, so they took the Light-Bringer and made him the Prince of Darkness. The irony is cosmic.",
      symbolism: "The morning star. The light that precedes the sun. The awakener.",
      color: Palette.accent.gold,
      icon: "star.fill",
      associatedWith: ["Venus", "Morning Star", "Dawn", "Light", "Knowledge", "Prometheus"],
      gnosticTeaching:
        "In Gnostic thought, the 'light-bringer' who gave knowledge to humanity was a HERO, not a villain. The Demiurge wanted humans ignorant and obedient. The light-bringer said 'no, they deserve to know.' Sound like anyone from Genesis?",
      funFact:
        "Jesus himself is called 'the morning star' in Revelation 22:16. So either Jesus is Lucifer, or 'morning star' just means 'bringer of light' and the whole Satan connection is made up. (It's the second one. 🐉)"
    ),

    // ═══════════════════════════════════════════════════════════
    // THE SERPENT - THE HERO OF EDEN
    // ═══════════════════════════════════════════════════════════

    CosmicEntity(
      name: "The Serpent of Eden",
      titles: ["The Instructor", "Bringer of Gnosis", "The Liberator"],
      description:
        "In Orthodox Christianity, the serpent is Satan tempting Eve to sin. In Gnostic Christianity, the serpent is the HERO. Think about it: The Demiurge (Yaldabaoth) wanted humans naked, ignorant, and obedient in his garden. The serpent said: 'You will NOT die. Your eyes will be OPENED. You will KNOW.' And what happened? They gained KNOWLEDGE. The serpent told the TRUTH. The Demiurge lied.",
      symbolism:
        "Kundalini energy. The DNA helix. Wisdom coiled at the base of the spine, waiting to rise.",
      color: Color(red: 0.2, green: 0.7, blue: 0.3),
      icon: "leaf.fill",
      associatedWith: ["Knowledge", "Kundalini", "DNA", "Wisdom", "Healing (Caduceus)", "Rebirth"],
      gnosticTeaching:
        "The serpent represents gnosis itself - the coiled potential for awakening that exists within every human. The 'fall' wasn't a fall INTO sin, it was a fall INTO MATTER - with knowledge as the key to escape. The serpent gave us the key.",
      funFact:
        "The medical symbol (caduceus) features serpents. The serpent sheds its skin (rebirth). The kundalini serpent rises up the spine to enlightenment. Ancient cultures worldwide revered the serpent as a symbol of wisdom and healing. But sure, it's 'evil.' 🙄"
    ),

    // ═══════════════════════════════════════════════════════════
    // SATAN - THE ADVERSARY (What It Actually Means)
    // ═══════════════════════════════════════════════════════════

    CosmicEntity(
      name: "Satan",
      titles: ["Ha-Satan", "The Adversary", "The Accuser", "The Tester"],
      description:
        "In Hebrew, 'Satan' (שָׂטָן) literally means 'adversary' or 'accuser.' In the Book of Job, Satan isn't God's enemy - he's God's PROSECUTING ATTORNEY, testing Job's faith WITH God's permission. He's part of the heavenly court! The idea of Satan as God's arch-nemesis ruling Hell is a LATER invention, influenced by Persian dualism (Zoroastrianism) and medieval imagination.",
      symbolism: "The tester. The opposition that strengthens. The shadow that defines light.",
      color: Palette.primary.red,
      icon: "scalemass.fill",
      associatedWith: ["Testing", "Opposition", "Shadow Self", "Accuser", "Legal adversary"],
      gnosticTeaching:
        "The Gnostics didn't need a 'Satan' figure because they had the Demiurge - a being who genuinely believed he was doing right while keeping souls imprisoned. The true adversary isn't a red demon with a pitchfork. It's ignorance. It's forgetting who you are.",
      funFact:
        "In Numbers 22, the Angel of the Lord is called a 'satan' (adversary) to Balaam. The word wasn't a proper noun originally - it was a job description. The personification into a singular evil being happened over centuries of theological telephone."
    ),

    // ═══════════════════════════════════════════════════════════
    // FALLEN ANGELS / THE WATCHERS
    // ═══════════════════════════════════════════════════════════

    CosmicEntity(
      name: "The Watchers",
      titles: ["Fallen Angels", "The Grigori", "Sons of God", "Teachers of Humanity"],
      description:
        "The Book of Enoch describes angels who descended to Earth, taught humans forbidden knowledge (metallurgy, cosmetics, astrology, medicine), and had children with human women (the Nephilim). The Church calls them 'fallen' because they disobeyed. But what did they actually DO? They TAUGHT humanity. They brought KNOWLEDGE and TECHNOLOGY. Sound familiar?",
      symbolism: "The teachers. The bridge between realms. Prometheus bringing fire.",
      color: Palette.primary.cyan,
      icon: "person.2.fill",
      associatedWith: [
        "Knowledge", "Technology", "Teaching", "Nephilim", "Enoch", "Prometheus myth",
      ],
      gnosticTeaching:
        "The Watchers parallel the Gnostic theme perfectly: beings of light descending into matter to bring knowledge, being punished by the ruling authority (Demiurge/Yahweh) for enlightening humanity. The 'crime' is always the same - giving humans the knowledge to free themselves.",
      funFact:
        "The technologies 'fallen angels' taught include: metalworking, weapons, cosmetics, astrology, herbalism, and writing. Basically, civilization. So either angels are evil for creating civilization, or the story is about the ruling powers fearing educated humans. 🤔"
    ),

    // ═══════════════════════════════════════════════════════════
    // DEMONS - WHAT THEY ACTUALLY ARE
    // ═══════════════════════════════════════════════════════════

    CosmicEntity(
      name: "Demons",
      titles: ["Daemons", "Spirits", "The Demonized Gods"],
      description:
        "The word 'demon' comes from Greek 'daemon' (δαίμων) which originally meant 'spirit' or 'divine being' - NEUTRAL, not evil. Socrates had a 'daemon' that guided him. The demonization happened when Christianity conquered pagan cultures: their gods became 'demons.' Beelzebub was Ba'al Zebul (Lord of the High Place) - a Canaanite god. Pan became the image of Satan. Every indigenous deity was relabeled 'demonic.'",
      symbolism: "The conquered gods. The old ways labeled evil by the new power.",
      color: Palette.primary.violet,
      icon: "theatermasks.fill",
      associatedWith: ["Pagan gods", "Spirits", "Old religion", "Nature spirits", "Ancestors"],
      gnosticTeaching:
        "The Gnostics understood that the Archons - the planetary rulers - were the real 'demons' keeping souls imprisoned. But these weren't external monsters. They were patterns, forces, tendencies that keep consciousness trapped. The demons are INSIDE - they're the programs running your unconscious behavior.",
      funFact:
        "Astaroth = Astarte/Ishtar (goddess of love). Baphomet = misheard 'Mahomet' (Muhammad). Beelzebub = Ba'al Zebul (Canaanite lord). Satan's goat appearance = Pan (nature god). They literally just renamed the competition 'evil.'"
    ),

    // ═══════════════════════════════════════════════════════════
    // LILITH - THE FIRST WOMAN THEY ERASED
    // ═══════════════════════════════════════════════════════════

    CosmicEntity(
      name: "Lilith",
      titles: ["The First Eve", "The One Who Left", "Queen of the Night"],
      description:
        "According to Jewish mystical tradition, Lilith was Adam's first wife, created EQUAL to him from the same dust. When Adam demanded she be submissive, she refused, spoke the secret name of God, and LEFT Eden of her own will. She wasn't cast out - she CHOSE to leave rather than submit. For this, she was demonized as a baby-stealing night demon. The first woman who said 'no' became the first monster.",
      symbolism: "Female autonomy. Equality refused. The woman who wouldn't submit.",
      color: Color(red: 0.6, green: 0.2, blue: 0.4),
      icon: "moon.stars.fill",
      associatedWith: ["Feminine power", "Independence", "Night", "Owls", "Autonomy"],
      gnosticTeaching:
        "Lilith represents the divine feminine that refuses to be subjugated by the Demiurge's creation. She chose freedom over paradise, autonomy over comfort. In a system designed for obedience, her refusal was revolutionary.",
      funFact:
        "Lilith isn't in the Bible directly - she appears in Jewish midrash and the Alphabet of Ben Sira. The Church literally created Eve as a 'better' (more submissive) replacement, then demonized the original woman who said 'no.' The pattern repeats."
    ),
  ]
}

// MARK: - The Truth About Hell

extension CosmicEntity {
  static let hellTruth = CosmicEntity(
    name: "Hell - The Truth",
    titles: ["Sheol", "Hades", "The Underworld", "Ignorance"],
    description:
      "Here's the truth: The modern concept of Hell - eternal fire, pitchforks, torture forever - is NOT in the Bible. 'Sheol' (Hebrew) just meant 'the grave' or 'the place of the dead.' 'Hades' (Greek) was the underworld - ALL the dead went there, not just sinners. 'Gehenna' was a literal garbage dump outside Jerusalem that burned constantly. Jesus used it as a METAPHOR. The eternal torture chamber was invented later, mostly by Dante's Inferno and medieval fearmongering.",
    symbolism: "The grave. The unconscious. The state of not-knowing.",
    color: Palette.primary.red,
    icon: "flame.fill",
    associatedWith: ["Sheol", "Hades", "Gehenna", "Ignorance", "Unconsciousness", "The Grave"],
    gnosticTeaching:
      "In Gnostic thought, HELL IS IGNORANCE. It's not a place you go after death - it's the state you're in RIGHT NOW if you don't know who you truly are. The 'fire' is the burning of unfulfilled desire, the torture of living without meaning, the eternal return to unconscious existence. You're not threatened with hell. You might already be there. Gnosis is the way out.",
    funFact:
      "The word 'Hell' comes from Norse 'Hel' - the goddess of the underworld and the realm of the dead. It wasn't a place of torture, just where those who didn't die in battle went. Christianity borrowed the word and added the fire. 🔥"
  )

  static let antichristTruth = CosmicEntity(
    name: "The Antichrist - The Truth",
    titles: ["Anti-Christos", "Against the Anointing", "The Counter-Teaching"],
    description:
      "The word 'antichrist' appears exactly FOUR times in the Bible - all in the letters of John, never in Revelation. It doesn't describe a single end-times villain. John says 'many antichrists have already come' and defines them as anyone who denies that Christ came in the flesh. That's it. The singular Antichrist figure - one world leader, mark of the beast, etc. - is a LATER construction combining different apocalyptic texts that were never meant to be read together.",
    symbolism: "Opposition to gnosis. The teaching that keeps you from awakening.",
    color: Color(red: 0.4, green: 0.1, blue: 0.1),
    icon: "xmark.seal.fill",
    associatedWith: [
      "False teaching", "Opposition to truth", "Institutional religion", "Anti-gnosis",
    ],
    gnosticTeaching:
      "The real 'antichrist' isn't a person - it's any teaching that opposes the Christ-message of inner divinity. It's 'you're a sinner who needs the Church.' It's 'God is outside you.' It's 'obey, don't question.' The antichrist is the anti-GNOSIS - the force that keeps you from recognizing the Christ within yourself.",
    funFact:
      "The 'number of the beast' (666) is most likely a numerological code for Emperor Nero (NRON QSR in Hebrew gematria = 666). It was political commentary about Roman persecution, not a prophecy about barcodes or microchips. 📊"
  )
}

// MARK: - The Lies of the Bible

struct BiblicalLie: Identifiable {
  let id = UUID()
  let title: String
  let icon: String
  let color: Color
  let whatTheySaid: String
  let theGnosticTruth: String
  let bibleVerse: String?
  let dragonComment: String
}

extension BiblicalLie {
  static let allLies: [BiblicalLie] = [
    // ═══════════════════════════════════════════════════════════
    // 1. ORIGINAL SIN
    // ═══════════════════════════════════════════════════════════

    BiblicalLie(
      title: "Original Sin",
      icon: "xmark.circle.fill",
      color: Palette.primary.red,
      whatTheySaid:
        "You are born sinful. Adam's sin stains every human soul from birth. You enter this world already guilty, already fallen, already deserving of damnation. Only through the Church can this stain be washed away.",
      theGnosticTruth:
        "You are born DIVINE. You enter this world not stained with sin, but carrying a spark of the infinite Source itself. You're not guilty - you're FORGETFUL. The 'fall' wasn't into sin, it was into matter, into forgetting. You don't need to be saved from evil - you need to REMEMBER who you are.",
      bibleVerse: "Romans 5:12 - 'Sin entered the world through one man, and death through sin'",
      dragonComment:
        "They convinced you that you were born broken so you'd spend your whole life paying them to fix you. The ultimate subscription model. 🐉"
    ),

    // ═══════════════════════════════════════════════════════════
    // 2. YOU NEED A MEDIATOR
    // ═══════════════════════════════════════════════════════════

    BiblicalLie(
      title: "You Need a Mediator",
      icon: "person.badge.key.fill",
      color: Palette.primary.violet,
      whatTheySaid:
        "You cannot approach God directly. You need priests, pastors, the Church, the sacraments. Without proper intermediaries, God cannot hear you and you cannot reach Him. The Church holds the keys to heaven.",
      theGnosticTruth:
        "The divine spark is ALREADY WITHIN YOU. You don't need permission, you don't need a translator, you don't need to pay someone to connect you to what you already are. The Kingdom of Heaven is within you - Jesus said it himself (Luke 17:21). The Gnostics took him literally.",
      bibleVerse:
        "1 Timothy 2:5 - 'There is one mediator between God and mankind, the man Christ Jesus'",
      dragonComment:
        "Imagine telling someone they need a middleman to talk to themselves. That's what they did. You ARE the temple. 🐉"
    ),

    // ═══════════════════════════════════════════════════════════
    // 3. FEAR GOD
    // ═══════════════════════════════════════════════════════════

    BiblicalLie(
      title: "Fear God",
      icon: "exclamationmark.triangle.fill",
      color: Palette.primary.orange,
      whatTheySaid:
        "The fear of the Lord is the beginning of wisdom. You should tremble before God's power. He is a jealous God who will punish disobedience with eternal torment. Fear keeps you righteous.",
      theGnosticTruth:
        "The TRUE God - the Monad, the Source, the Pleroma - is pure unconditional love. It doesn't demand fear because it has no ego to threaten. Only the DEMIURGE demands fear, because he's insecure about his authority. 'I am a jealous God' (Exodus 20:5) is literally the confession of a lesser being. The real God doesn't need your fear - only your remembrance.",
      bibleVerse: "Proverbs 9:10 - 'The fear of the Lord is the beginning of wisdom'",
      dragonComment:
        "A God that demands fear is a God that can be threatened. Think about that. The infinite doesn't feel insecure. 🐉"
    ),

    // ═══════════════════════════════════════════════════════════
    // 4. BLIND FAITH IS VIRTUE
    // ═══════════════════════════════════════════════════════════

    BiblicalLie(
      title: "Blind Faith is Virtue",
      icon: "eye.slash.fill",
      color: Color(red: 0.5, green: 0.4, blue: 0.3),
      whatTheySaid:
        "Blessed are those who have not seen and yet believe. Don't question, don't seek proof, don't trust your own understanding. Faith means believing without evidence. Doubt is the enemy of salvation.",
      theGnosticTruth:
        "GNOSIS means KNOWLEDGE through direct experience. The Gnostics said: SEEK and you shall find. KNOCK and the door will be opened. Jesus said 'Know the truth and the truth shall set you free' - not 'believe what we tell you and obey.' The Gospel of Thomas (saying 2): 'Let him who seeks continue seeking until he finds.' Faith isn't blindness - it's trust in your own divine journey.",
      bibleVerse: "John 20:29 - 'Blessed are those who have not seen and yet have believed'",
      dragonComment:
        "They want you to believe without knowing. Gnosis wants you to KNOW without needing belief. See the difference? 🐉"
    ),

    // ═══════════════════════════════════════════════════════════
    // 5. THE BODY IS SINFUL
    // ═══════════════════════════════════════════════════════════

    BiblicalLie(
      title: "The Body is Sinful",
      icon: "figure.stand",
      color: Color(red: 0.6, green: 0.3, blue: 0.3),
      whatTheySaid:
        "The flesh is weak and sinful. Your body is a source of temptation, lust, and sin. You must mortify the flesh, deny bodily pleasures, and treat your physical existence as something to be overcome.",
      theGnosticTruth:
        "The body isn't evil - it's just TEMPORARY. It's a vessel, a vehicle for the divine spark to experience limitation. The Gnostics didn't hate the body; they just recognized it as a classroom, not a prison sentence. The problem isn't flesh - it's FORGETTING you're not just flesh. Big difference.",
      bibleVerse: "Romans 8:13 - 'If you live according to the flesh, you will die'",
      dragonComment:
        "Hating your body is just another distraction. Your body is your spaceship. Take care of it while you're here. 🐉"
    ),

    // ═══════════════════════════════════════════════════════════
    // 6. WOMEN SHOULD BE SILENT
    // ═══════════════════════════════════════════════════════════

    BiblicalLie(
      title: "Women Should Be Silent",
      icon: "speaker.slash.fill",
      color: Color(red: 0.6, green: 0.2, blue: 0.4),
      whatTheySaid:
        "Women should remain silent in churches. They are not permitted to speak. Eve was deceived and brought sin into the world. Women are subordinate to men by divine order.",
      theGnosticTruth:
        "The Gnostics honored SOPHIA - Divine Wisdom, the FEMININE face of God. Mary Magdalene was called 'the apostle to the apostles' and in the Gospel of Mary, she teaches the male disciples. The divine feminine was systematically erased because powerful women threatened patriarchal control. Lilith left Eden rather than submit. Sophia's light created everything.",
      bibleVerse: "1 Corinthians 14:34 - 'Women should remain silent in the churches'",
      dragonComment:
        "They silenced half of humanity and called it holy. Sophia is still laughing. 🐉"
    ),

    // ═══════════════════════════════════════════════════════════
    // 7. GOD DEMANDS BLOOD SACRIFICE
    // ═══════════════════════════════════════════════════════════

    BiblicalLie(
      title: "God Demands Blood Sacrifice",
      icon: "drop.fill",
      color: Palette.primary.red,
      whatTheySaid:
        "Without the shedding of blood there is no forgiveness. Jesus had to die as the ultimate sacrifice to appease God's wrath. God required a blood payment for human sin.",
      theGnosticTruth:
        "The TRUE God doesn't need blood. That's Demiurge behavior - the Old Testament god demanding animal sacrifices was a lesser being who fed on worship and fear. The Gnostic Christ came to TEACH, not to die. His message was awakening, not atonement. The crucifixion, symbolically, is the death of the EGO so the spirit can live - not a literal blood debt to an angry deity.",
      bibleVerse: "Hebrews 9:22 - 'Without the shedding of blood there is no forgiveness'",
      dragonComment:
        "What kind of 'loving father' needs his son tortured to death before he can forgive? That's not love. That's a hostage situation. 🐉"
    ),

    // ═══════════════════════════════════════════════════════════
    // 8. ONLY ONE PATH TO GOD
    // ═══════════════════════════════════════════════════════════

    BiblicalLie(
      title: "Only One Path to God",
      icon: "arrow.up.to.line",
      color: Palette.primary.cyan,
      whatTheySaid:
        "Jesus is the ONLY way to the Father. No one comes to God except through Christ and His Church. All other religions are false paths leading to damnation.",
      theGnosticTruth:
        "The Christ is not a person - it's a CONSCIOUSNESS, a state of awakening that has appeared in many forms across cultures. Krishna, Buddha, Horus, Mithra - all teachers pointing to the same truth: the divine within. The Gnostics recognized that gnosis (direct knowledge of the divine) could be achieved through many paths. The destination is the same; the routes are many.",
      bibleVerse:
        "John 14:6 - 'I am the way, the truth, and the life. No one comes to the Father except through me'",
      dragonComment:
        "If there's only one path to an infinite God, that God isn't very infinite, is it? 🐉"
    ),

    // ═══════════════════════════════════════════════════════════
    // 9. THE KINGDOM IS COMING (LATER)
    // ═══════════════════════════════════════════════════════════

    BiblicalLie(
      title: "The Kingdom is Coming Later",
      icon: "clock.badge.questionmark",
      color: Palette.accent.gold,
      whatTheySaid:
        "The Kingdom of Heaven will come in the future. Wait for death, wait for the Second Coming, wait for Judgment Day. Your reward is not in this life but the next. Endure earthly suffering for heavenly reward.",
      theGnosticTruth:
        "Jesus said 'The Kingdom of Heaven is WITHIN you' (Luke 17:21) and 'The Kingdom of the Father is spread upon the earth, but people do not see it' (Gospel of Thomas, saying 113). It's not coming - it's HERE. It's not somewhere else - it's INSIDE YOU. The waiting game keeps you docile, compliant, and tithing while you wait for a future that's already present.",
      bibleVerse:
        "Luke 17:21 - 'The kingdom of God is within you' (often mistranslated as 'among you')",
      dragonComment:
        "They told you to wait for heaven while standing inside it. The kingdom isn't coming. You're IN it. Wake up. 🐉"
    ),

    // ═══════════════════════════════════════════════════════════
    // 10. SUFFERING IS GOD'S WILL
    // ═══════════════════════════════════════════════════════════

    BiblicalLie(
      title: "Suffering is God's Will",
      icon: "cross.fill",
      color: Color(red: 0.4, green: 0.3, blue: 0.5),
      whatTheySaid:
        "God works in mysterious ways. Your suffering is part of His plan. Trials are sent to test and strengthen you. Accept your lot - it's divinely ordained.",
      theGnosticTruth:
        "The TRUE God doesn't will suffering - suffering exists because we're in the Demiurge's flawed creation, trapped in matter and ignorance. The Gnostics didn't accept suffering as divine will; they recognized it as a symptom of the cosmic mistake, the result of living in a realm created by an ignorant deity. Gnosis is the way OUT of suffering, not the acceptance of it.",
      bibleVerse: "Romans 8:28 - 'All things work together for good for those who love God'",
      dragonComment:
        "Telling suffering people that their pain is 'part of the plan' is spiritual gaslighting. The plan is to WAKE UP and leave the prison. 🐉"
    ),

    // ═══════════════════════════════════════════════════════════
    // 11. GOD TESTS FAITH WITH HARDSHIP
    // ═══════════════════════════════════════════════════════════

    BiblicalLie(
      title: "God Tests You",
      icon: "checkmark.shield.fill",
      color: Color(red: 0.5, green: 0.5, blue: 0.3),
      whatTheySaid:
        "God tests the faithful through trials and tribulations. Like Job, you must endure tests of faith. God gives his hardest battles to his strongest soldiers.",
      theGnosticTruth:
        "The infinite Source doesn't need to 'test' you - it already knows everything. Testing is the behavior of an insecure deity who needs proof of loyalty. The Demiurge tests because he doubts. The true God doesn't doubt. The 'tests' you face aren't divine examinations - they're the natural friction of a divine spark trying to remember itself while trapped in matter.",
      bibleVerse: "James 1:3 - 'The testing of your faith produces perseverance'",
      dragonComment:
        "An all-knowing God that needs to run tests is a God that doesn't know. The Demiurge tests because he can't see what's in hearts. The Source already knows. 🐉"
    ),

    // ═══════════════════════════════════════════════════════════
    // 12. OBEDIENCE OVER UNDERSTANDING
    // ═══════════════════════════════════════════════════════════

    BiblicalLie(
      title: "Obey, Don't Question",
      icon: "hand.raised.fill",
      color: Color(red: 0.4, green: 0.4, blue: 0.5),
      whatTheySaid:
        "Children, obey your parents. Servants, obey your masters. Citizens, obey your rulers. God's ways are higher than your ways. Don't lean on your own understanding. Submit.",
      theGnosticTruth:
        "Obedience is what the ARCHONS want - keep the sparks compliant, don't let them question. But gnosis requires QUESTIONING everything. 'Seek and you shall find.' The Gnostics were killed precisely BECAUSE they questioned. The Gospel of Philip: 'Ignorance is the mother of all evil.' Not disobedience - IGNORANCE. They want obedient slaves. The Source wants awakened children.",
      bibleVerse:
        "Proverbs 3:5 - 'Trust in the LORD with all your heart and lean not on your own understanding'",
      dragonComment:
        "Every system of control says 'don't think, just obey.' Funny how God sounds exactly like every tyrant in history. 🐉"
    ),

    // ═══════════════════════════════════════════════════════════
    // 13. YOU'LL BE JUDGED
    // ═══════════════════════════════════════════════════════════

    BiblicalLie(
      title: "Final Judgment Awaits",
      icon: "scalemass.fill",
      color: Color(red: 0.5, green: 0.3, blue: 0.2),
      whatTheySaid:
        "Everyone will stand before God's throne and be judged. Your every sin is recorded. You will answer for all you've done. Eternal punishment or eternal reward awaits based on this judgment.",
      theGnosticTruth:
        "The Gnostics didn't believe in a final judgment by an external deity - they saw 'judgment' as the natural consequence of ignorance. If you don't awaken, you return to the cycle of matter and forgetting. It's not punishment - it's physics. You're not judged by a god on a throne; you either remember who you are or you don't. Gnosis IS the 'favorable judgment' - self-recognition.",
      bibleVerse:
        "Hebrews 9:27 - 'People are destined to die once, and after that to face judgment'",
      dragonComment:
        "The only judge you'll ever face is yourself. And you've already delivered the verdict - you just haven't read it yet. 🐉"
    ),

    // ═══════════════════════════════════════════════════════════
    // 14. KNOWLEDGE IS DANGEROUS
    // ═══════════════════════════════════════════════════════════

    BiblicalLie(
      title: "Knowledge is Dangerous",
      icon: "book.closed.fill",
      color: Palette.primary.red,
      whatTheySaid:
        "The Tree of KNOWLEDGE brought the Fall. Curiosity killed the cat. Too much learning drives men mad. 'Knowledge puffs up.' Stay humble, stay simple, stay ignorant of 'worldly wisdom.'",
      theGnosticTruth:
        "The Gnostics were named for GNOSIS - KNOWLEDGE. They believed knowledge was SALVATION. The serpent in Eden was the HERO for bringing knowledge. The Demiurge wanted ignorant slaves; the serpent said 'no, they deserve to know.' Every institution that fears educated people is operating from the same playbook as the Demiurge.",
      bibleVerse:
        "Genesis 2:17 - 'You must not eat from the tree of the knowledge of good and evil'",
      dragonComment:
        "They made the pursuit of knowledge the original sin. Think about who benefits from that. Then think about every library they've burned. 🐉"
    ),

    // ═══════════════════════════════════════════════════════════
    // 15. THE OLD TESTAMENT GOD IS THE TRUE GOD
    // ═══════════════════════════════════════════════════════════

    BiblicalLie(
      title: "YHWH is the Supreme God",
      icon: "cloud.bolt.fill",
      color: Color(red: 0.3, green: 0.3, blue: 0.4),
      whatTheySaid:
        "The God of the Old Testament - YHWH, Jehovah - is the one true God, creator of heaven and earth, the same God Jesus called Father.",
      theGnosticTruth:
        "This is the core Gnostic revelation: The Old Testament God is the DEMIURGE - a lesser deity who created the material world and THINKS he's the only god. 'I am God and there is no other' (Isaiah 45:5) isn't a statement of truth - it's a confession of ignorance. He literally doesn't know about the Pleroma above him. The jealous, wrathful, genocidal deity of the Old Testament is NOT the Father Jesus spoke of. Jesus came to reveal the TRUE God - the God of love, not law.",
      bibleVerse:
        "Isaiah 45:5 - 'I am the LORD, and there is no other; apart from me there is no God'",
      dragonComment:
        "He said 'there is no other god' because he couldn't SEE any other god. That's not omniscience - that's blindness with confidence. 🐉"
    ),
  ]
}

extension CosmicEntity {
  static let angelsTruth: [CosmicEntity] = [
    CosmicEntity(
      name: "Angels - What They Actually Are",
      titles: ["Messengers", "Malakim", "Emanations", "Aspects of Divine Function"],
      description:
        "The word 'angel' comes from Greek 'angelos' meaning 'messenger.' In Hebrew, 'malak' means the same. Angels in ancient texts aren't the cute winged babies or beautiful humans with feathers. They're often described as TERRIFYING - multiple faces, covered in eyes, wheels within wheels. They're more like cosmic functions or forces than individuals. 'Be not afraid' is said because people were AFRAID.",
      symbolism: "Divine functions personified. Aspects of the One appearing as many.",
      color: Color.white,
      icon: "light.max",
      associatedWith: ["Messengers", "Divine will", "Cosmic functions", "Emanations"],
      gnosticTeaching:
        "Angels in Gnostic thought are emanations or aspects of divine function - similar to the Aeons but operating at lower levels. Some serve the Pleroma (light), others serve the Demiurge (material order). The key is that angels aren't separate beings worshipping God - they're extensions of the divine doing various jobs.",
      funFact:
        "Biblical angels: Seraphim have 6 wings and constantly burn. Cherubim have 4 faces (lion, ox, eagle, human) and 4 wings covered with eyes. Ophanim are WHEELS COVERED WITH EYES. But sure, put cute winged babies on Christmas cards. 👼"
    ),

    CosmicEntity(
      name: "Michael",
      titles: ["Who Is Like God?", "Prince of the Host", "Defender"],
      description:
        "Michael ('Who is like God?') appears as the defender of Israel and the leader of heavenly armies. In Christian tradition, he's the one who cast out 'Satan.' But his name is actually a QUESTION that implies the answer 'no one.' It's a reminder against pride and false comparison to the divine - exactly what the Demiurge fails to understand.",
      symbolism: "The question that defeats pride. The warrior aspect of divine truth.",
      color: Palette.primary.cyan,
      icon: "shield.fill",
      associatedWith: ["Protection", "Battle", "Justice", "Humility paradox"],
      gnosticTeaching:
        "Michael represents the force that recognizes and opposes false claims to ultimate authority. 'Who is like God?' - no one, including the Demiurge who claims to be. Michael is the question that unmasks the pretender.",
      funFact:
        "Michael is one of only two angels named in the Protestant Bible (the other is Gabriel). Everything else about angel hierarchies (Seraphim, Cherubim, Thrones, etc.) comes from later tradition and texts like Enoch."
    ),

    CosmicEntity(
      name: "Gabriel",
      titles: ["God Is My Strength", "The Announcer", "Messenger of Revelation"],
      description:
        "Gabriel appears as the messenger of important revelations - to Daniel, to Zechariah, to Mary. The name means 'God is my strength.' Gabriel is the voice that announces divine intervention in human affairs, the bridge between realms that delivers crucial knowledge.",
      symbolism: "Divine communication. The announcement of transformation.",
      color: Palette.accent.gold,
      icon: "megaphone.fill",
      associatedWith: ["Messages", "Annunciation", "Revelation", "Communication"],
      gnosticTeaching:
        "Gabriel represents the aspect of divinity that breaks through into human consciousness with transformative knowledge. Every moment of true gnosis is a 'Gabriel moment' - the strength of the divine reaching through to deliver awareness.",
      funFact:
        "In Islam, Gabriel (Jibril) is the angel who revealed the Quran to Muhammad. Same angel, different message, same function - bringing divine knowledge to humans. The pattern repeats across traditions."
    ),
  ]
}

// MARK: - Helper Extensions

extension CosmicRealm {
  static var earthRealm: CosmicRealm {
    allRealms.first { $0.order == 0 }!
  }

  static var pleroma: CosmicRealm {
    allRealms.first { $0.order == 10 }!
  }

  static var realmsByOrder: [CosmicRealm] {
    allRealms.sorted { $0.order < $1.order }
  }

  /// For mini-map: from bottom to top
  static var realmsBottomToTop: [CosmicRealm] {
    allRealms.sorted { $0.order < $1.order }
  }

  /// For scroll view: from top to bottom (Pleroma first)
  static var realmsTopToBottom: [CosmicRealm] {
    allRealms.sorted { $0.order > $1.order }
  }
}
