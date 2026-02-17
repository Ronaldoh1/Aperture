// GuidedMeditationScripts.swift
// Voice-guided meditation scripts for each awakening tradition
// These scripts are read by AVSpeechSynthesizer during timed practice

import AVFoundation
import AudioToolbox
import Foundation

// MARK: - Meditation Script Model

struct GuidedMeditationScript: Identifiable {
  let id = UUID()
  let tradition: String
  let title: String
  let duration: Int  // minutes
  let phases: [MeditationPhase]
  let closingAffirmation: String
}

struct MeditationPhase: Identifiable {
  let id = UUID()
  let name: String
  let startPercent: Double  // 0.0 to 1.0
  let guidance: String
  let pauseSeconds: Int  // silence after guidance
}

// MARK: - All Guided Scripts

enum GuidedMeditationLibrary {
  // MARK: - Kundalini (Hinduism)

  static let kundaliniBreathwork = GuidedMeditationScript(
    tradition: "Kundalini",
    title: "Chakra Awakening Breathwork",
    duration: 15,
    phases: [
      MeditationPhase(
        name: "Opening",
        startPercent: 0.0,
        guidance:
          "Find a comfortable seated position. Spine straight, shoulders relaxed. Close your eyes. Take three deep breaths, releasing any tension with each exhale.",
        pauseSeconds: 20
      ),
      MeditationPhase(
        name: "Root Grounding",
        startPercent: 0.05,
        guidance:
          "Bring your awareness to the base of your spine. The root chakra. Muladhara. Visualize a glowing red light here. With each breath, this light grows brighter. Feel your connection to the earth.",
        pauseSeconds: 60
      ),
      MeditationPhase(
        name: "Sacral Activation",
        startPercent: 0.15,
        guidance:
          "Now move your awareness upward to just below the navel. The sacral chakra. Svadhisthana. See an orange glow beginning to pulse. This is your creative life force. Let it flow.",
        pauseSeconds: 60
      ),
      MeditationPhase(
        name: "Solar Plexus",
        startPercent: 0.25,
        guidance:
          "Rise to your solar plexus. Manipura. A golden yellow sun radiates here. This is your power center. Your will. Feel it growing stronger with each breath.",
        pauseSeconds: 60
      ),
      MeditationPhase(
        name: "Heart Opening",
        startPercent: 0.35,
        guidance:
          "Ascend to your heart center. Anahata. Emerald green light expands from your chest. Love. Compassion. Connection. Let your heart open fully.",
        pauseSeconds: 60
      ),
      MeditationPhase(
        name: "Throat Expression",
        startPercent: 0.45,
        guidance:
          "Move to your throat. Vishuddha. Sky blue light glows here. Your voice. Your truth. Your authentic expression. Breathe into this space.",
        pauseSeconds: 60
      ),
      MeditationPhase(
        name: "Third Eye",
        startPercent: 0.55,
        guidance:
          "Rise to the point between your eyebrows. Ajna. Deep indigo light pulses here. Your inner vision. Your intuition. See beyond the physical.",
        pauseSeconds: 60
      ),
      MeditationPhase(
        name: "Crown Opening",
        startPercent: 0.65,
        guidance:
          "Finally, arrive at the crown of your head. Sahasrara. Violet light streams upward, connecting you to the infinite. You are not separate. You are one with all.",
        pauseSeconds: 60
      ),
      MeditationPhase(
        name: "Full Channel",
        startPercent: 0.75,
        guidance:
          "Now see all seven centers connected by a column of white light. Energy flows freely from root to crown. Crown to root. You are a conduit of cosmic energy.",
        pauseSeconds: 90
      ),
      MeditationPhase(
        name: "Integration",
        startPercent: 0.90,
        guidance:
          "Gently begin to return. Keep the channels open but bring awareness back to your body. Wiggle your fingers and toes. When you're ready, slowly open your eyes.",
        pauseSeconds: 30
      ),
    ],
    closingAffirmation:
      "The energy that moves through you is the same energy that moves through all things. You are awake. You are connected. You are one."
  )

  // MARK: - Taoism (Qi Cultivation)

  static let qigongMeditation = GuidedMeditationScript(
    tradition: "Taoism",
    title: "Dantian Qi Cultivation",
    duration: 15,
    phases: [
      MeditationPhase(
        name: "Settling",
        startPercent: 0.0,
        guidance:
          "Stand or sit comfortably. Let your body be soft. Relaxed but alert. Like a tree—rooted below, reaching above. Breathe naturally.",
        pauseSeconds: 20
      ),
      MeditationPhase(
        name: "Grounding",
        startPercent: 0.05,
        guidance:
          "Imagine roots growing from the soles of your feet, deep into the earth. With each exhale, release tension down through these roots. With each inhale, draw earth energy upward.",
        pauseSeconds: 45
      ),
      MeditationPhase(
        name: "Lower Dantian",
        startPercent: 0.15,
        guidance:
          "Bring your attention to your lower dantian—three finger widths below your navel, deep inside. This is your energy reservoir. Place your hands there if you wish. Breathe into this center.",
        pauseSeconds: 60
      ),
      MeditationPhase(
        name: "Gathering Qi",
        startPercent: 0.25,
        guidance:
          "With each inhale, imagine drawing golden light into your dantian. This is Qi—life force. It gathers and concentrates, growing warmer, brighter. A glowing ball of energy forms.",
        pauseSeconds: 90
      ),
      MeditationPhase(
        name: "Circulating",
        startPercent: 0.40,
        guidance:
          "Now let this energy begin to move. On the inhale, guide it down to the base of your spine. On the exhale, let it rise up your back to the crown. Inhale down the front. Exhale up the back. The microcosmic orbit.",
        pauseSeconds: 120
      ),
      MeditationPhase(
        name: "Expansion",
        startPercent: 0.65,
        guidance:
          "Let the orbit expand. Energy flows not just through you but around you. You are surrounded by your own energy field. Soft. Protective. Connected to all life.",
        pauseSeconds: 60
      ),
      MeditationPhase(
        name: "Stillness",
        startPercent: 0.80,
        guidance:
          "Now simply be still. Let the Qi settle naturally. Return to the dantian. Store the energy there. It will be available when you need it. This is your battery.",
        pauseSeconds: 45
      ),
      MeditationPhase(
        name: "Return",
        startPercent: 0.92,
        guidance:
          "Rub your palms together to seal the practice. Place warm hands on your face. On your heart. Return fully to the present moment.",
        pauseSeconds: 20
      ),
    ],
    closingAffirmation:
      "You have cultivated your vital energy. Carry this Qi with you. Let it inform your actions. Flow like water. Be like the Tao—effortless yet accomplishing all things."
  )

  // MARK: - Buddhism (Vipassana)

  static let vipassanaMeditation = GuidedMeditationScript(
    tradition: "Buddhism",
    title: "Insight Meditation (Vipassana)",
    duration: 20,
    phases: [
      MeditationPhase(
        name: "Arrival",
        startPercent: 0.0,
        guidance:
          "Sit in a stable, comfortable position. Back straight but not rigid. Hands resting naturally. Let your eyes close gently. You are here. This is all there is.",
        pauseSeconds: 20
      ),
      MeditationPhase(
        name: "Breath Awareness",
        startPercent: 0.05,
        guidance:
          "Bring attention to your breath. Don't control it. Simply observe. Notice the sensation of air entering your nostrils. The rise of your chest. The fall of your belly. Just this.",
        pauseSeconds: 60
      ),
      MeditationPhase(
        name: "Noting",
        startPercent: 0.12,
        guidance:
          "When thoughts arise, and they will, simply note them. 'Thinking.' When sounds arise, note 'hearing.' Sensations, note 'feeling.' Don't judge. Don't engage. Just note and return to breath.",
        pauseSeconds: 90
      ),
      MeditationPhase(
        name: "Body Scan",
        startPercent: 0.25,
        guidance:
          "Now scan your body systematically. Start at the top of your head. Move slowly downward. Notice any sensations—tingling, pressure, warmth, coolness. Don't react. Just observe. Everything changes.",
        pauseSeconds: 120
      ),
      MeditationPhase(
        name: "Impermanence",
        startPercent: 0.45,
        guidance:
          "Notice how every sensation arises and passes away. No sensation is permanent. This is anicca—impermanence. What arises, ceases. Including thoughts. Including emotions. Including this body.",
        pauseSeconds: 90
      ),
      MeditationPhase(
        name: "Non-Self",
        startPercent: 0.60,
        guidance:
          "Who is observing these sensations? Can you find a fixed, permanent self? Look closely. Thoughts arise—but who thinks? Awareness is present—but where does it come from? This is anatta—not-self.",
        pauseSeconds: 90
      ),
      MeditationPhase(
        name: "Equanimity",
        startPercent: 0.75,
        guidance:
          "Whatever arises, meet it with equanimity. Pleasant sensation—don't grasp. Unpleasant sensation—don't resist. Just observe. This balanced awareness is the path to liberation.",
        pauseSeconds: 60
      ),
      MeditationPhase(
        name: "Metta",
        startPercent: 0.85,
        guidance:
          "As we close, send loving-kindness to yourself. May I be happy. May I be peaceful. May I be free from suffering. Extend this to all beings. May all beings be happy. May all beings be free.",
        pauseSeconds: 45
      ),
      MeditationPhase(
        name: "Return",
        startPercent: 0.95,
        guidance:
          "Gently bring awareness back to the room. To your body. To the present moment. When ready, open your eyes. Carry this awareness forward.",
        pauseSeconds: 15
      ),
    ],
    closingAffirmation:
      "You have glimpsed the nature of reality. Impermanent. Without fixed self. But also without suffering when seen clearly. This is the path. Walk it with compassion."
  )

  // MARK: - Sufism (Dhikr)

  static let sufiDhikr = GuidedMeditationScript(
    tradition: "Sufism",
    title: "Heart Remembrance (Dhikr)",
    duration: 15,
    phases: [
      MeditationPhase(
        name: "Opening",
        startPercent: 0.0,
        guidance:
          "Sit comfortably. Place your hand on your heart. Feel it beating. This heart that longs for the Beloved. This heart that has always known. Close your eyes and turn inward.",
        pauseSeconds: 20
      ),
      MeditationPhase(
        name: "Heart Focus",
        startPercent: 0.08,
        guidance:
          "Breathe deeply into your heart center. With each breath, feel your heart expanding. Softening. Opening. The Beloved is not far. The Beloved is here. Within you. As you.",
        pauseSeconds: 45
      ),
      MeditationPhase(
        name: "Beginning Dhikr",
        startPercent: 0.18,
        guidance:
          "Now we begin the remembrance. With each exhale, silently say 'La ilaha'—there is no god. With each inhale, 'illa Allah'—except God. Or simply 'Allah' with each breath. Let the name fill you.",
        pauseSeconds: 90
      ),
      MeditationPhase(
        name: "Deepening",
        startPercent: 0.35,
        guidance:
          "Let the repetition become automatic. You are not doing the dhikr—the dhikr is doing you. The name breathes you. You are being remembered by the One who never forgot.",
        pauseSeconds: 90
      ),
      MeditationPhase(
        name: "Heart Melting",
        startPercent: 0.52,
        guidance:
          "Feel the boundaries of your heart softening. Dissolving. Where do you end and the Divine begin? The drop returns to the ocean. You have never been separate.",
        pauseSeconds: 75
      ),
      MeditationPhase(
        name: "Fana",
        startPercent: 0.68,
        guidance:
          "Let yourself dissolve. This is fana—annihilation in God. Not death but true life. Not loss but finding. The 'I' that sought was always the Beloved seeking itself.",
        pauseSeconds: 60
      ),
      MeditationPhase(
        name: "Baqa",
        startPercent: 0.82,
        guidance:
          "And from this emptiness, presence returns. Baqa—subsisting in God. You are still here, but transformed. The same, yet utterly different. Eyes washed clean.",
        pauseSeconds: 45
      ),
      MeditationPhase(
        name: "Return",
        startPercent: 0.93,
        guidance:
          "Gently return to ordinary awareness. But know that ordinary is now sacred. Keep the remembrance in your heart. It continues even as you act in the world.",
        pauseSeconds: 20
      ),
    ],
    closingAffirmation:
      "The Beloved has always been closer than your jugular vein. You remembered. And in remembering, you were remembered. This love is the only truth."
  )

  // MARK: - Christianity (Contemplative)

  static let centeringPrayer = GuidedMeditationScript(
    tradition: "Christianity",
    title: "Centering Prayer",
    duration: 20,
    phases: [
      MeditationPhase(
        name: "Opening",
        startPercent: 0.0,
        guidance:
          "Sit comfortably. Close your eyes. Take a moment to settle into God's presence. The Kingdom of Heaven is within you. Christ dwells in your heart. You are here to consent to that presence.",
        pauseSeconds: 25
      ),
      MeditationPhase(
        name: "Sacred Word",
        startPercent: 0.07,
        guidance:
          "Choose a sacred word as symbol of your intention to consent to God's presence. It might be Jesus, Abba, Love, Peace, or another word. Let this word express your openness.",
        pauseSeconds: 30
      ),
      MeditationPhase(
        name: "Beginning",
        startPercent: 0.12,
        guidance:
          "Introduce your sacred word gently. Don't repeat it constantly—just use it to return when you notice thoughts. The word is like a gesture of consent, turning back toward the divine.",
        pauseSeconds: 60
      ),
      MeditationPhase(
        name: "Letting Go",
        startPercent: 0.22,
        guidance:
          "Thoughts will come. This is normal. Don't fight them. When you notice yourself engaged with a thought, gently return to your sacred word. No judgment. Just return. Again and again.",
        pauseSeconds: 120
      ),
      MeditationPhase(
        name: "Deepening",
        startPercent: 0.42,
        guidance:
          "Sometimes the mind quiets. Sometimes it doesn't. Either way, you are consenting. You are letting go. Kenosis—self-emptying. Making room for God to work.",
        pauseSeconds: 120
      ),
      MeditationPhase(
        name: "Resting",
        startPercent: 0.62,
        guidance:
          "Rest in God's presence. Beyond words. Beyond images. Beyond thoughts. The cloud of unknowing, as the mystics called it. Not knowing, but being known. Being loved.",
        pauseSeconds: 120
      ),
      MeditationPhase(
        name: "Integration",
        startPercent: 0.82,
        guidance:
          "Slowly begin to return. But the presence doesn't leave. It goes with you. In you. As you. Carry this stillness into the world. Let it transform your seeing, your acting, your loving.",
        pauseSeconds: 60
      ),
      MeditationPhase(
        name: "Closing",
        startPercent: 0.95,
        guidance:
          "End with a moment of gratitude. Perhaps the Lord's Prayer if it calls to you. Then gently open your eyes. You are sent forth—contemplation becomes action.",
        pauseSeconds: 20
      ),
    ],
    closingAffirmation:
      "Christ in you, the hope of glory. You have consented to the divine embrace. Go now and be Christ's presence in the world. Love as you have been loved."
  )

  // MARK: - Zen (Zazen)

  static let zazenMeditation = GuidedMeditationScript(
    tradition: "Zen",
    title: "Zazen - Just Sitting",
    duration: 20,
    phases: [
      MeditationPhase(
        name: "Posture",
        startPercent: 0.0,
        guidance:
          "Take your seat. Full lotus, half lotus, or simply sitting—find stability. Stack your vertebrae. Crown reaching upward. Shoulders relaxed. Hands in cosmic mudra, left palm resting in right, thumbs lightly touching.",
        pauseSeconds: 20
      ),
      MeditationPhase(
        name: "Eyes",
        startPercent: 0.05,
        guidance:
          "Eyes remain slightly open. Gaze downward at forty-five degrees. Rest your vision on the floor a few feet ahead. Not focusing, not defocusing. Just seeing without grasping at sight.",
        pauseSeconds: 15
      ),
      MeditationPhase(
        name: "Breath",
        startPercent: 0.08,
        guidance:
          "Let breath come and go naturally. You may count breaths one to ten, then begin again. Or simply be with each breath as it arises. Don't control. Don't manipulate. Just witness.",
        pauseSeconds: 60
      ),
      MeditationPhase(
        name: "Mind",
        startPercent: 0.18,
        guidance:
          "Thoughts arise like clouds in a sky. Let them pass. Don't chase them. Don't push them away. In Zen we say: thoughts are not the problem. Attaching to thoughts is the problem. Let them go.",
        pauseSeconds: 90
      ),
      MeditationPhase(
        name: "Just Sitting",
        startPercent: 0.33,
        guidance:
          "Now drop all technique. Don't count. Don't follow breath. Just sit. Shikantaza. Nothing to achieve. Nowhere to go. No one to become. This moment, complete as it is.",
        pauseSeconds: 180
      ),
      MeditationPhase(
        name: "Continued Sitting",
        startPercent: 0.58,
        guidance:
          "Continue sitting. If boredom arises, sit with boredom. If restlessness arises, sit with restlessness. These too are Buddha nature. Everything is already enlightened. Even confusion is enlightened confusion.",
        pauseSeconds: 180
      ),
      MeditationPhase(
        name: "Bell Warning",
        startPercent: 0.88,
        guidance:
          "We will close soon. Don't rush toward the ending. These final moments are as precious as the first. Stay present. The practice is always now.",
        pauseSeconds: 60
      ),
      MeditationPhase(
        name: "Closing",
        startPercent: 0.97,
        guidance:
          "Gently bring palms together. Bow to the Buddha within. Bow to the Buddha without. Carry this stillness forward. Walking, eating, working—all zazen.",
        pauseSeconds: 15
      ),
    ],
    closingAffirmation:
      "Nothing is lacking. You have always been complete. This very mind is Buddha. Take this realization into the marketplace. Chop wood, carry water—awakened."
  )

  // MARK: - Shamanic Journey

  static let shamanicJourney = GuidedMeditationScript(
    tradition: "Shamanism",
    title: "Journey to the Lower World",
    duration: 15,
    phases: [
      MeditationPhase(
        name: "Preparation",
        startPercent: 0.0,
        guidance:
          "Lie down comfortably. Cover your eyes if you wish. You are about to journey to the lower world to meet your power animal. Set your intention: you seek guidance, healing, or connection with your spirit ally.",
        pauseSeconds: 20
      ),
      MeditationPhase(
        name: "Entry Point",
        startPercent: 0.08,
        guidance:
          "Imagine a place in nature where you can enter the earth. A cave, a hole in a tree, a pool of water, a hollow in the ground. See it clearly. This is your gateway. Approach it now.",
        pauseSeconds: 30
      ),
      MeditationPhase(
        name: "Descent",
        startPercent: 0.15,
        guidance:
          "Enter your gateway and begin to descend. Down, down into the earth. You may pass through tunnels, roots, or simply sink through layers. Keep going down until you emerge into another landscape.",
        pauseSeconds: 45
      ),
      MeditationPhase(
        name: "Lower World",
        startPercent: 0.27,
        guidance:
          "You emerge into the lower world. It may appear as a natural landscape—forest, meadow, desert, ocean. Look around. Notice what you see. What you feel. This is real. Trust your vision.",
        pauseSeconds: 60
      ),
      MeditationPhase(
        name: "Seeking",
        startPercent: 0.40,
        guidance:
          "Begin to explore. Call silently for your power animal. Walk through this landscape. An animal may appear—it might be expected or surprising. If an animal shows itself four times, this is your ally.",
        pauseSeconds: 90
      ),
      MeditationPhase(
        name: "Meeting",
        startPercent: 0.58,
        guidance:
          "When you meet your power animal, approach with respect. You may ask questions. You may simply be together. Notice how this being makes you feel. Receive whatever message or energy they offer.",
        pauseSeconds: 90
      ),
      MeditationPhase(
        name: "Return",
        startPercent: 0.75,
        guidance:
          "It is time to return. Thank your power animal. They will always be available when you journey. Begin to retrace your steps. Back through the landscape. Back to your entry point.",
        pauseSeconds: 45
      ),
      MeditationPhase(
        name: "Ascent",
        startPercent: 0.85,
        guidance:
          "Rise up through the tunnel. Up through the earth. Carrying with you the energy and wisdom of your journey. Emerge back into ordinary reality. Feel your body on the ground.",
        pauseSeconds: 30
      ),
      MeditationPhase(
        name: "Grounding",
        startPercent: 0.93,
        guidance:
          "Wiggle your fingers and toes. Feel the weight of your body. Take several deep breaths. When you're ready, open your eyes. Stamp your feet to ground fully. The journey is complete.",
        pauseSeconds: 20
      ),
    ],
    closingAffirmation:
      "You have journeyed between the worlds. Your power animal walks with you now—in this world and all worlds. Call upon this ally in times of need. The connection is real."
  )

  // MARK: - Library Access

  static let allScripts: [GuidedMeditationScript] = [
    kundaliniBreathwork,
    qigongMeditation,
    vipassanaMeditation,
    sufiDhikr,
    centeringPrayer,
    zazenMeditation,
    shamanicJourney,
  ]

  static func script(for tradition: String) -> GuidedMeditationScript? {
    allScripts.first { $0.tradition.lowercased() == tradition.lowercased() }
  }
}

// MARK: - Voice Guide Extensions

extension PracticeTimerManager {
  // Static storage for guided meditation state
  private static var _guidedTimer: Timer?
  private static var _guidedSynthesizer = AVSpeechSynthesizer()
  private static var _currentScriptStorage: GuidedMeditationScript?

  private var guidedTimer: Timer? {
    get { PracticeTimerManager._guidedTimer }
    set { PracticeTimerManager._guidedTimer = newValue }
  }

  private var guidedSynthesizer: AVSpeechSynthesizer {
    PracticeTimerManager._guidedSynthesizer
  }

  private var currentScript: GuidedMeditationScript? {
    get { PracticeTimerManager._currentScriptStorage }
    set { PracticeTimerManager._currentScriptStorage = newValue }
  }

  func startGuidedMeditation(_ script: GuidedMeditationScript) {
    totalTime = script.duration * 60
    timeRemaining = totalTime
    isComplete = false
    isPaused = false
    currentScript = script

    guidedTimer?.invalidate()
    guidedTimer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [weak self] _ in
      self?.tickGuided()
    }
  }

  private func tickGuided() {
    guard !isPaused else { return }

    if timeRemaining > 0 {
      timeRemaining -= 1
      progress = Double(timeRemaining) / Double(totalTime)

      // Check for phase transitions
      checkPhaseTransitions()
    } else {
      completeGuided()
    }
  }

  private func checkPhaseTransitions() {
    guard let script = currentScript else { return }

    let elapsed = totalTime - timeRemaining
    let percentComplete = Double(elapsed) / Double(totalTime)

    // Find current phase
    for phase in script.phases {
      if abs(percentComplete - phase.startPercent) < 0.001 {  // Just entered this phase
        currentPhase = phase.name
        if voiceGuidanceEnabled {
          speakGuided(phase.guidance)
        }
        statusMessage = phase.name
      }
    }
  }

  private func speakGuided(_ text: String) {
    let utterance = AVSpeechUtterance(string: text)
    utterance.rate = 0.42  // Even slower for meditation
    utterance.pitchMultiplier = 0.85  // Lower, calmer pitch
    utterance.preUtteranceDelay = 0.5
    utterance.postUtteranceDelay = 1.0
    utterance.volume = 0.75

    if let voice = AVSpeechSynthesisVoice(language: "en-US") {
      utterance.voice = voice
    }

    guidedSynthesizer.speak(utterance)
  }

  private func completeGuided() {
    guidedTimer?.invalidate()
    guidedTimer = nil
    isComplete = true

    if let script = currentScript, voiceGuidanceEnabled {
      speakGuided(script.closingAffirmation)
    }

    AudioServicesPlaySystemSound(1007)
  }
}
