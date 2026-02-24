// MoneyIsEnergyCourse.swift
// SunFlow: Reignited — Aperture
// "Money Is Energy" — The operating manual they've been hiding

import SwiftUI

// MARK: - Data Model

struct MoneyEnergyLesson: Identifiable {
    let id: String
    let number: Int
    let title: String
    let icon: String
    let tagline: String
    let readTime: Int
    let body: String
}

struct MoneyEnergyProgress: Codable {
    var completedLessons: Set<String> = []
    mutating func complete(_ id: String) { completedLessons.insert(id) }
    func isComplete(_ id: String) -> Bool { completedLessons.contains(id) }
    func save() { try? UserDefaults.standard.set(JSONEncoder().encode(self), forKey: "money_energy_progress") }
    static func load() -> MoneyEnergyProgress {
        guard let data = UserDefaults.standard.data(forKey: "money_energy_progress"),
              let p = try? JSONDecoder().decode(MoneyEnergyProgress.self, from: data) else { return MoneyEnergyProgress() }
        return p
    }
}

// MARK: - Course Lessons

let moneyEnergyLessons: [MoneyEnergyLesson] = [

    MoneyEnergyLesson(
        id: "me_01",
        number: 1,
        title: "The First Lie: What Money Actually Is",
        icon: "dollarsign.circle.fill",
        tagline: "You think money is numbers. That's exactly what they need you to believe.",
        readTime: 7,
        body: """
**Stop treating money like a thing.**

You've been taught that money is coins, paper, digital transfers between accounts. A finite resource you earn through labor, manage through discipline, and accumulate through sacrifice. That framing isn't neutral — it's engineered. And it keeps you exactly where the system needs you.

Here's what money actually is: **condensed human energy given form.** It responds to the same fundamental laws that govern electricity, magnetism, and quantum fields — because everything in the physical world is ultimately energy in different states of density and vibration.

**E = MC² Is a Money Equation**

In 1905, Einstein published his most famous equation: Energy equals mass times the speed of light squared. Most people think this is only about nuclear physics. It isn't. What Einstein proved is that matter and energy are the same substance in different states.

Ice, water, steam. Same molecule — different frequency.
Wood, fire, ash. Same matter — different energetic expression.

Your current financial reality is energy locked into a specific pattern. And patterns can be changed. This isn't metaphor. This is foundational physics applied to the one domain most people treat as purely mechanical.

**Why You Were Never Taught This**

Think carefully about why the educational system teaches you *how* to work for money but never *how money works* at its fundamental level. Why economics courses teach scarcity theory but never energy theory. Why financial literacy programs focus on budgeting and debt management but never on the vibrational mechanics underlying why wealth flows toward certain people and away from others.

The system functions on the belief that money is scarce, logical, and earned only through suffering. Because if the majority understood that money operates on frequency principles — that it flows toward resonant states and repels from contracted ones — the entire control architecture collapses.

**The Moments You Already Experienced This**

You've had moments where money appeared unexpectedly. A random refund. An opportunity materializing from nowhere. Someone paying you back from years ago. You called it luck or coincidence.

It wasn't. You accidentally aligned your energetic field with the money frequency. You just didn't know you did it — so you couldn't repeat it. That's the whole game.

**Reflection**
> What would change about your relationship to money if you treated it as energy — something that responds to frequency — rather than as a scarce material resource you compete for?
"""
    ),

    MoneyEnergyLesson(
        id: "me_02",
        number: 2,
        title: "Your Body Is a Radio Tower — And You're Broadcasting",
        icon: "antenna.radiowaves.left.and.right",
        tagline: "The HeartMath discovery that changes everything about manifestation.",
        readTime: 8,
        body: """
**You are not a passive receiver in life. You are actively broadcasting.**

The HeartMath Institute has documented something that fundamentally rewrites what we know about human potential: the heart generates an electromagnetic field **5,000 times stronger than the brain.** This field extends 3–6 feet outside your body in every direction and can be detected by sensitive magnetometers.

You are walking around inside a bubble of electromagnetic information you're broadcasting 24 hours a day. The question is: what signal is that bubble carrying?

**Coherence vs. Chaos**

When you feel fear, frustration, financial anxiety — *"I need money, I don't have enough"* — your heart rhythm becomes jagged and incoherent. In physics terms: a chaotic signal cannot carry a clear message. It's just noise.

So you can repeat "I am wealthy" in your head a thousand times a day. But if your heart is broadcasting a coherent signal of *"I am afraid"* — the universe receives the signal, not the words. The field doesn't lie. It cancels your intention before it leaves your body.

But there's a specific state of physiological coherence that turns this field into a laser. When you access it, synchronicities stop being accidents and start being the norm.

**Sympathetic Resonance: The Tesla Principle**

Tesla understood the principle of sympathetic resonance better than anyone in modern history.

Picture two tuning forks across a room, both calibrated to 440 Hz. Strike the first one — the second begins to vibrate and hum even though you never touched it. Why? Because they're frequency matched. The energy travels through the air and activates the second fork because there's no resistance.

Now apply this to money. Wealth has a frequency — one of freedom, expansion, and ease. If your nervous system is calibrated to the frequency of survival, contraction, and stress, you can be standing next to a life-changing opportunity and you will not vibrate to it. You won't see it. It will pass through you because there's no sympathetic resonance. You are biologically invisible to wealth.

**The System Is Jamming Your Signal**

This isn't accident or incompetence. Your attention is deliberately kept in high beta stress states:
— Constant phone notifications (beta trigger)
— Breaking news cycles (beta trigger)
— Financial anxiety manufactured by overdue notices and rising prices (beta trigger)

They keep your brain vibrating so fast you never drop into alpha (creative flow, 8–12 Hz) or theta (deep reprogramming, 4–8 Hz) — the states where real change becomes possible.

**The Critical Warning About Faking It**

Most people learn about resonance and immediately try to fake it. They attempt to overlay a positive frequency on top of a subconscious foundation of fear. This creates what's called *destructive interference*. You're not creating resonance — you're creating static. And static repels everything.

You cannot solve a frequency problem with a cognitive shortcut. The work is deeper.

**Reflection**
> Notice the signal your body is broadcasting right now. What emotion is most present? Fear? Expansion? Contraction? What has your field been transmitting today — and what has it been attracting to match?
"""
    ),

    MoneyEnergyLesson(
        id: "me_03",
        number: 3,
        title: "The Shadow Parasite: Jung's Discovery About Your Bank Account",
        icon: "brain.head.profile",
        tagline: "The psychological mechanism sabotaging your wealth — and why you can't think your way out.",
        readTime: 9,
        body: """
**There is a parasite living in your subconscious that feeds on your attempts to rise.**

Carl Jung called it the Shadow — and he discovered something that terrified the psychological establishment: the Shadow isn't just your dark side. It's your repressed power. Everything you were taught was dangerous, immoral, or unacceptable to be.

In a society that systematically demonizes wealth, guess what gets shoved into the Shadow?

Your ambition. Your desire for power. Your hunger for abundance.

**How the Shadow Was Installed**

You grew up hearing that money is the root of all evil. You absorbed stories where the wealthy man is the villain, the poor man is the hero. Your teachers, religious institutions, and cultural programming all encoded the same message: abundance is suspect.

Your subconscious mind — which controls 95% of your behavior — took detailed notes. It wrote a code: *Wealth = bad. Poverty = morally safe.*

Now consciously, you say you want financial freedom. You affirm it. You visualize it. But your Shadow — operating from that 95% — is screaming no. It's protecting your moral identity. It believes that if you become wealthy, you will become the villain. You will be unlovable. You will die alone.

**Psychoscybernetic Misalignment**

This creates what psychologists call psychoscybernetic misalignment. It's like driving with one foot on the accelerator and one foot slamming the brake. You burn out the engine. You make enormous noise but go nowhere.

This explains the lottery winner phenomenon: their conscious mind received the money. Their Shadow felt unsafe with it. So the Shadow took over — forced spending, reckless decisions, self-sabotage — just to return to the safety of the familiar poverty frequency.

The Shadow always wins — not because it's more powerful, but because it operates in the dark where you can't see it.

**Shadow in Action**

You accidentally oversleep the morning of the important meeting. You forget to reply to the email that could change your career. You pick a fight with your partner right before a financial breakthrough. You find reasons the opportunity "isn't right" when everything about it was.

This is not bad luck. This is your Shadow's self-correction mechanism — keeping you safely within the familiar, even when the familiar is limitation.

**You Cannot Affirm Your Way Out**

This is the critical distinction most teachers of manifestation miss entirely. You cannot think your way past the Shadow. Affirmations laid on top of Shadow programming create that destructive interference we discussed — the static that repels everything.

You have to integrate the Shadow, not suppress it.

**Shadow Integration — The Actual Method**

You stop fighting the desire for power and acknowledge it. You tell the part of yourself that hungers for abundance: *"It is safe to be powerful. It is safe to be wealthy. I can have money and still be me."*

When you stop suppressing your desire for wealth, something remarkable happens: you release enormous trapped energy. That energy, which was being used to hold you back, suddenly becomes fuel. You stop apologizing for your ambition. You stop shrinking to make others comfortable. You become magnetic — because you are finally whole.

A whole person vibrates at a frequency that fractures the control system.

**Reflection**
> What specific beliefs about wealthy people did you absorb growing up? Write them down without editing. These are the exact programs your Shadow is running. Naming them is the first step to integration.
"""
    ),

    MoneyEnergyLesson(
        id: "me_04",
        number: 4,
        title: "The Operating System: 7 Laws the Universe Runs On",
        icon: "command.circle.fill",
        tagline: "The Hermetic Principles — not spiritual suggestions, but physics.",
        readTime: 10,
        body: """
**Once you integrate the Shadow, you become a powerful engine. An engine without a steering wheel is just a crash waiting to happen.**

The ancients encoded reality's operating manual in seven Hermetic Principles. These aren't religious suggestions. They're the physics of how reality is constructed. Violate them — even with a cleared Shadow — and you crash.

Most people know the Law of Attraction. That's a fragment of the truth — like knowing gravity exists but not knowing aerodynamics. You might jump, but you won't fly.

**The Three Most Critical Laws for Wealth**

**Law 1 — The Principle of Mentalism: The All Is Mind**

Everything you see in the physical world — your house, your car, your bank balance — started as a thought form. It is crystallized projection of a mental state. If your internal world is chaotic, your finances will be chaotic. If your internal world broadcasts lack, your reality generates scarcity.

This is the "as within, so without" teaching at its most practical level. You have been trying to change the reflection in the mirror without changing the face.

This explains the lottery winner paradox scientifically: their external reality changed dramatically — but their internal mental state remained at poverty consciousness. The universe cannot sustain a mismatch between inner and outer worlds. It corrected the error by removing the money to match the internal state.

To build permanent wealth, you must become wealthy internally before a single dime appears externally. Install the mental software of abundance while you're still broke. This feels delusional to the logical mind — but it's the only way the law operates.

**Law 2 — The Principle of Polarity: Wealth and Poverty Are the Same Energy**

Everything is dual. Opposites are identical in nature but different in degree. Hot and cold are not two different things — they're the same thing, temperature, measured at different frequencies.

Here is the alchemist's secret weapon: Wealth and poverty are not opposites. They are the same energy at different points on the same sliding scale.

This means it's actually easier for a broke, desperate person to become wealthy than for a comfortable, complacent one. The broke person has intensity. They have massive emotional energy. They just need to redirect that existing energy — from the fear end of the spectrum to the ambition end. They don't need new energy. They need to transmute what they already have.

If you are terrified about money right now — congratulations. You have the raw power necessary to become wealthy. You just need to flip the switch.

**Law 3 — The Principle of Rhythm: The Tide Always Returns**

Everything flows and ebbs. The economy breathes. Markets crash and recover. Your bank account will flow and ebb. This is natural law.

The critical failure point: when the tide goes out — when money gets tight, when a launch fails, when the market dips — most people panic. They contract in fear. They look at low tide and conclude it's gone forever. That reaction creates a new cause. By panicking during the ebb, you freeze the cycle. You prevent the flow from returning.

The master of energy knows the ebb is the pullback before the slingshot. When money goes out, they stay expanded. They stay generous. They trust the rhythm. The backward swing of the pendulum creates the potential energy for the forward swing.

If you can hold your frequency of abundance while your bank account is hitting zero, you have mastered the game. The flow must return. It is law.

**The Observer Effect — Your Quantum Role**

Quantum mechanics shows us that matter doesn't exist in a fixed state until consciousness interacts with it. Your financial future exists in superposition — infinite potential timelines simultaneously coexisting in the quantum field.

When you wake up and think *"I never have enough"* — you are the observer collapsing the wave function into the poverty timeline. You're solidifying that reality out of pure potential.

But if you observe your reality through the lens of *"money flows to me effortlessly"* — even when your physical eyes don't confirm it yet — you begin collapsing the wave function of the wealth timeline. You're selecting a new probability.

Most people are lazy observers. They look at what's already there — the bills, the debt — and recreate it by observing it over and over. They're stuck in a time loop of their own making.

To break the loop: observe the reality that hasn't happened yet with more intensity than the reality happening now. Believe in your vision more than your current circumstances.

**Reflection**
> Which of the three laws most directly addresses your current relationship to money? What would it look like to operate from that law this week?
"""
    ),

    MoneyEnergyLesson(
        id: "me_05",
        number: 5,
        title: "The Three-Protocol Installation: Tesla, 369, and SATS",
        icon: "waveform.path.ecg",
        tagline: "The daily physical sequence that forces your biology, psychology, and field into alignment.",
        readTime: 8,
        body: """
**Understanding the laws isn't enough. You can understand the laws of aerodynamics and still crash the plane if you don't know how to fly.**

You need a protocol — a daily physical sequence that forces your biology, psychology, and energy field to align with the laws you now understand. Not intellectual entertainment. An installation into your nervous system.

**Warning:** If you treat this like a buffet — picking and choosing what feels comfortable — you will fail. The system pulls you back toward mediocrity with gravitational force. You need thrust and structure.

---

**Protocol 1 — The Hardware Upgrade: Tesla Breathing**

You cannot run high-voltage software on fried hardware. If your nervous system is in survival mode, your field broadcasts static and wealth won't stick.

The Tesla Breathing Method (formally: resonant/coherent breathing):

→ Breathe in for **5.5 seconds**
→ Breathe out for **5.5 seconds**
→ No pauses. No holding. Continuous rhythmic loop.

At this specific rhythm, you breathe exactly 5.5 times per minute. This creates a resonant frequency of 0.1 Hz in your cardiovascular system — the precise frequency where heart and brain synchronize. This is the coherence state the HeartMath research documented. It's measurable. It's reproducible.

**Do this for 10 minutes every morning before you check your phone.** Before you let the world program your frequency for the day. You are literally tuning your biological instrument to the frequency of receptivity.

If you skip this, everything else is intellectual entertainment.

---

**Protocol 2 — The Software Patch: The 369 Method**

Tesla was obsessed with the numbers 3, 6, and 9. He believed they were the key to the universe. We use them to key into the subconscious.

Once the hardware is humming from Protocol 1, you rewrite the code:

→ **Morning:** Write your wealth intention **3 times**
→ **Afternoon:** Write it **6 times**
→ **Before bed:** Write it **9 times**

Critically: **Do not type it. Write it by hand with a pen on paper.** This activates your motor cortex and creates a physical-neural loop. You are literally carving the new belief into your brain structure through repetition.

Sample intention: *"I am so happy and grateful now that money flows to me continuously and effortlessly."*

Do this for **33 consecutive days.** If you miss a day, start over. Consistency is the signal. Inconsistency tells the universe — and your subconscious — that you're not serious.

---

**Protocol 3 — The Imprint: SATS (State Akin to Sleep)**

Neville Goddard called this the most powerful installation method available to humans. And the neuroscience backs him up completely.

As you fall asleep, your brain cycles from beta → alpha → theta. Theta (4–8 Hz) is the hypnotic state — the only window when your conscious guard dog is fully asleep and the door to the subconscious command center is open.

Most people use this window to worry about tomorrow. They are literally programming their subconscious to create more stress.

**The Protocol:**

1. Lie in bed. Eyes closed.
2. Construct a short, 10-second mental scene that **implies your wish is already fulfilled.** Not getting the money — having the money. A handshake after a deal. A bank balance you see clearly. A friend congratulating you.
3. Loop this scene repeatedly until you fall asleep.
4. You must fall asleep **inside the feeling** of the wish fulfilled.

When executed correctly, your subconscious spends the next 8 hours organizing reality to match that hologram. The subconscious cannot distinguish between a vividly imagined experience and a real one — and it's constitutionally incapable of allowing a mismatch between its dominant impression and your external reality.

---

**The Warning: The Collapse Point**

When you start this protocol, your life will appear to fall apart first.

Friends will stop calling. Relationships may become turbulent. You might lose a job. Your car breaks down. Don't panic.

This is not failure. This is physics. This is field clearing.

You are shifting to a new frequency. Everything vibrating at your old frequency of scarcity becomes incompatible with your new signal. The universe is clearing the deck to make room for the reality you just ordered.

Most people see the chaos, panic, and sprint back to their old patterns — because at least the old pattern was stable. That retreat is the only real failure.

Stand in the fire. Let the dead wood burn. The chaos is the evidence the protocol is working.

**Reflection**
> Which of the three protocols will you begin tomorrow morning? Choose one and commit to it for 33 days before layering in the others. What specifically will you write as your intention?
"""
    ),

    MoneyEnergyLesson(
        id: "me_06",
        number: 6,
        title: "Reality Check: The Critique You Need to Hear",
        icon: "exclamationmark.triangle.fill",
        tagline: "SunFlow's honest lens — what this framework gets right, and where the manipulation hides.",
        readTime: 6,
        body: """
**SunFlow runs everything through the lens, including this framework.**

The energy-frequency model of money contains genuine insights drawn from real physics and real psychology. It also contains marketing manipulation, unfalsifiable claims, and elements that can actively harm people in financial crisis. You deserve to know the difference.

**What's Actually True**

— **The HeartMath research is real.** The heart does generate a measurable electromagnetic field. Coherent breathing at 5.5 breaths per minute is documented to reduce cortisol, improve HRV, and shift neurological states. This is verified science.

— **The amygdala hijack is real.** Financial stress genuinely impairs prefrontal cortex function. Chronic cortisol exposure damages decision-making capacity. Poor people are not poor because they're bad at decisions — they're often making worse decisions because poverty itself impairs cognition. This is established neuroscience.

— **Jung's Shadow work is legitimate.** Identifying and integrating unconscious beliefs about money and worthiness is real psychological work with real documented outcomes. Many people carry genuine inherited shame and guilt around wealth.

— **The observer effect is real** — but quantum mechanics applies at subatomic scales, not macroscopic life circumstances. "Collapsing wave functions" through your thoughts is a metaphor. A compelling one. Not literal physics.

**Where the Manipulation Lives**

— **Scarcity of the information itself.** This framework is presented as suppressed truth "they don't want you to know." There is no "they" suppressing it. This framing creates urgency and tribal identity — both psychological levers for attention capture and monetization.

— **The Chaos Warning.** "Your life will fall apart when this works" is an unfalsifiable safety net. If things improve — the protocol is working. If things get worse — the protocol is working. You cannot lose... unless you stop. This is a closed epistemic loop designed to prevent you from questioning the method.

— **Magical thinking about causation.** Bad thoughts don't cause poverty. Economic systems, structural inequality, lack of inherited capital, health crises, and geographic disadvantage cause poverty. Framing poverty as a frequency problem while ignoring material conditions is a sophisticated way to blame the victim.

— **"They need you to stay poor."** The conspiracy framing — that wealthy elites are specifically managing your frequency — is unfalsifiable and untestable. Some systems do maintain inequality structurally. But your specific nervous system state is not under coordinated elite management.

**The Honest Integration**

The breathing protocols are worth practicing — not because they'll manifest wealth, but because physiological coherence genuinely improves cognitive function, emotional regulation, and decision quality. Better biology leads to better decisions. Better decisions lead to better outcomes. That's the actual mechanism.

The Shadow work is worth doing — not because it'll make you a money magnet, but because unconscious beliefs do sabotage conscious goals. Integration is real work with real results.

The quantum observer framing is a useful *metaphor* for how expectation shapes perception and behavior. It's not particle physics applied to bank accounts.

**Take what's real. Discard the magical causation claims. Do the nervous system and psychological work. Then also address material conditions.**

**Reflection**
> Which elements of this framework feel most true to your direct experience? Which feel like wishful thinking? What's the difference between those two categories for you?
"""
    )
]

// MARK: - Hub View

struct MoneyIsEnergyCourseView: View {
    @Environment(\.dismiss) var dismiss
    @State private var progress = MoneyEnergyProgress.load()
    @State private var selectedLesson: MoneyEnergyLesson?
    @State private var showLesson = false

    private let accent = Color(hex: "#FFD700")
    private let bg = Color(red: 0.04, green: 0.03, blue: 0.01)

    var body: some View {
        NavigationStack {
            ZStack {
                bg.ignoresSafeArea()
                goldParticleField

                ScrollView(showsIndicators: false) {
                    VStack(spacing: 22) {
                        heroHeader
                        warningBanner
                        progressCard
                        lessonsGrid
                        Spacer(minLength: 60)
                    }
                    .padding(.horizontal, 18)
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button { dismiss() } label: {
                        Image(systemName: "chevron.left").foregroundColor(.white)
                    }
                }
                ToolbarItem(placement: .principal) {
                    Text("💰 Money Is Energy").font(.system(size: 16, weight: .bold)).foregroundColor(.white)
                }
            }
            .fullScreenCover(isPresented: $showLesson) {
                if let lesson = selectedLesson {
                    MoneyEnergyLessonView(lesson: lesson, accent: accent, progress: $progress)
                }
            }
        }
    }

    private var goldParticleField: some View {
        Canvas { ctx, size in
            let symbols = ["$", "₿", "◈", "∞", "◇", "·"]
            var rng = SystemRandomNumberGenerator()
            for _ in 0..<40 {
                let x = Double.random(in: 0...size.width, using: &rng)
                let y = Double.random(in: 0...size.height, using: &rng)
                let sym = symbols[Int.random(in: 0..<symbols.count, using: &rng)]
                ctx.opacity = Double.random(in: 0.03...0.1, using: &rng)
                ctx.draw(Text(sym).font(.system(size: CGFloat.random(in: 8...18, using: &rng))).foregroundColor(accent),
                         at: CGPoint(x: x, y: y))
            }
        }
        .ignoresSafeArea()
        .allowsHitTesting(false)
    }

    private var heroHeader: some View {
        VStack(spacing: 14) {
            Spacer().frame(height: 8)
            ZStack {
                Circle().fill(accent.opacity(0.1)).frame(width: 110, height: 110)
                Circle().fill(accent.opacity(0.05)).frame(width: 140, height: 140)
                Text("💰").font(.system(size: 52))
            }
            VStack(spacing: 6) {
                Text("MONEY IS ENERGY").font(.system(size: 9, weight: .black)).tracking(3).foregroundColor(accent.opacity(0.6))
                Text("The Operating Manual\nThey've Been Hiding").font(.system(size: 22, weight: .black)).foregroundColor(.white).multilineTextAlignment(.center)
                Text("6 lessons · Frequency, psychology & the critical lens")
                    .font(.system(size: 11)).foregroundColor(.white.opacity(0.35)).multilineTextAlignment(.center)
            }
        }
    }

    private var warningBanner: some View {
        HStack(spacing: 10) {
            Image(systemName: "exclamationmark.triangle.fill").font(.system(size: 14)).foregroundColor(Color(hex: "#FF6B35"))
            Text("Lesson 6 runs the SunFlow critique on this entire framework. Finish there.")
                .font(.system(size: 12, weight: .medium)).foregroundColor(.white.opacity(0.7))
        }
        .padding(12)
        .background(RoundedRectangle(cornerRadius: 10).fill(Color(hex: "#FF6B35").opacity(0.1))
            .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color(hex: "#FF6B35").opacity(0.3), lineWidth: 1)))
    }

    private var progressCard: some View {
        let done = progress.completedLessons.count
        let total = moneyEnergyLessons.count
        let pct = Double(done) / Double(total)
        return VStack(spacing: 8) {
            HStack {
                Text("\(done)/\(total) lessons").font(.system(size: 12, weight: .bold)).foregroundColor(.white.opacity(0.6))
                Spacer()
                Text(done == total ? "🏆 COMPLETE" : "\(Int(pct * 100))%").font(.system(size: 11, weight: .bold)).foregroundColor(accent)
            }
            GeometryReader { geo in
                ZStack(alignment: .leading) {
                    RoundedRectangle(cornerRadius: 3).fill(Color.white.opacity(0.06)).frame(height: 5)
                    RoundedRectangle(cornerRadius: 3).fill(LinearGradient(colors: [accent, Color(hex: "#FF6B35")], startPoint: .leading, endPoint: .trailing))
                        .frame(width: geo.size.width * pct, height: 5)
                }
            }
            .frame(height: 5)
        }
        .padding(14)
        .background(RoundedRectangle(cornerRadius: 12).fill(Color.white.opacity(0.04)))
    }

    private var lessonsGrid: some View {
        VStack(spacing: 12) {
            ForEach(moneyEnergyLessons) { lesson in
                MoneyLessonCard(lesson: lesson, accent: accent, isCompleted: progress.isComplete(lesson.id)) {
                    selectedLesson = lesson
                    showLesson = true
                }
            }
        }
    }
}

// MARK: - Lesson Card

struct MoneyLessonCard: View {
    let lesson: MoneyEnergyLesson
    let accent: Color
    let isCompleted: Bool
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            HStack(spacing: 14) {
                ZStack {
                    Circle().fill(isCompleted ? accent.opacity(0.2) : Color.white.opacity(0.05)).frame(width: 44, height: 44)
                    if isCompleted {
                        Image(systemName: "checkmark.circle.fill").font(.system(size: 20)).foregroundColor(accent)
                    } else {
                        Image(systemName: lesson.icon).font(.system(size: 18)).foregroundColor(accent.opacity(0.7))
                    }
                }
                VStack(alignment: .leading, spacing: 3) {
                    Text("L\(lesson.number) · \(lesson.title)").font(.system(size: 13, weight: .bold)).foregroundColor(.white).lineLimit(2)
                    Text(lesson.tagline).font(.system(size: 11)).foregroundColor(.white.opacity(0.4)).lineLimit(1)
                    Text("\(lesson.readTime) min read").font(.system(size: 10)).foregroundColor(accent.opacity(0.6))
                }
                Spacer()
                Image(systemName: "chevron.right").font(.system(size: 12)).foregroundColor(.white.opacity(0.2))
            }
            .padding(14)
            .background(RoundedRectangle(cornerRadius: 14)
                .fill(isCompleted ? accent.opacity(0.06) : Color.white.opacity(0.04))
                .overlay(RoundedRectangle(cornerRadius: 14).stroke(isCompleted ? accent.opacity(0.25) : Color.white.opacity(0.06), lineWidth: 1)))
        }
    }
}

// MARK: - Lesson Reader View

struct MoneyEnergyLessonView: View {
    let lesson: MoneyEnergyLesson
    let accent: Color
    @Binding var progress: MoneyEnergyProgress
    @Environment(\.dismiss) var dismiss
    @State private var appeared = false

    var body: some View {
        NavigationStack {
            ZStack {
                Color(red: 0.04, green: 0.03, blue: 0.01).ignoresSafeArea()
                ScrollView(showsIndicators: false) {
                    VStack(alignment: .leading, spacing: 24) {
                        lessonHeader
                        Divider().background(Color.white.opacity(0.08))
                        MoneyBodyRenderer(text: lesson.body, accent: accent)
                        completeButton()
                        Spacer(minLength: 60)
                    }
                    .padding(.horizontal, 20).padding(.top, 16)
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button { dismiss() } label: {
                        Image(systemName: "xmark.circle.fill").foregroundStyle(.white.opacity(0.4))
                    }
                }
                ToolbarItem(placement: .principal) {
                    Text("L\(lesson.number) of \(moneyEnergyLessons.count)")
                        .font(.system(size: 13, weight: .semibold)).foregroundColor(.white.opacity(0.5))
                }
            }
        }
    }

    private var lessonHeader: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("LESSON \(lesson.number)").font(.system(size: 10, weight: .black)).tracking(3).foregroundColor(accent.opacity(0.6))
            Text(lesson.title).font(.system(size: 22, weight: .black)).foregroundColor(.white)
            Text(lesson.tagline).font(.system(size: 13)).foregroundColor(.white.opacity(0.5)).italic()
            HStack(spacing: 6) {
                Image(systemName: "clock").font(.system(size: 10))
                Text("\(lesson.readTime) min read").font(.system(size: 11))
            }
            .foregroundColor(accent.opacity(0.5))
        }
    }

    @ViewBuilder
    private func completeButton() -> some View {
        if progress.isComplete(lesson.id) {
            Button {
                progress.complete(lesson.id)
                progress.save()
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) { dismiss() }
            } label: {
                HStack {
                    Image(systemName: "checkmark.circle.fill")
                    Text("Completed").font(.system(size: 14, weight: .bold))
                }
                .foregroundColor(accent)
                .frame(maxWidth: .infinity).padding(.vertical, 14)
                .background(RoundedRectangle(cornerRadius: 14).fill(accent.opacity(0.15)))
            }
            .padding(.top, 10)
        } else {
            Button {
                progress.complete(lesson.id)
                progress.save()
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) { dismiss() }
            } label: {
                HStack {
                    Image(systemName: "checkmark.circle")
                    Text("Mark Complete & Continue").font(.system(size: 14, weight: .bold))
                }
                .foregroundColor(.black)
                .frame(maxWidth: .infinity).padding(.vertical, 14)
                .background(
                    LinearGradient(colors: [accent, Color(hex: "#FF6B35")], startPoint: .leading, endPoint: .trailing)
                        .clipShape(RoundedRectangle(cornerRadius: 14))
                )
            }
            .padding(.top, 10)
        }
    }
}

// MARK: - Body Renderer

struct MoneyBodyRenderer: View {
    let text: String
    let accent: Color

    enum MBRKind { case heading, quote, arrow, bullet, divider, body }
    struct MBRBlock: Identifiable { let id = UUID(); let kind: MBRKind; let content: String }

    var body: some View {
        VStack(alignment: .leading, spacing: 14) {
            ForEach(parseBlocks()) { block in
                blockView(block)
            }
        }
    }

    @ViewBuilder
    private func blockView(_ block: MBRBlock) -> some View {
        switch block.kind {
        case .heading:  headingView(block.content)
        case .quote:    quoteView(block.content)
        case .arrow:    arrowView(block.content)
        case .bullet:   bulletView(block.content)
        case .divider:  Divider().background(Color.white.opacity(0.08))
        case .body:     bodyView(block.content)
        }
    }

    private func headingView(_ t: String) -> some View {
        Text(t).font(.system(size: 15, weight: .black))
            .foregroundColor(accent.opacity(0.9)).padding(.top, 6)
    }

    private func quoteView(_ t: String) -> some View {
        HStack(spacing: 0) {
            Rectangle().fill(accent).frame(width: 3)
            Text(t).font(.system(size: 13)).foregroundColor(.white.opacity(0.7)).italic().padding(.leading, 12)
        }
        .padding(.vertical, 4)
    }

    private func arrowView(_ t: String) -> some View {
        HStack(alignment: .top, spacing: 8) {
            Text("→").font(.system(size: 12)).foregroundColor(accent).padding(.top, 1)
            Text(t).font(.system(size: 13)).foregroundColor(.white.opacity(0.75))
                .fixedSize(horizontal: false, vertical: true)
        }
    }

    private func bulletView(_ t: String) -> some View {
        HStack(alignment: .top, spacing: 8) {
            Text("—").font(.system(size: 12)).foregroundColor(accent.opacity(0.6)).padding(.top, 1)
            Text(t).font(.system(size: 13)).foregroundColor(.white.opacity(0.75))
                .fixedSize(horizontal: false, vertical: true)
        }
    }

    private func bodyView(_ t: String) -> some View {
        Text(t).font(.system(size: 14)).foregroundColor(.white.opacity(0.8))
            .lineSpacing(5).fixedSize(horizontal: false, vertical: true)
    }

    private func parseBlocks() -> [MBRBlock] {
        text.components(separatedBy: "\n")
            .map { $0.trimmingCharacters(in: .whitespaces) }
            .compactMap { line -> MBRBlock? in
                if line.isEmpty { return nil }
                if line == "---" { return MBRBlock(kind: .divider, content: "") }
                if line.hasPrefix("**") && line.hasSuffix("**") {
                    return MBRBlock(kind: .heading, content: line.replacingOccurrences(of: "**", with: ""))
                }
                if line.hasPrefix("> ") { return MBRBlock(kind: .quote, content: String(line.dropFirst(2))) }
                if line.hasPrefix("→ ") { return MBRBlock(kind: .arrow, content: String(line.dropFirst(2))) }
                if line.hasPrefix("— ") { return MBRBlock(kind: .bullet, content: String(line.dropFirst(2))) }
                return MBRBlock(kind: .body, content: line.replacingOccurrences(of: "**", with: ""))
            }
    }
}
