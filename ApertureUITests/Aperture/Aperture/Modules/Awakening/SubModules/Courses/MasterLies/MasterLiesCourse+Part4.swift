// MasterLiesCourse+Part4.swift
// The Darkest Secrets - Government Experiments & Medical Industry Lies

import Foundation

extension MasterLiesCourse {
    
    static var darkestSecrets: [LiesModule] {
        [
            // MARK: - Government Experiments on Citizens
            LiesModule(
                id: "lies_experiments",
                number: 10,
                title: "They Experimented On Us",
                subtitle: "Declassified Government Programs",
                icon: "cross.vial.fill",
                lies: [
                    ExposedLie(
                        id: "exp_1",
                        lieTitle: "\"The government would never experiment on its own citizens\"",
                        truth: "Tuskegee: 40 Years of Deliberate Infection",
                        content: """
**The Official Story:**
The US government protects its citizens and would never conduct unethical experiments on them.

**The Truth:**
From 1932 to 1972, the U.S. Public Health Service conducted the Tuskegee Syphilis Study on 600 impoverished Black sharecroppers in Alabama.

**What They Did:**
- 399 men with syphilis were told they had "bad blood"
- They were given FAKE treatments (placebos)
- When penicillin became available in 1947, they were DENIED treatment
- Doctors actively prevented them from getting treatment elsewhere

**The "Last Chance" Letter:**
To get men to show up for painful, dangerous spinal taps, doctors sent a letter titled "Last Chance for Special Free Treatment" - it was neither treatment nor their last chance.

**The Death Toll:**
- 28 men died directly from syphilis
- 100 died from related complications
- 40 wives were infected
- 19 children born with congenital syphilis

**This continued until 1972** - not the 1800s, not the early 1900s. 1972.
""",
                        evidence: [
                            "CDC official acknowledgment",
                            "Presidential apology (Clinton, 1997)",
                            "Exposed by whistleblower Peter Buxtun",
                            "National Archives documentation"
                        ],
                        whobenefits: "Medical researchers got 40 years of data on untreated syphilis. The subjects got death."
                    ),
                    
                    ExposedLie(
                        id: "exp_2",
                        lieTitle: "\"MKUltra is a conspiracy theory\"",
                        truth: "CIA Mind Control: Exposed by Congress in 1977",
                        content: """
**The Official Story:**
MKUltra is a "conspiracy theory" spread by paranoid people.

**The Truth:**
Project MKUltra was a REAL CIA program (1953-1973) that conducted illegal experiments on unwitting American and Canadian citizens.

**What They Did:**
- Drugged people with LSD without their knowledge or consent
- Used prostitutes to lure men to "safe houses" where they were secretly drugged and observed through one-way mirrors (Operation Midnight Climax)
- Conducted experiments in universities, hospitals, and prisons

**Racial Targeting:**
- Black participants received 180 mcg of LSD
- White participants received 75 mcg
- White subjects: 8 days of LSD
- Black subjects: up to 85 DAYS of continuous LSD

**The Murder:**
Dr. Frank Olson was given LSD without his knowledge. Nine days later, he "fell" from a hotel window. His death was covered up for 22 years. His family received a government settlement.

**How We Know:**
In 1973, CIA Director Richard Helms ordered all MKUltra files destroyed. But he missed some. Congress investigated in 1977 and confirmed it all.
""",
                        evidence: [
                            "1977 Senate hearings (Church Committee)",
                            "Surviving CIA documents",
                            "Victim testimonies",
                            "Olson family lawsuit settlement"
                        ],
                        whobenefits: "The CIA wanted to develop mind control techniques. American citizens were the lab rats."
                    ),
                    
                    ExposedLie(
                        id: "exp_3",
                        lieTitle: "\"That could never happen today\"",
                        truth: "Guatemala Syphilis Experiments (1946-1948)",
                        content: """
**The Official Story:**
Unethical experiments were a thing of the past.

**The Truth:**
While prosecuting Nazis for human experimentation at Nuremberg, the US was SIMULTANEOUSLY running its own experiments in Guatemala.

**What They Did:**
- US researchers deliberately infected Guatemalan mental patients, prisoners, and soldiers with syphilis and gonorrhea
- They used prostitutes to spread the diseases
- Many were not treated afterward

**The Cover-Up:**
This wasn't discovered until 2010 - over 60 years later - when a historian found the records.

**The Response:**
- President Obama personally called Guatemala's president to apologize
- Guatemala called it "a crime against humanity"
- The lead researcher? John Charles Cutler - the SAME doctor who later ran Tuskegee

**The Pattern:**
Same doctor. Same crimes. Different countries. Decades apart. No consequences.
""",
                        evidence: [
                            "Obama's 2010 apology",
                            "Susan Reverby's research (Wellesley College)",
                            "Presidential Commission investigation",
                            "Guatemala's official response"
                        ],
                        whobenefits: "US researchers got data. Guatemalans got infected. The doctor got promoted to Tuskegee."
                    )
                ]
            ),
            
            // MARK: - The Chemical Imbalance Lie
            LiesModule(
                id: "lies_chemical",
                number: 11,
                title: "The Chemical Imbalance Lie",
                subtitle: "The $12 Billion Myth",
                icon: "brain.head.profile",
                lies: [
                    ExposedLie(
                        id: "chem_1",
                        lieTitle: "\"Depression is caused by a chemical imbalance in the brain\"",
                        truth: "There Is ZERO Evidence For This Theory",
                        content: """
**What You Were Told:**
Depression is caused by low serotonin - a "chemical imbalance" that antidepressants correct.

**The Truth:**
A massive 2022 umbrella review published in Molecular Psychiatry examined decades of research and concluded:

"There remains no clear evidence that serotonin levels or serotonin activity are responsible for depression."

**The Scale of the Lie:**
- 85-90% of the public believes depression is caused by chemical imbalance
- This belief is NOT grounded in any scientific evidence
- It was created by pharmaceutical marketing, not research

**Pfizer's Lies:**
Pfizer's Zoloft ads stated depression "may be due to a chemical imbalance" and that "Zoloft works to correct this imbalance."

There is no scientifically established "correct balance" of serotonin.

**The Darkest Finding:**
The same study found evidence that long-term antidepressant use may actually LOWER serotonin levels.

The "cure" might be causing the very problem it claims to fix.
""",
                        evidence: [
                            "2022 UCL umbrella review (Molecular Psychiatry)",
                            "Decades of failed replication studies",
                            "No biological test for 'chemical imbalance'",
                            "FDA never required proof of mechanism"
                        ],
                        whobenefits: "The $12 billion/year antidepressant industry. 85% of people believe a marketing slogan is science."
                    ),
                    
                    ExposedLie(
                        id: "chem_2",
                        lieTitle: "\"Antidepressants work by correcting brain chemistry\"",
                        truth: "We Don't Actually Know How They Work",
                        content: """
**What Doctors Say:**
"SSRIs work by increasing serotonin levels in the brain."

**The Truth:**
- SSRIs increase serotonin within HOURS
- Mood effects (if any) take WEEKS
- If low serotonin caused depression, the fix would be immediate
- It isn't. Because that's not how it works.

**The Honest Answer:**
We don't know why some people feel better on antidepressants. The serotonin theory was a guess that became marketing that became "common knowledge."

**The Business Model:**
1. Create a simple story: "Chemical imbalance"
2. Market the "solution": SSRIs
3. Build a $12 billion industry
4. When questioned, say "the science is settled"
5. The science was never there

**The Irony:**
The researchers who proposed the serotonin hypothesis in the 1960s never intended it to become medical dogma. They were speculating. Pharma turned speculation into gospel.
""",
                        evidence: [
                            "Timing mismatch (hours vs weeks)",
                            "Original hypothesis was tentative",
                            "No biological test exists",
                            "Placebo performs similarly in trials"
                        ],
                        whobenefits: "A simple story sells pills. Complexity doesn't."
                    )
                ]
            ),
            
            // MARK: - Big Pharma Death Toll
            LiesModule(
                id: "lies_vioxx",
                number: 12,
                title: "When Pharma Kills",
                subtitle: "Exposed Scandals",
                icon: "cross.circle.fill",
                lies: [
                    ExposedLie(
                        id: "vioxx_1",
                        lieTitle: "\"Vioxx is safe for long-term use\"",
                        truth: "Merck Knew It Caused Heart Attacks - And Hid It",
                        content: """
**The Official Story:**
Vioxx was a safe, effective painkiller.

**The Truth:**
Merck's own research showed Vioxx caused heart attacks. They hid the data and kept selling it.

**The Timeline:**
- 1999: Internal testing shows 80 patients had heart conditions or died
- 2000: Merck submits results to medical journals with negative findings OMITTED
- 2004: Merck finally recalls Vioxx (voluntarily, to avoid worse)

**The Body Count:**
- Up to 140,000 heart attacks attributed to Vioxx
- Unknown thousands of deaths
- FDA and Merck both ignored early warning signs

**The "Punishment":**
Merck paid $4.85 billion in settlements.

Vioxx made them $2.5 billion per year at peak sales.

The math: Kill people, pay fine, keep profits.
""",
                        evidence: [
                            "Internal Merck documents (litigation discovery)",
                            "NEJM correction on omitted data",
                            "FDA whistleblower testimony",
                            "$4.85 billion settlement"
                        ],
                        whobenefits: "Merck made billions. Patients got heart attacks. Executives got bonuses."
                    ),
                    
                    ExposedLie(
                        id: "vioxx_2",
                        lieTitle: "\"Thalidomide was properly tested\"",
                        truth: "10,000+ Babies Deformed - Company Founded by a Nazi",
                        content: """
**The Official Story:**
Modern drug testing prevents dangerous medications from reaching patients.

**The Truth:**
Thalidomide was marketed as a safe sedative and morning sickness medication in the late 1950s - WITHOUT being tested on pregnant women.

**The Result:**
- Over 10,000 babies born with severe deformities (phocomelia - flipper-like limbs)
- Thousands of miscarriages
- Sold in 46 countries before being pulled

**The Company:**
Chemie Grunenthal was founded by Hermann Wirtz Sr. - a Nazi Party member - after WWII.

**The US Exception:**
FDA reviewer Frances Kelsey refused to approve Thalidomide in the US, despite intense pressure from the company. She's the reason it wasn't worse here.

**The Lesson:**
One person saying "prove it's safe first" saved thousands. The system didn't protect anyone - one individual did.
""",
                        evidence: [
                            "Birth defect documentation worldwide",
                            "Frances Kelsey's FDA records",
                            "Company founder's Nazi Party membership",
                            "46-country distribution before recall"
                        ],
                        whobenefits: "Company profits came before infant safety. One FDA reviewer had to stand alone."
                    )
                ]
            ),
            
            // MARK: - Two-Tier Education Deep Dive
            LiesModule(
                id: "lies_elite_schools",
                number: 13,
                title: "The Schools You Don't Know About",
                subtitle: "What $150K/Year Buys",
                icon: "building.columns.fill",
                lies: [
                    ExposedLie(
                        id: "elite_1",
                        lieTitle: "\"All schools teach the same curriculum\"",
                        truth: "Elite Schools Teach Power - Yours Taught Obedience",
                        content: """
**What You Were Told:**
Education is equal opportunity. Work hard, succeed.

**The Truth:**
There are two completely different education systems operating in parallel.

**Le Rosey (Switzerland) - $150,000/year:**
- Alumni: Shah of Iran, Rockefeller heirs, Rothschild dynasty, royal families
- Teaches: Leadership, diplomacy, investment strategy, classical philosophy
- Mission: Produce global leaders, not employees
- Teachers: Former ambassadors, CEOs, Oxford/Harvard professors

**Your Public School:**
- Teaches: Compliance, memorization, test-taking
- Mission: Produce obedient workers
- Method: Sit still, raise hand, ask permission, prepare to ask for time off

**The Ratio:**
- Elite schools: 80-90% independent work
- Public schools: 80-90% teacher-directed work

One system creates people who give orders. The other creates people who follow them.
""",
                        evidence: [
                            "Le Rosey alumni records",
                            "Phillips Exeter Academy curriculum",
                            "Eton College mission statements",
                            "Public school standardized testing mandates"
                        ],
                        whobenefits: "The children of the elite get taught to rule. Everyone else gets taught to work."
                    ),
                    
                    ExposedLie(
                        id: "elite_2",
                        lieTitle: "\"They teach ACCESS at elite schools\"",
                        truth: "The Complete Theory of Access",
                        content: """
**What Elite Schools Teach:**
A complete theory of access to any place and any person.

**The Exercise:**
"Set a kid the challenge of getting a private meeting with a mayor, governor, or CEO."

Not "how to write a resume." Not "how to apply for jobs." How to ACCESS POWER DIRECTLY.

**What You Were Taught:**
- Follow the application process
- Wait your turn
- Respect the chain of command
- Don't bother important people

**The Difference:**
Elite kids learn: "I can access anyone. Let me figure out how."
Public school kids learn: "There's a process. Follow it and wait."

**Frederick T. Gates (Rockefeller's Advisor):**
"We shall not try to make these people or any of their children into philosophers or men of learning or of science."

That wasn't a conspiracy theory. That was the ACTUAL PLAN, written down, by the people who funded public education.
""",
                        evidence: [
                            "Frederick T. Gates' writings",
                            "Elite school curriculum documents",
                            "John Taylor Gatto's research",
                            "Rockefeller Foundation education records"
                        ],
                        whobenefits: "Those who design education get to decide who rules and who serves."
                    )
                ]
            ),
            
            // MARK: - Scientific Lies Still Taught
            LiesModule(
                id: "lies_science_myths",
                number: 14,
                title: "Science Class Was Wrong",
                subtitle: "Myths Still in Textbooks",
                icon: "book.closed.fill",
                lies: [
                    ExposedLie(
                        id: "sci_1",
                        lieTitle: "\"Different parts of the tongue taste different things\"",
                        truth: "The Tongue Map Was Debunked in 1974",
                        content: """
**What You Were Taught:**
The tip of your tongue tastes sweet, sides taste sour, back tastes bitter.

**The Truth:**
This was debunked in 1974. All taste buds can detect all tastes.

**The Origin:**
A 1901 German thesis was mistranslated and misinterpreted. The "map" was never accurate.

**Why This Matters:**
If they're STILL teaching something debunked 50 years ago, what else is wrong?

The tongue map is your entry point to questioning everything.
""",
                        evidence: [
                            "1974 Virginia Collings study",
                            "Modern taste receptor research",
                            "Original 1901 thesis mistranslation"
                        ],
                        whobenefits: "Textbook publishers who don't update. Teachers who teach what they were taught."
                    ),
                    
                    ExposedLie(
                        id: "sci_2",
                        lieTitle: "\"You have five senses\"",
                        truth: "You Have 22-33 Senses",
                        content: """
**What You Were Taught:**
Sight, hearing, touch, taste, smell. Five senses.

**The Truth:**
Scientists now recognize at least 8-12 distinct senses, with some arguing for 22-33:

- Proprioception (body position)
- Equilibrioception (balance)
- Thermoception (temperature)
- Nociception (pain)
- Chronoception (time)
- Interoception (internal body states)

**Why Five?**
Aristotle said five. Nobody updated for 2,400 years.

**The Pattern:**
Authority figure said something. Everyone repeated it. Nobody checked.
""",
                        evidence: [
                            "Modern neuroscience research",
                            "Proprioception studies",
                            "Vestibular system research"
                        ],
                        whobenefits: "Simplicity over accuracy. Easy to test, easy to grade, easy to forget questioning."
                    ),
                    
                    ExposedLie(
                        id: "sci_3",
                        lieTitle: "\"The Food Pyramid is healthy eating\"",
                        truth: "Sugar Industry Designed Our Nutrition Guidelines",
                        content: """
**What You Were Taught:**
6-11 servings of bread, pasta, and grains daily. Fat is the enemy.

**The Truth:**
In the 1960s, the sugar industry paid Harvard scientists (equivalent of $48,900 today) to publish research blaming fat for heart disease and downplaying sugar's role.

**The 1967 Review:**
Harvard researchers wrote there was "no doubt" that reducing fat was the only dietary intervention needed. They overstated evidence against fat while hiding evidence against sugar.

**The Playbook:**
This is the EXACT playbook tobacco used:
1. Fund your own research
2. Attack competing science
3. Create doubt about real findings
4. Repeat until it becomes "common knowledge"

**The Result:**
- $30 billion statin drug industry
- Obesity epidemic from "low-fat" (high-sugar) foods
- Decades of wrong dietary advice
""",
                        evidence: [
                            "UCSF sugar industry documents",
                            "1967 NEJM article funding disclosure",
                            "Sugar Research Foundation internal memos"
                        ],
                        whobenefits: "Sugar industry. Statin manufacturers. Everyone except people trying to be healthy."
                    )
                ]
            )
        ]
    }
    
}
