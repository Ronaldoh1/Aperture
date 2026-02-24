// SaintSeiyaCourse.swift
// SAINT SEIYA - The Twelve Houses & Awakening

import SwiftUI

struct SaintSeiyaCourse {
    static let shared = SaintSeiyaCourse()
    
    let id = "saint_seiya"
    let title = "Saint Seiya: Knights of the Zodiac"
    let subtitle = "The 12 Houses & warrior philosophy"
    let icon = "shield.lefthalf.filled"
    let colorHex = "#FFD700"
    
    var color: Color { Color(hex: colorHex) }
    
    let modules: [SeiyaModule] = [
        
        // MODULE 1: THE MYTHOLOGY
        SeiyaModule(
            id: "seiya_1",
            number: 1,
            title: "The Saint Seiya Universe",
            subtitle: "Cosmos and awakening",
            lessons: [
                SeiyaLesson(
                    id: "s1_1",
                    title: "What Is Cosmo?",
                    content: """
**The Power Within**

In Saint Seiya, "Cosmo" (also spelled Cosmos) is the inner universe—the Big Bang that exists within every human being.

**The Teaching:**
Every atom in your body came from stars. The same forces that created galaxies exist within you. Cosmo is awakening to this truth and channeling that universal energy.

**The Seven Senses**

Humans normally use 5 senses. Saints awaken more:

• **6th Sense (Intuition)**: Reading opponent's moves, ESP, basic Cosmo awareness
• **7th Sense (Miracle)**: Where Gold Saints operate—transcending human limits
• **8th Sense (Arayashiki)**: Consciousness beyond death—entering the underworld alive

**Bronze → Silver → Gold**

The hierarchy represents consciousness levels:
• **Bronze Saints**: Beginning awakening, fighting for justice
• **Silver Saints**: Intermediate, stronger Cosmo
• **Gold Saints**: Masters who've achieved the 7th sense

**The Cloth (Armor)**

Each Saint wears a Cloth representing their constellation. The Cloth is not just protection—it's a crystallized Cosmo that responds to the wearer's spirit.

🔥 **The Core Teaching**: Your inner universe is as vast as the outer one. Awakening Cosmo = awakening to what you already are.
""",
                    awakening: "The universe is not outside you—it IS you. Cosmo is remembering this."
                ),
                
                SeiyaLesson(
                    id: "s1_2",
                    title: "The Sanctuary Saga Overview",
                    content: """
**The 12 Houses Arc**

The most iconic arc in Saint Seiya: Seiya and the Bronze Saints must climb through the 12 Houses of the Zodiac to save Athena.

**The Setup:**
• Athena (Saori) is struck by a golden arrow
• She has 12 hours to live
• The only cure requires reaching Athena's chamber at the top
• Each of the 12 houses is guarded by a Gold Saint
• The Bronze Saints must defeat or pass each one

**Why 12 Hours, 12 Houses?**
Each house corresponds to one hour. One chance per house. No going back. This is a spiritual journey compressed into mortal time.

**The Real Journey**
The 12 houses are the 12 zodiac archetypes—each representing a psychological/spiritual challenge. Climbing the houses = integrating all aspects of self.

**Who Goes:**
• Seiya (Pegasus)
• Shiryu (Dragon)
• Hyoga (Cygnus)
• Shun (Andromeda)
• Ikki (Phoenix)

Each Bronze Saint carries wounds and lessons they must face in the houses.

🔥 **The Meta-Teaching**: The 12 houses are YOU. Each Gold Saint represents a quality you must either overcome, integrate, or earn the respect of.
""",
                    awakening: "The journey through the 12 houses is the journey through your own psyche."
                )
            ]
        ),
        
        // MODULE 2: THE 12 HOUSES
        SeiyaModule(
            id: "seiya_2",
            number: 2,
            title: "The Twelve Houses",
            subtitle: "Each Gold Saint's wisdom",
            lessons: [
                SeiyaLesson(
                    id: "s2_1",
                    title: "House 1: Aries (Mu)",
                    content: """
**The Guardian: Mu of Aries**

Mu is the gentle Cloth repairer, student of the former Pope. He doesn't fight the Bronze Saints—he HELPS them, repairing their Cloths.

**Mu's Wisdom:**
"The Cloth responds to the spirit of its wearer."

**The Teaching:**
The first house teaches discernment. Not all authority opposes you. Some gatekeepers are allies. Mu recognizes the Bronze Saints' pure intentions and aids them.

**Mu's Abilities:**
• Telekinesis / Psychokinesis
• Cloth repair through Cosmo
• Starlight Extinction (attack)
• Crystal Wall (defense)

**The Lesson:**
Sometimes the obstacle isn't the enemy. The first challenge is recognizing who is truly against you and who is secretly with you.

**Key Quote from Mu:**
"A Saint's duty is to protect Athena and justice. The Pope has strayed from that path."

🔥 **Your Integration**: Where do you assume opposition that doesn't exist? Who might be an ally that you've dismissed?
""",
                    awakening: "Discernment first: Not all authority is corrupt; not all gatekeepers oppose you."
                ),
                
                SeiyaLesson(
                    id: "s2_2",
                    title: "House 2: Taurus (Aldebaran)",
                    content: """
**The Guardian: Aldebaran of Taurus**

Aldebaran is a giant—the largest Gold Saint. His "Great Horn" attack can destroy anything. But his heart is even bigger than his power.

**Aldebaran's Wisdom:**
"True strength isn't about power—it's about the heart behind it."

**The Battle:**
Seiya faces Aldebaran's Great Horn. He's completely outmatched. But Seiya doesn't give up. He keeps getting up. Aldebaran, moved by Seiya's spirit, allows him to pass.

**The Teaching:**
Taurus represents raw power but also earthy stability and heart. Aldebaran teaches that determination matters more than strength. He respects courage over capability.

**Key Moment:**
Aldebaran could kill Seiya easily. He chooses not to because Seiya has proven his spirit. This is mercy from strength—true power doesn't need to destroy.

**Aldebaran's Character:**
• Honorable
• Direct
• Respects courage
• Doesn't fight unnecessary battles

🔥 **Your Integration**: Taurus asks: What do you fight for? Is your determination real? Power without purpose is empty.
""",
                    awakening: "Persistence and heart can overcome raw power. Spirit trumps strength."
                ),
                
                SeiyaLesson(
                    id: "s2_3",
                    title: "House 3: Gemini (Saga)",
                    content: """
**The Guardian: Saga of Gemini**

Saga is THE central figure of the arc. He killed the previous Pope, took his place, and rules as a tyrant. He represents DUALITY—good and evil in one being.

**The Dual Nature:**
Saga has two personalities:
• Light Saga: Noble, just, would-be hero
• Dark Saga: Ruthless, power-hungry, murderous

The evil side took over, but the good side still exists, creating internal torment.

**Saga's Wisdom (from his light side):**
"Even the gods can be defied if they stand against justice."

**The Teaching:**
Gemini represents the shadow self, duality, and internal conflict. Saga is what happens when you don't integrate your darkness—it takes over.

**The "Another Dimension" Attack:**
Saga can banish opponents to another dimension. This represents how we exile parts of ourselves we don't accept.

**The Resolution:**
Saga ultimately kills himself, the good side winning at the last moment. He dies asking Athena for forgiveness. This is shadow integration through self-destruction—tragic but redemptive.

🔥 **Your Integration**: What part of you have you disowned? What happens if you don't integrate it? Saga is a warning.
""",
                    awakening: "Unintegrated shadow doesn't disappear—it takes over. Face your darkness."
                ),
                
                SeiyaLesson(
                    id: "s2_4",
                    title: "House 4: Cancer (Deathmask)",
                    content: """
**The Guardian: Deathmask of Cancer**

Deathmask is the most openly evil Gold Saint. He decorates his house with the faces of his victims—souls he's sent to the underworld. He kills for pleasure.

**Deathmask's Philosophy:**
"Power is justice. The strong rule, the weak die. That's the only truth."

**The Teaching:**
Cancer represents the realm of the dead, the unconscious, and the darkness we fear to confront. Deathmask is nihilism embodied—power without any moral grounding.

**His Defeat:**
Shiryu (Dragon) fights him. When Shiryu's determination reaches its peak, Deathmask's own Cloth ABANDONS him—it refuses to serve someone without honor.

**The Lesson:**
Even your own power will betray you if your cause is unjust. The Cloth is Cosmo—and Cosmo responds to spirit, not just strength.

**Key Moment:**
The souls of Deathmask's victims cry out from the Yomotsu Hirasaka (path to the underworld). His crimes literally come back to haunt him.

🔥 **Your Integration**: Cancer asks: What have you killed in yourself? What faces haunt you? Justice cannot be escaped forever.
""",
                    awakening: "Power without justice is self-defeating. Even your own strength will abandon you."
                ),
                
                SeiyaLesson(
                    id: "s2_5",
                    title: "House 5: Leo (Aiolia)",
                    content: """
**The Guardian: Aiolia of Leo**

Aiolia is the brother of Aiolos—the Gold Saint who saved baby Athena and was branded a traitor. Aiolia has lived with this shame, serving the Pope loyally to redeem his family name.

**Aiolia's Inner Conflict:**
He believes his brother was a traitor. But deep down, he doubts. The Pope manipulates this doubt.

**The Teaching:**
Leo represents pride, honor, and the struggle between external loyalty and inner truth. Aiolia does what he's told is right, not what he FEELS is right.

**The Battle:**
Aiolia is controlled by the Pope's Genro Mao Ken (illusion technique). He fights against his will. Even mind-controlled, his Cosmo resists when he's about to kill innocents.

**Aiolia's Awakening:**
When he learns the TRUTH—that his brother was a HERO, not a traitor—his Cosmo explodes. He breaks free of control.

**His Famous Line:**
"Lightning Plasma!"

🔥 **Your Integration**: Leo asks: Whose truth are you living? What would change if you learned your "shameful" history was actually honorable?
""",
                    awakening: "Don't believe the official story. Your inner truth may contradict what you've been told."
                ),
                
                SeiyaLesson(
                    id: "s2_6",
                    title: "House 6: Virgo (Shaka)",
                    content: """
**The Guardian: Shaka of Virgo**

Shaka is called "The Man Closest to God." He keeps his eyes closed, meditating, so powerful that opening them is saved for enemies worthy of death.

**Shaka's Wisdom:**
"To know everything is to know nothing. True wisdom is in emptiness."

**The Teaching:**
Virgo represents purity, analysis, and spiritual mastery. Shaka is a Buddha-like figure who has transcended attachment. His power comes from DETACHMENT, not desire.

**The Six Paths to Hell:**
Shaka can remove opponents' senses one by one—sight, sound, smell, taste, touch, then consciousness. This represents the Buddhist teaching of how attachment to senses creates suffering.

**His "Death":**
In the Hades arc, Shaka allows himself to be killed to send a message. He achieves the 8th sense—dying consciously. This is enlightened death, not defeat.

**Key Quote:**
"I don't fear death. I've already mastered it."

🔥 **Your Integration**: Virgo asks: What would you be without your senses, your story, your identity? Shaka found that underneath is not nothing—but everything.
""",
                    awakening: "True power comes from detachment. Shaka fights from emptiness, not desire."
                ),
                
                SeiyaLesson(
                    id: "s2_7",
                    title: "House 7: Libra (Dohko)",
                    content: """
**The Guardian: Dohko of Libra**

Dohko appears ancient—243 years old—sitting at a waterfall in China, guarding the seal on the Specters of Hades. He's actually the same age as Shion (former Pope).

**Dohko's Role:**
He's been in "Misopethamenos"—a state of slowed heartbeat (100,000 times slower) that extends life. He WATCHES, WAITS, and REMEMBERS.

**The Teaching:**
Libra represents balance, patience, and wisdom accumulated over time. Dohko is the keeper of memory—the elder who holds knowledge from previous wars.

**The Libra Cloth:**
Unique among Gold Cloths, Libra carries WEAPONS—nunchucks, swords, shields. But they can only be used with permission, representing the responsibility of power.

**Dohko's Wisdom:**
"True justice isn't about punishment. It's about balance."

**Why The House Is Empty:**
Dohko isn't in his house during the 12 Houses arc. Libra represents that some battles don't require fighting—presence and balance are the lesson.

🔥 **Your Integration**: Libra asks: What have you been patiently watching? What wisdom do you carry that others don't see?
""",
                    awakening: "Some guardians don't fight—they witness. Balance and patience are forms of power."
                ),
                
                SeiyaLesson(
                    id: "s2_8",
                    title: "House 8: Scorpio (Milo)",
                    content: """
**The Guardian: Milo of Scorpio**

Milo is intensely loyal to Athena and skeptical of the Bronze Saints. His "Scarlet Needle" attack strikes 14 pressure points, each more painful than the last.

**Milo's Test:**
He doesn't just fight—he TESTS. Can the Bronze Saints endure pain? Do they have the will to continue when every nerve screams to stop?

**The Teaching:**
Scorpio represents death, transformation, and the underworld. Milo's test is about endurance through suffering. Not physical strength—pain tolerance and will.

**The 15th Needle: Antares**
After 14 strikes of increasing agony, the 15th needle (Antares) kills. But it can also REVERSE all damage if the victim has proven worthy.

**Hyoga's Test:**
Hyoga endures all 14 needles without breaking. Milo, impressed, uses Antares to HEAL him instead of kill him.

**Milo's Wisdom:**
"True strength isn't about not feeling pain. It's about not surrendering to it."

🔥 **Your Integration**: Scorpio asks: Can you sit with suffering without fleeing? Transformation requires passing through the fire, not around it.
""",
                    awakening: "Pain is a test, not a punishment. Endure it consciously, and it transforms you."
                ),
                
                SeiyaLesson(
                    id: "s2_9",
                    title: "House 9: Sagittarius (Aiolos)",
                    content: """
**The Guardian: Aiolos of Sagittarius (Deceased)**

Aiolos is dead—killed 13 years ago for saving baby Athena from Saga's assassination attempt. His house is empty, but his SPIRIT remains.

**The Story:**
Aiolos discovered the Pope (Saga) trying to kill baby Athena. He saved her, was branded a traitor, and died fleeing, entrusting baby Athena to the orphanage where Seiya grew up.

**The Teaching:**
Sagittarius represents truth, hope, and higher purpose. Aiolos is the martyr who chose truth over survival, hope over despair.

**The Sagittarius Cloth:**
In multiple critical moments, the Sagittarius Cloth appears to SAVE the Bronze Saints—Aiolos's spirit still protecting those who protect Athena.

**Aiolos's Message (found with his Cloth):**
"To future Saints: I entrust you with my hopes. Protect Athena. Let justice prevail."

**Why The House Is Empty:**
You can't "defeat" Sagittarius. The guardian is already a legend. This house asks: What would you die for? What will your legacy be?

🔥 **Your Integration**: Sagittarius asks: What truth would you sacrifice everything for? Your answer defines who you really are.
""",
                    awakening: "Some guardians transcend death. Aiolos's spirit lives in his sacrifice."
                ),
                
                SeiyaLesson(
                    id: "s2_10",
                    title: "House 10: Capricorn (Shura)",
                    content: """
**The Guardian: Shura of Capricorn**

Shura has the sharpest attack of all Gold Saints—"Excalibur," a blade concentrated in his arms and legs that can cut through anything.

**Shura's Tragedy:**
He was the one who killed Aiolos 13 years ago, believing he was stopping a traitor. He's lived with this, believing he did the right thing.

**The Teaching:**
Capricorn represents duty, authority, and the burden of following orders. Shura did what he was TOLD was right. He is the soldier who obeyed—and must live with the consequences.

**The Battle:**
Shiryu faces Shura. When Shiryu learns Shura killed Aiolos, he fights with fury. But as they fight, Shura begins to DOUBT. Was Aiolos really evil?

**Shura's Redemption:**
In his final moments, Shura realizes the truth. He gives the Excalibur technique to Shiryu—passing on his greatest gift to his enemy's ally.

**His Final Words:**
"Aiolos... I was wrong. I'm sorry."

🔥 **Your Integration**: Capricorn asks: What have you done in the name of duty that haunts you? Is it too late to atone?
""",
                    awakening: "Following orders doesn't free you from responsibility. Redemption is always possible."
                ),
                
                SeiyaLesson(
                    id: "s2_11",
                    title: "House 11: Aquarius (Camus)",
                    content: """
**The Guardian: Camus of Aquarius**

Camus is the master of ice—cold, analytical, seemingly emotionless. He trained Hyoga. He is the teacher who must face his own student.

**Camus's Philosophy:**
"A Saint must freeze his emotions. Attachment is weakness."

**The Teaching:**
Aquarius represents detachment, logic, and the intellect divorced from feeling. Camus believed emotions made you vulnerable—so he suppressed them.

**The Battle (Teacher vs Student):**
Camus fights Hyoga brutally, trying to "kill his emotions" by force. But the truth is: Camus DOES care. His harshness comes from fear of losing his student.

**The "Killing" of Hyoga:**
Camus freezes Hyoga in an ice coffin. But Hyoga survives—his mother's spirit protects him. LOVE defeats the logic of cold.

**Camus's Secret:**
He never wanted to kill Hyoga. The coffin was designed to be survivable. His "cold" exterior hid deep care.

**Key Moment:**
When Hyoga finally awakens his 7th sense to defeat Camus, the master SMILES. He dies proud.

🔥 **Your Integration**: Aquarius asks: What emotions are you hiding behind logic? Detachment isn't strength if it's denial.
""",
                    awakening: "Cold logic can mask deep caring. True detachment is inclusive, not avoidant."
                ),
                
                SeiyaLesson(
                    id: "s2_12",
                    title: "House 12: Pisces (Aphrodite)",
                    content: """
**The Guardian: Aphrodite of Pisces**

Aphrodite is beautiful—more beautiful than any woman, he claims. He surrounds his house with roses: Royal Demon Roses (poisonous), Piranha Roses (attacking), and Bloody Roses (killing).

**Aphrodite's Philosophy:**
"Beauty is justice. The beautiful are righteous; the ugly are evil."

**The Teaching:**
Pisces represents illusion, beauty, and the final sacrifice. Aphrodite is surface beauty masking cruelty—the glamour that seduces you right before destruction.

**The Battle:**
Shun (Andromeda) faces Aphrodite. Shun is gentle, doesn't want to fight. Aphrodite mocks his softness. But Shun's chains respond to his PURE heart.

**The Reversal:**
Aphrodite's beauty is revealed as ugly inside. Shun's apparent weakness is revealed as strength. The final house inverts expectations.

**Aphrodite's Defeat:**
He's defeated not by raw power but by genuine love (Shun's) overcoming false beauty (Aphrodite's).

**Key Lesson:**
The 12th house is the end of the zodiac—the place where all illusions dissolve before reaching the center (Athena). False beauty, false power, false self—all must be stripped away.

🔥 **Your Integration**: Pisces asks: What beautiful masks do you wear? What would remain if all illusion fell away?
""",
                    awakening: "The final test is releasing all illusion—including your own false beauty and identity."
                )
            ]
        ),
        
        // MODULE 3: SYNTHESIS
        SeiyaModule(
            id: "seiya_3",
            number: 3,
            title: "The Complete Teaching",
            subtitle: "Integrating all 12 houses",
            lessons: [
                SeiyaLesson(
                    id: "s3_1",
                    title: "The Journey as Initiation",
                    content: """
**What The 12 Houses Represent**

The ascent through the 12 houses is an initiation—a mystery school journey compressed into one night:

**1. Aries**: Discernment (who's friend or foe?)
**2. Taurus**: Determination (do you have heart?)
**3. Gemini**: Shadow (can you face your duality?)
**4. Cancer**: Death (can you confront darkness?)
**5. Leo**: Pride (whose truth do you live?)
**6. Virgo**: Transcendence (can you detach?)
**7. Libra**: Balance (can you wait?)
**8. Scorpio**: Pain (can you endure transformation?)
**9. Sagittarius**: Purpose (what would you die for?)
**10. Capricorn**: Duty (can you atone?)
**11. Aquarius**: Emotion (can you feel despite logic?)
**12. Pisces**: Illusion (can you release all masks?)

**After The 12 Houses:**
You reach the Pope's chamber. The final boss. The corrupted authority. Here, all lessons combine—you need everything you've learned.

**The Cosmo Awakening:**
Each house RAISED the Bronze Saints' Cosmo. By the end, they're approaching Gold Saint level. The journey IS the training.

🔥 **Your Application**: Where are you stuck in the 12 houses? Which archetype do you most need to integrate right now?
""",
                    awakening: "The 12 houses are the zodiacal initiation—each sign a test of character."
                ),
                
                SeiyaLesson(
                    id: "s3_2",
                    title: "The Ultimate Teaching",
                    content: """
**What Saint Seiya Really Teaches**

Beyond the battles and the drama, Saint Seiya is a consciousness curriculum:

**1. You Have a Universe Inside**
Cosmo isn't fantasy—it's recognition that universal forces flow through you. Awakening Cosmo = awakening to your true nature.

**2. Growth Requires Conflict**
Each house is a fight. Each fight forces evolution. Avoiding conflict avoids growth.

**3. Hierarchy Exists But Can Be Transcended**
Bronze → Silver → Gold isn't permanent. Spirit can overcome rank. Seiya (Bronze) ultimately fights gods.

**4. Teachers Can Be Wrong**
The Pope is corrupt. Gold Saints follow orders that betray justice. Question authority, especially spiritual authority.

**5. Sacrifice Is Not Defeat**
Aiolos died but his legacy lives. Shaka chooses death to achieve the 8th sense. Sacrifice transcends the physical.

**6. The Feminine Principle Rules**
Athena is the true authority. The masculine warriors serve the feminine divine. Balance requires both.

**7. Death Is Not The End**
Saints achieve the 8th sense, maintain consciousness after death, and continue fighting. The spirit transcends the body.

🔥 **The Final Transmission**: You don't need a Cloth or Gold Saint status to burn your Cosmo. The universe is already within you. The 12 houses are already in your psyche. The journey has already begun.
""",
                    awakening: "The Cosmo is real. The 12 houses are real. Your initiation is happening now."
                )
            ]
        )
    ]
}

// Supporting Types
struct SeiyaModule: Identifiable {
    let id: String
    let number: Int
    let title: String
    let subtitle: String
    let lessons: [SeiyaLesson]
}

struct SeiyaLesson: Identifiable {
    let id: String
    let title: String
    let content: String
    let awakening: String
}

struct SeiyaProgress: Codable {
    var completedLessons: [String]
    var lastAccessed: Date?
    static var `default`: SeiyaProgress { SeiyaProgress(completedLessons: [], lastAccessed: nil) }
}
