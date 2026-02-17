// EmotionalProcessingSheet.swift
// Guides for grief, anger, betrayal that comes with awakening

import SwiftUI

struct EmotionalProcessingSheet: View {
  let onDismiss: () -> Void

  @State private var selectedGuide: EmotionalGuide?

  var body: some View {
    ZStack {
      Color.black.ignoresSafeArea()

      VStack(spacing: 0) {
        // Header
        HStack {
          VStack(alignment: .leading, spacing: 4) {
            Text("Emotional Processing").font(.system(size: 20, weight: .bold, design: .rounded))
              .foregroundColor(Palette.text.primary)
            Text("The Dark Night of the Soul").font(
              .system(size: 13, weight: .medium, design: .rounded)
            ).foregroundColor(Color.pink)
          }
          Spacer()
          Button(action: onDismiss) {
            Image(systemName: "xmark.circle.fill").font(.system(size: 28)).foregroundColor(
              Palette.text.secondary)
          }
        }
        .padding(.horizontal, 20).padding(.top, 20).padding(.bottom, 16)

        ScrollView {
          VStack(alignment: .leading, spacing: 24) {
            // Intro
            VStack(alignment: .leading, spacing: 12) {
              HStack(spacing: 10) {
                Text("🌑").font(.system(size: 24))
                Text("AWAKENING ISN'T ALL LIGHT").font(
                  .system(size: 12, weight: .bold, design: .rounded)
                ).tracking(1).foregroundColor(Color.pink)
              }

              Text(
                "When you start seeing through the illusions, emotions arise. Grief for the life you thought was real. Anger at those who lied. Betrayal from systems you trusted.\n\nThese feelings are not obstacles to awakening—they ARE the awakening. You cannot skip this part."
              )
              .font(.system(size: 14, weight: .medium, design: .rounded))
              .foregroundColor(Palette.text.primary)
              .lineSpacing(5)
            }
            .padding(16)
            .background(
              RoundedRectangle(cornerRadius: 14, style: .continuous)
                .fill(Color.pink.opacity(0.1))
                .overlay(
                  RoundedRectangle(cornerRadius: 14, style: .continuous).stroke(
                    Color.pink.opacity(0.3), lineWidth: 1))
            )

            // Guide Cards
            ForEach(EmotionalGuide.allGuides) { guide in
              GuideCard(guide: guide)
                .onTapGesture { selectedGuide = guide }
            }

            // Dragon wisdom
            HStack(alignment: .top, spacing: 12) {
              Text("🐉").font(.system(size: 20))
              Text(
                "\"The wound is where the light enters you.\" You're not broken—you're breaking open. Let the old self grieve so the new self can emerge."
              )
              .font(.system(size: 13, weight: .medium, design: .rounded))
              .italic()
              .foregroundColor(Palette.accent.gold)
              .lineSpacing(4)
            }
            .padding(14)
            .background(
              RoundedRectangle(cornerRadius: 12, style: .continuous)
                .fill(Palette.accent.gold.opacity(0.1))
            )

            Spacer(minLength: 40)
          }
          .padding(.horizontal, 20)
        }
      }
    }
    .sheet(item: $selectedGuide) { guide in
      GuideDetailView(guide: guide) { selectedGuide = nil }
    }
  }
}

// MARK: - Emotional Guide Model

struct EmotionalGuide: Identifiable {
  let id: String
  let title: String
  let subtitle: String
  let icon: String
  let color: Color
  let overview: String
  let symptoms: [String]
  let practices: [Practice]
  let affirmations: [String]

  struct Practice: Identifiable {
    let id = UUID()
    let name: String
    let instructions: String
    let duration: String
  }

  static let allGuides: [EmotionalGuide] = [
    // GRIEF
    EmotionalGuide(
      id: "grief",
      title: "Grief",
      subtitle: "Mourning the life you thought was real",
      icon: "drop.fill",
      color: .blue,
      overview:
        "You're grieving the loss of certainty. The comfortable world you believed in has dissolved. This is not weakness—this is the cost of truth. Let yourself mourn what never was.",
      symptoms: [
        "Sadness that seems to have no specific cause",
        "Nostalgia for 'before you knew'",
        "Feeling like you've lost something you can't name",
        "Crying at unexpected moments",
        "Wanting to go back to not knowing",
      ],
      practices: [
        Practice(
          name: "Conscious Grieving",
          instructions:
            "Set a timer for 10 minutes. Let yourself feel the loss fully. Cry if you need to. When the timer ends, take three deep breaths and say: 'I release what was never mine to keep.'",
          duration: "10 min"),
        Practice(
          name: "Letter to Your Old Self",
          instructions:
            "Write a letter to the version of you who believed the old narratives. Thank them for surviving. Let them know it's okay to rest now.",
          duration: "15-20 min"),
        Practice(
          name: "Honoring the Death",
          instructions:
            "Light a candle. Sit in silence for 5 minutes. Acknowledge that something has died: your old worldview, your innocence, your trust. This is a funeral. Treat it as such.",
          duration: "10 min"),
      ],
      affirmations: [
        "I am allowed to grieve what I've lost",
        "Truth is worth more than comfort",
        "I am not losing myself—I am finding myself",
        "The pain I feel is the cost of waking up",
      ]
    ),

    // ANGER
    EmotionalGuide(
      id: "anger",
      title: "Anger",
      subtitle: "Rage at the systems that deceived you",
      icon: "flame.fill",
      color: .red,
      overview:
        "Your anger is valid. You were lied to by institutions you trusted. The rage you feel is your life force demanding justice. Channel it wisely—anger is rocket fuel, not a destination.",
      symptoms: [
        "Rage at parents, teachers, government, media",
        "Wanting to shake people awake",
        "Feeling furious at your past compliance",
        "Explosive reactions to 'asleep' people",
        "Fantasies of revenge or exposure",
      ],
      practices: [
        Practice(
          name: "Controlled Burn",
          instructions:
            "Physical movement to release anger: run, lift weights, punch a pillow, scream into a pillow. The energy needs to move through your body, not stay stuck in your head.",
          duration: "15-30 min"),
        Practice(
          name: "Anger Inventory",
          instructions:
            "List everyone and everything you're angry at. For each one, write: 'I am angry at ___ because ___.' Then ask: 'What did I expect that wasn't delivered?'",
          duration: "20 min"),
        Practice(
          name: "Transmutation Practice",
          instructions:
            "Sit with the anger. Feel it as pure energy. Ask: 'What does this anger want to create?' Anger is fuel. Where do you want to direct it?",
          duration: "10 min"),
      ],
      affirmations: [
        "My anger is valid and informative",
        "I can feel rage without becoming destructive",
        "This fire will forge something new",
        "I direct my anger toward creation, not destruction",
      ]
    ),

    // BETRAYAL
    EmotionalGuide(
      id: "betrayal",
      title: "Betrayal",
      subtitle: "Trust shattered by those you believed",
      icon: "heart.slash.fill",
      color: .purple,
      overview:
        "The deepest wound of awakening is betrayal. Not by enemies, but by those who were supposed to protect you: family, teachers, doctors, leaders. Learning to trust again starts with trusting yourself.",
      symptoms: [
        "Difficulty trusting anyone, including yourself",
        "Replaying moments you 'should have seen it'",
        "Feeling foolish for believing",
        "Hypervigilance about being deceived again",
        "Isolation to avoid further betrayal",
      ],
      practices: [
        Practice(
          name: "Betrayal Mapping",
          instructions:
            "List the betrayals: who, what they promised, what actually happened. For each: 'I trusted ___ to ___. Instead they ___.' This externalizes the pain and makes it workable.",
          duration: "20 min"),
        Practice(
          name: "Self-Trust Rebuilding",
          instructions:
            "List 3 times you knew something was wrong but ignored your intuition. For each one, say: 'I hear you now. I won't abandon you again.' Promise yourself you'll listen to your inner knowing.",
          duration: "15 min"),
        Practice(
          name: "Forgiveness Practice (Optional)",
          instructions:
            "Note: Forgiveness is not required. But if you're ready: 'I forgive ___ not because what they did was okay, but because I refuse to carry this poison anymore.'",
          duration: "As needed"),
      ],
      affirmations: [
        "I can trust my own perception",
        "Not everyone will betray me",
        "I am learning who deserves my trust",
        "Being deceived doesn't make me foolish—it makes me human",
      ]
    ),

    // LONELINESS
    EmotionalGuide(
      id: "loneliness",
      title: "Loneliness",
      subtitle: "The isolation of seeing what others don't",
      icon: "person.fill.questionmark",
      color: .gray,
      overview:
        "You see patterns others miss. You can't unsee them. This creates profound loneliness—you're living in a different reality than most people around you. This is the price of awareness. You are not alone in being alone.",
      symptoms: [
        "Feeling like an alien among friends and family",
        "Conversations that used to satisfy now feel hollow",
        "Not being able to share what you're experiencing",
        "Wondering if you're the crazy one",
        "Deep yearning to be truly seen and understood",
      ],
      practices: [
        Practice(
          name: "Finding Your People",
          instructions:
            "You don't need many—just a few who understand. One real conversation with someone who 'gets it' is worth more than a hundred surface interactions. Actively seek these connections.",
          duration: "Ongoing"),
        Practice(
          name: "Solitude vs. Isolation",
          instructions:
            "Solitude is chosen and nourishing. Isolation is forced and depleting. Practice being alone without being lonely. Your own company is valuable.",
          duration: "30 min daily"),
        Practice(
          name: "The Lighthouse Practice",
          instructions:
            "You are a lighthouse. You don't chase ships—you shine your light. Those who are ready will find you. Keep shining. Your existence helps others navigate.",
          duration: "Mindset shift"),
      ],
      affirmations: [
        "I am not alone in this experience",
        "My perception is valid even when others don't share it",
        "Quality of connection matters more than quantity",
        "I am a lighthouse, not a rescue boat",
      ]
    ),

    // DISORIENTATION
    EmotionalGuide(
      id: "disorientation",
      title: "Disorientation",
      subtitle: "When nothing makes sense anymore",
      icon: "questionmark.circle.fill",
      color: .orange,
      overview:
        "The old maps don't work anymore. Your previous beliefs were the floor you stood on—now it's gone. Disorientation is normal. You're not falling apart; you're falling into something bigger. The confusion is temporary; the clarity is permanent.",
      symptoms: [
        "Not knowing what to believe anymore",
        "Questioning everything, including your own sanity",
        "Feeling groundless and unstable",
        "Difficulty making decisions",
        "Identity confusion: 'Who am I if not what I believed?'",
      ],
      practices: [
        Practice(
          name: "Grounding Anchors",
          instructions:
            "Find 3-5 things you know to be true from direct experience, not belief. 'I am breathing. The ground is beneath me. I have a body.' Build from direct experience, not inherited narratives.",
          duration: "5 min as needed"),
        Practice(
          name: "The Not-Knowing Practice",
          instructions:
            "Sit in the uncertainty without trying to resolve it. Say: 'I don't know, and that's okay.' Let not-knowing be a doorway, not a prison. Certainty was an illusion anyway.",
          duration: "10 min"),
        Practice(
          name: "New Identity Sketching",
          instructions:
            "Who are you without your old beliefs? What values remain? What matters now? Write freely without editing. Let a new self-image emerge organically.",
          duration: "20 min"),
      ],
      affirmations: [
        "Confusion is part of the process",
        "I don't need to have all the answers right now",
        "I am more than my beliefs",
        "Not knowing is the beginning of wisdom",
      ]
    ),
  ]
}

// MARK: - Guide Card

struct GuideCard: View {
  let guide: EmotionalGuide

  var body: some View {
    HStack(spacing: 14) {
      ZStack {
        Circle().fill(guide.color.opacity(0.2)).frame(width: 50, height: 50)
        Image(systemName: guide.icon).font(.system(size: 22, weight: .semibold)).foregroundColor(
          guide.color)
      }

      VStack(alignment: .leading, spacing: 4) {
        Text(guide.title)
          .font(.system(size: 16, weight: .bold, design: .rounded))
          .foregroundColor(Palette.text.primary)
        Text(guide.subtitle)
          .font(.system(size: 12, weight: .medium, design: .rounded))
          .foregroundColor(Palette.text.secondary)
          .lineLimit(1)
      }

      Spacer()

      VStack(alignment: .trailing, spacing: 4) {
        Text("\(guide.practices.count) practices")
          .font(.system(size: 11, weight: .semibold, design: .rounded))
          .foregroundColor(guide.color)
        Image(systemName: "chevron.right")
          .font(.system(size: 11, weight: .semibold))
          .foregroundColor(Palette.text.muted)
      }
    }
    .padding(14)
    .background(
      RoundedRectangle(cornerRadius: 14, style: .continuous)
        .fill(Color.white.opacity(0.05))
        .overlay(
          RoundedRectangle(cornerRadius: 14, style: .continuous).stroke(
            guide.color.opacity(0.2), lineWidth: 1))
    )
  }
}

// MARK: - Guide Detail View

struct GuideDetailView: View {
  let guide: EmotionalGuide
  let onDismiss: () -> Void

  var body: some View {
    ZStack {
      Color.black.ignoresSafeArea()

      VStack(spacing: 0) {
        // Header
        HStack {
          Button(action: onDismiss) {
            HStack(spacing: 6) {
              Image(systemName: "chevron.left").font(.system(size: 14, weight: .semibold))
              Text("Back").font(.system(size: 15, weight: .medium))
            }
            .foregroundColor(guide.color)
          }
          Spacer()
        }
        .padding(.horizontal, 20).padding(.top, 20).padding(.bottom, 16)

        ScrollView {
          VStack(alignment: .leading, spacing: 24) {
            // Header
            VStack(spacing: 12) {
              ZStack {
                Circle().fill(guide.color.opacity(0.2)).frame(width: 80, height: 80)
                Image(systemName: guide.icon).font(.system(size: 36, weight: .semibold))
                  .foregroundColor(guide.color)
              }
              Text(guide.title).font(.system(size: 24, weight: .bold, design: .rounded))
                .foregroundColor(Palette.text.primary)
              Text(guide.subtitle).font(.system(size: 14, weight: .medium, design: .rounded))
                .foregroundColor(guide.color)
            }
            .frame(maxWidth: .infinity)

            // Overview
            Text(guide.overview)
              .font(.system(size: 15, weight: .medium, design: .rounded))
              .foregroundColor(Palette.text.primary)
              .lineSpacing(5)
              .padding(16)
              .background(
                RoundedRectangle(cornerRadius: 14, style: .continuous).fill(
                  guide.color.opacity(0.1)))

            // Symptoms
            VStack(alignment: .leading, spacing: 12) {
              Text("YOU MIGHT EXPERIENCE").font(.system(size: 12, weight: .bold, design: .rounded))
                .tracking(1).foregroundColor(Palette.text.secondary)
              ForEach(guide.symptoms, id: \.self) { symptom in
                HStack(alignment: .top, spacing: 10) {
                  Circle().fill(guide.color).frame(width: 6, height: 6).padding(.top, 6)
                  Text(symptom).font(.system(size: 14, weight: .medium, design: .rounded))
                    .foregroundColor(Palette.text.primary)
                }
              }
            }

            // Practices
            VStack(alignment: .leading, spacing: 14) {
              Text("PRACTICES").font(.system(size: 12, weight: .bold, design: .rounded)).tracking(1)
                .foregroundColor(Palette.text.secondary)
              ForEach(guide.practices) { practice in
                VStack(alignment: .leading, spacing: 8) {
                  HStack {
                    Text(practice.name).font(.system(size: 15, weight: .bold, design: .rounded))
                      .foregroundColor(guide.color)
                    Spacer()
                    Text(practice.duration).font(
                      .system(size: 11, weight: .semibold, design: .rounded)
                    ).foregroundColor(Palette.text.muted)
                  }
                  Text(practice.instructions).font(
                    .system(size: 13, weight: .medium, design: .rounded)
                  ).foregroundColor(Palette.text.primary).lineSpacing(4)
                }
                .padding(14)
                .background(
                  RoundedRectangle(cornerRadius: 12, style: .continuous).fill(
                    Color.white.opacity(0.05)))
              }
            }

            // Affirmations
            VStack(alignment: .leading, spacing: 12) {
              Text("AFFIRMATIONS").font(.system(size: 12, weight: .bold, design: .rounded))
                .tracking(1).foregroundColor(Palette.text.secondary)
              ForEach(guide.affirmations, id: \.self) { affirmation in
                HStack(spacing: 10) {
                  Text("✦").font(.system(size: 12)).foregroundColor(guide.color)
                  Text(affirmation).font(.system(size: 14, weight: .medium, design: .rounded))
                    .italic().foregroundColor(Palette.text.primary)
                }
              }
            }
            .padding(16)
            .background(
              RoundedRectangle(cornerRadius: 14, style: .continuous).fill(guide.color.opacity(0.1)))

            Spacer(minLength: 40)
          }
          .padding(.horizontal, 20)
        }
      }
    }
  }
}
