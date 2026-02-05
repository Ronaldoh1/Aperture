// GuestModeManager.swift
// Manages guest access with sample content previews
// Allows users to explore before requiring authentication

import SwiftUI
import Combine

// MARK: - Guest Mode Manager

@MainActor
class GuestModeManager: ObservableObject {
    
    static let shared = GuestModeManager()
    
    @Published var isGuestMode: Bool = false
    @Published var hasSeenWelcome: Bool = false
    @Published var sampleContentViewed: Set<String> = []
    @Published var promptsShown: Int = 0
    
    private let maxFreeContent = 3 // Number of full content items before prompting
    private let storageKey = "aperture.guestMode.v1"
    
    private init() {
        load()
    }
    
    // MARK: - Guest Access
    
    func enterGuestMode() {
        isGuestMode = true
        hasSeenWelcome = true
        save()
    }
    
    func exitGuestMode() {
        isGuestMode = false
        save()
    }
    
    func markWelcomeSeen() {
        hasSeenWelcome = true
        save()
    }
    
    func markContentViewed(_ contentId: String) {
        sampleContentViewed.insert(contentId)
        save()
    }
    
    var shouldPromptSignUp: Bool {
        sampleContentViewed.count >= maxFreeContent
    }
    
    func incrementPrompts() {
        promptsShown += 1
        save()
    }
    
    // MARK: - Persistence
    
    private func load() {
        if let data = UserDefaults.standard.data(forKey: storageKey),
           let state = try? JSONDecoder().decode(GuestState.self, from: data) {
            isGuestMode = state.isGuestMode
            hasSeenWelcome = state.hasSeenWelcome
            sampleContentViewed = state.sampleContentViewed
            promptsShown = state.promptsShown
        }
    }
    
    private func save() {
        let state = GuestState(
            isGuestMode: isGuestMode,
            hasSeenWelcome: hasSeenWelcome,
            sampleContentViewed: sampleContentViewed,
            promptsShown: promptsShown
        )
        if let data = try? JSONEncoder().encode(state) {
            UserDefaults.standard.set(data, forKey: storageKey)
        }
    }
    
    func reset() {
        isGuestMode = false
        hasSeenWelcome = false
        sampleContentViewed = []
        promptsShown = 0
        save()
    }
}

struct GuestState: Codable {
    let isGuestMode: Bool
    let hasSeenWelcome: Bool
    let sampleContentViewed: Set<String>
    let promptsShown: Int
}

// MARK: - Sample Content Provider

struct SampleContentProvider {
    
    // MARK: - Cosmos Samples
    
    static let cosmosSamples: [CosmosSample] = [
        CosmosSample(
            id: "pleroma",
            title: "The Pleroma",
            subtitle: "The Fullness - Divine Source",
            description: """
            In Gnostic cosmology, the Pleroma (Greek: "fullness") represents the totality of divine powers and emanations. It is the realm of pure light, the dwelling place of the True God beyond the material universe.
            
            Within the Pleroma exist the Aeons - divine beings that emanate from the Source. Each Aeon represents an aspect of divine consciousness: Truth, Mind, Word, Life, and most importantly, Sophia (Wisdom).
            
            The Gnostic understanding differs radically from orthodox Christianity: the God who created the material world is NOT the True God. The True God dwells in the Pleroma, far beyond the flawed creation we inhabit.
            """,
            keyPoints: [
                "The Pleroma is the realm of the True God",
                "Aeons are divine emanations within the Pleroma",
                "Our material world was NOT created by the True God",
                "Sophia's fall from the Pleroma created the Demiurge"
            ],
            relatedEntities: ["Sophia", "Aeons", "Monad", "Barbelo"],
            color: "#FFD700"
        ),
        CosmosSample(
            id: "sophia",
            title: "Sophia - Divine Wisdom",
            subtitle: "The Fallen Aeon",
            description: """
            Sophia is the central figure in Gnostic mythology. As the youngest Aeon, she desired to know the unknowable Father and, in her passion, fell from the Pleroma.
            
            Her fall created the material realm and gave birth to the Demiurge (Yaldabaoth) - the ignorant god who believes himself to be the only god and created our flawed material world.
            
            The spark of Sophia remains trapped in humanity. Gnosis (spiritual knowledge) is the path to reuniting this divine spark with its source. The Gnostic journey is essentially helping Sophia return home.
            """,
            keyPoints: [
                "Sophia fell from the Pleroma seeking knowledge",
                "Her fall created the material realm",
                "She gave birth to the Demiurge (blind creator god)",
                "Her divine spark is trapped in humanity",
                "Awakening = helping Sophia (and ourselves) return"
            ],
            relatedEntities: ["Pleroma", "Yaldabaoth", "Christ Aeon"],
            color: "#9B59B6"
        ),
        CosmosSample(
            id: "demiurge",
            title: "Yaldabaoth - The Demiurge",
            subtitle: "The Blind God",
            description: """
            Yaldabaoth (also called Samael, Saklas, or simply the Demiurge) is the creator of the material world in Gnostic texts. Born from Sophia's fall, he is ignorant of the divine realm above him.
            
            "I am God and there is no other beside me." - This declaration from Yaldabaoth reveals his ignorance. He believes himself to be the supreme deity, unaware of the True God in the Pleroma.
            
            The Gnostics identified Yaldabaoth with the wrathful, jealous god of the Old Testament. This was a revolutionary interpretation that explained why the world seems so flawed - it was created by an imperfect, ignorant being.
            """,
            keyPoints: [
                "Created from Sophia's error",
                "Believes himself to be the only god",
                "Created the material world and the Archons",
                "Identified with the Old Testament god",
                "Keeps humanity trapped in ignorance"
            ],
            relatedEntities: ["Sophia", "Archons", "Material World"],
            color: "#C0392B"
        )
    ]
    
    // MARK: - Alexandria Samples
    
    static let alexandriaSamples: [AlexandriaSample] = [
        AlexandriaSample(
            id: "gospel_thomas",
            title: "Gospel of Thomas",
            subtitle: "114 Sayings of Jesus",
            category: "Nag Hammadi Library",
            dateWritten: "50-140 CE (disputed)",
            discoveryInfo: "Found at Nag Hammadi, Egypt in 1945",
            description: """
            The Gospel of Thomas is a collection of 114 sayings attributed to Jesus, with no narrative structure. Unlike the canonical gospels, it contains no miracles, no crucifixion, and no resurrection story.
            
            Many scholars believe some sayings may be older than those in the canonical gospels. The text emphasizes self-knowledge as the path to salvation:
            
            "If you bring forth what is within you, what you bring forth will save you. If you do not bring forth what is within you, what you do not bring forth will destroy you."
            
            This is gnosis - the inner knowledge that transforms.
            """,
            sampleQuotes: [
                "The kingdom is inside of you, and it is outside of you. When you come to know yourselves, then you will become known.",
                "If your leaders say to you, 'Look, the kingdom is in the sky,' then the birds will get there before you.",
                "Split a piece of wood; I am there. Lift up a stone, and you will find me there."
            ],
            whyHidden: "Excluded from the Bible because it emphasized personal revelation over institutional authority. The sayings suggest that each person can access divine wisdom directly, without priests or church hierarchy.",
            color: "#E67E22"
        ),
        AlexandriaSample(
            id: "apocryphon_john",
            title: "Apocryphon of John",
            subtitle: "Secret Book of John",
            category: "Nag Hammadi Library",
            dateWritten: "180 CE (approximate)",
            discoveryInfo: "Found at Nag Hammadi, Egypt in 1945",
            description: """
            The Apocryphon (Secret Book) of John is perhaps the most important Gnostic text. It presents a complete cosmology explaining how the True God, the fall of Sophia, and the creation of the material world by the Demiurge.
            
            The text begins after the crucifixion, with John grieving. Christ appears to him and reveals secret teachings about the true nature of reality - teachings that were never meant for the masses.
            
            This text directly contradicts Genesis, presenting the God of the Old Testament as a deluded, inferior being who keeps humanity trapped in ignorance.
            """,
            sampleQuotes: [
                "The Monad is a monarchy with nothing above it. It is God and Father of everything, the invisible One who is above everything.",
                "He said with arrogance, 'I am God and there is no other God beside me.' - not knowing whence his strength had come.",
                "They brought Adam into the shadow of death so that they might form him again from earth, water, fire, and spirit."
            ],
            whyHidden: "This text was actively suppressed because it presents a completely different creation story, identifies the Old Testament god as a villain, and teaches that salvation comes through knowledge rather than faith.",
            color: "#3498DB"
        ),
        AlexandriaSample(
            id: "corpus_hermeticum",
            title: "Corpus Hermeticum",
            subtitle: "Hermetic Teachings",
            category: "Hermetic Texts",
            dateWritten: "100-300 CE",
            discoveryInfo: "Survived through Byzantine transmission; brought to Florence in 1460",
            description: """
            The Corpus Hermeticum is a collection of texts attributed to Hermes Trismegistus ("Thrice-Great Hermes"), a legendary sage combining the Greek god Hermes with the Egyptian god Thoth.
            
            These texts present a philosophical and spiritual system emphasizing the divine nature of the mind, the correspondence between macrocosm and microcosm, and the possibility of spiritual ascent.
            
            The famous phrase "As above, so below" comes from the Emerald Tablet, a related Hermetic text. This principle suggests that the patterns of the cosmos are reflected in the individual.
            """,
            sampleQuotes: [
                "As above, so below; as below, so above. - Emerald Tablet",
                "The lips of wisdom are closed, except to the ears of Understanding.",
                "Mind, the father of all, being Life and Light, gave birth to Man, a Being like to Himself."
            ],
            whyHidden: "Hermetic texts were not as actively suppressed as Gnostic ones, but they were marginalized as 'pagan philosophy.' During the Renaissance, their rediscovery sparked a revolution in Western thought.",
            color: "#1ABC9C"
        )
    ]
    
    // MARK: - Awakening Path Samples
    
    static let awakeningPathSamples: [AwakeningPathSample] = [
        AwakeningPathSample(
            id: "kundalini",
            name: "Kundalini Awakening",
            tradition: "Hinduism",
            region: "India / Global",
            icon: "flame.fill",
            color: "#FF6B00",
            energyName: "Kundalini Shakti",
            tagline: "Dormant serpent energy rises through chakras for divine union",
            overview: """
            Kundalini is described as a coiled serpent of spiritual energy lying dormant at the base of the spine. Through specific practices, this energy awakens and rises through the seven chakras, ultimately reaching the crown for enlightenment.
            
            This is one of the most powerful and well-documented awakening paths, with thousands of years of practice. The energy is often experienced as heat, vibration, or electrical sensations moving through the body.
            """,
            keyPractices: [
                "Pranayama (breath control)",
                "Chakra meditation",
                "Yoga asanas",
                "Mantra chanting"
            ],
            warnings: [
                "Kundalini awakening can be intense - build gradually",
                "Seek experienced guidance if symptoms become overwhelming"
            ],
            universalConnection: "The same energy is called Qi in Taoism, Holy Spirit in Christianity, and Ki in Japanese traditions. Different names, same force."
        ),
        AwakeningPathSample(
            id: "buddhism",
            name: "Bodhi (Enlightenment)",
            tradition: "Buddhism",
            region: "Asia / Global",
            icon: "leaf.circle.fill",
            color: "#FFD700",
            energyName: "Buddha Nature / Awareness",
            tagline: "Insight through meditation for liberation from suffering",
            overview: """
            Buddhism teaches that all beings have Buddha Nature - the potential for awakening. Through meditation, ethical conduct, and wisdom, we realize what was always already present.
            
            The Buddha awakened under the Bodhi tree 2,500 years ago and taught the path to liberation from suffering. Key insight: suffering arises from craving and ignorance of our true nature.
            """,
            keyPractices: [
                "Shamatha (calm abiding meditation)",
                "Vipassana (insight meditation)",
                "Metta (loving-kindness)",
                "Mindful living"
            ],
            warnings: [
                "Intensive practice can bring up difficult material",
                "Find qualified teacher for guidance"
            ],
            universalConnection: "The Buddhist concept of 'no-self' parallels the Christian mystical 'death of ego,' Sufi 'fana,' and Taoist 'emptiness.' All point to transcending limited identity."
        ),
        AwakeningPathSample(
            id: "christianity_mystical",
            name: "Christ Consciousness",
            tradition: "Christian Mysticism",
            region: "West / Global",
            icon: "cross.fill",
            color: "#7B68EE",
            energyName: "Holy Spirit / Divine Grace",
            tagline: "Indwelling Holy Spirit for rebirth, love, and divine union",
            overview: """
            Christian mysticism teaches awakening through direct experience of the Divine - the indwelling presence of Christ and the transforming power of the Holy Spirit.
            
            Unlike popular Christianity focused on belief, the mystical tradition emphasizes direct experience of God through contemplative prayer, surrender, and love. Key figures: Meister Eckhart, St. John of the Cross, Teresa of Avila.
            """,
            keyPractices: [
                "Centering Prayer",
                "Lectio Divina (sacred reading)",
                "Contemplative silence",
                "Service to others"
            ],
            warnings: [
                "Don't abandon community and sacraments",
                "Dark night experiences are normal, not failures"
            ],
            universalConnection: "'Christ in you, the hope of glory' parallels the Hindu Atman, Buddhist Buddha Nature, and Sufi divine spark. The divine is not separate but within."
        ),
        AwakeningPathSample(
            id: "taoism",
            name: "Qi Cultivation",
            tradition: "Taoism",
            region: "China / Asia",
            icon: "wind",
            color: "#00B4D8",
            energyName: "Qi (Chi)",
            tagline: "Balance life force for harmony, health, and immortality",
            overview: """
            Taoist practices cultivate Qi (life force energy) through movement, breath, meditation, and lifestyle. The goal is harmony with the Tao - the fundamental nature of reality.
            
            Rather than forcing awakening, Taoism emphasizes natural flow, balance of yin and yang, and alignment with cosmic rhythms. Key concept: Wu Wei (effortless action in harmony with nature).
            """,
            keyPractices: [
                "Qigong movements",
                "Tai Chi",
                "Standing meditation (Zhan Zhuang)",
                "Dantian breathing"
            ],
            warnings: [
                "Build foundation before advanced practices",
                "Don't force energy circulation"
            ],
            universalConnection: "Qi is Prana in yoga, Ruach in Hebrew, Pneuma in Greek. Every culture recognized life force energy flowing through all things."
        ),
        AwakeningPathSample(
            id: "sufism",
            name: "Fana (Annihilation in God)",
            tradition: "Sufism (Islamic Mysticism)",
            region: "Middle East / Global",
            icon: "heart.circle.fill",
            color: "#8B0000",
            energyName: "Divine Love / Ishq",
            tagline: "Love dissolves the ego for union with the Beloved",
            overview: """
            Sufism is the mystical heart of Islam, teaching that love is the path to God. Through devotion, dhikr (remembrance), and the guidance of a sheikh, the seeker's ego dissolves into divine unity.
            
            Rumi, the famous Sufi poet, wrote: "I have lived on the lip of insanity, wanting to know reasons, knocking on a door. It opens. I've been knocking from the inside."
            """,
            keyPractices: [
                "Dhikr (remembrance of divine names)",
                "Whirling meditation",
                "Poetry and music",
                "Devotion to the Beloved"
            ],
            warnings: [
                "Requires authentic teacher (sheikh)",
                "Ego death can be disorienting"
            ],
            universalConnection: "Sufi fana (annihilation) is identical to Buddhist anatta (no-self) and Christian kenosis (self-emptying). Love dissolves the illusion of separation."
        )
    ]
    
    // MARK: - Oneness Summary
    
    static let onenessProof = """
    Every awakening tradition, regardless of culture, language, or time period, guides practitioners through the same fundamental process:
    
    1. ENERGY ACTIVATION
    - Kundalini (Hindu) = Qi (Taoist) = Holy Spirit (Christian) = Ki (Japanese) = Ashe (Yoruba) = Mana (Polynesian)
    
    2. EGO DISSOLUTION  
    - Fana (Sufi) = Anatta (Buddhist) = Death of Self (Christian) = Void (Taoist)
    
    3. UNITY CONSCIOUSNESS
    - Brahman (Hindu) = Tao (Taoist) = Kingdom of Heaven (Christian) = Buddha Nature (Buddhist) = Dreamtime (Aboriginal)
    
    The names change, but the mechanism is universal. This is the proof that we are all the same.
    """
}

// MARK: - Sample Models

struct CosmosSample: Identifiable {
    let id: String
    let title: String
    let subtitle: String
    let description: String
    let keyPoints: [String]
    let relatedEntities: [String]
    let color: String
    
    var uiColor: Color { Color(hex: color) }
}

struct AlexandriaSample: Identifiable {
    let id: String
    let title: String
    let subtitle: String
    let category: String
    let dateWritten: String
    let discoveryInfo: String
    let description: String
    let sampleQuotes: [String]
    let whyHidden: String
    let color: String
    
    var uiColor: Color { Color(hex: color) }
}

struct AwakeningPathSample: Identifiable {
    let id: String
    let name: String
    let tradition: String
    let region: String
    let icon: String
    let color: String
    let energyName: String
    let tagline: String
    let overview: String
    let keyPractices: [String]
    let warnings: [String]
    let universalConnection: String
    
    var uiColor: Color { Color(hex: color) }
}
