// GnosticLibraryView.swift
// The Complete Gnostic Library - Sacred Texts, Cosmology, and Gnosis
// "The original knowledge hackers—spotting the gap between dogma and direct wisdom"

import SwiftUI

// MARK: - Models

struct GnosticText: Identifiable {
    let id = UUID()
    let name: String
    let alternateNames: [String]
    let collection: GnosticCollection
    let category: GnosticCategory
    let dateWritten: String
    let summary: String
    let keyTeachings: [String]
    let significance: String
    let textURL: String? // Full text link
    let pdfURL: String? // PDF download link
    let furtherReadingURLs: [FurtherReading]
    let dragonComment: String
    let isPublicDomain: Bool
    let difficulty: Int // 1-5
}

struct FurtherReading: Identifiable {
    let id = UUID()
    let title: String
    let url: String
    let type: ReadingType
}

enum ReadingType: String {
    case fullText = "Full Text"
    case pdf = "PDF"
    case scholarly = "Scholarly"
    case wikipedia = "Wikipedia"
    case introduction = "Introduction"
}

enum GnosticCollection: String, CaseIterable {
    case nagHammadi = "Nag Hammadi Library"
    case berlinCodex = "Berlin Codex"
    case bruceCodex = "Bruce Codex"
    case askewCodex = "Askew Codex"
    case hermetica = "Corpus Hermeticum"
    case mandaean = "Mandaean Texts"
    case valentinian = "Valentinian Texts"
    case other = "Other Sources"
    
    var color: Color {
        switch self {
        case .nagHammadi: return .purple
        case .berlinCodex: return .blue
        case .bruceCodex: return .orange
        case .askewCodex: return .red
        case .hermetica: return .yellow
        case .mandaean: return .green
        case .valentinian: return .pink
        case .other: return .gray
        }
    }
    
    var icon: String {
        switch self {
        case .nagHammadi: return "books.vertical.fill"
        case .berlinCodex: return "book.closed.fill"
        case .bruceCodex: return "scroll.fill"
        case .askewCodex: return "text.book.closed.fill"
        case .hermetica: return "star.fill"
        case .mandaean: return "drop.fill"
        case .valentinian: return "heart.fill"
        case .other: return "doc.fill"
        }
    }
    
    var description: String {
        switch self {
        case .nagHammadi:
            return "Discovered in 1945 in Egypt. 13 codices containing 52 texts buried around 367 CE to preserve them from destruction. The Rosetta Stone of Gnostic Christianity."
        case .berlinCodex:
            return "Acquired in Cairo in 1896 by Dr. Karl Reinhardt. Contains the most complete copy of the Gospel of Mary plus other key Gnostic texts."
        case .bruceCodex:
            return "Named after James Bruce who acquired it in Egypt. Contains the Books of Jeu and other complex Gnostic cosmological works."
        case .askewCodex:
            return "Purchased by the British Museum in 1785 from Dr. Askew's heirs. Contains the massive Pistis Sophia text."
        case .hermetica:
            return "Attributed to Hermes Trismegistus (Thrice-Great Hermes). Bridges Egyptian wisdom and Greek philosophy. 'As above, so below' originates here."
        case .mandaean:
            return "Living Gnostic tradition still practiced in Iraq and Iran. Revere John the Baptist, practice ritual immersion. 2000+ years of continuous tradition."
        case .valentinian:
            return "The most sophisticated Gnostic school. Valentinus nearly became Pope. Operated within the Church while teaching deeper mysteries to initiates."
        case .other:
            return "Additional Gnostic and related texts from various sources."
        }
    }
}

enum GnosticCategory: String, CaseIterable {
    case creationMyth = "Creation Myths"
    case gospel = "Gospels"
    case apocalypse = "Apocalypses"
    case dialogue = "Dialogues"
    case treatise = "Treatises"
    case hymn = "Hymns & Poetry"
    case liturgy = "Liturgical"
    case hermetic = "Hermetic"
    
    var icon: String {
        switch self {
        case .creationMyth: return "globe.americas.fill"
        case .gospel: return "book.fill"
        case .apocalypse: return "eye.fill"
        case .dialogue: return "bubble.left.and.bubble.right.fill"
        case .treatise: return "doc.text.fill"
        case .hymn: return "music.note"
        case .liturgy: return "hands.sparkles.fill"
        case .hermetic: return "star.circle.fill"
        }
    }
}

// MARK: - Gnostic Cosmology Models

struct GnosticBeing: Identifiable {
    let id = UUID()
    let name: String
    let alternateNames: [String]
    let realm: GnosticRealm
    let description: String
    let role: String
    let symbolism: String
}

enum GnosticRealm: String, CaseIterable {
    case pleroma = "The Pleroma"
    case monad = "The Monad/Father"
    case aeons = "The Aeons"
    case sophia = "Sophia's Fall"
    case demiurge = "The Demiurge"
    case archons = "The Archons"
    case material = "Material World"
    
    var description: String {
        switch self {
        case .pleroma:
            return "The eternal, spiritual realm of perfection—beyond time, space, and matter. The 'Fullness' of all divine potential, inhabited by aeons as emanations of the ultimate God."
        case .monad:
            return "The unknowable, supreme being—beyond comprehension, purely spirit, the One beyond Being. Source of all aeons via passive emanation."
        case .aeons:
            return "Hypostatic ideas or intelligences—immaterial beings in syzygies (male-female pairs). Often 30 in total, arranged in hierarchies forming the Pleroma's structure."
        case .sophia:
            return "The lowest aeon, embodying divine wisdom. Her 'error'—desiring to know the unknowable Father without her pair—birthed the Demiurge outside the Pleroma."
        case .demiurge:
            return "Sophia's aborted offspring—a semi-divine, ignorant creator who fashions the material cosmos as a flawed imitation of the Pleroma. Often identified with the Old Testament God."
        case .archons:
            return "Demiurge's offspring—7 planetary powers enforcing fate, ignorance, and material bonds. Oppressive gatekeepers trapping souls in matter."
        case .material:
            return "Our flawed physical reality—created by the Demiurge in ignorance. Humans contain divine sparks from Sophia, trapped in material bodies."
        }
    }
    
    var color: Color {
        switch self {
        case .pleroma: return .white
        case .monad: return .yellow
        case .aeons: return .purple
        case .sophia: return .blue
        case .demiurge: return .orange
        case .archons: return .red
        case .material: return .gray
        }
    }
}

// MARK: - Database

struct GnosticLibraryDatabase {
    
    // MARK: - Overview
    
    static let gnosticOverview = """
The Gnostics weren't a single, monolithic group but a diverse collection of religious thinkers and sects emerging in the late 1st century AD, primarily within early Christianity, though influenced by Jewish mysticism, Hellenistic philosophy (like Plato), and other ancient traditions. They flourished in the Mediterranean world during the 2nd and 3rd centuries, emphasizing personal spiritual insight over institutional authority.

Think of them as the original "knowledge hackers"—spotting the gap between rote religious dogma and direct, experiential wisdom (gnosis), partnering with esoteric texts to augment human potential beyond the material grind.

KEY BELIEFS:
• Dualism/Anticosmicism: The material world is flawed or evil, created by a lesser being (Demiurge), trapping divine sparks in human souls
• Salvation Through Gnosis: Ignorance causes suffering; enlightenment (not sin/repentance) frees the soul from illusion
• Rejection of Orthodox Authority: Personal insight over church traditions; the material cosmos as a prison
• Mythic Cosmology: Elaborate myths explaining creation's flaws, often reinterpreting biblical stories

WHAT HAPPENED TO THEM:
By the 3rd-4th centuries, Gnosticism was suppressed as heresy by emerging orthodox Christianity, especially after Emperor Constantine's conversion and councils like Nicaea (325 AD). Proto-orthodox leaders like Irenaeus and Tertullian labeled them threats, leading to book burnings, excommunications, and marginalization.

Gnosticism persisted in pockets (Manichaeism influenced areas as far as China until the 9th century), but declined amid Roman Empire's cultural shifts and Islamic expansions. By the Middle Ages, it survived in esoteric forms like Catharism, but was largely erased—until modern rediscoveries hacked open the vault of forgotten knowledge.

THE NAG HAMMADI DISCOVERY (1945):
In 1945, an Egyptian farmer named Muhammad Ali discovered a sealed jar near Nag Hammadi containing 13 leather-bound codices. These texts had been buried around 367 CE when Bishop Athanasius ordered the destruction of all non-canonical texts. Someone chose to preserve rather than burn. Almost every major Gnostic idea we know today comes from this discovery.
"""
    
    static let gnosticCollapse = """
GNOSTIC TRUTH AND THE ABRAHAMIC RELIGIONS:

Gnostic views radically critique Abrahamic faiths (Judaism, Christianity, Islam) by reinterpreting their core narratives:

• The "Old Testament God" is the Demiurge—a flawed, ignorant creator, not the true transcendent God
• Abrahamic salvation via law/faith/works is seen as Demiurge-worship, trapping souls in matter
• Gnostics viewed Jewish scriptures as Demiurge propaganda
• Jesus as a liberator FROM the Demiurge (not the Messiah fulfilling the Old Testament)
• Islamic monotheism as potentially Demiurgic if focused on worldly law

It's not a literal "collapse" but a subversive hack: exposing institutional religion as illusion, prioritizing gnosis over dogma.

Forward-thinking? It spots the gap where Abrahamic systems overload info without true recall—gnosis as the ultimate upgrade.

As the Gnostics might say: "If Abrahamic gods are the OS, we built the jailbreak."
"""
    
    // MARK: - Cosmology Beings
    
    static let cosmologyBeings: [GnosticBeing] = [
        // The Monad
        GnosticBeing(
            name: "The Monad",
            alternateNames: ["The Father", "The One", "The Invisible Spirit", "Bythos (Depth)", "The First Principle"],
            realm: .monad,
            description: "The unknowable, supreme being—beyond comprehension, purely spirit, the One beyond Being. Source of all aeons via passive emanation (thoughts overflowing as entities). Not a creator-god; immutable, perfect, and transcendent.",
            role: "The ultimate source of all existence, from which all divine emanations flow",
            symbolism: "Represents pure consciousness before differentiation—the infinite potential before creation"
        ),
        
        // Barbelo
        GnosticBeing(
            name: "Barbelo",
            alternateNames: ["Forethought", "The Mother", "First Thought", "The Womb"],
            realm: .aeons,
            description: "The first emanation from the Monad. Often depicted as the female aspect of the divine, the 'Mother' who receives the Monad's light and gives birth to all subsequent aeons.",
            role: "First emanation and divine consort of the Monad; the womb of all subsequent creation",
            symbolism: "The divine feminine principle; forethought and providence"
        ),
        
        // Christ/Autogenes
        GnosticBeing(
            name: "Autogenes",
            alternateNames: ["Christ", "The Self-Generated", "The Anointed"],
            realm: .aeons,
            description: "The 'Self-Generated One' - an aeon who emerges from Barbelo and the Monad. In Sethian texts, identified with the heavenly Christ who descends to awaken humanity.",
            role: "The divine being who will descend to rescue trapped divine sparks",
            symbolism: "Self-awareness arising from divine unity; the awakening principle"
        ),
        
        // Sophia
        GnosticBeing(
            name: "Sophia",
            alternateNames: ["Wisdom", "Pistis Sophia", "Achamoth", "The Fallen Aeon"],
            realm: .sophia,
            description: "The lowest aeon, embodying divine wisdom. Her 'error'—desiring to know the unknowable Father without her pair—hypostatizes as a flawed entity, birthing the Demiurge outside the Pleroma. She's not evil but reckless; her fall disrupts harmony, creating chaos/matter.",
            role: "The bridge between divine and material realms; her fall creates our world",
            symbolism: "Human longing for divine union gone awry—curiosity without balance. Also represents the divine spark trapped in matter."
        ),
        
        // Demiurge
        GnosticBeing(
            name: "Yaldabaoth",
            alternateNames: ["The Demiurge", "Saklas (The Fool)", "Samael (Blind God)", "The Chief Archon", "Ialdabaoth"],
            realm: .demiurge,
            description: "Sophia's aborted offspring—a semi-divine, ignorant creator who fashions the material cosmos as a flawed imitation of the Pleroma. Hubristic: Declares 'I am God and there is no other' (echoing Isaiah, but Gnostics flip it as arrogance). Often depicted as lion-headed serpent.",
            role: "Creates the material world in ignorance; rules via archons; keeps humans trapped",
            symbolism: "Cosmic ignorance personified; the false god of material religion. In Christian Gnosticism: identified with the OT God."
        ),
        
        // Archons
        GnosticBeing(
            name: "The Seven Archons",
            alternateNames: ["Rulers", "Planetary Powers", "Governors of Fate"],
            realm: .archons,
            description: "Demiurge's offspring—7 planetary powers enforcing fate, ignorance, and material bonds. Names vary (Yao, Sabaoth, Adonaios, Astaphaios, etc.); tied to zodiac/heavens. Oppressive gatekeepers trapping souls.",
            role: "Guard the boundaries between realms; prevent souls from ascending to the Pleroma",
            symbolism: "The forces of fate, karma, and material attachment that bind the soul"
        ),
        
        // Adamas
        GnosticBeing(
            name: "Adamas",
            alternateNames: ["The Perfect Human", "The Heavenly Adam", "Pigeradamas"],
            realm: .pleroma,
            description: "The perfect, archetypal human who exists in the Pleroma. The template from which earthly Adam was created—but earthly Adam is a flawed copy made by the Demiurge.",
            role: "The divine template of humanity; represents our true nature before the fall",
            symbolism: "Our original divine nature; what we were before being trapped in matter"
        ),
        
        // Seth
        GnosticBeing(
            name: "Seth",
            alternateNames: ["The Great Seth", "The Son of Adamas"],
            realm: .pleroma,
            description: "The third son of Adam in Gnostic mythology, but elevated to a divine savior figure. The Sethians believed they were the spiritual descendants of Seth, carriers of the divine seed.",
            role: "Ancestor of the Gnostic elect; carrier of the divine spark through generations",
            symbolism: "The continuation of divine knowledge through lineage; spiritual inheritance"
        )
    ]
    
    // MARK: - All Texts
    
    static let allTexts: [GnosticText] = nagHammadiTexts + berlinCodexTexts + hermeticTexts + pistisSophiaTexts + mandaeanTexts + otherTexts
    
    // MARK: - Nag Hammadi Library
    
    static let nagHammadiTexts: [GnosticText] = [
        GnosticText(
            name: "The Apocryphon of John",
            alternateNames: ["Secret Book of John", "The Gnostic Genesis"],
            collection: .nagHammadi,
            category: .creationMyth,
            dateWritten: "Before 180 CE",
            summary: """
This is THE Gnostic creation myth—the most important text for understanding Gnostic cosmology. It's found in four copies at Nag Hammadi (more than any other text), showing its central importance.

The text opens with John in grief after the crucifixion. A being appears—shifting between child, old man, and young man—revealing the true nature of reality. What follows is the complete Gnostic cosmology: the unknowable Father, the emanation of aeons, Sophia's fall, the birth of the Demiurge, the creation of Adam, and the plan for human salvation.

The Demiurge, named Yaldabaoth, declares "I am God and there is no other"—proving his ignorance, as he's unaware of the realms above him. Humans contain divine sparks from Sophia, trapped in material bodies created by the Demiurge's archons.
""",
            keyTeachings: [
                "Sophia's curiosity led to the accidental creation of the Demiurge",
                "The Demiurge (Yaldabaoth) created the material world in ignorance",
                "The Demiurge declared 'I am God and there is no other' - proving his blindness",
                "Humans contain a divine spark from Sophia, trapped in material bodies",
                "The serpent in Eden was Sophia trying to awaken humanity",
                "Salvation comes through gnosis—knowledge of our true divine origin"
            ],
            significance: "The foundational text of Sethian Gnosticism. If you read only one Gnostic text, read this one. It provides the complete cosmological framework that all other Gnostic texts reference.",
            textURL: "http://www.gnosis.org/naghamm/apocjn-davies.html",
            pdfURL: "https://gnosis.study/library/%D0%93%D0%BD%D0%BE%D0%B7%D0%B8%D1%81/%D0%98%D1%81%D1%81%D0%BB%D0%B5%D0%B4%D0%BE%D0%B2%D0%B0%D0%BD%D0%B8%D1%8F/ENG/Davies%20S.%20-%20The%20Secret%20Book%20of%20John.%20The%20Gnostic%20Gospel.pdf",
            furtherReadingURLs: [
                FurtherReading(title: "Frederik Wisse Translation", url: "http://www.gnosis.org/naghamm/apocjn.html", type: .fullText),
                FurtherReading(title: "Marvin Meyer Translation", url: "http://www.gnosis.org/naghamm/apocjn-meyer.html", type: .fullText),
                FurtherReading(title: "Long Version (Waldstein & Wisse)", url: "http://www.gnosis.org/naghamm/apocjn-long.html", type: .fullText),
                FurtherReading(title: "Wikipedia", url: "https://en.wikipedia.org/wiki/Apocryphon_of_John", type: .wikipedia),
                FurtherReading(title: "Early Christian Writings", url: "https://www.earlychristianwritings.com/apocryphonjohn.html", type: .scholarly)
            ],
            dragonComment: "This is the Gnostic red pill. Once you read it, you can't unsee the inversion. The 'God' demanding worship is the warden, not the liberator. 🐉",
            isPublicDomain: true,
            difficulty: 3
        ),
        
        GnosticText(
            name: "The Gospel of Thomas",
            alternateNames: ["Sayings of Jesus", "The Fifth Gospel"],
            collection: .nagHammadi,
            category: .gospel,
            dateWritten: "50-140 CE (debated)",
            summary: """
A collection of 114 sayings attributed to Jesus, with no narrative—just raw teachings. Many scholars consider it potentially older than the canonical Gospels, preserving an earlier layer of Jesus tradition.

The Gospel opens: "These are the secret sayings that the living Jesus spoke and Didymos Judas Thomas recorded. Whoever discovers the interpretation of these sayings will not taste death."

Unlike canonical Gospels focused on Jesus's death and resurrection, Thomas focuses entirely on his teachings. The emphasis is on finding the Kingdom within: "The kingdom is inside of you, and it is outside of you. When you come to know yourselves, then you will become known."

Some sayings parallel the canonical Gospels, others are completely unique. The text presents a mystical, contemplative Jesus more concerned with inner transformation than external religion.
""",
            keyTeachings: [
                "The Kingdom of God is within you—not a future place",
                "Know yourself to know the divine",
                "Become a 'single one'—unified, whole",
                "The living Jesus speaks—direct transmission of wisdom",
                "Salvation through interpretation and understanding",
                "Split wood, lift a stone—the divine is everywhere"
            ],
            significance: "The most accessible Gnostic text and possibly the earliest gospel we have. Essential reading for understanding Jesus outside institutional Christianity. Over 50% of its sayings parallel the canonical Gospels.",
            textURL: "http://www.gnosis.org/naghamm/gosthom.html",
            pdfURL: nil,
            furtherReadingURLs: [
                FurtherReading(title: "Thomas Collection (Multiple Translations)", url: "http://www.gnosis.org/naghamm/nhl_thomas.htm", type: .fullText),
                FurtherReading(title: "Lambdin Translation", url: "http://www.gnosis.org/naghamm/gthlamb.html", type: .fullText),
                FurtherReading(title: "Marvin Meyer Translation", url: "http://www.gnosis.org/naghamm/gosthom-meyer.html", type: .fullText),
                FurtherReading(title: "Stevan Davies Translation", url: "http://www.gnosis.org/naghamm/gosthom-davies.html", type: .fullText),
                FurtherReading(title: "Patterson & Robinson Translation", url: "http://www.gnosis.org/naghamm/gth_pat_rob.htm", type: .fullText),
                FurtherReading(title: "Bibliography & Manuscripts", url: "http://www.gnosis.org/naghamm/gth_bibliography.htm", type: .scholarly)
            ],
            dragonComment: "114 sayings. No miracles, no resurrection narrative, no church. Just the teachings. What was Jesus actually saying before the religion formed around him? 🐉",
            isPublicDomain: true,
            difficulty: 2
        ),
        
        GnosticText(
            name: "The Gospel of Philip",
            alternateNames: ["Philip's Gospel"],
            collection: .nagHammadi,
            category: .gospel,
            dateWritten: "180-300 CE",
            summary: """
A Valentinian text containing mystical reflections on sacraments, symbolism, and the relationship between Jesus and Mary Magdalene. Not a narrative gospel but a collection of meditations and teachings.

Famous for stating that Jesus "used to kiss [Mary Magdalene] often on her [mouth]" and that the disciples questioned why he loved her more than them. This has fueled centuries of speculation about their relationship.

But the text is more profound than gossip. It explores the bridal chamber mystery—the reunion of the soul with its divine counterpart. Marriage becomes a metaphor for cosmic reunion, the healing of the primordial split.

The text also contains profound reflections on names, symbols, and the nature of truth: "Truth did not come into the world naked, but it came in types and images."
""",
            keyTeachings: [
                "Jesus and Mary Magdalene had a special relationship",
                "The 'bridal chamber' sacrament reunites soul with divine",
                "Names have power—the archons use false names to enslave",
                "Truth comes in symbols and images, not naked",
                "Five sacraments: baptism, chrism, eucharist, redemption, bridal chamber",
                "Resurrection happens before death, through gnosis"
            ],
            significance: "The primary source for Jesus-Mary Magdalene relationship speculation. More importantly, a window into Valentinian Christianity's sophisticated sacramental theology.",
            textURL: "http://www.gnosis.org/naghamm/gop.html",
            pdfURL: nil,
            furtherReadingURLs: [
                FurtherReading(title: "Wesley Isenberg Translation", url: "http://www.gnosis.org/naghamm/gop.html", type: .fullText),
                FurtherReading(title: "Wikipedia", url: "https://en.wikipedia.org/wiki/Gospel_of_Philip", type: .wikipedia)
            ],
            dragonComment: "The text they don't want you to read. Not because of the kiss, but because it shows early Christianity included mystical sacraments the Church later suppressed. 🐉",
            isPublicDomain: true,
            difficulty: 3
        ),
        
        GnosticText(
            name: "The Gospel of Truth",
            alternateNames: ["Evangelium Veritatis"],
            collection: .nagHammadi,
            category: .treatise,
            dateWritten: "140-180 CE",
            summary: """
Possibly written by Valentinus himself—the most sophisticated Gnostic thinker who nearly became Pope. This isn't a narrative gospel but a poetic, meditative reflection on the nature of error, ignorance, and salvation.

The text opens: "The gospel of truth is joy for those who have received grace from the Father of truth, that they might know him through the power of the Logos."

Error is personified—a fog of ignorance that creates nightmare phantoms. The Father sent the Logos (Christ) to dispel this fog, to remind the sleeping souls of their true origin. Salvation is remembering—waking up from the nightmare of materiality.

The prose is beautiful, almost hypnotic. This is Gnosticism at its most refined and accessible.
""",
            keyTeachings: [
                "Error is not sin but ignorance—a fog to be dispelled",
                "The world is like a nightmare from which we must awaken",
                "Christ came to remind us of what we forgot",
                "The Father is not angry but searching for his lost children",
                "Salvation is remembering our true origin",
                "Joy comes through knowledge of the Father"
            ],
            significance: "The most elegant and accessible Gnostic treatise. Shows Gnosticism's philosophical sophistication. If attributed to Valentinus, this is as close as we get to the master's own words.",
            textURL: "http://gnosis.org/naghamm/got.html",
            pdfURL: nil,
            furtherReadingURLs: [
                FurtherReading(title: "Robert Grant Translation", url: "http://gnosis.org/naghamm/got.html", type: .fullText),
                FurtherReading(title: "Wikipedia", url: "https://en.wikipedia.org/wiki/Gospel_of_Truth", type: .wikipedia)
            ],
            dragonComment: "Read this when you need to feel the warmth beneath the Gnostic cosmos. The Father isn't angry. He's searching for you. You just forgot the way home. 🐉",
            isPublicDomain: true,
            difficulty: 2
        ),
        
        GnosticText(
            name: "The Hypostasis of the Archons",
            alternateNames: ["Reality of the Rulers", "Nature of the Archons"],
            collection: .nagHammadi,
            category: .creationMyth,
            dateWritten: "3rd century CE",
            summary: """
A direct attack on the idea that the biblical creators are benevolent. This text names the jailers, describes how the Archons keep humanity enslaved through ignorance, and retells Genesis from the Gnostic perspective.

The Archons are described as rulers who "cannot perceive" the true light. They create Adam but can't animate him until a spark from Sophia enters. They try to rape Eve, who escapes by becoming the Tree of Knowledge. The serpent is a liberator, not a deceiver.

The text ends with a vision of the end times: Sophia's daughter Zoe (Life) will judge the archons, the true humanity will ascend, and the cosmos will be dissolved.
""",
            keyTeachings: [
                "The Archons rule through ignorance, not power",
                "Eve's awakening came from Sophia's light, not from Satan",
                "The serpent was trying to liberate humanity",
                "The Demiurge is blind to the realms above him",
                "Spiritual Eve escaped rape by becoming the Tree",
                "The material world will eventually be dissolved"
            ],
            significance: "The clearest Gnostic retelling of Genesis. Essential for understanding how Gnostics read the Old Testament as the story of the jailer, not the savior.",
            textURL: "http://www.gnosis.org/naghamm/hypostas.html",
            pdfURL: nil,
            furtherReadingURLs: [
                FurtherReading(title: "Full Text", url: "http://www.gnosis.org/naghamm/hypostas.html", type: .fullText),
                FurtherReading(title: "Wikipedia", url: "https://en.wikipedia.org/wiki/Hypostasis_of_the_Archons", type: .wikipedia)
            ],
            dragonComment: "Genesis from the other side. The serpent was Sophia trying to wake up her trapped sparks. The 'God' keeping them ignorant was the warden. 🐉",
            isPublicDomain: true,
            difficulty: 3
        ),
        
        GnosticText(
            name: "On the Origin of the World",
            alternateNames: ["Untitled Text"],
            collection: .nagHammadi,
            category: .creationMyth,
            dateWritten: "3rd century CE",
            summary: """
A cosmological deep dive into how the material world came to be. Describes the chaos before creation, the emergence of the Demiurge, and the ongoing battle between light and darkness.

This text provides one of the most detailed accounts of the pre-cosmic chaos, Sophia's fall, and the creation of the archons. It includes material not found in other Gnostic texts, including the creation of celestial phenomena and the structure of the underworld.

Dense but foundational for understanding the full scope of Gnostic cosmology.
""",
            keyTeachings: [
                "Darkness existed before the material world",
                "Sophia's light became trapped in the darkness",
                "The Demiurge created in imitation and ignorance",
                "Multiple layers of heavens and rulers",
                "The material world will eventually be destroyed",
                "Light and darkness are in cosmic struggle"
            ],
            significance: "The most comprehensive Gnostic cosmology text. Fills in details missing from other sources. Essential for serious students of Gnostic worldview.",
            textURL: "http://www.gnosis.org/naghamm/origin.html",
            pdfURL: nil,
            furtherReadingURLs: [
                FurtherReading(title: "Full Text", url: "http://www.gnosis.org/naghamm/origin.html", type: .fullText),
                FurtherReading(title: "Wikipedia", url: "https://en.wikipedia.org/wiki/On_the_Origin_of_the_World", type: .wikipedia)
            ],
            dragonComment: "Want to understand the architecture of the Matrix? This is the blueprint. Dense, but every detail matters. 🐉",
            isPublicDomain: true,
            difficulty: 4
        ),
        
        GnosticText(
            name: "The Thunder, Perfect Mind",
            alternateNames: ["Thunder: Perfect Intellect"],
            collection: .nagHammadi,
            category: .hymn,
            dateWritten: "2nd-3rd century CE",
            summary: """
A strange, hypnotic monologue often associated with Sophia or the divine feminine. Pure poetry. A voice speaks in paradoxes:

"I am the first and the last. I am the honored and the scorned. I am the whore and the holy one. I am the wife and the virgin."

The speaker claims to be all opposites simultaneously—pure and defiled, wise and foolish, life and death. It defies easy interpretation but pierces the rational mind, pointing toward a reality beyond dualistic thinking.

No narrative, no doctrine—just a divine voice speaking its nature in impossible contradictions.
""",
            keyTeachings: [
                "Divine feminine speaks in paradoxes",
                "All opposites are unified in the divine",
                "Rationality cannot contain ultimate truth",
                "The despised and the honored are one",
                "Seek beyond categories and labels",
                "Wisdom comes in forms that shock"
            ],
            significance: "Unique in ancient literature. Possibly the closest we get to a feminine divine voice speaking directly. Influenced modern poetry and feminist theology.",
            textURL: "http://www.gnosis.org/naghamm/thunder.html",
            pdfURL: nil,
            furtherReadingURLs: [
                FurtherReading(title: "Full Text", url: "http://www.gnosis.org/naghamm/thunder.html", type: .fullText),
                FurtherReading(title: "Wikipedia", url: "https://en.wikipedia.org/wiki/Thunder,_Perfect_Mind", type: .wikipedia)
            ],
            dragonComment: "This isn't meant to be understood with the rational mind. Let it wash over you. Sophia speaking through paradox. 🐉",
            isPublicDomain: true,
            difficulty: 2
        ),
        
        GnosticText(
            name: "The Gospel of Judas",
            alternateNames: ["Judas Gospel"],
            collection: .nagHammadi, // Actually from different codex but related
            category: .gospel,
            dateWritten: "140-180 CE",
            summary: """
Reframes Judas as the enlightened one. Not betrayal, but obedience to higher knowledge. Jesus ASKS Judas to hand him over because only Judas truly understands—the other disciples worship the Demiurge without knowing it.

The text was known from Irenaeus's condemnation (180 CE) but only physically discovered in the 1970s. It presents a dramatic reversal: the "traitor" as the most enlightened disciple, chosen specifically because he alone could understand.

Jesus laughs at the other disciples' ignorance throughout the text. Their prayers and sacrifices go to the wrong god. Only Judas sees the true divine realm.
""",
            keyTeachings: [
                "Judas was the most enlightened disciple",
                "The other disciples worship the wrong god (the Demiurge)",
                "Jesus asked Judas to 'betray' him",
                "The material body is a prison to escape",
                "Sacrifice to the temple god is misguided",
                "True gnosis is rare even among disciples"
            ],
            significance: "The ultimate Gnostic reversal—the villain as hero. Shows how radically Gnostics reinterpreted Christian narrative. Challenges everything we think we know about betrayal.",
            textURL: "http://www.gnosis.org/library/judas.htm",
            pdfURL: nil,
            furtherReadingURLs: [
                FurtherReading(title: "Full Text", url: "http://www.gnosis.org/library/judas.htm", type: .fullText),
                FurtherReading(title: "Wikipedia", url: "https://en.wikipedia.org/wiki/Gospel_of_Judas", type: .wikipedia)
            ],
            dragonComment: "The ultimate plot twist. The 'traitor' was the only one who understood. Everyone else was worshipping the warden. 🐉",
            isPublicDomain: true,
            difficulty: 3
        ),
        
        GnosticText(
            name: "The Sophia of Jesus Christ",
            alternateNames: ["Wisdom of Jesus Christ"],
            collection: .nagHammadi,
            category: .dialogue,
            dateWritten: "2nd century CE",
            summary: """
A dialogue between the risen Jesus and his disciples on a mountain, revealing cosmic secrets. Based on an earlier non-Christian text (Eugnostos the Blessed) that was 'Christianized' by adding Jesus as the revealer.

Jesus answers questions about the nature of the divine realm, the origin of the deficiency (our flawed world), and the path to salvation. The text provides another version of Gnostic cosmology with some unique details.

The comparison between the original Eugnostos and this Christianized version shows how Gnostic ideas were adapted and spread.
""",
            keyTeachings: [
                "Jesus reveals cosmic secrets after resurrection",
                "Sophia's passion created the deficiency that became our world",
                "The divine realm has multiple levels and beings",
                "Knowledge (gnosis) is the path to salvation",
                "The material world arose from error, not divine intention",
                "The Savior came to restore what was lost"
            ],
            significance: "Important for understanding how Gnostic teachings were Christianized. Comparison with Eugnostos shows the process of religious adaptation.",
            textURL: "http://www.gnosis.org/naghamm/sjc.html",
            pdfURL: nil,
            furtherReadingURLs: [
                FurtherReading(title: "Full Text", url: "http://www.gnosis.org/naghamm/sjc.html", type: .fullText),
                FurtherReading(title: "Eugnostos the Blessed (Source Text)", url: "http://www.gnosis.org/naghamm/eug.html", type: .fullText)
            ],
            dragonComment: "Watch Gnostic ideas get a Christian skin in real-time. Same teachings, different revealer. The content matters more than the label. 🐉",
            isPublicDomain: true,
            difficulty: 3
        ),
        
        GnosticText(
            name: "The Treatise on the Resurrection",
            alternateNames: ["Letter to Rheginos", "Epistle to Rheginus"],
            collection: .nagHammadi,
            category: .treatise,
            dateWritten: "2nd century CE",
            summary: """
A Valentinian letter explaining Gnostic understanding of resurrection. Contra orthodox Christianity, resurrection isn't about the physical body rising—it's about the spiritual awakening that happens NOW.

The author argues that the resurrection has already happened for those who have gnosis. The spiritual body is real; the material body is the illusion. Death of the body is liberation, not tragedy.

Short but theologically significant—shows how Gnostics reinterpreted the central Christian doctrine.
""",
            keyTeachings: [
                "Resurrection happens NOW through gnosis",
                "The spiritual body is real; physical body is illusion",
                "Those with gnosis have already risen",
                "Death liberates the divine spark from matter",
                "Don't fear death—it's graduation, not extinction",
                "The Savior shows the way through resurrection"
            ],
            significance: "Key text for understanding Gnostic eschatology. Shows the fundamental split between Gnostic and orthodox Christian views of resurrection.",
            textURL: "http://www.gnosis.org/naghamm/res.html",
            pdfURL: nil,
            furtherReadingURLs: [
                FurtherReading(title: "Full Text", url: "http://www.gnosis.org/naghamm/res.html", type: .fullText)
            ],
            dragonComment: "They told you to wait for resurrection after death. The Gnostics said: wake up now, while you're still breathing. 🐉",
            isPublicDomain: true,
            difficulty: 2
        )
    ]
    
    // MARK: - Berlin Codex
    
    static let berlinCodexTexts: [GnosticText] = [
        GnosticText(
            name: "The Gospel of Mary",
            alternateNames: ["Gospel of Mary Magdalene"],
            collection: .berlinCodex,
            category: .gospel,
            dateWritten: "Early 2nd century CE",
            summary: """
The only gospel attributed to a woman—Mary Magdalene. Sadly, about half is missing, but what survives is revolutionary.

After Jesus's departure, the disciples are grieving and afraid. Mary comforts them, sharing a vision Jesus gave her privately. She describes the soul's ascent through hostile archonic powers, answering their challenges with gnosis.

Peter and Andrew object—how can they believe a woman received teachings they didn't? Levi defends Mary: "If the Savior made her worthy, who are you to reject her?"

This text directly addresses the gender politics of early Christianity. Mary is the visionary; Peter is the doubter.
""",
            keyTeachings: [
                "Mary received private revelations from Jesus",
                "The soul ascends through archonic realms after death",
                "Gnosis provides the answers to bypass hostile powers",
                "Peter questions Mary's authority (gender conflict)",
                "Levi defends women's spiritual authority",
                "Inner vision is a valid source of teaching"
            ],
            significance: "The strongest early Christian text arguing for women's spiritual authority. Shows the gender conflicts that shaped early Christianity. Mary as visionary leader, not just follower.",
            textURL: "http://www.gnosis.org/library/marygosp.htm",
            pdfURL: "https://maryourhelp.org/e-books/marian-ebooks/The-Gospel-of-Mary.pdf",
            furtherReadingURLs: [
                FurtherReading(title: "Full Text (Gnosis.org)", url: "http://www.gnosis.org/library/marygosp.htm", type: .fullText),
                FurtherReading(title: "Karen L. King Introduction", url: "http://www.gnosis.org/library/GMary-King-Intro.html", type: .scholarly),
                FurtherReading(title: "The Gospel of Mary Website", url: "https://www.thegospelofmary.org/the-gospel", type: .fullText),
                FurtherReading(title: "Wikipedia", url: "https://en.wikipedia.org/wiki/Gospel_of_Mary", type: .wikipedia)
            ],
            dragonComment: "The woman they tried to silence. Peter couldn't handle that she saw more than him. 2000 years later, we finally get to hear her. 🐉",
            isPublicDomain: true,
            difficulty: 2
        )
    ]
    
    // MARK: - Corpus Hermeticum
    
    static let hermeticTexts: [GnosticText] = [
        GnosticText(
            name: "Corpus Hermeticum",
            alternateNames: ["Hermetic Writings", "Books of Hermes"],
            collection: .hermetica,
            category: .hermetic,
            dateWritten: "1st-3rd century CE",
            summary: """
Attributed to Hermes Trismegistus (Thrice-Great Hermes)—a fusion of Greek Hermes and Egyptian Thoth. These texts bridge Egyptian wisdom and Greek philosophy, influencing both Gnosticism and later Western esotericism.

The Corpus contains 17 treatises covering cosmology, the nature of God, the soul's ascent, and the path to gnosis. The famous phrase "As above, so below" comes from the related Emerald Tablet.

Key texts include the Poimandres (a creation vision rivaling Genesis), The Key (on the soul's virtue being gnosis), and the Perfect Sermon (Asclepius).

The Hermetica were thought to predate Moses until the 15th century, giving them enormous authority. They're the foundation of Western esoteric tradition—alchemy, Rosicrucianism, Freemasonry all draw from this source.
""",
            keyTeachings: [
                "'As above, so below'—microcosm reflects macrocosm",
                "The soul's vice is ignorance; its virtue is gnosis",
                "God is Mind—to know God, become mind",
                "The cosmos is alive, ensouled, intelligent",
                "Humans can become divine through knowledge",
                "Death is transformation, not destruction"
            ],
            significance: "The foundation of Western esotericism. Influenced alchemy, Renaissance magic, Freemasonry, and modern occultism. Shows the synthesis of Egyptian and Greek wisdom traditions.",
            textURL: "http://www.gnosis.org/library/hermet.htm",
            pdfURL: "https://ia601606.us.archive.org/25/items/pdfy-jcWLRBnyXg-DUcMH/The%20Corpus%20Hermeticum.pdf",
            furtherReadingURLs: [
                FurtherReading(title: "Complete Corpus Hermeticum", url: "http://www.gnosis.org/library/hermet.htm", type: .fullText),
                FurtherReading(title: "I. Poimandres", url: "http://www.gnosis.org/library/hermes1.html", type: .fullText),
                FurtherReading(title: "X. The Key", url: "http://www.gnosis.org/library/hermes10.html", type: .fullText),
                FurtherReading(title: "XI. Mind Unto Hermes", url: "http://www.gnosis.org/library/hermes11.html", type: .fullText),
                FurtherReading(title: "Sacred Texts Collection", url: "https://sacred-texts.com/chr/herm/index.htm", type: .fullText),
                FurtherReading(title: "Wikipedia", url: "https://en.wikipedia.org/wiki/Corpus_Hermeticum", type: .wikipedia)
            ],
            dragonComment: "The crossroads where Egypt met Greece met Gnosis. Every Western magical tradition traces back here. 'As above, so below'—the original debug statement. 🐉",
            isPublicDomain: true,
            difficulty: 3
        )
    ]
    
    // MARK: - Pistis Sophia (Askew Codex)
    
    static let pistisSophiaTexts: [GnosticText] = [
        GnosticText(
            name: "Pistis Sophia",
            alternateNames: ["Faith Wisdom", "Books of the Savior"],
            collection: .askewCodex,
            category: .dialogue,
            dateWritten: "3rd-4th century CE",
            summary: """
Massive, complex, ritual-heavy. Shows late-stage Gnosticism evolving toward mystery religion. Jesus spends 11 YEARS after resurrection teaching the disciples cosmic secrets.

The central story follows Sophia's fall through 13 aeons, her repentances (matched to Psalms and Odes of Solomon), and her eventual rescue by Jesus. The text is encyclopedic—covering cosmology, ethics, sin, the afterlife, and the structure of invisible realms.

Mary Magdalene dominates the dialogue, asking more questions than all other disciples combined. Peter complains: "My Lord, we cannot endure this woman, for she takes the opportunity from us and has let none of us speak."

Heavy on repentance liturgy and the journey of Sophia through the Archon realms. Contains the only surviving fragments of the Odes of Solomon—ancient Christian hymns otherwise lost.
""",
            keyTeachings: [
                "Sophia fell through 13 aeons, repenting at each level",
                "Jesus descended to rescue Sophia and her light",
                "11 years of post-resurrection teaching",
                "Mary Magdalene is the chief questioner",
                "Detailed maps of afterlife realms and their rulers",
                "Repentance linked to specific Psalms"
            ],
            significance: "The longest surviving Gnostic text. Before Nag Hammadi, this was our main window into Gnosticism. Preserves unique material including Odes of Solomon fragments.",
            textURL: "http://www.gnosis.org/library/pistis-sophia/index.htm",
            pdfURL: "https://ia802906.us.archive.org/11/items/PistisSophia/Pistis-Sophia.pdf",
            furtherReadingURLs: [
                FurtherReading(title: "Complete Text Index", url: "http://www.gnosis.org/library/pistis-sophia/index.htm", type: .fullText),
                FurtherReading(title: "Chapter 1", url: "http://www.gnosis.org/library/pistis-sophia/ps005.htm", type: .fullText),
                FurtherReading(title: "Sacred Texts Version", url: "https://sacred-texts.com/chr/ps/index.htm", type: .fullText),
                FurtherReading(title: "Archive.org PDF", url: "https://archive.org/details/pistissophiagnos00mead", type: .pdf),
                FurtherReading(title: "Wikipedia", url: "https://en.wikipedia.org/wiki/Pistis_Sophia", type: .wikipedia)
            ],
            dragonComment: "844 pages of cosmic secrets. Mary Magdalene asked so many questions Peter complained. That alone tells you who was really paying attention. 🐉",
            isPublicDomain: true,
            difficulty: 5
        )
    ]
    
    // MARK: - Mandaean Texts
    
    static let mandaeanTexts: [GnosticText] = [
        GnosticText(
            name: "Ginza Rabba",
            alternateNames: ["Great Treasure", "The Ginza"],
            collection: .mandaean,
            category: .liturgy,
            dateWritten: "Various periods, compiled 7th century CE",
            summary: """
The primary scripture of the Mandaeans—the ONLY surviving Gnostic religion, still practiced in Iraq and Iran today. Living proof that Gnosticism never fully died.

Divided into Right Ginza (theology, cosmology) and Left Ginza (liturgy for the dead). Contains creation myths, ethical teachings, and extensive ritual instructions.

The Mandaeans revere John the Baptist, consider Jesus a false prophet, practice ritual immersion (masbuta), and maintain traditions over 2000 years old. Their texts preserve Gnostic ideas in active, living practice.

While scholars studied 'dead' Gnosticism in museums, this tradition quietly continued in Iraqi marshlands.
""",
            keyTeachings: [
                "John the Baptist is the true prophet",
                "Jesus is viewed as a false messiah",
                "Ritual immersion (masbuta) is essential",
                "Light and darkness are in cosmic struggle",
                "The soul must return to the realm of light",
                "Living water connects to divine realms"
            ],
            significance: "Living proof that Gnosticism survived. The Mandaeans have maintained continuous tradition for 2000 years. They still baptize in rivers, still read their scriptures, still transmit their teachings.",
            textURL: "http://www.gnosis.org/library/ginza.htm",
            pdfURL: nil,
            furtherReadingURLs: [
                FurtherReading(title: "Ginza Excerpts", url: "http://www.gnosis.org/library/ginza.htm", type: .fullText),
                FurtherReading(title: "Wikipedia - Mandaeism", url: "https://en.wikipedia.org/wiki/Mandaeism", type: .wikipedia)
            ],
            dragonComment: "They told you Gnosticism was dead. 30,000 Mandaeans in Iraq would disagree. The tradition never stopped—it just went underground. 🐉",
            isPublicDomain: true,
            difficulty: 4
        )
    ]
    
    // MARK: - Other Texts
    
    static let otherTexts: [GnosticText] = [
        GnosticText(
            name: "The Books of Jeu",
            alternateNames: ["Two Books of Ieou"],
            collection: .bruceCodex,
            category: .liturgy,
            dateWritten: "3rd century CE",
            summary: """
Complex ritual texts containing diagrams, passwords, and formulas for the soul's ascent through heavenly realms. Part of the Bruce Codex discovered in Egypt.

Jesus teaches the disciples secret names, signs, and seals needed to pass through the cosmic barriers. Includes visual diagrams of celestial realms—among the earliest surviving Gnostic visual art.

Dense and technical—these were practical manuals for spiritual practice, not philosophical treatises.
""",
            keyTeachings: [
                "Secret names and passwords for ascending",
                "Visual diagrams of heavenly realms",
                "Seals and signs to pass archonic guards",
                "Ritual instructions for spiritual practice",
                "Treasury of Light as ultimate destination",
                "Jesus as revealer of cosmic secrets"
            ],
            significance: "Rare survival of Gnostic ritual practice. Shows Gnosticism wasn't just philosophy but active spiritual technology. Visual diagrams unique in Gnostic literature.",
            textURL: "http://www.gnosis.org/library/1jeub.htm",
            pdfURL: nil,
            furtherReadingURLs: [
                FurtherReading(title: "First Book of Jeu", url: "http://www.gnosis.org/library/1jeub.htm", type: .fullText),
                FurtherReading(title: "Second Book of Jeu", url: "http://www.gnosis.org/library/2jeub.htm", type: .fullText)
            ],
            dragonComment: "The cheat codes for escaping the simulation. Passwords, diagrams, secret names—they weren't playing around. 🐉",
            isPublicDomain: true,
            difficulty: 5
        )
    ]
}

// MARK: - Main View

struct GnosticLibraryView: View {
    @State private var selectedCollection: GnosticCollection?
    @State private var selectedCategory: GnosticCategory?
    @State private var searchText = ""
    @State private var showingTextDetail: GnosticText?
    @State private var showingBeingDetail: GnosticBeing?
    @State private var selectedTab = 0 // 0 = Texts, 1 = Cosmology, 2 = Overview
    
    private var filteredTexts: [GnosticText] {
        GnosticLibraryDatabase.allTexts.filter { text in
            let matchesCollection = selectedCollection == nil || text.collection == selectedCollection
            let matchesCategory = selectedCategory == nil || text.category == selectedCategory
            let matchesSearch = searchText.isEmpty ||
                text.name.localizedCaseInsensitiveContains(searchText) ||
                text.summary.localizedCaseInsensitiveContains(searchText)
            return matchesCollection && matchesCategory && matchesSearch
        }
    }
    
    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                // Header
                headerSection
                
                // Tab Picker
                tabPicker
                
                // Content based on tab
                switch selectedTab {
                case 0:
                    textsSection
                case 1:
                    cosmologySection
                case 2:
                    overviewSection
                default:
                    textsSection
                }
            }
            .padding()
        }
        .background(Color.black.ignoresSafeArea())
        .navigationTitle("Gnostic Library")
        .navigationBarTitleDisplayMode(.inline)
        .sheet(item: $showingTextDetail) { text in
            GnosticTextDetailView(text: text)
        }
        .sheet(item: $showingBeingDetail) { being in
            GnosticBeingDetailView(being: being)
        }
    }
    
    // MARK: - Header
    
    private var headerSection: some View {
        VStack(spacing: 12) {
            ZStack {
                // Glow effect
                Circle()
                    .fill(Color.purple.opacity(0.3))
                    .frame(width: 100, height: 100)
                    .blur(radius: 20)
                
                Circle()
                    .fill(
                        LinearGradient(
                            colors: [.purple, .blue, .indigo],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
                    .frame(width: 80, height: 80)
                
                Image(systemName: "books.vertical.fill")
                    .font(.system(size: 36))
                    .foregroundColor(.white)
            }
            
            Text("THE GNOSTIC LIBRARY")
                .font(.system(size: 20, weight: .black))
                .foregroundColor(.white)
            
            Text("Sacred Texts of Hidden Wisdom")
                .font(.system(size: 12))
                .foregroundColor(.gray)
            
            Text("\"Gnosis: Direct knowledge of the divine\"")
                .font(.system(size: 10))
                .foregroundColor(.purple)
                .italic()
        }
    }
    
    // MARK: - Tab Picker
    
    private var tabPicker: some View {
        HStack(spacing: 0) {
            tabButton("📜 Texts", index: 0)
            tabButton("🌌 Cosmology", index: 1)
            tabButton("📖 Overview", index: 2)
        }
        .background(Color.white.opacity(0.1))
        .cornerRadius(12)
    }
    
    private func tabButton(_ title: String, index: Int) -> some View {
        Button(action: { selectedTab = index }) {
            Text(title)
                .font(.system(size: 12, weight: .semibold))
                .foregroundColor(selectedTab == index ? .white : .gray)
                .padding(.vertical, 10)
                .frame(maxWidth: .infinity)
                .background(selectedTab == index ? Color.purple : Color.clear)
        }
        .cornerRadius(12)
    }
    
    // MARK: - Texts Section
    
    private var textsSection: some View {
        VStack(spacing: 16) {
            // Stats
            HStack(spacing: 20) {
                statBox("\(GnosticLibraryDatabase.allTexts.count)", "Texts", .purple)
                statBox("\(GnosticCollection.allCases.count)", "Collections", .blue)
                statBox("1945", "Nag Hammadi", .orange)
            }
            .padding()
            .background(Color.white.opacity(0.05))
            .cornerRadius(16)
            
            // Search
            HStack(spacing: 10) {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.gray)
                TextField("Search texts...", text: $searchText)
                    .foregroundColor(.white)
            }
            .padding(12)
            .background(Color.white.opacity(0.1))
            .cornerRadius(12)
            
            // Collection Filter
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 8) {
                    collectionPill(nil, "All")
                    ForEach(GnosticCollection.allCases, id: \.self) { collection in
                        collectionPill(collection, collection.rawValue.components(separatedBy: " ").first ?? collection.rawValue)
                    }
                }
            }
            
            // Texts by Collection
            ForEach(GnosticCollection.allCases, id: \.self) { collection in
                let texts = filteredTexts.filter { $0.collection == collection }
                if !texts.isEmpty && (selectedCollection == nil || selectedCollection == collection) {
                    collectionSection(collection, texts)
                }
            }
        }
    }
    
    private func collectionSection(_ collection: GnosticCollection, _ texts: [GnosticText]) -> some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Image(systemName: collection.icon)
                    .foregroundColor(collection.color)
                
                VStack(alignment: .leading, spacing: 2) {
                    Text(collection.rawValue)
                        .font(.system(size: 14, weight: .bold))
                        .foregroundColor(collection.color)
                    Text("\(texts.count) texts")
                        .font(.system(size: 10))
                        .foregroundColor(.gray)
                }
                
                Spacer()
            }
            
            ForEach(texts) { text in
                textCard(text)
            }
        }
    }
    
    private func textCard(_ text: GnosticText) -> some View {
        Button(action: { showingTextDetail = text }) {
            VStack(alignment: .leading, spacing: 8) {
                HStack(alignment: .top) {
                    Image(systemName: text.category.icon)
                        .foregroundColor(text.collection.color)
                        .frame(width: 24)
                    
                    VStack(alignment: .leading, spacing: 4) {
                        Text(text.name)
                            .font(.system(size: 14, weight: .semibold))
                            .foregroundColor(.white)
                        
                        Text(text.dateWritten)
                            .font(.system(size: 10))
                            .foregroundColor(.gray)
                        
                        // Difficulty
                        HStack(spacing: 2) {
                            ForEach(0..<5) { i in
                                Circle()
                                    .fill(i < text.difficulty ? text.collection.color : Color.white.opacity(0.2))
                                    .frame(width: 6, height: 6)
                            }
                            Text("Difficulty")
                                .font(.system(size: 8))
                                .foregroundColor(.gray)
                        }
                    }
                    
                    Spacer()
                    
                    VStack(spacing: 4) {
                        if text.textURL != nil {
                            Image(systemName: "link")
                                .font(.system(size: 10))
                                .foregroundColor(.green)
                        }
                        if text.pdfURL != nil {
                            Image(systemName: "doc.fill")
                                .font(.system(size: 10))
                                .foregroundColor(.red)
                        }
                        Image(systemName: "chevron.right")
                            .foregroundColor(.gray)
                            .font(.system(size: 12))
                    }
                }
            }
            .padding()
            .background(text.collection.color.opacity(0.1))
            .cornerRadius(12)
        }
    }
    
    private func collectionPill(_ collection: GnosticCollection?, _ title: String) -> some View {
        Button(action: { selectedCollection = collection }) {
            Text(title)
                .font(.system(size: 10, weight: .semibold))
                .foregroundColor(selectedCollection == collection ? .white : .gray)
                .padding(.horizontal, 10)
                .padding(.vertical, 6)
                .background(selectedCollection == collection ? (collection?.color ?? .white) : Color.white.opacity(0.1))
                .cornerRadius(16)
        }
    }
    
    // MARK: - Cosmology Section
    
    private var cosmologySection: some View {
        VStack(spacing: 16) {
            // Realms hierarchy
            Text("THE GNOSTIC COSMOS")
                .font(.system(size: 14, weight: .bold))
                .foregroundColor(.white)
            
            Text("From the Unknowable to the Material")
                .font(.system(size: 10))
                .foregroundColor(.gray)
            
            ForEach(GnosticRealm.allCases, id: \.self) { realm in
                realmCard(realm)
            }
            
            // Beings
            Text("DIVINE BEINGS")
                .font(.system(size: 14, weight: .bold))
                .foregroundColor(.white)
                .padding(.top)
            
            ForEach(GnosticLibraryDatabase.cosmologyBeings) { being in
                beingCard(being)
            }
        }
    }
    
    private func realmCard(_ realm: GnosticRealm) -> some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Circle()
                    .fill(realm.color)
                    .frame(width: 12, height: 12)
                
                Text(realm.rawValue)
                    .font(.system(size: 14, weight: .bold))
                    .foregroundColor(realm.color)
                
                Spacer()
            }
            
            Text(realm.description)
                .font(.system(size: 11))
                .foregroundColor(.white.opacity(0.8))
        }
        .padding()
        .background(realm.color.opacity(0.1))
        .cornerRadius(12)
    }
    
    private func beingCard(_ being: GnosticBeing) -> some View {
        Button(action: { showingBeingDetail = being }) {
            HStack {
                Circle()
                    .fill(being.realm.color)
                    .frame(width: 10, height: 10)
                
                VStack(alignment: .leading, spacing: 2) {
                    Text(being.name)
                        .font(.system(size: 13, weight: .semibold))
                        .foregroundColor(.white)
                    Text(being.realm.rawValue)
                        .font(.system(size: 10))
                        .foregroundColor(.gray)
                }
                
                Spacer()
                
                Image(systemName: "chevron.right")
                    .foregroundColor(.gray)
                    .font(.system(size: 12))
            }
            .padding()
            .background(Color.white.opacity(0.05))
            .cornerRadius(12)
        }
    }
    
    // MARK: - Overview Section
    
    private var overviewSection: some View {
        VStack(alignment: .leading, spacing: 20) {
            // Who Were the Gnostics
            VStack(alignment: .leading, spacing: 8) {
                Text("WHO WERE THE GNOSTICS?")
                    .font(.system(size: 14, weight: .bold))
                    .foregroundColor(.purple)
                
                Text(GnosticLibraryDatabase.gnosticOverview)
                    .font(.system(size: 12))
                    .foregroundColor(.white.opacity(0.9))
            }
            .padding()
            .background(Color.purple.opacity(0.1))
            .cornerRadius(12)
            
            // Gnostic Collapse
            VStack(alignment: .leading, spacing: 8) {
                Text("GNOSTIC CRITIQUE OF ABRAHAMIC RELIGIONS")
                    .font(.system(size: 14, weight: .bold))
                    .foregroundColor(.red)
                
                Text(GnosticLibraryDatabase.gnosticCollapse)
                    .font(.system(size: 12))
                    .foregroundColor(.white.opacity(0.9))
            }
            .padding()
            .background(Color.red.opacity(0.1))
            .cornerRadius(12)
            
            // Collections Overview
            VStack(alignment: .leading, spacing: 12) {
                Text("THE COLLECTIONS")
                    .font(.system(size: 14, weight: .bold))
                    .foregroundColor(.blue)
                
                ForEach(GnosticCollection.allCases, id: \.self) { collection in
                    VStack(alignment: .leading, spacing: 4) {
                        HStack {
                            Image(systemName: collection.icon)
                                .foregroundColor(collection.color)
                            Text(collection.rawValue)
                                .font(.system(size: 12, weight: .semibold))
                                .foregroundColor(collection.color)
                        }
                        Text(collection.description)
                            .font(.system(size: 10))
                            .foregroundColor(.white.opacity(0.7))
                    }
                    .padding(.vertical, 4)
                }
            }
            .padding()
            .background(Color.blue.opacity(0.1))
            .cornerRadius(12)
        }
    }
    
    // MARK: - Helpers
    
    private func statBox(_ value: String, _ label: String, _ color: Color) -> some View {
        VStack(spacing: 4) {
            Text(value)
                .font(.system(size: 20, weight: .bold))
                .foregroundColor(color)
            Text(label)
                .font(.system(size: 10))
                .foregroundColor(.gray)
        }
        .frame(maxWidth: .infinity)
    }
}

// MARK: - Text Detail View

struct GnosticTextDetailView: View {
    let text: GnosticText
    @Environment(\.dismiss) private var dismiss
    @Environment(\.openURL) private var openURL
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    // Header
                    VStack(spacing: 12) {
                        ZStack {
                            Circle()
                                .fill(text.collection.color.opacity(0.3))
                                .frame(width: 70, height: 70)
                            Image(systemName: text.category.icon)
                                .font(.system(size: 30))
                                .foregroundColor(text.collection.color)
                        }
                        
                        Text(text.name)
                            .font(.system(size: 18, weight: .bold))
                            .foregroundColor(.white)
                            .multilineTextAlignment(.center)
                        
                        if !text.alternateNames.isEmpty {
                            Text(text.alternateNames.joined(separator: " • "))
                                .font(.system(size: 10))
                                .foregroundColor(.gray)
                                .multilineTextAlignment(.center)
                        }
                        
                        HStack(spacing: 16) {
                            Label(text.collection.rawValue, systemImage: text.collection.icon)
                                .font(.system(size: 10))
                                .foregroundColor(text.collection.color)
                            
                            Label(text.dateWritten, systemImage: "calendar")
                                .font(.system(size: 10))
                                .foregroundColor(.gray)
                        }
                    }
                    .frame(maxWidth: .infinity)
                    
                    // Quick Links
                    if text.textURL != nil || text.pdfURL != nil {
                        VStack(alignment: .leading, spacing: 8) {
                            Text("READ THE TEXT")
                                .font(.system(size: 10, weight: .bold))
                                .foregroundColor(.green)
                            
                            HStack(spacing: 12) {
                                if let url = text.textURL, let urlObj = URL(string: url) {
                                    Button(action: { openURL(urlObj) }) {
                                        Label("Full Text", systemImage: "link")
                                            .font(.system(size: 12, weight: .semibold))
                                            .foregroundColor(.white)
                                            .padding(.horizontal, 16)
                                            .padding(.vertical, 8)
                                            .background(Color.green)
                                            .cornerRadius(8)
                                    }
                                }
                                
                                if let url = text.pdfURL, let urlObj = URL(string: url) {
                                    Button(action: { openURL(urlObj) }) {
                                        Label("PDF", systemImage: "doc.fill")
                                            .font(.system(size: 12, weight: .semibold))
                                            .foregroundColor(.white)
                                            .padding(.horizontal, 16)
                                            .padding(.vertical, 8)
                                            .background(Color.red)
                                            .cornerRadius(8)
                                    }
                                }
                            }
                        }
                        .padding()
                        .background(Color.green.opacity(0.1))
                        .cornerRadius(12)
                    }
                    
                    // Summary
                    sectionCard("SUMMARY", text.summary, "doc.text.fill", .blue)
                    
                    // Key Teachings
                    VStack(alignment: .leading, spacing: 8) {
                        HStack {
                            Image(systemName: "lightbulb.fill")
                                .foregroundColor(.yellow)
                            Text("KEY TEACHINGS")
                                .font(.system(size: 10, weight: .bold))
                                .foregroundColor(.yellow)
                        }
                        
                        ForEach(text.keyTeachings, id: \.self) { teaching in
                            HStack(alignment: .top, spacing: 8) {
                                Image(systemName: "star.fill")
                                    .font(.system(size: 8))
                                    .foregroundColor(.yellow)
                                    .padding(.top, 3)
                                Text(teaching)
                                    .font(.system(size: 12))
                                    .foregroundColor(.white)
                            }
                        }
                    }
                    .padding()
                    .background(Color.yellow.opacity(0.1))
                    .cornerRadius(12)
                    
                    // Significance
                    sectionCard("SIGNIFICANCE", text.significance, "star.circle.fill", .purple)
                    
                    // Dragon Comment
                    VStack(alignment: .leading, spacing: 8) {
                        HStack {
                            Text("🐉")
                            Text("DRAGON SAYS")
                                .font(.system(size: 10, weight: .bold))
                                .foregroundColor(.orange)
                        }
                        
                        Text(text.dragonComment)
                            .font(.system(size: 13))
                            .foregroundColor(.white)
                            .italic()
                    }
                    .padding()
                    .background(Color.orange.opacity(0.15))
                    .cornerRadius(12)
                    
                    // Further Reading
                    if !text.furtherReadingURLs.isEmpty {
                        VStack(alignment: .leading, spacing: 8) {
                            HStack {
                                Image(systemName: "book.fill")
                                    .foregroundColor(.cyan)
                                Text("FURTHER READING")
                                    .font(.system(size: 10, weight: .bold))
                                    .foregroundColor(.cyan)
                            }
                            
                            ForEach(text.furtherReadingURLs) { reading in
                                if let url = URL(string: reading.url) {
                                    Button(action: { openURL(url) }) {
                                        HStack {
                                            Text(reading.title)
                                                .font(.system(size: 12))
                                                .foregroundColor(.white)
                                            Spacer()
                                            Text(reading.type.rawValue)
                                                .font(.system(size: 9))
                                                .foregroundColor(.cyan)
                                                .padding(.horizontal, 6)
                                                .padding(.vertical, 2)
                                                .background(Color.cyan.opacity(0.2))
                                                .cornerRadius(4)
                                            Image(systemName: "arrow.up.right")
                                                .font(.system(size: 10))
                                                .foregroundColor(.cyan)
                                        }
                                    }
                                    .padding(.vertical, 4)
                                }
                            }
                        }
                        .padding()
                        .background(Color.cyan.opacity(0.1))
                        .cornerRadius(12)
                    }
                }
                .padding()
            }
            .background(Color.black.ignoresSafeArea())
            .navigationTitle("Text Details")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Done") { dismiss() }
                }
            }
        }
    }
    
    private func sectionCard(_ title: String, _ content: String, _ icon: String, _ color: Color) -> some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Image(systemName: icon)
                    .foregroundColor(color)
                Text(title)
                    .font(.system(size: 10, weight: .bold))
                    .foregroundColor(color)
            }
            
            Text(content)
                .font(.system(size: 12))
                .foregroundColor(.white)
        }
        .padding()
        .background(color.opacity(0.1))
        .cornerRadius(12)
    }
}

// MARK: - Being Detail View

struct GnosticBeingDetailView: View {
    let being: GnosticBeing
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    // Header
                    VStack(spacing: 12) {
                        Circle()
                            .fill(being.realm.color)
                            .frame(width: 60, height: 60)
                        
                        Text(being.name)
                            .font(.system(size: 18, weight: .bold))
                            .foregroundColor(.white)
                        
                        if !being.alternateNames.isEmpty {
                            Text(being.alternateNames.joined(separator: " • "))
                                .font(.system(size: 10))
                                .foregroundColor(.gray)
                                .multilineTextAlignment(.center)
                        }
                        
                        Text(being.realm.rawValue)
                            .font(.system(size: 12, weight: .semibold))
                            .foregroundColor(being.realm.color)
                            .padding(.horizontal, 12)
                            .padding(.vertical, 4)
                            .background(being.realm.color.opacity(0.2))
                            .cornerRadius(8)
                    }
                    .frame(maxWidth: .infinity)
                    
                    // Description
                    sectionCard("DESCRIPTION", being.description, "info.circle.fill", .blue)
                    
                    // Role
                    sectionCard("ROLE IN GNOSTIC COSMOS", being.role, "person.fill", .purple)
                    
                    // Symbolism
                    sectionCard("SYMBOLISM", being.symbolism, "sparkles", .yellow)
                }
                .padding()
            }
            .background(Color.black.ignoresSafeArea())
            .navigationTitle("Divine Being")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Done") { dismiss() }
                }
            }
        }
    }
    
    private func sectionCard(_ title: String, _ content: String, _ icon: String, _ color: Color) -> some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Image(systemName: icon)
                    .foregroundColor(color)
                Text(title)
                    .font(.system(size: 10, weight: .bold))
                    .foregroundColor(color)
            }
            
            Text(content)
                .font(.system(size: 12))
                .foregroundColor(.white)
        }
        .padding()
        .background(color.opacity(0.1))
        .cornerRadius(12)
    }
}

#Preview {
    NavigationView {
        GnosticLibraryView()
    }
}
