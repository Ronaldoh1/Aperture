// LGBTQTruthCourse.swift
// THE TRUTH ABOUT LOVE - What Religion Got Wrong

import SwiftUI

struct LGBTQTruthCourse {
    static let shared = LGBTQTruthCourse()
    
    let id = "lgbtq_truth"
    let title = "Love Is Love"
    let subtitle = "The lies religion created about LGBTQ+"
    let icon = "heart.fill"
    let colorHex = "#FF1493"
    
    var color: Color { Color(hex: colorHex) }
    
    let modules: [LGBTQModule] = [
        
        // ═══════════════════════════════════════════════════════════════
        // MODULE 1: THE MANUFACTURED SIN
        // ═══════════════════════════════════════════════════════════════
        
        LGBTQModule(
            id: "lgbtq_manufactured",
            number: 1,
            title: "The Manufactured Sin",
            subtitle: "How homosexuality became 'wrong'",
            lessons: [
                LGBTQLesson(
                    id: "lgbtq1_1",
                    title: "Before It Was a 'Sin'",
                    content: """
**The Ancient World Didn't Care**

For most of human history, same-sex relationships were unremarkable:

**Ancient Greece:**
- Same-sex relationships were normal and celebrated
- Plato's Symposium discusses love between men as the highest form
- The Sacred Band of Thebes: elite military unit of male lovers
- Alexander the Great's relationship with Hephaestion was well-known

**Ancient Rome:**
- Emperors openly had male lovers
- Marriage was for property/heirs; love was separate
- No concept of "gay" vs "straight" identity
- It only became "wrong" after Christianity took over

**Indigenous Cultures Worldwide:**
- "Two-Spirit" people honored in Native American traditions
- Hijra in India: recognized third gender for millennia
- Māhū in Hawaiian/Polynesian culture: sacred intermediaries
- Fa'afafine in Samoa: respected social role

**Ancient Egypt:**
- Some scholars interpret Khnumhotep and Niankhkhnum's tomb as depicting a same-sex couple
- No laws against homosexuality
- Identity wasn't tied to sexual preference

**What Changed?**
Christianity. Specifically, Roman Christianity after 300 CE needed:
- Population growth (make more Christians)
- Distinction from "pagan" practices
- Control over sexuality and reproduction

🔥 **The Pattern**: Same-sex love wasn't universally condemned until one religion decided it needed to be.
""",
                    keyPoints: [
                        "Ancient Greece celebrated same-sex love",
                        "Rome had no concept of 'gay identity' - it just was",
                        "Indigenous cultures worldwide honored gender diversity",
                        "Christianity created the prohibition for political reasons"
                    ]
                ),
                
                LGBTQLesson(
                    id: "lgbtq1_2",
                    title: "The Mistranslation of Leviticus",
                    content: """
**What the Bible Actually Says (and Doesn't Say)**

The verses used to condemn homosexuality are mistranslated, taken out of context, or both.

**Leviticus 18:22 - The Famous Verse:**

Modern translation: "You shall not lie with a male as with a woman; it is an abomination."

**The Problems:**

1. **The Hebrew word "to'evah" (abomination):**
   - Doesn't mean "morally wrong"
   - Means "ritually unclean" or "foreign practice"
   - Same word used for eating shellfish, wearing mixed fabrics
   - It's about ritual purity, not morality

2. **Historical context:**
   - Written to distinguish Israelites from Canaanite practices
   - Canaanite temples had male temple prostitutes
   - The prohibition was about pagan worship, not love

3. **The German translation discovery:**
   - Before 1946, the German Bible translated this as condemning "boy molesters" (pedophilia)
   - The American RSV Bible (1946) changed it to "homosexuals"
   - This was a TRANSLATION CHOICE, not the original meaning

**1 Corinthians 6:9 - "Arsenokoitai":**
- Greek word Paul invented
- Literally: "man-bedders"
- Historical usage suggests it meant male prostitutes or exploitation
- Was NOT used to describe consensual same-sex relationships
- Early Church fathers used it to condemn economic exploitation

**Romans 1:26-27:**
- Paul is describing Roman orgies and excess
- The context is idol worship leading to lustful behavior
- He's condemning lust, not love
- He had no concept of sexual orientation

🔥 **The Truth**: The "clobber passages" used against LGBTQ+ people are mistranslated, decontextualized, or both. The Bible says nothing about loving, committed same-sex relationships because that concept didn't exist in ancient languages.
""",
                    keyPoints: [
                        "'Abomination' meant ritually unclean, not morally wrong",
                        "German Bibles said 'boy molesters' until 1946",
                        "Paul's letters condemned Roman orgies, not love",
                        "Ancient languages had no word for 'homosexual'"
                    ]
                ),
                
                LGBTQLesson(
                    id: "lgbtq1_3",
                    title: "Jesus Said Nothing",
                    content: """
**The Silence of Christ**

Jesus Christ never mentioned homosexuality. Not once.

**What Jesus DID Talk About:**
- Loving your neighbor (constantly)
- Not judging others (Matthew 7:1)
- Hypocrisy of religious leaders (Matthew 23)
- Caring for the poor and marginalized
- Forgiveness
- The dangers of wealth

**What Jesus DIDN'T Talk About:**
- Homosexuality
- Gay marriage
- Trans people
- Any LGBTQ+ issue

**The Eunuch Story (Acts 8:26-40):**
Philip baptizes an Ethiopian eunuch without hesitation. Eunuchs were:
- Gender-variant individuals
- Often same-sex attracted
- Excluded from the Jewish temple
- Explicitly welcomed by Jesus's followers

**"Male and Female He Created Them":**
Religious conservatives cite Genesis. But:
- Genesis also says "evening and morning" - dawn and dusk exist
- "Land and sea" - marshes exist
- Binary language doesn't deny the spectrum
- Jesus quoted this about DIVORCE, not homosexuality

**What Would Jesus Do?**
Based on his recorded actions:
- He ate with tax collectors and "sinners"
- He touched lepers (untouchables)
- He spoke to Samaritan women (forbidden)
- He consistently chose the marginalized over the religious establishment

🔥 **The Pattern**: The people most loudly condemning LGBTQ+ people in Jesus's name are behaving exactly like the Pharisees Jesus repeatedly criticized.
""",
                    keyPoints: [
                        "Jesus never mentioned homosexuality",
                        "He welcomed a gender-variant eunuch",
                        "He consistently sided with the marginalized",
                        "Modern anti-LGBTQ Christians = ancient Pharisees"
                    ]
                )
            ]
        ),
        
        // ═══════════════════════════════════════════════════════════════
        // MODULE 2: THE HARM DONE
        // ═══════════════════════════════════════════════════════════════
        
        LGBTQModule(
            id: "lgbtq_harm",
            number: 2,
            title: "The Harm Done",
            subtitle: "What religious condemnation causes",
            lessons: [
                LGBTQLesson(
                    id: "lgbtq2_1",
                    title: "The Body Count",
                    content: """
**The Real-World Consequences of "Hate the Sin"**

Religious condemnation of LGBTQ+ people has measurable, deadly consequences.

**Suicide Statistics:**
- LGBTQ+ youth are 4x more likely to attempt suicide
- For those rejected by family (often for religious reasons): 8x more likely
- 40% of homeless youth are LGBTQ+, often kicked out by religious families
- Trans youth in non-supportive environments: 57% attempt suicide

**Conversion Therapy:**
- Practiced by religious organizations for decades
- Includes: electroshock, aversion therapy, exorcism, isolation
- Zero evidence it works
- Massive evidence of psychological harm
- Associated with depression, anxiety, suicide attempts
- Banned in many places as torture

**The "Love the Sinner, Hate the Sin" Lie:**
This phrase sounds compassionate but communicates:
- Your core identity is sinful
- We'll accept you if you deny who you are
- Our love is conditional on your celibacy
- You must be perpetually ashamed

**Global Violence:**
In countries with strong religious influence:
- 69 countries criminalize homosexuality
- 11 countries have death penalty for same-sex acts
- Uganda's "Kill the Gays" bill influenced by American evangelicals
- Russia's "gay propaganda" laws backed by Orthodox Church

**Mental Health:**
Religious LGBTQ+ youth have higher rates of:
- Depression
- Anxiety
- PTSD
- Substance abuse
- Self-harm

🔥 **The Truth**: "Loving" religious condemnation kills people. The blood is on the hands of those who preach it.
""",
                    keyPoints: [
                        "LGBTQ+ youth rejected by family: 8x suicide risk",
                        "40% of homeless youth are LGBTQ+",
                        "Conversion therapy is torture with zero success",
                        "'Love the sinner, hate the sin' still destroys lives"
                    ]
                ),
                
                LGBTQLesson(
                    id: "lgbtq2_2",
                    title: "The Hypocrisy",
                    content: """
**Cherry-Picking Scripture**

Religious conservatives claim to follow the Bible literally on homosexuality. They don't.

**Things the Bible Condemns That Christians Ignore:**
- Eating shellfish (Leviticus 11:10) - "abomination"
- Wearing mixed fabrics (Leviticus 19:19)
- Cutting hair at the sides (Leviticus 19:27)
- Tattoos (Leviticus 19:28)
- Working on Saturday (Exodus 31:15) - death penalty
- Eating pork (Leviticus 11:7)
- Women speaking in church (1 Corinthians 14:34)
- Divorce and remarriage (Mark 10:11-12) - adultery

**Things Jesus Actually Condemned That Churches Practice:**
- Public prayer (Matthew 6:5) - "hypocrites"
- Wealth accumulation (Matthew 19:24)
- Judging others (Matthew 7:1)
- Religious show (Matthew 23:27-28)

**The Selective Reading:**
Why focus on 6 verses about homosexuality while ignoring:
- 2,000+ verses about poverty and justice
- Jesus's explicit commands about wealth
- Clear prohibitions on divorce (which affects church leadership)

**The Real Reason:**
Homosexuality is condemned because:
- It's easy to condemn what you're not
- It creates an "other" to unite against
- It doesn't require any personal sacrifice
- It maintains patriarchal family structures

🔥 **The Pattern**: The Bible is used as a weapon against LGBTQ+ people while its actual teachings about justice, wealth, and judgment are ignored.
""",
                    keyPoints: [
                        "Same Bible condemns shellfish, mixed fabrics, haircuts",
                        "Jesus condemned public prayer and wealth - churches do both",
                        "2,000+ verses about poverty ignored for 6 about homosexuality",
                        "Selective reading reveals the real agenda: control"
                    ]
                )
            ]
        ),
        
        // ═══════════════════════════════════════════════════════════════
        // MODULE 3: THE TRUTH
        // ═══════════════════════════════════════════════════════════════
        
        LGBTQModule(
            id: "lgbtq_truth_mod",
            number: 3,
            title: "The Truth About Love",
            subtitle: "What science and spirituality actually say",
            lessons: [
                LGBTQLesson(
                    id: "lgbtq3_1",
                    title: "The Science Is Clear",
                    content: """
**What We Actually Know**

Every major medical and psychological organization agrees:

**It's Not a Choice:**
- Sexual orientation is not chosen
- No one has ever successfully changed their orientation
- It emerges naturally, like handedness
- Attempts to change cause harm

**It's Natural:**
- Homosexual behavior documented in 1,500+ species
- Occurs at consistent rates across all human cultures
- Has existed throughout recorded history
- Serves evolutionary purposes (kin selection, social bonding)

**It's Healthy:**
- Homosexuality was removed from DSM in 1973
- This wasn't "political" - it was evidence-based
- LGBTQ+ people in supportive environments thrive
- The only harm comes from rejection and discrimination

**Gender Is Complex:**
- Biological sex involves chromosomes, hormones, anatomy - all of which vary
- Intersex conditions occur in ~1.7% of births
- Gender identity is neurologically based
- Trans identities have existed across all cultures

**Major Organizations Agreeing:**
- American Psychological Association
- American Medical Association
- American Academy of Pediatrics
- World Health Organization
- Every major medical body worldwide

🔥 **The Science**: LGBTQ+ identities are natural human variation, not disorder, disease, or choice. The only "problem" is how society treats them.
""",
                    keyPoints: [
                        "Sexual orientation is not a choice",
                        "1,500+ species show homosexual behavior",
                        "Every major medical organization agrees",
                        "Harm comes from rejection, not identity"
                    ]
                ),
                
                LGBTQLesson(
                    id: "lgbtq3_2",
                    title: "A Truly Spiritual View",
                    content: """
**What Love Actually Teaches**

If there is a divine source, what does it actually value?

**The Core Teaching of Every Wisdom Tradition:**
- Love
- Compassion
- Not harming others
- Treating others as yourself
- The interconnection of all beings

**LGBTQ+ Love:**
- Is consensual
- Harms no one
- Creates families
- Builds community
- Expresses the same devotion as any love

**What Kind of God...?**
Would create people a certain way, then condemn them for it?
Would value the gender of love over its quality?
Would care more about rules than kindness?
Would want children rejected by their parents?

**The Mystics Knew:**
- Rumi's poetry is homoerotic
- Many saints had same-sex devoted relationships
- Indigenous two-spirit people were often shamans
- The divine doesn't fit in human categories

**A Better Question:**
Instead of "Is it a sin?" ask:
- Does it create love or fear?
- Does it harm anyone?
- Does it bring people closer to their authentic selves?
- Does it increase compassion in the world?

**The Answer:**
LGBTQ+ love passes every spiritual test except the arbitrary rules of men who wanted control.

🔥 **The Deepest Truth**: If God is love, then love is God - regardless of the bodies it inhabits. The "sin" isn't being LGBTQ+. The sin is condemning love.
""",
                    keyPoints: [
                        "Every wisdom tradition's core: love and compassion",
                        "LGBTQ+ love harms no one",
                        "Mystics across traditions transcended gender",
                        "Condemning love is the actual sin"
                    ]
                )
            ]
        )
    ]
}

// MARK: - Supporting Types

struct LGBTQModule: Identifiable {
    let id: String
    let number: Int
    let title: String
    let subtitle: String
    let lessons: [LGBTQLesson]
}

struct LGBTQLesson: Identifiable {
    let id: String
    let title: String
    let content: String
    let keyPoints: [String]
}
