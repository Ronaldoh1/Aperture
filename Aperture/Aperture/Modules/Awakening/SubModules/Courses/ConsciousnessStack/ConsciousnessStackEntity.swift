// ConsciousnessStackEntity.swift
// THE CONSCIOUSNESS STACK - 7-Layer Analysis Framework
// The SunFlow HAKAI Method for Deconstructing Narratives
// Premium feature: How to see through institutional programming

import Foundation
import SwiftUI

// MARK: - The Consciousness Stack

struct ConsciousnessStack {
    
    static let title = "THE CONSCIOUSNESS STACK"
    static let subtitle = "7-Layer Framework for Seeing Through the Matrix"
    
    // MARK: - The 7 Layers
    
    struct Layer: Identifiable {
        let id: Int
        let name: String
        let question: String
        let description: String
        let examples: [String]
        let color: String
        let icon: String
    }
    
    static let layers: [Layer] = [
        Layer(
            id: 7,
            name: "Narrative",
            question: "What are you TOLD?",
            description: """
            The surface story. The explanation you're given. The official version.
            
            This is Layer 7 - the outermost layer of reality. It's what most people accept without question because it comes from "trusted" sources.
            
            Narratives are CONSTRUCTED. Someone chose what to include, what to emphasize, what to leave out. The question isn't "Is this true?" but "Why am I being told THIS version?"
            """,
            examples: [
                "\"Work hard and you'll succeed\" (American Dream)",
                "\"We're spreading democracy\" (military intervention)",
                "\"This is for your safety\" (surveillance)",
                "\"Trust the experts\" (institutional authority)",
                "\"There's no alternative\" (economic policy)"
            ],
            color: "#9C27B0",
            icon: "text.bubble.fill"
        ),
        
        Layer(
            id: 6,
            name: "Relationships",
            question: "Who's INVOLVED?",
            description: """
            The actors in the system. Who tells this story? Who repeats it? Who enforces it?
            
            Every narrative has a network of people and institutions that create, amplify, and protect it.
            
            Map the relationships:
            • Who benefits from this narrative?
            • Who pushes it most aggressively?
            • Who gets silenced for questioning it?
            • What institutions coordinate the messaging?
            """,
            examples: [
                "Government → Media → Schools → Corporations",
                "Pharmaceutical companies → FDA → Medical journals → Doctors",
                "Defense contractors → Pentagon → Think tanks → Congress",
                "Wall Street → Treasury → Fed → Financial media"
            ],
            color: "#673AB7",
            icon: "person.3.fill"
        ),
        
        Layer(
            id: 5,
            name: "Incentives",
            question: "Follow the MONEY",
            description: """
            Why do they act this way? What do they gain?
            
            This is the most powerful layer for pattern recognition. When you understand incentives, behavior becomes predictable.
            
            People and institutions act according to what rewards them. If you want to understand why something happens, find who profits.
            
            Money is the most obvious incentive, but also track:
            • Power (who gains control?)
            • Status (who gains reputation?)
            • Job security (who keeps their position?)
            • Ideology (who gets to feel righteous?)
            """,
            examples: [
                "Private prisons profit from incarceration → lobby for harsh sentencing",
                "Pharma profits from treatment → suppresses cures, extends patents",
                "Media profits from engagement → amplifies outrage, not truth",
                "Politicians profit from donations → serve donors, not voters"
            ],
            color: "#3F51B5",
            icon: "dollarsign.circle.fill"
        ),
        
        Layer(
            id: 4,
            name: "Institutions",
            question: "What's the STRUCTURE?",
            description: """
            The power architecture. How is control organized?
            
            Institutions are structures that outlast individuals. They have their own logic, their own survival instincts, their own agendas.
            
            Map the institutional structure:
            • Who has formal authority?
            • Who has informal influence?
            • How do institutions protect themselves?
            • How do they reproduce their values?
            """,
            examples: [
                "Education: Standardized testing → credentialism → debt bondage",
                "Finance: Central banks → commercial banks → fractional reserve → debt money",
                "Healthcare: AMA → hospitals → insurance → pharmaceutical",
                "Media: 6 corporations → all major outlets → manufactured consensus"
            ],
            color: "#2196F3",
            icon: "building.columns.fill"
        ),
        
        Layer(
            id: 3,
            name: "Enforcement",
            question: "How is it MAINTAINED?",
            description: """
            Violence, control, and consequences. How is compliance enforced?
            
            Every system has enforcement mechanisms - ways to punish deviation and reward compliance.
            
            This includes:
            • Legal force (police, courts, prisons)
            • Economic force (job loss, debt, poverty)
            • Social force (shaming, cancellation, exclusion)
            • Psychological force (gaslighting, manipulation)
            """,
            examples: [
                "Question the narrative → labeled conspiracy theorist",
                "Don't pay taxes → armed agents take your property",
                "Whistleblow → career destroyed, possibly imprisoned",
                "Protest effectively → infiltrated, surveilled, prosecuted",
                "Build alternatives → regulated out of existence"
            ],
            color: "#03A9F4",
            icon: "lock.shield.fill"
        ),
        
        Layer(
            id: 2,
            name: "Biology",
            question: "What's your HARDWARE?",
            description: """
            Your biological substrate. The body you're running on.
            
            Your consciousness operates through biology - brain, nervous system, hormones, gut microbiome. This hardware can be:
            • Optimized (nutrition, sleep, sunlight, movement)
            • Suppressed (toxins, stress, blue light, processed food)
            • Manipulated (pharmaceuticals, EMFs, circadian disruption)
            
            The control system targets your biology because a compromised body means compromised consciousness.
            """,
            examples: [
                "Pineal gland: calcified by fluoride, disrupted by artificial light",
                "Circadian rhythm: destroyed by screens, shift work, indoor living",
                "Gut-brain axis: compromised by processed food, antibiotics",
                "Stress response: chronically activated by fear-based media",
                "Hormone balance: disrupted by plastics, chemicals, diet"
            ],
            color: "#00BCD4",
            icon: "brain.head.profile"
        ),
        
        Layer(
            id: 1,
            name: "Physics",
            question: "What's BASE REALITY?",
            description: """
            The fundamental layer. Light, energy, matter, consciousness.
            
            This is where you find what's actually real - before narratives, before institutions, before biology.
            
            At this layer:
            • Resources exist (scarcity is mostly policy, not physics)
            • Energy flows (it can be directed, not destroyed)
            • Consciousness is primary (the observer affects the observed)
            • Natural law operates (gravity doesn't negotiate)
            """,
            examples: [
                "There IS enough food - distribution is the problem",
                "Energy IS abundant - access is controlled",
                "Humans CAN cooperate - division is manufactured",
                "Healing IS possible - it's suppressed for profit",
                "Consciousness IS fundamental - materialism is a narrative"
            ],
            color: "#009688",
            icon: "atom"
        )
    ]
    
    // MARK: - Example Analysis: The American Dream
    
    static let americanDreamAnalysis = StackAnalysis(
        title: "The American Dream",
        claim: "Work hard, you'll succeed. Anyone can make it in America.",
        layers: [
            LayerAnalysis(
                layer: 7,
                name: "Narrative",
                content: "\"Meritocracy. Equal opportunity. Hard work = success. The American Dream is available to anyone willing to work for it.\""
            ),
            LayerAnalysis(
                layer: 6,
                name: "Relationships",
                content: "Who tells this story? Government, corporations, media, schools. It's repeated in every graduation speech, job interview, political campaign. The entire culture reinforces it."
            ),
            LayerAnalysis(
                layer: 5,
                name: "Incentives",
                content: "Why push this narrative? It keeps workers compliant. If you believe failure is YOUR fault (not working hard enough), you won't question the system. You'll blame yourself, not the structure."
            ),
            LayerAnalysis(
                layer: 4,
                name: "Institutions",
                content: """
                • Education: Standardized testing, student debt, credential inflation
                • Employment: Wage suppression, union-busting, gig economy
                • Media: Rags-to-riches mythology (survivor bias: you only hear success stories)
                • Finance: Predatory lending, credit scores, wealth extraction
                """
            ),
            LayerAnalysis(
                layer: 3,
                name: "Enforcement",
                content: """
                • Police: Protect property, not people. Criminalize poverty.
                • Courts: Favor those who can afford lawyers. Cash bail traps the poor.
                • Prisons: 2.3 million incarcerated (highest rate globally). Disproportionately poor and minority.
                • Social: Shame the \"lazy,\" celebrate the \"successful.\" Poverty = moral failure.
                """
            ),
            LayerAnalysis(
                layer: 2,
                name: "Biology",
                content: "Humans need food, shelter, safety. When these are scarce, desperation sets in. Desperation = compliance. You'll take any job, accept any condition, because the alternative is homelessness."
            ),
            LayerAnalysis(
                layer: 1,
                name: "Physics",
                content: "Resources exist. Food, housing, energy - all exist in abundance. Distribution is a POLICY CHOICE, not natural law. Scarcity is manufactured to maintain control."
            )
        ],
        synthesis: """
        **BOTTOM-UP SYNTHESIS:**
        
        Resources exist (Layer 1)
        → Distribution is controlled to create scarcity (Layer 2-4)
        → Scarcity creates desperation, desperation creates compliance (Layer 2-3)
        → Institutions enforce the scarcity (Layer 3-4)
        → Narrative justifies the inequality (Layer 6-7)
        → \"Work harder\" = control mechanism, not success strategy
        
        **THE TRUTH:**
        
        The American Dream narrative serves those who benefit from your labor. It individualizes systemic problems, making you blame yourself for structural failures.
        
        This doesn't mean hard work is bad. It means hard work ALONE isn't enough when the system is designed for most people to fail while a few extract the value.
        """
    )
    
    // MARK: - How To Use The Stack
    
    static let howToUse = """
    **THE HAKAI METHOD**
    
    HAKAI (破壊) = Destruction in Japanese
    
    This method DESTROYS false narratives by examining them layer by layer.
    
    **STEP 1: Identify the Narrative (Layer 7)**
    What are you being told? What's the official story?
    Write it down clearly, without judgment.
    
    **STEP 2: Map the Relationships (Layer 6)**
    Who is telling this story? Who amplifies it?
    Who benefits if you believe it? Who is silenced?
    
    **STEP 3: Follow the Money (Layer 5)**
    What incentives drive the actors?
    Who profits financially? Who gains power?
    
    **STEP 4: Examine the Structure (Layer 4)**
    What institutions support this narrative?
    How are they organized? What's their logic?
    
    **STEP 5: Find the Enforcement (Layer 3)**
    How is deviation punished?
    What happens to people who don't comply?
    
    **STEP 6: Check Your Biology (Layer 2)**
    How does this affect your body/brain?
    Is your hardware being optimized or compromised?
    
    **STEP 7: Ground in Physics (Layer 1)**
    What's actually real beneath all the layers?
    What exists before narratives shape perception?
    
    **STEP 8: Synthesize Bottom-Up**
    Start from Layer 1 and build upward.
    How does base reality → narratives?
    What truth emerges when you reverse the stack?
    """
    
    // MARK: - More Example Analyses
    
    static let exampleTopics = [
        "The War on Terror",
        "The Healthcare System",
        "Higher Education",
        "The Two-Party System",
        "Social Media",
        "The Food Industry",
        "The Housing Market",
        "Climate Narratives",
        "Pandemic Response",
        "Immigration Policy"
    ]
}

// MARK: - Supporting Types

struct StackAnalysis: Identifiable {
    let id = UUID()
    let title: String
    let claim: String
    let layers: [LayerAnalysis]
    let synthesis: String
}

struct LayerAnalysis: Identifiable {
    var id: Int { layer }
    let layer: Int
    let name: String
    let content: String
}

// MARK: - Interactive Stack Builder

struct StackBuilder {
    var topic: String = ""
    var layerInputs: [Int: String] = [:]
    var synthesis: String = ""
    
    mutating func setLayer(_ layer: Int, content: String) {
        layerInputs[layer] = content
    }
    
    func getLayer(_ layer: Int) -> String {
        layerInputs[layer] ?? ""
    }
    
    func isComplete() -> Bool {
        for i in 1...7 {
            if (layerInputs[i] ?? "").isEmpty {
                return false
            }
        }
        return !synthesis.isEmpty
    }
}

// MARK: - Validation Game (Self-Check)

struct AwakeningValidation {
    
    static let title = "VALIDATION PROTOCOL"
    static let subtitle = "How to Know You're Actually Awake"
    
    struct ValidationCheck: Identifiable {
        let id = UUID()
        let name: String
        let question: String
        let indicators: [String]
        let warnings: [String]
    }
    
    static let checks: [ValidationCheck] = [
        ValidationCheck(
            name: "Matrix Glitch Detection",
            question: "Can you spot narrative contradictions?",
            indicators: [
                "You notice when official stories contradict observable reality",
                "You catch doublespeak and propaganda techniques",
                "You see patterns in how crises are used to justify power grabs",
                "You recognize when media is coordinating narratives"
            ],
            warnings: [
                "⚠️ Seeing conspiracies everywhere (paranoia, not pattern recognition)",
                "⚠️ Unable to distinguish real contradictions from misunderstandings",
                "⚠️ Only seeing glitches that confirm your existing beliefs"
            ]
        ),
        
        ValidationCheck(
            name: "Pattern Synthesis",
            question: "Can you connect patterns across domains?",
            indicators: [
                "You see same patterns at different scales (fractal thinking)",
                "You connect historical patterns to current events",
                "You recognize control mechanisms across institutions",
                "You can explain the pattern clearly to others"
            ],
            warnings: [
                "⚠️ Forcing connections that don't hold up to scrutiny",
                "⚠️ Unable to explain the pattern without sounding unhinged",
                "⚠️ Seeing patterns but unable to act on insights"
            ]
        ),
        
        ValidationCheck(
            name: "Toxicity Elimination",
            question: "Have you released internal poison?",
            indicators: [
                "Reduced reactivity to triggers",
                "Less attachment to being \"right\"",
                "Compassion for the unawakened (not contempt)",
                "Inner peace independent of external circumstances"
            ],
            warnings: [
                "⚠️ Spiritual bypassing (using awakening to avoid feeling)",
                "⚠️ Superiority complex (\"I'm awake, they're sheep\")",
                "⚠️ More angry/anxious than before awakening"
            ]
        ),
        
        ValidationCheck(
            name: "Source Connection",
            question: "Do you have direct access to inner knowing?",
            indicators: [
                "Intuition that proves accurate over time",
                "Synchronicities that provide guidance",
                "Moments of clarity that don't come from thinking",
                "Sense of being guided even when path is unclear"
            ],
            warnings: [
                "⚠️ Confusing ego desires with intuition",
                "⚠️ Needing constant external validation",
                "⚠️ Spiritual experiences without practical integration"
            ]
        ),
        
        ValidationCheck(
            name: "Collective Service",
            question: "Are you serving others, not just yourself?",
            indicators: [
                "Awakening translates into action that helps others",
                "You share without needing credit",
                "You empower others' awakening, not dependence on you",
                "Your growth benefits your community"
            ],
            warnings: [
                "⚠️ Using \"serving others\" to avoid your own healing",
                "⚠️ Awakening as ego boost rather than service",
                "⚠️ Helping others in ways that create dependency"
            ]
        )
    ]
    
    static let validationCode = """
    ```
    function self_validate():
        checks = [
            can_spot_matrix_glitches(),
            can_synthesize_patterns(),
            toxicity_eliminated(),
            direct_source_connection(),
            serves_collective_not_ego()
        ]
        
        return all(checks)
    ```
    
    NOTE: This is NECESSARY but NOT SUFFICIENT.
    
    Self-validation alone can be delusional.
    Group validation provides calibration.
    Peer confirmation prevents solo delusion.
    """
}
