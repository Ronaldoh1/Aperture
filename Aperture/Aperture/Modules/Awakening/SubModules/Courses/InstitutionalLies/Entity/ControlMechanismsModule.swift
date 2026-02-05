// ControlMechanismsModule.swift
// How the lies persist - the psychological and institutional levers

import SwiftUI

struct ControlMechanism: Identifiable {

    let id: String
    let title: String
    let icon: String
    let description: String
    let examples: [String]
    let defense: String

}

extension ControlMechanism {

    static let all: [ControlMechanism] = [

        ControlMechanism(
            id: "repetition",
            title: "Repetition Effect",
            icon: "repeat",
            description: "The illusory truth effect: repeated claims feel truer, regardless of accuracy. Say something enough times and it becomes 'common knowledge.'",
            examples: [
                "Political slogans repeated until accepted as fact",
                "Brand messaging creating 'obvious' truths",
                "Media talking points echoed across outlets",
                "Historical myths repeated in textbooks for generations"
            ],
            defense: "Ask: 'How many times have I heard this vs. how many times have I verified it?'"
        ),

        ControlMechanism(
            id: "identity_protection",
            title: "Identity Protection",
            icon: "shield.fill",
            description: "People accept claims that match their tribe and self-story, and reject claims that threaten it - regardless of evidence.",
            examples: [
                "Refusing to see flaws in 'my' political party",
                "Defending products/companies tied to identity",
                "Attacking messengers who challenge beliefs",
                "Motivated reasoning to preserve self-image"
            ],
            defense: "Notice when you're defending a belief because it's YOURS rather than because it's TRUE."
        ),

        ControlMechanism(
            id: "attention_shaping",
            title: "Attention Shaping",
            icon: "eye.trianglebadge.exclamationmark",
            description: "Outrage and fear spread faster than nuance. Systems optimize for emotional stickiness, not truth.",
            examples: [
                "Algorithms promoting rage-bait",
                "News covering sensational over significant",
                "Social media rewarding extreme takes",
                "Crisis framing for non-crises"
            ],
            defense: "If content makes you immediately angry or afraid, pause. Strong emotion often means manipulation."
        ),

        ControlMechanism(
            id: "memory_contamination",
            title: "Memory Contamination",
            icon: "brain.head.profile",
            description: "False details get integrated into recall. Then people defend the memory as if it were a file on disk.",
            examples: [
                "False memories from leading questions",
                "Misremembering events after media coverage",
                "Confabulation in traumatic recall",
                "Group memory distortion in shared narratives"
            ],
            defense: "Hold memories loosely. Your confidence in a memory doesn't correlate with its accuracy."
        ),

        ControlMechanism(
            id: "narrative_capture",
            title: "Narrative Capture",
            icon: "text.book.closed.fill",
            description: "Hire PR, fund friendly experts, bury bad results, or reframe harm as 'misuse.' Control the story, control reality.",
            examples: [
                "Tobacco funding 'research' questioning cancer links",
                "Pharma ghost-writing medical journal articles",
                "Think tanks producing 'independent' analysis",
                "Crisis PR reframing corporate disasters"
            ],
            defense: "Follow the funding. Ask: Who paid for this study/article/expert?"
        ),

        ControlMechanism(
            id: "regulatory_capture",
            title: "Regulatory Capture",
            icon: "building.columns.fill",
            description: "When industries control their own regulators through lobbying, revolving door careers, and underfunded enforcement.",
            examples: [
                "Pharma executives becoming FDA officials",
                "Bank lobbyists writing banking regulations",
                "Oil companies staffing environmental agencies",
                "Tech giants shaping tech policy"
            ],
            defense: "Check career histories. The 'watchdog' may be employed by those being watched."
        ),

        ControlMechanism(
            id: "fragmented_accountability",
            title: "Fragmented Accountability",
            icon: "puzzlepiece.extension.fill",
            description: "Contractors, subsidiaries, 'we followed guidance,' 'we relied on consultants.' Diffuse blame until no one is responsible.",
            examples: [
                "Military contractors vs. military responsibility",
                "Parent companies vs. subsidiary actions",
                "'Following orders' defense",
                "Algorithmic decisions with no human accountable"
            ],
            defense: "Follow the money and decision chain. Someone benefited; someone decided."
        ),

        ControlMechanism(
            id: "delay_tactics",
            title: "Delay, Delay, Delay",
            icon: "clock.fill",
            description: "Lawsuits, nondisclosure, procedural fog until the public's attention span dies. Justice delayed is justice denied.",
            examples: [
                "Decades of tobacco litigation while millions died",
                "Climate denial delaying action for 50+ years",
                "Corporate bankruptcy to avoid payouts",
                "Statute of limitations expiring during appeals"
            ],
            defense: "Time-based arguments ('let's wait for more data') often serve those who benefit from the status quo."
        )

    ]

}
