// DivineFeminineCourse.swift
// THE SUPPRESSED GODDESS - What They Erased

import SwiftUI

struct DivineFeminineCourse {
    static let shared = DivineFeminineCourse()
    
    let id = "divine_feminine"
    let title = "The Divine Feminine"
    let subtitle = "The goddess they erased from history"
    let icon = "moon.stars.fill"
    let colorHex = "#E040FB"
    
    var color: Color { Color(hex: colorHex) }
    
    let modules: [DFModule] = [
        
        // ═══════════════════════════════════════════════════════════════
        // MODULE 1: THE GREAT ERASURE
        // ═══════════════════════════════════════════════════════════════
        
        DFModule(
            id: "df_erasure",
            number: 1,
            title: "The Great Erasure",
            subtitle: "How they deleted the goddess",
            lessons: [
                DFLesson(
                    id: "df1_1",
                    title: "Before Patriarchy: The Goddess Era",
                    content: """
**The World Before the Erasure**

For over 25,000 years, human civilization primarily worshipped feminine deities. Archaeological evidence from every continent shows goddess figurines, temples, and symbols predating the patriarchal religions.

**The Evidence:**
• **Venus of Willendorf** (30,000 BCE) - Goddess figurine from Austria
• **Çatalhöyük** (7500 BCE) - Entire city in Turkey with goddess shrines in every home
• **Malta Temples** (3600 BCE) - Oldest free-standing structures on Earth, dedicated to the goddess
• **Minoan Crete** (2000 BCE) - Advanced civilization with priestess leadership

**What They Worshipped:**
The divine feminine represented:
- **Creation** - The womb from which all life emerges
- **Earth** - Gaia, Pachamama, the living planet
- **Cycles** - Moon, seasons, birth-death-rebirth
- **Wisdom** - Sophia, the feminine aspect of the divine

**The Transition:**
Around 3000-1500 BCE, Indo-European patriarchal tribes invaded goddess-worshipping cultures. Their sky-god religions (precursors to Judaism, Christianity, Islam) systematically replaced or demonized the goddess.

🔥 **Key Insight**: Monotheism wasn't the discovery of "one true god" - it was the political elimination of the feminine divine.
""",
                    keyPoints: [
                        "25,000+ years of goddess worship preceded patriarchy",
                        "Every ancient civilization had feminine deities",
                        "Monotheism was a political project, not a revelation",
                        "The erasure was deliberate and violent"
                    ]
                ),
                
                DFLesson(
                    id: "df1_2",
                    title: "Mary Magdalene: The Hidden Leader",
                    content: """
**Who Was Mary Magdalene Really?**

The official story: A repentant prostitute who followed Jesus.
The evidence: She was likely his closest disciple, possibly his wife, and the true leader of the early church.

**The Biblical Evidence:**
• In ALL four Gospels, Mary Magdalene is the FIRST witness to the resurrection
• She's mentioned more times than most male apostles
• Jesus appeared to her BEFORE appearing to Peter or the others
• The Gospel of Mary (suppressed) shows her teaching the apostles

**The Nag Hammadi Discovery (1945):**
Ancient texts buried to hide them from the Church reveal:
- "The companion of the Savior was Mary Magdalene. He loved her more than all the disciples and used to kiss her often." (Gospel of Philip)
- Peter complained: "Did he really speak privately with a woman rather than with us?"
- Mary Magdalene taught the apostles about spiritual matters they didn't understand

**The Prostitute Lie:**
In 591 CE, Pope Gregory I declared Mary Magdalene was a prostitute. There is ZERO biblical evidence for this. He conflated her with other women in the Bible.

**Why the Cover-Up?**
If Mary Magdalene was Jesus's spiritual equal (or superior), the entire basis for male-only priesthood collapses. The Church needed her diminished.

🔥 **The Pattern**: The most important woman in Christianity was deliberately slandered for 1,400 years until the Vatican quietly retracted it in 1969.
""",
                    keyPoints: [
                        "First witness to the resurrection in ALL gospels",
                        "Suppressed gospels show her as a teacher",
                        "The 'prostitute' label was invented in 591 CE",
                        "Vatican quietly retracted the slander in 1969"
                    ]
                ),
                
                DFLesson(
                    id: "df1_3",
                    title: "Sophia: The Erased Wisdom",
                    content: """
**Sophia: Wisdom as Feminine**

In the original Hebrew scriptures, Wisdom (Chokmah/Sophia) is explicitly feminine. She existed BEFORE creation and participated in making the world.

**Proverbs 8:22-31:**
"The Lord brought me forth as the first of his works, before his deeds of old; I was formed long ages ago, at the very beginning, when the world came to be... I was there when he set the heavens in place... Then I was constantly at his side. I was filled with delight day after day."

**Sophia in Judaism:**
- Called the "breath of the power of God"
- Present at creation as co-creator
- Associated with the Shekinah (feminine divine presence)
- Personified as a woman calling out in the streets

**The Gnostic Understanding:**
Gnostic Christians (declared heretics) preserved Sophia as central:
- Sophia is the feminine aspect of God
- Her "fall" created the material world
- Redemption is her return to wholeness
- Christ and Sophia are partners

**The Erasure:**
When Rome standardized Christianity (325 CE), Sophia was:
- Absorbed into the Holy Spirit (made gender-neutral)
- Replaced by male Logos (Word)
- Associated with Mary (but stripped of divinity)
- Declared heresy in Gnostic form

🔥 **What They Hid**: The Bible itself contains a feminine divine being who co-created the universe. They just stopped teaching it.
""",
                    keyPoints: [
                        "Sophia (Wisdom) is explicitly feminine in Hebrew scriptures",
                        "She existed before creation and co-created",
                        "Gnostic Christianity kept her central",
                        "She was absorbed and erased by Roman Christianity"
                    ]
                )
            ]
        ),
        
        // ═══════════════════════════════════════════════════════════════
        // MODULE 2: THE WITCH HUNTS
        // ═══════════════════════════════════════════════════════════════
        
        DFModule(
            id: "df_witches",
            number: 2,
            title: "The Burning Times",
            subtitle: "When they killed the wise women",
            lessons: [
                DFLesson(
                    id: "df2_1",
                    title: "The European Witch Hunts",
                    content: """
**The Numbers They Don't Teach**

Between 1450-1750, the Christian Church (both Catholic and Protestant) executed an estimated 40,000-60,000 people for "witchcraft." Some historians estimate up to 100,000.

**80% were women.**

**Who Were the "Witches"?**
- **Healers** - Women who knew herbal medicine
- **Midwives** - Women who delivered babies
- **Single women** - Those without male "protection"
- **Property owners** - Widows with land
- **Outspoken women** - Those who challenged authority
- **The poor** - Easy targets

**The Malleus Maleficarum (1487):**
The Church's official witch-hunting manual declared:
- "All witchcraft comes from carnal lust, which in women is insatiable"
- Women are "more credulous," "more impressionable," "feebler in mind and body"
- Midwives are "surpassing all others in wickedness"

**The Real Targets:**
The witch hunts eliminated:
- **Female healers** - Replaced by male doctors
- **Traditional knowledge** - Herbal medicine declared demonic
- **Women's autonomy** - Independence became suspicious
- **Goddess remnants** - Folk practices from pre-Christian times

🔥 **The Pattern**: They called women's knowledge "witchcraft" and burned it out of existence. Then they called their replacement "medicine" and charged money for it.
""",
                    keyPoints: [
                        "40,000-100,000 killed, 80% women",
                        "Targeted healers, midwives, and independent women",
                        "Church manual blamed women's 'carnal lust'",
                        "Eliminated traditional female knowledge systems"
                    ]
                ),
                
                DFLesson(
                    id: "df2_2",
                    title: "The Midwife Massacre",
                    content: """
**Why They Targeted Midwives**

For thousands of years, women assisted women in childbirth. Midwives held sacred knowledge about fertility, birth, death, and healing.

**The Church's Problem:**
- Midwives controlled reproduction (knowledge of herbs for fertility and termination)
- Birth was a sacred female mystery they couldn't control
- Midwives preserved goddess-worship traditions
- They had power over the most vulnerable moment: birth

**The Malleus Specifically Targeted Midwives:**
"No one does more harm to the Catholic Faith than midwives. For when they do not kill children, they take them out of the room, and raising them up in the air, offer them to devils."

**The Shift:**
After the witch hunts:
- Male "barber surgeons" took over birthing
- Forceps were invented (and monopolized by men)
- Women were forced to birth lying down (worse for delivery, easier for doctors)
- Childbirth mortality INCREASED under male doctors

**The University Exclusion:**
Women were banned from medical schools until the late 1800s. The knowledge they held for millennia was declared "ignorance," while the men who replaced them (and killed more patients) were called "doctors."

🔥 **The Irony**: Male doctors caused more deaths than midwives, but they had degrees. The women who kept birth safe for millennia were burned as witches.
""",
                    keyPoints: [
                        "Midwives held sacred female knowledge for millennia",
                        "Church specifically targeted them as 'most wicked'",
                        "Male doctors replaced them with HIGHER mortality",
                        "Women banned from medical schools until 1800s"
                    ]
                )
            ]
        ),
        
        // ═══════════════════════════════════════════════════════════════
        // MODULE 3: RECLAIMING THE FEMININE
        // ═══════════════════════════════════════════════════════════════
        
        DFModule(
            id: "df_reclaim",
            number: 3,
            title: "Reclaiming the Goddess",
            subtitle: "What was lost and how to find it",
            lessons: [
                DFLesson(
                    id: "df3_1",
                    title: "The Feminine in You",
                    content: """
**Beyond Gender: The Feminine Principle**

The divine feminine isn't about biological sex. It's about qualities that were systematically devalued:

**Masculine Principle (Yang):**
- Action, logic, competition
- Sun, day, assertion
- Building, conquering, naming
- Valued by patriarchy

**Feminine Principle (Yin):**
- Receptivity, intuition, cooperation
- Moon, night, listening
- Nurturing, creating, feeling
- Suppressed by patriarchy

**The Imbalance:**
Modern civilization is catastrophically over-masculine:
- Competition over cooperation
- Extraction over sustainability  
- Conquest over relationship
- Thinking over feeling
- Doing over being

**In Your Own Psyche:**
Regardless of gender, you have both principles. The suppression of the feminine in culture became suppression of the feminine IN YOU:
- Your intuition was labeled "irrational"
- Your emotions were called "weakness"
- Your receptivity was deemed "passive"
- Your cycles were made "shameful"

🔥 **Awakening**: Reclaiming the divine feminine means reclaiming half of yourself that was trained out of you.
""",
                    keyPoints: [
                        "Divine feminine is a principle, not a gender",
                        "Modern civilization is dangerously over-masculine",
                        "Both principles exist within every person",
                        "Reclaiming the feminine is internal work"
                    ]
                ),
                
                DFLesson(
                    id: "df3_2",
                    title: "Goddess Traditions Still Alive",
                    content: """
**They Couldn't Kill Everything**

Despite centuries of suppression, goddess worship survived:

**Hinduism:**
- Durga, Kali, Lakshmi, Saraswati still actively worshipped
- Shakti (feminine energy) considered the activating power of the universe
- Devi Mahatmya celebrates the goddess as supreme

**Indigenous Traditions:**
- Pachamama (Andes) - Earth mother
- Spider Woman (Navajo) - Creator
- Oshun, Yemaya (Yoruba/Diaspora) - River and ocean goddesses
- White Buffalo Calf Woman (Lakota) - Bringer of sacred rites

**Hidden in Christianity:**
- Black Madonnas across Europe (goddess temples converted)
- Mary worship (goddess transferred, divinity denied)
- St. Brigid (Irish goddess made "saint")
- Guadalupe (Tonantzin transformed)

**Modern Revival:**
- Wicca and neo-paganism
- Goddess spirituality movement
- Divine feminine in New Age thought
- Feminist theology

🔥 **What You Can Do**: These traditions are accessible. The goddess was suppressed, not destroyed. She's waiting for you to remember.
""",
                    keyPoints: [
                        "Hinduism preserved goddess worship openly",
                        "Indigenous traditions kept the feminine divine",
                        "Christianity absorbed goddesses as 'Mary' and 'saints'",
                        "Modern revival movements make this accessible"
                    ]
                )
            ]
        )
    ]
}

// MARK: - Supporting Types

struct DFModule: Identifiable {
    let id: String
    let number: Int
    let title: String
    let subtitle: String
    let lessons: [DFLesson]
}

struct DFLesson: Identifiable {
    let id: String
    let title: String
    let content: String
    let keyPoints: [String]
}
