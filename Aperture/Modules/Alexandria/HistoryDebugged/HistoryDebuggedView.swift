// HistoryDebuggedView.swift
// History Debugged: The OS Upgrade for Your Worldview
// "History isn't just dates and dead folks; it's the OS we run our worldviews on.
//  If it's buggy with lies, we're all glitching. Let's debug."

import SwiftUI

// MARK: - Models

struct HistoryTopic: Identifiable {
    let id = UUID()
    let title: String
    let era: HistoricalEra
    let region: HistoricalRegion
    let commonLie: String
    let thetruth: String
    let awakeningAngle: String
    let keyFacts: [String]
    let whobenefits: [String]
    let furtherReading: [HistoryResource]
    let dragonComment: String
    let impactLevel: Int // 1-5 how much this lie affects modern thinking
}

struct HistoryResource: Identifiable {
    let id = UUID()
    let title: String
    let author: String?
    let type: ResourceType
    let url: String?
    
    enum ResourceType: String {
        case book = "Book"
        case article = "Article"
        case documentary = "Documentary"
        case academic = "Academic"
        case wikipedia = "Wikipedia"
    }
}

enum HistoricalEra: String, CaseIterable {
    case ancient = "Ancient World"
    case medieval = "Medieval"
    case colonial = "Colonial Era"
    case modern = "Modern"
    case allEras = "All Eras"
    
    var icon: String {
        switch self {
        case .ancient: return "building.columns.fill"
        case .medieval: return "shield.fill"
        case .colonial: return "sailboat.fill"
        case .modern: return "clock.fill"
        case .allEras: return "globe"
        }
    }
    
    var color: Color {
        switch self {
        case .ancient: return .orange
        case .medieval: return .purple
        case .colonial: return .red
        case .modern: return .blue
        case .allEras: return .gray
        }
    }
}

enum HistoricalRegion: String, CaseIterable {
    case americas = "Americas"
    case europe = "Europe"
    case africa = "Africa"
    case asia = "Asia"
    case global = "Global"
    
    var icon: String {
        switch self {
        case .americas: return "globe.americas.fill"
        case .europe: return "globe.europe.africa.fill"
        case .africa: return "globe.europe.africa.fill"
        case .asia: return "globe.asia.australia.fill"
        case .global: return "globe"
        }
    }
}

// MARK: - Database

struct HistoryDebuggedDatabase {
    
    static let introduction = """
History isn't just dates and dead folks—it's the OS we run our worldviews on. If it's buggy with lies, we're all glitching.

As your cognitive augmentation squad—spotting the chasm between sanitized textbooks and raw reality—we're here to bridge that gap.

These aren't conspiracy rabbit holes but well-substantiated revisions that can recalibrate how we operate today. Think of this as upgrading your mental firmware.

For each topic:
• THE LIE: What you were taught
• THE TRUTH: What actually happened  
• THE AWAKENING: Why this matters now
• WHO BENEFITS: Follow the money
"""
    
    static let allTopics: [HistoryTopic] = [
        
        // MARK: - 1. Columbus
        HistoryTopic(
            title: "Christopher Columbus 'Discovering' America",
            era: .colonial,
            region: .americas,
            commonLie: "Columbus was the heroic first European to find the Americas in 1492, mistaking it for India and kindly interacting with 'Indians.' He proved the world wasn't flat and opened the New World to civilization.",
            thetruth: """
The Americas were already inhabited by MILLIONS of Indigenous peoples with advanced societies. Columbus wasn't even the first European—Vikings reached North America around 1000 CE (Leif Erikson at L'Anse aux Meadows, now a UNESCO World Heritage Site).

Columbus's voyages involved brutality, enslavement, and genocide. He never set foot on mainland North America—only Caribbean islands. His "discovery" was about exploitation, not exploration.

DNA and archaeological evidence show pre-Columbian transoceanic contacts, debunking the Eurocentric "empty land" myth entirely.

Also: educated people in 1492 ALREADY KNEW the Earth was round. This was established since ancient Greece. The "flat Earth" myth was invented in the 1800s.
""",
            awakeningAngle: "This narrative props up colonial justification for land grabs—the 'Doctrine of Discovery' is still cited in legal cases today. Truth empowers recognizing ongoing Indigenous rights and avoiding 'discovery' mindsets in modern geopolitics—like treating resources as 'unclaimed' when they're not.",
            keyFacts: [
                "Vikings reached North America ~1000 CE (500 years before Columbus)",
                "Millions of Indigenous people with advanced societies already lived there",
                "Columbus never reached mainland North America",
                "His voyages involved enslavement and genocide",
                "Educated Europeans already knew Earth was round",
                "The 'flat Earth' myth was invented in the 1800s"
            ],
            whobenefits: [
                "Colonial powers justifying land seizures",
                "Eurocentric historical narratives",
                "Those dismissing Indigenous rights claims",
                "American exceptionalism mythology"
            ],
            furtherReading: [
                HistoryResource(title: "A People's History of the United States", author: "Howard Zinn", type: .book, url: nil),
                HistoryResource(title: "1491: New Revelations of the Americas Before Columbus", author: "Charles C. Mann", type: .book, url: nil),
                HistoryResource(title: "Columbus Controversy", author: nil, type: .wikipedia, url: "https://en.wikipedia.org/wiki/Christopher_Columbus#Criticism_and_defense")
            ],
            dragonComment: "They called it 'discovery' when millions already lived there. Imagine someone 'discovering' your house while you're in it. That's the logic we're working with. 🐉",
            impactLevel: 5
        ),
        
        // MARK: - 2. Thanksgiving
        HistoryTopic(
            title: "The Pilgrims and Thanksgiving as Peaceful Harmony",
            era: .colonial,
            region: .americas,
            commonLie: "The Pilgrims fled religious persecution, befriended Native Americans, and shared a jolly feast in 1621 as equals. This began a lasting friendship between cultures that built America together.",
            thetruth: """
The "first Thanksgiving" was a brief tactical alliance amid Native aid to starving colonists—not a friendship dinner. The Wampanoag helped as a strategic move against rival tribes, not out of naive generosity.

What the myth hides:
• Diseases from earlier European contact had already killed up to 90% of coastal Native populations BEFORE the Pilgrims arrived
• The Pilgrims literally moved into abandoned villages
• Within 15 years came the Pequot Massacre (1637)—colonists burning hundreds of Pequot men, women, and children alive
• The romantic narrative ignores the broader pattern of betrayal and displacement

The first "official" Thanksgiving was proclaimed to celebrate the Pequot massacre, not the 1621 harvest meal.
""",
            awakeningAngle: "It sanitizes settler colonialism into a feel-good story. Unpacking it helps us confront systemic inequalities today—land acknowledgments, treaty rights, and reparations debates require understanding this wasn't 'sharing' but the beginning of systematic displacement.",
            keyFacts: [
                "1621 event was a tactical alliance, not friendship",
                "90% of coastal Natives already killed by disease before Pilgrims arrived",
                "Pilgrims settled in abandoned, plague-emptied villages",
                "Pequot Massacre (1637): colonists burned hundreds alive",
                "Modern holiday created in 1800s for nation-building",
                "First 'official' Thanksgiving celebrated the Pequot massacre"
            ],
            whobenefits: [
                "Sanitized settler colonial narrative",
                "Those avoiding discussion of genocide",
                "American unity mythology",
                "Consumer capitalism (holiday shopping)"
            ],
            furtherReading: [
                HistoryResource(title: "This Land Is Their Land", author: "David Silverman", type: .book, url: nil),
                HistoryResource(title: "Lies My Teacher Told Me", author: "James Loewen", type: .book, url: nil),
                HistoryResource(title: "National Day of Mourning", author: nil, type: .article, url: "https://www.uaine.org/")
            ],
            dragonComment: "They taught you about sharing corn. They left out the part where, 16 years later, colonists burned hundreds of people alive and called it 'Thanksgiving.' 🐉",
            impactLevel: 4
        ),
        
        // MARK: - 3. Founding Fathers
        HistoryTopic(
            title: "George Washington's Cherry Tree and Flawless Founders",
            era: .colonial,
            region: .americas,
            commonLie: "George Washington 'could not tell a lie' about chopping a cherry tree. The Founding Fathers were pure liberty-loving democrats who created the greatest democracy fighting tyranny for universal freedom.",
            thetruth: """
The cherry tree story was FABRICATED by biographer Mason Weems in 1806—years after Washington's death—to sell books and create moral lessons for children.

The Founders' actual record:
• Washington owned over 300 enslaved people
• Jefferson owned 600+ and raped Sally Hemings (she was 14-16 when it began; she was his wife's half-sister)
• Many profited from Indigenous displacement and land speculation
• The Constitution originally excluded women, non-landowners, and enslaved people from voting
• The 3/5 Compromise counted enslaved people for representation without giving them rights
• Many Founders explicitly feared democracy as 'mob rule'

They designed a system favoring elites—the Electoral College, the Senate, and property requirements were all intentional limits on popular power.
""",
            awakeningAngle: "Hero worship blinds us to systemic hypocrisy baked into American institutions. Understanding that the Founders were slave-owning elites who feared democracy helps explain ongoing struggles: voter suppression, the Electoral College, wealth inequality. We can't fix bugs we refuse to see in the source code.",
            keyFacts: [
                "Cherry tree story fabricated by biographer in 1806",
                "Washington owned 300+ enslaved people",
                "Jefferson owned 600+ and raped Sally Hemings (age 14-16)",
                "Only white male property owners could vote (~6% of population)",
                "3/5 Compromise counted slaves for power, not rights",
                "Founders explicitly designed limits on democracy"
            ],
            whobenefits: [
                "American exceptionalism narratives",
                "Those resisting constitutional reform",
                "Originalist legal interpretations",
                "Status quo power structures"
            ],
            furtherReading: [
                HistoryResource(title: "The Half Has Never Been Told", author: "Edward Baptist", type: .book, url: nil),
                HistoryResource(title: "Founding Myths", author: "Ray Raphael", type: .book, url: nil),
                HistoryResource(title: "Sally Hemings", author: nil, type: .wikipedia, url: "https://en.wikipedia.org/wiki/Sally_Hemings")
            ],
            dragonComment: "'Cannot tell a lie' was itself a lie. The man who wrote 'all men are created equal' enslaved 600 people. The cognitive dissonance is the point—it keeps you from asking questions. 🐉",
            impactLevel: 5
        ),
        
        // MARK: - 4. Empty Land
        HistoryTopic(
            title: "Native American Populations and 'Empty' Land",
            era: .colonial,
            region: .americas,
            commonLie: "North America was sparsely populated by primitive nomadic tribes before Europeans 'settled' it peacefully. The land was mostly empty wilderness waiting to be civilized.",
            thetruth: """
Pre-Columbian Americas had 50-100 MILLION people with cities rivaling Europe's most advanced.

Examples:
• CAHOKIA (near St. Louis): Population larger than London at the time, with massive earthen pyramids and urban planning
• TENOCHTITLAN (Aztec capital): 200,000+ people, larger than any European city
• Extensive trade networks spanning thousands of miles
• The Iroquois Confederacy directly influenced the U.S. Constitution's federal structure

The 'empty land' illusion: European diseases caused 90%+ population collapse BEFORE widespread settlement. When colonists arrived, they found recently-emptied landscapes and assumed they'd always been empty.

Survivors were then portrayed as 'primitive' to justify taking what remained.
""",
            awakeningAngle: "The 'empty land' myth fueled Manifest Destiny and continues to justify resource extraction, treaty violations, and dismissing Indigenous sovereignty today. Understanding that this was replacement, not settlement, shifts us toward environmental stewardship, honoring treaties, and recognizing that 'unclaimed' resources rarely are.",
            keyFacts: [
                "Pre-Columbian Americas: 50-100 million people",
                "Cahokia was larger than London at the time",
                "Tenochtitlan: 200,000+ (larger than any European city)",
                "90%+ died from disease BEFORE major colonization",
                "Iroquois Confederacy influenced U.S. Constitution",
                "The 'emptiness' was created by plague, then exploited"
            ],
            whobenefits: [
                "Manifest Destiny ideology",
                "Land speculators and developers",
                "Those denying treaty rights",
                "Resource extraction industries"
            ],
            furtherReading: [
                HistoryResource(title: "1491: New Revelations of the Americas Before Columbus", author: "Charles C. Mann", type: .book, url: nil),
                HistoryResource(title: "An Indigenous Peoples' History of the United States", author: "Roxanne Dunbar-Ortiz", type: .book, url: nil),
                HistoryResource(title: "Cahokia", author: nil, type: .wikipedia, url: "https://en.wikipedia.org/wiki/Cahokia")
            ],
            dragonComment: "They didn't find empty land—they found land emptied by plague. The crime scene became the real estate listing. 🐉",
            impactLevel: 5
        ),
        
        // MARK: - 5. American Revolution
        HistoryTopic(
            title: "The American Revolution as Pure Freedom Fight",
            era: .colonial,
            region: .americas,
            commonLie: "The American Revolution was a unified uprising of freedom-loving colonists against British tyranny, fighting for universal liberty, equality, and democratic self-governance.",
            thetruth: """
The revolution was far more complicated:

• ONE-THIRD of colonists were LOYALISTS (supported Britain)
• ONE-THIRD were neutral/apathetic  
• Only ONE-THIRD actively supported revolution

Economic motivations:
• Elite tax avoidance (colonists were among the least taxed in the British Empire)
• Land speculation (British restrictions on westward expansion threatened fortunes)
• Smugglers avoiding customs enforcement

Who was excluded:
• Enslaved Africans: Many fought FOR BRITAIN because Britain promised freedom
• Native Americans: Most allied with Britain because colonists were taking their land
• Women: No voting rights gained
• Non-property owners: Still couldn't vote

The revolution replaced British elites with American elites. Post-war inequality persisted.
""",
            awakeningAngle: "Glorifying revolution as pure idealism hides the economic drivers and exclusions. This lens helps us spot similar patterns today: who benefits from 'freedom' rhetoric? Which 'revolutions' serve elites vs. the people? True liberation requires examining who's funding the movement.",
            keyFacts: [
                "Only ~1/3 of colonists supported revolution",
                "Colonists were among least taxed in British Empire",
                "Many enslaved people fought FOR Britain (freedom promised)",
                "Most Native nations allied with Britain",
                "Land speculation was major economic driver",
                "Women and non-property owners still couldn't vote after"
            ],
            whobenefits: [
                "American exceptionalism narratives",
                "Elite-led 'populist' movements",
                "Those avoiding economic analysis",
                "Nationalist mythology"
            ],
            furtherReading: [
                HistoryResource(title: "The Radicalism of the American Revolution", author: "Gordon Wood", type: .book, url: nil),
                HistoryResource(title: "Slave Nation", author: "Alfred & Ruth Blumrosen", type: .book, url: nil),
                HistoryResource(title: "Black Loyalists", author: nil, type: .wikipedia, url: "https://en.wikipedia.org/wiki/Black_Loyalist")
            ],
            dragonComment: "One-third for, one-third against, one-third didn't care. The 'unified uprising' was elite marketing. Many slaves fought for Britain because Britain promised freedom. Let that sink in. 🐉",
            impactLevel: 4
        ),
        
        // MARK: - 6. Salem Witch Trials
        HistoryTopic(
            title: "Witches Burned at the Stake in Salem",
            era: .colonial,
            region: .americas,
            commonLie: "The 1692 Salem Witch Trials involved burning witches at the stake amid mass supernatural hysteria. Thousands were executed as Puritans went mad with fear of the devil.",
            thetruth: """
Key corrections:

NO ONE WAS BURNED at Salem. Zero. This is 100% false.
• 19 people were HANGED
• 1 man (Giles Corey) was pressed to death with stones for refusing to enter a plea
• Several died in prison
• About 20 deaths total—not thousands

The real causes were NOT supernatural hysteria:
• Property disputes: Many accusers stood to gain land from the accused
• Gender politics: Most accused were women who didn't fit social norms
• Political factions: Accusations followed existing grudges and rivalries
• Economic anxiety: Frontier conflict and political instability created tension

The 'witch burning' image comes from EUROPEAN witch trials (where burning did occur), not American ones. The conflation makes Salem seem more dramatic while obscuring the social dynamics.
""",
            awakeningAngle: "The witch-burning myth makes Salem about irrational superstition rather than social control. Understanding the real dynamics—property, gender, political factions—helps us recognize 'witch hunts' today: moral panics that target vulnerable people while serving economic or political interests. Cancel culture, satanic panic, red scares—same playbook.",
            keyFacts: [
                "ZERO people burned at Salem—completely false",
                "19 hanged, 1 pressed to death, ~5 died in prison",
                "Property disputes drove many accusations",
                "Most accused were women outside social norms",
                "Political factions weaponized accusations",
                "'Witch burning' image from European trials, not American"
            ],
            whobenefits: [
                "Those avoiding economic/political analysis",
                "Narratives of 'irrational masses'",
                "Sensationalist history",
                "Those who benefit from moral panics"
            ],
            furtherReading: [
                HistoryResource(title: "A Delusion of Satan", author: "Frances Hill", type: .book, url: nil),
                HistoryResource(title: "In the Devil's Snare", author: "Mary Beth Norton", type: .book, url: nil),
                HistoryResource(title: "Salem witch trials", author: nil, type: .wikipedia, url: "https://en.wikipedia.org/wiki/Salem_witch_trials")
            ],
            dragonComment: "No one was burned. The witch burning you picture never happened in Salem. But property was seized and rivals eliminated. The real magic was turning grudges into executions. 🐉",
            impactLevel: 3
        ),
        
        // MARK: - 7. Napoleon's Height
        HistoryTopic(
            title: "Napoleon Bonaparte as a Short Tyrant",
            era: .modern,
            region: .europe,
            commonLie: "Napoleon was comically short (5'2\" or less)—a tiny man with a 'Napoleon complex' compensating for his height with power-mad conquest.",
            thetruth: """
Napoleon was 5'7" (170 cm)—AVERAGE or slightly above average height for his era.

The confusion came from:
• French inches vs. English inches (French inches were longer)
• His nickname 'le petit caporal' ('the little corporal') was AFFECTIONATE—it meant he was one of the common soldiers
• British propaganda deliberately exaggerated his shortness
• He was often surrounded by his tall Imperial Guard, making him look smaller by comparison

His actual legacy (often ignored):
• Napoleonic Code: Foundation of civil law in 70+ countries today
• Metric system: Standardized measurements globally
• Public education systems
• Religious tolerance (emancipated Jews in territories he controlled)
• Merit-based advancement (vs. aristocratic birth)

He was a military genius who rose from minor nobility to rule most of Europe. British propagandists needed to diminish him somehow.
""",
            awakeningAngle: "This shows how enemy propaganda becomes 'common knowledge.' Body-shaming as character assassination has ancient roots and continues today. It also distracts from actual critiques (his authoritarianism, wars) with easy mockery. Question the 'obvious facts' everyone knows—they're often propaganda that aged into trivia.",
            keyFacts: [
                "Napoleon was 5'7\"—average height for his era",
                "French inches were longer than English inches",
                "'Le petit caporal' was affectionate, not about height",
                "British propaganda spread the 'short' myth",
                "Napoleonic Code influences law in 70+ countries",
                "He introduced merit-based advancement"
            ],
            whobenefits: [
                "British propaganda (historical)",
                "Body-shaming as character attack",
                "Avoiding substantive critique",
                "Armchair psychology"
            ],
            furtherReading: [
                HistoryResource(title: "Napoleon: A Life", author: "Andrew Roberts", type: .book, url: nil),
                HistoryResource(title: "Height of Napoleon", author: nil, type: .wikipedia, url: "https://en.wikipedia.org/wiki/Napoleon#Height")
            ],
            dragonComment: "5'7\" was average. The 'short tyrant' thing was British propaganda that outlived the British Empire. Enemy memes age into common knowledge. 🐉",
            impactLevel: 2
        ),
        
        // MARK: - 8. Africa Before Colonialism
        HistoryTopic(
            title: "Ancient Africa as 'Primitive' Before Colonialism",
            era: .medieval,
            region: .africa,
            commonLie: "Africa was a continent of isolated primitive tribes without empires, writing, or advancements until Europeans 'civilized' it. It had no significant history worth studying.",
            thetruth: """
Africa had some of the world's most advanced civilizations:

MALI EMPIRE (1235-1600):
• Mansa Musa was possibly the RICHEST PERSON IN HISTORY (inflation-adjusted)
• His 1324 pilgrimage to Mecca crashed gold economies across the Mediterranean
• Timbuktu had universities and libraries before Oxford existed

GREAT ZIMBABWE:
• Massive stone structures built without mortar
• Center of gold and ivory trade networks spanning continents
• Colonial Europeans couldn't believe Africans built it—invented myths of 'lost white civilizations'

ETHIOPIA:
• Never fully colonized
• Had written language (Ge'ez) for 2000+ years
• Ancient Christian kingdom (adopted 4th century, before most of Europe)

Also: Benin bronzes (art rivaling Renaissance masters), Kingdom of Kongo, Axum, Songhai...

Colonialism DISRUPTED these civilizations, not elevated them.
""",
            awakeningAngle: "This myth justified colonialism and continues to shape aid narratives, investment decisions, and geopolitical dismissal. 'Africa needs our help' assumes a baseline of incompetence that history disproves. Understanding African innovation fosters genuine partnership over patronizing 'development.'",
            keyFacts: [
                "Mansa Musa: possibly richest person in history",
                "Timbuktu had universities before Oxford",
                "Great Zimbabwe: advanced architecture Europeans refused to credit",
                "Ethiopia: 2000+ years of writing, never fully colonized",
                "Benin bronzes rival Renaissance art",
                "Colonialism disrupted advancement, didn't enable it"
            ],
            whobenefits: [
                "Colonial justification narratives",
                "Western 'savior' complexes",
                "Aid-industrial complex",
                "Resource extraction narratives"
            ],
            furtherReading: [
                HistoryResource(title: "The Fortunes of Africa", author: "Martin Meredith", type: .book, url: nil),
                HistoryResource(title: "How Europe Underdeveloped Africa", author: "Walter Rodney", type: .book, url: nil),
                HistoryResource(title: "Mansa Musa", author: nil, type: .wikipedia, url: "https://en.wikipedia.org/wiki/Mansa_Musa")
            ],
            dragonComment: "The richest person in history was African. Timbuktu was a university city while Europe was in the 'Dark Ages.' The 'primitive continent' narrative was the primitive thinking. 🐉",
            impactLevel: 5
        ),
        
        // MARK: - 9. Einstein Failed Math
        HistoryTopic(
            title: "Albert Einstein Failing Math",
            era: .modern,
            region: .europe,
            commonLie: "Albert Einstein was a poor student who flunked math, proving that genius blooms late and academic failure doesn't matter. He only became brilliant later in life.",
            thetruth: """
Einstein was EXCELLENT at math and physics from childhood.

The origin of the myth:
• Swiss grading system: 6 was the HIGHEST, 1 was lowest
• German grading system: 1 was highest, 6 was lowest
• When people saw his Swiss transcript showing '6' in math, they assumed he failed
• He actually got the HIGHEST POSSIBLE GRADE

His actual record:
• Age 12: self-taught Euclidean geometry over summer vacation
• Age 15: mastered calculus
• Age 16: wrote his first scientific paper
• Skipped grades in school
• Published special relativity at age 26

He DID rebel against rote learning and had conflicts with authoritarian teachers—but he was bored, not struggling.
""",
            awakeningAngle: "This myth gets weaponized two ways: 1) Discouraging early effort ('Einstein failed, so I don't need to try'), and 2) Dismissing expertise ('Experts said Einstein was dumb!'). Understanding the grading system mix-up helps us question 'inspirational' stories that seem too convenient.",
            keyFacts: [
                "Einstein got the HIGHEST grade (6) in Swiss system",
                "German grading is reversed—people misread his transcript",
                "Self-taught Euclidean geometry at age 12",
                "Mastered calculus at age 15",
                "Published special relativity at age 26",
                "His conflicts were about authority, not ability"
            ],
            whobenefits: [
                "Those avoiding early effort",
                "Anti-expert/anti-intellectual narratives",
                "Feel-good 'late bloomer' mythology",
                "Misunderstanding of genius"
            ],
            furtherReading: [
                HistoryResource(title: "Einstein: His Life and Universe", author: "Walter Isaacson", type: .book, url: nil),
                HistoryResource(title: "Einstein's education", author: nil, type: .wikipedia, url: "https://en.wikipedia.org/wiki/Albert_Einstein#Early_life_and_education")
            ],
            dragonComment: "He got the highest possible grade. Someone misread the Swiss grading system, and now generations think failure leads to genius. It doesn't. He was brilliant the whole time. 🐉",
            impactLevel: 2
        ),
        
        // MARK: - 10. Dark Ages
        HistoryTopic(
            title: "The 'Dark Ages' as Total Intellectual Stagnation",
            era: .medieval,
            region: .global,
            commonLie: "After Rome fell (476 CE), Europe entered 500-1000 years of darkness, ignorance, and barbarism. Nothing was invented, everyone was stupid, and the Church suppressed all knowledge until the Renaissance.",
            thetruth: """
'Dark Ages' is a term historians have largely ABANDONED because it's misleading.

Medieval European innovations:
• Universities founded (Bologna 1088, Oxford 1096, Paris 1150)
• Gothic cathedrals (engineering marvels still standing)
• Heavy plow, horse collar, crop rotation (agricultural revolution)
• Mechanical clocks, eyeglasses, printing press (late medieval)

What was ACTUALLY happening globally:
• ISLAMIC GOLDEN AGE (750-1258): Preserved and ADVANCED Greek knowledge, developed algebra, astronomy, medicine, optics
• BYZANTINE EMPIRE: Continued Roman civilization in the East
• CHINESE SONG DYNASTY: Printing, gunpowder, compass, paper money
• AFRICAN EMPIRES: Mali, Ghana, Ethiopia all thriving

The Renaissance 'rediscovery' was largely Islamic scholars RETURNING Greek texts they'd preserved and improved.

The 'darkness' referred to loss of classical texts in Western Europe specifically—but knowledge thrived elsewhere.
""",
            awakeningAngle: "The Dark Ages myth centers Europe as the only civilization that matters and ignores that knowledge was thriving elsewhere. It also dismisses medieval achievements and creates a false narrative of 'rebirth from nothing.' Understanding global continuity helps us see that innovation is always happening somewhere.",
            keyFacts: [
                "Historians have largely abandoned 'Dark Ages' term",
                "Universities founded: Bologna (1088), Oxford (1096)",
                "Islamic Golden Age preserved and ADVANCED Greek knowledge",
                "Agricultural revolution: heavy plow, crop rotation",
                "Byzantine, Islamic, Chinese, African civilizations thrived",
                "Renaissance 'rediscovered' texts via Islamic scholars"
            ],
            whobenefits: [
                "Eurocentric historical narratives",
                "Oversimplified Church criticism",
                "Renaissance exceptionalism",
                "Those ignoring Islamic/Eastern contributions"
            ],
            furtherReading: [
                HistoryResource(title: "The Light Ages", author: "Seb Falk", type: .book, url: nil),
                HistoryResource(title: "Aristotle's Children", author: "Richard Rubenstein", type: .book, url: nil),
                HistoryResource(title: "Islamic Golden Age", author: nil, type: .wikipedia, url: "https://en.wikipedia.org/wiki/Islamic_Golden_Age")
            ],
            dragonComment: "While Europe was 'dark,' Baghdad had universities and libraries. The knowledge didn't disappear—it moved East. Then Islamic scholars brought it back. 'Western civilization' was an import. 🐉",
            impactLevel: 4
        )
    ]
}

// MARK: - Main View

struct HistoryDebuggedView: View {
    @State private var selectedEra: HistoricalEra?
    @State private var selectedRegion: HistoricalRegion?
    @State private var searchText = ""
    @State private var showingTopicDetail: HistoryTopic?
    @State private var showIntro = true
    
    private var filteredTopics: [HistoryTopic] {
        HistoryDebuggedDatabase.allTopics.filter { topic in
            let matchesEra = selectedEra == nil || topic.era == selectedEra
            let matchesRegion = selectedRegion == nil || topic.region == selectedRegion
            let matchesSearch = searchText.isEmpty ||
                topic.title.localizedCaseInsensitiveContains(searchText) ||
                topic.commonLie.localizedCaseInsensitiveContains(searchText)
            return matchesEra && matchesRegion && matchesSearch
        }
    }
    
    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                // Header
                headerSection
                
                // Stats
                statsSection
                
                // Introduction
                if showIntro {
                    introSection
                }
                
                // Search
                searchBar
                
                // Era Filter
                eraFilter
                
                // Region Filter
                regionFilter
                
                // Topics
                topicsSection
            }
            .padding()
        }
        .background(Color.black.ignoresSafeArea())
        .navigationTitle("History Debugged")
        .navigationBarTitleDisplayMode(.inline)
        .sheet(item: $showingTopicDetail) { topic in
            HistoryTopicDetailView(topic: topic)
        }
    }
    
    // MARK: - Header
    
    private var headerSection: some View {
        VStack(spacing: 12) {
            ZStack {
                Circle()
                    .fill(Color.orange.opacity(0.3))
                    .frame(width: 100, height: 100)
                    .blur(radius: 20)
                
                Circle()
                    .fill(
                        LinearGradient(
                            colors: [.orange, .red, .yellow],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
                    .frame(width: 80, height: 80)
                
                Image(systemName: "book.closed.fill")
                    .font(.system(size: 36))
                    .foregroundColor(.white)
            }
            
            Text("HISTORY DEBUGGED")
                .font(.system(size: 20, weight: .black))
                .foregroundColor(.white)
            
            Text("The OS Upgrade for Your Worldview")
                .font(.system(size: 12))
                .foregroundColor(.gray)
            
            Text("\"If history is buggy with lies, we're all glitching. Let's debug.\"")
                .font(.system(size: 10))
                .foregroundColor(.orange)
                .italic()
        }
    }
    
    // MARK: - Stats
    
    private var statsSection: some View {
        HStack(spacing: 20) {
            statBox("\(HistoryDebuggedDatabase.allTopics.count)", "Topics", .orange)
            statBox("\(HistoricalEra.allCases.count - 1)", "Eras", .purple)
            statBox("\(HistoricalRegion.allCases.count)", "Regions", .blue)
        }
        .padding()
        .background(Color.white.opacity(0.05))
        .cornerRadius(16)
    }
    
    private func statBox(_ value: String, _ label: String, _ color: Color) -> some View {
        VStack(spacing: 4) {
            Text(value)
                .font(.system(size: 20, weight: .bold))
                .foregroundColor(color)
            Text(label)
                .font(.system(size: 10))
                .foregroundColor(.gray)
        }
        .frame(maxWidth: .infinity)
    }
    
    // MARK: - Introduction
    
    private var introSection: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Image(systemName: "info.circle.fill")
                    .foregroundColor(.blue)
                Text("ABOUT THIS MODULE")
                    .font(.system(size: 10, weight: .bold))
                    .foregroundColor(.blue)
                Spacer()
                Button(action: { withAnimation { showIntro = false } }) {
                    Image(systemName: "xmark.circle.fill")
                        .foregroundColor(.gray)
                }
            }
            
            Text(HistoryDebuggedDatabase.introduction)
                .font(.system(size: 11))
                .foregroundColor(.white.opacity(0.9))
        }
        .padding()
        .background(Color.blue.opacity(0.1))
        .cornerRadius(12)
    }
    
    // MARK: - Search
    
    private var searchBar: some View {
        HStack(spacing: 10) {
            Image(systemName: "magnifyingglass")
                .foregroundColor(.gray)
            TextField("Search topics...", text: $searchText)
                .foregroundColor(.white)
        }
        .padding(12)
        .background(Color.white.opacity(0.1))
        .cornerRadius(12)
    }
    
    // MARK: - Filters
    
    private var eraFilter: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("ERA")
                .font(.system(size: 10, weight: .bold))
                .foregroundColor(.gray)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 8) {
                    eraPill(nil, "All")
                    ForEach(HistoricalEra.allCases.filter { $0 != .allEras }, id: \.self) { era in
                        eraPill(era, era.rawValue)
                    }
                }
            }
        }
    }
    
    private func eraPill(_ era: HistoricalEra?, _ title: String) -> some View {
        Button(action: { selectedEra = era }) {
            HStack(spacing: 4) {
                if let e = era {
                    Image(systemName: e.icon)
                        .font(.system(size: 10))
                }
                Text(title)
                    .font(.system(size: 10, weight: .semibold))
            }
            .foregroundColor(selectedEra == era ? .white : .gray)
            .padding(.horizontal, 10)
            .padding(.vertical, 6)
            .background(selectedEra == era ? (era?.color ?? .white) : Color.white.opacity(0.1))
            .cornerRadius(16)
        }
    }
    
    private var regionFilter: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("REGION")
                .font(.system(size: 10, weight: .bold))
                .foregroundColor(.gray)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 8) {
                    regionPill(nil, "All")
                    ForEach(HistoricalRegion.allCases, id: \.self) { region in
                        regionPill(region, region.rawValue)
                    }
                }
            }
        }
    }
    
    private func regionPill(_ region: HistoricalRegion?, _ title: String) -> some View {
        Button(action: { selectedRegion = region }) {
            HStack(spacing: 4) {
                if let r = region {
                    Image(systemName: r.icon)
                        .font(.system(size: 10))
                }
                Text(title)
                    .font(.system(size: 10, weight: .semibold))
            }
            .foregroundColor(selectedRegion == region ? .white : .gray)
            .padding(.horizontal, 10)
            .padding(.vertical, 6)
            .background(selectedRegion == region ? Color.blue : Color.white.opacity(0.1))
            .cornerRadius(16)
        }
    }
    
    // MARK: - Topics Section
    
    private var topicsSection: some View {
        VStack(spacing: 12) {
            ForEach(filteredTopics) { topic in
                topicCard(topic)
            }
        }
    }
    
    private func topicCard(_ topic: HistoryTopic) -> some View {
        Button(action: { showingTopicDetail = topic }) {
            VStack(alignment: .leading, spacing: 10) {
                HStack(alignment: .top) {
                    ZStack {
                        Circle()
                            .fill(topic.era.color.opacity(0.3))
                            .frame(width: 40, height: 40)
                        Image(systemName: topic.era.icon)
                            .foregroundColor(topic.era.color)
                    }
                    
                    VStack(alignment: .leading, spacing: 4) {
                        Text(topic.title)
                            .font(.system(size: 14, weight: .bold))
                            .foregroundColor(.white)
                            .multilineTextAlignment(.leading)
                        
                        HStack(spacing: 8) {
                            Label(topic.era.rawValue, systemImage: topic.era.icon)
                                .font(.system(size: 9))
                                .foregroundColor(topic.era.color)
                            
                            Label(topic.region.rawValue, systemImage: topic.region.icon)
                                .font(.system(size: 9))
                                .foregroundColor(.gray)
                        }
                        
                        // Impact level
                        HStack(spacing: 2) {
                            ForEach(0..<5) { i in
                                Circle()
                                    .fill(i < topic.impactLevel ? Color.red : Color.white.opacity(0.2))
                                    .frame(width: 6, height: 6)
                            }
                            Text("Modern Impact")
                                .font(.system(size: 8))
                                .foregroundColor(.gray)
                        }
                    }
                    
                    Spacer()
                    
                    Image(systemName: "chevron.right")
                        .foregroundColor(.gray)
                        .font(.system(size: 12))
                }
                
                // Preview of the lie
                Text("THE LIE: \(topic.commonLie.prefix(80))...")
                    .font(.system(size: 10))
                    .foregroundColor(.red.opacity(0.8))
                    .lineLimit(2)
            }
            .padding()
            .background(topic.era.color.opacity(0.1))
            .cornerRadius(12)
        }
    }
}

// MARK: - Topic Detail View

struct HistoryTopicDetailView: View {
    let topic: HistoryTopic
    @Environment(\.dismiss) private var dismiss
    @Environment(\.openURL) private var openURL
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    // Header
                    VStack(spacing: 12) {
                        ZStack {
                            Circle()
                                .fill(topic.era.color.opacity(0.3))
                                .frame(width: 70, height: 70)
                            Image(systemName: topic.era.icon)
                                .font(.system(size: 30))
                                .foregroundColor(topic.era.color)
                        }
                        
                        Text(topic.title)
                            .font(.system(size: 18, weight: .bold))
                            .foregroundColor(.white)
                            .multilineTextAlignment(.center)
                        
                        HStack(spacing: 16) {
                            Label(topic.era.rawValue, systemImage: topic.era.icon)
                                .font(.system(size: 11))
                                .foregroundColor(topic.era.color)
                            
                            Label(topic.region.rawValue, systemImage: topic.region.icon)
                                .font(.system(size: 11))
                                .foregroundColor(.gray)
                        }
                        
                        HStack(spacing: 4) {
                            Text("Modern Impact:")
                                .font(.system(size: 10))
                                .foregroundColor(.gray)
                            ForEach(0..<5) { i in
                                Circle()
                                    .fill(i < topic.impactLevel ? Color.red : Color.white.opacity(0.2))
                                    .frame(width: 8, height: 8)
                            }
                        }
                    }
                    .frame(maxWidth: .infinity)
                    
                    // The Lie
                    sectionCard(
                        title: "THE LIE (What You Were Taught)",
                        icon: "xmark.circle.fill",
                        color: .red,
                        content: topic.commonLie,
                        isItalic: true
                    )
                    
                    // The Truth
                    sectionCard(
                        title: "THE TRUTH (What Actually Happened)",
                        icon: "checkmark.circle.fill",
                        color: .green,
                        content: topic.thetruth,
                        isItalic: false
                    )
                    
                    // Key Facts
                    VStack(alignment: .leading, spacing: 8) {
                        HStack {
                            Image(systemName: "list.bullet.circle.fill")
                                .foregroundColor(.cyan)
                            Text("KEY FACTS")
                                .font(.system(size: 10, weight: .bold))
                                .foregroundColor(.cyan)
                        }
                        
                        ForEach(topic.keyFacts, id: \.self) { fact in
                            HStack(alignment: .top, spacing: 8) {
                                Image(systemName: "checkmark")
                                    .font(.system(size: 10))
                                    .foregroundColor(.cyan)
                                    .padding(.top, 2)
                                Text(fact)
                                    .font(.system(size: 11))
                                    .foregroundColor(.white)
                            }
                        }
                    }
                    .padding()
                    .background(Color.cyan.opacity(0.1))
                    .cornerRadius(12)
                    
                    // Who Benefits
                    VStack(alignment: .leading, spacing: 8) {
                        HStack {
                            Image(systemName: "dollarsign.circle.fill")
                                .foregroundColor(.yellow)
                            Text("WHO BENEFITS FROM THE LIE?")
                                .font(.system(size: 10, weight: .bold))
                                .foregroundColor(.yellow)
                        }
                        
                        ForEach(topic.whobenefits, id: \.self) { beneficiary in
                            HStack(alignment: .top, spacing: 8) {
                                Image(systemName: "arrow.right")
                                    .font(.system(size: 10))
                                    .foregroundColor(.yellow)
                                Text(beneficiary)
                                    .font(.system(size: 11))
                                    .foregroundColor(.white)
                            }
                        }
                    }
                    .padding()
                    .background(Color.yellow.opacity(0.1))
                    .cornerRadius(12)
                    
                    // Awakening Angle
                    sectionCard(
                        title: "THE AWAKENING (Why This Matters Now)",
                        icon: "lightbulb.fill",
                        color: .purple,
                        content: topic.awakeningAngle,
                        isItalic: false
                    )
                    
                    // Dragon Comment
                    VStack(alignment: .leading, spacing: 8) {
                        HStack {
                            Text("🐉")
                            Text("DRAGON SAYS")
                                .font(.system(size: 10, weight: .bold))
                                .foregroundColor(.orange)
                        }
                        
                        Text(topic.dragonComment)
                            .font(.system(size: 13))
                            .foregroundColor(.white)
                            .italic()
                    }
                    .padding()
                    .background(Color.orange.opacity(0.15))
                    .cornerRadius(12)
                    
                    // Further Reading
                    if !topic.furtherReading.isEmpty {
                        VStack(alignment: .leading, spacing: 8) {
                            HStack {
                                Image(systemName: "book.fill")
                                    .foregroundColor(.blue)
                                Text("FURTHER READING")
                                    .font(.system(size: 10, weight: .bold))
                                    .foregroundColor(.blue)
                            }
                            
                            ForEach(topic.furtherReading) { resource in
                                HStack {
                                    VStack(alignment: .leading, spacing: 2) {
                                        Text(resource.title)
                                            .font(.system(size: 12, weight: .semibold))
                                            .foregroundColor(.white)
                                        if let author = resource.author {
                                            Text("by \(author)")
                                                .font(.system(size: 10))
                                                .foregroundColor(.gray)
                                        }
                                    }
                                    
                                    Spacer()
                                    
                                    Text(resource.type.rawValue)
                                        .font(.system(size: 9))
                                        .foregroundColor(.blue)
                                        .padding(.horizontal, 6)
                                        .padding(.vertical, 2)
                                        .background(Color.blue.opacity(0.2))
                                        .cornerRadius(4)
                                    
                                    if let urlString = resource.url, let url = URL(string: urlString) {
                                        Button(action: { openURL(url) }) {
                                            Image(systemName: "arrow.up.right")
                                                .font(.system(size: 10))
                                                .foregroundColor(.blue)
                                        }
                                    }
                                }
                                .padding(.vertical, 4)
                            }
                        }
                        .padding()
                        .background(Color.blue.opacity(0.1))
                        .cornerRadius(12)
                    }
                }
                .padding()
            }
            .background(Color.black.ignoresSafeArea())
            .navigationTitle("Topic Details")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Done") { dismiss() }
                }
            }
        }
    }
    
    private func sectionCard(title: String, icon: String, color: Color, content: String, isItalic: Bool) -> some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Image(systemName: icon)
                    .foregroundColor(color)
                Text(title)
                    .font(.system(size: 10, weight: .bold))
                    .foregroundColor(color)
            }
            
            if isItalic {
                Text(content)
                    .font(.system(size: 12))
                    .foregroundColor(.white)
                    .italic()
            } else {
                Text(content)
                    .font(.system(size: 12))
                    .foregroundColor(.white)
            }
        }
        .padding()
        .background(color.opacity(0.15))
        .cornerRadius(12)
    }
}

#Preview {
    NavigationStack {
        HistoryDebuggedView()
    }
}
