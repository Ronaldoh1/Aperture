// ParadoxesDatabaseView.swift
// Top 100 Paradoxes - Mind-bending logical puzzles through history
// "When logic meets its limits"

import SwiftUI

// MARK: - Main Paradoxes View

struct ParadoxesDatabaseView: View {
  @Environment(\.dismiss) private var dismiss
  @State private var searchText = ""
  @State private var selectedCategory: ParadoxCategory = .all

  var filteredParadoxes: [Paradox] {
    var result = Paradox.allParadoxes

    if selectedCategory != .all {
      result = result.filter { $0.category == selectedCategory }
    }

    if !searchText.isEmpty {
      result = result.filter {
        $0.name.localizedCaseInsensitiveContains(searchText)
          || $0.shortDescription.localizedCaseInsensitiveContains(searchText)
          || $0.fullDescription.localizedCaseInsensitiveContains(searchText)
      }
    }

    return result
  }

  var body: some View {
    NavigationStack {
      ZStack {
        LinearGradient(
          colors: [Color(hex: "0a0a1a"), Color(hex: "1a1a2a")],
          startPoint: .top,
          endPoint: .bottom
        )
        .ignoresSafeArea()

        VStack(spacing: 0) {
          // Category Picker
          ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 8) {
              ForEach(ParadoxCategory.allCases, id: \.self) { cat in
                Button(action: { selectedCategory = cat }) {
                  Text(cat.rawValue)
                    .font(.caption)
                    .padding(.horizontal, 12)
                    .padding(.vertical, 8)
                    .background(
                      selectedCategory == cat ? Color(hex: "9B59B6") : Color.white.opacity(0.1)
                    )
                    .cornerRadius(20)
                    .foregroundStyle(.white)
                }
              }
            }
            .padding(.horizontal)
          }
          .padding(.vertical, 12)

          // Paradox List
          ScrollView {
            LazyVStack(spacing: 12) {
              ForEach(filteredParadoxes) { paradox in
                NavigationLink(destination: ParadoxDetailView(paradox: paradox)) {
                  paradoxCard(paradox)
                }
                .buttonStyle(.plain)
              }
            }
            .padding(.horizontal, 20)
            .padding(.bottom, 50)
          }
        }
      }
      .navigationTitle("🌀 100 Paradoxes")
      .navigationBarTitleDisplayMode(.inline)
      .searchable(text: $searchText, prompt: "Search paradoxes...")
      .toolbar {
        ToolbarItem(placement: .navigationBarTrailing) {
          Button("Done") { dismiss() }
            .foregroundStyle(Color(hex: "9B59B6"))
        }
      }
    }
  }

  private func paradoxCard(_ paradox: Paradox) -> some View {
    HStack(spacing: 16) {
      Text("\(paradox.number)")
        .font(.caption)
        .fontWeight(.bold)
        .foregroundStyle(.white)
        .frame(width: 32, height: 32)
        .background(Color(hex: "9B59B6"))
        .cornerRadius(16)

      VStack(alignment: .leading, spacing: 4) {
        Text(paradox.name)
          .font(.subheadline)
          .fontWeight(.semibold)
          .foregroundStyle(.white)

        Text(paradox.shortDescription)
          .font(.caption)
          .foregroundStyle(.white.opacity(0.6))
          .lineLimit(2)

        Text(paradox.category.rawValue)
          .font(.caption2)
          .foregroundStyle(Color(hex: "9B59B6"))
      }

      Spacer()

      Image(systemName: "chevron.right")
        .foregroundStyle(.white.opacity(0.3))
    }
    .padding()
    .background(Color.white.opacity(0.05))
    .cornerRadius(12)
  }
}

// MARK: - Paradox Category

enum ParadoxCategory: String, CaseIterable {
  case all = "All"
  case logic = "Logic"
  case physics = "Physics"
  case time = "Time"
  case selfReference = "Self-Reference"
  case infinity = "Infinity"
  case probability = "Probability"
  case philosophy = "Philosophy"
  case mathematics = "Mathematics"
  case identity = "Identity"
}

// MARK: - Paradox Model

struct Paradox: Identifiable {
  let id = UUID()
  let number: Int
  let name: String
  let shortDescription: String
  let fullDescription: String
  let explanation: String
  let category: ParadoxCategory
  let origin: String

  static let allParadoxes: [Paradox] = [
    // Logic Paradoxes (1-15)
    Paradox(
      number: 1, name: "Liar's Paradox",
      shortDescription: "\"This statement is false\" - is it true or false?",
      fullDescription:
        "Consider the statement: 'This statement is false.' If it's true, then what it says must be the case—but it says it's false. If it's false, then the opposite of what it says is true—meaning it's actually true.",
      explanation:
        "This paradox reveals the limits of self-referential statements in classical logic. It led to developments in mathematical logic, including Tarski's undefinability theorem.",
      category: .selfReference, origin: "Epimenides, 6th century BCE"),

    Paradox(
      number: 2, name: "Russell's Paradox",
      shortDescription: "The set of all sets that don't contain themselves",
      fullDescription:
        "Consider the set R of all sets that don't contain themselves. Does R contain itself? If R contains itself, it shouldn't (by definition). If R doesn't contain itself, it should.",
      explanation:
        "This paradox shook the foundations of set theory and mathematics. It led to the development of axiomatic set theory with restrictions on set formation.",
      category: .mathematics, origin: "Bertrand Russell, 1901"),

    Paradox(
      number: 3, name: "Barber Paradox",
      shortDescription: "Who shaves the barber who shaves all who don't shave themselves?",
      fullDescription:
        "In a village, the barber shaves all those, and only those, who don't shave themselves. Does the barber shave himself? If yes, he shouldn't. If no, he should.",
      explanation:
        "A more accessible version of Russell's Paradox. It shows that some self-referential definitions are inherently contradictory.",
      category: .logic, origin: "Bertrand Russell, 1901"),

    Paradox(
      number: 4, name: "Sorites Paradox (Heap)", shortDescription: "How many grains make a heap?",
      fullDescription:
        "1 grain isn't a heap. If n grains isn't a heap, n+1 grains isn't either. Therefore, 1 million grains isn't a heap. But clearly it is.",
      explanation:
        "This paradox of vagueness shows problems with fuzzy boundaries. Solutions include fuzzy logic, supervaluationism, and embracing vagueness.",
      category: .logic, origin: "Eubulides, 4th century BCE"),

    Paradox(
      number: 5, name: "Paradox of the Court",
      shortDescription: "Protagoras' student who pays only if he wins his first case",
      fullDescription:
        "Protagoras trains Euathlus, who agrees to pay after winning his first case. Euathlus never takes cases. Protagoras sues. If Euathlus wins, he must pay (by contract). If he loses, he must pay (by judgment).",
      explanation:
        "This shows how legal and logical frameworks can conflict. The resolution depends on which takes precedence: contract or court ruling.",
      category: .logic, origin: "Ancient Greece"),

    Paradox(
      number: 6, name: "Unexpected Hanging",
      shortDescription: "A condemned man can't be surprised by his execution day",
      fullDescription:
        "A judge tells a prisoner he'll be hanged at noon one day next week, and it will be a surprise. The prisoner reasons: Can't be Friday (he'd know Thursday night). Can't be Thursday... He concludes it can't happen. Then he's hanged Wednesday—surprised.",
      explanation:
        "This paradox involves self-defeating predictions and the nature of knowledge. Multiple solutions exist in epistemic logic.",
      category: .logic, origin: "1940s"),

    Paradox(
      number: 7, name: "Crocodile Paradox", shortDescription: "The crocodile's impossible promise",
      fullDescription:
        "A crocodile steals a child and promises to return it if the mother correctly predicts what the crocodile will do. She says: 'You won't return my child.' If true, it should be returned (correct prediction). But then it's false.",
      explanation:
        "Another self-referential logical trap. It shows how certain promises are logically impossible to keep.",
      category: .logic, origin: "Ancient Greek"),

    Paradox(
      number: 8, name: "Curry's Paradox",
      shortDescription: "If this sentence is true, then Santa exists",
      fullDescription:
        "Consider: 'If this sentence is true, then God exists.' If the sentence is true, then by modus ponens, God exists. But this logic applies to any conclusion.",
      explanation:
        "This paradox shows how self-reference combined with implication can 'prove' anything, revealing issues with naive logic.",
      category: .selfReference, origin: "Haskell Curry, 1942"),

    Paradox(
      number: 9, name: "Grelling-Nelson Paradox",
      shortDescription: "Is 'heterological' heterological?",
      fullDescription:
        "A word is 'autological' if it describes itself (e.g., 'short' is short). 'Heterological' describes words that don't describe themselves. Is 'heterological' heterological?",
      explanation:
        "If yes, it describes itself, so no. If no, it doesn't describe itself, so yes. Another version of Russell's paradox in linguistic form.",
      category: .selfReference, origin: "Grelling & Nelson, 1908"),

    Paradox(
      number: 10, name: "Berry's Paradox",
      shortDescription: "The smallest integer not definable in under 60 letters",
      fullDescription:
        "Consider 'the smallest positive integer not definable in under sixty letters.' This definition uses under sixty letters. So it both is and isn't definable in under sixty letters.",
      explanation:
        "This paradox relates to definability and computation. It's connected to Gödel's incompleteness theorems.",
      category: .mathematics, origin: "G.G. Berry, early 1900s"),

    // Time Paradoxes (11-25)
    Paradox(
      number: 11, name: "Grandfather Paradox",
      shortDescription: "What if you killed your grandfather before your parent was born?",
      fullDescription:
        "If time travel is possible, you could go back and kill your grandfather before your parent was conceived. But then you'd never be born to go back and kill him.",
      explanation:
        "Classic time travel paradox. Solutions include: time travel is impossible, parallel timelines are created, or history is self-consistent (Novikov self-consistency).",
      category: .time, origin: "Science fiction, various"),

    Paradox(
      number: 12, name: "Bootstrap Paradox",
      shortDescription: "Where did the information come from originally?",
      fullDescription:
        "You travel back in time and give Shakespeare his plays. He publishes them. You later read them and travel back to give them to him. Who wrote the plays?",
      explanation:
        "A causal loop where information or objects have no origin. Challenges our understanding of causation.",
      category: .time, origin: "Robert Heinlein's concept"),

    Paradox(
      number: 13, name: "Fermi Paradox", shortDescription: "Where is everybody?",
      fullDescription:
        "Given the size and age of the universe, intelligent life should be common. We should see evidence of alien civilizations. But we don't. Where are they?",
      explanation:
        "Proposed solutions: Great Filter (civilizations die out), Zoo Hypothesis (we're being watched), Simulation (we're alone in the sim), or they're here but unrecognized.",
      category: .physics, origin: "Enrico Fermi, 1950"),

    Paradox(
      number: 14, name: "Predestination Paradox",
      shortDescription: "Actions in the past that cause themselves",
      fullDescription:
        "A time traveler goes back and performs an action that turns out to be the very cause of the event that motivated the time travel. The effect causes its own cause.",
      explanation:
        "A closed causal loop. These are consistent but strange. They might be how time travel 'actually' works if possible.",
      category: .time, origin: "Science fiction concept"),

    Paradox(
      number: 15, name: "Hitler's Murder Paradox",
      shortDescription: "What if you killed Hitler as a baby?",
      fullDescription:
        "You travel back to kill baby Hitler, preventing WWII. But then there's no WWII, no reason to time travel, no killing Hitler, so WWII happens...",
      explanation:
        "A specific case of the grandfather paradox applied to historical events. Same solutions apply.",
      category: .time, origin: "Common thought experiment"),

    Paradox(
      number: 16, name: "Newcomb's Paradox",
      shortDescription: "One box or two? The predictor knows.",
      fullDescription:
        "Two boxes: A (transparent, $1,000) and B (opaque). A perfect predictor has already put $1M in B if they predicted you'd take only B, nothing if they predicted you'd take both. What do you choose?",
      explanation:
        "Divides decision theorists. One-boxers take only B (expected value). Two-boxers take both (dominance reasoning). No consensus exists.",
      category: .probability, origin: "William Newcomb, 1960"),

    Paradox(
      number: 17, name: "Temporal Paradox", shortDescription: "You exist before you're born",
      fullDescription:
        "Your future self travels back to when you're a child and becomes your mentor, teaching you skills that enable you to become who you are and eventually travel back.",
      explanation:
        "Who caused your development? Your future self? Your past self learning? The loop has no beginning.",
      category: .time, origin: "Science fiction trope"),

    Paradox(
      number: 18, name: "Achilles and the Tortoise",
      shortDescription: "Achilles can never catch the slower tortoise",
      fullDescription:
        "Achilles races a tortoise with a head start. To catch up, he must reach where the tortoise was. But by then, it's moved. He must reach that new point. It's moved again. Ad infinitum.",
      explanation:
        "Zeno's paradox of motion. Resolved by understanding infinite series can have finite sums. 1/2 + 1/4 + 1/8... = 1.",
      category: .mathematics, origin: "Zeno of Elea, 5th century BCE"),

    Paradox(
      number: 19, name: "Dichotomy Paradox",
      shortDescription: "You can never reach your destination",
      fullDescription:
        "To reach any point, you must first reach the halfway point. To reach that, the quarter point. To reach that, the eighth point. Infinite steps before any progress.",
      explanation:
        "Another Zeno paradox. Shows the counterintuitive nature of continuous space. Modern calculus handles this via limits.",
      category: .mathematics, origin: "Zeno of Elea"),

    Paradox(
      number: 20, name: "Arrow Paradox", shortDescription: "A flying arrow is actually stationary",
      fullDescription:
        "At any instant, an arrow in flight occupies a space exactly its size. It's not moving within that instant. Time is made of instants. So the arrow never moves.",
      explanation:
        "Challenges the concept of motion at an instant. Resolved by understanding velocity as a limit, not instantaneous.",
      category: .physics, origin: "Zeno of Elea"),

    // Physics Paradoxes (21-35)
    Paradox(
      number: 21, name: "Schrödinger's Cat", shortDescription: "The cat that's both alive and dead",
      fullDescription:
        "A cat in a box with a quantum-triggered poison. Until observed, the quantum system is in superposition. Is the cat both alive and dead? When does the 'collapse' happen?",
      explanation:
        "Illustrates the measurement problem in quantum mechanics. Interpretations vary: Copenhagen, Many-Worlds, decoherence.",
      category: .physics, origin: "Erwin Schrödinger, 1935"),

    Paradox(
      number: 22, name: "EPR Paradox", shortDescription: "Spooky action at a distance",
      fullDescription:
        "Entangled particles seem to influence each other instantly across any distance. Measuring one instantly determines the other's state. Faster than light?",
      explanation:
        "Led to Bell's theorem. Quantum mechanics is non-local but no information travels faster than light. Entanglement is weird but consistent.",
      category: .physics, origin: "Einstein, Podolsky, Rosen, 1935"),

    Paradox(
      number: 23, name: "Twin Paradox", shortDescription: "The traveling twin ages slower",
      fullDescription:
        "Twin A stays on Earth. Twin B travels at near-light speed and returns. Due to time dilation, B is younger. But from B's perspective, A was moving. Why isn't A younger?",
      explanation:
        "Resolved by general relativity: B accelerates (turns around), breaking symmetry. The traveling twin really is younger.",
      category: .physics, origin: "Special relativity consequence"),

    Paradox(
      number: 24, name: "Olbers' Paradox", shortDescription: "Why is the sky dark at night?",
      fullDescription:
        "If the universe is infinite and uniformly populated with stars, every line of sight should end at a star. The night sky should be blazingly bright.",
      explanation:
        "Resolved by: finite age of universe (light hasn't reached us), expansion (redshift), and finite star lifetimes.",
      category: .physics, origin: "Heinrich Olbers, 1823"),

    Paradox(
      number: 25, name: "Maxwell's Demon", shortDescription: "A demon that violates thermodynamics",
      fullDescription:
        "Imagine a tiny demon at a door between two gas chambers, letting only fast molecules through one way. It creates a temperature difference without work, violating the second law.",
      explanation:
        "Resolved by Landauer's principle: erasing the demon's memory increases entropy. Information is physical.",
      category: .physics, origin: "James Clerk Maxwell, 1867"),

    Paradox(
      number: 26, name: "Black Hole Information Paradox",
      shortDescription: "Does information disappear in black holes?",
      fullDescription:
        "Quantum mechanics says information is conserved. But black holes evaporate via Hawking radiation, which seems to destroy information. What happens to it?",
      explanation:
        "Active research area. Proposals include: holographic principle, firewall, black hole complementarity, information in radiation.",
      category: .physics, origin: "Stephen Hawking, 1970s"),

    Paradox(
      number: 27, name: "Observer Effect Paradox",
      shortDescription: "Does observation create reality?",
      fullDescription:
        "In quantum mechanics, observation collapses the wave function. Does reality not exist until observed? What counts as an observer?",
      explanation:
        "Interpretation dependent. Copenhagen: observation creates reality. Many-Worlds: all outcomes exist. Decoherence: environment is the 'observer.'",
      category: .physics, origin: "Quantum mechanics foundational"),

    Paradox(
      number: 28, name: "Quantum Suicide", shortDescription: "You survive every quantum death",
      fullDescription:
        "A gun is rigged to a quantum event. You pull the trigger. In Many-Worlds, you always survive in some branch. From your perspective, the gun always fails.",
      explanation:
        "Thought experiment testing Many-Worlds. You can't use it to prove Many-Worlds since you can't communicate with dead selves.",
      category: .physics, origin: "Max Tegmark, 1990s"),

    Paradox(
      number: 29, name: "Boltzmann Brain",
      shortDescription: "You're more likely to be a random fluctuation",
      fullDescription:
        "In an eternal universe, random quantum fluctuations can create any configuration—including a brain with false memories. Most observers should be such fluctuations.",
      explanation:
        "Used as argument against certain cosmological models. If Boltzmann brains dominate, our experiences are unreliable.",
      category: .physics, origin: "Ludwig Boltzmann concept"),

    Paradox(
      number: 30, name: "Entropy Paradox",
      shortDescription: "Why did the universe start with low entropy?",
      fullDescription:
        "The second law says entropy increases. But the early universe had very low entropy. Why? What set those initial conditions?",
      explanation:
        "Open question in cosmology. Proposals include: inflation, cyclic models, anthropic selection.",
      category: .physics, origin: "Thermodynamics + cosmology"),

    // Identity Paradoxes (31-45)
    Paradox(
      number: 31, name: "Ship of Theseus",
      shortDescription: "If you replace all parts, is it the same ship?",
      fullDescription:
        "The ship is repaired plank by plank until every original part is replaced. Is it still the Ship of Theseus? If the old planks are reassembled, which is the 'real' ship?",
      explanation:
        "Explores identity over time. Applies to human bodies (cells replace), minds (memories change). What makes something 'the same'?",
      category: .identity, origin: "Plutarch, 1st century CE"),

    Paradox(
      number: 32, name: "Teleportation Paradox", shortDescription: "Is the teleported person you?",
      fullDescription:
        "A teleporter scans your body, destroys it, and creates an exact copy elsewhere. The copy has all your memories. Is it you? Did you survive or die?",
      explanation:
        "Tests theories of personal identity. Physical continuity? Psychological continuity? Pattern identity?",
      category: .identity, origin: "Science fiction + philosophy"),

    Paradox(
      number: 33, name: "Teletransportation Paradox",
      shortDescription: "What if the original isn't destroyed?",
      fullDescription:
        "Variation: the teleporter malfunctions and doesn't destroy the original. Now there are two 'you.' Which is the real you? Both? Neither?",
      explanation:
        "Challenges the view that psychological continuity alone defines identity. Forces consideration of branching.",
      category: .identity, origin: "Derek Parfit"),

    Paradox(
      number: 34, name: "Swampman Paradox", shortDescription: "A perfect copy with no history",
      fullDescription:
        "Lightning strikes a swamp, randomly creating a molecule-by-molecule copy of you. It has all your memories. Is it you? Does it have the same identity without the causal history?",
      explanation:
        "Tests whether identity requires causal continuity. The Swampman is functionally identical but has no real history.",
      category: .identity, origin: "Donald Davidson, 1987"),

    Paradox(
      number: 35, name: "Brain in a Vat",
      shortDescription: "How do you know you're not a brain in a vat?",
      fullDescription:
        "You might be a disembodied brain being fed artificial experiences. All your perceptions could be simulated. How would you know?",
      explanation:
        "Related to simulation theory. Descartes' evil demon. Shows limits of empirical knowledge. Some argue it's self-refuting.",
      category: .philosophy, origin: "Gilbert Harman, 1973"),

    Paradox(
      number: 36, name: "Chinese Room",
      shortDescription: "Does processing symbols equal understanding?",
      fullDescription:
        "A person in a room follows rules to respond to Chinese characters with other characters. To outsiders, the room 'speaks Chinese.' But the person doesn't understand Chinese.",
      explanation:
        "Challenges strong AI. Syntax doesn't equal semantics. But: maybe the 'system' understands even if the person doesn't.",
      category: .philosophy, origin: "John Searle, 1980"),

    Paradox(
      number: 37, name: "Mary's Room",
      shortDescription: "The color scientist who's never seen color",
      fullDescription:
        "Mary knows all physical facts about color but has lived in black-and-white. When she sees red for the first time, does she learn something new?",
      explanation:
        "Arguments about qualia and physicalism. If she learns something, there's more than physical facts. Called 'knowledge argument.'",
      category: .philosophy, origin: "Frank Jackson, 1982"),

    Paradox(
      number: 38, name: "Zombie Paradox",
      shortDescription: "Philosophical zombies with no consciousness",
      fullDescription:
        "Can you conceive of a being physically identical to you but with no subjective experience? If so, consciousness isn't determined by physics alone.",
      explanation:
        "Used to argue against physicalism. If zombies are conceivable, consciousness is an extra ingredient. Debated vigorously.",
      category: .philosophy, origin: "David Chalmers"),

    Paradox(
      number: 39, name: "Split Brain Paradox", shortDescription: "Two minds in one body?",
      fullDescription:
        "When the corpus callosum is severed, the brain hemispheres operate independently. Experiments show they can have different beliefs. How many persons?",
      explanation:
        "Real medical phenomenon that challenges unified self. Suggests 'self' might be an illusion created by integration.",
      category: .identity, origin: "Roger Sperry's experiments"),

    Paradox(
      number: 40, name: "Personal Identity Paradox",
      shortDescription: "Are you the same person as 10 years ago?",
      fullDescription:
        "Your cells, memories, beliefs, and personality all change over time. What makes you 'the same person'? Physical continuity? Psychological continuity? Neither?",
      explanation:
        "No perfect answer. Most theories have counterexamples. Perhaps 'same person' is fuzzy concept applied precisely.",
      category: .identity, origin: "Philosophy of mind classic"),

    // Infinity Paradoxes (41-55)
    Paradox(
      number: 41, name: "Hilbert's Hotel",
      shortDescription: "A full hotel that can always fit more guests",
      fullDescription:
        "A hotel with infinite rooms, all full. A new guest arrives. Move everyone to room n+1. Room 1 is free. Infinite guests arrive? Move everyone to room 2n. Infinite odd rooms free.",
      explanation:
        "Shows counterintuitive properties of infinity. Infinite sets can have proper subsets of the same size.",
      category: .infinity, origin: "David Hilbert"),

    Paradox(
      number: 42, name: "Galileo's Paradox",
      shortDescription: "Infinite squares equal infinite integers?",
      fullDescription:
        "There are fewer perfect squares (1,4,9,16...) than integers (1,2,3,4...). But every integer can be squared, mapping integers to squares one-to-one. Same number?",
      explanation:
        "Both sets are infinite. This shows 'size' means different things for infinite sets. Led to Cantor's cardinality theory.",
      category: .infinity, origin: "Galileo Galilei"),

    Paradox(
      number: 43, name: "Cantor's Paradox", shortDescription: "The set of all sets is too big",
      fullDescription:
        "Consider the set of all sets. It should contain its own power set. But the power set is always larger. So it both is and isn't the largest set.",
      explanation:
        "There is no set of all sets. Set theory requires restrictions to avoid this. Class theory distinguishes sets from proper classes.",
      category: .mathematics, origin: "Georg Cantor"),

    Paradox(
      number: 44, name: "Banach-Tarski Paradox",
      shortDescription: "Cutting a ball into pieces that reassemble into two balls",
      fullDescription:
        "A solid ball can be decomposed into 5 pieces that rearrange (via rotation and translation only) into two balls identical to the original.",
      explanation:
        "Real mathematical theorem! Requires Axiom of Choice. The pieces are infinitely complex, non-measurable sets. Doesn't work physically.",
      category: .mathematics, origin: "Banach & Tarski, 1924"),

    Paradox(
      number: 45, name: "Ross-Littlewood Paradox",
      shortDescription: "Infinitely adding and removing balls",
      fullDescription:
        "At step n: add balls 10n-9 through 10n, remove ball n. At step 1: add 1-10, remove 1. Step 2: add 11-20, remove 2. After infinite steps, how many balls?",
      explanation:
        "Depends on interpretation! Infinite balls or zero? Shows limits of infinite processes and 'supertasks.'",
      category: .infinity, origin: "Ross & Littlewood"),

    Paradox(
      number: 46, name: "Thomson's Lamp",
      shortDescription: "Is the lamp on or off after infinite switches?",
      fullDescription:
        "A lamp is switched: on at 1 min, off at 1.5 min, on at 1.75 min... After 2 minutes (infinite switches), is it on or off?",
      explanation:
        "Undefined. The setup doesn't specify the final state. Shows supertasks can be ill-defined. Not all infinite processes have limits.",
      category: .infinity, origin: "James Thomson, 1954"),

    Paradox(
      number: 47, name: "Gabriel's Horn", shortDescription: "Infinite surface area, finite volume",
      fullDescription:
        "Rotate y=1/x (from x=1 to infinity) around x-axis. The resulting horn has finite volume (π) but infinite surface area.",
      explanation:
        "Real mathematical result. You can fill it with paint but not paint its surface. Counterintuitive but consistent.",
      category: .mathematics, origin: "Evangelista Torricelli, 1643"),

    Paradox(
      number: 48, name: "Tristram Shandy Paradox",
      shortDescription: "Writing autobiography takes longer than living",
      fullDescription:
        "Tristram Shandy takes a year to write about one day of his life. He'll never finish. But if he lives forever, each day eventually gets written.",
      explanation:
        "Shows how infinite time changes everything. Every finite task eventually completes given infinite time.",
      category: .infinity, origin: "Bertrand Russell"),

    Paradox(
      number: 49, name: "St. Petersburg Paradox",
      shortDescription: "A game with infinite expected value",
      fullDescription:
        "A coin is flipped until heads. You win 2^n dollars (n = flips). Expected value: 1 + 1 + 1 + ... = infinite. But nobody would pay infinite dollars to play.",
      explanation:
        "Shows expected value isn't everything. Led to utility theory. Marginal utility of money decreases.",
      category: .probability, origin: "Daniel Bernoulli, 1738"),

    Paradox(
      number: 50, name: "Two Envelopes Paradox", shortDescription: "Switch or don't switch?",
      fullDescription:
        "Two envelopes: one has twice the other's money. You pick one. Should you switch? Expected value of other: (0.5)(2x) + (0.5)(x/2) = 1.25x. Always switch? But symmetric!",
      explanation:
        "The paradox is in the calculation. You can't simultaneously model both cases. Subtle probability error.",
      category: .probability, origin: "Unknown origin"),

    // Philosophy Paradoxes (51-70)
    Paradox(
      number: 51, name: "Euthyphro Dilemma",
      shortDescription: "Is it good because God commands it, or commanded because good?",
      fullDescription:
        "Is something morally good because God commands it? Or does God command it because it's good? Either divine command is arbitrary, or there's a standard above God.",
      explanation:
        "Challenges divine command theory. No easy resolution. Some accept 'God is the standard,' others 'goodness is independent.'",
      category: .philosophy, origin: "Plato's Euthyphro"),

    Paradox(
      number: 52, name: "Problem of Evil",
      shortDescription: "Why does evil exist if God is good and powerful?",
      fullDescription:
        "If God is all-powerful, all-knowing, and all-good, why does evil exist? He could prevent it, knows about it, and would want to stop it.",
      explanation:
        "Classic theodicy problem. Responses: free will defense, soul-making, mystery, or rejecting one attribute.",
      category: .philosophy, origin: "Epicurus, ancient"),

    Paradox(
      number: 53, name: "Omnipotence Paradox",
      shortDescription: "Can God create a rock so heavy He can't lift it?",
      fullDescription:
        "If God can create such a rock, there's something He can't do (lift it). If He can't create it, there's something He can't do (create it).",
      explanation:
        "Some say omnipotence doesn't include logical contradictions. Others redefine omnipotence. The rock is logically impossible.",
      category: .philosophy, origin: "Medieval philosophy"),

    Paradox(
      number: 54, name: "Buridan's Ass",
      shortDescription: "A donkey starves between two equal hay bales",
      fullDescription:
        "A donkey is placed exactly between two identical hay bales. Being perfectly rational and finding no reason to prefer either, it starves.",
      explanation:
        "Shows that pure rationality may be insufficient. Real agents need some randomness or arbitrary choice-making.",
      category: .philosophy, origin: "Attributed to Jean Buridan"),

    Paradox(
      number: 55, name: "Prisoner's Dilemma",
      shortDescription: "Rational choice leads to worse outcome",
      fullDescription:
        "Two prisoners can cooperate (stay silent) or defect (betray). Defecting is always rational individually, but mutual cooperation is better for both.",
      explanation:
        "Fundamental in game theory. Shows individual rationality doesn't equal group rationality. Iterated versions allow cooperation.",
      category: .probability, origin: "Flood & Dresher, 1950"),

    Paradox(
      number: 56, name: "Toxin Puzzle",
      shortDescription: "Intend to drink toxin you don't have to drink",
      fullDescription:
        "You'll receive $1M if you genuinely intend to drink a mildly harmful toxin tomorrow. You don't actually have to drink it. Can you genuinely intend knowing you won't?",
      explanation:
        "Tests the nature of intention. Some say impossible—intentions must be action-guiding. Others say you can form the intention.",
      category: .philosophy, origin: "Gregory Kavka, 1983"),

    Paradox(
      number: 57, name: "Paradox of Hedonism",
      shortDescription: "Pursuing happiness directly makes you unhappy",
      fullDescription:
        "Those who directly pursue their own happiness often fail to find it. Happiness comes as a byproduct of other activities, not as a direct goal.",
      explanation:
        "Supported by psychological research. 'Flow' states come from engagement, not pleasure-seeking.",
      category: .philosophy, origin: "Henry Sidgwick"),

    Paradox(
      number: 58, name: "Paradox of Tolerance",
      shortDescription: "Tolerating intolerance destroys tolerance",
      fullDescription:
        "A tolerant society must be intolerant of intolerance—otherwise intolerant views will dominate and end tolerance.",
      explanation:
        "Karl Popper's conclusion. Unlimited tolerance leads to disappearance of tolerance. Paradox of maintaining open societies.",
      category: .philosophy, origin: "Karl Popper, 1945"),

    Paradox(
      number: 59, name: "Paradox of Fiction",
      shortDescription: "Why do we feel emotions for fictional characters?",
      fullDescription:
        "We feel genuine sadness when a character dies, fear during horror movies. But we know they're not real. How can we have real emotions about unreality?",
      explanation:
        "Various theories: simulation, belief suspension, quasi-emotions. Shows emotions don't require full belief.",
      category: .philosophy, origin: "Colin Radford, 1975"),

    Paradox(
      number: 60, name: "Paradox of Analysis",
      shortDescription: "If analysis is correct, it's trivial; if informative, it's wrong",
      fullDescription:
        "Analyzing 'bachelor' as 'unmarried man': if correct, just restates the obvious. If it adds information, it must be changing the meaning.",
      explanation:
        "Problems for conceptual analysis. Perhaps concepts have more structure than definitions capture.",
      category: .philosophy, origin: "G.E. Moore"),

    // More Paradoxes (61-100)
    Paradox(
      number: 61, name: "Moore's Paradox",
      shortDescription: "\"It's raining but I don't believe it\"",
      fullDescription:
        "The statement 'It's raining but I don't believe it's raining' is logically possible but absurd to assert. Why?",
      explanation:
        "Assertion implies belief. The content is possible, but asserting it violates pragmatic norms.",
      category: .logic, origin: "G.E. Moore"),

    Paradox(
      number: 62, name: "Raven Paradox",
      shortDescription: "A white shoe confirms 'all ravens are black'",
      fullDescription:
        "To confirm 'All ravens are black,' we check ravens. But logically equivalent: 'All non-black things are non-ravens.' A white shoe (non-black non-raven) confirms this, thus the original.",
      explanation:
        "Shows confirmation is tricky. Solutions vary: background knowledge matters, confirmation is relative.",
      category: .logic, origin: "Carl Hempel, 1940s"),

    Paradox(
      number: 63, name: "Lottery Paradox",
      shortDescription: "Believing you'll lose but someone will win",
      fullDescription:
        "In a fair lottery, for each ticket, you believe it won't win (justified—very low probability). But you believe someone will win. You believe each loses AND someone wins.",
      explanation:
        "Shows rational belief isn't closed under conjunction. You can rationally believe each of many things that can't all be true.",
      category: .probability, origin: "Henry Kyburg, 1961"),

    Paradox(
      number: 64, name: "Preface Paradox",
      shortDescription: "Believing your book has errors while believing each claim",
      fullDescription:
        "An author believes every statement in her book but writes in the preface that there are surely errors. She believes each claim AND believes at least one is wrong.",
      explanation: "Similar to lottery paradox. Rational beliefs need not form consistent sets.",
      category: .logic, origin: "D.C. Makinson, 1965"),

    Paradox(
      number: 65, name: "Paradox of the Heap (Extended)",
      shortDescription: "When does a young person become old?",
      fullDescription:
        "A 1-year-old isn't old. If someone who's n years old isn't old, someone n+1 isn't old. Therefore, a 100-year-old isn't old.",
      explanation:
        "Same structure as sorites. All vague predicates face this issue. Age, tallness, baldness—all have fuzzy boundaries.",
      category: .logic, origin: "Extension of sorites"),

    Paradox(
      number: 66, name: "Paradox of the Unexpected",
      shortDescription: "Teachers can't give surprise tests",
      fullDescription:
        "Teacher announces surprise test next week. Student reasons it can't be Friday (they'd know Thursday), can't be Thursday... concludes no test possible. Test on Wednesday—surprised.",
      explanation:
        "Same as unexpected hanging. Self-defeating predictions with knowledge conditions.",
      category: .logic, origin: "Variant of hanging paradox"),

    Paradox(
      number: 67, name: "Fitch's Paradox",
      shortDescription: "If all truths are knowable, all truths are known",
      fullDescription:
        "Assume: all truths can be known. Consider truth p that isn't known. 'p and p isn't known' is true. If knowable, someone could know it. But knowing 'p isn't known' makes it known—contradiction.",
      explanation:
        "Challenges anti-realist views. If all truths are knowable, there are no unknown truths. Strong anti-realism is unstable.",
      category: .logic, origin: "Frederic Fitch, 1963"),

    Paradox(
      number: 68, name: "Simpson's Paradox",
      shortDescription: "A trend reverses when data is combined",
      fullDescription:
        "Treatment A is better than B for men and for women, but B is better than A for people overall. How? Confounding variable in group sizes.",
      explanation:
        "Real statistical phenomenon. Shows importance of considering confounds and not aggregating blindly.",
      category: .probability, origin: "Edward Simpson, 1951"),

    Paradox(
      number: 69, name: "Monty Hall Problem", shortDescription: "Should you switch doors?",
      fullDescription:
        "Three doors: one car, two goats. You pick door 1. Host opens door 3 (goat). Should you switch to door 2? Yes! Switching wins 2/3 of the time.",
      explanation:
        "Counterintuitive but mathematically certain. Key: host knows where the car is and always opens a goat door.",
      category: .probability, origin: "Steve Selvin, 1975"),

    Paradox(
      number: 70, name: "Bertrand's Box Paradox",
      shortDescription: "Drawing gold from a box of gold",
      fullDescription:
        "Three boxes: two gold coins, two silver coins, one of each. You pick a box, draw one coin—it's gold. Probability other coin is gold? Not 1/2 but 2/3.",
      explanation:
        "Prior probabilities matter. You're more likely to have picked the GG box than the GS box.",
      category: .probability, origin: "Joseph Bertrand, 1889"),

    Paradox(
      number: 71, name: "Sleeping Beauty Problem",
      shortDescription: "What's the probability it's Monday?",
      fullDescription:
        "Sleeping Beauty is put to sleep. A coin is flipped. Heads: wake Monday only. Tails: wake Monday and Tuesday (memory wiped between). On waking, what's probability of heads?",
      explanation:
        "Thirders say 1/3, Halfers say 1/2. Depends on interpretation of probability. No consensus.",
      category: .probability, origin: "Adam Elga, 2000"),

    Paradox(
      number: 72, name: "Doomsday Argument",
      shortDescription: "We're probably near the end of humanity",
      fullDescription:
        "Assume you're a random human. If many more humans will exist, you'd likely be in the middle. Since you're early, probably not many more humans will exist.",
      explanation:
        "Controversial application of anthropic reasoning. Many reject the 'random sample' assumption.",
      category: .probability, origin: "Brandon Carter, 1983"),

    Paradox(
      number: 73, name: "Simulation Argument", shortDescription: "We're probably in a simulation",
      fullDescription:
        "One of these is true: (1) civilizations die before making simulations, (2) they don't run simulations, or (3) we're almost certainly simulated.",
      explanation:
        "Bostrom's trilemma. If advanced civs run many simulations, simulated minds outnumber real ones. Statistically, you're simulated.",
      category: .philosophy, origin: "Nick Bostrom, 2003"),

    Paradox(
      number: 74, name: "Unexpected Examination Paradox",
      shortDescription: "Same as unexpected hanging",
      fullDescription:
        "A student reasons a surprise exam is impossible using backward induction. Then the exam on Wednesday surprises them.",
      explanation:
        "The reasoning is flawed because it involves self-reference—the student's knowledge affects the outcome.",
      category: .logic, origin: "Variant of hanging"),

    Paradox(
      number: 75, name: "Voting Paradox",
      shortDescription: "Your vote never matters, yet voting matters",
      fullDescription:
        "The probability your single vote changes an election outcome is essentially zero. So why vote? Yet if nobody voted, elections would fail.",
      explanation:
        "Game theory issue. Individual rationality vs. collective rationality. Solutions involve duty, expression, signaling.",
      category: .probability, origin: "Various political theorists"),

    Paradox(
      number: 76, name: "Tragedy of the Commons",
      shortDescription: "Individual benefit leads to collective ruin",
      fullDescription:
        "Farmers sharing a commons benefit from adding more cattle. Each does so rationally. Result: overgrazing destroys the commons for all.",
      explanation:
        "Fundamental collective action problem. Solutions: privatization, regulation, social norms.",
      category: .philosophy, origin: "Garrett Hardin, 1968"),

    Paradox(
      number: 77, name: "Paradox of Enrichment",
      shortDescription: "More resources can destabilize ecosystems",
      fullDescription:
        "Increasing nutrients in an ecosystem can cause predator-prey cycles to become unstable, leading to population crashes and potential extinction.",
      explanation:
        "Real ecological phenomenon. More isn't always better. Systems have complex dynamics.",
      category: .physics, origin: "Michael Rosenzweig, 1971"),

    Paradox(
      number: 78, name: "Braess's Paradox", shortDescription: "Adding a road can increase traffic",
      fullDescription:
        "Adding a new road to a network can increase overall travel time. Drivers choosing individually optimal routes create collectively worse outcomes.",
      explanation:
        "Real phenomenon observed in traffic networks. Sometimes removing roads improves flow.",
      category: .mathematics, origin: "Dietrich Braess, 1968"),

    Paradox(
      number: 79, name: "Coastline Paradox", shortDescription: "Coastlines have no definite length",
      fullDescription:
        "The measured length of a coastline depends on the measurement scale. Smaller rulers measure more detail, increasing length toward infinity.",
      explanation:
        "Coastlines are fractals. Their 'length' depends on resolution. Led to development of fractal dimension.",
      category: .mathematics, origin: "Lewis Fry Richardson"),

    Paradox(
      number: 80, name: "Birthday Paradox",
      shortDescription: "23 people, 50% chance of shared birthday",
      fullDescription:
        "In a room of 23 people, there's a 50% chance two share a birthday. At 70 people, it's 99.9%. Seems too low!",
      explanation:
        "Not paradox—just counterintuitive. We're comparing pairs, not individuals to you. 23 people = 253 pairs.",
      category: .probability, origin: "Probability theory"),

    Paradox(
      number: 81, name: "Paradox of the Court (Extended)",
      shortDescription: "Lawyer must pay either way",
      fullDescription:
        "Full version: if Euathlus wins, he pays by contract. If loses, by judgment. If Protagoras wins, he's paid by judgment. If loses, by contract. Both seem to always win!",
      explanation:
        "Resolution: apply rules in sequence. First judgment, then contract if applicable. But which first?",
      category: .logic, origin: "Ancient Greek expansion"),

    Paradox(
      number: 82, name: "Catch-22", shortDescription: "A rule that contradicts itself",
      fullDescription:
        "To avoid combat missions, a pilot must be declared insane. But requesting evaluation proves sanity (no sane person wants combat). Trapped.",
      explanation:
        "Literary paradox showing bureaucratic absurdity. Any rule can become a catch-22 with self-referential conditions.",
      category: .logic, origin: "Joseph Heller, 1961"),

    Paradox(
      number: 83, name: "Heap Paradox (Money)", shortDescription: "When does wealth become rich?",
      fullDescription:
        "Having $1 isn't rich. If $n isn't rich, $n+1 isn't rich. Therefore, having $1 billion isn't rich. But clearly it is.",
      explanation:
        "Same sorites structure applied to wealth. All continuous spectrums face boundary problems.",
      category: .logic, origin: "Sorites variant"),

    Paradox(
      number: 84, name: "Richard's Paradox",
      shortDescription: "The number defined by this definition",
      fullDescription:
        "List all numbers definable in English in under 100 characters. The 'smallest number not in this list' is definable in under 100 characters—contradiction.",
      explanation:
        "Self-referential paradox of definability. Related to Berry's paradox and Gödel's theorems.",
      category: .mathematics, origin: "Jules Richard, 1905"),

    Paradox(
      number: 85, name: "Skolem's Paradox",
      shortDescription: "Countable models of uncountable sets",
      fullDescription:
        "Set theory proves uncountable sets exist. But by Löwenheim-Skolem, set theory has countable models. How can countable models contain uncountable sets?",
      explanation:
        "The 'uncountable' in the model is uncountable only from inside. From outside, it's countable. Relativity of cardinality.",
      category: .mathematics, origin: "Thoralf Skolem, 1922"),

    Paradox(
      number: 86, name: "Paradox of Knowability",
      shortDescription: "All truths are known if all are knowable",
      fullDescription:
        "Same as Fitch's paradox. If every truth can be known, there are no unknown truths.",
      explanation:
        "Challenges verificationist and anti-realist positions. Strong knowability implies strong realism.",
      category: .logic, origin: "Same as Fitch's"),

    Paradox(
      number: 87, name: "Raven Paradox (Extended)",
      shortDescription: "Everything confirms everything?",
      fullDescription:
        "Generalized: any observation confirms any statement compatible with it. Seeing anything confirms 'all ravens are black' unless it's a non-black raven.",
      explanation:
        "Shows need for relevance in confirmation theory. Not all evidence is equally confirming.",
      category: .logic, origin: "Extension of Hempel's"),

    Paradox(
      number: 88, name: "Unexpected Egg Paradox", shortDescription: "Which egg has the prize?",
      fullDescription:
        "10 numbered eggs, one has prize. You're told you can't deduce which one before finding it. But you reason backward and conclude none can have it.",
      explanation:
        "Same structure as unexpected hanging. Self-referential knowledge defeats prediction.",
      category: .logic, origin: "Variant of hanging"),

    Paradox(
      number: 89, name: "Paradox of Material Implication",
      shortDescription: "False implies anything",
      fullDescription:
        "In classical logic, 'if A then B' is true whenever A is false or B is true. So 'if the moon is cheese, then 2+2=5' is true.",
      explanation:
        "Material implication doesn't capture everyday 'if-then.' Relevance logics attempt to fix this.",
      category: .logic, origin: "Classical logic issue"),

    Paradox(
      number: 90, name: "Unexpected Hanging (Full)", shortDescription: "The complete paradox",
      fullDescription:
        "Judge: 'You'll be hanged at noon next week on a day you cannot predict.' Prisoner proves impossibility. Executed Thursday—surprised.",
      explanation:
        "Backward induction fails because it's self-undermining. If you 'know' it's Thursday, it can't be. But then it can.",
      category: .logic, origin: "1940s various sources"),

    Paradox(
      number: 91, name: "Irresistible Force Paradox",
      shortDescription: "Immovable object meets irresistible force",
      fullDescription: "What happens when an unstoppable force meets an immovable object?",
      explanation:
        "If one exists, the other can't. The paradox assumes contradictory premises. Neither can exist in the same universe.",
      category: .logic, origin: "Ancient Chinese"),

    Paradox(
      number: 92, name: "Penrose Stairs", shortDescription: "The impossible staircase",
      fullDescription:
        "A visual paradox where stairs seem to ascend/descend perpetually while returning to the start. Impossible in 3D.",
      explanation:
        "Exploits 2D representation ambiguity. Can't exist physically. Used in Escher's art and Inception.",
      category: .mathematics, origin: "Lionel & Roger Penrose, 1958"),

    Paradox(
      number: 93, name: "Impossible Trident",
      shortDescription: "The three-pronged two-pronged object",
      fullDescription:
        "A drawing that shows three cylindrical prongs at one end but connects to only two rectangular bars at the other.",
      explanation:
        "Visual paradox exploiting local consistency, global inconsistency. Our brain processes parts but struggles with whole.",
      category: .mathematics, origin: "Unknown, 1960s"),

    Paradox(
      number: 94, name: "Abilene Paradox", shortDescription: "Groups decide what nobody wants",
      fullDescription:
        "A family drives to Abilene for dinner. Afterward, each admits they didn't want to go but thought others did. They all went nowhere they wanted.",
      explanation:
        "Group dynamics can lead to decisions no individual supports. Fear of dissent, assumed consensus.",
      category: .philosophy, origin: "Jerry Harvey, 1974"),

    Paradox(
      number: 95, name: "Paradox of Value", shortDescription: "Water is cheap, diamonds expensive",
      fullDescription:
        "Water is essential for life, diamonds are not. Yet diamonds cost far more. Why do vital things cost less than luxuries?",
      explanation:
        "Resolved by marginalism: price reflects marginal utility, not total utility. Water is abundant, diamonds scarce.",
      category: .philosophy, origin: "Adam Smith noted it"),

    Paradox(
      number: 96, name: "Paradox of Thrift", shortDescription: "Saving more makes everyone poorer",
      fullDescription:
        "If everyone saves more, spending drops. Businesses earn less, lay off workers. Total income drops. People save less in absolute terms.",
      explanation:
        "Keynesian paradox. Individual virtue leads to collective vice. One argument for counter-cyclical policy.",
      category: .philosophy, origin: "John Maynard Keynes"),

    Paradox(
      number: 97, name: "Ship of Theseus (Extended)", shortDescription: "Two ships from one",
      fullDescription:
        "Replace all parts of Theseus's ship, keeping old parts. Reassemble old parts. You have two ships. Which is Theseus's ship?",
      explanation:
        "Both, neither, or the original? No consensus. Some say 'the same ship' is just a useful fiction.",
      category: .identity, origin: "Thomas Hobbes added this"),

    Paradox(
      number: 98, name: "Zeno's Stadium", shortDescription: "Moving rows pass at double speed",
      fullDescription:
        "Rows of soldiers march past each other. From one row's view, another passes at double speed. Zeno argued this proved motion was impossible.",
      explanation:
        "Zeno confused relative motion. We now understand relative velocity. Not a genuine paradox with modern physics.",
      category: .physics, origin: "Zeno of Elea"),

    Paradox(
      number: 99, name: "Paradox of the Question", shortDescription: "Asking creates the answer",
      fullDescription:
        "Some questions presuppose their answers. 'Have you stopped beating your wife?' assumes you did beat her. Answering yes or no confirms it.",
      explanation:
        "Complex questions contain hidden assumptions. The proper response is to reject the presupposition.",
      category: .logic, origin: "Informal logic"),

    Paradox(
      number: 100, name: "Liar's Paradox (Ultimate)",
      shortDescription: "The paradox that breaks logic itself",
      fullDescription:
        "This statement is false. If true, it's false. If false, it's true. No consistent truth value possible. Logic breaks down.",
      explanation:
        "The most fundamental paradox. Led to: truth gaps, truth gluts, revision theory, hierarchy of languages. Still debated.",
      category: .selfReference, origin: "Epimenides, 6th century BCE"),
  ]
}

// MARK: - Paradox Detail View

struct ParadoxDetailView: View {
  let paradox: Paradox

  var body: some View {
    ZStack {
      LinearGradient(
        colors: [Color(hex: "0a0a1a"), Color(hex: "1a1a2a")],
        startPoint: .top,
        endPoint: .bottom
      )
      .ignoresSafeArea()

      ScrollView {
        VStack(alignment: .leading, spacing: 24) {
          // Header
          VStack(alignment: .leading, spacing: 8) {
            HStack {
              Text("#\(paradox.number)")
                .font(.caption)
                .fontWeight(.bold)
                .foregroundStyle(.white)
                .padding(.horizontal, 10)
                .padding(.vertical, 4)
                .background(Color(hex: "9B59B6"))
                .cornerRadius(12)

              Text(paradox.category.rawValue)
                .font(.caption)
                .foregroundStyle(Color(hex: "9B59B6"))
            }

            Text(paradox.name)
              .font(.title)
              .fontWeight(.bold)
              .foregroundStyle(.white)

            Text(paradox.origin)
              .font(.caption)
              .foregroundStyle(.white.opacity(0.5))
          }
          .padding(.top, 20)

          // Short Description
          Text("\"\(paradox.shortDescription)\"")
            .font(.headline)
            .italic()
            .foregroundStyle(Color(hex: "9B59B6"))

          // Full Description
          VStack(alignment: .leading, spacing: 8) {
            Text("📖 THE PARADOX")
              .font(.caption)
              .foregroundStyle(.white.opacity(0.6))
              .tracking(2)

            Text(paradox.fullDescription)
              .font(.body)
              .foregroundStyle(.white.opacity(0.9))
              .lineSpacing(4)
          }
          .padding()
          .background(Color.white.opacity(0.05))
          .cornerRadius(12)

          // Explanation
          VStack(alignment: .leading, spacing: 8) {
            Text("💡 EXPLANATION / RESOLUTION")
              .font(.caption)
              .foregroundStyle(.white.opacity(0.6))
              .tracking(2)

            Text(paradox.explanation)
              .font(.body)
              .foregroundStyle(.white.opacity(0.9))
              .lineSpacing(4)
          }
          .padding()
          .background(Color(hex: "9B59B6").opacity(0.1))
          .cornerRadius(12)

          Spacer(minLength: 50)
        }
        .padding(.horizontal, 20)
      }
    }
    .navigationBarTitleDisplayMode(.inline)
  }
}

#Preview {
  ParadoxesDatabaseView()
}
