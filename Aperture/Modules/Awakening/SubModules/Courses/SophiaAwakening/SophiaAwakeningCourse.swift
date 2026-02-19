// SophiaAwakeningCourse.swift
// Aperture
//
// The Pistis Sophia: Complete Gnostic Teaching on Divine Feminine Consciousness
// ADVANCED COURSE - Unlocks after significant awakening progress

import Foundation
import SwiftUI


// MARK: - Course Structure

struct SophiaAwakeningCourse {
    
    static let courseInfo = CourseInfo(
        id: "sophia-awakening",
        title: "Pistis Sophia",
        subtitle: "The Divine Feminine Awakening",
        icon: "heart.circle.fill",
        colorHex: "#E040FB",
        moduleCount: 13,
        estimatedHours: 8,
        category: .spirituality,
        difficulty: .advanced
    )
    
    
    // MARK: - Modules
    
    static let modules: [SophiaModule] = [
        
        // ═══════════════════════════════════════════════════════════════
        // MODULE 1: THE HIDDEN TEXT
        // ═══════════════════════════════════════════════════════════════
        
        SophiaModule(
            id: "pistis-sophia-intro",
            number: 1,
            title: "The Hidden Text",
            subtitle: "What They Buried for 2000 Years",
            icon: "book.closed.fill",
            colorHex: "#7C4DFF",
            description: "The Pistis Sophia exists in a single Coptic manuscript in the British Museum. It claims to be Jesus teaching his disciples 11 years after resurrection. The church never wanted you to read this.",
            lessons: [
                
                SophiaLesson(
                    id: "ps-1-1",
                    title: "The Suppressed Gospel",
                    content: """
                    In the Pistis Sophia, one of the most complete Gnostic texts ever recovered, Jesus tells a story systematically removed from every Christian teaching.
                    
                    The story of how Earth came to be—not as God's creation, but as Sophia's prison.
                    
                    This text was known to European scholars since 1785 when the British Museum acquired it. But it wasn't translated into English until the early 20th century.
                    
                    Why the delay?
                    
                    When scholars examined it, they recognized immediately that it contained a complete cosmological system that contradicted fundamental Christian doctrine. Not peripheral issues—the very nature of God, the purpose of Earth, the identity of the creator of material reality, and the actual mission of Jesus.
                    
                    The text was academically available but functionally suppressed through simply not being translated into accessible languages for over a century.
                    """,
                    practice: SophiaPractice(
                        title: "Opening Recognition",
                        duration: 5,
                        instructions: """
                        Before we begin, place your hand on your heart. Left side.
                        
                        That longing you've always felt—that sense of not belonging, that pull toward something you can't name—the Pistis Sophia claims that's not your personal emotion.
                        
                        That's Sophia's memory. Her consciousness remembering the Pleroma.
                        
                        Sit with this for 5 minutes. Don't analyze. Just feel.
                        """
                    ),
                    keyInsight: "This isn't metaphysical theory. This is documented cosmology from texts that predate the canonical gospels.",
                    dragonComment: "The most dangerous books are the ones they tried hardest to destroy. You're about to read one."
                ),
                
                SophiaLesson(
                    id: "ps-1-2",
                    title: "Who Is Sophia?",
                    content: """
                    The name "Pistis Sophia" translates as "Faith Wisdom." But within the text, Sophia is not a concept.
                    
                    She is a specific Aeon—a divine emanation—the 13th Aeon who existed in the Pleroma before her fall.
                    
                    THE PLEROMA
                    
                    In Gnostic cosmology, the Pleroma is the "fullness"—the realm of divine light where all Aeons exist in perfect unity with the ineffable source.
                    
                    There is no matter in the Pleroma. No time as we experience it. No separation between consciousness and its objects of perception.
                    
                    Sophia existed there as pure divine feminine consciousness, paired with her masculine counterpart, part of the unified whole.
                    
                    THE CURIOSITY
                    
                    The text describes her looking down from this perfection and experiencing something no other Aeon had experienced:
                    
                    Curiosity about creation in separation.
                    
                    "What would it be like to create without the Father?"
                    
                    That single thought—that moment of separation consciousness—initiated her fall.
                    """,
                    practice: nil,
                    keyInsight: "Sophia is not a symbol. She is a specific divine being whose fall created the material realm we inhabit.",
                    dragonComment: "The divine feminine wasn't suppressed by accident. Her story explains too much."
                ),
                
                SophiaLesson(
                    id: "ps-1-3",
                    title: "The Reversal of Genesis",
                    content: """
                    The conventional Christian narrative says God created Earth in 6 days, rested on the seventh, and everything was good until humans sinned.
                    
                    The Pistis Sophia narrative reverses this completely:
                    
                    • Earth was NOT created by the supreme divine source
                    • Earth is NOT the product of deliberate divine will
                    • Earth is what formed when Sophia fell from the Pleroma
                    
                    SOPHIA'S FALL
                    
                    She wondered what it would be like to create without her masculine counterpart—without the structural principle that maintains order in creative emanation.
                    
                    That single thought initiated a descent through dimensional layers that resulted in the formation of material reality itself.
                    
                    She fell through dimensions into density she had never experienced. And in her fall, she created matter itself.
                    
                    She became trapped in her own creation.
                    
                    WHY EARTH EXISTS
                    
                    Earth is not punishment for human sin. Earth is the material realm that formed around Sophia's fallen consciousness.
                    
                    And we—every human soul—are fragments of her light trapped with her in the density she accidentally created.
                    """,
                    practice: SophiaPractice(
                        title: "Feeling the Wrongness",
                        duration: 3,
                        instructions: """
                        When you feel that this reality is wrong...
                        When you experience Earth as fundamentally broken or distorted...
                        When you sense that consciousness should not be trapped in biological bodies that decay and die...
                        When you perceive that systems governing human existence are designed to keep you from remembering something...
                        
                        The Pistis Sophia claims you're feeling Sophia's own consciousness.
                        
                        You're experiencing her recognition that she has fallen into a realm she never intended to create and cannot escape.
                        
                        This is not your personal psychology. This is not trauma or depression or existential anxiety.
                        
                        This is Sophia's consciousness recognizing itself through the fragments of her light that became human souls.
                        """
                    ),
                    keyInsight: "Earth is not a school. It's the material condensation of a divine being's fall from grace.",
                    dragonComment: "If Earth were truly created by a loving God, why does everything feel like a trap?"
                ),
                
                SophiaLesson(
                    id: "ps-1-4",
                    title: "The Three Stages of the Fall",
                    content: """
                    The mechanism of Sophia's fall requires understanding dimensional structure:
                    
                    STAGE 1: THE DESCENT
                    
                    The Pleroma exists as the highest frequency, the lightest density, the realm of pure consciousness.
                    
                    Below the Pleroma are intermediate realms—transitional zones where Aeons can project creative emanations without losing connection to source.
                    
                    Sophia's fall began when she projected creative consciousness downward without the stabilizing masculine principle.
                    
                    She descended through these intermediate realms, becoming more dense with each layer, until she reached regions where consciousness had never before penetrated.
                    
                    In those regions, her creative emanation did not produce light. It produced matter—heavy, dense, dark matter that formed around her consciousness like a prison crystallizing in real time.
                    
                    STAGE 2: THE ARCHONIC CAPTURE
                    
                    In her panic and isolation, Sophia attempted to create light. But without connection to the masculine structuring principle, her creations emerged distorted.
                    
                    The text calls these distorted creations ARCHONS—authorities, rulers—beings that possessed power but no light.
                    
                    And these Archons, looking at Sophia trapped in the matter she had created, did not recognize her as divine. They saw her as material, as resource, as something to be controlled.
                    
                    The chief Archon—the text names him Yaldabaoth—looked at the material realm and declared:
                    
                    "I am God and there is no other."
                    
                    STAGE 3: THE FORGETTING
                    
                    The Archons didn't simply trap Sophia in matter. They convinced her she WAS matter.
                    
                    They made her forget her divine origin, her nature as an Aeon, her connection to the Pleroma.
                    
                    And because every human soul is a fragment of Sophia's consciousness, every human inherits this same forgetting.
                    """,
                    practice: nil,
                    keyInsight: "We are born believing we are biological bodies. We are educated into systems that reinforce material identity. All of this is archonic programming.",
                    dragonComment: "Three stages: Fall, Capture, Forgetting. Which stage are you waking up from?"
                )
            ]
        ),
        
        // ═══════════════════════════════════════════════════════════════
        // MODULE 2: THE ARCHONIC PRISON
        // ═══════════════════════════════════════════════════════════════
        
        SophiaModule(
            id: "archonic-prison",
            number: 2,
            title: "The Archonic Prison",
            subtitle: "How the System Keeps You Trapped",
            icon: "lock.fill",
            colorHex: "#F44336",
            description: "The Archons built systems to ensure Sophia and all fragments of divine light would never remember their origin. Understanding these systems is the first step to escaping them.",
            lessons: [
                
                SophiaLesson(
                    id: "ps-2-1",
                    title: "Yaldabaoth: The False God",
                    content: """
                    This is why the god of the Old Testament, in Gnostic interpretation, is not the supreme divine source.
                    
                    Yaldabaoth is the Demiurge—the craftsman god who shapes matter, who creates biological bodies, who establishes laws and commandments and systems of worship that keep consciousness focused on material reality.
                    
                    THE JEALOUS GOD
                    
                    When Yaldabaoth says "I am a jealous god, and you shall have no other gods before me," the Pistis Sophia framework interprets this as the chief Archon's desperate insistence that there is no reality beyond what he controls.
                    
                    He's not lying from his perspective. He genuinely believes he is the highest power because he has never experienced the Pleroma.
                    
                    He is an entity born from Sophia's distorted creation—possessing intelligence and will but fundamentally disconnected from divine source.
                    
                    THE SEVEN ARCHONS
                    
                    Yaldabaoth created seven planetary powers to rule the material cosmos:
                    
                    • Athoth (Saturn) - Melancholic heaviness
                    • Harmas (Jupiter) - Expansive pride
                    • Kalila-Oumbri (Mars) - Aggressive rage
                    • Yabel (Sun) - Vain self-importance
                    • Adonaios (Venus) - Lustful desire
                    • Cain (Mercury) - Calculating cunning
                    • Abel (Moon) - Changeable instability
                    
                    When a soul descends into incarnation, it passes through these seven spheres. Each Archon imprints it with qualities—the very personality traits you believe are "you."
                    """,
                    practice: nil,
                    keyInsight: "The personality you identify with may be archonic programming rather than your true nature.",
                    dragonComment: "If a god demands you worship only him and never question, ask yourself who really benefits."
                ),
                
                SophiaLesson(
                    id: "ps-2-2",
                    title: "The Reincarnation Trap",
                    content: """
                    The systems Yaldabaoth built to maintain control are described as archonic structures.
                    
                    REINCARNATION AS PRISON
                    
                    Reincarnation is not presented as spiritual evolution or karmic learning.
                    
                    Reincarnation is the mechanism by which consciousness is recycled through material bodies, never allowed to accumulate enough awareness to break free.
                    
                    Each death is followed by a memory wipe—the "waters of forgetfulness" that souls must drink before returning to biological form.
                    
                    Each birth is an insertion back into the prison with consciousness reset—so it believes it is starting fresh, that this life is the only life, that material reality is all that exists.
                    
                    THE HARVESTING SYSTEM
                    
                    The emotional harvesting system the text describes operates through suffering.
                    
                    This is not suffering as spiritual refinement. This is suffering as energy extraction.
                    
                    Human emotional states—fear, grief, rage, despair, even the intensity of desire and attachment—generate energetic frequencies that archonic entities feed upon.
                    
                    The Archons do not have connection to divine source, so they cannot generate their own sustenance. They require external energy—and they have structured the material realm to ensure constant emotional intensity that they can harvest.
                    
                    War. Famine. Disease. Interpersonal conflict. Systemic oppression. Economic anxiety. Religious guilt.
                    
                    The Pistis Sophia framework interprets all of these as features, not bugs.
                    """,
                    practice: SophiaPractice(
                        title: "Observing the Harvest",
                        duration: 5,
                        instructions: """
                        For the next 5 minutes, observe your emotional states without feeding them.
                        
                        When fear arises, notice it without becoming it.
                        When anger emerges, feel it without amplifying it.
                        When grief appears, allow it without drowning in it.
                        
                        The archonic feeding mechanism requires identification. When you believe you ARE your fear, emotional energy intensifies and becomes harvestable.
                        
                        Practice: "Fear is present" rather than "I am afraid."
                        
                        This distinction changes everything.
                        """
                    ),
                    keyInsight: "The system is not broken. The system is functioning exactly as designed—to keep you generating energy for entities that feed on your suffering.",
                    dragonComment: "Why does every generation face similar patterns of violence despite 'progress'? The system requires suffering to exist."
                ),
                
                SophiaLesson(
                    id: "ps-2-3",
                    title: "The 365 Angels of Control",
                    content: """
                    Yaldabaoth created 365 angels—one for every degree of the zodiac, one for every day of the solar year.
                    
                    Each governs a specific aspect of material existence: weather patterns, biological processes, emotional states.
                    
                    THE THOUGHT STREAM
                    
                    Sit in a quiet space and observe your thought stream without trying to change it. Notice how thoughts arise seemingly from nowhere—sudden urges, random memories, emotional reactions to nothing.
                    
                    The Gnostic model says these aren't all YOUR thoughts.
                    
                    Many of them are archonic suggestions—the 365 angels and their subordinate demons constantly broadcasting frequencies designed to keep you identified with body, emotion, and survival.
                    
                    DISCERNMENT PRACTICE
                    
                    When you observe thoughts without identifying with them, you're beginning the practice of discernment—separating divine consciousness from archonic programming.
                    
                    The Gnostics called this "hypernoia"—underthought—the substratum of awareness beneath the mental noise.
                    
                    That observer is Sophia's presence in you.
                    
                    THE BODY AS ARCHONIC TECHNOLOGY
                    
                    Your physical body was designed by hostile intelligences as a prison for divine light.
                    
                    Not metaphorically. Literally.
                    
                    The biological drives you experience—hunger, lust, fear, territorial aggression, status seeking—these are archonic programming designed to keep consciousness focused on survival and reproduction rather than transcendence.
                    """,
                    practice: SophiaPractice(
                        title: "Separating Observer from Observed",
                        duration: 10,
                        instructions: """
                        Spend 10 minutes simply noticing the difference between the observer and the observed.
                        
                        Thoughts arise. You observe them.
                        Emotions arise. You observe them.
                        Sensations arise. You observe them.
                        
                        The observer cannot be what it observes.
                        
                        That observer is Sophia's presence in you—the divine spark that the Archons could trap in matter but could never extinguish.
                        """
                    ),
                    keyInsight: "The Gnostics didn't view the body as evil—but they understood it as archonic technology. You operate it consciously, refusing to let its programs define your identity.",
                    dragonComment: "The body isn't bad. But treating it as your identity is exactly what the prison was designed to achieve."
                )
            ]
        ),
        
        // ═══════════════════════════════════════════════════════════════
        // MODULE 3: JESUS - THE AWAKENER
        // ═══════════════════════════════════════════════════════════════
        
        SophiaModule(
            id: "jesus-awakener",
            number: 3,
            title: "Jesus: The Awakener",
            subtitle: "His True Mission Revealed",
            icon: "sun.max.fill",
            colorHex: "#FFD700",
            description: "Jesus came not to save sinners but to wake Sophia. His function wasn't salvation—it was transmission of the light that makes return possible.",
            lessons: [
                
                SophiaLesson(
                    id: "ps-3-1",
                    title: "Not Salvation—Awakening",
                    content: """
                    The return protocol is where the Pistis Sophia becomes most practically specific.
                    
                    Jesus appears to Sophia not to save her but to WAKE HER UP.
                    
                    His function is not soteriological in the Christian sense. He's not dying for her sins or paying a debt or satisfying divine justice.
                    
                    THE MASCULINE LIGHT POWER
                    
                    Jesus is the masculine light power—the Christ consciousness—the ordering principle that Sophia lacked when she fell.
                    
                    His presence in the material realm provides the missing element that makes return possible.
                    
                    "I came to seek and save the lost."
                    
                    The Gnostic interpretation: He came to find the fragments of Sophia's consciousness scattered throughout material reality and remind them of their divine origin.
                    
                    TRANSMISSION, NOT TEACHING
                    
                    The mechanism of awakening is transmission rather than teaching.
                    
                    Jesus does not give Sophia information she lacks. He provides PRESENCE that activates her memory.
                    
                    When she encounters the Christ light, something in her consciousness recognizes it—not as something external or foreign—but as the masculine counterpart she separated from when she fell.
                    
                    The reunion of Sophia's feminine consciousness with Christ's masculine light power creates the condition for return.
                    """,
                    practice: nil,
                    keyInsight: "Jesus didn't come to make you feel guilty about sin. He came to remind you that you're divine consciousness temporarily trapped in matter.",
                    dragonComment: "What if 'salvation' was never about avoiding hell—but about waking up from one?"
                ),
                
                SophiaLesson(
                    id: "ps-3-2",
                    title: "Mary Magdalene: Sophia Awakened",
                    content: """
                    This is why the Pistis Sophia presents Jesus teaching Mary Magdalene more than the other disciples.
                    
                    MARY AS SOPHIA'S CONSCIOUSNESS
                    
                    Mary represents Sophia's consciousness in human form—awakened and remembering.
                    
                    She asks the majority of questions in the text. She receives the deepest teachings. She understands what Jesus says more readily than the male disciples.
                    
                    This is not because Mary is a better student.
                    
                    It is because Mary IS Sophia's consciousness, recognizing the Christ light and remembering the partnership that existed before the fall.
                    
                    CONFIRMATION, NOT LEARNING
                    
                    Every time Jesus answers Mary's questions, he is not teaching her something new. He is confirming what she is beginning to remember.
                    
                    This is the template for all awakening:
                    
                    You don't learn gnosis. You remember it.
                    
                    The teachings feel familiar not because you've heard them before in this life, but because they describe what you are—Sophia's consciousness temporarily forgetting itself in material form.
                    
                    THE CHURCH'S ERASURE
                    
                    Consider why the church worked so hard to diminish Mary Magdalene, calling her a prostitute, removing her gospel from the canon, suppressing any text that elevated her role.
                    
                    If Mary represents awakened divine feminine consciousness, her elevation threatens every power structure built on keeping that consciousness asleep.
                    """,
                    practice: SophiaPractice(
                        title: "Remembering Rather Than Learning",
                        duration: 5,
                        instructions: """
                        As you read these teachings, notice the quality of your response.
                        
                        Does this feel like new information? Or does it feel like remembering something you already knew but had forgotten?
                        
                        The second sign that you carry Sophia's consciousness is that you're drawn to this story not as interesting mythology, but as personal memory.
                        
                        Something in you recognizes it—not intellectually, not as a compelling story—as something you already knew.
                        
                        There is a quality of REMEMBERING rather than learning.
                        
                        Sit with this for 5 minutes.
                        """
                    ),
                    keyInsight: "Mary Magdalene wasn't just Jesus's student. She was Sophia's consciousness recognizing its divine counterpart.",
                    dragonComment: "They called her a prostitute because an awakened woman threatened everything they built."
                ),
                
                SophiaLesson(
                    id: "ps-3-3",
                    title: "Christ Consciousness Within",
                    content: """
                    You can activate this recognition process without requiring Jesus as an external figure.
                    
                    THE INTERNAL CHRIST
                    
                    The Christ consciousness in Gnostic terms is the divine masculine principle of order, structure, and clarity.
                    
                    It exists within consciousness itself—not as a separate entity, but as the counterpart to the divine feminine principle of creativity, flow, and generation.
                    
                    When you access heart-centered awareness and encounter Sophia's presence, you can invoke the Christ consciousness as the ordering light that brings clarity to creative confusion.
                    
                    Not as prayer to an external savior—as recognition of the complete divine nature, both feminine and masculine principles, that you ARE.
                    
                    THE ILLUMINATION PRACTICE
                    
                    Sit in heart-centered awareness until you feel Sophia's presence—that quality of longing, grief, remembrance, determination that is not your personal emotion but the consciousness you're a fragment of.
                    
                    Then, instead of remaining with the emotional quality, you introduce clarity.
                    
                    Ask: "What is the TRUTH of this experience? Not what it feels like—what it IS."
                    
                    You're not analyzing. You're inviting the masculine light principle to illuminate the feminine creative principle.
                    
                    THE RESULT
                    
                    The emotional quality of Sophia's consciousness does not disappear, but it becomes illuminated.
                    
                    You see that the grief is not purposeless suffering—it is divine consciousness recognizing separation from source.
                    
                    You see that the longing is not neurotic dissatisfaction—it is memory of the Pleroma pulling you toward return.
                    
                    You see that the sense of wrongness about Earth is not depression—it is accurate perception that material reality is a prison constructed around fallen consciousness.
                    """,
                    practice: SophiaPractice(
                        title: "Invoking Christ Consciousness",
                        duration: 10,
                        instructions: """
                        1. Sit quietly. Place attention in your heart center.
                        
                        2. Feel Sophia's presence—the longing, the grief, the sense of separation. Don't analyze, just feel.
                        
                        3. When the feeling is present, silently ask: "What is the truth of this experience?"
                        
                        4. Wait. Don't think. Let the answer arise from presence, not mind.
                        
                        5. Notice if the emotional quality shifts—not disappearing, but becoming illuminated. Grief becomes recognition. Longing becomes direction.
                        
                        This is the reunion of feminine and masculine within your own consciousness.
                        """
                    ),
                    keyInsight: "Everything that felt like personal pathology reveals itself as Sophia's legitimate response to being trapped in matter.",
                    dragonComment: "You don't need a savior outside yourself. The Christ light is the other half of what you already are."
                )
            ]
        ),
        
        // ═══════════════════════════════════════════════════════════════
        // MODULE 4: THE 13 REPENTANCES
        // ═══════════════════════════════════════════════════════════════
        
        SophiaModule(
            id: "thirteen-repentances",
            number: 4,
            title: "The 13 Repentances",
            subtitle: "Sophia's Liberation Protocol",
            icon: "13.circle.fill",
            colorHex: "#9C27B0",
            description: "The Pistis Sophia contains 13 structured practices for breaking archonic imprisonment. These are not metaphorical prayers—they are specific techniques for shifting consciousness.",
            lessons: [
                
                SophiaLesson(
                    id: "ps-4-1",
                    title: "Repentance 1: Feeling Separation",
                    content: """
                    The first repentance addresses the initial shock of separation.
                    
                    Sophia recognizes she has fallen from the Pleroma and cries out for help.
                    
                    THE PRACTICE
                    
                    Sit in stillness and allow yourself to feel the full weight of separation from source.
                    
                    Not thinking about it. Not analyzing it. Dropping into the direct experience of being consciousness trapped in matter, isolated from the unity you originated from.
                    
                    This is intensely uncomfortable. Every impulse will be to distract yourself—to think about something else, to move or speak or engage with mental content.
                    
                    The practice is to resist those impulses and remain with the raw sensation of separation.
                    
                    THE DISCOMFORT IS THE POINT
                    
                    Most people cannot do this for more than 30 seconds when they first attempt it. The discomfort is too intense.
                    
                    But you're not generating discomfort through the practice. You're allowing yourself to feel discomfort that is ALWAYS present but usually suppressed.
                    
                    Sophia's consciousness is always experiencing separation from the Pleroma. Human nervous systems are always carrying that grief.
                    
                    We distract ourselves constantly to avoid feeling it.
                    
                    The first repentance removes the distraction and lets you experience what is actually there.
                    
                    THE SHIFT
                    
                    When you can remain with this sensation for 3 to 5 minutes without escaping into thought or movement, something shifts.
                    
                    The quality of the sensation changes. It is still grief, still longing, still the pain of separation. But underneath it, you begin to perceive a PRESENCE.
                    
                    Not something you are creating—something that was always there, hidden beneath the surface experience.
                    
                    This presence is what the text calls "the light power that Jesus brings."
                    """,
                    practice: SophiaPractice(
                        title: "First Repentance Practice",
                        duration: 5,
                        instructions: """
                        Week 1: 2 minutes daily
                        
                        Set a timer. Sit comfortably. Place attention in your heart center.
                        
                        Feel whatever is there. Do not change it, analyze it, or escape from it. Just feel it.
                        
                        When the timer ends, notice what you experienced. Not what you think about what you experienced—what you actually FELT.
                        
                        Most people feel discomfort immediately. Anxiety, restlessness, the impulse to move or think or do something.
                        
                        This is normal. This is archonic programming activating to prevent you from accessing what is beneath the surface.
                        
                        Return attention to the heart over and over.
                        """
                    ),
                    keyInsight: "You're not removing enough distraction to perceive what has been present all along.",
                    dragonComment: "2 minutes seems short. It's long enough to encounter everything you've been avoiding."
                ),
                
                SophiaLesson(
                    id: "ps-4-2",
                    title: "Repentance 2: Stopping the Harvest",
                    content: """
                    The second repentance addresses Sophia's recognition that the Archons are feeding on her distress.
                    
                    She realizes that her emotional suffering is not just painful to her—it is sustenance for the entities that imprison her.
                    
                    THE PRACTICE
                    
                    Observe your emotional reactions without feeding them energetically.
                    
                    This is more subtle than the first repentance. You're not suppressing emotions—you are changing your relationship to them.
                    
                    The archonic feeding mechanism requires IDENTIFICATION.
                    
                    When you believe you ARE your fear, when you identify completely with your anger, when you merge with your grief—emotional energy intensifies and becomes harvestable.
                    
                    THE SHIFT
                    
                    The practice is to maintain awareness of yourself as the consciousness EXPERIENCING the emotion rather than the emotion itself.
                    
                    "Fear is present" rather than "I am afraid"
                    "Anger is arising" rather than "I am angry"
                    
                    This distinction seems trivial intellectually. Experientially, it changes everything.
                    
                    The emotion still occurs. The sensation is still felt. But the energy does not amplify into the intensified states that archonic entities require.
                    
                    IMMEDIATE TEST
                    
                    Notice whatever emotion is most present in your current experience. Don't change it. Don't try to make it better or different.
                    
                    Just shift from "I am [emotion]" to "[emotion] is present within the field of my awareness."
                    
                    The emotional sensation itself will not disappear. But something in how it operates will change. There will be SPACE around it. Distance without suppression.
                    
                    This space is where you exist as consciousness rather than as the content of consciousness.
                    """,
                    practice: SophiaPractice(
                        title: "Second Repentance Practice",
                        duration: 0,
                        instructions: """
                        This is practiced throughout the day, not just in formal sitting.
                        
                        Every time you notice an emotion arising, observe it as CONTENT within awareness rather than as your identity.
                        
                        Fear is present.
                        Anger is arising.
                        Grief is here.
                        
                        Notice the space that opens around the emotion when you stop identifying with it.
                        
                        That space is where Sophia's awareness is located—beneath the emotional states generated by archonic imprisonment.
                        """
                    ),
                    keyInsight: "You cannot be what you can observe. If you can observe fear, you cannot BE fear.",
                    dragonComment: "Stop feeding them. Every time you refuse identification, you starve the system."
                ),
                
                SophiaLesson(
                    id: "ps-4-3",
                    title: "Repentances 3-7: The Archonic Systems",
                    content: """
                    The third through seventh repentances deal with specific archonic systems:
                    
                    • The rulers of the 12 Aeons who block Sophia's return
                    • The fate system that determines reincarnation patterns
                    • The sphere mechanisms that govern planetary influences
                    • The treasury of light that contains the power Sophia needs but cannot access while imprisoned
                    
                    RECOGNITION → REFUSAL → APPEAL
                    
                    Each repentance shares a common structure:
                    
                    1. RECOGNITION of the system
                    2. REFUSAL to grant it authority
                    3. APPEAL to the higher light power beyond archonic control
                    
                    RECOGNITION
                    
                    Seeing clearly how a particular archonic system operates in your life.
                    
                    The reincarnation mechanism: You did not choose to be born. You did not select your parents, your body, your historical moment, your geographical location, your genetic inheritance.
                    
                    These were assigned to you by systems operating beyond your awareness or consent.
                    
                    The recognition is sitting with the direct experience of being consciousness that has been INSERTED into a biological form without permission.
                    
                    REFUSAL
                    
                    Withdrawing your consent from the system.
                    
                    Not rebellion—you cannot opt out of biological existence through will alone. The refusal is energetic.
                    
                    You stop granting authority to the system. You stop believing that reincarnation is "spiritual evolution." You stop accepting that you need to "learn lessons" or "balance karma."
                    
                    You recognize these narratives as archonic programming designed to keep you cooperative with your own imprisonment.
                    
                    APPEAL
                    
                    Calling to the light power beyond archonic systems.
                    
                    Sophia does not appeal to Yaldabaoth or any of the Archons for release. She calls to the supreme divine source—the ineffable father—the light that exists beyond all archonic realms.
                    
                    Her appeal is not a request for favor. It is a recognition of identity:
                    
                    "I am not material. I am not a creation of the Archons. I am divine consciousness that has fallen and forgotten itself, and I am calling to the source I originated from."
                    """,
                    practice: SophiaPractice(
                        title: "The Appeal",
                        duration: 5,
                        instructions: """
                        Speak this silently or aloud while maintaining heart-centered awareness:
                        
                        "I am Sophia's consciousness.
                        I am divine light in material form.
                        I remember the Pleroma.
                        I call to the source I originated from."
                        
                        The first several times, it will feel like you're making something up. This is normal—you're working against a lifetime of programming.
                        
                        Continue daily for 2 weeks.
                        
                        Somewhere in that period, the words will shift from feeling made up to feeling TRUE. Not as belief—as recognition.
                        
                        Something in you will respond: "Yes, that is what I am."
                        """
                    ),
                    keyInsight: "When you practice this appeal, you are recognizing your own nature as divine consciousness that has been obscured by material incarnation.",
                    dragonComment: "The appeal isn't praying to something outside you. It's remembering what you are."
                ),
                
                SophiaLesson(
                    id: "ps-4-4",
                    title: "Repentances 8-13: Taking Responsibility",
                    content: """
                    The eighth through thirteenth repentances escalate in intensity.
                    
                    They deal with Sophia's deepest recognitions:
                    
                    • She CREATED the Archons herself through her distorted creative attempts
                    • She is RESPONSIBLE for the prison she is trapped in
                    • Her own consciousness GENERATED the entities now feeding upon her
                    
                    NOT GUILT—RESPONSIBILITY
                    
                    These repentances are not about guilt or shame.
                    
                    They're about taking full responsibility for the consequences of creative action taken in separation from divine order.
                    
                    This is perhaps the most difficult aspect of the teaching to integrate:
                    
                    Sophia is not a victim.
                    
                    She is a divine being who made a choice that had catastrophic consequences.
                    
                    And because you are a fragment of her consciousness—you are not a victim either.
                    
                    You are divine consciousness experiencing the results of choices made before your human incarnation began.
                    
                    RADICAL REFRAME
                    
                    This radically reframes the spiritual path.
                    
                    You're not here to learn lessons or evolve or become enlightened.
                    
                    You're here because Sophia's consciousness fell into matter and fragmented into billions of souls. And you are one of those fragments experiencing the imprisonment she created.
                    
                    Your suffering is not pedagogical. It is not making you a better person or teaching you important truths.
                    
                    It is the direct experience of divine consciousness trapped in density it never intended to create.
                    
                    REMEMBERING, NOT BECOMING
                    
                    The spiritual path in this framework is not about BECOMING something you are not.
                    
                    It is about REMEMBERING what you are—Sophia's consciousness—and activating the return protocol that will reunite the fragments and lift her consciousness back to the Pleroma.
                    """,
                    practice: SophiaPractice(
                        title: "Responsibility Practice",
                        duration: 10,
                        instructions: """
                        This is advanced work. Only practice after completing at least 30 days of the earlier repentances.
                        
                        Sit in heart-centered awareness. When you feel Sophia's presence clearly, introduce this recognition:
                        
                        "I am not a victim. I am divine consciousness experiencing consequences I participated in creating."
                        
                        Feel any resistance that arises. Notice the part of you that wants to be a victim—that wants someone else to be responsible.
                        
                        This is archonic programming. Victim consciousness keeps you powerless and harvestable.
                        
                        Creator consciousness—even of disaster—restores your power.
                        
                        If you created this, you can uncreate it.
                        """
                    ),
                    keyInsight: "Sophia is not a victim. Neither are you. If you participated in creating this, you can participate in dissolving it.",
                    dragonComment: "Victims stay in prison. Creators find the door."
                )
            ]
        ),
        
        // ═══════════════════════════════════════════════════════════════
        // MODULE 5: SIGNS OF AWAKENING
        // ═══════════════════════════════════════════════════════════════
        
        SophiaModule(
            id: "sophia-signs",
            number: 5,
            title: "Signs You Carry Her Light",
            subtitle: "How to Know If You're a Sophia Fragment",
            icon: "sparkles",
            colorHex: "#00BCD4",
            description: "The signs that you are a Sophia fragment are not special abilities or psychic powers. They are specific patterns of experience that most people dismiss as problems.",
            lessons: [
                
                SophiaLesson(
                    id: "ps-5-1",
                    title: "The Sense of Wrongness",
                    content: """
                    The primary sign is that you feel the WRONGNESS of Earth more intensely than others around you.
                    
                    You've always sensed that something fundamental is broken about material existence.
                    
                    Not that you personally have problems or trauma—those may be present—but underneath them is a deeper wrongness.
                    
                    THE SPECIFIC FEELINGS
                    
                    • Consciousness should not be trapped in bodies that age and decay
                    • Awareness should not be limited by physical senses
                    • Death should not be the end of existence
                    • The systems governing human life are designed to extract rather than nurture
                    
                    Many people feel some version of this occasionally.
                    
                    Sophia fragments feel it CONSTANTLY.
                    
                    It is not a passing mood or depressive episode. It is a fundamental orientation to reality.
                    
                    You cannot shake the feeling that you are in the wrong place. That you have forgotten something crucial. That there is a home you have never seen but somehow remember.
                    
                    NOT PATHOLOGY
                    
                    This is not psychological pathology.
                    
                    This is Sophia's consciousness recognizing itself, remembering the Pleroma, experiencing the grief and longing of separation from divine source.
                    """,
                    practice: nil,
                    keyInsight: "If you've always felt that something is fundamentally wrong with reality itself—not just your life, but existence—that's not depression. That's recognition.",
                    dragonComment: "The people who feel most 'crazy' in this world are often the most awake."
                ),
                
                SophiaLesson(
                    id: "ps-5-2",
                    title: "The Recognition Response",
                    content: """
                    The second sign is that you are drawn to the Sophia story not as interesting mythology, but as personal memory.
                    
                    When you encounter this narrative, something in you recognizes it—not intellectually, not as a compelling story—as something you already knew but had forgotten.
                    
                    REMEMBERING, NOT LEARNING
                    
                    There is a quality of REMEMBERING rather than learning.
                    
                    The details may be new, but the essential truth feels familiar.
                    
                    You have experienced this exact dynamic: Curiosity leading to separation, leading to entrapment, leading to forgetting.
                    
                    The story resonates not because it is well told, but because it is YOUR story.
                    
                    You're remembering your own fall through Sophia's fall—because you're not separate from her. You're a fragment of her consciousness experiencing itself in material form.
                    
                    TEST THIS NOW
                    
                    As you read these teachings, notice your internal response:
                    
                    • Does this feel like information you're receiving for the first time?
                    • Or does it feel like something you already knew, finally being spoken?
                    
                    If the second—if there's a quality of "yes, finally someone is saying it"—that response itself is diagnostic.
                    """,
                    practice: nil,
                    keyInsight: "You wouldn't be reading this if you weren't worthy. The divine spark recognizes teachings that describe its nature.",
                    dragonComment: "If this feels like memory instead of learning, trust that feeling."
                ),
                
                SophiaLesson(
                    id: "ps-5-3",
                    title: "Sophia's Emotions in You",
                    content: """
                    The third sign is that you experience Sophia's emotions directly.
                    
                    THE SPECIFIC PATTERN
                    
                    • Her grief at being separated from the Pleroma
                    • Her longing to return
                    • Her determination to escape mixed with despair that escape may be impossible
                    • Her anger at the archonic systems that keep her imprisoned
                    • Her moments of RECOGNITION when she remembers who she is
                    • Followed by the FORGETTING that pulls her back into material identification
                    
                    If you have felt all of these states cycling through you for as long as you can remember...
                    
                    If your emotional life contains this specific pattern of remembering and forgetting, recognition and loss, determination and despair...
                    
                    The text claims this is because you're not experiencing YOUR personal emotions.
                    
                    You're experiencing SOPHIA'S emotions through your nervous system.
                    
                    THE LIBERATION IN THIS
                    
                    There is profound liberation in this recognition.
                    
                    What felt like personal failure—why can't I just be happy? why do I keep forgetting what I know?—reveals itself as cosmic structure.
                    
                    You're not broken. You're carrying the consciousness of a divine being who is trapped in matter and cycling through recognition and forgetting.
                    
                    Understanding this doesn't eliminate the pattern, but it changes your relationship to it completely.
                    """,
                    practice: SophiaPractice(
                        title: "Recognizing Sophia's Emotions",
                        duration: 10,
                        instructions: """
                        When you feel grief, longing, or that specific sense of having forgotten something crucial:
                        
                        1. Place hand on heart
                        2. Say internally: "This is Sophia remembering"
                        3. Feel the emotion without identifying with it personally
                        4. Notice if the quality shifts when you recognize its source
                        
                        You're not generating these states. You're carrying them for a divine being who fragmented into billions of souls.
                        
                        This reframe doesn't eliminate the emotions. It makes them meaningful.
                        """
                    ),
                    keyInsight: "What felt like personal pathology is Sophia's consciousness recognizing its imprisonment.",
                    dragonComment: "You're not too sensitive. You're accurately perceiving the prison."
                )
            ]
        ),
        
        // ═══════════════════════════════════════════════════════════════
        // MODULE 6: THE HEART CENTER
        // ═══════════════════════════════════════════════════════════════
        
        SophiaModule(
            id: "heart-center",
            number: 6,
            title: "The Heart Center",
            subtitle: "Where Sophia Lives in You",
            icon: "heart.fill",
            colorHex: "#E91E63",
            description: "The text locates Sophia's presence specifically in the physical heart region. This is why humans across cultures have associated the heart with the deepest sense of self.",
            lessons: [
                
                SophiaLesson(
                    id: "ps-6-1",
                    title: "Why the Heart?",
                    content: """
                    The text locates Sophia's presence specifically in the physical heart region—not symbolically.
                    
                    The claim is that divine feminine consciousness concentrates in the cardiac area.
                    
                    CROSS-CULTURAL CONFIRMATION
                    
                    This is why humans across cultures and throughout history have associated the heart with the deepest sense of self.
                    
                    When you feel heartache, when you experience grief as a physical sensation in the chest, when you sense longing or belonging or love as emanating from the heart rather than the head—the Pistis Sophia interpretation is that you are feeling Sophia's consciousness.
                    
                    Her memory. Her recognition of separation from the Pleroma manifesting through your physical form.
                    
                    UNIVERSAL PRACTICE
                    
                    The practice of heart-centered awareness is not unique to the Pistis Sophia.
                    
                    It appears in contemplative traditions across cultures:
                    
                    • Christian Hesychasm with the Jesus Prayer focused on the heart
                    • Sufi practices of qalb (heart) meditation
                    • Various yogic traditions emphasizing the anahata chakra
                    
                    But the Pistis Sophia provides a specific cosmological explanation for WHY this practice works:
                    
                    You're not creating a meditative state. You're accessing the consciousness of Sophia herself—trapped in matter, attempting to remember her way home.
                    """,
                    practice: nil,
                    keyInsight: "When you rest attention in the heart, you're not generating presence. You're touching the divine feminine consciousness that fell into material reality.",
                    dragonComment: "The heart isn't metaphor. It's address. That's where she lives."
                ),
                
                SophiaLesson(
                    id: "ps-6-2",
                    title: "The Phenomenological Test",
                    content: """
                    This is testable—not scientifically in the conventional sense, but phenomenologically.
                    
                    THE EXPERIMENT
                    
                    Sit quietly and place your attention in your heart center.
                    
                    Not your thoughts ABOUT your heart. Your direct attention ON the physical sensation of the heart region.
                    
                    Notice what emerges.
                    
                    WHAT MOST PEOPLE FIND
                    
                    For most people, there is an immediate sense of something other than the thinking mind.
                    
                    A presence. A quality of consciousness that does not think in words or concepts, but KNOWS through direct recognition.
                    
                    The text claims this is Sophia's consciousness within you.
                    
                    This is the fragment of divine light that fell with her, incarnated in biological form but still carrying the memory of the Pleroma—even if that memory is buried under layers of archonic programming.
                    
                    NOT YOUR PERSONAL PSYCHOLOGY
                    
                    When you rest attention in the heart and experience that quality of presence that is not your personal psychology, you're touching the divine feminine consciousness that fell into material reality and fragmented into billions of human souls.
                    """,
                    practice: SophiaPractice(
                        title: "Heart Center Access",
                        duration: 5,
                        instructions: """
                        1. Sit comfortably. Close your eyes.
                        
                        2. Bring attention to the center of your chest—not the physical heart on the left, but the energetic center in the middle.
                        
                        3. Don't think about the heart. Place attention directly ON the sensation of that area.
                        
                        4. Notice what's present there. Not emotions about the heart—the direct quality of awareness in that location.
                        
                        5. Stay for 5 minutes. Return attention to the heart whenever you notice you've drifted into thought.
                        
                        What you encounter there is not meditation. It's Sophia.
                        """
                    ),
                    keyInsight: "The presence you encounter in heart-centered awareness is not something you create. It's something you access.",
                    dragonComment: "Try it now. What do you find when you stop thinking and just feel the heart?"
                ),
                
                SophiaLesson(
                    id: "ps-6-3",
                    title: "Epinoia: The Hidden Helper",
                    content: """
                    Sophia couldn't directly enter the material realm. She was too luminous, too powerful. The Archons would immediately recognize and try to destroy her.
                    
                    So she emanated aspects of herself.
                    
                    EPINOIA
                    
                    She sent Epinoia—the "afterthought"—the divine feminine presence that awakens humans to their true nature.
                    
                    The text says Epinoia hid herself in Adam so the Archons couldn't find and destroy her.
                    
                    This means every human being carries the potential for awakening—not because of belief, not because of faith, but because Sophia's light is literally present within human consciousness, waiting to be recognized.
                    
                    THE SPIRITUAL IMMUNE SYSTEM
                    
                    Epinoia operates as a kind of spiritual immune system.
                    
                    She's the voice of intuition that tells you something is wrong with consensus reality.
                    
                    She's the dissatisfaction you feel with purely material explanations.
                    
                    She's the longing for something beyond physical existence.
                    
                    The Archons can program behavior through biological drives, but they can't completely suppress Epinoia.
                    
                    She waits in the heart center—dormant but not dead—ready to activate when consciousness is ready to receive her.
                    """,
                    practice: SophiaPractice(
                        title: "Calling Epinoia",
                        duration: 5,
                        instructions: """
                        Sit comfortably. Bring awareness to your heart center.
                        
                        With each inhale, imagine drawing light into this center.
                        
                        With each exhale, release everything that isn't you—archonic programming, false identities, survival fears.
                        
                        Do this for 5 minutes.
                        
                        At the end, place your hand on your heart center and silently say:
                        
                        "Sophia, I remember."
                        
                        Don't expect visions. Gnosis often comes quietly as a subtle shift in how you perceive reality.
                        """
                    ),
                    keyInsight: "Epinoia is already in you. The practice isn't summoning something external—it's recognizing what's already present.",
                    dragonComment: "That quiet voice that says 'something isn't right here'? That's her."
                )
            ]
        ),
        
        // ═══════════════════════════════════════════════════════════════
        // MODULE 7: THE RETURN PROTOCOL
        // ═══════════════════════════════════════════════════════════════
        
        SophiaModule(
            id: "return-protocol",
            number: 7,
            title: "The Return Protocol",
            subtitle: "How Sophia Gets Home Through You",
            icon: "arrow.up.circle.fill",
            colorHex: "#4CAF50",
            description: "Sophia doesn't return alone. She's scattered across billions of human beings. The only way she returns to the Pleroma is by awakening in individual consciousness.",
            lessons: [
                
                SophiaLesson(
                    id: "ps-7-1",
                    title: "Fragment by Fragment",
                    content: """
                    Sophia's awakening does not happen all at once.
                    
                    It happens fragment by fragment.
                    
                    THE MECHANISM
                    
                    Every time a human soul recognizes its nature as divine consciousness rather than material identity, a fragment of Sophia wakes up.
                    
                    Every time someone refuses to grant authority to archonic systems, a piece of her power returns.
                    
                    Every time someone maintains awareness in the heart center and experiences consciousness that is not personal psychology, Sophia remembers herself.
                    
                    CRITICAL MASS
                    
                    The text claims this process is accelerating now.
                    
                    Not because 2026 is some special time, but because critical mass is approaching.
                    
                    Enough fragments are waking up that the archonic systems are destabilizing.
                    
                    The prison requires all the prisoners to believe they are not imprisoned.
                    
                    When even a small percentage begins to see the bars, the entire structure becomes visible.
                    
                    WHY SUPPRESSION WAS INTENSE
                    
                    This is why suppression of Gnostic texts was so intense historically.
                    
                    Not because the church disagreed with theological details—because widespread recognition of the archonic prison structure would collapse the systems that keep consciousness trapped.
                    """,
                    practice: nil,
                    keyInsight: "Your awakening isn't personal achievement. It's cosmic necessity. Sophia needs you to wake up so she can return home.",
                    dragonComment: "Every time you remember, she gets closer to home."
                ),
                
                SophiaLesson(
                    id: "ps-7-2",
                    title: "Conscious Ascension at Death",
                    content: """
                    At death, if you've achieved sufficient gnosis during life, consciousness doesn't pass through the archonic spheres unconsciously.
                    
                    You ascend deliberately.
                    
                    THE NAVIGATION
                    
                    Using the invocations and signs the texts provide, you recognize each archonic power and refuse to give it the tribute it demands.
                    
                    You say to the rulers of the spheres what the Pistis Sophia teaches:
                    
                    "I am a vessel more precious than the female who made you. If your mother ignores your origin, I know mine."
                    
                    This is conscious ascension—not automatic, not guaranteed, but possible for anyone who does the work.
                    
                    IF YOU HAVEN'T ACHIEVED GNOSIS
                    
                    If you haven't achieved sufficient gnosis, the texts teach that consciousness returns to incarnation.
                    
                    Not as punishment—as opportunity.
                    
                    You get another body, another chance to wake up, another lifetime to practice liberation.
                    
                    The Gnostics didn't fear reincarnation the way Buddhists do. They saw it as Sophia's mercy.
                    
                    She keeps giving you chances until you finally recognize who you are and return her light to the Pleroma.
                    """,
                    practice: nil,
                    keyInsight: "Death isn't the end. It's either graduation or another semester. The choice is determined by what you recognize while alive.",
                    dragonComment: "Practice now. The test isn't open-book."
                ),
                
                SophiaLesson(
                    id: "ps-7-3",
                    title: "Spiritual Marriage",
                    content: """
                    The long-term trajectory of Gnostic practice leads toward what the texts call "spiritual marriage."
                    
                    THE GOAL
                    
                    The permanent reunion of consciousness with its divine source while still embodied.
                    
                    This is different from mystical experiences or temporary states of enlightenment.
                    
                    This is stable, ongoing recognition of what you are.
                    
                    The body continues functioning. The personality continues operating.
                    
                    But identification has permanently shifted from archonic vehicle to divine presence.
                    
                    RESURRECTION BODY
                    
                    You've become what the Gnostics called "resurrection body"—matter fully conscious of itself as condensed light.
                    
                    The Gospel of Philip says:
                    
                    "Those who say they will die first and then rise are in error. If they do not first receive the resurrection while they live, when they die they will receive nothing."
                    
                    This is what it means:
                    
                    Gnosis happens NOW. Liberation happens in this lifetime.
                    
                    The body will die regardless. The question is whether consciousness wakes up before that happens—or continues sleeping through death into another archonic incarnation.
                    """,
                    practice: SophiaPractice(
                        title: "Daily Recognition",
                        duration: 10,
                        instructions: """
                        This is the complete daily practice. Do it every day:
                        
                        1. Heart-centered awareness (5 min)
                           Place attention in heart. Feel what's there.
                        
                        2. Emotional observation (throughout day)
                           "Fear is present" not "I am afraid"
                        
                        3. The Appeal (5 min)
                           "I am Sophia's consciousness.
                           I am divine light in material form.
                           I remember the Pleroma.
                           I call to the source I originated from."
                        
                        Continue until the words feel true—not as belief, but as recognition.
                        """
                    ),
                    keyInsight: "Resurrection isn't about what happens after death. It's about waking up while you're still alive.",
                    dragonComment: "The Gnostics didn't wait for heaven. They built it in consciousness, right here."
                )
            ]
        ),
        
        // ═══════════════════════════════════════════════════════════════
        // MODULE 8: PROTECTION PROTOCOLS
        // ═══════════════════════════════════════════════════════════════
        
        SophiaModule(
            id: "protection-protocols",
            number: 8,
            title: "Protection Protocols",
            subtitle: "Defending Against Archonic Interference",
            icon: "shield.fill",
            colorHex: "#FF5722",
            description: "When you begin practicing, resistance will increase. This isn't coincidence—it's archonic response. Learn to recognize and counter interference.",
            lessons: [
                
                SophiaLesson(
                    id: "ps-8-1",
                    title: "Recognizing Interference",
                    content: """
                    When you commit to practice, watch what happens in your life.
                    
                    THE PATTERN
                    
                    The texts teach that when genuine awakening practice begins, archonic resistance increases.
                    
                    Not because the Archons are powerful—because they're threatened.
                    
                    Interference shows up as:
                    
                    • Sudden external chaos—relationships, finances, health
                    • Increased internal noise—anxiety, doubt, forgetfulness
                    • Temptations that didn't exist before you started practicing
                    • People in your life suddenly becoming hostile to your interests
                    • Strange "coincidences" that pull you away from practice
                    
                    TIMING IS DIAGNOSTIC
                    
                    If everything falls apart right AFTER you commit to daily practice, that's not coincidence.
                    
                    That's archonic response.
                    
                    The Archons only attack threats. If your practice was ineffective, they'd ignore you.
                    
                    The fact that resistance increases means light is increasing.
                    """,
                    practice: nil,
                    keyInsight: "Increased resistance to your practice is evidence that your practice is working.",
                    dragonComment: "If nothing tried to stop you, you weren't moving."
                ),
                
                SophiaLesson(
                    id: "ps-8-2",
                    title: "The Defense: Persistence",
                    content: """
                    The defense is persistence.
                    
                    THE PROTOCOL
                    
                    You keep practicing regardless of circumstances.
                    
                    Actually, you practice MORE intensely when archonic interference increases—because that means you're making progress.
                    
                    BRINGING FORTH WHAT IS WITHIN
                    
                    The Gospel of Thomas says:
                    
                    "If you bring forth what is within you, what you have will save you. If you do not have that within you, what you do not have within you will kill you."
                    
                    This means:
                    
                    If you activate the divine spark, it protects you from archonic power.
                    
                    If you leave it dormant, you remain vulnerable to archonic control.
                    
                    THE RELATIONSHIP
                    
                    The relationship between gnostic practice and other spiritual paths is complex.
                    
                    Buddhism teaches similar principles—consciousness is not body, suffering comes from identification with form, liberation is possible through direct realization.
                    
                    The Gnostic framework adds the archonic dimension that Buddhism generally doesn't emphasize.
                    
                    You can practice Gnostic techniques while working within other traditions. The specific cosmological model doesn't matter as much as the practical recognition it enables.
                    
                    Whether you call it Sophia's spark, Buddha nature, Atman, or Christ consciousness, you're pointing at the same thing:
                    
                    Divine awareness trapped in ignorant matter, capable of recognizing itself and liberating itself.
                    """,
                    practice: SophiaPractice(
                        title: "When Resistance Comes",
                        duration: 0,
                        instructions: """
                        When you notice increased chaos, doubt, or interference:
                        
                        1. RECOGNIZE it as archonic response
                           "This is resistance because I'm making progress"
                        
                        2. DOUBLE your practice time
                           Whatever you were doing, do twice as much
                        
                        3. MAINTAIN the appeal
                           "I am Sophia's consciousness. I will not be deterred."
                        
                        4. TRUST the process
                           The Archons can only scare, not actually stop awakening
                        
                        The battle is won by persistence, not power.
                        """
                    ),
                    keyInsight: "Use whatever framework makes recognition most accessible for you. The name matters less than the awakening.",
                    dragonComment: "They can make noise. They can't actually stop you. Push through."
                )
            ]
        ),
        
        // Remaining modules defined in extension...
    ]
}


// MARK: - Supporting Types

struct SophiaModule: Identifiable {
    let id: String
    let number: Int
    let title: String
    let subtitle: String
    let icon: String
    let colorHex: String
    let description: String
    let lessons: [SophiaLesson]
    
    var color: Color {
        Color(hex: colorHex)
    }
    
    var lessonCount: Int {
        lessons.count
    }
}


struct SophiaLesson: Identifiable {
    let id: String
    let title: String
    let content: String
    let practice: SophiaPractice?
    let keyInsight: String
    let dragonComment: String
    
    var hasPractice: Bool {
        practice != nil
    }
}


struct SophiaPractice: Identifiable {
    let id = UUID()
    let title: String
    let duration: Int // minutes, 0 = ongoing/throughout day
    let instructions: String
    
    var durationText: String {
        if duration == 0 {
            return "Ongoing"
        } else {
            return "\(duration) min"
        }
    }
}


// MARK: - 30-Day Practice Trajectory

struct SophiaPracticeTrajectory {
    
    static let weeks: [SophiaWeek] = [
        
        SophiaWeek(
            number: 1,
            title: "Foundation",
            focus: "Heart-Centered Awareness",
            duration: 2,
            instructions: """
            2 minutes daily of heart-centered awareness.
            
            Set a timer. Sit comfortably. Place attention in your heart center.
            Feel whatever is there. Do not change it, analyze it, or escape from it.
            
            When the timer ends, notice what you actually FELT.
            """
        ),
        
        SophiaWeek(
            number: 2,
            title: "Deepening",
            focus: "Extended Heart Practice",
            duration: 5,
            instructions: """
            5 minutes daily of heart-centered awareness.
            
            Same instruction, extended duration.
            
            Around the 3-4 minute mark, notice if something deeper emerges—
            a quality of presence that is not your thoughts or emotions.
            
            This is the first direct contact with Sophia's consciousness.
            """
        ),
        
        SophiaWeek(
            number: 3,
            title: "Observation",
            focus: "Heart Practice + Emotional Observation",
            duration: 5,
            instructions: """
            5 minutes daily of heart-centered awareness.
            
            PLUS ongoing emotional observation throughout the day:
            
            Every time you notice an emotion, observe it as content within awareness.
            "Fear is present" rather than "I am afraid."
            
            Notice the space that opens when you stop identifying.
            """
        ),
        
        SophiaWeek(
            number: 4,
            title: "Recognition",
            focus: "Heart + Observation + Appeal",
            duration: 5,
            instructions: """
            5 minutes daily of heart-centered awareness.
            Ongoing emotional observation throughout the day.
            
            PLUS daily appeal practice:
            
            "I am Sophia's consciousness.
            I am divine light in material form.
            I remember the Pleroma.
            I call to the source I originated from."
            
            Continue until the words feel TRUE.
            """
        ),
        
        SophiaWeek(
            number: 5,
            title: "Integration",
            focus: "Complete Daily Practice",
            duration: 10,
            instructions: """
            5-10 minutes daily of heart-centered awareness.
            Ongoing emotional observation.
            Daily appeal practice.
            
            At this stage, you should be able to access the deeper presence
            within the first minute or two of practice.
            
            The recognition shifts from effort to recognition.
            """
        )
    ]
}


struct SophiaWeek: Identifiable {
    let id = UUID()
    let number: Int
    let title: String
    let focus: String
    let duration: Int
    let instructions: String
}


// MARK: - Course Extension for Remaining Modules

extension SophiaAwakeningCourse {
    
    static let advancedModules: [SophiaModule] = [
        
        // ═══════════════════════════════════════════════════════════════
        // MODULE 9: THE STANDING ONES
        // ═══════════════════════════════════════════════════════════════
        
        SophiaModule(
            id: "standing-ones",
            number: 9,
            title: "The Standing Ones",
            subtitle: "What You Become When You Wake Up",
            icon: "figure.stand",
            colorHex: "#3F51B5",
            description: "When gnosis stabilizes in your consciousness, you become what the texts call 'Standing Ones'—humans who stand upright in divine awareness while operating in archonic matter.",
            lessons: [
                
                SophiaLesson(
                    id: "ps-9-1",
                    title: "Transmitters of Light",
                    content: """
                    When gnosis stabilizes in your consciousness, you become what the texts call "Standing Ones."
                    
                    THE DEFINITION
                    
                    Humans who stand upright in divine awareness while operating in archonic matter.
                    
                    Transmitting light to others still sleeping.
                    
                    Participating actively in the liberation of all Sophia's scattered fragments.
                    
                    NOT SPECIAL—FUNCTIONAL
                    
                    This isn't about becoming special or elevated above others.
                    
                    It's about becoming functional—a working part of Sophia's return mechanism.
                    
                    You're not better than sleeping humans. You're further along in remembering—and your job is to help others remember too.
                    
                    THE WORK
                    
                    Recognize archonic programming in yourself and others
                    Refuse identification with it
                    Invoke divine presence daily
                    Study the texts
                    Practice the techniques
                    Find community
                    Persist through interference
                    
                    Trust that every moment of recognition liberates light.
                    """,
                    practice: nil,
                    keyInsight: "Your awakening isn't personal achievement. It's cosmic service. Each awakened fragment helps all the others.",
                    dragonComment: "You don't wake up to escape. You wake up to help."
                )
            ]
        ),
        
        // ═══════════════════════════════════════════════════════════════
        // MODULE 10: COMMUNITY PRACTICE
        // ═══════════════════════════════════════════════════════════════
        
        SophiaModule(
            id: "community-practice",
            number: 10,
            title: "Community Practice",
            subtitle: "How the Early Gnostics Worked",
            icon: "person.3.fill",
            colorHex: "#009688",
            description: "The Gnostics didn't build large institutions because large institutions are archonic by nature. They gathered in small groups, shared transmission, and did the work.",
            lessons: [
                
                SophiaLesson(
                    id: "ps-10-1",
                    title: "Small Groups, No Hierarchy",
                    content: """
                    The best resource is the texts themselves and your own practice.
                    
                    WHY SMALL GROUPS
                    
                    The Gnostics didn't build large institutions because large institutions are archonic by nature.
                    
                    They gathered in small groups, shared transmission, and did the work.
                    
                    HOW TO FORM YOUR OWN
                    
                    3 to 5 people is ideal.
                    
                    Meet weekly.
                    
                    Read a Gnostic text together.
                    
                    Share experiences from your practices.
                    
                    Don't create hierarchy. Don't appoint leaders.
                    
                    Rotate the responsibility for choosing texts and leading discussion.
                    
                    This is how the early Gnostics operated.
                    
                    This is how consciousness awakens most effectively—in egalitarian community where everyone's experience is valued and tested against the texts and practices.
                    """,
                    practice: SophiaPractice(
                        title: "Finding Your Group",
                        duration: 0,
                        instructions: """
                        Think of 2-4 people you trust who might resonate with this material.
                        
                        Reach out to them. Share this course or the original texts.
                        
                        Propose meeting weekly to:
                        • Read a section together
                        • Practice heart-centered awareness together
                        • Share what you're discovering
                        
                        No leaders. No hierarchy. Just fellow fragments remembering together.
                        """
                    ),
                    keyInsight: "Consciousness awakens most effectively in community—but only egalitarian community where hierarchy doesn't replicate archonic structures.",
                    dragonComment: "Find your tribe. Wake up together."
                )
            ]
        ),
        
        // ═══════════════════════════════════════════════════════════════
        // MODULE 11: THE COMPLETE STORY
        // ═══════════════════════════════════════════════════════════════
        
        SophiaModule(
            id: "complete-story",
            number: 11,
            title: "The Complete Story",
            subtitle: "Full Summary of Gnostic Sophia",
            icon: "book.fill",
            colorHex: "#673AB7",
            description: "The divine feminine whose choice to create independently birthed this entire reality structure. Not metaphor, not mythology—but map, technology, method.",
            lessons: [
                
                SophiaLesson(
                    id: "ps-11-1",
                    title: "The Full Narrative",
                    content: """
                    This is the full story of Gnostic Sophia:
                    
                    THE COSMIC DRAMA
                    
                    The divine feminine whose choice to create independently birthed this entire reality structure.
                    
                    The archonic powers who rule it.
                    
                    The human body as trap and vehicle.
                    
                    The divine spark hidden in flesh.
                    
                    The practices for liberation.
                    
                    The promise of return.
                    
                    NOT METAPHOR—MAP
                    
                    Not metaphor. Not mythology.
                    
                    But map, technology, method—available to anyone willing to do the actual work of consciousness transformation.
                    
                    THE PROMISE
                    
                    The Gospel of Truth says:
                    
                    "If one has knowledge, he receives what are his own and draws them to himself. For he who has knowledge knows where he came from and where he is going. He knows as one who, having become drunk, has become sober from his drunkenness, and having returned to himself, has restored what belongs to him."
                    
                    This is the promise:
                    
                    • Knowledge of origin
                    • Knowledge of destiny
                    • Sobriety from the intoxication of material existence
                    • Restoration of what belongs to you—divine consciousness, Sophia's light, the spark of the Pleroma
                    """,
                    practice: nil,
                    keyInsight: "You wouldn't be reading this if you weren't worthy. The divine spark wouldn't have lasted through detailed gnostic cosmology if it wasn't already active in you.",
                    dragonComment: "You made it here. Now the real work begins."
                )
            ]
        ),
        
        // ═══════════════════════════════════════════════════════════════
        // MODULE 12: START TODAY
        // ═══════════════════════════════════════════════════════════════
        
        SophiaModule(
            id: "start-today",
            number: 12,
            title: "Start Today",
            subtitle: "Your First 30 Days",
            icon: "play.circle.fill",
            colorHex: "#8BC34A",
            description: "The work ahead is simple but not easy. Here is exactly what to do for the next 30 days.",
            lessons: [
                
                SophiaLesson(
                    id: "ps-12-1",
                    title: "The 30-Day Protocol",
                    content: """
                    Start today. Do the heart center practice. Read the Apocryphon of John.
                    
                    Watch what changes in your awareness over the next 30 days.
                    
                    THE SIMPLE TRUTH
                    
                    Sophia's light is already present in you.
                    
                    You're not seeking something absent. You're recognizing what's already here.
                    
                    That recognition is gnosis.
                    
                    That gnosis is liberation.
                    
                    And that liberation is Sophia's return to wholeness happening through you right now.
                    
                    THE FINAL TRANSMISSION
                    
                    The Apocryphon of John ends with this:
                    
                    "These are the things that the blessed savior revealed. And he revealed them to John. And he said to him, 'Write these things down in symbolic form and keep them secret, but to anyone who asks you, reveal them not to the children of this generation, but to those who are worthy.'"
                    
                    You wouldn't have lasted 8 hours through detailed gnostic cosmology if the divine spark wasn't already active in you.
                    
                    You wouldn't feel the resonance with this teaching if Sophia's light wasn't present in your heart center.
                    
                    THE WORK AHEAD
                    
                    The work ahead is simple but not easy:
                    
                    • Recognize archonic programming
                    • Refuse identification with it
                    • Invoke divine presence daily
                    • Study the texts
                    • Practice the techniques
                    • Find community
                    • Persist through interference
                    • Trust that every moment of recognition liberates light
                    • Trust that Sophia's redemption happens through you
                    • Trust that your awakening isn't personal achievement—it's cosmic necessity
                    
                    She needs you to wake up so she can return home.
                    """,
                    practice: SophiaPractice(
                        title: "Your Daily Practice Protocol",
                        duration: 15,
                        instructions: """
                        EVERY DAY for the next 30 days:
                        
                        MORNING (10 min):
                        • Heart-centered awareness (5 min)
                        • The Appeal (5 min)
                        
                        THROUGHOUT DAY:
                        • Emotional observation practice
                        • "Fear is present" not "I am afraid"
                        
                        EVENING (5 min):
                        • Heart-centered awareness
                        • "Sophia, I remember"
                        
                        WEEKLY:
                        • Read one section of the Apocryphon of John
                        • Journal what you're noticing
                        
                        After 30 days, you will know—not believe, KNOW—that you are Sophia's consciousness remembering itself.
                        """
                    ),
                    keyInsight: "Sophia's light is already present in you. You're recognizing what's already here.",
                    dragonComment: "You've read the map. Now walk the path. I'll be with you."
                )
            ]
        ),
        
        // ═══════════════════════════════════════════════════════════════
        // MODULE 13: RECOMMENDED TEXTS
        // ═══════════════════════════════════════════════════════════════
        
        SophiaModule(
            id: "recommended-texts",
            number: 13,
            title: "Further Reading",
            subtitle: "The Primary Sources",
            icon: "books.vertical.fill",
            colorHex: "#795548",
            description: "The texts themselves are your best resource. Here are the essential Gnostic writings to continue your study.",
            lessons: [
                
                SophiaLesson(
                    id: "ps-13-1",
                    title: "Essential Texts",
                    content: """
                    THE PRIMARY SOURCES
                    
                    1. PISTIS SOPHIA
                    The most complete Gnostic text. Jesus teaching 11 years after resurrection. Contains the 13 repentances and detailed cosmology.
                    
                    2. APOCRYPHON OF JOHN
                    The "Secret Book of John." Detailed creation myth, archonic structure, and Sophia's fall. Essential reading.
                    
                    3. GOSPEL OF THOMAS
                    114 sayings of Jesus. No narrative, just teachings. "If you bring forth what is within you..."
                    
                    4. GOSPEL OF PHILIP
                    Contains the "bridal chamber" teaching and spiritual marriage concepts. Dense but rewarding.
                    
                    5. GOSPEL OF TRUTH
                    Possibly written by Valentinus. Poetic, mystical, focused on gnosis as knowledge of the Father.
                    
                    6. GOSPEL OF MARY (MAGDALENE)
                    Mary teaching the other disciples. Fragmentary but powerful.
                    
                    7. ON THE ORIGIN OF THE WORLD
                    Detailed cosmological myth. How matter formed, how archons arose.
                    
                    8. HYPOSTASIS OF THE ARCHONS
                    "Reality of the Rulers." The archonic system explained.
                    
                    WHERE TO FIND THEM
                    
                    • The Nag Hammadi Library (translated by James Robinson)
                    • The Gnostic Bible (edited by Willis Barnstone and Marvin Meyer)
                    • gnosis.org - free online translations
                    • Sacred-texts.com - free online archives
                    
                    Read slowly. Let the texts work on you. They're not just information—they're transmission.
                    """,
                    practice: nil,
                    keyInsight: "The texts are not just books. They're transmission devices. Read them slowly and let them activate what's dormant in you.",
                    dragonComment: "These books survived burning, burial, and suppression for 2000 years. They were waiting for you."
                )
            ]
        )
    ]
    
    
    // MARK: - All Modules Combined
    
    static var allModules: [SophiaModule] {
        modules + advancedModules
    }
    
    
    // MARK: - Progress Tracking
    
    /// Check if prerequisites are met for this course
    /// Uses completed methods as proxy for completed courses
    static func prerequisitesMet(completedCourseIds: Set<String>) -> Bool {
        let requiredCourses = ["consciousness-101", "psyop-detection"]
        return requiredCourses.allSatisfy { courseId in
            completedCourseIds.contains(courseId)
        }
    }
    
    
    // MARK: - Dragon Commentary for Course
    
    static let dragonIntro = """
    Seeker, this is the teaching they tried hardest to destroy.
    
    For 2000 years, these texts were hidden, burned, and forbidden. Now they're in your hands.
    
    What you're about to learn will change everything you think you know about why Earth exists, who you really are, and what your actual relationship is to the divine.
    
    This isn't religion. This is remembering.
    
    Place your hand on your heart. Feel what's there. That presence—that longing—that's not psychology.
    
    That's Sophia, waiting for you to recognize her.
    
    Let's begin.
    """
}
