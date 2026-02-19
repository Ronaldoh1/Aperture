// ConsciousnessCourseEntity.swift
// PhD-LEVEL CONSCIOUSNESS EDUCATION
// "The most important subject never taught in school"

import Foundation
import SwiftUI

// MARK: - Course Structure

struct ConsciousnessModule: Identifiable, Codable {
    let id: String
    let number: Int
    let title: String
    let subtitle: String
    let icon: String
    let colorHex: String
    let overview: String
    let lessons: [Lesson]
    let estimatedMinutes: Int
    let difficulty: Difficulty
    
    var color: Color { Color(hex: colorHex) }
    
    struct Lesson: Identifiable, Codable {
        let id: String
        let number: Int
        let title: String
        let duration: Int // minutes
        let content: [ContentBlock]
        let keyTakeaways: [String]
        let reflectionPrompts: [String]
        let furtherReading: [String]
    }
    
    enum ContentBlock: Codable, Identifiable {
        case text(String)
        case quote(text: String, author: String)
        case concept(title: String, explanation: String)
        case warning(String)
        case insight(String)
        case practice(title: String, instructions: String, duration: String)
        
        var id: String {
            switch self {
            case .text(let s): return "text_\(s.prefix(20))"
            case .quote(let t, _): return "quote_\(t.prefix(20))"
            case .concept(let t, _): return "concept_\(t)"
            case .warning(let s): return "warning_\(s.prefix(20))"
            case .insight(let s): return "insight_\(s.prefix(20))"
            case .practice(let t, _, _): return "practice_\(t)"
            }
        }
    }
    
    enum Difficulty: String, Codable {
        case foundational = "Foundational"
        case intermediate = "Intermediate"
        case advanced = "Advanced"
        case expert = "Expert"
        
        var color: Color {
            switch self {
            case .foundational: return .green
            case .intermediate: return .yellow
            case .advanced: return .orange
            case .expert: return .red
            }
        }
    }
}

// MARK: - User Progress

struct CourseProgress: Codable {
    var completedLessons: [String] // lesson IDs
    var completedModules: [String] // module IDs
    var currentModuleId: String?
    var currentLessonId: String?
    var totalTimeSpent: TimeInterval
    var lastAccessDate: Date?
    var notes: [String: String] // lessonId: notes
    
    var totalLessonsCompleted: Int { completedLessons.count }
    
    static var `default`: CourseProgress {
        CourseProgress(completedLessons: [], completedModules: [], totalTimeSpent: 0, notes: [:])
    }
}

// MARK: - THE COURSE DATABASE

final class ConsciousnessCourseDatabase {
    
    static let shared = ConsciousnessCourseDatabase()
    private init() {}
    
    var totalLessons: Int {
        modules.reduce(0) { $0 + $1.lessons.count }
    }
    
    var totalMinutes: Int {
        modules.reduce(0) { $0 + $1.estimatedMinutes }
    }
    
    // ═══════════════════════════════════════════════════════════════════
    // MODULE 1: WHAT IS CONSCIOUSNESS?
    // ═══════════════════════════════════════════════════════════════════
    
    let modules: [ConsciousnessModule] = [
        
        ConsciousnessModule(
            id: "mod_1_what_is",
            number: 1,
            title: "What Is Consciousness?",
            subtitle: "The hardest question ever asked",
            icon: "questionmark.circle.fill",
            colorHex: "#9C27B0",
            overview: "We begin with the most fundamental question: What IS consciousness? Why is there 'something it is like' to be you? This module explores why consciousness is considered the 'hard problem' of science and philosophy—and why solving it would change everything.",
            lessons: [
                ConsciousnessModule.Lesson(
                    id: "1_1_hard_problem",
                    number: 1,
                    title: "The Hard Problem",
                    duration: 8,
                    content: [
                        .text("In 1994, philosopher David Chalmers introduced a distinction that changed the field forever. He separated the 'easy problems' of consciousness from the 'hard problem.'"),
                        .concept(title: "Easy Problems", explanation: "How does the brain process information? How do we focus attention? How do we report mental states? These are 'easy' not because they're simple, but because we know what a solution would look like—neural mechanisms."),
                        .concept(title: "The Hard Problem", explanation: "Why is there subjective experience at all? Why doesn't all this information processing happen 'in the dark'? Why is there something it is LIKE to see red, feel pain, or taste chocolate?"),
                        .quote(text: "Even when we have explained the performance of all the cognitive and behavioral functions in the vicinity of experience—perceptual discrimination, categorization, internal access, verbal report—there may still remain a further unanswered question: Why is the performance of these functions accompanied by experience?", author: "David Chalmers"),
                        .text("Consider: A thermostat processes information about temperature. A computer processes billions of calculations. But neither (presumably) has subjective experience. So why do YOU?"),
                        .insight("The hard problem isn't about explaining what consciousness DOES—it's about explaining why consciousness EXISTS at all. And this remains the deepest mystery in science."),
                        .text("Some scientists dismiss the hard problem as confused or unanswerable. Others believe it reveals fundamental limits of materialist explanations. Where you land on this question shapes your entire understanding of reality.")
                    ],
                    keyTakeaways: [
                        "The 'easy problems' concern brain mechanisms; the 'hard problem' concerns why there's experience at all",
                        "No amount of brain mapping explains WHY information processing feels like something",
                        "The hard problem is considered by many to be the most important unsolved problem in science"
                    ],
                    reflectionPrompts: [
                        "Why do YOU think there's something it's like to be you?",
                        "Could a perfect simulation of your brain have no inner experience?",
                        "Is consciousness something science can ever fully explain?"
                    ],
                    furtherReading: [
                        "\"The Conscious Mind\" - David Chalmers",
                        "\"Consciousness Explained\" - Daniel Dennett (argues against the hard problem)",
                        "\"The Character of Consciousness\" - David Chalmers"
                    ]
                ),
                
                ConsciousnessModule.Lesson(
                    id: "1_2_qualia",
                    number: 2,
                    title: "Qualia: The Redness of Red",
                    duration: 7,
                    content: [
                        .text("What is it like to see the color red? Not the wavelength (700nm), not the neural activity (V4 cortex), but the actual EXPERIENCE of redness. This raw feel is what philosophers call 'qualia' (singular: quale)."),
                        .concept(title: "Qualia", explanation: "The subjective, qualitative properties of conscious experience. The way things seem to us. The intrinsic, non-representational features of mental states."),
                        .text("Consider Mary, the color scientist (a famous thought experiment by Frank Jackson):"),
                        .quote(text: "Mary is a brilliant scientist forced to investigate the world from a black and white room. She learns everything there is to know about the physical facts of color vision. When she is finally released and sees a red tomato for the first time, does she learn something new?", author: "Frank Jackson's Knowledge Argument"),
                        .insight("If Mary learns something new—what it's LIKE to see red—then physical facts don't capture everything. Consciousness includes something beyond physics."),
                        .text("The implications are staggering: If qualia are real and irreducible, then consciousness might be a fundamental feature of reality, not just an emergent property of matter."),
                        .concept(title: "Inverted Qualia", explanation: "What if your 'red' looks like my 'green' internally, but we both call it 'red' because we learned the same labels? There's no way to check from the outside. Your inner experience is private."),
                        .warning("Some philosophers (like Daniel Dennett) argue qualia don't exist—that they're a confusion caused by introspecting badly. This debate is unresolved.")
                    ],
                    keyTakeaways: [
                        "Qualia are the subjective, felt qualities of experience",
                        "The Mary thought experiment suggests physical knowledge doesn't capture subjective experience",
                        "Your inner experiences are fundamentally private and unverifiable by others"
                    ],
                    reflectionPrompts: [
                        "Does Mary learn something new when she sees red?",
                        "How do you know anyone else experiences colors the same way you do?",
                        "Are your dreams made of qualia?"
                    ],
                    furtherReading: [
                        "\"What Mary Didn't Know\" - Frank Jackson",
                        "\"Quining Qualia\" - Daniel Dennett",
                        "\"The Puzzle of Conscious Experience\" - David Chalmers (Scientific American)"
                    ]
                ),
                
                ConsciousnessModule.Lesson(
                    id: "1_3_consciousness_varieties",
                    number: 3,
                    title: "Varieties of Consciousness",
                    duration: 6,
                    content: [
                        .text("Consciousness isn't one thing. It exists in varieties, levels, and states. Understanding these distinctions is essential before we go deeper."),
                        .concept(title: "Access Consciousness", explanation: "Information that's available for reasoning, reporting, and controlling behavior. You're access-conscious of what you can think about and talk about."),
                        .concept(title: "Phenomenal Consciousness", explanation: "The felt quality of experience. The 'what it's like.' You can be phenomenally conscious of something without being access-conscious of it (and vice versa, arguably)."),
                        .concept(title: "Self-Consciousness", explanation: "Awareness of yourself as a distinct entity. The ability to recognize yourself, have autobiographical memory, and think about your own thoughts (metacognition)."),
                        .text("States of consciousness also vary dramatically:"),
                        .text("• Waking consciousness\n• Dreaming (REM)\n• Deep sleep (non-REM)\n• Meditative states (jhanas, samadhi)\n• Psychedelic states\n• Flow states\n• Near-death experiences\n• Anesthesia (consciousness off?)\n• Coma / vegetative states"),
                        .insight("The fact that consciousness can be altered, expanded, contracted, and seemingly turned off suggests it has structure—and that structure can be mapped."),
                        .quote(text: "Consciousness is not a thing but a process—and processes can be modified.", author: "Francisco Varela")
                    ],
                    keyTakeaways: [
                        "Access consciousness (reportable) differs from phenomenal consciousness (felt)",
                        "Self-consciousness adds another layer—awareness of being aware",
                        "Consciousness exists in many states, each with different qualities and contents"
                    ],
                    reflectionPrompts: [
                        "Are you conscious when you're in dreamless sleep?",
                        "What's the difference between being awake and being conscious?",
                        "Have you ever experienced altered states? What did they reveal?"
                    ],
                    furtherReading: [
                        "\"Consciousness and the Brain\" - Stanislas Dehaene",
                        "\"Waking Up\" - Sam Harris",
                        "\"The Varieties of Religious Experience\" - William James"
                    ]
                )
            ],
            estimatedMinutes: 21,
            difficulty: .foundational
        ),
        
        // ═══════════════════════════════════════════════════════════════════
        // MODULE 2: SCIENTIFIC THEORIES OF CONSCIOUSNESS
        // ═══════════════════════════════════════════════════════════════════
        
        ConsciousnessModule(
            id: "mod_2_theories",
            number: 2,
            title: "Scientific Theories",
            subtitle: "What science says (and doesn't know)",
            icon: "brain.head.profile",
            colorHex: "#2196F3",
            overview: "Science has developed several major theories attempting to explain consciousness. None are complete, but each offers crucial insights. This module covers the leading contenders—from information integration to global workspace to quantum theories.",
            lessons: [
                ConsciousnessModule.Lesson(
                    id: "2_1_iit",
                    number: 1,
                    title: "Integrated Information Theory (IIT)",
                    duration: 10,
                    content: [
                        .text("Developed by neuroscientist Giulio Tononi, Integrated Information Theory (IIT) is perhaps the most ambitious scientific theory of consciousness. It doesn't just explain consciousness—it claims to MEASURE it."),
                        .concept(title: "Core Claim", explanation: "Consciousness IS integrated information. The more a system integrates information in a way that's irreducible to its parts, the more conscious it is. This is measured by a quantity called Φ (phi)."),
                        .text("IIT starts from the phenomenology—from what consciousness IS like—and works backward to what physical systems could generate it."),
                        .concept(title: "Five Axioms of Consciousness (per IIT)", explanation: "1. Intrinsic existence - experience exists for itself\n2. Composition - experience is structured\n3. Information - experience is specific\n4. Integration - experience is unified\n5. Exclusion - experience has definite borders"),
                        .text("From these axioms, IIT derives that only systems with high integrated information (high Φ) are conscious. A brain has high Φ. A computer, despite processing more information, has LOW Φ because it's not integrated—each transistor operates independently."),
                        .insight("IIT makes a radical prediction: consciousness is a fundamental property of certain physical systems, like mass or charge. It's not emergent—it's intrinsic."),
                        .warning("IIT remains controversial. Computing Φ for real systems is nearly impossible. Some argue it leads to 'panpsychism' (everything is slightly conscious), which many find implausible."),
                        .quote(text: "Consciousness is integrated information. Period.", author: "Giulio Tononi")
                    ],
                    keyTakeaways: [
                        "IIT proposes consciousness = integrated information (Φ)",
                        "Systems that integrate information irreducibly are conscious",
                        "This would make consciousness measurable, fundamental, and possibly ubiquitous"
                    ],
                    reflectionPrompts: [
                        "If consciousness is integrated information, are complex ecosystems conscious?",
                        "Does a brain in dreamless sleep have lower Φ than during waking?",
                        "Would you accept that a sufficiently integrated AI is genuinely conscious?"
                    ],
                    furtherReading: [
                        "\"Phi: A Voyage from the Brain to the Soul\" - Giulio Tononi",
                        "\"Consciousness: Confessions of a Romantic Reductionist\" - Christof Koch",
                        "IIT official website: integratedinformationtheory.org"
                    ]
                ),
                
                ConsciousnessModule.Lesson(
                    id: "2_2_gwt",
                    number: 2,
                    title: "Global Workspace Theory",
                    duration: 8,
                    content: [
                        .text("Developed by Bernard Baars and expanded by Stanislas Dehaene, Global Workspace Theory (GWT) explains consciousness as a 'broadcasting' system in the brain."),
                        .concept(title: "The Theater Metaphor", explanation: "Imagine your mind as a theater. Many processes happen backstage (unconscious). But there's a spotlight on stage (the global workspace) where selected information is broadcast to the entire audience (all brain modules)."),
                        .text("According to GWT, you become conscious of something when it enters the global workspace and gets broadcast widely. This is why attention and consciousness are so closely linked."),
                        .concept(title: "Ignition", explanation: "When information crosses a threshold of activation, it 'ignites'—spreading rapidly across the prefrontal and parietal cortex. This ignition is the neural signature of consciousness."),
                        .text("Evidence for GWT:\n• Subliminal stimuli (below threshold) don't ignite\n• Masking a stimulus prevents ignition\n• Anesthesia disrupts global broadcasting\n• The 'P3b' brain wave correlates with conscious access"),
                        .insight("GWT explains access consciousness well—what we can report and reason about. But critics argue it doesn't address phenomenal consciousness—the felt quality of experience."),
                        .quote(text: "Consciousness is the brain's way of making information globally available.", author: "Stanislas Dehaene")
                    ],
                    keyTakeaways: [
                        "GWT: Consciousness = global broadcasting of information",
                        "Only information that 'ignites' and spreads brain-wide becomes conscious",
                        "Explains access consciousness well; phenomenal consciousness less clear"
                    ],
                    reflectionPrompts: [
                        "What determines which information gets 'broadcast' to consciousness?",
                        "Could there be phenomenal consciousness without global workspace access?",
                        "Is the 'audience' in the theater also conscious?"
                    ],
                    furtherReading: [
                        "\"A Cognitive Theory of Consciousness\" - Bernard Baars",
                        "\"Consciousness and the Brain\" - Stanislas Dehaene",
                        "\"The Global Workspace Theory of Consciousness\" - Baars & Franklin"
                    ]
                ),
                
                ConsciousnessModule.Lesson(
                    id: "2_3_orch_or",
                    number: 3,
                    title: "Quantum Consciousness (Orch-OR)",
                    duration: 9,
                    content: [
                        .text("Could quantum mechanics play a role in consciousness? Physicist Roger Penrose and anesthesiologist Stuart Hameroff propose the most detailed quantum theory: Orchestrated Objective Reduction (Orch-OR)."),
                        .concept(title: "The Penrose Argument", explanation: "Penrose argues that human understanding—particularly mathematical insight—cannot be computed by any algorithm. Therefore, the brain must use non-computable physics. Quantum mechanics is the only known source of non-computability (via wave function collapse)."),
                        .concept(title: "Microtubules", explanation: "Hameroff identified microtubules—protein structures inside neurons—as potential quantum computers. They're small enough for quantum effects and organized enough to process information."),
                        .text("According to Orch-OR, consciousness arises when quantum superpositions in microtubules undergo 'objective reduction'—a self-collapse of the wave function influenced by quantum gravity."),
                        .warning("Orch-OR is highly controversial. Many physicists argue the brain is too 'warm and wet' for quantum coherence. However, recent research has found quantum effects in bird navigation and photosynthesis—biological quantum effects may be more common than assumed."),
                        .insight("If Orch-OR is correct, consciousness is connected to the fundamental structure of spacetime itself. The implications would be profound."),
                        .quote(text: "Consciousness is not computation. It's something deeper—connected to the fine structure of spacetime.", author: "Roger Penrose")
                    ],
                    keyTakeaways: [
                        "Penrose argues consciousness requires non-computable physics (quantum)",
                        "Microtubules in neurons may support quantum coherence",
                        "If true, consciousness connects to the fabric of spacetime"
                    ],
                    reflectionPrompts: [
                        "Does mathematical insight feel different from logical reasoning?",
                        "Could AI ever be conscious if consciousness requires quantum effects?",
                        "Does the 'weirdness' of quantum mechanics match the 'weirdness' of consciousness?"
                    ],
                    furtherReading: [
                        "\"The Emperor's New Mind\" - Roger Penrose",
                        "\"Shadows of the Mind\" - Roger Penrose",
                        "\"Consciousness in the Universe\" - Hameroff & Penrose"
                    ]
                ),
                
                ConsciousnessModule.Lesson(
                    id: "2_4_predictive_processing",
                    number: 4,
                    title: "Predictive Processing & Free Energy",
                    duration: 8,
                    content: [
                        .text("The most exciting recent framework comes from Karl Friston: the Free Energy Principle and Predictive Processing. It might unify neuroscience, consciousness studies, and even biology."),
                        .concept(title: "Predictive Processing", explanation: "The brain is fundamentally a prediction machine. It constantly generates predictions about incoming sensory data. Consciousness is what it's like to be a system that predicts."),
                        .text("You don't passively receive sensory information—you PREDICT it. What you consciously experience is largely your brain's best guess about reality, updated by prediction errors."),
                        .concept(title: "Free Energy Principle", explanation: "All living systems minimize 'free energy'—roughly, surprise or prediction error. They do this by either updating their predictions (learning) or acting to make their predictions come true (active inference)."),
                        .text("Under this view, perception, action, and consciousness are all aspects of the same process: minimizing the gap between prediction and reality."),
                        .insight("This explains why attention, expectation, and belief so powerfully shape experience. You literally see what you expect to see."),
                        .quote(text: "The brain is not a camera. It's a prediction engine that occasionally checks its predictions against reality.", author: "Andy Clark"),
                        .concept(title: "The Self as Prediction", explanation: "Even your sense of self is a prediction—a model your brain generates to predict interoceptive (body) signals. The 'I' is a useful fiction, constantly updated.")
                    ],
                    keyTakeaways: [
                        "The brain is a prediction machine; you experience predictions, not raw data",
                        "Consciousness may be what prediction feels like from the inside",
                        "Even the self is a predictive model, not a fixed entity"
                    ],
                    reflectionPrompts: [
                        "Have you ever seen something that wasn't there because you expected it?",
                        "If experience is prediction, what's the difference between perception and imagination?",
                        "How does this framework change how you think about 'reality'?"
                    ],
                    furtherReading: [
                        "\"Surfing Uncertainty\" - Andy Clark",
                        "\"The Free Energy Principle\" - Karl Friston",
                        "\"Being You\" - Anil Seth"
                    ]
                )
            ],
            estimatedMinutes: 35,
            difficulty: .intermediate
        ),
        
        // ═══════════════════════════════════════════════════════════════════
        // MODULE 3: ANCIENT WISDOM TRADITIONS
        // ═══════════════════════════════════════════════════════════════════
        
        ConsciousnessModule(
            id: "mod_3_ancient",
            number: 3,
            title: "Ancient Wisdom Traditions",
            subtitle: "5,000 years of consciousness research",
            icon: "books.vertical.fill",
            colorHex: "#FF9800",
            overview: "Long before Western science, contemplative traditions developed sophisticated maps of consciousness through direct investigation. This module explores Vedanta, Buddhism, Hermeticism, and more—not as religion, but as phenomenological research programs.",
            lessons: [
                ConsciousnessModule.Lesson(
                    id: "3_1_vedanta",
                    number: 1,
                    title: "Advaita Vedanta: Non-Duality",
                    duration: 10,
                    content: [
                        .text("Advaita Vedanta, the 'non-dual' school of Indian philosophy, makes a radical claim: there is only ONE consciousness, and it is what you truly are. Individual 'selves' are illusory."),
                        .concept(title: "Brahman & Atman", explanation: "Brahman is infinite, unchanging consciousness—the ground of all being. Atman is the individual self. The core teaching: Atman IS Brahman. 'Tat Tvam Asi'—You Are That."),
                        .quote(text: "The wave is not different from the ocean. The individual self is not different from universal consciousness.", author: "Shankara"),
                        .text("According to Advaita, your sense of being a separate self (ego) is 'maya'—not illusion exactly, but a kind of mistaken identification. You are not the body-mind; you are the awareness in which the body-mind appears."),
                        .concept(title: "The Three States Analysis", explanation: "Vedanta analyzes consciousness through three states: waking, dreaming, and deep sleep. In deep sleep, the ego dissolves but YOU still exist (you wake up and report 'I slept well'). What remains when ego dissolves? Pure awareness."),
                        .insight("This isn't philosophy to Vedanta—it's verifiable through direct investigation. Through meditation, one can recognize awareness as prior to and independent of its contents."),
                        .practice(title: "Self-Inquiry (Atma Vichara)", instructions: "Ask yourself: 'Who am I?' Not for an answer, but to turn attention toward the source of attention. Thoughts arise—who notices them? Feelings arise—who feels them? Trace every experience back to the experiencer.", duration: "10 min daily"),
                        .quote(text: "The thought 'I am this body' is the thread on which all other thoughts are strung. Question it, and they all dissolve.", author: "Ramana Maharshi")
                    ],
                    keyTakeaways: [
                        "Advaita claims individual consciousness IS universal consciousness",
                        "The sense of being a separate self is a case of mistaken identification",
                        "This can be verified through direct contemplative investigation"
                    ],
                    reflectionPrompts: [
                        "When you say 'I,' what exactly are you referring to?",
                        "In deep sleep, does 'you' still exist?",
                        "Could awareness itself have no edges, no boundaries?"
                    ],
                    furtherReading: [
                        "\"I Am That\" - Nisargadatta Maharaj",
                        "\"Be As You Are\" - Ramana Maharshi (edited by David Godman)",
                        "\"The Crest-Jewel of Discrimination\" - Shankara"
                    ]
                ),
                
                ConsciousnessModule.Lesson(
                    id: "3_2_buddhism",
                    number: 2,
                    title: "Buddhist Models of Mind",
                    duration: 10,
                    content: [
                        .text("Buddhism offers perhaps the most detailed phenomenological analysis of consciousness ever developed. The Abhidharma texts catalog mental factors with scientific precision."),
                        .concept(title: "Anatta (No-Self)", explanation: "Buddhism's central claim about consciousness: there is no permanent, unchanging self. What we call 'self' is a constantly changing process of five 'aggregates': form, sensation, perception, mental formations, and consciousness."),
                        .text("The Buddha didn't deny experience—he denied the OWNER of experience. Thoughts happen, but there's no thinker. Awareness occurs, but there's no permanent witness."),
                        .concept(title: "The Five Aggregates (Skandhas)", explanation: "1. Form (rupa) - body and matter\n2. Sensation (vedana) - pleasant, unpleasant, neutral\n3. Perception (sanna) - recognition and labeling\n4. Mental formations (sankhara) - intentions, emotions, volitions\n5. Consciousness (vinnana) - the knowing quality"),
                        .text("None of these are 'you.' They arise and pass based on conditions. Suffering (dukkha) comes from clinging to these changing phenomena as if they were a stable self."),
                        .concept(title: "Jhanas: States of Absorption", explanation: "Buddhism maps at least 8 jhanas—states of deepening meditative absorption, each with distinct characteristics. These are reproducible, describable states that can be cultivated."),
                        .insight("Buddhism treats consciousness as empirically investigable. Don't believe—verify through your own practice."),
                        .quote(text: "Do not accept anything on mere hearsay. Do not accept anything merely because your teacher says so. When you yourself know: 'These things are good, these things are blameless, these things lead to happiness'—then accept them.", author: "The Buddha, Kalama Sutta")
                    ],
                    keyTakeaways: [
                        "Buddhism denies a permanent self; 'you' are a process, not a thing",
                        "The five aggregates describe the components of experience without an owner",
                        "Meditative jhanas map specific states of consciousness"
                    ],
                    reflectionPrompts: [
                        "If there's no permanent self, who is reading this?",
                        "Can you observe the 'five aggregates' in your current experience?",
                        "What would remain if everything 'you' identified as dissolved?"
                    ],
                    furtherReading: [
                        "\"Mindfulness in Plain English\" - Bhante Gunaratana",
                        "\"Seeing That Frees\" - Rob Burbea",
                        "\"The Mind Illuminated\" - Culadasa (John Yates)"
                    ]
                ),
                
                ConsciousnessModule.Lesson(
                    id: "3_3_hermetic",
                    number: 3,
                    title: "Hermetic & Gnostic Consciousness",
                    duration: 8,
                    content: [
                        .text("The Hermetic tradition—attributed to Hermes Trismegistus—offers a Western esoteric framework for understanding consciousness, mind, and reality."),
                        .quote(text: "The All is Mind; the Universe is Mental.", author: "The Kybalion, First Hermetic Principle"),
                        .concept(title: "Mentalism", explanation: "The first Hermetic principle states that everything is Mind. Physical reality exists within infinite Mind, like a dream within the dreamer. This is similar to philosophical idealism."),
                        .concept(title: "The Seven Hermetic Principles", explanation: "1. Mentalism - All is Mind\n2. Correspondence - As above, so below\n3. Vibration - Everything moves and vibrates\n4. Polarity - Everything has its pair of opposites\n5. Rhythm - Everything flows in cycles\n6. Cause & Effect - Nothing escapes the law\n7. Gender - Masculine and feminine in all things"),
                        .text("Gnosticism adds another layer: the material world is a kind of prison or forgetting. The divine spark within us has become trapped in matter and must remember its true nature."),
                        .concept(title: "Gnosis", explanation: "Direct experiential knowledge of the divine, not belief or faith. The Gnostics sought not salvation through obedience but liberation through understanding."),
                        .insight("Both Hermetic and Gnostic traditions suggest that consciousness is primary and matter is derivative—a reversal of the materialist worldview."),
                        .quote(text: "You have forgotten that you are sons and daughters of the light. Remember yourselves.", author: "Gnostic Gospel of Truth")
                    ],
                    keyTakeaways: [
                        "Hermeticism: Mind is fundamental; reality is mental",
                        "The seven principles describe how consciousness operates",
                        "Gnosticism: we've forgotten our divine nature and must remember"
                    ],
                    reflectionPrompts: [
                        "If 'all is mind,' whose mind is it?",
                        "What would 'As above, so below' mean for consciousness?",
                        "Do you ever feel you've 'forgotten' something essential about yourself?"
                    ],
                    furtherReading: [
                        "\"The Kybalion\" - Three Initiates",
                        "\"The Nag Hammadi Scriptures\" - edited by Marvin Meyer",
                        "\"Hermetica\" - translated by Brian Copenhaver"
                    ]
                ),
                
                ConsciousnessModule.Lesson(
                    id: "3_4_taoism_sufism",
                    number: 4,
                    title: "Taoism & Sufism",
                    duration: 8,
                    content: [
                        .text("Two more traditions offer profound insights into consciousness: Taoist flow states and Sufi annihilation of the ego."),
                        .concept(title: "Wu Wei (Non-Action)", explanation: "Taoism teaches acting without forcing, doing without doing. In modern terms: getting into flow state, where action arises spontaneously from presence rather than from the effortful 'I.'"),
                        .quote(text: "In the pursuit of learning, every day something is acquired. In the pursuit of Tao, every day something is dropped.", author: "Lao Tzu, Tao Te Ching"),
                        .text("The Tao cannot be named or grasped by thought. It is the source from which all phenomena arise—including consciousness itself. To know it, one must become empty."),
                        .concept(title: "Fana (Annihilation)", explanation: "In Sufism, fana is the dissolution of the ego-self in divine consciousness. It's not death but awakening—realizing that what you thought you were never really existed."),
                        .quote(text: "Die before you die, and find that there is no death.", author: "Rumi"),
                        .text("Both traditions emphasize that the separate self is the obstacle to direct experience of reality. Whether called Tao, Allah, or simply Truth—the barrier is always the 'I' that claims to seek it."),
                        .insight("Flow states (sports, music, creativity) are glimpses of wu wei—the self gets out of the way and action becomes effortless."),
                        .practice(title: "Noticing the Gap", instructions: "In moments of spontaneous action (catching a ball, responding to a joke, flow in work), notice that there was no 'decider.' Action arose without the sense of 'I.' This is wu wei.", duration: "Notice throughout day")
                    ],
                    keyTakeaways: [
                        "Taoism: Effortless action (wu wei) arises when the 'I' gets out of the way",
                        "Sufism: The ego must 'die' to realize divine consciousness",
                        "Both point to the self as the primary obstacle to awakening"
                    ],
                    reflectionPrompts: [
                        "Have you ever experienced 'flow' where action happened without effort?",
                        "What would remain if your sense of self completely dissolved?",
                        "Is the 'seeker' itself the barrier to what's being sought?"
                    ],
                    furtherReading: [
                        "\"Tao Te Ching\" - Lao Tzu (Stephen Mitchell translation)",
                        "\"The Essential Rumi\" - translated by Coleman Barks",
                        "\"The Book of Chuang Tzu\" - translated by Martin Palmer"
                    ]
                )
            ],
            estimatedMinutes: 36,
            difficulty: .intermediate
        ),
        
        // ═══════════════════════════════════════════════════════════════════
        // MODULE 4: ALTERED STATES
        // ═══════════════════════════════════════════════════════════════════
        
        ConsciousnessModule(
            id: "mod_4_altered",
            number: 4,
            title: "Altered States of Consciousness",
            subtitle: "Mapping the full spectrum",
            icon: "waveform.path",
            colorHex: "#E91E63",
            overview: "Consciousness is not fixed—it's a vast space with many regions. This module explores altered states: meditation, psychedelics, dreams, near-death experiences, and more. These states reveal that ordinary waking consciousness is just one point on a much larger spectrum.",
            lessons: [
                ConsciousnessModule.Lesson(
                    id: "4_1_meditation",
                    number: 1,
                    title: "Meditative States & The Jhanas",
                    duration: 9,
                    content: [
                        .text("Meditation is not just relaxation. Deep practice can produce states so profound they transform one's entire understanding of mind and reality."),
                        .concept(title: "The Eight Jhanas", explanation: "Classical Buddhist meditation maps eight progressively refined states of absorption:\n\n1. First jhana: Applied attention, sustained attention, rapture, happiness, one-pointedness\n2. Second jhana: Sustained attention fades; rapture, happiness, one-pointedness\n3. Third jhana: Rapture fades; contentment, equanimity\n4. Fourth jhana: Only equanimity and one-pointedness remain\n5-8. Formless jhanas: Infinite space, infinite consciousness, nothingness, neither perception nor non-perception"),
                        .text("These aren't beliefs—they're reproducible states. Thousands of practitioners across centuries have described the same progression."),
                        .concept(title: "Cessation (Nirodha)", explanation: "Beyond the eight jhanas lies cessation—a complete stopping of consciousness. No experience, no time, no self. And yet, you 'come back.' What does this mean for the nature of consciousness?"),
                        .insight("Meditative states reveal that ordinary consciousness is highly conditioned. It can be deconstructed, refined, and even temporarily stopped."),
                        .practice(title: "Access Concentration", instructions: "Focus on the breath at the nostrils. When attention wanders, gently return. Don't try to achieve anything—just notice. With practice, attention stabilizes and the first jhana factors may arise spontaneously.", duration: "20-40 min daily"),
                        .quote(text: "The mind, hard to control, flighty—alighting where it wishes—one does well to tame. The disciplined mind brings happiness.", author: "Dhammapada")
                    ],
                    keyTakeaways: [
                        "Eight jhanas map progressively refined states of consciousness",
                        "Cessation shows consciousness can temporarily stop entirely",
                        "These states reveal ordinary consciousness is just one configuration"
                    ],
                    reflectionPrompts: [
                        "What's the deepest state you've ever experienced in meditation?",
                        "If consciousness can stop and restart, what does that say about death?",
                        "Why aren't these states taught more widely?"
                    ],
                    furtherReading: [
                        "\"The Mind Illuminated\" - Culadasa",
                        "\"Right Concentration\" - Leigh Brasington",
                        "\"Mastering the Core Teachings of the Buddha\" - Daniel Ingram"
                    ]
                ),
                
                ConsciousnessModule.Lesson(
                    id: "4_2_psychedelics",
                    number: 2,
                    title: "Psychedelic Consciousness",
                    duration: 10,
                    content: [
                        .text("After decades of suppression, psychedelic research has resumed. What these substances reveal about consciousness is revolutionary."),
                        .concept(title: "Default Mode Network", explanation: "The brain's DMN maintains your sense of self and narrative identity. Psychedelics quiet the DMN, allowing parts of the brain that don't normally communicate to connect. The result: ego dissolution."),
                        .text("Common features of high-dose psychedelic experiences:\n• Dissolution of self-other boundary\n• Sense of unity with everything\n• Timelessness\n• Noetic quality (this feels MORE real, not less)\n• Ineffability (impossible to describe)\n• Lasting personality changes"),
                        .concept(title: "The Mystical Experience", explanation: "Psychedelic experiences that meet certain criteria (unity, sacredness, noetic quality, transcendence of time/space, deeply felt positive mood, ineffability) produce lasting benefits similar to those reported by contemplatives."),
                        .text("Johns Hopkins research found that psilocybin can reliably produce mystical experiences, reduce death anxiety in terminal patients, treat depression, and break addiction patterns."),
                        .warning("These are powerful substances. Set and setting matter enormously. Illegal in most jurisdictions. This is educational content, not a recommendation."),
                        .quote(text: "Psychedelics are to the study of the mind what the telescope is to astronomy or the microscope is to biology.", author: "Stanislav Grof"),
                        .insight("Psychedelics don't create mystical states—they reveal that ordinary consciousness is a filter. What's being 'seen' was always there.")
                    ],
                    keyTakeaways: [
                        "Psychedelics reduce DMN activity, loosening the grip of ego",
                        "Mystical experiences produce lasting positive changes",
                        "These states suggest ordinary consciousness is a filtered, contracted state"
                    ],
                    reflectionPrompts: [
                        "Why do ego-dissolving experiences often feel MORE real, not less?",
                        "What would it mean if the 'self' is a construct the brain maintains?",
                        "Why were these substances made illegal at the height of research?"
                    ],
                    furtherReading: [
                        "\"How to Change Your Mind\" - Michael Pollan",
                        "\"The Doors of Perception\" - Aldous Huxley",
                        "\"DMT: The Spirit Molecule\" - Rick Strassman"
                    ]
                ),
                
                ConsciousnessModule.Lesson(
                    id: "4_3_dreams_lucid",
                    number: 3,
                    title: "Dreams & Lucid Dreaming",
                    duration: 8,
                    content: [
                        .text("Every night, you enter an altered state where you believe a completely fabricated reality is real. Dreams reveal the mind's extraordinary power to construct experience."),
                        .concept(title: "The Dreaming Mind", explanation: "During REM sleep, the prefrontal cortex (critical thinking) goes offline while emotional and visual centers stay active. The result: vivid, uncritical, emotionally charged experiences."),
                        .text("Consider: In dreams, you have a body, you're in a world, you interact with 'others'—all entirely generated by your mind. What does this say about waking experience?"),
                        .concept(title: "Lucid Dreaming", explanation: "Becoming aware that you're dreaming while still in the dream. The dream continues, but you know it's a dream. This opens extraordinary possibilities for exploring consciousness."),
                        .practice(title: "Reality Testing", instructions: "Throughout the day, genuinely ask: 'Am I dreaming?' Look at text, look away, look back (text changes in dreams). Try to push your finger through your palm. This habit carries into dreams.", duration: "5-10 times daily"),
                        .text("Tibetan Buddhism developed 'Dream Yoga' over 1,000 years ago—systematic practices for becoming lucid and using dreams for spiritual development."),
                        .insight("If you can fabricate an entire convincing reality while dreaming, how much of waking experience is also fabrication?"),
                        .quote(text: "We are such stuff as dreams are made on, and our little life is rounded with a sleep.", author: "Shakespeare, The Tempest")
                    ],
                    keyTakeaways: [
                        "Dreams demonstrate the mind's power to construct entire realities",
                        "Lucid dreaming allows conscious exploration within the dream state",
                        "The boundary between 'real' and 'dream' may be less solid than we assume"
                    ],
                    reflectionPrompts: [
                        "How do you KNOW you're not dreaming right now?",
                        "What would you do if you became lucid in a dream tonight?",
                        "What does the existence of dreams say about the nature of waking reality?"
                    ],
                    furtherReading: [
                        "\"Exploring the World of Lucid Dreaming\" - Stephen LaBerge",
                        "\"Dream Yoga\" - Andrew Holecek",
                        "\"The Tibetan Yogas of Dream and Sleep\" - Tenzin Wangyal Rinpoche"
                    ]
                ),
                
                ConsciousnessModule.Lesson(
                    id: "4_4_nde",
                    number: 4,
                    title: "Near-Death Experiences",
                    duration: 8,
                    content: [
                        .text("Thousands of people have reported experiences during clinical death: tunnels, light, life review, beings, profound peace, and a sense of returning to something familiar. What do NDEs reveal?"),
                        .concept(title: "Common NDE Features", explanation: "• Out-of-body perception\n• Moving through darkness/tunnel\n• Brilliant light (often perceived as loving)\n• Meeting deceased relatives or beings\n• Life review (re-experiencing one's life)\n• A boundary that can't be crossed\n• Reluctance to return\n• Profound transformation afterward"),
                        .text("The AWARE study placed hidden images above hospital beds. Could NDE patients see them during cardiac arrest? Results were inconclusive but one verified case of accurate perception during flat EEG was recorded."),
                        .concept(title: "Explanatory Theories", explanation: "Materialist: Dying brain produces hallucinations (oxygen deprivation, DMT release, REM intrusion)\n\nNon-materialist: Consciousness is not produced by the brain and can continue without it"),
                        .text("What's undeniable: NDEs produce lasting transformation. People lose fear of death, become more loving, less materialistic. The experience, whatever its source, is profoundly real to them."),
                        .insight("NDEs challenge the assumption that consciousness requires a functioning brain. Even if explained materialistically, they reveal extraordinary capacities of mind."),
                        .quote(text: "I knew with total certainty that everything was connected, that everything mattered, and that there was nothing to fear.", author: "NDE experiencer")
                    ],
                    keyTakeaways: [
                        "NDEs have consistent features across cultures and individuals",
                        "They produce lasting positive personality changes",
                        "They challenge—but don't definitively refute—materialist assumptions"
                    ],
                    reflectionPrompts: [
                        "If NDEs are 'just' hallucinations, why are they so transformative?",
                        "What would it mean if consciousness can exist without brain activity?",
                        "Would you want to have an NDE? Why or why not?"
                    ],
                    furtherReading: [
                        "\"Life After Life\" - Raymond Moody",
                        "\"Consciousness Beyond Life\" - Pim van Lommel",
                        "\"After\" - Bruce Greyson"
                    ]
                )
            ],
            estimatedMinutes: 35,
            difficulty: .intermediate
        ),
        
        // ═══════════════════════════════════════════════════════════════════
        // MODULE 5: THE NATURE OF REALITY
        // ═══════════════════════════════════════════════════════════════════
        
        ConsciousnessModule(
            id: "mod_5_reality",
            number: 5,
            title: "Consciousness & Reality",
            subtitle: "What exists, really?",
            icon: "globe.americas.fill",
            colorHex: "#00BCD4",
            overview: "Is consciousness produced by the brain, or is reality produced by consciousness? This module explores the deepest metaphysical questions: idealism vs materialism, simulation theory, panpsychism, and the shocking implications of quantum mechanics.",
            lessons: [
                ConsciousnessModule.Lesson(
                    id: "5_1_materialism_idealism",
                    number: 1,
                    title: "Materialism vs Idealism",
                    duration: 9,
                    content: [
                        .text("The fundamental debate in philosophy of mind: What is the relationship between consciousness and physical reality?"),
                        .concept(title: "Materialism (Physicalism)", explanation: "Matter is fundamental. Consciousness is produced by the brain. Mind is what brain activity 'feels like from the inside.' When the brain dies, consciousness ends."),
                        .concept(title: "Idealism", explanation: "Consciousness is fundamental. Matter exists WITHIN consciousness, not the other way around. Physical reality is an appearance within mind—like a dream or simulation."),
                        .text("Most modern science assumes materialism. But this faces the 'hard problem': there's no explanation for why physical processes should produce subjective experience."),
                        .text("Idealism reverses the puzzle. Instead of asking how matter produces mind, it asks how mind produces the appearance of matter. Under idealism, the hard problem dissolves."),
                        .concept(title: "The Surprising Return of Idealism", explanation: "Philosophers like Bernardo Kastrup argue that idealism is more parsimonious than materialism. It doesn't require explaining an ontological gap between matter and mind—there's only mind."),
                        .quote(text: "The doctrine that the world is made up of objects whose existence is independent of human consciousness turns out to be in conflict with quantum mechanics and with facts established by experiment.", author: "Bernard d'Espagnat, physicist"),
                        .insight("You have NEVER experienced anything outside consciousness. Everything you've ever known has been an experience. The 'physical world' is a concept appearing within experience.")
                    ],
                    keyTakeaways: [
                        "Materialism: matter is fundamental, consciousness emerges from it",
                        "Idealism: consciousness is fundamental, matter appears within it",
                        "Idealism may better fit quantum mechanics and avoids the hard problem"
                    ],
                    reflectionPrompts: [
                        "Have you ever experienced anything outside of consciousness?",
                        "Is the brain inside consciousness, or consciousness inside the brain?",
                        "What would reality be like if idealism were true?"
                    ],
                    furtherReading: [
                        "\"The Idea of the World\" - Bernardo Kastrup",
                        "\"Mind and Cosmos\" - Thomas Nagel",
                        "\"Consciousness and the World\" - Rupert Spira"
                    ]
                ),
                
                ConsciousnessModule.Lesson(
                    id: "5_2_quantum",
                    number: 2,
                    title: "Quantum Mechanics & The Observer",
                    duration: 10,
                    content: [
                        .text("Quantum mechanics—the most accurate theory in science—has strange implications for consciousness. Does observation play a fundamental role in creating reality?"),
                        .concept(title: "The Measurement Problem", explanation: "Before measurement, particles exist in 'superposition'—multiple states simultaneously. Upon measurement, the superposition 'collapses' to a definite state. What causes this collapse? Observation? Consciousness? Physical interaction?"),
                        .text("The famous double-slit experiment: Particles behave as waves (interference pattern) when unobserved, but as particles (two bands) when observed. The act of looking changes the result."),
                        .concept(title: "Interpretations of QM", explanation: "Copenhagen: Observation collapses the wave function\nMany-Worlds: No collapse; all possibilities exist in parallel\nQBism: Quantum states represent subjective knowledge, not objective reality\nVon Neumann-Wigner: Consciousness causes collapse"),
                        .text("John Wheeler proposed the 'participatory universe': observers are participants in creating the very reality they observe. The universe requires consciousness to exist."),
                        .warning("Quantum mechanics doesn't 'prove' anything about consciousness. But it makes it very hard to maintain naive realism—the view that there's a definite world 'out there' independent of observation."),
                        .quote(text: "The universe does not exist 'out there,' independent of us. We are inescapably involved in bringing about that which appears to be happening.", author: "John Wheeler"),
                        .insight("At the quantum level, the division between 'observer' and 'observed' breaks down. Reality seems to be relational, not absolute.")
                    ],
                    keyTakeaways: [
                        "Quantum mechanics shows observation affects what's observed",
                        "The nature of 'collapse' and measurement remains mysterious",
                        "Reality may be participatory—requiring observers"
                    ],
                    reflectionPrompts: [
                        "If observation affects reality, what IS observation?",
                        "Could the universe exist without any conscious observers?",
                        "What would 'you' be in a Many-Worlds interpretation?"
                    ],
                    furtherReading: [
                        "\"The Quantum World\" - Kenneth Ford",
                        "\"Quantum Enigma\" - Bruce Rosenblum & Fred Kuttner",
                        "\"The Physics of Consciousness\" - Evan Walker"
                    ]
                ),
                
                ConsciousnessModule.Lesson(
                    id: "5_3_panpsychism",
                    number: 3,
                    title: "Panpsychism: Mind Everywhere",
                    duration: 8,
                    content: [
                        .text("What if consciousness isn't rare but ubiquitous? Panpsychism—the view that mind is a fundamental feature of all matter—is increasingly taken seriously by philosophers."),
                        .concept(title: "Panpsychism Defined", explanation: "All matter has some form of experience or proto-experience. Electrons don't have complex thoughts, but they might have infinitesimal 'feels.' Consciousness is a spectrum, not an on/off switch."),
                        .text("Why take this seriously? It solves the 'emergence problem.' Under materialism, consciousness must somehow emerge from non-conscious matter—but no one can explain how. If mind is fundamental, it never needs to emerge."),
                        .concept(title: "The Combination Problem", explanation: "If particles have micro-experience, how do they combine into the unified macro-experience you have? Your experience feels like ONE thing, not billions of tiny experiences. Solving this is panpsychism's main challenge."),
                        .text("IIT (Integrated Information Theory) implies panpsychism: anything with integrated information (Φ > 0) has some consciousness. Even simple systems."),
                        .quote(text: "The physical world is just the appearance of something deeper. And that something deeper has the same basic nature as consciousness.", author: "Philip Goff"),
                        .insight("Panpsychism doesn't mean rocks are thinking. It means that the 'stuff' of the universe has an interior dimension as well as an exterior one. Physics describes the outside; experience is the inside.")
                    ],
                    keyTakeaways: [
                        "Panpsychism: consciousness is fundamental, present in all matter",
                        "Avoids the emergence problem but faces the combination problem",
                        "Takes consciousness seriously as a basic feature of reality"
                    ],
                    reflectionPrompts: [
                        "If panpsychism is true, what does that mean for how we treat nature?",
                        "Could even simple systems have something 'it's like' to be them?",
                        "Is consciousness more like mass (fundamental) or like life (emergent)?"
                    ],
                    furtherReading: [
                        "\"Galileo's Error\" - Philip Goff",
                        "\"Panpsychism in the West\" - David Skrbina",
                        "\"Mind in the Cosmos\" - edited by Bruntrup & Jaskolla"
                    ]
                ),
                
                ConsciousnessModule.Lesson(
                    id: "5_4_simulation",
                    number: 4,
                    title: "Simulation Theory & Digital Consciousness",
                    duration: 8,
                    content: [
                        .text("Are we living in a simulation? The simulation hypothesis has moved from science fiction to serious philosophical consideration."),
                        .concept(title: "The Simulation Argument (Bostrom)", explanation: "At least one of these is true:\n1. Civilizations go extinct before developing simulation tech\n2. Advanced civilizations choose not to run simulations\n3. We are almost certainly living in a simulation\n\nIf (1) and (2) are false, simulated beings would vastly outnumber 'real' ones—making it likely we're simulated."),
                        .text("Consider: if we eventually create detailed simulations with conscious beings inside them, those beings would believe THEIR reality is fundamental. How do we know we're not in that position?"),
                        .concept(title: "Relevance to Consciousness", explanation: "Simulation theory assumes consciousness can arise in computational substrates. This presupposes that consciousness is information-based, not tied to specific physical stuff."),
                        .text("Some physicists note that reality DOES look like a simulation:\n• Discrete units (Planck length/time)\n• Maximum speed (information processing limit?)\n• Quantum 'rendering' (only computed when observed?)"),
                        .warning("Simulation theory doesn't solve the hard problem—it relocates it. Why is there consciousness in the simulation (or in the simulators)?"),
                        .insight("Whether or not we're 'in' a simulation, the question highlights something profound: we have no direct access to 'base reality.' We only ever experience representations."),
                        .quote(text: "If we are living in a simulation, then the cosmos that we are observing is just a tiny piece of the totality of physical existence.", author: "Nick Bostrom")
                    ],
                    keyTakeaways: [
                        "If simulations become common, most conscious beings would be simulated",
                        "Simulation theory assumes consciousness can be computational",
                        "Either way, we only ever experience representations, not 'base reality'"
                    ],
                    reflectionPrompts: [
                        "Would it matter to you if you discovered you were simulated?",
                        "Could a simulation contain genuine consciousness?",
                        "What would be 'outside' the simulation?"
                    ],
                    furtherReading: [
                        "\"Are You Living in a Simulation?\" - Nick Bostrom",
                        "\"The Simulation Hypothesis\" - Rizwan Virk",
                        "\"A Glitch in the Matrix\" (documentary)"
                    ]
                )
            ],
            estimatedMinutes: 35,
            difficulty: .advanced
        ),
        
        // ═══════════════════════════════════════════════════════════════════
        // MODULE 6: AWAKENING & TRANSFORMATION
        // ═══════════════════════════════════════════════════════════════════
        
        ConsciousnessModule(
            id: "mod_6_awakening",
            number: 6,
            title: "Awakening & Transformation",
            subtitle: "From knowledge to realization",
            icon: "sun.max.fill",
            colorHex: "#FFD700",
            overview: "Knowledge about consciousness is not the same as transformation. This final module bridges understanding and direct realization. We explore what 'awakening' actually means, common pitfalls, and practices for genuine transformation.",
            lessons: [
                ConsciousnessModule.Lesson(
                    id: "6_1_what_awakening",
                    number: 1,
                    title: "What Is Awakening?",
                    duration: 8,
                    content: [
                        .text("'Awakening' is used loosely. What does it actually mean? Not learning something new—but recognizing what was always true."),
                        .concept(title: "Recognition, Not Achievement", explanation: "You can't achieve what you already are. Awakening is recognizing that awareness itself—the knowing aspect of experience—is already present, already free, already complete. It was never lost."),
                        .text("Most people are identified with the contents of awareness: thoughts, feelings, body, story, roles. Awakening is recognizing you are the awareness IN WHICH these appear."),
                        .concept(title: "The Shift of Identity", explanation: "Before: 'I am a person having experiences.'\nAfter: 'I am awareness, and a person appears within me.'"),
                        .text("This isn't a metaphor or philosophy. It's a direct recognition that can be tested: Are you the thought, or that which knows the thought? Are you the feeling, or that which feels?"),
                        .quote(text: "What you are looking for is what is looking.", author: "St. Francis of Assisi"),
                        .insight("Awakening isn't about becoming someone special. It's about ceasing to pretend you're someone limited."),
                        .practice(title: "Recognition Practice", instructions: "Right now: Notice you are aware. The knowing is effortless—you're not 'doing' awareness. Now notice: this awareness has no edges, no boundaries, no form. It's not located anywhere. It's simply present. This is what you are.", duration: "2 min, anytime")
                    ],
                    keyTakeaways: [
                        "Awakening is recognition of what's already present, not achievement",
                        "It's a shift from identifying with contents to identifying as awareness",
                        "This can be directly verified, not just believed"
                    ],
                    reflectionPrompts: [
                        "What is aware of your thoughts right now?",
                        "Has awareness itself ever changed, even as its contents constantly change?",
                        "Who would you be without your story?"
                    ],
                    furtherReading: [
                        "\"The Direct Path\" - Greg Goode",
                        "\"I Am That\" - Nisargadatta Maharaj",
                        "\"The Untethered Soul\" - Michael Singer"
                    ]
                ),
                
                ConsciousnessModule.Lesson(
                    id: "6_2_paths",
                    number: 2,
                    title: "Paths & Practices",
                    duration: 10,
                    content: [
                        .text("Many paths claim to lead to awakening. What are the major approaches, and how do they relate?"),
                        .concept(title: "Via Negativa (Jnana)", explanation: "The path of negation. 'Neti neti'—not this, not this. Question everything you take yourself to be until only awareness remains. Associated with Advaita Vedanta and self-inquiry."),
                        .concept(title: "Via Positiva (Bhakti)", explanation: "The path of devotion. Love and surrender to the divine until the separate self dissolves in that love. Associated with Christianity, Sufism, devotional Hinduism."),
                        .concept(title: "Via Contemplativa (Meditation)", explanation: "Direct training of attention and awareness. From concentration to insight to non-dual recognition. Associated with Buddhism, contemplative Christianity, many paths."),
                        .concept(title: "Via Activa (Karma Yoga)", explanation: "Awakening through action in the world—selfless service, acting without attachment to results. The world becomes the monastery."),
                        .text("These aren't exclusive. Most genuine paths combine elements. A practitioner might use meditation to steady the mind, inquiry to see through the ego, devotion to open the heart, and service to integrate realization."),
                        .insight("The 'path' metaphor is slightly misleading. You're not traveling somewhere. You're recognizing where you already are."),
                        .practice(title: "Finding Your Path", instructions: "Reflect: Which approach resonates? Do you feel called to rigorous inquiry, loving surrender, systematic meditation, or engaged action? There's no wrong answer—different temperaments suit different paths.", duration: "Reflection"),
                        .quote(text: "There are hundreds of ways to kneel and kiss the ground.", author: "Rumi")
                    ],
                    keyTakeaways: [
                        "Multiple valid paths exist: inquiry, devotion, meditation, action",
                        "Most authentic practice combines elements from several paths",
                        "The path must fit your temperament and circumstances"
                    ],
                    reflectionPrompts: [
                        "Which approach(es) do you feel most drawn to?",
                        "Have you ever had a glimpse of awakening? Through what doorway?",
                        "Is a formal path necessary, or can awakening happen spontaneously?"
                    ],
                    furtherReading: [
                        "\"The Perennial Philosophy\" - Aldous Huxley",
                        "\"One Taste\" - Ken Wilber",
                        "\"A New Earth\" - Eckhart Tolle"
                    ]
                ),
                
                ConsciousnessModule.Lesson(
                    id: "6_3_pitfalls",
                    number: 3,
                    title: "Traps & Pitfalls",
                    duration: 8,
                    content: [
                        .text("The path to awakening is littered with traps. Knowing them in advance can save years of detours."),
                        .concept(title: "Spiritual Bypassing", explanation: "Using spirituality to avoid dealing with psychological issues, uncomfortable emotions, or practical responsibilities. 'I'm too evolved for therapy.' 'Anger is just ego.'"),
                        .concept(title: "Spiritual Materialism", explanation: "Turning spirituality into another egoic project. Collecting experiences, accumulating teachers, building a 'spiritual identity.' The ego co-opts everything, including the search for no-ego."),
                        .concept(title: "Guru Trap", explanation: "Projecting awakeness onto a teacher instead of recognizing it in yourself. The teacher becomes a substitute for your own realization. Some teachers exploit this."),
                        .concept(title: "Premature Transcendence", explanation: "Trying to abide in 'no-self' or 'awareness' before psychological foundations are solid. Results in dissociation, emotional numbness, or spiritual arrogance."),
                        .text("Other common traps:\n• Mistaking intellectual understanding for realization\n• Chasing peak experiences instead of integrating insight\n• Becoming 'special' through spiritual identity\n• Neglecting body, relationships, or practical life\n• Spiritual competitiveness"),
                        .insight("The greatest trap: believing awakening is somewhere else, sometime else, for someone else. It's here. Now. For you. As you."),
                        .quote(text: "Before enlightenment: chop wood, carry water. After enlightenment: chop wood, carry water.", author: "Zen proverb")
                    ],
                    keyTakeaways: [
                        "Spiritual bypassing uses spirituality to avoid, not transform",
                        "Spiritual materialism turns awakening into egoic achievement",
                        "True awakening integrates all aspects of life, not just transcendence"
                    ],
                    reflectionPrompts: [
                        "Have you fallen into any of these traps?",
                        "How would you distinguish genuine awakening from spiritual ego?",
                        "What's the role of shadow work alongside spiritual practice?"
                    ],
                    furtherReading: [
                        "\"Spiritual Bypassing\" - Robert Augustus Masters",
                        "\"Cutting Through Spiritual Materialism\" - Chögyam Trungpa",
                        "\"Meeting the Shadow\" - edited by Connie Zweig"
                    ]
                ),
                
                ConsciousnessModule.Lesson(
                    id: "6_4_integration",
                    number: 4,
                    title: "Integration & Living Awakening",
                    duration: 9,
                    content: [
                        .text("Glimpses of awakening are common. Living from awakening is rare. This final lesson addresses integration—making realization your ordinary experience."),
                        .concept(title: "Awakening vs Enlightenment", explanation: "Awakening: Recognition of your true nature (can be sudden, instantaneous)\nEnlightenment: Stable establishment in that recognition (gradual, requires integration)\n\nMost traditions distinguish between initial seeing and mature embodiment."),
                        .text("After awakening, life doesn't stop. Conditioning continues to arise. The difference: you're no longer fooled by it. You see thoughts as thoughts, emotions as weather, the 'self' as a functional appearance—not as what you are."),
                        .concept(title: "Integration Work", explanation: "• Working through psychological material that arises\n• Meeting triggers without contracting into old patterns\n• Allowing relationships to transform\n• Embodying presence in daily activities\n• Serving others from overflow, not lack"),
                        .practice(title: "The Ordinary as Gateway", instructions: "Choose one ordinary activity today—washing dishes, walking, brushing teeth. Do it with complete presence, no mental overlay, no story about it. Just this. The mundane becomes sacred when you stop overlooking it.", duration: "Anytime"),
                        .text("Awakening doesn't mean feeling good all the time. It means full acceptance of what is—including difficulty. The peace of awakening includes disturbance, not excluding it."),
                        .quote(text: "Enlightenment is intimacy with all things.", author: "Dogen"),
                        .insight("The final teaching: There is nothing to attain because nothing was ever missing. You are already that which you seek. The only 'practice' is recognizing this, again and again, until recognition is effortless."),
                        .quote(text: "This is it. There is no next. There is only this.", author: "Alan Watts")
                    ],
                    keyTakeaways: [
                        "Glimpses must be integrated to become stable realization",
                        "Integration includes psychological, relational, and embodiment work",
                        "True peace includes everything—not just pleasant states"
                    ],
                    reflectionPrompts: [
                        "What would 'living awakening' look like in your specific life?",
                        "Where does old conditioning still have you?",
                        "What's stopping you from being free right now?"
                    ],
                    furtherReading: [
                        "\"Bringing It Home\" - Adyashanti",
                        "\"After the Ecstasy, the Laundry\" - Jack Kornfield",
                        "\"The Way of Liberation\" - Adyashanti (free ebook)"
                    ]
                )
            ],
            estimatedMinutes: 35,
            difficulty: .advanced
        )
    ]
}
