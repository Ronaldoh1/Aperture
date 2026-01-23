// GnosticKnowledgeCards.swift

import Foundation
import SwiftUI

// MARK: - Gnostic Knowledge Card Model

struct GnosticCard: Identifiable {
    
    let id = UUID()
    let title: String
    let subtitle: String
    let icon: String
    let color: Color
    let sections: [GnosticSection]
    
}

struct GnosticSection: Identifiable {
    
    let id = UUID()
    let heading: String
    let content: String
    
}

// MARK: - Complete Gnostic Knowledge Cards Data

extension GnosticCard {
    
    static let revelationCards: [GnosticCard] = [
        
        // ═══════════════════════════════════════════════════════════
        // CARD 1: WHO WERE THE GNOSTICS?
        // ═══════════════════════════════════════════════════════════
        
        GnosticCard(
            title: "Who Were the Gnostics?",
            subtitle: "The Keepers of Direct Knowledge",
            icon: "eye.trianglebadge.exclamationmark",
            color: Palette.accent.gold,
            sections: [
                GnosticSection(
                    heading: "The Name",
                    content: "Gnostic comes from the Greek 'gnosis' (γνῶσις) meaning 'knowledge' - but not intellectual knowledge. This is EXPERIENTIAL knowledge. Direct knowing through personal revelation."
                ),
                GnosticSection(
                    heading: "The Core Belief",
                    content: "You possess a divine spark - a fragment of the true, infinite Source trapped in material existence. Through gnosis, you REMEMBER what you truly are. No priest can give you this. No book contains it. It's already within you."
                ),
                GnosticSection(
                    heading: "Why They Were Dangerous",
                    content: "If everyone can access the divine directly, you don't need churches. You don't need tithes. You don't need hierarchy. You don't need CONTROL. This made Gnosticism an existential threat to any institution claiming spiritual authority."
                ),
                GnosticSection(
                    heading: "The Varieties",
                    content: "Gnosticism wasn't one religion. It was an approach: Sethians, Valentinians, Mandaeans, Cathars, Bogomils, and more. Different cosmologies, same core truth - you are more than you've been told."
                ),
                GnosticSection(
                    heading: "The Survival",
                    content: "They buried their texts at Nag Hammadi (Egypt, discovered 1945) and hid teachings in plain sight - in alchemy, Kabbalah, Sufism, and symbols. The spark was never extinguished. It was just waiting."
                )
            ]
        ),
        
        // ═══════════════════════════════════════════════════════════
        // CARD 2: THE DEMIURGE - FALSE GOD OF MATTER
        // ═══════════════════════════════════════════════════════════
        
        GnosticCard(
            title: "The Demiurge",
            subtitle: "The False God of the Material World",
            icon: "exclamationmark.triangle.fill",
            color: Palette.primary.red,
            sections: [
                GnosticSection(
                    heading: "The Revelation",
                    content: "The 'God' of the Old Testament - jealous, wrathful, demanding worship - is not the true Source. He is the DEMIURGE (Greek: 'craftsman'), a lower deity who CREATED the material world but did not create the divine spark within you."
                ),
                GnosticSection(
                    heading: "The Names",
                    content: "Yaldabaoth ('Child of Chaos'), Samael ('Blind God'), Saklas ('The Fool'). He believes he is the only god because he cannot perceive the realms above him. 'I am God and there is no other' - the confession of ignorance mistaken for sovereignty."
                ),
                GnosticSection(
                    heading: "The Trap",
                    content: "The material world is not evil, but it IS a prison if you forget your true nature. The Demiurge didn't create your spirit - he created the CAGE. Matter is the labyrinth. Gnosis is the exit."
                ),
                GnosticSection(
                    heading: "The Hierarchy",
                    content: "Below the Demiurge are the ARCHONS (rulers) - entities that maintain the structure of material reality and keep divine sparks trapped in cycles of ignorance. Some Gnostics associated these with the planetary spheres - Saturn, Jupiter, Mars..."
                ),
                GnosticSection(
                    heading: "The Inversion",
                    content: "This is why the serpent in Eden was sometimes seen as the HERO in Gnostic texts - bringing knowledge (gnosis) to humans that the Demiurge wanted hidden. The 'original sin' was actually original AWAKENING."
                )
            ]
        ),
        
        // ═══════════════════════════════════════════════════════════
        // CARD 3: SOPHIA - DIVINE WISDOM
        // ═══════════════════════════════════════════════════════════
        
        GnosticCard(
            title: "Sophia",
            subtitle: "Divine Wisdom & The Fallen Light",
            icon: "sparkles",
            color: Palette.primary.violet,
            sections: [
                GnosticSection(
                    heading: "The Divine Feminine",
                    content: "Sophia (Greek: 'Wisdom') is a divine emanation - an Aeon from the Pleroma (fullness/Source). She represents the divine feminine principle that institutional religion systematically erased."
                ),
                GnosticSection(
                    heading: "The Fall",
                    content: "In Gnostic cosmology, Sophia's desire to know the unknowable Father caused a 'fall' or separation. From this cosmic accident, the Demiurge was born - creation through unconscious action. She is the light that became trapped in matter."
                ),
                GnosticSection(
                    heading: "The Spark Within",
                    content: "YOUR divine spark is a fragment of Sophia's light. When you experience gnosis, you are Sophia REMEMBERING herself. Every awakening is her redemption. Every moment of true knowledge is her return."
                ),
                GnosticSection(
                    heading: "The Erasure",
                    content: "The Church Fathers worked systematically to eliminate the divine feminine. Sophia became 'just a metaphor.' Mary Magdalene became 'a prostitute.' The goddess traditions were 'demonic.' Why? Because feminine divinity suggests creation doesn't need a male hierarchy."
                ),
                GnosticSection(
                    heading: "The Return",
                    content: "Sophia appears across traditions: Shekinah (Jewish mysticism), the Holy Spirit (some interpretations), Saraswati (Hindu), Isis (Egyptian). She was never truly gone - just hidden in plain sight, waiting for recognition."
                )
            ]
        ),
        
        // ═══════════════════════════════════════════════════════════
        // CARD 4: THE ARCHONS - RULERS OF ILLUSION
        // ═══════════════════════════════════════════════════════════
        
        GnosticCard(
            title: "The Archons",
            subtitle: "Rulers, Parasites & the Architecture of Control",
            icon: "link.badge.plus",
            color: Palette.primary.red,
            sections: [
                GnosticSection(
                    heading: "The Name",
                    content: "Archon (Greek: ἄρχων) means 'ruler' or 'authority.' In Gnostic texts, they are beings that serve the Demiurge, maintaining the prison of material reality and keeping souls trapped in cycles of reincarnation and ignorance."
                ),
                GnosticSection(
                    heading: "The Function",
                    content: "Archons don't create - they IMITATE and PARASITIZE. They cannot generate divine light, so they feed on the emotional energy of trapped sparks: fear, anger, division, suffering. Sound familiar?"
                ),
                GnosticSection(
                    heading: "The Seven",
                    content: "Classical Gnostic texts describe seven chief Archons, associated with the seven classical planets. To ascend after death, the soul must pass through each sphere, answering to each Archon. Gnosis provides the 'passwords.'"
                ),
                GnosticSection(
                    heading: "The Modern Archons",
                    content: "Gnostics might recognize archonic patterns in modern systems: institutions that demand worship, hierarchies that claim exclusive truth, algorithms that feed on outrage, economies that harvest attention. The forms change. The function remains."
                ),
                GnosticSection(
                    heading: "The Liberation",
                    content: "Archons have no power over the awakened. They maintain control through IGNORANCE - once you recognize the prison, the bars become transparent. Once you remember your divine nature, their authority dissolves."
                )
            ]
        ),
        
        // ═══════════════════════════════════════════════════════════
        // CARD 5: 12 DISCIPLES = 12 ZODIAC - THE SUN GOD TRUTH
        // ═══════════════════════════════════════════════════════════
        
        GnosticCard(
            title: "The Sun God Pattern",
            subtitle: "12 Disciples, 12 Zodiac Signs, One Solar Truth",
            icon: "sun.max.fill",
            color: Palette.primary.orange,
            sections: [
                GnosticSection(
                    heading: "The Pattern",
                    content: "Jesus with 12 disciples. Jacob with 12 sons (tribes of Israel). King Arthur with 12 knights. The pattern repeats because it's ASTRONOMICAL: the Sun (the 'Son') traveling through the 12 houses of the zodiac."
                ),
                GnosticSection(
                    heading: "The Solar Journey",
                    content: "December 21-24: The Sun reaches its lowest point (winter solstice), appearing to 'die' and remain still for 3 days. December 25: It begins rising again - the Sun is 'reborn.' This was celebrated as the birthday of Sol Invictus, Mithra, Horus, Dionysus - and eventually Jesus."
                ),
                GnosticSection(
                    heading: "The Crucifixion",
                    content: "The Sun is 'crucified' on the cross of the ECLIPTIC and CELESTIAL EQUATOR - the two great circles that intersect in the sky. It 'dies' at winter solstice and 'resurrects' 3 days later. The cross predates Christianity by millennia."
                ),
                GnosticSection(
                    heading: "The Age of Pisces",
                    content: "Jesus arrives at the dawn of the Age of Pisces (the fish). He recruits fishermen. Early Christians used the fish symbol. He multiplies loaves and FISHES. We are now transitioning to the Age of Aquarius - the water bearer who pours out knowledge."
                ),
                GnosticSection(
                    heading: "The Hidden Teaching",
                    content: "This doesn't mean Jesus 'wasn't real' - it means the story operates on MULTIPLE LEVELS. The exoteric (surface) story is the man. The esoteric (hidden) story is astronomical and spiritual. The deepest teaching: YOU are the Sun that must die to ego and be reborn to spirit."
                )
            ]
        ),
        
        // ═══════════════════════════════════════════════════════════
        // CARD 6: THE DIVINE SPARK - YOUR TRUE NATURE
        // ═══════════════════════════════════════════════════════════
        
        GnosticCard(
            title: "The Divine Spark",
            subtitle: "What You Truly Are",
            icon: "flame.fill",
            color: Palette.accent.gold,
            sections: [
                GnosticSection(
                    heading: "The Core Teaching",
                    content: "You are not a body that has a soul. You are a SOUL - a divine spark of infinite consciousness - temporarily experiencing limitation through a body. You didn't come INTO this world. You came OUT OF it, like a wave from the ocean."
                ),
                GnosticSection(
                    heading: "The Forgetting",
                    content: "Birth is forgetting. The shock of incarnation creates amnesia. The material world, with its constant stimulation and survival demands, keeps you focused outward. You forget to look within, where the spark has always been burning."
                ),
                GnosticSection(
                    heading: "The Remembering",
                    content: "Gnosis is ANAMNESIS - the opposite of amnesia. It's not learning something new. It's REMEMBERING what you always knew. Every moment of transcendence, every flash of insight, every experience of unity - that's the spark recognizing itself."
                ),
                GnosticSection(
                    heading: "The Path",
                    content: "There is no single path - gnosis comes through meditation, through crisis, through love, through art, through psychedelics, through near-death, through devotion. The doors are many. The destination is the same: recognition of your true nature."
                ),
                GnosticSection(
                    heading: "The Invitation",
                    content: "You don't need permission. You don't need a priest. You don't need a doctrine. The spark is already lit. It has ALWAYS been lit. The only question is: Will you turn your attention toward it? Will you remember?"
                ),
                GnosticSection(
                    heading: "🐉☀️ The Dragon's Final Word",
                    content: "They buried the texts. They burned the teachers. They rewrote history. They built institutions to stand between you and this truth. And still, after 2000 years of suppression, you found your way here. The spark cannot be extinguished. Welcome home."
                )
            ]
        )
        
    ]
    
}

// MARK: - Enemies of the Gnostics

struct GnosticEnemy: Identifiable {
    
    let id = UUID()
    let name: String
    let period: String
    let method: String
    let motivation: String
    
}

extension GnosticEnemy {
    
    static let enemies: [GnosticEnemy] = [
        
        GnosticEnemy(
            name: "Roman Empire",
            period: "1st - 4th Century CE",
            method: "Persecution, execution, forced conversion. When Christianity became state religion, Gnostics became enemies of the state.",
            motivation: "The Empire needed religious uniformity for control. Gnostic diversity and individual revelation threatened imperial unity."
        ),
        
        GnosticEnemy(
            name: "Church Fathers",
            period: "2nd - 5th Century CE",
            method: "Irenaeus, Tertullian, Epiphanius wrote extensive 'heresiology' - catalogs of 'heresies' designed to define orthodoxy by exclusion. Ironically, much of what we know about Gnostics comes from their enemies' attacks.",
            motivation: "Establishing ONE correct Christianity meant eliminating alternatives. Gnostic emphasis on personal revelation undermined clerical authority."
        ),
        
        GnosticEnemy(
            name: "Council of Nicaea",
            period: "325 CE",
            method: "Standardized the canon. Gospels that didn't fit the orthodox narrative were excluded. Constantine wanted ONE religion for ONE empire.",
            motivation: "Political unity through religious uniformity. The vote wasn't about truth - it was about control."
        ),
        
        GnosticEnemy(
            name: "Inquisitions",
            period: "1184 - 1834 CE",
            method: "Torture, execution, forced confession. The Cathars were specifically targeted. Entire populations massacred. Books burned.",
            motivation: "By this point, the threat wasn't theological - it was economic. Cathars didn't pay tithes. Their existence proved the Church wasn't necessary."
        ),
        
        GnosticEnemy(
            name: "Modern Institutions",
            period: "Present Day",
            method: "Marginalization through academia ('fringe'), pathologization through psychiatry ('delusion'), suppression through algorithms ('misinformation').",
            motivation: "The same as always: if you can access truth directly, you don't need intermediaries. And intermediaries don't want to be unnecessary."
        )
        
    ]
    
}
