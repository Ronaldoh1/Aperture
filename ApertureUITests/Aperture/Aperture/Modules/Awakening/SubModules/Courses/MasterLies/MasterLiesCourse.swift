// MasterLiesCourse.swift
// THE MASTER LIES - Everything They Told You Was Wrong

import SwiftUI

struct MasterLiesCourse {
    static let shared = MasterLiesCourse()
    
    let id = "master_lies"
    let title = "The Master Lies"
    let subtitle = "Everything they told you was wrong"
    let icon = "exclamationmark.triangle.fill"
    let colorHex = "#FF1744"
    
    var color: Color { Color(hex: colorHex) }
    
    let modules: [LiesModule] = [
        
        // ═══════════════════════════════════════════════════════════════
        // MODULE 1: THE TWO-TIER EDUCATION SYSTEM
        // ═══════════════════════════════════════════════════════════════
        
        LiesModule(
            id: "lies_education",
            number: 1,
            title: "The Two-Tier Education System",
            subtitle: "Schools for rulers vs schools for workers",
            icon: "graduationcap.fill",
            lies: [
                ExposedLie(
                    id: "edu_1",
                    lieTitle: "\"Public school gives equal opportunity\"",
                    truth: "Schools Are Designed to Create Workers, Not Thinkers",
                    content: """
**The Prussian Model You Were Never Told About**

The American public school system wasn't designed for your success. It was imported from Prussia in the 1840s with one goal: create obedient citizens, disciplined workers, and loyal soldiers who wouldn't question authority.

**The Design:**
• Bells condition you to start/stop on command (factory shift change)
• Rows of desks facing forward (don't collaborate, don't question)
• Raise your hand to speak (ask permission for everything)
• Age-based grades (standardization over individual growth)
• Memorize and regurgitate (don't think critically)

**Woodrow Wilson Said It Out Loud (1909):**
"We want one class of persons to have a liberal education, and we want another class of persons, a very much larger class of necessity, to forgo the privileges of a liberal education and fit themselves to perform specific difficult manual tasks."

He literally said: one education for rulers, another for workers.

**John Taylor Gatto's Six Hidden Functions of School:**
(Gatto was NYC Teacher of the Year who quit in disgust)

1. **Adjustive Function**: Establish fixed habits of reaction to authority
2. **Integrating Function**: Make children as alike as possible (conformity)
3. **Diagnostic Function**: Determine each student's "proper social role"
4. **Differentiating Function**: Sort children by role and train them only so far
5. **Selective Function**: Tag the unfit with poor grades and remedial placement
6. **Propaedeutic Function**: A small fraction quietly taught to manage this system

🔥 **The Hidden Curriculum**: Beneath every subject is an unspoken lesson--obey, conform, don't question, know your place.
""",
                    evidence: [
                        "Prussian education model imported 1840s",
                        "Woodrow Wilson speech 1909",
                        "John Taylor Gatto 'Underground History of American Education'",
                        "Factory bell system deliberately mimicked"
                    ],
                    whobenefits: "Corporations get compliant workers. Government gets obedient citizens. The elite maintain their position."
                ),
                
                ExposedLie(
                    id: "edu_2",
                    lieTitle: "\"Elite schools are just more expensive\"",
                    truth: "Elite Schools Teach Leadership While Public Schools Teach Obedience",
                    content: """
**What $150,000/Year Schools Actually Teach**

Schools like Institut Le Rosey (Switzerland), Phillips Exeter, Eton College, and Choate aren't just "better funded" versions of public school. They teach COMPLETELY DIFFERENT THINGS.

**Elite School Curriculum (What Rulers Learn):**
• **Leadership, not obedience** -- Students lead, organize, and command
• **Access and networking** -- How to reach any person, any position
• **Critical thinking** -- Question everything, analyze power structures
• **Public speaking and debate** -- Control rooms, persuade masses
• **Real-world challenges** -- "Get a private meeting with a CEO"
• **80% independent work** -- Self-direction, not instruction-following
• **The pursuit of POWER** -- Track these schools' alumni: they run the world

**Public School Curriculum (What Workers Learn):**
• Sit still, raise your hand, wait to be called on
• Memorize what's in the textbook
• Don't question the teacher
• Ask permission to use the bathroom
• Grades = compliance score
• Prepare to ask for time off for the rest of your life

**The Alumni Tell The Story:**

**Le Rosey Alumni:**
• Shah of Iran
• Rockefeller dynasty members
• Rothschild family members
• European royalty

**Public School Alumni:**
• Designed to work for Le Rosey alumni

**The 80/20 Flip:**
• Elite schools: 80% independent work, 20% teacher-directed
• Public schools: 80% teacher-directed, 20% independent work

They're not even teaching the same game.

🔥 **The Pattern**: Elite schools teach children they can shape the world. Public schools teach children to fit into a world shaped by others.
""",
                    evidence: [
                        "Institut Le Rosey curriculum analysis",
                        "Phillips Exeter teaching methodology",
                        "Elite school alumni tracking studies",
                        "Comparative education research"
                    ],
                    whobenefits: "Ruling families maintain multi-generational power. Class mobility is minimized."
                ),
                
                ExposedLie(
                    id: "edu_3",
                    lieTitle: "\"Grades measure intelligence and ability\"",
                    truth: "Grades Measure Obedience, Not Intelligence",
                    content: """
**What Grades Actually Measure**

John Taylor Gatto, after 30 years teaching in NYC public schools and being named NYC Teacher of the Year, concluded:

"The only thing grades measure is obedience."

**The Evidence:**

**What Gets Good Grades:**
• Following instructions exactly
• Submitting on time
• Matching the expected answer
• Not challenging the teacher
• Sitting still and being quiet
• Conforming to format requirements

**What Gets Bad Grades:**
• Creative but "wrong" answers
• Questioning the material
• Working at your own pace
• Thinking outside the rubric
• Being energetic/restless
• Challenging authority

**Successful "Bad Students":**
• Einstein: Called "mentally slow"
• Edison: Told he was "too stupid to learn"
• Richard Branson: Headmaster said he'd end up in prison
• Steve Jobs: Dropped out
• Bill Gates: Dropped out
• Mark Zuckerberg: Dropped out

**The Correlation That Matters:**
Studies show grades correlate more with compliance and conscientiousness than with intelligence or future success.

**Why This Design?**
A factory needs workers who:
• Show up on time (attendance grades)
• Follow instructions (assignment grades)
• Don't cause problems (behavior grades)
• Accept evaluation by superiors (report cards)

School is job training for a job you were never asked if you wanted.

🔥 **The Trap**: Kids who get good grades often become adults who follow orders well but can't think independently. Kids who get bad grades often either fail OR become the ones giving orders.
""",
                    evidence: [
                        "John Taylor Gatto research",
                        "Studies on grade correlation with compliance",
                        "Success rates of dropouts vs valedictorians",
                        "Historical analysis of grading systems"
                    ],
                    whobenefits: "Employers get pre-sorted, pre-trained, compliant workers."
                )
            ]
        ),
        
        // ═══════════════════════════════════════════════════════════════
        // MODULE 2: SCIENCE LIES THEY TAUGHT IN SCHOOL
        // ═══════════════════════════════════════════════════════════════
        
        LiesModule(
            id: "lies_science",
            number: 2,
            title: "Science Lies They Taught You",
            subtitle: "If they lied about this, what else?",
            icon: "flask.fill",
            lies: [
                ExposedLie(
                    id: "sci_1",
                    lieTitle: "\"The tongue map - different areas taste different things\"",
                    truth: "The Tongue Map Is Completely False",
                    content: """
**You Were Taught:**
The tongue has specific regions for specific tastes:
• Sweet at the tip
• Salty on the sides front
• Sour on the sides back  
• Bitter at the back

**The Truth:**
This is 100% wrong. Every part of the tongue with taste receptors can taste ALL flavors.

**The History of the Lie:**
• 1901: German scientist D.P. Hanig did research showing SLIGHT variations in sensitivity
• His data was misinterpreted and turned into the "tongue map"
• 1974: Scientist Virginia Collings debunked it completely
• 50 YEARS LATER: Still taught in schools

**Why It Matters:**
This is a small lie. But consider:
• The "correct" information was available since 1974
• Yet textbooks continued printing the lie for 50+ years
• Teachers continued teaching it
• Tests continued grading it as "correct"

If they'll keep a lie THIS simple in textbooks for 50 years...

🔥 **The Pattern**: Textbooks aren't updated for truth. They're updated for profit (new editions) and approved content (curriculum boards). Truth is not the priority.
""",
                    evidence: [
                        "D.P. Hanig original 1901 research",
                        "Virginia Collings 1974 debunking",
                        "Textbook analysis showing continued inclusion",
                        "Current neuroscience on taste receptors"
                    ],
                    whobenefits: "Textbook companies sell editions without updating content. Teachers teach what they were taught."
                ),
                
                ExposedLie(
                    id: "sci_2",
                    lieTitle: "\"Blood is blue until it hits oxygen\"",
                    truth: "Your Blood Is NEVER Blue",
                    content: """
**You Were Taught:**
Blood in your veins is blue because it lacks oxygen. When it's exposed to air, it turns red.

**The Truth:**
Your blood is ALWAYS red. Always.

• Oxygenated blood: Bright red
• Deoxygenated blood: Dark red (maroon)
• Blue? NEVER.

**Why Veins Look Blue:**
It's an optical illusion. Blue light doesn't penetrate skin as well as red light. The way light interacts with your skin makes veins APPEAR blue. The blood inside is dark red.

**Why This Lie Persists:**
• It "makes sense" intuitively
• The visual "evidence" (blue veins) seems to confirm it
• It's in textbooks
• Teachers learned it wrong too

**If You Cut a Vein:**
Dark red blood comes out. Not blue. Has anyone ever bled blue? No. Yet we believed blood was blue because a textbook said so.

🔥 **The Lesson**: You believed something that contradicted your direct observation because an authority told you to. That's the programming.
""",
                    evidence: [
                        "Basic hematology",
                        "Optical physics of light through skin",
                        "No recorded instance of blue human blood"
                    ],
                    whobenefits: "Nobody specifically--this shows how false information persists through repetition and authority."
                ),
                
                ExposedLie(
                    id: "sci_3",
                    lieTitle: "\"We have five senses\"",
                    truth: "You Have Between 9 and 33 Senses",
                    content: """
**You Were Taught:**
Humans have five senses: sight, hearing, taste, smell, touch.

**The Truth:**
This is a MASSIVE undersimplification. Scientists now recognize at least 9-12 confirmed senses, with some arguing for up to 33.

**Senses They Didn't Tell You About:**

**Confirmed Additional Senses:**
• **Proprioception**: Knowing where your body parts are without looking
• **Equilibrioception**: Balance and spatial orientation
• **Thermoception**: Temperature sensing (separate from touch)
• **Nociception**: Pain (separate from touch)
• **Chronoception**: Sense of time passing
• **Interoception**: Internal body sensations (hunger, thirst, heart rate)

**Possible Additional Senses:**
• **Magnetoception**: Sensing magnetic fields (proven in birds, debated in humans)
• **Electroception**: Sensing electric fields
• **Pressure sensing**: Separate from touch

**Why Only Five?**
Aristotle said five. That's literally it. 2,400 years ago, a Greek philosopher made a list, and we're still teaching it as fact.

🔥 **The Pattern**: "Scientific fact" is often just OLD ideas that haven't been updated. Question everything, especially "common knowledge."
""",
                    evidence: [
                        "Neuroscience research on sensory systems",
                        "Proprioception studies",
                        "Vestibular system research",
                        "Aristotle's original five senses classification"
                    ],
                    whobenefits: "Simple models are easier to teach and test. Truth is complicated; tests need simple answers."
                ),
                
                ExposedLie(
                    id: "sci_4",
                    lieTitle: "\"Diamonds are rare and valuable\"",
                    truth: "Diamonds Are Artificially Scarce",
                    content: """
**You Were Taught:**
Diamonds are rare, precious gems. Their high cost reflects their scarcity.

**The Truth:**
Diamonds are one of the most common gems on Earth. Their price is artificially inflated through:
• Supply restriction
• Marketing manipulation
• Cartel control

**The De Beers Monopoly:**
• De Beers controlled 85-90% of world diamond supply for most of the 20th century
• They stockpile diamonds to restrict supply
• They release just enough to maintain artificial scarcity
• They've destroyed "excess" diamonds to keep prices high

**"A Diamond Is Forever" (1947):**
The most successful ad campaign in history. Before this:
• Diamond engagement rings weren't tradition
• Other gems were equally popular
• People didn't "need" diamonds for marriage

De Beers literally INVENTED the "tradition" of diamond engagement rings through marketing.

**The Actual Value:**
• Lab-created diamonds are chemically identical
• They cost a fraction of mined diamonds
• The industry fights against them because they'd collapse the price myth
• Resale value of diamonds is typically 25-50% of purchase price

**Blood Diamonds:**
Beyond the price lie, the industry has been built on:
• African exploitation
• Child labor
• Conflict financing
• Environmental destruction

🔥 **The Pattern**: "Value" is manufactured through marketing and artificial scarcity. They convinced you to spend 3 months' salary on a common rock.
""",
                    evidence: [
                        "De Beers market share history",
                        "N.W. Ayer 'A Diamond Is Forever' campaign docs",
                        "Diamond resale value studies",
                        "Lab diamond vs mined diamond comparisons"
                    ],
                    whobenefits: "De Beers, diamond retailers, mining companies. You pay 10x actual value."
                ),
                
                ExposedLie(
                    id: "sci_5",
                    lieTitle: "\"Lemmings commit mass suicide\"",
                    truth: "Disney Threw Lemmings Off a Cliff for a Documentary",
                    content: """
**You Were Taught:**
Lemmings, when overpopulated, instinctively commit mass suicide by jumping off cliffs.

**The Truth:**
This is completely false. Lemmings do NOT commit suicide.

**The Origin of the Lie:**
Disney's 1958 documentary "White Wilderness" showed lemmings jumping off cliffs. The footage won an Academy Award.

**What Actually Happened:**
• The film crew BOUGHT lemmings from Inuit children
• They were filmed on a TURNTABLE to simulate running
• The "cliff" footage was shot at a river in Alberta
• **The crew THREW the lemmings off the cliff**
• The lemmings didn't jump--they were pushed to their deaths

**Academy Award for Animal Murder:**
Disney won an Oscar for a documentary that faked footage by killing animals. This fake "nature documentary" created a myth that persists 65+ years later.

**Why This Matters:**
• An entertainment company created "scientific fact"
• They literally murdered animals for a narrative
• They won awards for it
• It's STILL believed today
• Nobody was ever held accountable

🔥 **The Pattern**: What you "know" about nature often comes from entertainment media, not science. Disney told you animals commit suicide--and you believed a corporation over reality.
""",
                    evidence: [
                        "Disney 'White Wilderness' production records",
                        "Canadian Broadcasting Corporation investigation",
                        "Lemming behavior research",
                        "Snopes investigation and verification"
                    ],
                    whobenefits: "Disney got an Oscar. The myth persists because it's a 'good story.'"
                ),
                
                ExposedLie(
                    id: "sci_6",
                    lieTitle: "\"We only use 10% of our brains\"",
                    truth: "You Use 100% of Your Brain",
                    content: """
**You Were Taught:**
Humans only use 10% of their brains. If we could access the other 90%, we'd have superpowers.

**The Truth:**
You use virtually 100% of your brain. Different regions are active at different times, but there's no dormant 90% waiting to be unlocked.

**Evidence Against the Myth:**
• Brain scans show activity throughout the brain
• Damage to ANY part causes deficits (no "unused" areas)
• The brain uses 20% of body's energy--evolution doesn't support unused tissue
• No neuroscientist has ever found an "unused" brain region

**Origin of the Myth:**
Unclear, but possibly:
• Misinterpretation of early neurological research
• Self-help gurus selling "unlock your potential" programs
• The movie "Lucy" and similar fiction

**Why It Persists:**
• It sells books, courses, and supplements
• "You have untapped potential" is a powerful marketing message
• It "explains" psychic powers, genius, etc.
• It makes people feel they can become superhuman

**The Industry Built On This Lie:**
• Brain training apps
• Nootropic supplements
• Self-help programs
• Pseudoscientific treatments

🔥 **The Pattern**: Lies that make you feel inadequate create markets to "fix" you. You don't need to unlock 90%--you're already using it all.
""",
                    evidence: [
                        "PET scan and fMRI brain imaging studies",
                        "Neurological damage mapping",
                        "Brain energy consumption research",
                        "History of the myth analysis"
                    ],
                    whobenefits: "Self-help industry, supplement companies, brain training apps."
                )
            ]
        ),
        
        // ═══════════════════════════════════════════════════════════════
        // MODULE 3: THE FOOD PYRAMID & NUTRITION LIES
        // ═══════════════════════════════════════════════════════════════
        
        LiesModule(
            id: "lies_nutrition",
            number: 3,
            title: "Nutrition Lies",
            subtitle: "The food pyramid was a corporate document",
            icon: "fork.knife",
            lies: [
                ExposedLie(
                    id: "nut_1",
                    lieTitle: "\"Fat causes heart disease\"",
                    truth: "Sugar Industry Paid Harvard to Blame Fat",
                    content: """
**You Were Taught:**
Saturated fat and cholesterol cause heart disease. Avoid fat to stay healthy.

**The Truth:**
In 1967, the sugar industry paid Harvard researchers the equivalent of $48,900 to publish a literature review blaming fat for heart disease--and exonerating sugar.

**The Sugar Research Foundation (SRF) Scandal:**
• 1965: SRF internally noted studies linking sugar to heart disease
• 1967: SRF paid Harvard scientists to write a review article
• The article concluded "no doubt" fat was the culprit
• Sugar was dismissed as a risk factor
• Published in New England Journal of Medicine (most prestigious)
• The funding was never disclosed

**The Quote That Reveals Everything:**
The SRF's internal documents show they knew sugar was dangerous. One executive wrote about the need to "ichter [destroy] the effects of sugar in heart disease."

**60 Years of Consequences:**
• "Low-fat" everything (replaced fat with sugar)
• Fat-free foods higher in sugar
• Obesity epidemic
• Type 2 diabetes epidemic
• Heart disease rates didn't decrease
• $30+ billion statin industry built on cholesterol myth

**The Real Culprits:**
Modern research shows:
• Sugar and refined carbs drive inflammation
• Inflammation drives heart disease
• Saturated fat is not the villain
• The low-fat diet made things WORSE

🔥 **The Pattern**: "Settled science" was bought by industry. For 60 years, you avoided fat and ate sugar--exactly as they paid Harvard to tell you.
""",
                    evidence: [
                        "UCSF Industry Documents Library",
                        "Sugar Research Foundation internal documents",
                        "1967 NEJM literature review",
                        "Cristin Kearns research at UCSF"
                    ],
                    whobenefits: "Sugar industry ($100B+), processed food companies, pharmaceutical companies selling cholesterol drugs."
                ),
                
                ExposedLie(
                    id: "nut_2",
                    lieTitle: "\"The Food Pyramid is science-based nutrition\"",
                    truth: "The Food Pyramid Was Written By Agriculture Lobbyists",
                    content: """
**You Were Taught:**
The USDA Food Pyramid (6-11 servings of grains daily!) represented optimal nutrition based on science.

**The Truth:**
The food pyramid was shaped by agricultural industry lobbying, not nutritional science.

**The Original Pyramid (1991):**
Base: 6-11 servings of bread, cereal, rice, pasta
Top (eat sparingly): Fats, oils, sweets

**Who Wrote It:**
• USDA (United States Department of AGRICULTURE)
• Mission: Promote American agricultural products
• Advisors: Agriculture industry representatives
• Conflict of interest? They ARE the conflict of interest

**The Lobbying Process:**
• Cattle industry lobbied against "eat less red meat" language
• It became "choose lean meats"
• Dairy industry ensured dairy had its own group
• Grain industry got the entire base of the pyramid
• Sugar industry avoided the top "limit" category

**Luise Light's Testimony:**
USDA nutritionist Luise Light helped create the original recommendations. She later revealed:
• Her team recommended 3-4 grain servings (not 6-11)
• The recommendation was changed after industry pressure
• "The changes were tweaked based on political agendas"

**The Result:**
Americans followed the pyramid → got fatter and sicker
The pyramid was replaced by MyPlate → still influenced by industry

🔥 **The Pattern**: Government nutrition advice serves agricultural business, not your health. The fox designed the henhouse security system.
""",
                    evidence: [
                        "USDA Food Pyramid development documents",
                        "Luise Light testimony and book",
                        "Food industry lobbying records",
                        "MyPlate industry influence analysis"
                    ],
                    whobenefits: "Grain industry, dairy industry, processed food companies."
                ),
                
                ExposedLie(
                    id: "nut_3",
                    lieTitle: "\"Breakfast is the most important meal\"",
                    truth: "A Cereal Company Invented This 'Fact'",
                    content: """
**You Were Taught:**
Breakfast is the most important meal of the day. Skipping it is unhealthy.

**The Truth:**
This "fact" was invented by cereal companies to sell more cereal.

**The Origin:**
1944: General Foods (makers of Grape Nuts) hired a marketing agency. They created a campaign including:
• Radio spots
• Print ads
• The phrase "Breakfast is the most important meal of the day"

It wasn't science. It was advertising copy.

**The "Studies" That Followed:**
• Most "breakfast is essential" studies were funded by cereal companies
• Kellogg's, General Mills, and Quaker have funded favorable research
• Studies often compare breakfast eaters to people with chaotic lifestyles
• Correlation ≠ causation

**What Science Actually Shows:**
• Intermittent fasting (skipping breakfast) has health benefits
• Time-restricted eating can improve metabolic health
• Your body doesn't "need" food immediately upon waking
• Many cultures historically ate 1-2 meals daily

**The Industry Today:**
• $40+ billion breakfast cereal industry
• Built on marketing disguised as science
• Sugary cereals marketed to children
• "Part of a complete breakfast" = legal disclaimer that the cereal alone is nutritionally inadequate

🔥 **The Pattern**: Marketing became "common knowledge." You've been eating sugar for breakfast because a company in 1944 wanted to sell grain products.
""",
                    evidence: [
                        "General Foods 1944 marketing campaign",
                        "Cereal company funded breakfast studies",
                        "Intermittent fasting research",
                        "Breakfast industry marketing history"
                    ],
                    whobenefits: "Cereal companies, breakfast food industry ($50B+ market)."
                ),
                
                ExposedLie(
                    id: "nut_4",
                    lieTitle: "\"Drink 8 glasses of water a day\"",
                    truth: "There's Zero Science Behind This Number",
                    content: """
**You Were Taught:**
You need to drink 8 glasses (64 oz) of water daily for optimal health.

**The Truth:**
There is no scientific evidence for this specific number. It appears to have been invented.

**The Origin (Best Guess):**
1945: US Food and Nutrition Board mentioned 2.5 liters of daily water intake. BUT the next sentence said "most of this is contained in prepared foods." That sentence was forgotten.

**What Science Actually Shows:**
• Water needs vary by person, activity, climate, diet
• Thirst is a reliable indicator of hydration needs
• Food provides significant water (fruits, vegetables, etc.)
• Coffee and tea count toward hydration (despite caffeine myths)
• Overhydration can be dangerous (hyponatremia)

**Who Benefits From the Myth:**
• Bottled water industry ($300+ billion globally)
• Reusable water bottle industry
• "Hydration" product companies
• Apps and trackers that remind you to drink

**The Marketing:**
The bottled water industry took a vague recommendation and turned it into:
• "You're not drinking enough!"
• "You're probably dehydrated right now!"
• "Buy our water!"

**The Truth:**
Drink when you're thirsty. Your body has regulated hydration for millions of years. It doesn't need an app.

🔥 **The Pattern**: A made-up number became medical "fact" because it could be monetized. Your body knows when it needs water--you don't need a corporation to tell you.
""",
                    evidence: [
                        "1945 Food and Nutrition Board recommendation (full context)",
                        "Hydration science reviews",
                        "Bottled water industry marketing analysis",
                        "No clinical trials supporting 8 glasses"
                    ],
                    whobenefits: "Bottled water industry, hydration product companies."
                )
            ]
        )
    ]
}

// MARK: - Supporting Types

struct LiesModule: Identifiable {
    let id: String
    let number: Int
    let title: String
    let subtitle: String
    let icon: String
    let lies: [ExposedLie]
}

struct ExposedLie: Identifiable {
    let id: String
    let lieTitle: String
    let truth: String
    let content: String
    let evidence: [String]
    let whobenefits: String
}

struct MasterLiesProgress: Codable {
    var completedLies: [String]
    var lastAccessed: Date?
    static var `default`: MasterLiesProgress { MasterLiesProgress(completedLies: [], lastAccessed: nil) }
}
