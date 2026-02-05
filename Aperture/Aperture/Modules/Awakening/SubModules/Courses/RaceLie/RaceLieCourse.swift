// RaceLieCourse.swift
// THE RACE LIE - There Is Only One Human Race

import SwiftUI

struct RaceLieCourse {
    static let shared = RaceLieCourse()
    
    let id = "race_lie"
    let title = "The Race Lie"
    let subtitle = "There is only one human race"
    let icon = "person.2.fill"
    let colorHex = "#795548"
    
    var color: Color { Color(hex: colorHex) }
    
    let modules: [RLModule] = [
        
        // ═══════════════════════════════════════════════════════════════
        // MODULE 1: THE INVENTION OF RACE
        // ═══════════════════════════════════════════════════════════════
        
        RLModule(
            id: "rl_invention",
            number: 1,
            title: "The Invention of Race",
            subtitle: "When and why 'race' was created",
            lessons: [
                RLLesson(
                    id: "rl1_1",
                    title: "Race Is a Modern Invention",
                    content: """
**Race as we know it didn't exist before the 1600s.**

The concept of distinct biological "races" was invented during European colonialism to justify slavery and exploitation.

**The Timeline:**

**Before 1400s:**
- People distinguished by tribe, nation, religion, language
- Skin color was noted but not considered deterministic
- Greeks/Romans had no concept of "white" vs "black" races
- Arab scholars classified by geography, not biology

**1400s-1600s:**
- European colonization begins
- Trans-Atlantic slave trade develops
- Problem: How do "Christian" nations justify enslaving humans?
- Solution: Invent a hierarchy that makes some humans "less than"

**The Key Moment - 1676:**
Bacon's Rebellion in Virginia - poor white and Black laborers united against wealthy landowners. The elite's response? Create legal distinctions between "white" and "Black" - dividing workers who had common interests.

**The Scientific Veneer:**
- Carl Linnaeus (1758): Classified humans into 4 "varieties" with behavioral traits attached
- Johann Blumenbach (1775): Invented "Caucasian" (from the Caucasus mountains) as the "original" human type
- Samuel Morton (1830s): Measured skulls to "prove" racial hierarchy (later debunked as fraudulent)

🔥 **The Truth**: Race was invented to justify exploitation. Before colonialism, it didn't exist in its modern form.

**📚 Sources:**
- Kendi, Ibram X. "Stamped from the Beginning" (2016)
- Smedley, Audrey. "Race in North America" (2011)
- Fields, Barbara & Karen. "Racecraft" (2012)
- American Anthropological Association Statement on Race (1998)
""",
                    keyPoints: [
                        "Race as biological category was invented in the 1600s",
                        "Created to justify slavery and colonialism",
                        "Bacon's Rebellion (1676) led to legal 'white' category",
                        "Early 'racial science' was fraudulent from the start"
                    ]
                ),
                
                RLLesson(
                    id: "rl1_2",
                    title: "The Scientific Consensus",
                    content: """
**Modern Science Is Clear: Biological Race Does Not Exist**

Every major scientific organization agrees: there is ONE human species with NO biological races.

**The Human Genome Project (2000):**
After mapping the entire human genome, scientists concluded:
- Humans are 99.9% genetically identical
- More genetic variation EXISTS WITHIN so-called "races" than BETWEEN them
- A Black person and a white person may be more genetically similar than two Black people or two white people

**Craig Venter (led Human Genome Project):**
"Race is a social concept, not a scientific one. There is no genetic basis for dividing people into races."

**American Anthropological Association (1998):**
"With the vast expansion of scientific knowledge in this century... it has become clear that human populations are not unambiguous, clearly demarcated, biologically distinct groups... There is greater variation within 'racial' groups than between them."

**American Association of Physical Anthropologists (2019):**
"Race does not provide an accurate representation of human biological variation. It was never accurate in the past, and it remains inaccurate when referencing contemporary human populations."

**What Genetics Actually Shows:**
- Skin color is controlled by a tiny fraction of genes
- It evolved independently in different populations
- Dark skin is the ancestral human condition (protection from UV)
- Light skin evolved multiple times in different places
- Traits we associate with "race" don't cluster together genetically

🔥 **The Science**: If "race" were biological, genetic clusters would match racial categories. They don't. Race is a social construct with no biological basis.

**📚 Sources:**
- Human Genome Project findings (2000-2003)
- Templeton, Alan. "Biological Races in Humans" (2013)
- Yudell, Michael et al. "Taking Race Out of Human Genetics" Science (2016)
- Rosenberg et al. "Genetic Structure of Human Populations" Science (2002)
""",
                    keyPoints: [
                        "Human Genome Project: 99.9% identical, no biological races",
                        "More variation within 'races' than between them",
                        "Every major scientific body confirms this",
                        "Skin color is a tiny fraction of genetics"
                    ]
                ),
                
                RLLesson(
                    id: "rl1_3",
                    title: "The Debunked 'Science'",
                    content: """
**The Studies They Lied About**

"Scientific racism" produced fraudulent studies still cited today. Here's what actually happened:

**Samuel Morton's Skulls (1830s-1840s):**
- Morton measured skulls to "prove" racial hierarchy
- Claimed Caucasians had largest brains (therefore smartest)
- **The Fraud**: Stephen Jay Gould re-examined Morton's data and found:
  - He cherry-picked specimens
  - He mismeasured when it served his hypothesis
  - He excluded data that contradicted his conclusions
  - When properly analyzed, no significant differences exist

**The Bell Curve (1994):**
- Herrnstein & Murray claimed IQ differences between races are genetic
- **The Problems**:
  - IQ tests measure education access, not innate intelligence
  - "Flynn Effect": IQ scores rise ~3 points per decade everywhere (environment, not genes)
  - Study didn't control for socioeconomic factors
  - Funded by Pioneer Fund (white supremacist organization)
  - Repeatedly debunked by mainstream scientists

**Rushton's "Research" (1990s-2000s):**
- J. Philippe Rushton claimed racial hierarchy in brain size, intelligence, sexuality
- **The Reality**:
  - Also funded by Pioneer Fund
  - Used unethical methods
  - Cherry-picked data
  - Rejected by mainstream science
  - His university distanced from his work

**The Pattern:**
Every "study" claiming biological race differences:
- Was funded by racist organizations
- Used flawed methodology
- Has been debunked
- Is rejected by scientific consensus

🔥 **Why The Lies Persist**: Racism needs scientific cover. When one study is debunked, another appears. The funding comes from the same sources.

**📚 Sources:**
- Gould, Stephen Jay. "The Mismeasure of Man" (1981, 1996)
- Nisbett, Richard. "Intelligence and How to Get It" (2009)
- Tucker, William. "The Funding of Scientific Racism" (2002)
- Graves, Joseph. "The Emperor's New Clothes" (2001)
""",
                    keyPoints: [
                        "Morton's skull studies were fraudulent",
                        "The Bell Curve was funded by white supremacists",
                        "Every 'racial science' study has been debunked",
                        "Same racist organizations keep funding new studies"
                    ]
                )
            ]
        ),
        
        // ═══════════════════════════════════════════════════════════════
        // MODULE 2: ONE HUMAN FAMILY
        // ═══════════════════════════════════════════════════════════════
        
        RLModule(
            id: "rl_family",
            number: 2,
            title: "One Human Family",
            subtitle: "What we actually share",
            lessons: [
                RLLesson(
                    id: "rl2_1",
                    title: "We All Come From Africa",
                    content: """
**The Scientific Fact: All Humans Share African Ancestry**

Genetics, archaeology, and anthropology all confirm: every human alive traces back to Africa.

**The Evidence:**

**Genetic:**
- Mitochondrial Eve: All humans share a common maternal ancestor who lived in Africa ~200,000 years ago
- Y-Chromosomal Adam: All males share a common paternal ancestor from Africa ~200,000-300,000 years ago
- Greatest genetic diversity is in Africa (oldest population = most time for variation)
- Non-African populations are genetic subsets of African diversity

**Migration:**
- First humans left Africa ~70,000-100,000 years ago
- Multiple waves of migration
- All "racial" differences developed in the last 70,000 years
- That's 0.3% of human existence (if modern humans are 200,000 years old)

**What This Means:**
- "Race" is incredibly recent in evolutionary terms
- We've been one species far longer than we've had physical variations
- The variations that do exist (skin color, etc.) are superficial adaptations
- Under the skin, we are virtually identical

**African Origins of Civilization:**
- Oldest human fossils: Africa
- Oldest stone tools: Africa
- Oldest art: Africa
- First agricultural communities: Africa (and Near East)
- Ancient Egypt: African civilization

🔥 **The Unity**: Every human alive is African in origin. "Race" is a surface-level adaptation to climate over a tiny fraction of human history.

**📚 Sources:**
- Cann, Stoneking & Wilson. "Mitochondrial DNA and Human Evolution" Nature (1987)
- Nielsen et al. "Tracing the peopling of the world through genomics" Nature (2017)
- Tishkoff et al. "The Genetic Structure and History of Africans" Science (2009)
- National Geographic Genographic Project
""",
                    keyPoints: [
                        "All humans trace to African ancestors 200,000 years ago",
                        "Non-African populations are subsets of African diversity",
                        "'Racial' differences are less than 70,000 years old",
                        "We've been one species far longer than we've had variations"
                    ]
                ),
                
                RLLesson(
                    id: "rl2_2",
                    title: "The Same Awakening Technology",
                    content: """
**Every Culture Discovered the Same Inner Technology**

Despite being labeled as different "races," humans everywhere discovered the same spiritual awakening mechanisms - because we're the same species with the same neurology.

**The Universal Pattern:**

**Energy System:**
- Hinduism: Kundalini, Chakras, Prana
- China: Chi/Qi, Dantian, Meridians
- Japan: Ki
- Tibet: Tummo, Channels, Winds
- Sufism: Latifa (energy centers)
- Indigenous Americas: The Serpent, Sacred Centers
- Africa: Nyama, Ashe (life force)

**These All Describe The Same Thing:**
- Life force energy that runs through the body
- Centers where energy concentrates
- Channels where energy flows
- Awakening experiences when energy rises
- Enlightenment when the system is fully activated

**The Awakening Experience:**
- Christianity: Holy Spirit, Born Again, Theosis
- Hinduism: Kundalini Awakening, Moksha
- Buddhism: Bodhi, Nirvana, Satori
- Sufism: Fana, Baqa
- Kabbalah: Devekut
- Indigenous: Vision Quest, Initiation

**The Same Neurology:**
Modern neuroscience confirms:
- All humans have the same brain structures
- Same neural pathways for mystical experiences
- Same neurochemistry (DMT, serotonin, etc.)
- Same capacity for altered states

**Why the Same Discoveries?**
Because we're the SAME SPECIES with the SAME BODIES. Different cultures gave different names to what they found, but they found the same thing - because we ARE the same.

🔥 **The Deep Unity**: The fact that isolated cultures worldwide discovered the same spiritual technology proves we share the same consciousness architecture. Different names, same awakening.

**📚 Sources:**
- Newberg, Andrew. "Why God Won't Go Away" (2001)
- Feuerstein, Georg. "The Yoga Tradition" (1998)
- Eliade, Mircea. "Shamanism: Archaic Techniques of Ecstasy" (1964)
- Cardeña & Winkelman. "Altering Consciousness" (2011)
""",
                    keyPoints: [
                        "Every culture discovered energy systems (chakras, chi, etc.)",
                        "Same awakening experience with different names",
                        "Same neurology = same spiritual capacity",
                        "Worldwide parallel discoveries prove we're one species"
                    ]
                ),
                
                RLLesson(
                    id: "rl2_3",
                    title: "Blood, Organs, Love",
                    content: """
**The Practical Proof: Our Bodies Don't Know "Race"**

If race were biological, our bodies would recognize it. They don't.

**Blood Transfusion:**
- Blood type (A, B, AB, O) matters for transfusion
- "Race" does not
- A Black person with Type A blood can save a white person with Type A
- A white person cannot donate to another white person with incompatible blood type
- Race is irrelevant; blood type is biological

**Organ Transplant:**
- Matching is based on: blood type, tissue type, size, medical urgency
- "Race" is not a matching criterion
- A kidney from any "race" can save a life of any "race"
- The body accepts based on compatibility, not skin color

**Bone Marrow:**
- Matching is based on HLA markers
- These markers vary MORE within "races" than between them
- A Black donor may be a better match for a white patient than another white person
- The genetics that matter for matching don't follow "racial" lines

**Reproduction:**
- Any human can reproduce with any other human
- This is the biological definition of a single species
- "Interracial" children are not "mixed species"
- Hybrid vigor: diverse genetic backgrounds often produce healthier offspring

**Disease:**
- Some diseases are more common in certain populations
- This is due to geography and history, not "race"
- Sickle cell: common where malaria exists (protective adaptation)
- Cystic fibrosis: common in Northern European descent populations
- These are population-level frequencies, not racial categories

🔥 **The Body Knows**: When it comes to life and death - blood, organs, medicine - our bodies prove we are one species. "Race" is in our minds, not our cells.

**📚 Sources:**
- American Red Cross: Blood Types & Transfusion Guidelines
- United Network for Organ Sharing (UNOS) matching criteria
- National Marrow Donor Program
- Graves, Joseph. "The Race Myth" (2004)
""",
                    keyPoints: [
                        "Blood transfusion depends on type, not race",
                        "Organ transplants work across 'racial' lines",
                        "Bone marrow matching doesn't follow racial categories",
                        "Any human can reproduce with any human = one species"
                    ]
                )
            ]
        ),
        
        // ═══════════════════════════════════════════════════════════════
        // MODULE 3: THE REAL DIVISION
        // ═══════════════════════════════════════════════════════════════
        
        RLModule(
            id: "rl_division",
            number: 3,
            title: "The Real Division",
            subtitle: "Why the lie persists",
            lessons: [
                RLLesson(
                    id: "rl3_1",
                    title: "Cui Bono - Who Benefits?",
                    content: """
**The Race Lie Serves the Powerful**

If race is a lie, why does it persist? Because someone benefits.

**Divide and Conquer:**
Remember Bacon's Rebellion (1676)? Poor whites and Blacks united against wealthy landowners. The elite's response: create "whiteness" as a category to divide workers.

This pattern continues:

**Labor:**
- Racial division prevents worker solidarity
- White workers accept poverty if they're "above" Black workers
- Employers use racial tension to break unions
- "They're taking your jobs" divides workers from each other instead of uniting against exploitative bosses

**Politics:**
- "Southern Strategy": Republican party deliberately used racial resentment to win white votes
- "Welfare queen" stereotype: Turned white working class against social programs they also needed
- Immigration fear: Divides working people from each other
- Both parties use racial division to avoid class-based politics

**Economics:**
- Racist policies created wealth gaps
- Wealth gaps are then cited as "evidence" of racial difference
- The theft is hidden by claiming the victims are inferior
- Addressing racism would require addressing theft

**The Psychological Wage:**
W.E.B. Du Bois identified that poor whites received a "psychological wage" - the compensation of feeling superior to Blacks even while being economically exploited themselves.

This is still how it works:
- Poor white person: "At least I'm not Black"
- Result: Doesn't unite with poor Black people against the rich
- The rich stay rich, everyone else fights each other

🔥 **The Function**: Race isn't ignorance - it's strategy. It keeps working people divided so they never unite against those actually taking from them.

**📚 Sources:**
- Du Bois, W.E.B. "Black Reconstruction in America" (1935)
- Alexander, Michelle. "The New Jim Crow" (2010)
- Roediger, David. "The Wages of Whiteness" (1991)
- Isenberg, Nancy. "White Trash" (2016)
""",
                    keyPoints: [
                        "Race was created after Bacon's Rebellion to divide workers",
                        "Southern Strategy deliberately used racial resentment",
                        "'Psychological wage' keeps poor whites from uniting with poor Blacks",
                        "Race division benefits the wealthy; costs everyone else"
                    ]
                ),
                
                RLLesson(
                    id: "rl3_2",
                    title: "Awakening Beyond Race",
                    content: """
**The Spiritual Truth: Consciousness Has No Color**

Every wisdom tradition teaches that our true nature transcends physical form.

**What the Traditions Say:**

**Hinduism:**
"The Self (Atman) is not male, female, or neuter. It takes on whatever body it inhabits."
- The soul has no race; only the temporary body does

**Buddhism:**
"In the sky, there is no distinction of east and west; people create distinctions out of their own minds and then believe them to be true."
- Racial categories are maya (illusion)

**Christianity (Galatians 3:28):**
"There is neither Jew nor Gentile, neither slave nor free, nor is there male and female, for you are all one in Christ."
- In spiritual reality, divisions dissolve

**Islam:**
"O mankind, indeed We have created you from male and female and made you peoples and tribes that you may know one another." (Quran 49:13)
- Diversity is for connection, not hierarchy

**Indigenous Wisdom:**
"We are all related" (Mitakuye Oyasin) - Lakota
- All beings share the same source

**The Awakening Experience:**
People who have genuine awakening experiences consistently report:
- Feeling unity with all beings
- Seeing through surface-level differences
- Recognizing one consciousness in all forms
- Understanding that separation was the illusion

**The Practical Application:**
If you're awakening:
- Notice when racial programming activates
- Question: Is this MY thought or THEIR programming?
- Practice seeing consciousness, not categories
- Recognize: The person in front of you is YOU in another form

🔥 **The Deepest Truth**: The race lie isn't just sociologically false - it's spiritually false. We are one consciousness experiencing itself through many forms. Race is a costume, not a self.

**📚 Sources:**
- Perennial Philosophy traditions
- Huxley, Aldous. "The Perennial Philosophy" (1945)
- Wilber, Ken. "The Spectrum of Consciousness" (1977)
- King, Martin Luther Jr. "Letter from Birmingham Jail" (1963)
""",
                    keyPoints: [
                        "Every wisdom tradition teaches unity of consciousness",
                        "Awakening experiences reveal oneness",
                        "Racial categories are maya/illusion",
                        "We are one consciousness in many forms"
                    ]
                ),
                
                RLLesson(
                    id: "rl3_3",
                    title: "Breaking the Spell",
                    content: """
**What You Can Do**

Understanding the race lie is the beginning. Living beyond it is the practice.

**Personal Work:**

1. **Examine Your Programming**
   - Where did your beliefs about race come from?
   - What stereotypes do you carry unconsciously?
   - Notice when fear or judgment arises based on appearance

2. **Learn Real History**
   - Not the whitewashed version
   - The actual contributions of all peoples
   - How racial systems were constructed
   - Who benefited, who was harmed

3. **Diversify Your Inputs**
   - Media, books, teachers from various backgrounds
   - Notice when you've only heard one perspective
   - Seek out voices different from your own

4. **Practice Presence**
   - See the consciousness in people before the body
   - Connect soul-to-soul, not label-to-label
   - Remember: everyone is fighting a battle

**Collective Action:**

1. **Name the System**
   - Racism isn't individual meanness; it's a structure
   - "Not seeing color" ignores the structure
   - See the structure to change the structure

2. **Economic Solidarity**
   - Support worker movements across race
   - Recognize that racial division hurts all workers
   - United economic demands transcend division

3. **Tell the Truth**
   - Share the science
   - Correct the lies
   - Model unity

**The Vision:**
A world where "race" is understood as the lie it is:
- No hierarchy of human worth
- Cultural diversity celebrated, biological division rejected
- Economic justice not divided by skin color
- Spiritual practices recognized as universal

🔥 **Your Role**: You are awakening. Part of that awakening is seeing through humanity's deepest lies. Race is one of them. See through it. Live beyond it. Help others do the same.

**📚 Further Reading:**
- Kendi, Ibram X. "How to Be an Antiracist" (2019)
- DiAngelo, Robin. "White Fragility" (2018)
- Coates, Ta-Nehisi. "Between the World and Me" (2015)
- Saad, Layla. "Me and White Supremacy" (2020)
- American Anthropological Association: understandingrace.org
- Race: The Power of an Illusion (documentary)
""",
                    keyPoints: [
                        "Personal work: examine programming, learn history, diversify inputs",
                        "Collective action: name the system, economic solidarity, truth-telling",
                        "Awakening includes seeing through the race lie",
                        "Many resources available for deeper learning"
                    ]
                )
            ]
        )
    ]
}

// MARK: - Supporting Types

struct RLModule: Identifiable {
    let id: String
    let number: Int
    let title: String
    let subtitle: String
    let lessons: [RLLesson]
}

struct RLLesson: Identifiable {
    let id: String
    let title: String
    let content: String
    let keyPoints: [String]
}
