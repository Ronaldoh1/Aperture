// EleventhDimensionCourse.swift
// Aperture
//
// The 11th Dimension: Where You Exist Without Knowing It
// Advanced course on multi-dimensional consciousness and M-theory

import Foundation
import SwiftUI


// MARK: - Course Structure

struct EleventhDimensionCourse {
    
    static let courseInfo = CourseInfo(
        id: "eleventh-dimension",
        title: "The 11th Dimension",
        subtitle: "Where You Exist Without Knowing It",
        icon: "cube.transparent.fill",
        colorHex: "#7C4DFF",
        moduleCount: 10,
        estimatedHours: 6,
        category: .consciousness,
        difficulty: .advanced
    )
    
    
    // MARK: - Modules
    
    static let modules: [DimensionModule] = [
        
        // ═══════════════════════════════════════════════════════════════
        // MODULE 1: THE INCOMPLETENESS OF YOU
        // ═══════════════════════════════════════════════════════════════
        
        DimensionModule(
            id: "incompleteness",
            number: 1,
            title: "The Incompleteness of You",
            subtitle: "Why You're Not Fully Here",
            icon: "person.crop.circle.badge.questionmark",
            colorHex: "#7C4DFF",
            description: "Right now as you read this, you might not be completely here. Modern physics suggests our universe operates across 11 dimensions—yet you only experience four.",
            lessons: [
                
                DimensionLesson(
                    id: "11d-1-1",
                    title: "The Paper Character",
                    content: """
                    Right now, you might not be completely here.
                    
                    I know that sounds unsettling, but consider this:
                    
                    Modern physics suggests our universe operates across 11 dimensions. Yet you only experience four.
                    
                    If reality has 11 layers and you're moving through just four of them, what does that say about the completeness of your existence?
                    
                    THE FLATLAND ANALOGY
                    
                    Think of a character drawn on paper. They experience length and width but remain oblivious to the air surrounding them—the third dimension that shapes their entire reality.
                    
                    You might be that character.
                    
                    Embedded in a higher dimensional space you can't perceive.
                    
                    THE MATHEMATICAL NECESSITY
                    
                    Edward Witten's M-theory didn't emerge from mystical speculation. It arose from mathematical necessity.
                    
                    The equations DEMANDED 11 dimensions for our universe to function coherently.
                    
                    This means parts of you—aspects of your consciousness and identity—could extend into realms beyond your biological awareness.
                    """,
                    practice: DimensionPractice(
                        title: "Sensing the Incomplete",
                        duration: 5,
                        instructions: """
                        Sit quietly and consider:
                        
                        Have you ever felt like there's more to you than what you can access?
                        
                        Like you're a vast being looking through a tiny keyhole?
                        
                        That feeling isn't imagination. It might be accurate perception of your multi-dimensional nature.
                        
                        For 5 minutes, simply sit with this possibility without analyzing it.
                        """
                    ),
                    keyInsight: "If consciousness emerges from fundamentally 11-dimensional processes, asking whether your awareness touches those hidden dimensions isn't mysticism—it's a legitimate scientific question.",
                    dragonComment: "You've always sensed you're more than this body. Physics is finally catching up to what you already knew."
                ),
                
                DimensionLesson(
                    id: "11d-1-2",
                    title: "The 1995 Revolution",
                    content: """
                    In 1995, Edward Witten stood before a room of the world's most brilliant physicists and dropped what many consider the most revolutionary bombshell in modern theoretical physics.
                    
                    He announced that all five competing versions of string theory were actually the SAME theory viewed from different angles.
                    
                    But here's the kicker:
                    
                    To make this unification work mathematically, reality couldn't just have the four dimensions we experience.
                    
                    It needed 11.
                    
                    M-THEORY
                    
                    This wasn't wild speculation. This was M-theory—a mathematical framework so elegant and necessary that it emerged from the equations themselves.
                    
                    The math DEMANDED extra dimensions whether we could perceive them or not.
                    
                    And what M-theory revealed about your existence is staggering:
                    
                    Right now, you're not sitting in empty space surrounded by solid objects. According to M-theory, you're embedded in a three-dimensional membrane—what physicists call a "brane"—that's floating through a vast higher dimensional space called "the bulk."
                    """,
                    practice: nil,
                    keyInsight: "11 dimensions aren't an option in M-theory—they're a requirement. The math simply doesn't work with fewer dimensions.",
                    dragonComment: "When the equations demand 11 dimensions, maybe it's time to update our understanding of what 'reality' means."
                ),
                
                DimensionLesson(
                    id: "11d-1-3",
                    title: "The Hidden Dimensions",
                    content: """
                    Where are these extra dimensions hiding?
                    
                    The answer lies in something called COMPACTIFICATION.
                    
                    THE GARDEN HOSE
                    
                    Picture a garden hose viewed from far away. It looks like a one-dimensional line.
                    
                    But get closer and you realize it has width and depth wrapped around that line. Those dimensions were always there—they were just curled up so tightly you couldn't see them from a distance.
                    
                    The same thing happens with space itself.
                    
                    DIMENSIONS EVERYWHERE
                    
                    At every point around you—in the air you breathe, in your body, in the screen you're looking at—six additional spatial dimensions are folded and twisted into structures so incredibly small they make atoms look like solar systems.
                    
                    These aren't empty dimensions either.
                    
                    They're filled with vibrating strings. And HOW these strings vibrate in these hidden spaces determines everything about the particles and forces we experience in our three-dimensional world.
                    
                    YOUR NEURONS ARE 11-DIMENSIONAL
                    
                    Every thought you have, every memory you form, every decision you make happens through electrochemical processes that ultimately involve the fundamental particles and forces described by string theory.
                    
                    These processes occur in a reality where six extra dimensions are intimately woven into every point of space.
                    
                    Your neurons fire through interactions that are fundamentally 11-dimensional—even though your conscious experience feels three-dimensional.
                    """,
                    practice: DimensionPractice(
                        title: "Sensing Hidden Space",
                        duration: 3,
                        instructions: """
                        Look at the space in front of you.
                        
                        Now consider: at every point in that space, six additional dimensions are curled up so small you can't see them.
                        
                        Your hand passes through these hidden dimensions constantly.
                        
                        Your brain processes information through them.
                        
                        For 3 minutes, simply hold this awareness while looking at ordinary space.
                        """
                    ),
                    keyInsight: "The part of you that feels incomplete, that senses there's more to existence than what you can directly experience, might be a dim recognition that your consciousness is somehow aware of its own dimensional confinement.",
                    dragonComment: "Your body is 11-dimensional. Your mind emerged from 11-dimensional processes. Why would consciousness be limited to 4?"
                )
            ]
        ),
        
        // ═══════════════════════════════════════════════════════════════
        // MODULE 2: BRANES AND THE BULK
        // ═══════════════════════════════════════════════════════════════
        
        DimensionModule(
            id: "branes-bulk",
            number: 2,
            title: "Branes and the Bulk",
            subtitle: "The Membrane You Call Reality",
            icon: "square.stack.3d.up.fill",
            colorHex: "#536DFE",
            description: "You're not sitting in empty space. You're embedded in a three-dimensional membrane floating through higher dimensional space. And you're not alone.",
            lessons: [
                
                DimensionLesson(
                    id: "11d-2-1",
                    title: "Your Universe Is a Membrane",
                    content: """
                    M-theory suggests that our entire universe might be a membrane—a "brane"—floating in 11-dimensional space.
                    
                    THE PAPER ANALOGY EXPANDED
                    
                    Imagine you're a character drawn on a piece of paper. You can move forward, backward, left, and right across the surface—but you can't step off the page.
                    
                    That's essentially your situation.
                    
                    Except your "page" is a three-dimensional sheet floating in an 11-dimensional reality.
                    
                    THE BULK
                    
                    The higher dimensional space that contains all these branes is called "the bulk."
                    
                    Our entire observable universe—every galaxy, every star, every atom—exists on the surface of our brane, floating through this vast bulk space.
                    
                    YOU CAN'T LEAVE
                    
                    The particles that make up your body are confined to this brane. Light travels along the brane. The forces that hold you together operate on the brane.
                    
                    You're stuck here—not because there's nothing else, but because the physics of your existence keeps you on this particular membrane.
                    """,
                    practice: nil,
                    keyInsight: "Our entire universe might be the surface of a membrane floating in higher dimensional space—and we're permanently confined to that surface.",
                    dragonComment: "The universe isn't everything. It's just our neighborhood in a much bigger reality."
                ),
                
                DimensionLesson(
                    id: "11d-2-2",
                    title: "Parallel Universes Next Door",
                    content: """
                    Here's where it gets really wild:
                    
                    Your brane—this three-dimensional membrane you call reality—isn't alone.
                    
                    INFINITE PAGES
                    
                    M-theory suggests that countless other branes float through this higher dimensional bulk, stacked like pages in an infinite book.
                    
                    Some of these branes might contain entire universes with their own physics, their own matter, their own versions of life.
                    
                    And they could be literally MICROMETERS away from you.
                    
                    Separated only by directions your senses cannot detect.
                    
                    THE INVISIBLE NEIGHBORS
                    
                    Imagine standing in a room and knowing that just a fraction of an inch away—in a direction that doesn't exist for you—entire civilizations might be thriving on their own membrane.
                    
                    You can't reach them. You can't see them. You can't interact with them.
                    
                    Because you're confined to your brane like that character drawn on paper.
                    
                    But they're there—as real as you are—living their lives in parallel realities, separated by the thinnest of higher dimensional gaps.
                    
                    THE BIG BANG COLLISION
                    
                    These branes aren't static. They can move, collide, and create ripples through the bulk that manifest as gravitational waves in our dimension.
                    
                    Some versions of M-theory suggest that what we call the Big Bang wasn't the beginning of everything—it was the result of two branes crashing together in higher dimensional space.
                    
                    Creating the explosion of matter and energy that formed our observable universe.
                    """,
                    practice: DimensionPractice(
                        title: "The Invisible Direction",
                        duration: 3,
                        instructions: """
                        Hold your hand in front of your face.
                        
                        Now consider: a fraction of an inch from your hand—in a direction you cannot point to or imagine—another entire universe might exist.
                        
                        Not far away in space. RIGHT HERE. But in a direction that doesn't exist for your senses.
                        
                        Sit with this for 3 minutes. Don't try to visualize it. Just hold the concept.
                        """
                    ),
                    keyInsight: "Other universes could be micrometers away from you right now—separated only by directions your senses cannot detect.",
                    dragonComment: "The multiverse isn't science fiction. It's what happens when you take the math seriously."
                ),
                
                DimensionLesson(
                    id: "11d-2-3",
                    title: "Consciousness Across Branes",
                    content: """
                    This raises profound questions about the nature of your existence.
                    
                    THE INCOMPLETE SELF
                    
                    When we explored earlier how you might not be complete in this reality, we were touching on something M-theory makes mathematically explicit.
                    
                    If consciousness emerges from the complex patterns of information processing in your brain...
                    
                    And if those patterns exist in a reality that's fundamentally 11-dimensional...
                    
                    Then asking whether your awareness somehow touches those hidden dimensions isn't mysticism.
                    
                    It's a legitimate scientific question.
                    
                    EVOLUTION'S LIMITATIONS
                    
                    You don't experience the 11th dimension not because it isn't real, but because your senses evolved to navigate survival on a three-dimensional brane.
                    
                    Your eyes detect electromagnetic radiation in a narrow frequency range because that's what helped your ancestors find food and avoid predators.
                    
                    Your sense of space developed to help you move through three dimensions because that's where the evolutionary game was played.
                    
                    But evolution is a LOCAL phenomenon.
                    
                    It optimized you for success on your particular brane, in your specific dimensional slice of reality.
                    
                    It never needed to give you access to the full scope of existence because the full scope of existence wasn't necessary for survival and reproduction.
                    
                    THE RECOGNITION
                    
                    This suggests something remarkable:
                    
                    The part of you that feels incomplete, that senses there's more to existence than what you can directly experience—might not be psychological yearning or spiritual longing.
                    
                    It might be a dim recognition that your consciousness, emerging from fundamentally 11-dimensional processes, is somehow aware of its own dimensional confinement.
                    """,
                    practice: nil,
                    keyInsight: "The mathematics of M-theory forces us to confront the possibility that what you call 'you' might be like the tip of an iceberg—with vast portions of your existence extending into dimensions you cannot perceive.",
                    dragonComment: "Evolution built you to survive on this brane. It didn't build you to perceive reality. Those are different problems."
                )
            ]
        ),
        
        // ═══════════════════════════════════════════════════════════════
        // MODULE 3: JUNG AND THE MULTI-DIMENSIONAL SELF
        // ═══════════════════════════════════════════════════════════════
        
        DimensionModule(
            id: "jung-self",
            number: 3,
            title: "The Multi-Dimensional Self",
            subtitle: "Jung, Vedanta, and Ancient Wisdom",
            icon: "person.2.circle.fill",
            colorHex: "#448AFF",
            description: "What you call 'you'—that voice in your head, your personality, your memories—might be just the tip of an iceberg so vast that most of it exists completely outside your awareness.",
            lessons: [
                
                DimensionLesson(
                    id: "11d-3-1",
                    title: "Jung's Discovery",
                    content: """
                    Carl Jung spent decades studying the human psyche.
                    
                    What he discovered was revolutionary:
                    
                    He realized that what we think of as our "self"—our ego, our conscious mind—is actually just a small fraction of who we really are.
                    
                    THE SELF WITH A CAPITAL S
                    
                    Jung called the totality of our being "the Self" with a capital S. And it's radically different from what you might expect.
                    
                    Think about your dreams for a moment.
                    
                    In dreams, you're often someone slightly different—maybe braver, maybe more fearful, sometimes even a completely different person entirely.
                    
                    Jung realized these weren't just random neural firings. They were glimpses of OTHER ASPECTS of yourself—parts of you that exist but don't fit into your waking personality.
                    
                    THE SHADOW
                    
                    He called some of these aspects "the shadow"—not evil, but simply the parts of yourself that your conscious mind has rejected or never acknowledged.
                    
                    THE COLLECTIVE UNCONSCIOUS
                    
                    Jung went even further. He proposed that this deeper Self extends beyond individual psychology, connecting to what he called the "collective unconscious"—a shared field of meaning and experience that links all human consciousness.
                    
                    In his later work, Jung suggested that the Self might even transcend time itself—connecting different moments, identities, and according to his studies of Eastern philosophy, even different lifetimes as expressions of a single underlying pattern.
                    """,
                    practice: DimensionPractice(
                        title: "Meeting Your Shadow",
                        duration: 5,
                        instructions: """
                        Think about a quality in others that really irritates you.
                        
                        Not something harmful—just something that bothers you disproportionately.
                        
                        Jung would say this is your shadow—a rejected part of yourself that you see reflected in others.
                        
                        For 5 minutes, consider: what if this quality exists in you too, just unacknowledged?
                        
                        What would it mean to integrate it rather than reject it?
                        """
                    ),
                    keyInsight: "What you think of as your 'self' is just a small fraction of who you really are—the tip of an iceberg that extends far beyond your conscious awareness.",
                    dragonComment: "Your personality isn't you. It's a mask you forgot you were wearing."
                ),
                
                DimensionLesson(
                    id: "11d-3-2",
                    title: "The Vedantic View",
                    content: """
                    Jung was drawing from traditions that had mapped consciousness for thousands of years.
                    
                    ATMAN - THE TRUE SELF
                    
                    In Vedantic philosophy from ancient India, there's a concept called "Atman"—often translated as "the true self."
                    
                    But Atman isn't your individual soul or personality.
                    
                    It's the infinite consciousness that APPEARS to be individual but is actually universal—like sunlight streaming through different windows. Each window seems to contain its own light, but it's all the same sun.
                    
                    THE OCEAN AND THE WAVES
                    
                    The Vedantic sages described this with a startling metaphor:
                    
                    Imagine consciousness as an ocean and individual awareness as waves.
                    
                    From the wave's perspective, it seems separate, unique, with its own beginning and end.
                    
                    But from a deeper view, every wave is just the ocean expressing itself in temporary form.
                    
                    Your individual consciousness, according to this view, is INFINITY experiencing itself as you.
                    
                    GNOSTIC SCATTERING
                    
                    The Gnostic traditions of early Christianity had their own way of understanding this multi-dimensional nature of consciousness.
                    
                    They taught that the soul becomes scattered across different dimensions and densities of reality—like white light passing through a prism and separating into different colors.
                    
                    Each color, each dimension, contains a fragment of your complete being. But most of these fragments remain invisible to ordinary awareness.
                    """,
                    practice: nil,
                    keyInsight: "Ancient wisdom traditions and cutting-edge theoretical physics keep arriving at strikingly similar conclusions about consciousness transcending our perceived limitations.",
                    dragonComment: "The mystics mapped this territory thousands of years ago. Physics is just drawing better maps of the same landscape."
                ),
                
                DimensionLesson(
                    id: "11d-3-3",
                    title: "Multiple Bodies",
                    content: """
                    Theosophy, which emerged in the 19th century, attempted to map these different layers systematically.
                    
                    THE SEVEN BODIES
                    
                    They described human beings as having multiple bodies:
                    
                    • Physical body
                    • Etheric body
                    • Astral body
                    • Mental body
                    • Causal body
                    • Buddhic body
                    • Atmic body
                    
                    Each existing at different frequencies of reality.
                    
                    According to this model, your physical body is just the densest expression of a consciousness that extends through multiple dimensions simultaneously.
                    
                    MODERN PARALLELS
                    
                    Now, you might think this sounds like mystical speculation.
                    
                    But consider your own experience:
                    
                    • Have you ever had a dream that felt more real than waking life?
                    • A moment where you seem to remember something that never happened in your current life?
                    • An intuition about someone that proved accurate even though you had no logical reason to know it?
                    
                    THE HOLONOMIC BRAIN
                    
                    Modern neuroscience is beginning to provide frameworks that align surprisingly well with these ancient insights.
                    
                    Karl Pribram's holonomic brain model suggests that memory and perception work holographically—meaning that each part of the brain contains information about the whole, just like each fragment of a holographic plate can reconstruct the entire image.
                    
                    But here's where it gets really interesting:
                    
                    What if the brain doesn't GENERATE consciousness at all?
                    
                    What if it's more like a radio receiver—tuning into signals that already exist in a field of consciousness?
                    """,
                    practice: DimensionPractice(
                        title: "Sensing Your Layers",
                        duration: 5,
                        instructions: """
                        Sit quietly and bring attention to your physical body.
                        
                        Now expand awareness slightly—can you sense an energetic field around your body? A sense of presence that extends beyond your skin?
                        
                        This isn't imagination. It's the beginning of perceiving your non-physical layers.
                        
                        Don't force anything. Just notice what's already there.
                        """
                    ),
                    keyInsight: "If consciousness exists as a field—like an electromagnetic field—then your individual awareness might be just one receiver among many. Other aspects of yourself could be tuned to completely different frequencies.",
                    dragonComment: "Your brain might be less like a computer and more like a radio. The signal exists whether the radio is on or not."
                )
            ]
        ),
        
        // ═══════════════════════════════════════════════════════════════
        // MODULE 4: CONSCIOUSNESS AS A FIELD
        // ═══════════════════════════════════════════════════════════════
        
        DimensionModule(
            id: "consciousness-field",
            number: 4,
            title: "Consciousness as a Field",
            subtitle: "The Receiver Theory",
            icon: "antenna.radiowaves.left.and.right",
            colorHex: "#40C4FF",
            description: "What if your brain isn't creating your consciousness at all? What if it's simply receiving it—like a radio tuning into a signal that was already there?",
            lessons: [
                
                DimensionLesson(
                    id: "11d-4-1",
                    title: "The Receiver Model",
                    content: """
                    Here's something that might fundamentally shift how you think about your own existence:
                    
                    What if your brain isn't CREATING your consciousness at all?
                    
                    What if it's simply RECEIVING it—like a radio tuning into a signal that was already there?
                    
                    DAVID BOHM'S IMPLICATE ORDER
                    
                    David Bohm, the quantum physicist who worked alongside Einstein, proposed that everything we see and measure—what he called the "explicate order"—is just the surface layer of something far more fundamental.
                    
                    Beneath this visible world lies what he termed the "implicate order"—a dimension where everything is folded together, where separation dissolves, and the entire universe exists as an undivided wholeness.
                    
                    THE PIANO ANALOGY
                    
                    In Bohm's model, consciousness doesn't emerge from complex arrangements of matter.
                    
                    Instead, consciousness EXPRESSES through matter.
                    
                    The brain doesn't generate awareness any more than a piano generates music. It's an instrument through which something deeper plays itself into existence.
                    
                    This completely reverses our understanding of the mind-brain relationship.
                    
                    Instead of consciousness being this miraculous accident that somehow emerges when neurons reach sufficient complexity, consciousness becomes a FUNDAMENTAL ASPECT of reality itself—as basic as space, time, or energy.
                    """,
                    practice: nil,
                    keyInsight: "The brain might not generate consciousness but rather receive and focus it—like an instrument through which something deeper expresses itself.",
                    dragonComment: "What if consciousness is the default state of reality, and matter is the exception?"
                ),
                
                DimensionLesson(
                    id: "11d-4-2",
                    title: "Panpsychism: Consciousness Everywhere",
                    content: """
                    This connects to what philosophers call PANPSYCHISM.
                    
                    NOT WHAT YOU THINK
                    
                    Before you dismiss it as the idea that rocks have feelings, let me explain what thinkers like Philip Goff are actually proposing.
                    
                    They're NOT suggesting that electrons have emotions or that stones contemplate existence.
                    
                    Rather, they're arguing that if consciousness is real and irreducible to purely physical processes, then it must be woven into nature's fabric from the ground up.
                    
                    THE PIXEL ANALOGY
                    
                    Think of it like pixels on a screen.
                    
                    Individual pixels don't display complex images. But when organized in specific patterns, under the right conditions, they create rich, detailed pictures.
                    
                    Similarly, matter itself might carry the POTENTIAL for experience—basic units of consciousness that, under specific organizational conditions (like those found in brains), light up into the complex awareness we recognize as human experience.
                    
                    THE BRAIN AS LENS
                    
                    This radically reframes what your brain actually does.
                    
                    Instead of being a consciousness generator, it becomes more like a sophisticated:
                    
                    • Receiver
                    • Lens
                    • Tuning instrument
                    
                    Something that focuses and channels specific bandwidths of a consciousness field that extends far beyond your skull.
                    """,
                    practice: DimensionPractice(
                        title: "The Field Experiment",
                        duration: 5,
                        instructions: """
                        Close your eyes and notice your awareness.
                        
                        Now consider: what if this awareness isn't being produced by your brain, but received by it?
                        
                        What if you're tuning into a field of consciousness that exists independently of your body?
                        
                        Notice if this shift in perspective changes how awareness feels.
                        
                        Sit with this for 5 minutes without analyzing.
                        """
                    ),
                    keyInsight: "Consciousness might be fundamental to reality—not something that emerges from complexity but something that complexity allows to express itself.",
                    dragonComment: "Maybe consciousness isn't the mystery. Maybe matter is."
                ),
                
                DimensionLesson(
                    id: "11d-4-3",
                    title: "Near-Death Evidence",
                    content: """
                    And here's where the evidence gets genuinely intriguing.
                    
                    NDE RESEARCH
                    
                    Consider the thousands of documented near-death experiences where people report detailed perceptions from outside their bodies.
                    
                    Patients describe:
                    • Seeing their own surgery from the ceiling
                    • Overhearing conversations in adjacent rooms
                    • Providing specific details about events that occurred while they were clinically unconscious
                    
                    Details later verified by medical staff who had no prior contact with these individuals.
                    
                    PAM REYNOLDS CASE
                    
                    Pam Reynolds, a musician who underwent brain surgery for a life-threatening aneurysm, had her body temperature lowered to 60°F. Her heart stopped. All electrical activity in her brain ceased.
                    
                    Yet she later described in precise detail:
                    • The surgical instruments used
                    • Conversations between surgeons
                    • Even the music playing in the operating room
                    
                    All while her brain showed NO measurable activity.
                    
                    IMPLICATIONS
                    
                    These experiences don't necessarily prove life after death.
                    
                    But they do something equally profound:
                    
                    They challenge our fundamental assumption that consciousness dies with the brain.
                    
                    If awareness can exist and perceive when the brain is offline, then consciousness clearly operates by different rules than we've assumed.
                    """,
                    practice: nil,
                    keyInsight: "If awareness can exist when the brain shows no measurable activity, consciousness must operate by different rules than neuroscience assumes.",
                    dragonComment: "Thousands of people have seen their surgeries from the ceiling. At some point, we have to take this seriously."
                )
            ]
        ),
        
        // ═══════════════════════════════════════════════════════════════
        // MODULE 5: DIMENSIONAL BLEEDING
        // ═══════════════════════════════════════════════════════════════
        
        DimensionModule(
            id: "dimensional-bleeding",
            number: 5,
            title: "Dimensional Bleeding",
            subtitle: "When Other Aspects Break Through",
            icon: "waveform.path.ecg.rectangle",
            colorHex: "#00BCD4",
            description: "Have you ever woken from a dream feeling like you lived an entire lifetime? Those experiences might be glimpses of the greater self that never fragmented.",
            lessons: [
                
                DimensionLesson(
                    id: "11d-5-1",
                    title: "Dreams as Dimensional Access",
                    content: """
                    Have you ever woken up from a dream feeling like you just lived an entire lifetime?
                    
                    Not the fleeting, fragmented dreams we usually dismiss, but those rare experiences where you inhabited a completely different existence—complete with relationships, memories, and emotional depths that felt more authentic than your actual life.
                    
                    DREAMS WHERE YOU KNEW
                    
                    I'm talking about dreams where you knew people you'd never met, navigated cities that don't exist on any map—yet every detail felt saturated with meaning and familiarity.
                    
                    These aren't just random neural firings during REM sleep.
                    
                    Something far more profound is happening.
                    
                    DIMENSIONAL BLEEDING
                    
                    When Jung wrote about the deeper Self communicating through symbols and dreams, and when modern field theories suggest consciousness operates independently of neural activity, we're looking at the same phenomenon from different angles.
                    
                    These profound dreams might represent moments where your consciousness briefly aligns with experiences existing in parallel streams of reality.
                    
                    What feels like imagination might be perception of actual dimensions you normally can't access.
                    """,
                    practice: DimensionPractice(
                        title: "Dream Recognition",
                        duration: 0,
                        instructions: """
                        Tonight before sleep, set an intention:
                        
                        "I am open to experiencing dimensions beyond my normal awareness."
                        
                        Keep a notebook by your bed. Immediately upon waking, write down any dreams—especially ones that felt unusually vivid or meaningful.
                        
                        Pay special attention to:
                        • People you "knew" but never met
                        • Places that felt familiar but don't exist
                        • Knowledge you had that you don't have in waking life
                        
                        These might be glimpses of your multi-dimensional self.
                        """
                    ),
                    keyInsight: "Profound dreams might not be imagination—they might be moments when your consciousness accesses experiences from parallel streams of reality.",
                    dragonComment: "Some dreams aren't dreams. They're memories from dimensions you visited."
                ),
                
                DimensionLesson(
                    id: "11d-5-2",
                    title: "Children Who Remember",
                    content: """
                    Children around the world regularly describe places they've never visited with startling accuracy.
                    
                    DOCUMENTED CASES
                    
                    A six-year-old in Ohio draws detailed maps of a village in rural Ireland—complete with the correct placement of a stone bridge that was demolished decades before their birth.
                    
                    A child in Japan speaks fluent Portuguese for 3 months, then suddenly stops with no memory of ever knowing the language.
                    
                    These cases fill the files of consciousness researchers.
                    
                    THE STEVENSON RESEARCH
                    
                    Dr. Ian Stevenson documented over 3,000 such cases during his career at the University of Virginia, focusing specifically on children who retained what appeared to be memories from other lives.
                    
                    But here's what's fascinating:
                    
                    When researchers dig deeper, many of these experiences don't fit the traditional reincarnation model either.
                    
                    Instead, they suggest something more like DIMENSIONAL BLEEDING—moments where a child's consciousness briefly aligns with experiences existing in parallel streams of reality.
                    
                    NOT PAST LIVES—PARALLEL SELVES
                    
                    The traditional reincarnation model assumes linear time: you were this person, then you died, then you became this new person.
                    
                    But what if time isn't linear at higher dimensions?
                    
                    What if all "past lives" are actually parallel selves existing simultaneously, and children sometimes pick up the signal from another frequency?
                    """,
                    practice: nil,
                    keyInsight: "Children's 'past life' memories might not be about previous incarnations—they might be dimensional bleeding from parallel selves existing simultaneously.",
                    dragonComment: "Children haven't learned yet that reality is supposed to be limited. They still receive all the channels."
                ),
                
                DimensionLesson(
                    id: "11d-5-3",
                    title: "Everyday Glimpses",
                    content: """
                    Think about moments when the boundaries of your normal awareness seem to loosen:
                    
                    MEDITATION EXPANSION
                    
                    In deep meditation, you might experience a sense of expansion that feels more fundamental than your everyday identity.
                    
                    In moments of profound silence, some people report a KNOWING that seems to come from beyond their individual mind.
                    
                    Sometimes in crisis or extreme beauty, there's a sudden recognition—not a thought, but a direct knowing—that you are far more than you normally experience yourself to be.
                    
                    THESE AREN'T GLITCHES
                    
                    These aren't glitches in consciousness. They're BLEED-THROUGHS.
                    
                    Moments when the membrane between different layers of your being becomes permeable.
                    
                    Remember from our earlier discussion how M-theory suggests we live on a floating membrane in higher dimensional space.
                    
                    What if your consciousness works the same way?
                    
                    With most of your being existing in dimensions that only occasionally bleed through into your ordinary awareness.
                    
                    REFRAMING STRANGE EXPERIENCES
                    
                    This has profound implications for those strange experiences that everyone has but rarely talks about:
                    
                    • DÉJÀ VU might not be a neural misfire, but a moment when your current awareness briefly synchronizes with another aspect of yourself that has already experienced this moment.
                    
                    • PRECOGNITIVE DREAMS might be glimpses from a part of your consciousness that exists outside linear time.
                    
                    • That UNCANNY SENSE OF KNOWING someone instantly might be recognition between aspects of consciousness that are already connected at levels beyond individual identity.
                    """,
                    practice: DimensionPractice(
                        title: "Tracking Bleed-Throughs",
                        duration: 0,
                        instructions: """
                        For the next week, keep track of:
                        
                        • Déjà vu experiences
                        • Moments of inexplicable knowing
                        • Dreams that felt prophetic
                        • Instant recognition of strangers
                        • Intuitions that proved accurate
                        
                        Don't analyze them yet. Just record them.
                        
                        These might be glimpses of the vast multi-dimensional being that you actually are—most of which exists in realms you haven't learned to perceive yet.
                        """
                    ),
                    keyInsight: "Strange experiences like déjà vu, precognition, and instant recognition might be moments when your higher-dimensional self bleeds through into ordinary awareness.",
                    dragonComment: "Those 'weird' experiences aren't errors in consciousness. They're features."
                )
            ]
        ),
        
        // ═══════════════════════════════════════════════════════════════
        // MODULE 6: IMPOSSIBLE KNOWING
        // ═══════════════════════════════════════════════════════════════
        
        DimensionModule(
            id: "impossible-knowing",
            number: 6,
            title: "Impossible Knowing",
            subtitle: "When Information Travels Beyond Time",
            icon: "brain.head.profile",
            colorHex: "#009688",
            description: "In 1994, a psychology professor conducted experiments that should have been impossible. Participants responded to stimuli that hadn't been chosen yet.",
            lessons: [
                
                DimensionLesson(
                    id: "11d-6-1",
                    title: "The Bem Experiments",
                    content: """
                    In 1994, a psychology professor at Cornell University named Daryl Bem conducted an experiment that should have been impossible.
                    
                    THE SETUP
                    
                    He showed participants erotic images on a computer screen, measuring their physiological responses—heart rate, skin conductance, pupil dilation.
                    
                    Nothing unusual there.
                    
                    EXCEPT:
                    
                    The computer didn't select which images to show until AFTER it had already recorded their arousal responses.
                    
                    The participants were literally responding to stimuli that hadn't been chosen yet.
                    
                    THE RESULTS
                    
                    When Bem published these results in 2011, the scientific community erupted.
                    
                    Not because his methodology was flawed—it was rigorous.
                    Not because his statistics were wrong—they showed odds of 74 billion to one against chance.
                    
                    The uproar came because his results suggested something that challenges our most basic assumptions about time, causality, and the nature of consciousness itself.
                    
                    REPLICATIONS
                    
                    Bem's experiments have now been replicated in laboratories across three continents:
                    
                    • At Northwestern University, researchers found that people's brains showed activity patterns that correlated with future events they couldn't possibly know about.
                    
                    • In Amsterdam, scientists discovered that participants could unconsciously distinguish between future positive and negative images before those images were randomly selected.
                    
                    Each study used increasingly sophisticated controls to eliminate any possible conventional explanation.
                    """,
                    practice: nil,
                    keyInsight: "Rigorous laboratory experiments show people responding to stimuli before those stimuli are even selected—suggesting consciousness operates outside linear time.",
                    dragonComment: "74 billion to one against chance. At some point, the universe is trying to tell us something."
                ),
                
                DimensionLesson(
                    id: "11d-6-2",
                    title: "Remote Viewing Research",
                    content: """
                    Consider remote viewing—the ability to perceive distant locations without any conventional sensory input.
                    
                    THE CIA RESEARCH
                    
                    For over two decades, Stanford Research Institute conducted classified research for the CIA, documenting cases where individuals provided startlingly accurate details about locations they'd never visited and had no possible way of knowing about.
                    
                    THE SOVIET SUBMARINE
                    
                    In one famous session, a remote viewer described a Soviet naval facility in unprecedented detail—including the presence of a massive submarine with an unusual hull design.
                    
                    Satellite imagery later confirmed not just the accuracy of the description, but revealed a new class of nuclear submarine that Western intelligence hadn't known existed.
                    
                    STATISTICAL PROOF
                    
                    The researcher Russell Targ, who led many of these studies, documented hundreds of sessions where participants drew detailed sketches of target locations chosen randomly from sealed envelopes.
                    
                    Statistical analysis showed results that were millions to one against chance.
                    
                    When skeptics argued that subtle sensory cues might explain the results, researchers conducted sessions where the target locations weren't even chosen until AFTER the remote viewing session was complete.
                    
                    The accuracy rates remained unchanged.
                    """,
                    practice: DimensionPractice(
                        title: "Simple Remote Viewing",
                        duration: 10,
                        instructions: """
                        Have a friend hide an object somewhere in their home without telling you anything about it.
                        
                        Sit quietly, close your eyes, and set the intention to perceive the object.
                        
                        Without trying to think or analyze, notice what impressions arise:
                        • Colors
                        • Shapes
                        • Textures
                        • Feelings
                        
                        Sketch whatever comes to mind, no matter how vague.
                        
                        Then have your friend reveal the object and location.
                        
                        You may be surprised how accurate your impressions were.
                        """
                    ),
                    keyInsight: "Decades of rigorous research shows people can perceive distant locations with accuracy that defies conventional explanation.",
                    dragonComment: "The CIA spent 20 years researching this. They weren't wasting money on fantasy."
                ),
                
                DimensionLesson(
                    id: "11d-6-3",
                    title: "The Global Consciousness Project",
                    content: """
                    The Global Consciousness Project, run by Princeton University's engineering department, has been monitoring a remarkable possibility since 1998.
                    
                    THE SETUP
                    
                    They maintain a network of random number generators around the world—devices that should produce completely unpredictable sequences of ones and zeros.
                    
                    THE FINDINGS
                    
                    But during major global events, the random generators worldwide begin showing subtle but statistically significant PATTERNS—as if some kind of field effect were influencing physical processes across the planet.
                    
                    SEPTEMBER 11, 2001
                    
                    The morning of September 11th, 2001, the global network began showing unusual coherence patterns SEVERAL HOURS before the first plane hit the World Trade Center.
                    
                    During the exact minutes of the attacks, the deviation from randomness reached levels that occur by chance less than once in a million trials.
                    
                    Similar patterns emerged during other events that captured worldwide attention—suggesting that collective human consciousness might create measurable effects in physical systems.
                    
                    DIMENSIONAL IMPLICATIONS
                    
                    This connects directly to the 11-dimensional framework:
                    
                    If consciousness operates across multiple dimensions simultaneously, then what we call precognition, remote viewing, or intuitive knowing might simply reflect the NATURAL STATE of awareness when it's not constrained by three-dimensional limitations.
                    
                    Higher dimensional aspects of consciousness could potentially access information from multiple temporal coordinates simultaneously—like viewing a river from above rather than from ground level.
                    """,
                    practice: nil,
                    keyInsight: "Random number generators worldwide show measurable patterns during major global events—suggesting consciousness creates physical effects across the planet.",
                    dragonComment: "The universe isn't random. It's responsive. We just forgot how to read it."
                )
            ]
        ),
        
        // ═══════════════════════════════════════════════════════════════
        // MODULE 7: THE WATCHER WITHIN
        // ═══════════════════════════════════════════════════════════════
        
        DimensionModule(
            id: "watcher-within",
            number: 7,
            title: "The Watcher Within",
            subtitle: "Your Higher Dimensional Presence",
            icon: "eye.circle.fill",
            colorHex: "#4CAF50",
            description: "There's something extraordinary happening inside your awareness right now. Part of you is simultaneously watching yourself think. This observer might be your actual self—existing in higher dimensional space.",
            lessons: [
                
                DimensionLesson(
                    id: "11d-7-1",
                    title: "The Observer",
                    content: """
                    There's something extraordinary happening inside your awareness right now that you've probably never fully examined.
                    
                    As you read these words, part of you is simultaneously WATCHING yourself read them.
                    
                    There's an observer present—a witness to your own mental activity—that remains mysteriously separate from the thoughts it observes.
                    
                    DIRECT VERIFICATION
                    
                    This isn't philosophical speculation. It's direct experience you can verify immediately:
                    
                    Notice how you can catch yourself thinking.
                    
                    How you can step back and observe your own reactions to ideas.
                    
                    When you're angry, something in you recognizes "I am angry" without being consumed by the anger itself.
                    
                    When you're lost in worry, a part of you can suddenly notice "I'm worrying" and create space around the anxious thoughts.
                    
                    THE CAPITAL-S SELF
                    
                    Carl Jung called this "the Self" with a capital S—distinct from the everyday personality or ego.
                    
                    Modern neuroscience has begun mapping what they call "metacognitive awareness"—consciousness observing its own processes.
                    
                    But what neither fully explains is:
                    
                    How this observer can sometimes seem to know things your ordinary mind doesn't, or why it occasionally feels like it's operating from a completely different dimensional perspective.
                    """,
                    practice: DimensionPractice(
                        title: "Finding the Watcher",
                        duration: 5,
                        instructions: """
                        Close your eyes. Notice your thoughts.
                        
                        Now notice that something is AWARE of those thoughts.
                        
                        Turn your attention toward that awareness itself—not the thoughts, but that which is watching.
                        
                        What is it? Where is it located? Does it have boundaries?
                        
                        Spend 5 minutes exploring this observer.
                        
                        This might be your higher-dimensional self looking through the keyhole of your body.
                        """
                    ),
                    keyInsight: "The witnessing consciousness—the part of you that can observe your own thoughts—might be your actual self existing in higher dimensional space.",
                    dragonComment: "You've always sensed someone was watching. It was you. The bigger you."
                ),
                
                DimensionLesson(
                    id: "11d-7-2",
                    title: "Guidance from Beyond",
                    content: """
                    The witness consciousness doesn't just observe.
                    
                    It often provides guidance that feels simultaneously intimate and impersonal.
                    
                    THE CLEAR KNOWING
                    
                    You know this experience:
                    
                    You're facing a complex decision, churning through pros and cons, when suddenly a clear knowing emerges that cuts through all the mental noise.
                    
                    It's not a voice or a thought exactly, but a RECOGNITION that feels more solid than any reasoning process you could construct.
                    
                    PERFECT TIMING
                    
                    This guidance often arrives with perfect timing:
                    
                    • The insight that solves a relationship conflict appears just when you need it
                    • The creative solution to a work problem downloads complete during a morning shower
                    • The warning about a situation surfaces as an inexplicable reluctance that later proves prophetically accurate
                    
                    OPERATING OUTSIDE TIME
                    
                    What's particularly fascinating is how this witness seems to operate from outside normal temporal constraints.
                    
                    It can:
                    • Sense patterns before they fully manifest
                    • Recognize the deeper currents beneath surface events
                    • Sometimes provide information that your conscious mind has no logical way of knowing
                    
                    Remember from our previous exploration how information appears to travel beyond normal time.
                    
                    This witness consciousness might be your personal access point to that phenomenon.
                    """,
                    practice: nil,
                    keyInsight: "The witness within provides guidance that seems to operate outside normal time—sensing patterns before they manifest and knowing things your conscious mind can't explain.",
                    dragonComment: "That 'still small voice' isn't random intuition. It's the part of you that can see around corners."
                ),
                
                DimensionLesson(
                    id: "11d-7-3",
                    title: "Being Lived",
                    content: """
                    During crisis moments, many people report a dramatic expansion of this observing presence.
                    
                    CRISIS WISDOM
                    
                    Time slows. Emotional reactivity drops away. A calm, clear intelligence emerges that seems far wiser than their usual personality structure.
                    
                    Emergency room doctors, soldiers in combat, and parents protecting children often describe accessing capabilities and knowledge that feel BORROWED from some larger version of themselves.
                    
                    MEDITATION MAPPING
                    
                    Meditation traditions have mapped this territory extensively.
                    
                    They describe how the witness initially feels like a subtle background presence, but with attention can be recognized as the most CONSTANT aspect of experience.
                    
                    Thoughts change. Emotions shift. Circumstances alter.
                    
                    But the witnessing awareness remains remarkably stable.
                    
                    It's the one thing about you that has remained essentially unchanged since childhood—the same quality of awareness looking out through your eyes now that was present when you were 7 years old.
                    
                    BEING LIVED
                    
                    Sometimes this witness doesn't just observe—it seems to ACT through you:
                    
                    • You find yourself saying exactly the right thing in a difficult conversation without planning your words
                    • Your body moves with unusual grace and efficiency during physical challenges
                    • You make a series of decisions that create outcomes far better than your conscious strategizing typically achieves
                    
                    Artists and inventors know this phenomenon intimately—the melody that arrives complete, the mathematical proof that appears fully formed, the story that writes itself.
                    
                    These feel less like personal creation and more like RECEPTION from a source that transcends individual limitations.
                    """,
                    practice: DimensionPractice(
                        title: "Inviting the Witness",
                        duration: 10,
                        instructions: """
                        Before an important decision or conversation:
                        
                        Sit quietly for a few minutes.
                        
                        Consciously invite your higher self to participate:
                        
                        "I invite the wiser part of myself to guide this situation."
                        
                        Then release the intention and proceed normally.
                        
                        Notice if you find yourself acting with unusual clarity or saying things you hadn't planned.
                        
                        This is the witness operating through you.
                        """
                    ),
                    keyInsight: "Your higher dimensional presence isn't distant—it's the part of you that's already looking through your eyes, quietly guiding and creating from beyond linear awareness.",
                    dragonComment: "The best decisions you've ever made weren't really 'yours.' They came through you from something bigger."
                )
            ]
        ),
        
        // ═══════════════════════════════════════════════════════════════
        // MODULE 8: MEMORY BEYOND THE BRAIN
        // ═══════════════════════════════════════════════════════════════
        
        DimensionModule(
            id: "memory-beyond",
            number: 8,
            title: "Memory Beyond the Brain",
            subtitle: "Accessing the Infinite Library",
            icon: "externaldrive.connected.to.line.below.fill",
            colorHex: "#8BC34A",
            description: "Have you ever walked into a place you'd never been and felt like you were coming home? You might be accessing memory—just not the kind stored in your brain.",
            lessons: [
                
                DimensionLesson(
                    id: "11d-8-1",
                    title: "The Filing Cabinet Model Is Wrong",
                    content: """
                    Have you ever walked into a place you'd never been before and felt like you were coming home?
                    
                    Or heard a piece of music that moved you to tears despite having no personal connection to it?
                    
                    Maybe you found yourself knowing things about historical periods or distant cultures with an intimacy that seems impossible given your actual experience.
                    
                    This isn't nostalgia or imagination.
                    
                    What you're experiencing might be MEMORY—just not the kind your neuroscience textbooks talk about.
                    
                    THE DOMINANT MODEL
                    
                    The dominant scientific model tells us memory works like a filing cabinet in your brain:
                    
                    Experience goes in, gets processed, filed away in neural networks, and retrieved when needed.
                    
                    Clean. Mechanical. Contained within the three pounds of tissue in your skull.
                    
                    But this model has some pretty glaring problems that researchers are only beginning to acknowledge.
                    
                    CELLULAR MEMORY
                    
                    Consider the documented cases of organ transplant recipients who develop completely new preferences after surgery:
                    
                    • A classical musician receives a heart from a jazz enthusiast and suddenly finds himself drawn to Miles Davis
                    • A vegetarian gets a liver from someone who loved meat and starts craving steaks
                    • A shy accountant receives lungs from an adventurous rock climber and begins seeking out extreme sports
                    
                    The medical establishment calls this coincidence or psychological suggestion.
                    
                    But when you dig deeper, you find recipients describing specific memories, preferences, and even personality traits that precisely match their donors—donors they knew nothing about.
                    
                    If memory is just brain-based neural firing, how do you explain cellular memory?
                    
                    How does a heart remember what its previous owner loved?
                    """,
                    practice: nil,
                    keyInsight: "Memory might not be stored in your brain at all—it might be accessed through it, like a radio receiver tuning into information that exists in fields of consciousness.",
                    dragonComment: "Your brain isn't a hard drive. It's more like a search engine accessing a cloud that extends beyond your body."
                ),
                
                DimensionLesson(
                    id: "11d-8-2",
                    title: "The Collective Unconscious",
                    content: """
                    Carl Jung spent decades documenting what he called the COLLECTIVE UNCONSCIOUS.
                    
                    UNIVERSAL PATTERNS
                    
                    A shared repository of human experience that manifests in symbols, patterns, and archetypal knowledge that appears across cultures with no direct contact.
                    
                    Jung noticed that his patients, regardless of their background, would produce remarkably similar images and symbols during deep psychological work:
                    
                    • Mandalas
                    • Spirals
                    • The wise old man
                    • The great mother
                    
                    These patterns emerged spontaneously from people who had never studied mythology or comparative religion.
                    
                    It was as if they were accessing a LIBRARY of human experience that transcended individual biography.
                    
                    HOLOGRAPHIC CONSCIOUSNESS
                    
                    What Jung discovered aligns remarkably with the holographic model of consciousness we explored earlier.
                    
                    If consciousness operates holographically, then each individual awareness contains patterns of the whole.
                    
                    This means certain universal knowledge might be accessible not through learning but through REMEMBERING—remembering information that exists in the deeper structures of consciousness itself.
                    
                    EXPLAINING FAMILIARITY
                    
                    This explains why:
                    
                    • Some philosophical or spiritual concepts feel immediately familiar when you first encounter them
                    • Certain places evoke profound recognition
                    • Some people seem to carry knowledge of historical periods with startling accuracy despite never having studied them formally
                    """,
                    practice: DimensionPractice(
                        title: "Accessing Collective Memory",
                        duration: 10,
                        instructions: """
                        Think of a historical period or culture you've always felt drawn to—one you haven't studied extensively.
                        
                        Close your eyes. Let your mind drift to that time and place.
                        
                        Without analyzing, notice what images, feelings, or knowledge arise.
                        
                        Write down whatever comes—even if it seems like imagination.
                        
                        Later, research what you wrote. You may find surprising accuracy in your "imagination."
                        
                        This is accessing the collective unconscious.
                        """
                    ),
                    keyInsight: "The collective unconscious isn't metaphor—it's a shared field of human experience that you can access through attention and intention.",
                    dragonComment: "All of human experience is stored somewhere. You have library privileges."
                ),
                
                DimensionLesson(
                    id: "11d-8-3",
                    title: "Epigenetic Inheritance",
                    content: """
                    Recent research in epigenetics is revealing that traumatic experiences actually alter gene expression in ways that get passed down through generations.
                    
                    INHERITED TRAUMA
                    
                    Holocaust survivors' children and grandchildren show genetic markers of trauma they never directly experienced.
                    
                    The descendants of famine victims carry metabolic changes that affect how their bodies process food—even when they've never known hunger.
                    
                    This suggests that information—including emotional and experiential information—can be inherited through biological mechanisms we're just discovering.
                    
                    BUT IT GOES DEEPER
                    
                    Indigenous cultures have always understood this.
                    
                    They speak of "ancestral knowledge" that lives within individuals, accessible through proper attention and practice:
                    
                    • Australian Aboriginal "dream time"
                    • African ancestral wisdom
                    • Native American spirit knowledge
                    
                    These traditions recognize that individual consciousness connects to vast networks of information spanning generations and dimensions of experience.
                    
                    INTUITION AS MEMORY
                    
                    What we call INTUITION might often be exactly this kind of memory:
                    
                    Not of this life's experiences, but of information accessible to higher dimensional aspects of consciousness that exist beyond the constraints of linear time and individual biography.
                    
                    That inexplicable familiarity with certain people might be recognition operating from dimensions where your connection already exists.
                    
                    The spontaneous emergence of skills during crisis situations might be your expanded awareness accessing knowledge from the collective human repository of experience.
                    
                    Even your deepest fears and attractions might not be entirely personal—they could be echoes from the vast network of human experience that your consciousness naturally connects to.
                    """,
                    practice: nil,
                    keyInsight: "Your consciousness is connected to the infinite library of human experience. What feels like intuition might be memory from dimensions beyond your individual biography.",
                    dragonComment: "You're not just inheriting genes. You're inheriting experiences, knowledge, and wisdom from everyone who came before."
                )
            ]
        ),
        
        // ═══════════════════════════════════════════════════════════════
        // MODULE 9: INTEGRATION
        // ═══════════════════════════════════════════════════════════════
        
        DimensionModule(
            id: "integration",
            number: 9,
            title: "Living Multi-Dimensionally",
            subtitle: "Practical Application",
            icon: "figure.mind.and.body",
            colorHex: "#CDDC39",
            description: "How do you actually live with this awareness without losing your footing in the three-dimensional world that still demands your attention?",
            lessons: [
                
                DimensionLesson(
                    id: "11d-9-1",
                    title: "Not Escape—Bridge",
                    content: """
                    So you've glimpsed the watchers within—those higher dimensional aspects of yourself that have been present all along.
                    
                    You've felt the pull of ancient memories that seem to belong to someone else yet resonate with undeniable familiarity.
                    
                    Now comes perhaps the most crucial question:
                    
                    How do you actually LIVE with this awareness without losing your footing in the three-dimensional world that still demands your attention?
                    
                    NOT SPIRITUAL BYPASSING
                    
                    I've watched people discover these expanded aspects of consciousness and immediately want to escape into them—abandoning practical responsibilities as if the physical world suddenly became irrelevant.
                    
                    That's not integration. That's spiritual bypassing.
                    
                    The real mastery lies in becoming MORE effective in ordinary reality, not less—because you're drawing from a fuller spectrum of your own intelligence.
                    
                    THE BRIDGE
                    
                    Think of it this way:
                    
                    You've discovered you have access to a vast library of wisdom and perspective that exists beyond your everyday mind.
                    
                    The question isn't whether to live in the library or in the world. It's how to become a BRIDGE between them.
                    
                    This is where the rubber meets the road in multi-dimensional living.
                    """,
                    practice: nil,
                    keyInsight: "The goal isn't to escape into higher dimensions—it's to become a bridge between expanded awareness and practical effectiveness.",
                    dragonComment: "Awakening isn't about leaving. It's about being here more fully with access to everything you are."
                ),
                
                DimensionLesson(
                    id: "11d-9-2",
                    title: "Enhanced Decision-Making",
                    content: """
                    Let's start with decision-making—because this is where most people first notice the practical difference.
                    
                    DIMENSIONAL SPACE
                    
                    Instead of forcing choices through mental analysis alone—weighing pros and cons until your head spins—you learn to create space for a broader perspective to emerge.
                    
                    I'm not talking about abandoning rational thinking. I'm talking about EXPANDING it.
                    
                    Before important decisions, create what I call "dimensional space."
                    
                    This means stepping back from the urgency of immediate analysis and allowing stillness.
                    
                    In that stillness, something interesting happens.
                    
                    THE BODY RESPONSE
                    
                    Your body begins to respond differently to various options:
                    
                    • One choice might generate a sense of expansion, energy, and possibility
                    • Another might create contraction, heaviness, or a subtle sense of wrongness that has nothing to do with logical analysis
                    
                    This isn't mystical wishful thinking.
                    
                    You're learning to recognize signals from aspects of consciousness that process information differently than your analytical mind.
                    
                    That higher dimensional awareness we discussed—it's not separate from you. It's a more expanded version of you with access to patterns and connections your everyday consciousness might miss.
                    
                    PRACTICAL EXAMPLE
                    
                    You're considering a job offer. Logically, it makes sense—better pay, good benefits, reasonable commute.
                    
                    But when you sit quietly and imagine yourself in that role, your body contracts slightly. There's a subtle sense of life force diminishing.
                    
                    Meanwhile, another opportunity that looks less impressive on paper generates energy and excitement that seems to come from somewhere deeper than surface preferences.
                    
                    Traditional advice tells you to ignore those "irrational" responses.
                    
                    Multi-dimensional wisdom suggests they might be the most rational responses of all—coming from aspects of your consciousness that can perceive the fuller implications of your choices.
                    """,
                    practice: DimensionPractice(
                        title: "Dimensional Decision-Making",
                        duration: 10,
                        instructions: """
                        Next time you face a significant decision:
                        
                        1. Sit quietly for 5 minutes, releasing urgency
                        
                        2. Hold each option in your mind, one at a time
                        
                        3. Notice your body's response to each:
                           • Expansion or contraction?
                           • Energy increase or decrease?
                           • Opening or closing?
                        
                        4. Trust these signals as information from your expanded self
                        
                        5. Let your final decision integrate both logical analysis AND body wisdom
                        """
                    ),
                    keyInsight: "Your body's responses to decisions might come from dimensions that can perceive fuller implications than your analytical mind can access.",
                    dragonComment: "Your body has been giving you the answers all along. You just weren't listening."
                ),
                
                DimensionLesson(
                    id: "11d-9-3",
                    title: "Relationships and Creativity",
                    content: """
                    This understanding transforms how you approach relationships.
                    
                    SEEING MULTI-DIMENSIONAL OTHERS
                    
                    When you recognize that you exist across multiple dimensions of consciousness, you begin to perceive the same multi-dimensional nature in others.
                    
                    That difficult person in your life—yes, they're displaying challenging personality patterns and behaviors.
                    
                    But there are other aspects of them operating simultaneously—aspects that might be more accessible if you learn to recognize and relate to them.
                    
                    This doesn't mean ignoring problematic behavior or abandoning healthy boundaries.
                    
                    It means recognizing that the person you're dealing with in ordinary reality is one expression of a more complex multi-dimensional being—just as you are.
                    
                    Sometimes relating to someone's deeper essence can shift the entire dynamic in ways that addressing surface level personality patterns never could.
                    
                    CREATIVE COLLABORATION
                    
                    Creative work becomes particularly interesting from this perspective.
                    
                    Instead of seeing creativity as something you DO through effort and technique alone, it becomes a form of DIMENSIONAL COLLABORATION.
                    
                    Your everyday self with its skills, knowledge, and ability to function in three-dimensional reality serves as a conduit for inspiration and insight flowing from expanded aspects of consciousness.
                    
                    Many artists and innovators describe this experience without necessarily using multi-dimensional language:
                    
                    • Ideas that seem to come from "somewhere else"
                    • Solutions that appear fully formed
                    • Creative breakthroughs that feel more like discoveries than inventions
                    
                    When you understand consciousness as multi-dimensional, these experiences make perfect sense.
                    
                    You're not channeling some external source. You're accessing aspects of your own expanded awareness.
                    """,
                    practice: nil,
                    keyInsight: "Recognizing the multi-dimensional nature of others allows you to relate to their deeper essence—often shifting dynamics that surface-level interactions couldn't change.",
                    dragonComment: "That annoying person? They're also a vast multi-dimensional being having a difficult moment. So are you."
                )
            ]
        ),
        
        // ═══════════════════════════════════════════════════════════════
        // MODULE 10: BEYOND ALL DIMENSIONS
        // ═══════════════════════════════════════════════════════════════
        
        DimensionModule(
            id: "beyond-dimensions",
            number: 10,
            title: "Beyond All Dimensions",
            subtitle: "The Groundless Ground",
            icon: "infinity.circle.fill",
            colorHex: "#FF9800",
            description: "What if the 11th dimension—like all the others—is just another playground for the awareness that you fundamentally are?",
            lessons: [
                
                DimensionLesson(
                    id: "11d-10-1",
                    title: "The Ultimate Recognition",
                    content: """
                    We've traveled quite a journey through these dimensions of consciousness.
                    
                    From the quantum mechanics showing us reality's malleable nature, through those ancient memories that feel older than our bodies, to practical ways of living as multi-dimensional beings.
                    
                    Each perspective we've explored—whether cutting-edge physics or timeless mystical insight—keeps pointing toward something that ultimately transcends every framework we can construct around it.
                    
                    THE DEEPER REALIZATION
                    
                    Here's what's fascinating:
                    
                    The more we investigate consciousness through any lens, the more we discover that we're not actually finding consciousness somewhere "out there" in higher dimensions.
                    
                    Instead, we're recognizing that consciousness might be the very CAPACITY that allows dimensions to exist in the first place.
                    
                    It's like spending years searching for the screen that movies are projected on—only to realize you've been looking at it the entire time.
                    
                    WHAT IS AWARENESS?
                    
                    Think about this for a moment:
                    
                    When physicists probe deeper into reality, what do they consistently find? That the observer plays a fundamental role in determining what gets observed.
                    
                    When mystics explore the depths of meditation, what do they discover? That the seeker and the sought are the same awareness.
                    
                    When neuroscientists study the brain, what remains mysteriously elusive? The actual EXPERIENCE of being aware—that irreducible fact of consciousness that makes all their observations possible.
                    """,
                    practice: nil,
                    keyInsight: "Consciousness isn't something existing in dimensions—it might be the capacity that allows dimensions to exist in the first place.",
                    dragonComment: "You're not finding consciousness somewhere out there. You ARE it."
                ),
                
                DimensionLesson(
                    id: "11d-10-2",
                    title: "The Groundless Ground",
                    content: """
                    This transforms the entire question of identity.
                    
                    THE NEW QUESTION
                    
                    Instead of asking "who am I across all these dimensions," we start asking "what is the nature of this awareness that's capable of asking any question at all?"
                    
                    It's the difference between trying to locate yourself within existence and recognizing yourself AS the very capacity for existence to be experienced.
                    
                    THE GROUNDLESS GROUND
                    
                    The ancient traditions called this the "groundless ground."
                    
                    An awareness so fundamental that it doesn't depend on any particular structure for its existence.
                    
                    • Not the first dimension
                    • Not the 11th dimension
                    • Not infinite dimensions
                    
                    It's what allows the very CONCEPT of dimension to make sense.
                    
                    It's like asking "what color is the space that contains all colors?" or "what shape is the emptiness that allows all shapes to appear?"
                    
                    FREEDOM AND RESPONSIBILITY
                    
                    This recognition brings something profound:
                    
                    Both radical freedom AND profound responsibility.
                    
                    FREEDOM—because you're no longer trying to fix, heal, or complete some limited aspect of yourself. The awareness reading these words right now isn't broken, isn't missing anything, isn't waiting to evolve into something better. It's already the deepest truth regardless of which dimensions it might be experiencing through.
                    
                    RESPONSIBILITY—because if this unlimited awareness is expressing itself through the particular form of your life, then how that expression unfolds matters deeply. Not because you need to achieve some spiritual goal, but because this moment—with all its apparent limitations and possibilities—is how infinite consciousness is choosing to know itself right now.
                    """,
                    practice: DimensionPractice(
                        title: "Resting as Awareness",
                        duration: 10,
                        instructions: """
                        Close your eyes. Notice whatever is present—thoughts, sensations, sounds.
                        
                        Now notice the awareness that is aware of all this.
                        
                        Ask: "Can I find the boundaries of this awareness?"
                        
                        Search for its edges. Try to locate where it begins and ends.
                        
                        Notice that awareness seems to have no boundaries, no location, no dimensions.
                        
                        Rest as this boundless awareness for 10 minutes.
                        
                        This is what you are beyond all dimensions.
                        """
                    ),
                    keyInsight: "The awareness reading these words isn't broken or incomplete—it's already the deepest truth, expressing itself through your particular form.",
                    dragonComment: "You were never the iceberg. You were always the ocean."
                ),
                
                DimensionLesson(
                    id: "11d-10-3",
                    title: "The Beautiful Paradox",
                    content: """
                    Here's the beautiful paradox that emerges:
                    
                    All our seeking for the higher self in expanded dimensions might ultimately reveal that there was never anything to seek.
                    
                    WHAT WAS NEVER LOST
                    
                    The awareness that got curious about the 11th dimension...
                    The consciousness that resonated with ancient memories...
                    The being that learned to navigate multi-dimensional existence...
                    
                    This was always the very thing it was looking for.
                    
                    TRANSFORMING DEATH
                    
                    This understanding completely transforms how we relate to death.
                    
                    Not because consciousness continues in some other dimension (though it might), but because we recognize it was never actually confined to any dimension in the first place.
                    
                    • What was never born cannot die
                    • What was never fragmented doesn't need healing
                    • What was never lost doesn't need to be found
                    
                    THE UNIVERSAL RECOGNITION
                    
                    You can see this recognition appearing across every wisdom tradition, expressed in their unique languages but pointing to the same mystery:
                    
                    • The Vedantic "I am that I am"
                    • The Buddhist recognition of "original nature"
                    • The mystical Christian understanding of "being in the world but not of it"
                    • The indigenous knowing of being both the dreamer and the dream
                    
                    PRACTICAL FREEDOM
                    
                    But here's what makes this practical rather than just philosophical:
                    
                    You don't need to choose between being this infinite awareness and fully engaging with multi-dimensional existence.
                    
                    In fact, the deeper this recognition goes, the more freely you can play in all the dimensions of experience.
                    
                    • You can explore past life memories without needing them to define you
                    • You can develop psychic abilities without making them your identity
                    • You can have profound mystical experiences without grasping after them
                    
                    It's like being an actor who's so secure in their real identity that they can completely inhabit any role.
                    
                    The more you know yourself as this fundamental awareness, the more fully you can experience being human, being multi-dimensional, being whatever this moment is calling forth.
                    
                    THE INVITATION
                    
                    The invitation isn't to transcend your humanity—but to recognize what was never bound by it.
                    
                    Not to escape dimensions—but to dance freely through them all.
                    
                    Not to become something greater—but to recognize the greatness that's been reading these words all along.
                    
                    Rest in this recognition while fully engaging with the magnificent play of existence.
                    
                    Live as both the infinite awareness and its temporary expressions.
                    
                    Be both the eternal witness and the evolving story.
                    
                    This is your true nature beyond all dimensions.
                    
                    Not located anywhere, not confined to anything, but the very capacity for everything to be experienced.
                    """,
                    practice: nil,
                    keyInsight: "You don't need to choose between infinite awareness and multi-dimensional existence. The deeper the recognition, the more freely you can dance through all dimensions.",
                    dragonComment: "What if the 11th dimension is just another playground for the awareness that you fundamentally are?"
                )
            ]
        )
    ]
    
    
    // MARK: - Dragon Introduction
    
    static let dragonIntro = """
    Seeker, what you're about to learn will fundamentally alter your understanding of who you are.
    
    Modern physics has discovered something the mystics always knew: reality has far more dimensions than you can perceive.
    
    You experience four dimensions. The math says there are eleven.
    
    If that's true, most of YOU exists in dimensions you can't access.
    
    That feeling you've always had—that there's more to you than what you can touch—isn't imagination.
    
    It's accurate perception.
    
    Let's explore where the rest of you has been hiding.
    """
}


// MARK: - Supporting Types

struct DimensionModule: Identifiable {
    let id: String
    let number: Int
    let title: String
    let subtitle: String
    let icon: String
    let colorHex: String
    let description: String
    let lessons: [DimensionLesson]
    
    var color: Color {
        Color(hex: colorHex)
    }
    
    var lessonCount: Int {
        lessons.count
    }
}


struct DimensionLesson: Identifiable {
    let id: String
    let title: String
    let content: String
    let practice: DimensionPractice?
    let keyInsight: String
    let dragonComment: String
    
    var hasPractice: Bool {
        practice != nil
    }
}


struct DimensionPractice: Identifiable {
    let id = UUID()
    let title: String
    let duration: Int // 0 = ongoing
    let instructions: String
    
    var durationText: String {
        if duration == 0 {
            return "Ongoing"
        } else {
            return "\(duration) min"
        }
    }
}
