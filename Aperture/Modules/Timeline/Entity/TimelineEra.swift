// TimelineEra.swift

import Foundation
import SwiftUI

struct TimelineEra: Identifiable {
    let id = UUID()
    let year: Int
    let yearDisplay: String
    let title: String
    let subtitle: String
    let description: String
    let institutionalRot: [InstitutionalControl]
    let icon: String
    let gradient: [Color]
    let category: EraCategory
    let isRevealed: Bool
    let region: String?
    let dragonComment: String
}

// MARK: - Institutional Control Mechanism

struct InstitutionalControl: Identifiable {
    let id = UUID()
    let institution: ControlInstitution
    let mechanism: String
    let truth: String
}

enum ControlInstitution: String {
    case education = "🎓 Education"
    case media = "📺 Media"
    case finance = "💰 Finance"
    case religion = "⛪ Religion"
    case medicine = "💊 Medicine"
    case government = "🏛️ Government"
    case science = "🔬 Science"
    case food = "🍔 Food"
    case technology = "📱 Technology"
    case military = "⚔️ Military"
    
    var color: Color {
        switch self {
        case .education: return Palette.primary.blue
        case .media: return Palette.primary.violet
        case .finance: return Palette.accent.gold
        case .religion: return Palette.primary.red
        case .medicine: return Palette.primary.cyan
        case .government: return Palette.primary.orange
        case .science: return Palette.primary.cyan
        case .food: return Palette.primary.orange
        case .technology: return Palette.primary.blue
        case .military: return Palette.primary.red
        }
    }
}

enum EraCategory: String, CaseIterable {
    case modern = "Modern Control"
    case twentieth = "20th Century"
    case industrial = "Industrial Age"
    case colonial = "Colonial Era"
    case religiousSuppression = "Religious Suppression"
    case sunGodErasure = "☀️ Sun God Erasure"
    case roman = "Roman Empire"
    case ancient = "Ancient Truth"
    case gnostic = "🔥 Gnostic Truth"
    case hiddenHistory = "🗿 Hidden History"
    case governmentDeception = "🏛️ Government Deception"
}

enum TimelineJumpInterval: String, CaseIterable {
    case decade = "decade"
    case halfCentury = "halfCentury"
    case century = "century"
    case millennia = "millennia"
    
    var label: String {
        switch self {
        case .decade: return "Decade"
        case .halfCentury: return "Half Century"
        case .century: return "Century"
        case .millennia: return "Millennia"
        }
    }
    
    var years: Int {
        switch self {
        case .decade: return 10
        case .halfCentury: return 50
        case .century: return 100
        case .millennia: return 1000
        }
    }
    
    var description: String {
        switch self {
        case .decade: return "See every major deception, decade by decade"
        case .halfCentury: return "Watch control systems evolve every 50 years"
        case .century: return "Witness the grand pattern across centuries"
        case .millennia: return "See the cosmic scale of the deception"
        }
    }
}

// MARK: - Timeline Data

extension TimelineEra {
    
    static let comprehensiveTimeline: [TimelineEra] = [
        
        // ═══════════════════════════════════════════════════════════════
        // 2020s - THE GREAT REVEALING
        // ═══════════════════════════════════════════════════════════════
        
        TimelineEra(
            year: 2024,
            yearDisplay: "NOW",
            title: "The Great Awakening",
            subtitle: "The veil is thinning",
            description: "More humans questioning narratives than ever. Pattern recognition spreading faster than censorship can suppress.",
            institutionalRot: [
                InstitutionalControl(institution: .technology, mechanism: "AI censorship, shadow banning, algorithmic suppression", truth: "They're terrified of people comparing notes"),
                InstitutionalControl(institution: .media, mechanism: "Trust at all-time lows", truth: "People finding alternative sources faster than shutdown")
            ],
            icon: "sun.max.fill",
            gradient: [Palette.accent.gold, Palette.primary.cyan],
            category: .modern,
            isRevealed: true,
            region: nil,
            dragonComment: "You found me, seeker. The sun rises again in human consciousness."
        ),
        
        TimelineEra(
            year: 2020,
            yearDisplay: "2020",
            title: "Global Lockdown",
            subtitle: "The great reset attempt",
            description: "Unprecedented coordination revealed the infrastructure of control. What took decades to build deployed in weeks.",
            institutionalRot: [
                InstitutionalControl(institution: .government, mechanism: "Emergency powers bypassing constitutions. 'Two weeks' became years.", truth: "They showed how quickly freedom can be revoked"),
                InstitutionalControl(institution: .media, mechanism: "Unified messaging everywhere. Dissenting doctors censored.", truth: "Science requires questioning. They demanded obedience."),
                InstitutionalControl(institution: .medicine, mechanism: "Alternative treatments suppressed. Only patented solutions.", truth: "Health became compliance."),
                InstitutionalControl(institution: .technology, mechanism: "Contact tracing. Digital ID infrastructure built.", truth: "Surveillance used health as trojan horse"),
                InstitutionalControl(institution: .finance, mechanism: "$4.5 trillion to billionaires. Small businesses destroyed.", truth: "Never about a virus. About consolidation.")
            ],
            icon: "lock.fill",
            gradient: [Palette.primary.red, Palette.primary.violet],
            category: .modern,
            isRevealed: false,
            region: nil,
            dragonComment: "They overplayed their hand. Millions woke up seeing the coordination."
        ),
        
        TimelineEra(
            year: 2010,
            yearDisplay: "2010s",
            title: "Social Media Capture",
            subtitle: "Attention harvesting",
            description: "The promise of connection becomes isolation. Your attention, emotions, and data become products.",
            institutionalRot: [
                InstitutionalControl(institution: .technology, mechanism: "Dopamine manipulation. Infinite scroll. Notification addiction.", truth: "You're not the customer. You're the product."),
                InstitutionalControl(institution: .finance, mechanism: "Surveillance capitalism monetizes your thoughts", truth: "Every 'free' service costs your privacy"),
                InstitutionalControl(institution: .media, mechanism: "News becomes engagement-optimized. Outrage drives clicks.", truth: "Algorithms programmed for profit, not truth")
            ],
            icon: "iphone.gen3",
            gradient: [Palette.primary.blue, Palette.primary.violet],
            category: .modern,
            isRevealed: false,
            region: nil,
            dragonComment: "They turned connection into isolation. Brilliant and evil."
        ),
        
        TimelineEra(
            year: 2001,
            yearDisplay: "2001",
            title: "9/11 & Patriot Act",
            subtitle: "Security theater begins",
            description: "Fear becomes permanent policy. Mass surveillance normalized. Endless wars against concepts.",
            institutionalRot: [
                InstitutionalControl(institution: .government, mechanism: "Patriot Act passed unread. Rights suspended indefinitely.", truth: "They had this legislation ready. Just needed an event."),
                InstitutionalControl(institution: .military, mechanism: "War on Terror = endless profit. $8 trillion spent.", truth: "Defense contractors wrote the policy."),
                InstitutionalControl(institution: .media, mechanism: "Questioning = unpatriotic. Dissent = terrorism.", truth: "Manufactured consent for two decades of war"),
                InstitutionalControl(institution: .technology, mechanism: "NSA bulk surveillance (Snowden 2013). They record everything.", truth: "4th Amendment died. No one prosecuted.")
            ],
            icon: "building.2.fill",
            gradient: [Palette.primary.red, Palette.primary.orange],
            category: .modern,
            isRevealed: false,
            region: nil,
            dragonComment: "Problem. Reaction. Solution. Create the crisis, offer the cage."
        ),
        
        TimelineEra(
            year: 1996,
            yearDisplay: "1996",
            title: "Last Magdalene Laundry Closes",
            subtitle: "250 years of Church slavery ends",
            description: "For over 250 years, the Catholic Church imprisoned 'fallen women' in Ireland. Forced labor. Mass graves. Babies sold to America.",
            institutionalRot: [
                InstitutionalControl(institution: .religion, mechanism: "30,000+ women imprisoned without trial. Unpaid labor. Physical abuse.", truth: "They preached salvation while running slave camps"),
                InstitutionalControl(institution: .government, mechanism: "State complicit. Police returned escapees. No oversight.", truth: "Church and State merged against women"),
                InstitutionalControl(institution: .media, mechanism: "Survivors silenced for decades. Stories dismissed.", truth: "The graves are still being found. Tuam: 796 children in a septic tank.")
            ],
            icon: "figure.dress.line.vertical.figure",
            gradient: [Palette.primary.red, Palette.primary.violet],
            category: .twentieth,
            isRevealed: false,
            region: "🇮🇪 Ireland",
            dragonComment: "They called them 'fallen women.' The only thing fallen was the institution that imprisoned them."
        ),
        
        TimelineEra(
            year: 1990,
            yearDisplay: "1990s",
            title: "Internet Emerges",
            subtitle: "Information briefly escapes",
            description: "For a moment, gatekeepers lose control. Information flows freely. The sun peeks through.",
            institutionalRot: [
                InstitutionalControl(institution: .technology, mechanism: "Initially decentralized. They scrambled to control it.", truth: "Internet was humanity's greatest awakening tool. Why they captured it."),
                InstitutionalControl(institution: .media, mechanism: "Alternative news explodes. Monopoly threatened.", truth: "People could finally compare notes across borders")
            ],
            icon: "network",
            gradient: [Palette.primary.cyan, Palette.accent.gold],
            category: .twentieth,
            isRevealed: true,
            region: nil,
            dragonComment: "This window let light through. Ancient knowledge resurfaced. They won't repeat this mistake."
        ),
        
        TimelineEra(
            year: 1980,
            yearDisplay: "1980s",
            title: "Reaganomics",
            subtitle: "Wealth extraction perfected",
            description: "Trickle-down mythology. Union busting. The middle class begins its planned demolition.",
            institutionalRot: [
                InstitutionalControl(institution: .finance, mechanism: "Tax cuts for wealthy. Wages stagnate. Debt normalized.", truth: "Wealth was always supposed to trickle UP"),
                InstitutionalControl(institution: .government, mechanism: "Deregulation = corporate capture.", truth: "You dismantled your own protections"),
                InstitutionalControl(institution: .media, mechanism: "24-hour news begins. News becomes entertainment.", truth: "Informed citizens → addicted viewers"),
                InstitutionalControl(institution: .education, mechanism: "Student loans explode. Education = debt trap.", truth: "Knowledge made expensive to keep you ignorant")
            ],
            icon: "chart.line.downtrend.xyaxis",
            gradient: [Palette.primary.orange, Palette.primary.red],
            category: .twentieth,
            isRevealed: false,
            region: nil,
            dragonComment: "Convinced middle class to vote for their own destruction. Masterful propaganda."
        ),
        
        TimelineEra(
            year: 1971,
            yearDisplay: "1971",
            title: "Gold Standard Ends",
            subtitle: "Money becomes illusion",
            description: "Nixon removes gold backing. The SUN metal no longer anchors currency. Money becomes faith.",
            institutionalRot: [
                InstitutionalControl(institution: .finance, mechanism: "Unlimited printing. Savings devalued. Inflation = hidden tax.", truth: "Dollar lost 98% value since 1971. Not accident - extraction."),
                InstitutionalControl(institution: .government, mechanism: "Deficit spending unlimited. Future pays for today's wars.", truth: "Print for bombs but not for people")
            ],
            icon: "banknote.fill",
            gradient: [Palette.primary.orange, Palette.primary.red],
            category: .twentieth,
            isRevealed: false,
            region: nil,
            dragonComment: "Gold - the sun metal - once backed labor. They severed that connection."
        ),
        
        TimelineEra(
            year: 1963,
            yearDisplay: "1963",
            title: "JFK Assassination",
            subtitle: "The warning to all leaders",
            description: "He warned of 'secret societies.' Wanted to splinter CIA. Threatened Federal Reserve.",
            institutionalRot: [
                InstitutionalControl(institution: .government, mechanism: "Warren Commission contradicts physics. Files sealed.", truth: "Threaten real power, die publicly as message"),
                InstitutionalControl(institution: .media, mechanism: "'Conspiracy theory' weaponized by CIA memo 1035-960", truth: "Created thought-terminating cliché to protect lie"),
                InstitutionalControl(institution: .finance, mechanism: "EO 11110 would return money to Treasury. Revoked after death.", truth: "Money control is real throne. Presidents disposable.")
            ],
            icon: "exclamationmark.triangle.fill",
            gradient: [Palette.primary.red, Palette.primary.violet],
            category: .twentieth,
            isRevealed: false,
            region: nil,
            dragonComment: "Every president since knows: cross money masters, join dead presidents."
        ),
        
        TimelineEra(
            year: 1950,
            yearDisplay: "1950s",
            title: "Television Age",
            subtitle: "Flickering altar in every home",
            description: "Most powerful programming tool enters living rooms. Families arranged around the glowing screen.",
            institutionalRot: [
                InstitutionalControl(institution: .media, mechanism: "3 networks control all information.", truth: "They didn't call it 'programming' by accident"),
                InstitutionalControl(institution: .education, mechanism: "Standardized testing expands. Creativity punished.", truth: "Schools became factories for obedient workers"),
                InstitutionalControl(institution: .food, mechanism: "Processed food explodes. Convenience over nutrition.", truth: "Sick people are profitable"),
                InstitutionalControl(institution: .medicine, mechanism: "Pharma consolidates. 'Better living through chemistry.'", truth: "Treat symptoms forever. Never cure.")
            ],
            icon: "tv.fill",
            gradient: [Palette.primary.blue, Palette.primary.violet],
            category: .twentieth,
            isRevealed: false,
            region: nil,
            dragonComment: "One box in every home, telling everyone the same story. Dream of tyrants."
        ),
        
        TimelineEra(
            year: 1947,
            yearDisplay: "1947",
            title: "CIA Created",
            subtitle: "Invisible government born",
            description: "National Security Act creates permanent shadow government with no accountability.",
            institutionalRot: [
                InstitutionalControl(institution: .government, mechanism: "Black budgets. Classified ops. Presidents on 'need to know.'", truth: "Elected officials don't run country. Permanent state does."),
                InstitutionalControl(institution: .military, mechanism: "Eisenhower warns of 'military-industrial complex.' Too late.", truth: "War is a racket. Always was."),
                InstitutionalControl(institution: .media, mechanism: "Operation Mockingbird. CIA recruits journalists.", truth: "News is what they allow you to know")
            ],
            icon: "eye.fill",
            gradient: [Palette.primary.blue, Palette.primary.violet],
            category: .twentieth,
            isRevealed: false,
            region: nil,
            dragonComment: "Unlimited budget, no oversight, license to kill. What could go wrong?"
        ),
        
        TimelineEra(
            year: 1945,
            yearDisplay: "1945",
            title: "Nag Hammadi Discovery",
            subtitle: "The buried gospels resurface",
            description: "In the Egyptian desert, a peasant finds a sealed jar containing 52 ancient texts — gospels, teachings, and wisdom writings hidden for 1,600 years since 367 AD when Bishop Athanasius ordered all 'non-canonical' books destroyed. These include Gospel of Thomas ('The kingdom is spread upon the earth and people do not see it'), Gospel of Philip ('You saw Christ, you became Christ'), and Thunder: Perfect Mind. The original teachings of gnosis — direct knowing — resurface after being buried by Nicaea.",
            institutionalRot: [],
            icon: "scroll.fill",
            gradient: [Palette.accent.gold, Palette.primary.cyan],
            category: .gnostic,
            isRevealed: true,
            region: "🇪🇬 Egypt",
            dragonComment: "They tried to burn the inner path. Monks sealed it in the desert. The truth cannot be permanently destroyed. It always resurfaces when humanity is ready."
        ),
        
        TimelineEra(
            year: 1913,
            yearDisplay: "1913",
            title: "Federal Reserve & Income Tax",
            subtitle: "Year America was captured",
            description: "Private bankers seize currency AND your labor becomes taxable. Same year. Coincidence?",
            institutionalRot: [
                InstitutionalControl(institution: .finance, mechanism: "Federal Reserve: Not federal. No reserves. Private bank.", truth: "Government borrows its own currency and pays interest. Forever."),
                InstitutionalControl(institution: .government, mechanism: "16th Amendment. Labor funds interest to Fed.", truth: "You work to pay interest on money from nothing")
            ],
            icon: "dollarsign.circle.fill",
            gradient: [Palette.primary.red, Palette.primary.orange],
            category: .twentieth,
            isRevealed: false,
            region: nil,
            dragonComment: "This was checkmate. Control money = control everything."
        ),
        
        TimelineEra(
            year: 1910,
            yearDisplay: "1910",
            title: "Flexner Report",
            subtitle: "Natural medicine eliminated",
            description: "Rockefeller-funded report closes 'irregular' schools. Only petroleum-based pharma allowed.",
            institutionalRot: [
                InstitutionalControl(institution: .medicine, mechanism: "Homeopathy, naturopathy, herbalism = quackery.", truth: "Rockefeller owned pharma. Funded report making his products mandatory."),
                InstitutionalControl(institution: .education, mechanism: "Medical ed standardized around patents. Nutrition removed.", truth: "Doctors trained to prescribe, not heal"),
                InstitutionalControl(institution: .science, mechanism: "Only approved research funded.", truth: "Science serves funders. Follow the money.")
            ],
            icon: "pill.fill",
            gradient: [Palette.primary.violet, Palette.primary.red],
            category: .twentieth,
            isRevealed: false,
            region: nil,
            dragonComment: "Ancient healing - much from sun cultures - erased in one generation."
        ),
        
        TimelineEra(
            year: 1902,
            yearDisplay: "1902",
            title: "General Education Board",
            subtitle: "Minds captured at source",
            description: "'I don't want thinkers, I want workers.' - Rockefeller",
            institutionalRot: [
                InstitutionalControl(institution: .education, mechanism: "Prussian factory model. Bells, rows, tests. Obedience rewarded.", truth: "Schools succeed at producing compliant workers"),
                InstitutionalControl(institution: .education, mechanism: "History rewritten. Indigenous = 'primitive.'", truth: "They erased sun god cultures and called it progress")
            ],
            icon: "graduationcap.fill",
            gradient: [Palette.primary.orange, Palette.primary.red],
            category: .twentieth,
            isRevealed: false,
            region: nil,
            dragonComment: "Capture children, capture future. 120 years to perfect this."
        ),
        
        // ═══════════════════════════════════════════════════════════════
        // RELIGIOUS SUPPRESSION - THE ROT
        // ═══════════════════════════════════════════════════════════════
        
        TimelineEra(
            year: 1834,
            yearDisplay: "1478-1834",
            title: "Spanish Inquisition",
            subtitle: "350 years of holy terror",
            description: "350 years of torture, forced conversion, book burning. Estimates: 150,000+ tortured, 5,000+ executed. Knowledge criminalized.",
            institutionalRot: [
                InstitutionalControl(institution: .religion, mechanism: "The rack. Strappado. Water torture. Confession extracted, then burned anyway.", truth: "Torture manuals preserved. They documented their methods."),
                InstitutionalControl(institution: .education, mechanism: "Libraries of Islamic and Jewish knowledge destroyed.", truth: "Spain had preserved Greek and Roman texts. Then erased them."),
                InstitutionalControl(institution: .science, mechanism: "Galileo. Copernicus. Bruno burned alive.", truth: "The sun at center threatened the Church at center.")
            ],
            icon: "flame.fill",
            gradient: [Palette.primary.red, Palette.primary.orange],
            category: .colonial,
            isRevealed: false,
            region: "🇪🇸 Spain & Colonies",
            dragonComment: "They burned the people who remembered. Then they burned what they remembered."
        ),
        
        // ═══════════════════════════════════════════════════════════════
        // SUN GOD ERASURE
        // ═══════════════════════════════════════════════════════════════
        
        TimelineEra(
            year: 1572,
            yearDisplay: "1572",
            title: "Last Inca Emperor Killed",
            subtitle: "Children of Inti murdered",
            description: "Túpac Amaru beheaded. Children of the Sun systematically destroyed. Gold melted into crosses.",
            institutionalRot: [
                InstitutionalControl(institution: .religion, mechanism: "Inti Raymi (Festival of Sun) banned. Death for practicing.", truth: "Murdered civilization to steal gold and souls"),
                InstitutionalControl(institution: .finance, mechanism: "El Dorado = golden city of sun worship. Melted for Rome.", truth: "The theft was literal and spiritual")
            ],
            icon: "sun.max.fill",
            gradient: [Palette.accent.gold, Palette.primary.red],
            category: .sunGodErasure,
            isRevealed: false,
            region: "🇵🇪 South America",
            dragonComment: "Inti - the Sun God. His children called themselves 'Children of the Sun.' Rome couldn't allow that."
        ),
        
        TimelineEra(
            year: 1562,
            yearDisplay: "1562",
            title: "Maya Books Burned",
            subtitle: "Knowledge incinerated",
            description: "Bishop Diego de Landa burns thousands of manuscripts. 'Superstitions of the devil.' Only 4 codices survive.",
            institutionalRot: [
                InstitutionalControl(institution: .religion, mechanism: "Thousands of years of knowledge - ash.", truth: "They feared what those books said about consciousness"),
                InstitutionalControl(institution: .education, mechanism: "Oral traditions forbidden. Elders killed.", truth: "Cultural genocide complete when children can't speak to grandparents")
            ],
            icon: "flame.fill",
            gradient: [Palette.primary.red, Palette.primary.orange],
            category: .sunGodErasure,
            isRevealed: false,
            region: "🇲🇽 Mesoamerica",
            dragonComment: "What terrified them so much? We'll never know."
        ),
        
        TimelineEra(
            year: 1521,
            yearDisplay: "1521",
            title: "Fall of Tenochtitlan",
            subtitle: "Tonatiuh's temple razed",
            description: "Cortés destroys Aztec capital. Cathedral built on Temple of the Sun. Your gods under our god.",
            institutionalRot: [
                InstitutionalControl(institution: .religion, mechanism: "Church built on exact sacred spot.", truth: "Built churches on sacred sites worldwide"),
                InstitutionalControl(institution: .military, mechanism: "90% die from disease and war.", truth: "Genocide wasn't side effect. It was method.")
            ],
            icon: "sun.max.fill",
            gradient: [Palette.accent.gold, Palette.primary.red],
            category: .sunGodErasure,
            isRevealed: false,
            region: "🇲🇽 Mesoamerica",
            dragonComment: "Tonatiuh demanded sacrifice, they say. Rome's god demanded entire civilizations."
        ),
        
        TimelineEra(
            year: 1100,
            yearDisplay: "1100s",
            title: "Slavic Sun Gods Erased",
            subtitle: "Svarog forgotten",
            description: "Eastern Europe Christianized. Svarog sun/fire god demonized. Bosnian sun temples destroyed.",
            institutionalRot: [
                InstitutionalControl(institution: .religion, mechanism: "Sacred groves cut. Springs desecrated. Tax breaks for converts.", truth: "Economic incentives plus violence. Same formula everywhere.")
            ],
            icon: "flame.fill",
            gradient: [Palette.primary.orange, Palette.primary.red],
            category: .sunGodErasure,
            isRevealed: false,
            region: "🇧🇦 Eastern Europe",
            dragonComment: "Svarog - Slavic sun god. Bosnia, Serbia, Croatia had fire temples. All erased."
        ),
        
        TimelineEra(
            year: 1209,
            yearDisplay: "1209-1229",
            title: "Albigensian Crusade",
            subtitle: "The Cathar genocide",
            description: "The Cathars were GNOSTICS in Southern France. They taught direct connection to the divine. No priests needed. No tithes required. Rome launched a crusade against fellow Christians.",
            institutionalRot: [
                InstitutionalControl(institution: .religion, mechanism: "Béziers massacre: 'Kill them all. God will know his own.' 20,000+ slaughtered in one day.", truth: "The Pope authorized mass murder of Christians"),
                InstitutionalControl(institution: .religion, mechanism: "Cathar 'perfecti' burned. Books destroyed. Oral traditions killed with the speakers.", truth: "They didn't just kill the Cathars. They erased proof another Christianity existed."),
                InstitutionalControl(institution: .education, mechanism: "Languedoc was center of learning, poetry, religious tolerance.", truth: "Troubadour culture destroyed. Europe's most literate region silenced.")
            ],
            icon: "cross.fill",
            gradient: [Palette.primary.red, Palette.primary.violet],
            category: .roman,
            isRevealed: false,
            region: "🇫🇷 Southern France",
            dragonComment: "The Cathars taught the divine spark is within. Rome taught you need the Church. Guess which survived."
        ),
        
        TimelineEra(
            year: 800,
            yearDisplay: "800s",
            title: "Norse Conversion",
            subtitle: "Sól rides no more",
            description: "Charlemagne's wars. Convert or die. 4,500 Saxons beheaded in one day for refusing baptism.",
            institutionalRot: [
                InstitutionalControl(institution: .religion, mechanism: "Massacre of Verden. Christianity spread by love?", truth: "Historical record says otherwise"),
                InstitutionalControl(institution: .religion, mechanism: "Yule → Christmas. Sun's return → Christ's birth.", truth: "Kept every sun festival, changed who we thank")
            ],
            icon: "sun.max.fill",
            gradient: [Palette.accent.gold, Palette.primary.violet],
            category: .sunGodErasure,
            isRevealed: false,
            region: "🇳🇴 Scandinavia",
            dragonComment: "Sól - she drove the sun chariot. Her story became 'myth.' Church's became 'history.'"
        ),
        
        TimelineEra(
            year: 500,
            yearDisplay: "500s",
            title: "Persian Mithra Suppressed",
            subtitle: "Original Christmas",
            description: "Mithra: born December 25, died and resurrected. Already absorbed into Christ.",
            institutionalRot: [
                InstitutionalControl(institution: .religion, mechanism: "Mithraic temples destroyed. Dec 25 kept. Sunday kept. Halo kept.", truth: "Stole everything and claimed it original")
            ],
            icon: "sun.max.fill",
            gradient: [Palette.accent.gold, Palette.primary.orange],
            category: .sunGodErasure,
            isRevealed: false,
            region: "🇮🇷 Persia",
            dragonComment: "Mithra worshipped by Roman soldiers. December 25. Virgin birth. Sound familiar?"
        ),
        
        TimelineEra(
            year: 529,
            yearDisplay: "529 CE",
            title: "Plato's Academy Closes",
            subtitle: "900 years of philosophy ends",
            description: "Emperor Justinian closes the last major school of Greek philosophy. 900 years of continuous learning ended by decree. Philosophers flee to Persia.",
            institutionalRot: [
                InstitutionalControl(institution: .education, mechanism: "Philosophy schools closed. Pagan teachers banned.", truth: "They closed the schools that taught you to question."),
                InstitutionalControl(institution: .religion, mechanism: "Questioning became heresy. Doubt became sin.", truth: "The West forgot how to think for a millennium.")
            ],
            icon: "building.columns.fill",
            gradient: [Palette.primary.violet, Palette.primary.blue],
            category: .roman,
            isRevealed: false,
            region: "🇬🇷 Athens",
            dragonComment: "Founded 387 BCE. Closed 529 CE. Nine hundred years of light, extinguished by decree."
        ),
        
        TimelineEra(
            year: 500,
            yearDisplay: "500-1400 CE",
            title: "The Dark Ages",
            subtitle: "A millennium of enforced ignorance",
            description: "1000 years where the Church controlled ALL knowledge. Literacy reserved for clergy. Ancient wisdom labeled heresy. Medicine regressed to prayer and bloodletting.",
            institutionalRot: [
                InstitutionalControl(institution: .education, mechanism: "Only clergy could read. Latin only. Books chained in monasteries.", truth: "Information monopoly = power monopoly"),
                InstitutionalControl(institution: .science, mechanism: "Greek and Roman engineering forgotten. Aqueducts crumbled.", truth: "Rome had running water. Medieval Europe had chamber pots."),
                InstitutionalControl(institution: .medicine, mechanism: "Disease = God's punishment. Cure = prayer and flagellation.", truth: "Ancient Egyptian and Greek medicine lost. Millions died."),
                InstitutionalControl(institution: .religion, mechanism: "Anyone who remembered too much was a witch.", truth: "Wise women burned. Midwives murdered. Healers killed.")
            ],
            icon: "moon.fill",
            gradient: [Palette.primary.violet, Palette.primary.red],
            category: .roman,
            isRevealed: false,
            region: "Europe",
            dragonComment: "They didn't call it the 'Dark Ages' because the sun stopped shining. They called it that because they turned off the lights."
        ),
        
        TimelineEra(
            year: 391,
            yearDisplay: "391 CE",
            title: "Library of Alexandria Burns",
            subtitle: "Humanity's memory erased",
            description: "Christian mobs destroy Great Library. 700,000 scrolls. Egyptian sun knowledge. Greek mysteries. All ash.",
            institutionalRot: [
                InstitutionalControl(institution: .religion, mechanism: "Hypatia skinned alive. Knowledge murdered.", truth: "They called it righteous"),
                InstitutionalControl(institution: .education, mechanism: "Millennia of wisdom burned.", truth: "Lost 1000 years of progress. Dark Ages began here.")
            ],
            icon: "flame.fill",
            gradient: [Palette.primary.red, Palette.primary.orange],
            category: .roman,
            isRevealed: false,
            region: "🇪🇬 Egypt",
            dragonComment: "Egyptian. Greek. Babylonian. Persian. Collected wisdom of ancient world. Ash."
        ),
        
        TimelineEra(
            year: 380,
            yearDisplay: "380 CE",
            title: "Christianity Mandatory",
            subtitle: "Sol Invictus stolen",
            description: "Theodosius makes Christianity only legal religion. Sol Invictus outlawed. December 25 becomes Christmas.",
            institutionalRot: [
                InstitutionalControl(institution: .religion, mechanism: "Temples seized. Festivals renamed but dates kept.", truth: "Couldn't destroy sun worship. Wore its skin."),
                InstitutionalControl(institution: .government, mechanism: "Church + state merge. Heresy = treason.", truth: "Spiritual + political = total control")
            ],
            icon: "cross.fill",
            gradient: [Palette.primary.violet, Palette.primary.red],
            category: .roman,
            isRevealed: false,
            region: "Roman Empire",
            dragonComment: "December 25 was Sol Invictus birthday - Unconquered Sun. Stole and kept the date."
        ),
        
        TimelineEra(
            year: 325,
            yearDisplay: "325 CE",
            title: "Council of Nicaea",
            subtitle: "The Great Editing: Yeshua → Jesus",
            description: "Constantine standardizes Christianity. His name YESHUA (יֵשׁוּעַ) — meaning 'salvation,' containing the sacred code of awakening — becomes JESUS through Greek and Latin. Gnostic gospels declaring 'the kingdom is within you' are burned. The living vibration becomes a label. Direct knowing (gnosis) becomes belief in doctrine (pistis). The inner Christ becomes an external savior you can never become.",
            institutionalRot: [
                InstitutionalControl(institution: .religion, mechanism: "Yeshua → Iēsous → Iesus → Jesus. Each translation stripped the sacred frequency.", truth: "They didn't just change a name. They buried a key."),
                InstitutionalControl(institution: .religion, mechanism: "Gnostics (inner divinity) declared heretics. Gospel of Thomas burned.", truth: "'Kingdom within' became 'you need the Church'"),
                InstitutionalControl(institution: .religion, mechanism: "Nicene Creed: what you must BELIEVE about him. Zero about what he TAUGHT.", truth: "Religion ABOUT Jesus replaced religion OF Yeshua"),
                InstitutionalControl(institution: .government, mechanism: "Constantine needed unity, not awakening. Diverse mystic movement → state religion.", truth: "Political control disguised as theology")
            ],
            icon: "building.columns.fill",
            gradient: [Palette.primary.red, Palette.primary.orange],
            category: .roman,
            isRevealed: false,
            region: nil,
            dragonComment: "They took a name that was a vibration, a code, a map back to the divine — and made it a label to put on buildings. Yeshua taught becoming. Jesus became something to worship from a distance."
        ),
        
        // ═══════════════════════════════════════════════════════════════
        // ANCIENT TRUTH
        // ═══════════════════════════════════════════════════════════════
        
        TimelineEra(
            year: 274,
            yearDisplay: "274 CE",
            title: "Sol Invictus - State Religion",
            subtitle: "Rome's sun god",
            description: "Before Christianity, Rome worshipped the Unconquered Sun. December 25. Sunday. The halo.",
            institutionalRot: [],
            icon: "sun.max.fill",
            gradient: [Palette.accent.gold, Palette.primary.orange],
            category: .ancient,
            isRevealed: true,
            region: "Roman Empire",
            dragonComment: "Soldiers didn't want dying savior. They wanted Unconquered Sun. Rome gave them both in one."
        ),
        
        TimelineEra(
            year: 30,
            yearDisplay: "~30 CE",
            title: "Yeshua's True Teaching",
            subtitle: "The Living Name before they changed it",
            description: "'The Kingdom of God is within you.' His name יֵשׁוּעַ (Yeshua) contained the code: YUD (divine spark) + SHIN (eternal fire) + VAV (connection/spine) + AYIN (inner eye). A map of awakening in four letters. He taught direct knowing, not belief. Inner Christ, not external savior. Gospel of Thomas: 'Split wood - I am there. Lift stone - find me.' He came not to be worshipped but to show you what you could become. 'Greater works than these shall you do.'",
            institutionalRot: [],
            icon: "sparkles",
            gradient: [Palette.accent.gold, Palette.primary.cyan],
            category: .ancient,
            isRevealed: true,
            region: nil,
            dragonComment: "His name was a vibration, not a label. A code for awakening, not a deity to worship. They gave you 'Jesus' and took away 'Yeshua' because one requires a church and the other only requires you."
        ),
        
        TimelineEra(
            year: -500,
            yearDisplay: "500 BCE",
            title: "Greek Mystery Schools",
            subtitle: "Helios illuminates",
            description: "Apollo, Helios - sun gods of wisdom. Pythagoras, Plato. 'Know thyself.'",
            institutionalRot: [],
            icon: "triangle.fill",
            gradient: [Palette.primary.cyan, Palette.accent.gold],
            category: .ancient,
            isRevealed: true,
            region: "🇬🇷 Greece",
            dragonComment: "Apollo - the sun. Plato's cave - what reveals truth? Always the sun."
        ),
        
        TimelineEra(
            year: -1500,
            yearDisplay: "1500 BCE",
            title: "Vedic India - Surya",
            subtitle: "The cosmic eye",
            description: "Surya represents cosmic consciousness. Gayatri Mantra invokes divine light. Survives because India never fully conquered.",
            institutionalRot: [],
            icon: "sun.max.fill",
            gradient: [Palette.accent.gold, Palette.primary.orange],
            category: .ancient,
            isRevealed: true,
            region: "🇮🇳 India",
            dragonComment: "India kept sun traditions alive. Surya yoga. Gayatri Mantra. Still practiced."
        ),
        
        TimelineEra(
            year: -3000,
            yearDisplay: "3000 BCE",
            title: "Egyptian Mystery Schools",
            subtitle: "Ra - the original light",
            description: "Horus: virgin birth, light of world, died, resurrected. 3000 years before Jesus.",
            institutionalRot: [],
            icon: "eye.circle.fill",
            gradient: [Palette.accent.gold, Palette.primary.cyan],
            category: .ancient,
            isRevealed: true,
            region: "🇪🇬 Egypt",
            dragonComment: "Horus: Virgin birth. December 25. 12 followers. Crucifixion. Resurrection. They copied homework."
        ),
        
        TimelineEra(
            year: -3500,
            yearDisplay: "3500 BCE",
            title: "Sumerian Sun Gods",
            subtitle: "Utu/Shamash - first recorded",
            description: "Oldest civilization worshipped sun god of justice and truth. Divine light as cosmic consciousness.",
            institutionalRot: [],
            icon: "sun.max.fill",
            gradient: [Palette.accent.gold, Palette.primary.orange],
            category: .ancient,
            isRevealed: true,
            region: "🇮🇶 Mesopotamia",
            dragonComment: "Oldest writing includes sun hymns. This is where humans first recorded what they knew."
        ),
        
        TimelineEra(
            year: -10000,
            yearDisplay: "THE TRUTH",
            title: "The Eternal Sun",
            subtitle: "What they stole from humanity",
            description: "Every ancient civilization worshipped the sun. Not because primitive - because they UNDERSTOOD.\n\n☀️ EGYPT: Ra, Horus, Aten\n☀️ INCA: Inti\n☀️ AZTEC: Tonatiuh\n☀️ MAYA: Kinich Ahau\n☀️ GREECE: Helios, Apollo\n☀️ ROME: Sol Invictus\n☀️ PERSIA: Mithra\n☀️ INDIA: Surya\n☀️ NORSE: Sól\n☀️ CELTIC: Lugh\n☀️ SLAVIC: Svarog (Bosnia)\n☀️ JAPAN: Amaterasu\n\nThe sun = your INNER DIVINITY.\n\nChurch couldn't control divine people. So: destroyed temples, burned books, murdered priests, stole Dec 25, kept halo, changed story.\n\nThey said you're a SINNER needing THEM.\n\nTRUTH: You ARE divine spark. Kingdom of Heaven within - NOW.\n\n🐉☀️ Dragon named. Sun rises within.",
            institutionalRot: [],
            icon: "sun.max.fill",
            gradient: [Palette.accent.gold, Palette.primary.cyan],
            category: .ancient,
            isRevealed: true,
            region: "🌍 Global",
            dragonComment: "You made it. Descended through all the lies to the truth. You are the sun. Always were."
        )
        
    ]
    
    /// Full timeline including esoteric entries (Templars, Masons, Illuminati, etc.)
    static let fullTimeline: [TimelineEra] = {
        let combined = comprehensiveTimeline + EsotericTimelineEntries.entries
        return combined.sorted { $0.year > $1.year }
    }()
    
}
