// MandelaEffectsView.swift
// Mandela Effects Database - Mass False Memories or Timeline Shifts?
// "When millions remember differently"

import SwiftUI

// MARK: - Main Mandela Effects View
struct MandelaEffectsView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var selectedCategory: MandelaCategory = .all
    @State private var searchText = ""
    
    var filteredEffects: [MandelaEffect] {
        var result = MandelaEffect.allEffects
        
        if selectedCategory != .all {
            result = result.filter { $0.category == selectedCategory }
        }
        
        if !searchText.isEmpty {
            result = result.filter {
                $0.name.localizedCaseInsensitiveContains(searchText) ||
                $0.falseMemory.localizedCaseInsensitiveContains(searchText)
            }
        }
        
        return result
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
                LinearGradient(
                    colors: [Color(hex: "0a0a1a"), Color(hex: "1a0a2a")],
                    startPoint: .top,
                    endPoint: .bottom
                )
                .ignoresSafeArea()
                
                VStack(spacing: 0) {
                    // Intro Card
                    VStack(spacing: 8) {
                        Text("🔮 THE MANDELA EFFECT")
                            .font(.caption)
                            .foregroundStyle(Color(hex: "E74C3C"))
                            .tracking(2)
                        
                        Text("When large groups of people remember events differently than they occurred. Named after many remembering Nelson Mandela dying in prison in the 1980s—he actually died in 2013.")
                            .font(.caption)
                            .foregroundStyle(.white.opacity(0.7))
                            .multilineTextAlignment(.center)
                    }
                    .padding()
                    .background(Color(hex: "E74C3C").opacity(0.1))
                    .cornerRadius(12)
                    .padding(.horizontal, 20)
                    .padding(.top, 12)
                    
                    // Category Filter
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 8) {
                            ForEach(MandelaCategory.allCases, id: \.self) { cat in
                                Button(action: { selectedCategory = cat }) {
                                    Text(cat.rawValue)
                                        .font(.caption)
                                        .padding(.horizontal, 12)
                                        .padding(.vertical, 8)
                                        .background(selectedCategory == cat ? Color(hex: "E74C3C") : Color.white.opacity(0.1))
                                        .cornerRadius(20)
                                        .foregroundStyle(.white)
                                }
                            }
                        }
                        .padding(.horizontal)
                    }
                    .padding(.vertical, 12)
                    
                    // Effects List
                    ScrollView {
                        LazyVStack(spacing: 12) {
                            ForEach(filteredEffects) { effect in
                                NavigationLink(destination: MandelaEffectDetailView(effect: effect)) {
                                    mandelaCard(effect)
                                }
                                .buttonStyle(.plain)
                            }
                        }
                        .padding(.horizontal, 20)
                        .padding(.bottom, 50)
                    }
                }
            }
            .navigationTitle("🔮 Mandela Effects")
            .navigationBarTitleDisplayMode(.inline)
            .searchable(text: $searchText, prompt: "Search effects...")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Done") { dismiss() }
                        .foregroundStyle(Color(hex: "E74C3C"))
                }
            }
        }
    }
    
    private func mandelaCard(_ effect: MandelaEffect) -> some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Text(effect.icon)
                    .font(.title2)
                Text(effect.name)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundStyle(.white)
                Spacer()
                Text(effect.category.rawValue)
                    .font(.caption2)
                    .foregroundStyle(Color(hex: "E74C3C"))
            }
            
            HStack(spacing: 12) {
                VStack(alignment: .leading, spacing: 2) {
                    Text("People Remember:")
                        .font(.caption2)
                        .foregroundStyle(.red.opacity(0.7))
                    Text(effect.falseMemory)
                        .font(.caption)
                        .foregroundStyle(.white.opacity(0.9))
                }
                
                Text("→")
                    .foregroundStyle(.white.opacity(0.3))
                
                VStack(alignment: .leading, spacing: 2) {
                    Text("Actually:")
                        .font(.caption2)
                        .foregroundStyle(.green.opacity(0.7))
                    Text(effect.reality)
                        .font(.caption)
                        .foregroundStyle(.white.opacity(0.9))
                }
            }
        }
        .padding()
        .background(Color.white.opacity(0.05))
        .cornerRadius(12)
    }
}

// MARK: - Category
enum MandelaCategory: String, CaseIterable {
    case all = "All"
    case movies = "Movies"
    case brands = "Brands"
    case music = "Music"
    case geography = "Geography"
    case books = "Books"
    case anatomy = "Anatomy"
    case history = "History"
    case celebrities = "Celebrities"
    case other = "Other"
}

// MARK: - Mandela Effect Model
struct MandelaEffect: Identifiable {
    let id = UUID()
    let icon: String
    let name: String
    let category: MandelaCategory
    let falseMemory: String
    let reality: String
    let percentRememberWrong: Int // Estimated percentage who remember wrong
    let evidence: String
    let theories: [String]
    
    static let allEffects: [MandelaEffect] = [
        // Movies (1-15)
        MandelaEffect(
            icon: "🎬",
            name: "Star Wars: Vader's Line",
            category: .movies,
            falseMemory: "\"Luke, I am your father\"",
            reality: "\"No, I am your father\"",
            percentRememberWrong: 90,
            evidence: "Widely misquoted in media, parodies, and cultural references. The actual line has no 'Luke' in it.",
            theories: ["Misquoting in parodies spread the wrong version", "The context needed 'Luke' for clarity when quoted", "Human memory fills in contextual gaps"]
        ),
        
        MandelaEffect(
            icon: "🪞",
            name: "Snow White: Magic Mirror",
            category: .movies,
            falseMemory: "\"Mirror, mirror on the wall\"",
            reality: "\"Magic mirror on the wall\"",
            percentRememberWrong: 85,
            evidence: "The Queen says 'Magic mirror' in the 1937 Disney film. 'Mirror, mirror' is from the original Brothers Grimm tale.",
            theories: ["Grimm version replaced Disney in memory", "Alliterative version is more memorable", "Cultural bleed-over between versions"]
        ),
        
        MandelaEffect(
            icon: "🏃",
            name: "Forrest Gump: Life Is Like",
            category: .movies,
            falseMemory: "\"Life is like a box of chocolates\"",
            reality: "\"Life was like a box of chocolates\"",
            percentRememberWrong: 80,
            evidence: "Forrest says 'was' referring to what his mama told him. Present tense sounds more aphoristic.",
            theories: ["Present tense works better as life advice", "Memory converts narrative to maxim", "Subtle difference easily overlooked"]
        ),
        
        MandelaEffect(
            icon: "🦴",
            name: "Jaws: Shark Quote",
            category: .movies,
            falseMemory: "\"We're gonna need a bigger boat\"",
            reality: "\"You're gonna need a bigger boat\"",
            percentRememberWrong: 75,
            evidence: "Chief Brody says 'You're gonna need' to Quint, not the collective 'we.'",
            theories: ["'We' feels more dramatic/relatable", "Misremembering due to audience identification", "Slight difference, easy substitution"]
        ),
        
        MandelaEffect(
            icon: "🎭",
            name: "Silence of the Lambs: Hello",
            category: .movies,
            falseMemory: "\"Hello, Clarice\"",
            reality: "\"Good morning\"",
            percentRememberWrong: 70,
            evidence: "Hannibal Lecter never says 'Hello, Clarice' in the film. He says 'Good morning' when they first meet.",
            theories: ["Anthony Hopkins later said the line in other media", "Parodies cemented the fake version", "Expectation of dramatic greeting"]
        ),
        
        MandelaEffect(
            icon: "🤵",
            name: "James Bond: Martini",
            category: .movies,
            falseMemory: "\"Shaken, not stirred\"",
            reality: "Various phrasing, often said BY others",
            percentRememberWrong: 65,
            evidence: "Bond himself rarely says this exact line. Others often say it referring to his preference.",
            theories: ["Cultural shorthand simplified it", "Marketing emphasized catchphrase", "Iconic phrase transcended actual usage"]
        ),
        
        MandelaEffect(
            icon: "👻",
            name: "Field of Dreams: If You Build It",
            category: .movies,
            falseMemory: "\"If you build it, they will come\"",
            reality: "\"If you build it, he will come\"",
            percentRememberWrong: 85,
            evidence: "The voice refers to 'he' (Shoeless Joe Jackson specifically), not 'they.'",
            theories: ["Generic version more applicable", "Motivational speakers changed it", "Plural makes better life advice"]
        ),
        
        MandelaEffect(
            icon: "🏠",
            name: "Wizard of Oz: Dorothy's Line",
            category: .movies,
            falseMemory: "\"Toto, I don't think we're in Kansas anymore\"",
            reality: "\"Toto, I've a feeling we're not in Kansas anymore\"",
            percentRememberWrong: 70,
            evidence: "The actual line is more formal and literary. Popular version is casual.",
            theories: ["Casual phrasing easier to remember", "Modern speech patterns update quotes", "The meaning overshadows exact words"]
        ),
        
        MandelaEffect(
            icon: "🚀",
            name: "Apollo 13: Houston",
            category: .movies,
            falseMemory: "\"Houston, we have a problem\"",
            reality: "\"Houston, we've had a problem\"",
            percentRememberWrong: 75,
            evidence: "The actual phrase was 'we've had' (past tense). The movie also uses present tense, compounding confusion.",
            theories: ["Present tense is more urgent/dramatic", "Movie influenced memory of real event", "Past tense seems grammatically odd"]
        ),
        
        MandelaEffect(
            icon: "👽",
            name: "E.T.: Phone Home",
            category: .movies,
            falseMemory: "\"E.T. phone home\"",
            reality: "\"E.T. home phone\"",
            percentRememberWrong: 60,
            evidence: "E.T. actually says 'E.T. home phone' with alien syntax, though sometimes it varies in the film.",
            theories: ["Proper English grammar remembered instead", "Marketing used correct grammar", "Alien speech pattern corrected in memory"]
        ),
        
        // Brands (11-25)
        MandelaEffect(
            icon: "🧸",
            name: "Berenstain Bears",
            category: .brands,
            falseMemory: "\"Berenstein Bears\"",
            reality: "\"Berenstain Bears\"",
            percentRememberWrong: 90,
            evidence: "The books are and always were spelled 'Berenstain' after the authors' surname.",
            theories: ["'-stein' is more common surname ending", "Memory regularizes unusual spellings", "Most famous Mandela Effect example"]
        ),
        
        MandelaEffect(
            icon: "🍫",
            name: "Kit Kat Hyphen",
            category: .brands,
            falseMemory: "\"Kit-Kat\" (with hyphen)",
            reality: "\"Kit Kat\" (no hyphen)",
            percentRememberWrong: 75,
            evidence: "The logo has never had a hyphen. It's two separate words.",
            theories: ["Hyphens in similar brands cause confusion", "Grammatically seems like it should be hyphenated", "Visual memory fills in details"]
        ),
        
        MandelaEffect(
            icon: "👖",
            name: "Levi's vs Levis",
            category: .brands,
            falseMemory: "\"Levis\" (no apostrophe)",
            reality: "\"Levi's\" (with apostrophe)",
            percentRememberWrong: 60,
            evidence: "The brand has always used the possessive apostrophe: Levi's.",
            theories: ["Apostrophes often omitted casually", "Visual memory drops small details", "Pronunciation unchanged either way"]
        ),
        
        MandelaEffect(
            icon: "📺",
            name: "Looney Tunes",
            category: .brands,
            falseMemory: "\"Looney Toons\"",
            reality: "\"Looney Tunes\"",
            percentRememberWrong: 80,
            evidence: "It's Tunes (like music) not Toons (like cartoons). Named after Silly Symphonies competitor.",
            theories: ["Cartoons = Toons seems logical", "Brain autocorrects to expected", "Tiny Toon Adventures adds confusion"]
        ),
        
        MandelaEffect(
            icon: "🍇",
            name: "Fruit of the Loom: Cornucopia",
            category: .brands,
            falseMemory: "Logo has a cornucopia (horn of plenty)",
            reality: "No cornucopia, just fruit",
            percentRememberWrong: 85,
            evidence: "The logo has never featured a cornucopia, only fruit.",
            theories: ["Cornucopia associated with fruit imagery", "Thanksgiving imagery bleed-over", "One of strongest Mandela Effects"]
        ),
        
        MandelaEffect(
            icon: "🥜",
            name: "Jiffy Peanut Butter",
            category: .brands,
            falseMemory: "\"Jiffy\" peanut butter exists",
            reality: "\"Jif\" (or Skippy, but no Jiffy)",
            percentRememberWrong: 70,
            evidence: "There has never been a Jiffy brand peanut butter. Jif and Skippy merged in memory.",
            theories: ["'Jiffy' is common word for quick", "Jif + Skippy = Jiffy", "Jiffy Pop popcorn confusion"]
        ),
        
        MandelaEffect(
            icon: "🦆",
            name: "Cheez-It vs Cheez-Its",
            category: .brands,
            falseMemory: "\"Cheez-Its\" (plural)",
            reality: "\"Cheez-It\" (singular)",
            percentRememberWrong: 65,
            evidence: "The brand is 'Cheez-It' singular, though we refer to them as plural.",
            theories: ["We eat multiple, so plural seems right", "Box of crackers = plural", "Language naturally pluralizes"]
        ),
        
        MandelaEffect(
            icon: "🪥",
            name: "Colgate / Colgat",
            category: .brands,
            falseMemory: "Some remember 'Colgat'",
            reality: "\"Colgate\"",
            percentRememberWrong: 30,
            evidence: "Always been Colgate, named after founder William Colgate.",
            theories: ["Regional pronunciation differences", "Visual dyslexia in memory", "Less common Mandela Effect"]
        ),
        
        MandelaEffect(
            icon: "🥣",
            name: "Froot Loops",
            category: .brands,
            falseMemory: "\"Fruit Loops\"",
            reality: "\"Froot Loops\"",
            percentRememberWrong: 75,
            evidence: "It's spelled 'Froot' not 'Fruit.' Always has been.",
            theories: ["Fruit is correct spelling", "Brain autocorrects 'misspellings'", "Marketing spelling vs real word"]
        ),
        
        MandelaEffect(
            icon: "📦",
            name: "Oscar Mayer",
            category: .brands,
            falseMemory: "\"Oscar Meyer\"",
            reality: "\"Oscar Mayer\"",
            percentRememberWrong: 60,
            evidence: "The brand is spelled 'Mayer' with an A, not 'Meyer.'",
            theories: ["Meyer is more common spelling", "The jingle doesn't clarify spelling", "Visual memory approximates"]
        ),
        
        // Geography (21-30)
        MandelaEffect(
            icon: "🌍",
            name: "South America Position",
            category: .geography,
            falseMemory: "South America directly under North America",
            reality: "South America is significantly east of North America",
            percentRememberWrong: 70,
            evidence: "Looking at a map, South America is much further east than expected. Brazil is east of New York.",
            theories: ["Mental model assumes vertical alignment", "Maps distort relative positions", "Continental drift memory error"]
        ),
        
        MandelaEffect(
            icon: "🇦🇺",
            name: "Australia's Position",
            category: .geography,
            falseMemory: "Australia more isolated, further south",
            reality: "Australia is closer to Indonesia/Papua New Guinea",
            percentRememberWrong: 50,
            evidence: "Many remember Australia being more isolated. It's actually quite close to Southeast Asia.",
            theories: ["Oceania isolation emphasized", "Map projections vary greatly", "Cultural isolation vs physical"]
        ),
        
        MandelaEffect(
            icon: "🗾",
            name: "Japan's Location",
            category: .geography,
            falseMemory: "Japan directly east of China/Korea",
            reality: "Japan is more southeast, aligned with Korea",
            percentRememberWrong: 45,
            evidence: "Some remember Japan being positioned differently relative to the Asian mainland.",
            theories: ["Map variations", "Mental geography is imprecise", "Less common effect"]
        ),
        
        MandelaEffect(
            icon: "🇳🇿",
            name: "New Zealand on Maps",
            category: .geography,
            falseMemory: "New Zealand northeast of Australia",
            reality: "New Zealand is southeast of Australia",
            percentRememberWrong: 55,
            evidence: "Many people misremember New Zealand's position relative to Australia.",
            theories: ["Maps often cut off New Zealand", "Mental geography simplified", "Direction confusion common"]
        ),
        
        MandelaEffect(
            icon: "🏝️",
            name: "Sri Lanka Position",
            category: .geography,
            falseMemory: "Sri Lanka further from India / more southeast",
            reality: "Sri Lanka is very close to India's southern tip",
            percentRememberWrong: 40,
            evidence: "Some remember Ceylon/Sri Lanka being more distant from India than it is.",
            theories: ["Island nations seem more isolated", "Maps at different scales", "Historical political separation"]
        ),
        
        // Music (26-35)
        MandelaEffect(
            icon: "🎤",
            name: "Queen: We Are The Champions",
            category: .music,
            falseMemory: "Song ends with \"of the world\"",
            reality: "Studio version doesn't end with \"of the world\"",
            percentRememberWrong: 90,
            evidence: "The studio recording doesn't end with 'of the world' - just fades out. Live versions often do.",
            theories: ["Live versions end differently", "Brain expects musical resolution", "Memory completes the phrase"]
        ),
        
        MandelaEffect(
            icon: "👧",
            name: "Barbie Girl Lyrics",
            category: .music,
            falseMemory: "\"I'm a Barbie girl, in a Barbie world\"",
            reality: "\"I'm a Barbie girl, in THE Barbie world\"",
            percentRememberWrong: 75,
            evidence: "Aqua sings 'the Barbie world' not 'a Barbie world.'",
            theories: ["Indefinite article sounds more natural", "Slight difference, easily missed", "Grammar smoothing in memory"]
        ),
        
        MandelaEffect(
            icon: "🎸",
            name: "Bohemian Rhapsody: Any Way",
            category: .music,
            falseMemory: "\"Anyway the wind blows\"",
            reality: "\"Any way the wind blows\"",
            percentRememberWrong: 40,
            evidence: "It's 'any way' (two words) not 'anyway' (one word).",
            theories: ["Minor spelling difference", "Pronunciation identical", "Less impactful effect"]
        ),
        
        MandelaEffect(
            icon: "💀",
            name: "Misfits Skull Logo",
            category: .music,
            falseMemory: "Skull has no hair / different hair",
            reality: "Crimson Ghost skull has specific design",
            percentRememberWrong: 35,
            evidence: "Some fans remember the iconic skull logo looking different.",
            theories: ["Merchandise variations exist", "Memory of variations", "Less documented effect"]
        ),
        
        MandelaEffect(
            icon: "🎹",
            name: "Eurythmics: Sweet Dreams",
            category: .music,
            falseMemory: "\"Sweet dreams are made OF these\"",
            reality: "\"Sweet dreams are made of THIS\"",
            percentRememberWrong: 80,
            evidence: "Annie Lennox sings 'this' (singular) not 'these' (plural).",
            theories: ["Plural sounds more grammatical", "Misheard lyrics common", "Memory averages to expected"]
        ),
        
        // History/People (31-40)
        MandelaEffect(
            icon: "👤",
            name: "Henry VIII Turkey Leg",
            category: .history,
            falseMemory: "Famous painting shows him holding turkey leg",
            reality: "No such painting exists",
            percentRememberWrong: 60,
            evidence: "There is no historical painting of Henry VIII holding a turkey leg, though many remember it.",
            theories: ["Renaissance fair imagery", "Conflation with feast scenes", "Pop culture inventions"]
        ),
        
        MandelaEffect(
            icon: "🗽",
            name: "Statue of Liberty Location",
            category: .history,
            falseMemory: "On Ellis Island",
            reality: "On Liberty Island",
            percentRememberWrong: 50,
            evidence: "The Statue of Liberty is on Liberty Island, not Ellis Island (immigration station).",
            theories: ["Both islands associated with immigration", "Close proximity conflated", "Historical connection"]
        ),
        
        MandelaEffect(
            icon: "🎨",
            name: "Mona Lisa's Smile",
            category: .history,
            falseMemory: "No smile / neutral expression",
            reality: "Subtle smile (always had it)",
            percentRememberWrong: 45,
            evidence: "Some remember the Mona Lisa with a neutral expression. The subtle smile has always been there.",
            theories: ["Subtlety leads to varied perception", "Psychological projection", "Famous 'smile' mystery paradox"]
        ),
        
        MandelaEffect(
            icon: "💀",
            name: "Nelson Mandela's Death",
            category: .celebrities,
            falseMemory: "Died in prison in the 1980s",
            reality: "Died December 5, 2013, after presidency",
            percentRememberWrong: 30,
            evidence: "Many people distinctly remember Nelson Mandela dying in prison. He was released in 1990, became president 1994-1999, died in 2013.",
            theories: ["Confusion with Steve Biko", "False news reports", "The effect's namesake"]
        ),
        
        MandelaEffect(
            icon: "👨‍🚀",
            name: "Tank Man - Tiananmen",
            category: .history,
            falseMemory: "Tank Man was run over",
            reality: "Tank Man was pulled away, fate unknown",
            percentRememberWrong: 40,
            evidence: "The famous 'Tank Man' was not run over. He blocked tanks, then was pulled away. His fate remains unknown.",
            theories: ["Expectation of tragic ending", "Censorship mythology", "Symbol became history"]
        ),
        
        // Anatomy (36-40)
        MandelaEffect(
            icon: "💀",
            name: "Skull Behind Eyes",
            category: .anatomy,
            falseMemory: "Solid bone behind eyes",
            reality: "Eye sockets are open to brain cavity",
            percentRememberWrong: 55,
            evidence: "Many don't realize eye sockets connect directly to the brain cavity. There's bone around, but openings exist.",
            theories: ["Anatomy isn't commonly studied", "Simplified mental models", "Not really a timeline shift"]
        ),
        
        MandelaEffect(
            icon: "🫀",
            name: "Heart Location",
            category: .anatomy,
            falseMemory: "Heart on left side of chest",
            reality: "Heart is center-left, mostly center",
            percentRememberWrong: 65,
            evidence: "The heart is not on the left side—it's in the center, tilted slightly left. The apex points left, causing the misconception.",
            theories: ["Hand-on-heart pledge position", "Heartbeat felt on left", "Simplified teaching"]
        ),
        
        MandelaEffect(
            icon: "🦴",
            name: "Human Ribs",
            category: .anatomy,
            falseMemory: "Ribs fully enclose torso",
            reality: "Lower ribs don't connect, 'floating' ribs exist",
            percentRememberWrong: 50,
            evidence: "Some remember ribs as a complete cage. Lower ribs are 'floating'—not connected to sternum.",
            theories: ["Skeleton diagrams simplify", "Rib cage imagery", "Anatomy surprises many"]
        ),
        
        // Books/Characters (41-50)
        MandelaEffect(
            icon: "🐵",
            name: "Curious George's Tail",
            category: .books,
            falseMemory: "Curious George has a tail",
            reality: "Curious George has no tail",
            percentRememberWrong: 85,
            evidence: "Curious George has never had a tail in any of the books. He's an ape, not a monkey.",
            theories: ["Monkeys have tails, apes don't", "Similar character confusion", "Expectation bias"]
        ),
        
        MandelaEffect(
            icon: "🎩",
            name: "Monopoly Man's Monocle",
            category: .other,
            falseMemory: "Rich Uncle Pennybags has a monocle",
            reality: "He has never worn a monocle",
            percentRememberWrong: 80,
            evidence: "The Monopoly mascot has never had a monocle. People confuse him with Mr. Peanut.",
            theories: ["Mr. Peanut has monocle", "Rich stereotype includes monocle", "Visual memory combines icons"]
        ),
        
        MandelaEffect(
            icon: "🧝",
            name: "Gandalf: \"Fly, You Fools\"",
            category: .movies,
            falseMemory: "\"Run, you fools!\"",
            reality: "\"Fly, you fools!\"",
            percentRememberWrong: 55,
            evidence: "Gandalf says 'fly' not 'run' as he falls in Moria.",
            theories: ["Run seems more logical", "Archaic use of 'fly' = flee", "Modern interpretation"]
        ),
        
        MandelaEffect(
            icon: "🧙",
            name: "Genie from Aladdin: Wish",
            category: .movies,
            falseMemory: "\"Your wish is my command\"",
            reality: "Never actually says this exact line",
            percentRememberWrong: 50,
            evidence: "The Genie never says this classic genie line in Disney's Aladdin.",
            theories: ["Stock genie phrase", "Expected dialogue", "Other media conflation"]
        ),
        
        MandelaEffect(
            icon: "🐷",
            name: "Pikachu's Tail",
            category: .other,
            falseMemory: "Black tip on tail",
            reality: "Tail is all yellow (no black tip)",
            percentRememberWrong: 70,
            evidence: "Pikachu's tail has never had a black tip. His ears have black tips, which may cause confusion.",
            theories: ["Ear markings transferred to tail", "Symmetry assumption", "Fan art perpetuates"]
        ),
        
        MandelaEffect(
            icon: "🎅",
            name: "Shazaam with Sinbad",
            category: .movies,
            falseMemory: "1990s movie 'Shazaam' starring Sinbad as genie",
            reality: "This movie never existed",
            percentRememberWrong: 40,
            evidence: "There was never a movie called Shazaam with Sinbad. Kazaam with Shaq existed. Sinbad denies making any genie movie.",
            theories: ["Confusion with Kazaam", "Sinbad did other movies in costumes", "Collective false memory"]
        ),
        
        MandelaEffect(
            icon: "👔",
            name: "Mr. Rogers' Cardigan",
            category: .celebrities,
            falseMemory: "Red cardigan",
            reality: "Various colors, often blue or green",
            percentRememberWrong: 45,
            evidence: "Mr. Rogers wore many colored cardigans, not exclusively red. Blue and brown were common.",
            theories: ["Red stands out in memory", "Iconic image selected", "Memory simplifies"]
        ),
        
        MandelaEffect(
            icon: "🎬",
            name: "Risky Business: Sunglasses",
            category: .movies,
            falseMemory: "Tom Cruise wears sunglasses in dance scene",
            reality: "No sunglasses in the scene",
            percentRememberWrong: 60,
            evidence: "In the famous underwear dance scene, Tom Cruise doesn't wear sunglasses. Many posters/parodies add them.",
            theories: ["Parodies added sunglasses", "Cool factor assumption", "Poster art influence"]
        ),
        
        MandelaEffect(
            icon: "🦷",
            name: "Jaws: Dolly's Braces",
            category: .movies,
            falseMemory: "Dolly had braces (matching Jaws)",
            reality: "Dolly never had braces",
            percentRememberWrong: 65,
            evidence: "In Moonraker, many remember Dolly having braces, creating the joke with Jaws. She didn't.",
            theories: ["Narrative logic demands braces", "The scene 'needs' the joke", "Memory constructs missing punchline"]
        ),
        
        MandelaEffect(
            icon: "📖",
            name: "Interview with THE Vampire",
            category: .movies,
            falseMemory: "\"Interview with A Vampire\"",
            reality: "\"Interview with THE Vampire\"",
            percentRememberWrong: 70,
            evidence: "Both the book and movie are titled 'Interview with THE Vampire,' not 'a vampire.'",
            theories: ["Indefinite article sounds more natural", "Conversational grammar", "Common misremembering"]
        )
    ]
}

// MARK: - Detail View
struct MandelaEffectDetailView: View {
    let effect: MandelaEffect
    
    var body: some View {
        ZStack {
            LinearGradient(
                colors: [Color(hex: "0a0a1a"), Color(hex: "1a0a2a")],
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()
            
            ScrollView {
                VStack(alignment: .leading, spacing: 24) {
                    // Header
                    HStack {
                        Text(effect.icon)
                            .font(.system(size: 50))
                        VStack(alignment: .leading) {
                            Text(effect.category.rawValue.uppercased())
                                .font(.caption)
                                .foregroundStyle(Color(hex: "E74C3C"))
                            Text(effect.name)
                                .font(.title2)
                                .fontWeight(.bold)
                                .foregroundStyle(.white)
                        }
                    }
                    .padding(.top, 20)
                    
                    // Memory Comparison
                    HStack(spacing: 16) {
                        VStack(alignment: .leading, spacing: 8) {
                            Text("❌ FALSE MEMORY")
                                .font(.caption)
                                .foregroundStyle(.red)
                            Text(effect.falseMemory)
                                .font(.body)
                                .foregroundStyle(.white)
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.red.opacity(0.1))
                        .cornerRadius(12)
                        
                        VStack(alignment: .leading, spacing: 8) {
                            Text("✅ REALITY")
                                .font(.caption)
                                .foregroundStyle(.green)
                            Text(effect.reality)
                                .font(.body)
                                .foregroundStyle(.white)
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.green.opacity(0.1))
                        .cornerRadius(12)
                    }
                    
                    // Statistics
                    VStack(alignment: .leading, spacing: 8) {
                        Text("📊 STATISTICS")
                            .font(.caption)
                            .foregroundStyle(.white.opacity(0.6))
                            .tracking(2)
                        
                        HStack {
                            Text("Est. people who remember wrong:")
                                .font(.caption)
                                .foregroundStyle(.white.opacity(0.7))
                            Spacer()
                            Text("\(effect.percentRememberWrong)%")
                                .font(.headline)
                                .foregroundStyle(Color(hex: "E74C3C"))
                        }
                        
                        // Progress bar
                        GeometryReader { geo in
                            ZStack(alignment: .leading) {
                                Rectangle()
                                    .fill(Color.white.opacity(0.1))
                                    .frame(height: 8)
                                    .cornerRadius(4)
                                
                                Rectangle()
                                    .fill(Color(hex: "E74C3C"))
                                    .frame(width: geo.size.width * CGFloat(effect.percentRememberWrong) / 100, height: 8)
                                    .cornerRadius(4)
                            }
                        }
                        .frame(height: 8)
                    }
                    .padding()
                    .background(Color.white.opacity(0.05))
                    .cornerRadius(12)
                    
                    // Evidence
                    VStack(alignment: .leading, spacing: 8) {
                        Text("🔍 EVIDENCE")
                            .font(.caption)
                            .foregroundStyle(.white.opacity(0.6))
                            .tracking(2)
                        
                        Text(effect.evidence)
                            .font(.body)
                            .foregroundStyle(.white.opacity(0.9))
                            .lineSpacing(4)
                    }
                    .padding()
                    .background(Color.white.opacity(0.05))
                    .cornerRadius(12)
                    
                    // Theories
                    VStack(alignment: .leading, spacing: 12) {
                        Text("🧠 PROPOSED THEORIES")
                            .font(.caption)
                            .foregroundStyle(.white.opacity(0.6))
                            .tracking(2)
                        
                        ForEach(effect.theories, id: \.self) { theory in
                            HStack(alignment: .top, spacing: 12) {
                                Text("•")
                                    .foregroundStyle(Color(hex: "E74C3C"))
                                Text(theory)
                                    .font(.subheadline)
                                    .foregroundStyle(.white.opacity(0.9))
                            }
                        }
                    }
                    .padding()
                    .background(Color(hex: "E74C3C").opacity(0.1))
                    .cornerRadius(12)
                    
                    // Disclaimer
                    VStack(spacing: 8) {
                        Text("⚠️ NOTE")
                            .font(.caption)
                            .foregroundStyle(.orange)
                        Text("The Mandela Effect is likely explained by the fallibility of human memory, confabulation, and social influence—not alternate timelines. However, exploring these phenomena helps us understand how memory works.")
                            .font(.caption)
                            .foregroundStyle(.white.opacity(0.6))
                            .multilineTextAlignment(.center)
                    }
                    .padding()
                    .background(Color.orange.opacity(0.1))
                    .cornerRadius(12)
                    
                    Spacer(minLength: 50)
                }
                .padding(.horizontal, 20)
            }
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    MandelaEffectsView()
}
