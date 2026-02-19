// NeuroscienceModuleView.swift
// NEUROSCIENCE OF MANIPULATION — "Know Your Brain"
// ☀️ SunFlow: Reignited
//
// "They can only target what you don't understand.
//  Once you know how your brain works,
//  you become unhackable."
//
// This is NOT PsyopScanner (which detects manipulation in content).
// This is NOT Signal vs Noise (which filters information).
// This is the FOUNDATION underneath both:
//
// Teaching you the actual neuroscience of WHY manipulation works —
// the brain structures, the neurochemistry, the evolutionary wiring
// that politicians, media, religion, and marketing exploit.
//
// And the defense: cognitive friction, limbic sovereignty,
// and the 404 Love Response Protocol.
//
// Separate module. Standalone. The one they should have
// taught you in school but never did — because an informed
// brain is harder to control.

import SwiftUI

// MARK: - ═══════════════════════════════════════════════════
// NEUROSCIENCE MODULE VIEW
// ═══════════════════════════════════════════════════════════

struct NeuroscienceModuleView: View {
    
    @Environment(\.dismiss) var dismiss
    @State private var selectedTab: NeuroTab = .anatomy
    @State private var expandedCards: Set<String> = []
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color(red: 0.02, green: 0.02, blue: 0.06).ignoresSafeArea()
                
                ScrollView(showsIndicators: false) {
                    VStack(spacing: 20) {
                        headerView
                        tabSelector
                        contentForTab
                        Spacer(minLength: 60)
                    }
                    .padding(20)
                }
            }
            .navigationTitle("")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button { dismiss() } label: {
                        Image(systemName: "chevron.left").font(.system(size: 16, weight: .semibold)).foregroundColor(.white)
                    }
                }
                ToolbarItem(placement: .principal) {
                    HStack(spacing: 6) {
                        Image(systemName: "brain.head.profile").font(.system(size: 14)).foregroundColor(.pink)
                        Text("Neuroscience").font(.system(size: 17, weight: .bold)).foregroundColor(.white)
                    }
                }
            }
        }
    }
    
    // MARK: - Header
    
    private var headerView: some View {
        VStack(spacing: 8) {
            Text("🧠").font(.system(size: 50))
            Text("KNOW YOUR BRAIN").font(.system(size: 22, weight: .black)).tracking(1).foregroundColor(.white)
            Text("They can only hack what you don't understand.\nOnce you know your own wiring, you become sovereign.")
                .font(.system(size: 11, weight: .medium)).foregroundColor(.white.opacity(0.35))
                .multilineTextAlignment(.center)
            
            // Quick stat
            HStack(spacing: 16) {
                statBadge("7", "Brain Regions")
                statBadge("5", "Neurochemicals")
                statBadge("4", "Defense Protocols")
            }
            .padding(.top, 6)
        }
    }
    
    private func statBadge(_ number: String, _ label: String) -> some View {
        VStack(spacing: 2) {
            Text(number).font(.system(size: 16, weight: .black)).foregroundColor(.pink)
            Text(label).font(.system(size: 8, weight: .bold)).foregroundColor(.white.opacity(0.3))
        }
    }
    
    // MARK: - Tab Selector
    
    private var tabSelector: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 8) {
                ForEach(NeuroTab.allCases, id: \.self) { tab in
                    Button {
                        withAnimation(.easeInOut(duration: 0.2)) { selectedTab = tab }
                    } label: {
                        VStack(spacing: 3) {
                            Text(tab.emoji).font(.system(size: 16))
                            Text(tab.label).font(.system(size: 8, weight: .bold)).tracking(0.5)
                                .foregroundColor(selectedTab == tab ? .black : .white.opacity(0.5))
                        }
                        .padding(.horizontal, 10).padding(.vertical, 8)
                        .background(Capsule().fill(selectedTab == tab ? Color.pink : Color.white.opacity(0.04)))
                    }
                }
            }
        }
    }
    
    // MARK: - Content Router
    
    @ViewBuilder
    private var contentForTab: some View {
        switch selectedTab {
        case .anatomy: anatomyTab
        case .chemistry: neurochemistryTab
        case .manipulation: manipulationTab
        case .loops: tribalLoopsTab
        case .defense: defenseProtocolsTab
        case .sovereignty: sovereigntyTab
        }
    }
    
    // MARK: - ═══════════════════════════════════════════════
    // TAB 1: BRAIN ANATOMY — "The Hardware"
    // ═══════════════════════════════════════════════════════
    
    private var anatomyTab: some View {
        VStack(spacing: 12) {
            sectionHeader("YOUR BRAIN'S HARDWARE", subtitle: "These are the structures that politicians, media, religion, and marketing target. They never taught you this in school — because an informed brain is harder to control.")
            
            expandableCard(
                id: "limbic_system",
                emoji: "🧠",
                title: "The Limbic System — Your Emotional Command Center",
                subtitle: "Decides what matters BEFORE you think",
                content: "The limbic system is a network of structures deep in the middle of the brain, wrapped around the brainstem. Its job: emotion, motivation, memory, threat detection, reward, and bonding.\n\nIt does NOT ask permission. It fires in milliseconds — faster than conscious thought. By the time you 'think' about something, your limbic system has already decided how you FEEL about it.\n\nThis is why a politician's words can make you angry or inspired BEFORE you've analyzed what they actually said. Your limbic system responds to tone, identity cues, and threat signals before your logical brain even turns on.\n\nThe limbic system isn't your enemy. It's ancient survival code running on modern hardware. When it 'hijacks' you, it thinks it's protecting you. The problem is that politicians, media, and institutions have learned to speak its language fluently.",
                detail: "If the prefrontal cortex is the CEO, the limbic system is the alarm system, the HR department, and the marketing team all screaming at once. Under stress, blood flow shifts AWAY from the prefrontal cortex (logic) and TOWARD limbic structures (emotion). That's why intelligent people say irrational things under threat. Biology, not stupidity.",
                color: .pink
            )
            
            expandableCard(
                id: "amygdala",
                emoji: "🔴",
                title: "Amygdala — The Threat Radar",
                subtitle: "Scans for danger faster than you can think",
                content: "The amygdala is your brain's threat detection system. It scans EVERYTHING — faces, tones, words, environments — for signs of danger, rejection, or social exclusion.\n\nIt fires in milliseconds. Before you consciously register a threat, your amygdala has already triggered a cascade:\n\n• Heart rate increases\n• Cortisol floods your system\n• Muscles tense\n• Attention narrows\n• Prefrontal cortex (logic) goes partially offline\n\nWHY THIS MATTERS FOR MANIPULATION:\nWhen a politician says 'They want to take your rights' or 'Our country is under attack,' your amygdala fires IMMEDIATELY. You feel threatened BEFORE you can evaluate whether the claim is true.\n\nOnce the amygdala is activated, you enter fight-or-flight mode. In this state, you simplify, polarize, and cling to whatever narrative promises safety. That's not weakness — it's biology being exploited.",
                detail: "Overactive amygdala = anxiety, hypervigilance, emotional reactivity. Chronic stress can keep the amygdala in a permanently heightened state — making you MORE susceptible to fear-based messaging. This is why constantly consuming fear-based news literally rewires your brain to be more afraid.",
                color: .red
            )
            
            expandableCard(
                id: "hippocampus",
                emoji: "🟣",
                title: "Hippocampus — The Memory Architect",
                subtitle: "Turns experiences into memories — and contextualizes fear",
                content: "The hippocampus converts short-term experiences into long-term memories. It also CONTEXTUALIZES fear — meaning it helps you understand WHETHER a threat is real based on past experience.\n\nWhen the hippocampus is healthy, it can tell your amygdala: 'Relax, we've seen this before, it's not actually dangerous.'\n\nBut chronic stress SHRINKS the hippocampus. Literally. Cortisol damages hippocampal neurons over time.\n\nWHY THIS MATTERS:\nWhen your hippocampus is impaired by chronic stress, your amygdala runs unchecked. You lose the ability to contextualize fear. Everything feels urgent. Every threat feels real. Memories fragment.\n\nThis is why people who consume constant fear-based media become progressively MORE reactive over time — their stress response is literally degrading the brain structure that would normally say 'calm down, think this through.'",
                detail: "PTSD involves hippocampal impairment — traumatic memories aren't properly contextualized, so they replay as if happening NOW. The same mechanism, at lower intensity, happens to anyone under chronic media-induced stress. Your memories become emotional reactions instead of analyzed experiences.",
                color: .purple
            )
            
            expandableCard(
                id: "hypothalamus",
                emoji: "🟡",
                title: "Hypothalamus — The Hormone Commander",
                subtitle: "Links your nervous system to your endocrine system",
                content: "The hypothalamus is tiny but controls nearly everything about your body's internal state: hunger, thirst, temperature, sleep, sex drive, circadian rhythm.\n\nIt links the nervous system to the endocrine (hormone) system via the pituitary gland. When your amygdala detects threat, the hypothalamus triggers the HPA axis (hypothalamic-pituitary-adrenal axis) — flooding your body with cortisol and adrenaline.\n\nWHY THIS MATTERS:\nManipulation doesn't just change your THOUGHTS. It changes your BODY. When political rhetoric triggers your amygdala, the hypothalamus converts that emotional response into physical stress — elevated cortisol, disrupted sleep, increased inflammation.\n\nChronic exposure to fear-based messaging literally makes you physically sick. Not metaphorically. Physiologically. The hypothalamus doesn't know the difference between a real threat and a politician on TV.",
                detail: "The hypothalamus also controls attachment behaviors, parenting instincts, fatigue, and circadian rhythms. When it's dysregulated by chronic stress, you get: insomnia, emotional eating, attachment issues, exhaustion, hormonal imbalance. The body keeps the score — because the hypothalamus is keeping it.",
                color: .yellow
            )
            
            expandableCard(
                id: "prefrontal",
                emoji: "🔵",
                title: "Prefrontal Cortex — The CEO",
                subtitle: "Logic, planning, impulse control — goes OFFLINE under threat",
                content: "The prefrontal cortex (PFC) is your brain's executive function center. It handles: logic, planning, decision-making, impulse control, abstract reasoning, and — critically — the ability to QUESTION what you're being told.\n\nIt's the most recently evolved part of the brain. It's also the most FRAGILE.\n\nUnder stress, blood flow redirects from the PFC to the limbic system. Your logic literally goes partially offline so your survival instincts can take over.\n\nWHY THIS MATTERS:\nEvery manipulation technique works by REDUCING prefrontal cortex activity. Fear shuts it down. Urgency shuts it down. Social pressure shuts it down. Moral certainty shuts it down.\n\nWhen someone tells you 'There's no time to think, just act!' or 'You're either with us or against us!' — they are deliberately trying to keep your PFC offline so your limbic system makes the decision.\n\nThe PFC is where critical thinking lives. It's the ONLY part of your brain that can ask: 'Wait — is this actually true?' That's why every manipulation technique is designed to bypass it.",
                detail: "The PFC doesn't fully develop until age ~25. This is why teenagers are more susceptible to peer pressure, impulsive decisions, and tribal identity. It's also why marketing, cults, and military recruitment specifically target young people — their CEO hasn't fully come online yet.",
                color: .blue
            )
            
            expandableCard(
                id: "cingulate",
                emoji: "🟠",
                title: "Cingulate Gyrus — Error Detection & Emotional Regulation",
                subtitle: "Notices when something doesn't add up",
                content: "The cingulate gyrus helps you detect errors, shift attention, and regulate emotions. It's the part of your brain that creates that 'something feels off' sensation.\n\nWhen you hear a politician say something that contradicts what they said last week, the cingulate gyrus fires a conflict signal. It's telling you: 'Wait, these two things don't match.'\n\nWHY THIS MATTERS:\nIf your amygdala is already activated (you're in threat mode), the cingulate's conflict signal gets SUPPRESSED. You literally lose the ability to notice contradictions when you're emotionally charged.\n\nThis is why people in highly tribal states can hold contradictory beliefs simultaneously — 'We support the troops AND we oppose veterans' benefits.' The cingulate would normally flag this. But under identity capture, it's silenced.",
                detail: "The cingulate also processes social pain — rejection, exclusion, betrayal. It fires when you feel 'left out.' This is why tribal messaging works: the cingulate makes social exclusion feel like PHYSICAL PAIN. Leaving your political tribe literally hurts the same way a broken bone hurts. Same brain region.",
                color: .orange
            )
            
            expandableCard(
                id: "basal_ganglia",
                emoji: "⚫",
                title: "Basal Ganglia — The Habit Machine",
                subtitle: "Turns repeated behaviors into automatic scripts",
                content: "The basal ganglia automate repeated behaviors into habits. Once something becomes a habit, it no longer requires conscious thought — it runs on autopilot.\n\nWHY THIS MATTERS FOR 'NPC' BEHAVIOR:\nWhen someone watches the same news channel every day, shares the same talking points, reacts to the same triggers the same way — that's basal ganglia automation. The behavior has become a SCRIPT.\n\nThe person isn't 'thinking' about their political position. They're EXECUTING a habit loop:\n\nTrigger → Talking Point → Social Reward → Repeat\n\nThis is literally what 'NPC behavior' means in neuroscience terms: the basal ganglia have automated the response so completely that the prefrontal cortex is no longer involved. The person isn't choosing to respond that way. They're running a program.\n\nBreaking these loops requires CONSCIOUS EFFORT — deliberately engaging the prefrontal cortex to interrupt the automated script. Most people never do this because the script feels natural. It IS natural. That's what makes it dangerous.",
                detail: "The basal ganglia don't distinguish between 'good' and 'bad' habits. Brushing your teeth and regurgitating Fox News talking points are stored the same way — as automated behavioral sequences. The brain treats both as efficient routines. Efficiency is not the same as truth.",
                color: Color(red: 0.3, green: 0.3, blue: 0.35)
            )
            
            insightCard(
                "THE SCHOOL NEVER TAUGHT YOU THIS",
                "The Prussian education model teaches you WHAT to think, not HOW your brain thinks. They never explain the limbic system, the amygdala, the prefrontal cortex, or how stress literally shuts down your ability to reason.\n\nWhy? Because an informed brain is harder to control. If you know that fear-based messaging targets your amygdala to shut down your prefrontal cortex, the technique becomes visible. And visible techniques lose their power.\n\nThat's why this module exists. Not to make you paranoid. To make you LITERATE in your own neurobiology. You can't defend what you don't understand.",
                color: .pink
            )
        }
    }
    
    // MARK: - ═══════════════════════════════════════════════
    // TAB 2: NEUROCHEMISTRY — "The Software"
    // ═══════════════════════════════════════════════════════
    
    private var neurochemistryTab: some View {
        VStack(spacing: 12) {
            sectionHeader("YOUR BRAIN'S SOFTWARE", subtitle: "These chemicals control how you feel, what you believe, who you trust, and what you do. Every manipulator speaks their language.")
            
            expandableCard(
                id: "dopamine",
                emoji: "⚡",
                title: "Dopamine — The Reward & Motivation Chemical",
                subtitle: "Not pleasure. ANTICIPATION of pleasure.",
                content: "Dopamine doesn't create pleasure — it creates WANTING. It fires when you ANTICIPATE a reward, not when you receive it. This is critical.\n\nWHY MANIPULATION EXPLOITS IT:\n• Social media 'likes' = dopamine hit from social approval\n• Political rallies = dopamine from tribal belonging\n• 'Breaking news' = dopamine from novelty\n• 'We're WINNING' = dopamine from anticipated victory\n• Streaks, badges, notifications = dopamine loops designed to keep you engaged\n\nDopamine makes you SEEK. Keep scrolling. Keep watching. Keep engaging. The content doesn't have to be true — it just has to trigger anticipation.\n\nWhen a politician says 'Big announcement coming soon!' — that's pure dopamine farming. The announcement itself is less important than the ANTICIPATION it creates.",
                detail: "Dopamine dysregulation is implicated in ADHD, addiction, and compulsive behavior. Social media platforms are DESIGNED to exploit dopamine loops — variable reward schedules (same technique as slot machines). Your news feed is a slot machine for your attention.",
                color: .yellow
            )
            
            expandableCard(
                id: "cortisol",
                emoji: "🔥",
                title: "Cortisol — The Stress Hormone",
                subtitle: "Keeps you in survival mode. Shuts down critical thinking.",
                content: "Cortisol is released when the HPA axis (hypothalamus → pituitary → adrenal glands) detects threat. Short-term, it's useful: increases alertness, energy, focus on the threat.\n\nChronic cortisol is DEVASTATING:\n• Shrinks the hippocampus (memory + fear contextualization)\n• Weakens immune system\n• Increases inflammation\n• Disrupts sleep\n• Causes weight gain (especially abdominal)\n• Impairs prefrontal cortex function\n\nWHY THIS MATTERS:\nFear-based news = chronic cortisol. Every 'BREAKING NEWS' alert, every 'democracy is dying' headline, every 'they're coming for you' narrative triggers cortisol release.\n\nOver months and years, this PHYSICALLY REWIRES your brain to be more anxious, less logical, and more susceptible to the next fear-based message. It's a feedback loop: fear media → cortisol → brain damage → more susceptible to fear media.\n\nThis is not metaphor. This is measurable neuroscience.",
                detail: "Studies show that people who watch fear-based news have measurably higher cortisol levels, worse sleep, higher anxiety, and reduced cognitive flexibility compared to people who limit news consumption. The news isn't informing you. It's dosing you.",
                color: .red
            )
            
            expandableCard(
                id: "oxytocin",
                emoji: "💗",
                title: "Oxytocin — The Bonding Chemical",
                subtitle: "Makes you trust your tribe. And distrust outsiders.",
                content: "Oxytocin is called the 'love hormone' but that's incomplete. It increases bonding, trust, and empathy — toward your IN-GROUP. It simultaneously increases suspicion and hostility toward OUT-GROUPS.\n\nWHY THIS MATTERS:\n• Church community = oxytocin bonding (strengthens loyalty)\n• Political rallies = oxytocin bonding (strengthens tribal identity)\n• 'We are family' messaging = oxytocin activation\n• Shared moral outrage = oxytocin bonding between participants\n\nOxytocin is why cult members feel LOVED. It's why political movements feel like FAMILY. It's why leaving a tribe feels like BETRAYAL — because oxytocin bonding creates real neurochemical attachment.\n\nThe love you feel in a group isn't fake. The chemistry is real. But it can be WEAPONIZED to prevent you from questioning the group — because questioning threatens the bond, and losing the bond triggers withdrawal.",
                detail: "Oxytocin increases trust in familiar faces and decreases trust in unfamiliar ones. This is why political messaging always creates 'us' vs 'them' — it leverages oxytocin to strengthen in-group loyalty while simultaneously creating hostility toward whoever is designated as the enemy.",
                color: .pink
            )
            
            expandableCard(
                id: "serotonin",
                emoji: "🌊",
                title: "Serotonin — Mood, Status, and Social Hierarchy",
                subtitle: "Low serotonin = susceptible to authoritarian messaging",
                content: "Serotonin regulates mood, social status perception, and feelings of well-being. When serotonin is balanced, you feel calm, confident, and socially secure.\n\nWhen serotonin is LOW:\n• Increased anxiety and irritability\n• Heightened sensitivity to social rejection\n• Greater susceptibility to authoritarian messaging\n• Attraction to rigid hierarchies (they reduce uncertainty)\n• Need for strong leaders and clear rules\n\nWHY THIS MATTERS:\nSocieties under economic stress, social disruption, or uncertainty tend to have populations with lower average serotonin function (due to chronic stress). These populations are MORE attracted to authoritarian leaders who promise certainty, order, and strong hierarchy.\n\n'Make America Great Again' is serotonin messaging — it promises return to a stable social order where roles were clear and hierarchy was unquestioned. It appeals most to people whose serotonin system is depleted by economic anxiety and social uncertainty.",
                detail: "Research on serotonin in primates shows that dominant animals have higher serotonin levels. When status is threatened, serotonin drops, and aggressive/defensive behaviors increase. Political movements that promise to 'restore your rightful place' are speaking directly to serotonin-depleted brains seeking status recovery.",
                color: .cyan
            )
            
            expandableCard(
                id: "norepinephrine",
                emoji: "⚠️",
                title: "Norepinephrine — The Arousal Chemical",
                subtitle: "Makes you alert, focused, and ready to act — or overreact",
                content: "Norepinephrine increases alertness, arousal, and attention. In moderate amounts, it sharpens focus. In excess, it creates hypervigilance, anxiety, and panic.\n\nWHY THIS MATTERS:\n'Breaking news' alerts trigger norepinephrine. The jolt you feel — that sudden 'what happened?' — is norepinephrine making you pay attention NOW.\n\nMedia companies know this. Every notification, every urgent headline, every 'developing story' is engineered to trigger norepinephrine release. Not to inform you. To CAPTURE YOUR ATTENTION.\n\nOnce norepinephrine has your attention, dopamine keeps you scrolling, cortisol keeps you anxious, and oxytocin bonds you to whatever tribe is promising safety.\n\nIt's a neurochemical pipeline:\nNorepinephrine (ALERT!) → Cortisol (FEAR!) → Oxytocin (TRIBE!) → Dopamine (MORE!)",
                detail: "The 'attention economy' is not a metaphor. It is a literal neurochemical extraction operation. Your norepinephrine, dopamine, cortisol, and oxytocin are being deliberately triggered to capture and monetize your attention. Your neurochemistry is the product being sold.",
                color: .orange
            )
            
            insightCard(
                "THE NEUROCHEMICAL PIPELINE",
                "Every manipulation follows the same neurochemical sequence:\n\n1. NOREPINEPHRINE — Get attention ('Breaking news!')\n2. CORTISOL — Create fear ('Democracy under attack!')\n3. AMYGDALA — Shut down logic (prefrontal cortex goes offline)\n4. OXYTOCIN — Offer tribal safety ('We are the solution')\n5. DOPAMINE — Reward engagement ('Share this! Like this! Fight!')\n\nOnce you see this pipeline, you can't unsee it. Every political ad, every news segment, every social media outrage cycle follows this exact sequence. It's not conspiracy. It's neurochemistry meeting mass communication.",
                color: .pink
            )
        }
    }
    
    // MARK: - ═══════════════════════════════════════════════
    // TAB 3: HOW MANIPULATION TARGETS YOUR BRAIN
    // ═══════════════════════════════════════════════════════
    
    private var manipulationTab: some View {
        VStack(spacing: 12) {
            sectionHeader("HOW THEY TARGET YOU", subtitle: "Not sci-fi. Not subliminal. Just neurobiology + rhetoric. They leverage predictable neural shortcuts that evolution installed 200,000 years ago.")
            
            expandableCard(
                id: "threat_relief",
                emoji: "🔄",
                title: "The Threat → Relief → Belonging Loop",
                subtitle: "The most powerful manipulation technique in existence",
                content: "Every effective manipulation follows this three-step loop:\n\nSTEP 1: TRIGGER FEAR\n'Democracy is under attack.' / 'They're taking your jobs.' / 'Your children are in danger.'\nAmygdala activates. Uncertainty spikes. Cortisol floods the system. Prefrontal cortex goes partially offline.\n\nSTEP 2: OFFER RELIEF\n'We are the defenders of freedom.' / 'Only WE can fix this.' / 'We will protect your family.'\nOxytocin and dopamine nudge belonging and moral affirmation. Cortisol drops slightly. You feel SAFER.\n\nSTEP 3: PROVIDE BEHAVIORAL CUE\n'Stand with us.' / 'Vote for us.' / 'Share this.' / 'Donate now.'\nNow your action feels like protection AND virtue. You're not just supporting a politician. You're SAVING yourself.\n\nThe brain loves coherence. If a message reduces anxiety AND increases identity stability, it FEELS true. Not logically true. Neurologically smooth. That smoothness becomes conviction.",
                detail: "This loop is identical across: political campaigns, religious conversion, cult recruitment, marketing, military propaganda, and corporate culture. The content changes. The neurological mechanism never does.",
                color: .red
            )
            
            expandableCard(
                id: "motivated_reasoning",
                emoji: "🪞",
                title: "Motivated Reasoning — Believing What Feels Good",
                subtitle: "Your brain defends identity before it evaluates truth",
                content: "Motivated reasoning is the brain's tendency to evaluate information based on whether it SUPPORTS or THREATENS your existing identity — before evaluating whether it's TRUE.\n\nHere's what happens in your brain:\n\n1. You encounter new information\n2. BEFORE conscious analysis, your brain checks: 'Does this support my identity?'\n3. If YES → brain releases reward signals, information 'feels right,' you accept it\n4. If NO → brain releases threat signals, information 'feels wrong,' you reject it\n5. THEN your prefrontal cortex constructs logical-SOUNDING reasons to justify the emotional decision already made\n\nThis is robustly documented in political psychology. Princeton study (2014): People shown IDENTICAL data drew OPPOSITE conclusions depending on whether the data supported their political identity.\n\nYou're not choosing your beliefs. Your limbic system is choosing them, and your prefrontal cortex is writing the press release.",
                detail: "This is why showing someone evidence that contradicts their beliefs often STRENGTHENS those beliefs (the 'backfire effect'). The evidence triggers identity threat → amygdala activation → defensive response → belief becomes MORE entrenched. Logic doesn't defeat identity. Understanding neuroscience does.",
                color: .purple
            )
            
            expandableCard(
                id: "identity_capture",
                emoji: "🔒",
                title: "Identity Capture — When Your Beliefs Become 'You'",
                subtitle: "Disagreement = betrayal. Questions = threat.",
                content: "The most dangerous moment in any manipulation is when a BELIEF becomes part of your IDENTITY.\n\nBefore identity capture: 'I support Policy X because I've evaluated it.'\nAfter identity capture: 'I AM a supporter of X. Questioning X is questioning ME.'\n\nOnce a belief becomes identity:\n• Challenging the belief triggers the SAME brain response as physical attack\n• The cingulate gyrus fires social pain signals (rejection/exclusion)\n• The amygdala treats the questioner as an ENEMY\n• The prefrontal cortex constructs defense rather than evaluation\n• Leaving the belief feels like DEATH (because identity death triggers the same circuits as anticipated physical death)\n\nThis is why people can be shown clear evidence that their leader lied and respond with MORE loyalty, not less. The evidence threatens identity, not just a belief. And the brain protects identity at all costs.",
                detail: "Every cult, every political movement, every religion that demands total loyalty uses identity capture. The technique: make the belief inseparable from self-worth. 'If you're a REAL patriot...' 'If you TRULY believe...' 'If you're one of US...' These phrases fuse belief with identity. Once fused, the belief becomes neurologically unquestionable.",
                color: .red
            )
            
            expandableCard(
                id: "moral_elevation",
                emoji: "✨",
                title: "Moral Elevation — Feeling Righteous Without Being Right",
                subtitle: "Vague words that feel profound but say nothing",
                content: "Words like justice, dignity, freedom, compassion, democracy, faith are abstract but emotionally LOADED. They activate stored emotional associations in memory networks linked to the hippocampus.\n\nThe content is vague. The emotion is NOT.\n\nVague language lets the listener PROJECT their own meaning into it. That projection feels SELF-GENERATED, which strengthens commitment. You think YOU came up with the interpretation. You didn't — you were given an empty vessel and filled it with your own desires.\n\nWHEN SOMEONE SAYS 'I stand for freedom':\n• They haven't defined freedom\n• They haven't specified whose freedom\n• They haven't acknowledged tradeoffs\n• But your brain FEELS like they've said something profound\n\nThat feeling of profundity is moral elevation — a neurological state where you feel virtuous by ASSOCIATION with virtuous-sounding language. No policy needed. No specifics needed. Just the FEELING of righteousness.",
                detail: "Test it: When a politician says something that makes you feel morally elevated, ask: 'What specific mechanism achieves this?' 'What measurable outcome defines success?' 'What tradeoffs exist?' If the statement collapses under specificity, it was emotional scaffolding, not structural argument.",
                color: .yellow
            )
            
            expandableCard(
                id: "tribal_wiring",
                emoji: "🏕️",
                title: "Tribal Wiring — Why Exclusion Feels Like Death",
                subtitle: "200,000 years of evolution meets mass media",
                content: "Humans evolved in small tribes of 50-150 people. For 99% of human history, exclusion from the tribe meant DEATH. No tribe = no protection, no food, no reproduction.\n\nYour limbic system STILL operates on this wiring. Social exclusion activates the SAME brain regions as physical pain (anterior cingulate cortex). Being rejected by your group literally hurts.\n\nWHY MANIPULATION EXPLOITS THIS:\nWhen a political movement says 'You're either with us or against us,' your brain hears: 'Stay in the tribe or DIE.' Not consciously. Limbically.\n\nThe fear of exclusion is more powerful than the love of truth. This is why people will defend beliefs they KNOW are wrong rather than risk tribal expulsion. The neurological cost of being 'right but alone' is higher than the cost of being 'wrong but belonging.'\n\nEvery cult, every political extremist group, every authoritarian movement uses this: make leaving TERRIFYING. Not through physical threat — through social death. Your nervous system can't tell the difference.",
                detail: "Dunbar's number (~150) is the approximate number of stable social relationships your brain can maintain. Social media creates the ILLUSION of thousands of tribal connections. But your limbic system still operates on tribal logic — which is why online mob behavior mirrors ancient tribal warfare. The scale changed. The wiring didn't.",
                color: .green
            )
            
            insightCard(
                "WHY KNOWING THIS MATTERS",
                "You are not stupid for being manipulated. You are HUMAN. These techniques work because they exploit hardware that kept your ancestors alive for 200,000 years.\n\nBut once you SEE the technique, it loses most of its power. When you feel fear spike from a headline, you can now say: 'That's my amygdala. Let me engage my prefrontal cortex before I react.'\n\nThe technique doesn't disappear. But its AUTOMATIC power does. You go from unconscious reaction to conscious choice. That's the difference between being programmed and being sovereign.",
                color: .cyan
            )
        }
    }
    
    // MARK: - ═══════════════════════════════════════════════
    // TAB 4: TRIBAL LOOPS & NPC SCRIPTS
    // ═══════════════════════════════════════════════════════
    
    private var tribalLoopsTab: some View {
        VStack(spacing: 12) {
            sectionHeader("NPC SCRIPTS & TRIBAL LOOPS", subtitle: "When the basal ganglia automate political responses, people stop thinking and start executing scripts. Here's what that looks like — and how the loop runs.")
            
            expandableCard(
                id: "npc_definition",
                emoji: "🤖",
                title: "What 'NPC Behavior' Actually Means (Neuroscience)",
                subtitle: "It's not an insult. It's a description of automated brain function.",
                content: "In gaming, an NPC (Non-Player Character) follows pre-written scripts. They say the same things, respond to the same triggers the same way, and cannot deviate from their programming.\n\nIn neuroscience terms, 'NPC behavior' describes a state where:\n\n1. The basal ganglia have automated political responses into HABITS\n2. The prefrontal cortex is no longer involved in evaluating those responses\n3. The person is executing a SCRIPT, not thinking\n\nThe script loop:\nTRIGGER (political topic) → TALKING POINT (pre-loaded response) → SOCIAL REWARD (tribal approval) → REINFORCEMENT (repeat)\n\nAfter enough repetitions, this loop runs WITHOUT conscious thought. The person isn't choosing to respond — they're executing a stored behavioral sequence.\n\nThis happens on EVERY side of the political spectrum. It's not partisan. It's neurological. Anyone who consumes the same messaging repeatedly, in an echo chamber, without deliberate critical friction, develops automated responses.",
                detail: "The tell: if someone responds to a complex question with a SLOGAN instead of a thought, the basal ganglia are running the show. 'Make America Great Again,' 'Trust the Science,' 'Back the Blue,' 'Defund the Police' — these aren't arguments. They're compiled scripts. The person isn't thinking. They're executing.",
                color: .gray
            )
            
            expandableCard(
                id: "npc_loop_code",
                emoji: "💻",
                title: "The NPC Loop — In Code",
                subtitle: "What's actually running in the brain",
                content: "Here's the NPC attack script (as pseudocode):\n\nIF enemy_detected:\n    LOAD attack_script\n    EXECUTE talking_points\n    AWAIT counter_attack\n    RECEIVE dopamine_reward (tribal approval)\n    LOOP\n\nThe script EXPECTS counter-attack. It's DESIGNED for conflict. Conflict confirms identity. Identity triggers oxytocin. Oxytocin reinforces belonging. Belonging triggers dopamine. Dopamine reinforces the behavior.\n\nThe loop is SELF-SUSTAINING. The person doesn't need external motivation — the neurochemistry rewards the behavior automatically.\n\nThis is why political arguments on social media never end. Both sides are running self-reinforcing loops. Neither side is THINKING. Both sides are EXECUTING. And both sides are getting neurochemical rewards for doing so.",
                detail: "The algorithms know this. Social media platforms are optimized to maximize engagement. Conflict = engagement. Engagement = ad revenue. The platforms are DESIGNED to trigger NPC loops because NPC loops generate the most clicks, shares, and time-on-platform. You're not arguing with a person. You're arguing with an algorithm that's using a person as a puppet.",
                color: Color(red: 0.3, green: 0.3, blue: 0.35)
            )
            
            expandableCard(
                id: "four_oh_four",
                emoji: "💗",
                title: "THE 404 LOVE RESPONSE PROTOCOL",
                subtitle: "How to crash an NPC's script with one sentence",
                content: "The NPC script has handlers for:\n• Anger → Counter with more anger\n• Facts → Deflect with talking points\n• Insults → Victim narrative + counter-insult\n• Logic → Whataboutism\n\nThe NPC script has NO HANDLER for:\n• Genuine kindness\n• Unexpected love\n• Calm empathy\n\nWhen you reply to a political attack with:\n'You are loved.' 💙\n'I hope you're okay. Sending you love.' 💗\n'I see you're in pain. I hope you find peace.'\n\nThe brain encounters INPUT it has no SCRIPT for:\n\nIF love_received:\n    ERROR: unexpected_input\n    SCRIPT_NOT_FOUND for 'respond_to_kindness'\n    SYSTEM_PAUSE\n    // NPC confused\n    // Loop broken\n    // Prefrontal cortex briefly re-engages\n\nYou are literally injecting a RUNTIME ERROR into their programming by giving them input they have no automated response for.\n\nIt won't change their mind immediately. But it PAUSES the loop. And in that pause, the prefrontal cortex — even briefly — comes back online.\n\nThat moment of confusion IS the crack in the programming.",
                detail: "DO NOT ARGUE. DO NOT ENGAGE THE SCRIPT. DO NOT MATCH ENERGY.\n\nArguing is the expected input. It confirms their programming. It gives them the enemy they need to justify the script.\n\nLove is the unexpected input. It crashes the loop. It doesn't compute. And it costs you NOTHING except the ego satisfaction of 'winning' an argument that was never going to change anyone's mind anyway.",
                color: .pink
            )
            
            expandableCard(
                id: "both_sides_npc",
                emoji: "⚖️",
                title: "Both Sides Have NPCs — But the Scripts Differ",
                subtitle: "Honest assessment, not tribal cheerleading",
                content: "MAGA NPC scripts tend to run on:\n• Legacy code (pre-civil rights era nostalgia)\n• Authoritarian hierarchy (strong leader, don't question)\n• Fear of change (demographic, cultural, social)\n• Identity as resistance against 'elites'\n• Script version: 1.0 — seeks to RESTORE previous state\n\nDemocrat NPC scripts tend to run on:\n• Updated code (modern social frameworks)\n• Moral superiority (we're on the right side of history)\n• Fear of regression (they'll take our rights)\n• Identity as enlightened progressive\n• Script version: 2.0 — seeks to ADVANCE to new state\n\nAwakened consciousness runs on:\n• No script — pattern recognition instead\n• Questions BOTH sides\n• Follows evidence, not identity\n• Demands specifics, rejects slogans\n• Asks 'who benefits?' regardless of party\n• Can hold complexity without collapsing into tribalism\n\nThe awakened position is not 'both sides are the same.' It's 'both sides use the same neurological techniques, and I refuse to let either one automate my thinking.'",
                detail: "Being awakened doesn't mean having no values. It means your VALUES drive your analysis instead of your TRIBE driving your values. You can support a policy because you've evaluated it — not because your team told you to.",
                color: .cyan
            )
            
            insightCard(
                "THE REAL LIBERATION",
                "You don't need to win arguments. You don't need to change minds. You don't need to defeat the 'other side.'\n\nYou just need to stop running scripts.\n\nWhen you catch yourself reacting automatically to a political trigger — PAUSE. That pause is your prefrontal cortex waking up. That's where sovereignty lives.\n\nThe NPC can't pause. The NPC can't question its own script. The NPC can't ask 'Am I thinking, or am I executing?'\n\nYou just asked that question. That means you're already free.",
                color: .pink
            )
        }
    }
    
    // MARK: - ═══════════════════════════════════════════════
    // TAB 5: DEFENSE PROTOCOLS
    // ═══════════════════════════════════════════════════════
    
    private var defenseProtocolsTab: some View {
        VStack(spacing: 12) {
            sectionHeader("DEFENSE PROTOCOLS", subtitle: "Now that you know the hardware, the software, and the attack vectors — here's how to defend against them. Not cynicism. Cognitive friction.")
            
            expandableCard(
                id: "cognitive_friction",
                emoji: "🛑",
                title: "Protocol 1: Cognitive Friction",
                subtitle: "Insert a PAUSE between stimulus and response",
                content: "The entire manipulation pipeline depends on SPEED. Amygdala fires fast. Cortisol floods fast. Identity defense is instant.\n\nYour defense is SLOWNESS.\n\nWhen you encounter ANY message that triggers strong emotion — positive or negative — insert friction:\n\n1. NOTICE the emotion ('I feel angry/inspired/afraid')\n2. NAME the brain structure ('That's my amygdala firing')\n3. PAUSE before responding (even 10 seconds helps)\n4. ASK: 'What specific claim is being made?'\n5. ASK: 'What evidence supports this?'\n6. ASK: 'Who benefits if I believe this?'\n7. ASK: 'What am I NOT being told?'\n\nIf the message collapses under these questions, it was emotional manipulation, not information.\n\nCognitive friction is not paranoia. It's the prefrontal cortex doing its job — the job that manipulation tries to prevent.",
                detail: nil,
                color: .blue
            )
            
            expandableCard(
                id: "identity_separation",
                emoji: "🔓",
                title: "Protocol 2: Identity Separation",
                subtitle: "Your beliefs are not you. Challenge them freely.",
                content: "The most powerful defense against identity capture:\n\nSeparate your BELIEFS from your IDENTITY.\n\n'I currently hold Position X based on available evidence' is healthy.\n'I AM Position X' is identity capture.\n\nWhen you can say 'I was wrong about this and I've updated my position' WITHOUT feeling like you've died — you're free. Your identity is no longer held hostage by any belief, party, leader, or movement.\n\nPractice: Deliberately steelman the OTHER side's best argument. Not the worst strawman version. The actual best case. If you can't do this without emotional resistance, identity capture has occurred.\n\nThe ability to seriously consider opposing views without emotional distress is the hallmark of prefrontal sovereignty.",
                detail: nil,
                color: .green
            )
            
            expandableCard(
                id: "follow_money",
                emoji: "💰",
                title: "Protocol 3: Follow the Money",
                subtitle: "Cui bono? Who benefits?",
                content: "Every piece of information exists in an economy. Someone BENEFITS from you believing it.\n\nWhen you encounter any claim — political, religious, commercial, social — ask:\n\n• Who financially benefits if this is believed?\n• Who gains power if this is believed?\n• Who loses if this is questioned?\n• What is the business model of the source?\n\nNews channels need RATINGS (fear = ratings).\nPoliticians need VOTES (tribal loyalty = votes).\nSocial media needs ENGAGEMENT (outrage = engagement).\nReligion needs TITHES (faith = tithes).\nCorporations need CONSUMERS (insecurity = consumption).\n\nNone of these entities are primarily interested in your well-being. They're interested in your ATTENTION, your MONEY, or your COMPLIANCE.\n\nFollowing the money doesn't make you cynical. It makes you literate in how incentive structures shape the information you receive.",
                detail: nil,
                color: .yellow
            )
            
            expandableCard(
                id: "love_response",
                emoji: "💗",
                title: "Protocol 4: The Love Response",
                subtitle: "The 404 Error for programmed humans",
                content: "When engaging with someone running tribal scripts:\n\nDO NOT:\n• Argue (feeds the loop)\n• Match their energy (confirms the script)\n• Try to 'win' (there is no winning against automation)\n• Present facts against identity (triggers backfire effect)\n\nDO:\n• Respond with genuine kindness\n• 'You are loved.' 💙\n• 'I hope you're doing okay.'\n• 'I see you're passionate about this. I respect that.'\n• Or simply: drop a heart and move on\n\nWHY:\nKindness is the one input that has no counter-script. The tribal program was built for WAR. It has attack handlers, defense handlers, deflection handlers. It has NO handler for unconditional positive regard.\n\nThe brief confusion that kindness creates IS the crack. It won't transform them instantly. But it breaks the automatic loop — even for a moment. And in that moment, the prefrontal cortex flickers back on.\n\nThat flicker is more valuable than a thousand arguments.",
                detail: nil,
                color: .pink
            )
            
            insightCard(
                "THE ULTIMATE DEFENSE",
                "You don't need to be right. You need to be FREE.\n\nFreedom isn't having the correct political position. It's having a brain that can evaluate ANY position without emotional hijacking.\n\nThe four protocols work together:\n1. FRICTION slows the limbic response\n2. IDENTITY SEPARATION prevents belief from becoming self\n3. FOLLOW THE MONEY reveals the incentive structure\n4. LOVE RESPONSE disarms programmed people without feeding their loop\n\nThis is neurological sovereignty. This is what they never taught you. This is SunFlow.",
                color: .cyan
            )
        }
    }
    
    // MARK: - ═══════════════════════════════════════════════
    // TAB 6: SOVEREIGNTY
    // ═══════════════════════════════════════════════════════
    
    private var sovereigntyTab: some View {
        VStack(spacing: 12) {
            sectionHeader("LIMBIC SOVEREIGNTY", subtitle: "Your limbic system isn't the enemy. It's ancient survival code that served your ancestors for 200,000 years. Sovereignty means working WITH it — not being enslaved by those who exploit it.")
            
            expandableCard(
                id: "not_enemy",
                emoji: "🤝",
                title: "Your Limbic System Is Not Your Enemy",
                subtitle: "It's protecting you. It just doesn't know it's 2026.",
                content: "Your amygdala kept your ancestors alive when a rustle in the grass meant a predator. Your oxytocin bonding kept tribes cohesive when isolation meant death. Your dopamine system motivated action when survival required effort.\n\nThese systems aren't broken. They're ANCIENT — designed for a world of immediate physical threats, small tribes, and scarce resources.\n\nThe problem isn't your brain. The problem is that modern institutions have learned to EXPLOIT this ancient hardware:\n\n• Politicians trigger your amygdala with threats that are rarely immediate\n• Social media hijacks your dopamine with artificial rewards\n• News channels flood you with cortisol to keep you watching\n• Religions leverage oxytocin to maintain tribal loyalty\n• Corporations exploit serotonin insecurity to sell you products\n\nSovereignty isn't suppressing these systems. It's KNOWING them well enough to choose when they serve you and when they're being exploited.",
                detail: nil,
                color: .green
            )
            
            expandableCard(
                id: "meditation_science",
                emoji: "🧘",
                title: "The Science of Calming the System",
                subtitle: "Meditation literally changes brain structure",
                content: "This isn't woo-woo. This is documented neuroscience:\n\n• 8 weeks of mindfulness meditation measurably REDUCES amygdala volume (less reactive to threats)\n• Meditation INCREASES prefrontal cortex thickness (better executive function)\n• Regular practice STRENGTHENS hippocampal function (better memory, better fear contextualization)\n• Slow breathing activates the vagus nerve, which DIRECTLY calms the fight-or-flight response\n\nYou're not 'relaxing.' You're literally UPGRADING your neural hardware.\n\nEvery minute of meditation is a minute your prefrontal cortex trains to override automatic limbic responses. Over time, the balance shifts: you become LESS reactive, MORE deliberate, HARDER to manipulate.\n\nThis is why every ancient wisdom tradition included some form of contemplative practice. Not because they understood fMRI scans. Because they observed the results. The science just confirmed what practitioners knew for thousands of years.",
                detail: "Studies: Hölzel et al. (2011) — 8 weeks of MBSR reduced amygdala gray matter density. Lazar et al. (2005) — meditation associated with increased cortical thickness in prefrontal regions. Desbordes et al. (2012) — amygdala response to emotional stimuli decreased after mindfulness training even outside meditation.",
                color: .purple
            )
            
            expandableCard(
                id: "sunflow_brain",
                emoji: "☀️",
                title: "The SunFlow Brain — What Sovereignty Looks Like",
                subtitle: "Not emotionless. Not cynical. AWARE.",
                content: "The sovereign brain isn't the brain that feels nothing. It's the brain that FEELS everything — and then CHOOSES its response.\n\n• Amygdala fires → you NOTICE it instead of being controlled by it\n• Cortisol rises → you NAME it instead of drowning in it\n• Dopamine pulls → you RECOGNIZE the reward trap instead of chasing it\n• Oxytocin bonds → you APPRECIATE connection without surrendering identity\n• Tribal pressure builds → you QUESTION instead of conforming\n\nThis is what SunFlow means at the neuroscience level: a brain that has MASTERED its own wiring instead of being mastered BY it.\n\nNot through suppression. Through LITERACY.\n\nYou can't defend what you don't understand. Now you understand. The hardware. The software. The attack vectors. The defense protocols.\n\nYour brain is the most complex object in the known universe. And nobody taught you how it works — because an informed brain is harder to control.\n\nNow you're informed. Now you're sovereign. Now you're SunFlow.",
                detail: nil,
                color: Color(red: 1.0, green: 0.85, blue: 0.3)
            )
            
            insightCard(
                "THE FINAL TRUTH",
                "They can only hack what you don't understand.\n\nNow you understand your amygdala, your hippocampus, your hypothalamus, your prefrontal cortex, your basal ganglia. You understand dopamine, cortisol, oxytocin, serotonin, norepinephrine.\n\nYou understand the Threat → Relief → Belonging loop. You understand motivated reasoning. You understand identity capture. You understand NPC scripts.\n\nAnd you have the four defense protocols: Cognitive Friction, Identity Separation, Follow the Money, and the Love Response.\n\nYou are no longer hackable. Not because you're immune to emotion — but because you're LITERATE in how your emotions are exploited.\n\nThat literacy is the most dangerous thing you can have. Dangerous to the systems that need you asleep.\n\nWelcome to sovereignty. ☀️🧠",
                color: Color(red: 1.0, green: 0.85, blue: 0.3)
            )
            
            sourceCard("Sources: Joseph LeDoux — The Emotional Brain (1996); Daniel Kahneman — Thinking, Fast and Slow (2011); Robert Sapolsky — Behave: The Biology of Humans at Our Best and Worst (2017); Antonio Damasio — Descartes' Error (1994); Bessel van der Kolk — The Body Keeps the Score (2014); Jonathan Haidt — The Righteous Mind (2012); Hölzel et al. — Mindfulness practice leads to increases in regional brain gray matter density (2011); Gilens & Page — Testing Theories of American Politics (Princeton, 2014)")
        }
    }
    
    // MARK: - ═══════════════════════════════════════════════
    // SHARED COMPONENTS
    // ═══════════════════════════════════════════════════════
    
    private func sectionHeader(_ title: String, subtitle: String) -> some View {
        VStack(spacing: 6) {
            Text(title).font(.system(size: 12, weight: .black)).tracking(2).foregroundColor(.white.opacity(0.4))
            Text(subtitle).font(.system(size: 11, weight: .medium)).foregroundColor(.white.opacity(0.3)).multilineTextAlignment(.center)
        }
        .padding(.bottom, 4)
    }
    
    private func expandableCard(id: String, emoji: String, title: String, subtitle: String, content: String, detail: String?, color: Color) -> some View {
        VStack(alignment: .leading, spacing: 0) {
            Button {
                withAnimation(.easeInOut(duration: 0.2)) {
                    if expandedCards.contains(id) { expandedCards.remove(id) }
                    else { expandedCards.insert(id) }
                }
            } label: {
                HStack(spacing: 10) {
                    Text(emoji).font(.system(size: 20)).frame(width: 30)
                    VStack(alignment: .leading, spacing: 2) {
                        Text(title).font(.system(size: 13, weight: .bold)).foregroundColor(.white)
                        Text(subtitle).font(.system(size: 10, weight: .medium)).foregroundColor(.white.opacity(0.35))
                    }
                    Spacer()
                    Image(systemName: expandedCards.contains(id) ? "chevron.up" : "chevron.down")
                        .font(.system(size: 10)).foregroundColor(.white.opacity(0.2))
                }
                .padding(12)
            }
            
            if expandedCards.contains(id) {
                VStack(alignment: .leading, spacing: 10) {
                    Text(content).font(.system(size: 12, weight: .medium)).foregroundColor(.white.opacity(0.6)).lineSpacing(3)
                    
                    if let detail = detail {
                        Text(detail).font(.system(size: 11, weight: .medium)).foregroundColor(color.opacity(0.5)).lineSpacing(3)
                            .padding(10).frame(maxWidth: .infinity, alignment: .leading)
                            .background(RoundedRectangle(cornerRadius: 8).fill(color.opacity(0.03)))
                    }
                }
                .padding(.horizontal, 12).padding(.bottom, 12)
            }
        }
        .background(RoundedRectangle(cornerRadius: 12).fill(Color.white.opacity(0.02))
            .overlay(RoundedRectangle(cornerRadius: 12).stroke(color.opacity(0.06), lineWidth: 1)))
    }
    
    private func insightCard(_ title: String, _ text: String, color: Color) -> some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack(spacing: 6) {
                Image(systemName: "brain.head.profile").font(.system(size: 11)).foregroundColor(color)
                Text(title).font(.system(size: 11, weight: .bold)).foregroundColor(color)
            }
            Text(text).font(.system(size: 12, weight: .medium)).foregroundColor(.white.opacity(0.6)).lineSpacing(3)
        }
        .padding(14).background(RoundedRectangle(cornerRadius: 12).fill(color.opacity(0.03))
            .overlay(RoundedRectangle(cornerRadius: 12).stroke(color.opacity(0.1), lineWidth: 1)))
    }
    
    private func sourceCard(_ text: String) -> some View {
        Text(text).font(.system(size: 9, weight: .medium)).foregroundColor(.white.opacity(0.15)).lineSpacing(2)
            .padding(10).background(RoundedRectangle(cornerRadius: 8).fill(Color.white.opacity(0.01)))
    }
}

// MARK: - ═══════════════════════════════════════════════════
// TAB ENUM
// ═══════════════════════════════════════════════════════════

enum NeuroTab: String, CaseIterable {
    case anatomy = "The Hardware"
    case chemistry = "The Software"
    case manipulation = "Attack Vectors"
    case loops = "NPC Scripts"
    case defense = "Defense"
    case sovereignty = "Sovereignty"
    
    var emoji: String {
        switch self {
        case .anatomy: return "🧠"
        case .chemistry: return "⚗️"
        case .manipulation: return "🎯"
        case .loops: return "🤖"
        case .defense: return "🛡️"
        case .sovereignty: return "☀️"
        }
    }
    
    var label: String { rawValue.uppercased() }
}
