// SolarTheologyView.swift
// SOLAR THEOLOGY — "God's Son or God's Sun?"
// ☀️ SunFlow: Reignited
//
// "37 different religions had sun gods who died,
//  were resurrected, had virgin mothers, had 12 followers.
//  Thousands of years BEFORE Christianity."
//
// This module exposes the solar theology layer:
// - The sun as the original "god" across ALL civilizations
// - 37+ crucified/resurrected sun gods pre-dating Christianity
// - The cross as zodiac/seasonal symbol (not execution device)
// - Crown of thorns = sun rays (visible in every ancient depiction)
// - 12 apostles = 12 months/zodiac signs
// - 4 gospels = 4 seasons
// - "He is risen" = the sun rises every morning
// - Monstrance = sun disc on Catholic altars
// - Communion = eating the sun god's body
// - Solar plexus = "Jesus in your heart"
//
// Not anti-religion. Anti-hiding-the-truth.
// Know what you're actually worshiping.

import SwiftUI

// MARK: - ═══════════════════════════════════════════════════
// SOLAR THEOLOGY VIEW
// ═══════════════════════════════════════════════════════════

struct SolarTheologyView: View {
    
    @Environment(\.dismiss) var dismiss
    @State private var selectedTab: SolarTab = .sunGods
    @State private var expandedCards: Set<String> = []
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color(red: 0.02, green: 0.02, blue: 0.06).ignoresSafeArea()
                
                ScrollView(showsIndicators: false) {
                    VStack(spacing: 20) {
                        headerView
                        tabSelector
                        contentForTab
                        Spacer(minLength: 60)
                    }
                    .padding(20)
                }
            }
            .navigationTitle("")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button { dismiss() } label: {
                        Image(systemName: "chevron.left").font(.system(size: 16, weight: .semibold)).foregroundColor(.white)
                    }
                }
                ToolbarItem(placement: .principal) {
                    Text("Solar Theology").font(.system(size: 17, weight: .bold)).foregroundColor(.white)
                }
            }
        }
    }
    
    // MARK: - Header
    
    private var headerView: some View {
        VStack(spacing: 8) {
            Text("☀️").font(.system(size: 50))
            Text("GOD'S SON\nOR GOD'S SUN?")
                .font(.system(size: 22, weight: .black)).tracking(1)
                .foregroundColor(.white).multilineTextAlignment(.center)
            Text("37 religions had sun gods who died, were resurrected,\nhad virgin mothers, and had 12 followers.\nThousands of years BEFORE Christianity.")
                .font(.system(size: 11, weight: .medium)).foregroundColor(.white.opacity(0.35))
                .multilineTextAlignment(.center)
        }
    }
    
    // MARK: - Tab Selector
    
    private var tabSelector: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 8) {
                ForEach(SolarTab.allCases, id: \.self) { tab in
                    Button {
                        withAnimation(.easeInOut(duration: 0.2)) { selectedTab = tab }
                    } label: {
                        VStack(spacing: 3) {
                            Text(tab.emoji).font(.system(size: 16))
                            Text(tab.label).font(.system(size: 9, weight: .bold)).tracking(0.5)
                                .foregroundColor(selectedTab == tab ? .black : .white.opacity(0.5))
                        }
                        .padding(.horizontal, 10).padding(.vertical, 8)
                        .background(Capsule().fill(selectedTab == tab ? Color(red: 1.0, green: 0.85, blue: 0.3) : Color.white.opacity(0.04)))
                    }
                }
            }
        }
    }
    
    // MARK: - Content Router
    
    @ViewBuilder
    private var contentForTab: some View {
        switch selectedTab {
        case .sunGods: sunGodsTab
        case .crucified: crucifiedSaviorsTab
        case .cross: crossOfZodiacTab
        case .symbols: christianSunSymbolsTab
        case .calendar: calendarConnectionsTab
        case .pattern: thePatternTab
        }
    }
    
    // MARK: - ═══════════════════════════════════════════════
    // TAB 1: SUN GODS ACROSS CIVILIZATIONS
    // ═══════════════════════════════════════════════════════
    
    private var sunGodsTab: some View {
        VStack(spacing: 12) {
            sectionHeader("THE SUN WAS ALWAYS GOD", subtitle: "Every civilization worshiped the sun. They personified it into a god. That god became 'God's Son.'")
            
            ForEach(SolarSunGodEntry.allGods) { god in
                expandableCard(
                    id: god.id,
                    emoji: god.regionEmoji,
                    title: god.name,
                    subtitle: god.civilization,
                    content: god.description,
                    detail: god.detail,
                    color: god.color
                )
            }
            
            insightCard(
                "THE PATTERN",
                "Every civilization on Earth independently arrived at the same conclusion: the sun is the source of all life. They personified it. Gave it a human form. Called it 'God's Son.' The sun was born (sunrise), lived (daytime), died (sunset), and was resurrected (sunrise again). Every single day.\n\nThis isn't coincidence. This is observation. The sun IS the source of life on Earth. Ancient peoples weren't stupid — they were accurate. Modern religion just forgot what it was actually worshiping.",
                color: .orange
            )
        }
    }
    
    // MARK: - ═══════════════════════════════════════════════
    // TAB 2: CRUCIFIED SAVIORS
    // ═══════════════════════════════════════════════════════
    
    private var crucifiedSaviorsTab: some View {
        VStack(spacing: 12) {
            sectionHeader("37 CRUCIFIED SAVIORS", subtitle: "Before Christianity, at least 37 religions had gods who died, were resurrected, had virgin mothers, and had 12 followers. The story isn't unique — it's universal.")
            
            ForEach(CrucifiedSavior.allSaviors) { savior in
                expandableCard(
                    id: savior.id,
                    emoji: savior.regionEmoji,
                    title: savior.name,
                    subtitle: "\(savior.origin) • \(savior.approximateDate)",
                    content: savior.parallels,
                    detail: savior.detail,
                    color: savior.color
                )
            }
            
            insightCard(
                "THE QUESTION",
                "If ONE religion had a god born of a virgin, who had 12 followers, performed miracles, died, and was resurrected — you might call it divine revelation.\n\nBut when 37 religions across every continent tell the SAME story, thousands of years apart, with the sun always at the center — that's not revelation. That's a PATTERN.\n\nThe pattern is the sun. Born each morning (virgin birth — no human created it). 12 hours of daylight (12 disciples). Dies each evening (crucifixion). Three days of shortest light in winter (death). Returns in spring (resurrection).\n\nThe story was never about a man. It was always about the sun.",
                color: .red
            )
            
            sourceCard("Sources: Kersey Graves — The World's Sixteen Crucified Saviors (1875); Sir Edward Moore — The Hindu Pantheon; Gerald Massey — The Natural Genesis (1883); D.M. Murdock — The Christ Conspiracy (1999); Jordan Maxwell lectures")
        }
    }
    
    // MARK: - ═══════════════════════════════════════════════
    // TAB 3: THE CROSS OF THE ZODIAC
    // ═══════════════════════════════════════════════════════
    
    private var crossOfZodiacTab: some View {
        VStack(spacing: 12) {
            sectionHeader("THE CROSS ISN'T WHAT YOU THINK", subtitle: "The cross predates Christianity by thousands of years. It's the cross of the zodiac — the intersection of the solstices and equinoxes. The sun 'dies' on this cross every year.")
            
            expandableCard(
                id: "zodiac_cross",
                emoji: "✝️",
                title: "The Cross of the Zodiac",
                subtitle: "Older than any religion",
                content: "Draw a circle (the sun's path through the sky — the ecliptic). Draw a horizontal line through it (spring equinox to fall equinox). Draw a vertical line (summer solstice to winter solstice). You now have a CROSS inside a CIRCLE.\n\nThis is the oldest religious symbol in human history. It appears in petroglyphs dating back 10,000+ years. It represents the sun's annual journey through the four seasons.\n\nThe sun 'dies' on this cross every December 22nd (winter solstice — shortest day). It stays 'dead' for three days (Dec 22, 23, 24). On December 25th, it begins to move north again — it is 'born again.'\n\nThe cross was never an execution device. It was an astronomical calendar.",
                detail: "The Celtic cross — a cross with a circle behind it — is the most honest version. It shows the cross for what it is: the zodiac wheel. You'll see it on ancient Irish churches, but the concept predates Christianity by millennia. Every church cross with a circle or sun disc behind it is accidentally (or intentionally) showing you the zodiac cross.",
                color: .yellow
            )
            
            expandableCard(
                id: "crown_thorns",
                emoji: "👑",
                title: "Crown of Thorns = Sun Rays",
                subtitle: "Look at ANY ancient sun god",
                content: "Every ancient sun god is depicted with rays radiating from their head. Helios, Apollo, Mithra, Sol Invictus, Ra — they ALL have this 'crown' of radiating light.\n\nWhen Christianity adopted the sun god narrative, the 'crown of thorns' became the cover story for what was always just the sun's corona — the rays of light radiating outward.\n\nLook at any medieval painting of Jesus with the 'crown of thorns.' The thorns radiate outward in a circle. Exactly like sun rays. Because that's what they are.",
                detail: "Ancient petroglyphs — carved thousands of years before Christianity — show the sun as a circle with radiating lines. The oldest symbol of the sun in human history. The same symbol appears behind Jesus' head in virtually every Christian artwork ever made. They call it a 'halo.' It's a sun disc.",
                color: .orange
            )
            
            expandableCard(
                id: "pagan_cross",
                emoji: "⚔️",
                title: "Pagans Wore Crosses First",
                subtitle: "1,500 years before Christianity",
                content: "Crosses as jewelry, on clothing, on altars — all of this predates Christianity by over a millennium.\n\nAncient Assyrian reliefs (1,500+ years before Christ) show pagan priests wearing crosses around their necks. Egyptian ankh crosses date back 3,000+ years. Celtic crosses predate Christianity in Ireland.\n\nThe cross was a universal symbol of the sun and the four directions (north, south, east, west) and the four seasons (spring, summer, fall, winter).\n\nChristianity didn't invent the cross. It inherited it from the same sun worship tradition that every other religion drew from.",
                detail: "The Egyptian ankh — a cross with a loop on top — represents eternal life through the sun. The Hindu swastika (before the Nazis corrupted it) was a sun wheel showing the sun's rotation. The Aztec sun stone is a massive circular cross. The symbol is EVERYWHERE, in EVERY culture, ALWAYS connected to the sun.",
                color: .red
            )
            
            expandableCard(
                id: "southern_cross",
                emoji: "⭐",
                title: "The Sun Dies on the Southern Cross",
                subtitle: "December 22-25",
                content: "On December 22nd (winter solstice), the sun reaches its lowest point in the southern sky. For three days — December 22, 23, and 24 — the sun appears to 'stand still' (solstice literally means 'sun stands still' in Latin).\n\nDuring this time, the sun is near the constellation known as the Southern Cross (Crux).\n\nSo literally: the sun (God's Son) dies on the cross (Southern Cross constellation) for three days (Dec 22-24) and is 'born again' on December 25th when it begins moving north.\n\nThis is the ACTUAL story behind the death and resurrection narrative. Not a man on wood. The sun on the cross of the zodiac, dying at winter solstice and being reborn.",
                detail: "December 25th was celebrated as the birthday of Mithra, Sol Invictus, Horus, and dozens of other sun gods LONG before it was assigned to Jesus. The early Christian church didn't even celebrate Christmas — it was added centuries later, deliberately placed on the existing pagan sun festival. The birthday was never about a person. It was about the sun returning.",
                color: .purple
            )
            
            insightCard(
                "WHAT THEY HID",
                "The cross is not a Christian invention. It's humanity's oldest astronomical symbol — the intersection of the seasons, with the sun at the center.\n\nThey took the most ancient form of sun worship on Earth, put a man on it, and told you it was new. It was never new. It's the oldest story ever told.",
                color: .yellow
            )
        }
    }
    
    // MARK: - ═══════════════════════════════════════════════
    // TAB 4: CHRISTIAN SUN SYMBOLS
    // ═══════════════════════════════════════════════════════
    
    private var christianSunSymbolsTab: some View {
        VStack(spacing: 12) {
            sectionHeader("SUN WORSHIP IN PLAIN SIGHT", subtitle: "The Catholic Church's most sacred symbols are sun symbols. The monstrance IS a sun. Communion IS eating the sun. 'He is risen' IS the sunrise. It's all right there — if you look.")
            
            expandableCard(
                id: "monstrance",
                emoji: "🌞",
                title: "The Monstrance — A Literal Sun Disc",
                subtitle: "The most sacred object in Catholicism",
                content: "The monstrance (also called ostensorium) is the single most important ritual object in Catholicism. It holds the consecrated communion wafer — the 'body of Christ.'\n\nLook at one. It is a LITERAL SUN DISC with radiating rays. A golden sun on a stand, displayed on the altar for worship.\n\nThe Catholic Church will tell you it's a symbol of Christ's radiance. But the design is identical to every ancient sun disc ever made — from Egyptian temples to Mesopotamian altars. It IS a sun.\n\nThe Pope holds it up. Cardinals bow to it. Millions genuflect before it. They are bowing to the sun. On the altar of an institution that claims to have replaced 'pagan' worship.",
                detail: "The word 'monstrance' comes from Latin 'monstrare' — to show, to display. They're SHOWING you the sun. They're displaying the sun god's body (the round wafer = the round sun disc) inside the sun's rays. It's the most honest thing in the entire church — they're literally showing you what they worship.",
                color: .yellow
            )
            
            expandableCard(
                id: "communion",
                emoji: "🍞",
                title: "Communion — Eating the Sun",
                subtitle: "The round wafer is the round sun",
                content: "The communion wafer is round. Not square. Not triangular. Round.\n\nIt represents the 'body of Christ' — God's Son/Sun. You place the round disc (sun) on your tongue. You consume the sun god.\n\nAncient petroglyphs — the oldest symbols of the sun — show the sun as a circle, sometimes with a cross inside (the four seasons). The communion wafer looks identical to these ancient sun symbols.\n\nIn Egyptian sun worship, offerings were made to the sun disc on the altar. In Catholic communion, a sun disc (wafer) is placed inside a sun symbol (monstrance) on the altar. Same ritual. Different name.",
                detail: "The phrase 'This is my body, eat it in remembrance of me' takes on a completely different meaning when you understand 'me' is the sun. The sun gives its 'body' (light, warmth, energy) so that life can exist. Plants eat sunlight (photosynthesis). We eat plants. We are literally eating the sun's body every day. Communion is a ritual acknowledgment of this biological fact — wrapped in mythology.",
                color: .orange
            )
            
            expandableCard(
                id: "risen",
                emoji: "🌅",
                title: "'He Is Risen' — The Sun Rises",
                subtitle: "The most obvious one",
                content: "The central claim of Christianity: 'He is risen!'\n\nWhat does the sun do every single morning? It RISES.\n\nThe sun is your 'risen savior.' If the sun doesn't rise, all life on Earth dies. The sun rising IS salvation. Every morning. Without fail. For 4.5 billion years.\n\nEaster — the celebration of the resurrection — happens at the spring equinox. The moment when the sun 'conquers' darkness (days become longer than nights). The sun was 'dead' in winter (short days, no growth, cold). In spring, it 'rises' again. Crops grow. Life returns.\n\nThe risen savior. Rising every morning. Returning every spring. Exactly as promised.",
                detail: "Easter is named after Ishtar/Eostre — a pagan goddess of spring and fertility. Easter eggs and Easter bunnies are fertility symbols (spring = new life). The entire holiday is a pagan spring equinox celebration of the sun's return. The church just put a new story on top of the oldest celebration in human history.",
                color: .cyan
            )
            
            expandableCard(
                id: "solar_plexus",
                emoji: "💛",
                title: "Solar Plexus — Jesus 'In Your Heart'",
                subtitle: "Even the body knows",
                content: "Christians say: 'Let Jesus into your heart.' 'Keep Jesus in your heart.' 'I have Jesus in my heart.'\n\nYour heart is located in the area of your body called the SOLAR plexus. Solar. As in: of the sun.\n\nThe solar plexus is named after the sun because the nerve network radiates outward from a central point — like the sun's rays. Ancient anatomists saw the pattern.\n\nSo when you 'put Jesus (the Sun) in your heart (the Solar plexus)' — you are placing the sun in the part of your body named after the sun. The language itself tells you what you're actually doing.\n\nMany depictions of Catholic saints show the Sacred Heart — a heart with sun rays emanating from it. The sun. In the solar plexus. In plain sight.",
                detail: "The chakra system in Hinduism places the solar plexus chakra (Manipura) at the same location — associated with personal power, the color yellow (sun), and the element fire. Different tradition, same recognition: the sun's energy center is in the middle of your body. The body IS a solar temple.",
                color: .yellow
            )
            
            expandableCard(
                id: "helios_church",
                emoji: "🏛️",
                title: "Sun Gods IN the Churches",
                subtitle: "Helios on the synagogue floor, Apollo in cathedrals",
                content: "In an ancient Jewish synagogue at Beit Alpha (Israel), the floor mosaic features Helios — the Greek sun god — riding his chariot across the sky, surrounded by the 12 zodiac signs.\n\nIn the Cathedral of St. Peter and St. Mary in Cologne, Germany, Apollo (the sun god) appears as part of the church decoration.\n\nIn the Vatican itself, Helios appears in artwork and architecture.\n\nEven 1 Corinthians 1:12 mentions that early Christians were following 'Apollos' — and Apollos/Apollo was a sun god. Paul writes: 'One of you says I follow Paul, another says I follow Apollos, another I follow Peter, another I follow Christ.'\n\nSun gods IN the churches. Sun gods IN the scripture. It was never hidden. People just stopped looking.",
                detail: "The word 'church' itself has debated etymological origins, but 'kirk' (Scottish/Germanic) may connect to 'circe' — circle, as in the sun's circular path. Church steeples point upward — toward the sun. Church services traditionally face east — toward the sunrise. The entire architectural orientation of Christianity points at the sun.",
                color: .purple
            )
            
            expandableCard(
                id: "halo",
                emoji: "😇",
                title: "The Halo — A Sun Disc on Every Saint",
                subtitle: "Not holiness. The sun.",
                content: "Every Christian saint, angel, and depiction of Jesus includes a halo — a glowing circle behind the head.\n\nThis is not a Christian invention. It's a sun disc. The same radiating circle that appears behind Ra, Helios, Apollo, Mithra, Surya, Amaterasu, and every sun god in human history.\n\nThe halo says: this figure represents the sun. It's the most consistent symbol in all of Christian art, and it comes directly from pre-Christian sun worship.\n\nIn some medieval paintings, Jesus' halo contains a CROSS inside the circle — making it explicitly the cross of the zodiac. They're literally painting the zodiac wheel behind Jesus' head and calling it divine light.",
                detail: "Buddhist artwork also uses halos (mandorlas) behind enlightened beings. Hindu deities have sun discs. The symbol is universal because the meaning is universal: this being IS or represents the sun. Every religion that uses the halo is acknowledging the same solar origin — whether they know it or not.",
                color: .orange
            )
            
            insightCard(
                "THE TRUTH IN PLAIN SIGHT",
                "The monstrance IS a sun. Communion IS eating the sun disc. 'He is risen' IS the sunrise. The halo IS a sun disc. The solar plexus IS named after the sun.\n\nNone of this is hidden. It's all right there — in the objects, the rituals, the language, the art, the architecture. The church didn't hide the sun worship. It just stopped telling people what they were looking at.\n\nAnd your Prussian education never taught you to ask.",
                color: .yellow
            )
        }
    }
    
    // MARK: - ═══════════════════════════════════════════════
    // TAB 5: CALENDAR CONNECTIONS
    // ═══════════════════════════════════════════════════════
    
    private var calendarConnectionsTab: some View {
        VStack(spacing: 12) {
            sectionHeader("12 APOSTLES = 12 MONTHS", subtitle: "The numbers in Christianity aren't arbitrary. They're astronomical. 12 disciples. 4 gospels. 3 days dead. All solar math.")
            
            expandableCard(
                id: "twelve",
                emoji: "🔢",
                title: "12 Apostles = 12 Zodiac Signs = 12 Months",
                subtitle: "The number 12 is the sun's number",
                content: "The sun passes through 12 constellations (zodiac signs) each year. There are 12 months in a year. There are roughly 12 hours of daylight.\n\nJesus had 12 apostles. Mithra had 12 companions. Horus had 12 followers. Buddha had 12 disciples. The pattern is universal because the number is astronomical, not historical.\n\nAt the Last Supper, the 12 apostles are depicted in groups of THREE — representing the three months in each season: 3 for spring, 3 for summer, 3 for fall, 3 for winter. The sun (Jesus) sits in the CENTER.\n\nLeonardo da Vinci's 'Last Supper' literally shows this arrangement. The 12 around the sun. The zodiac. Painted on a church wall.",
                detail: "The 12 tribes of Israel. The 12 Olympians. The 12 Knights of the Round Table. The 12 days of Christmas. The number 12 recurs in mythology because it's the sun's number — the number of divisions in the solar year. It's not mystical. It's math.",
                color: .cyan
            )
            
            expandableCard(
                id: "four_gospels",
                emoji: "📖",
                title: "4 Gospels = 4 Seasons",
                subtitle: "Matthew, Mark, Luke, John",
                content: "There are FOUR canonical gospels: Matthew, Mark, Luke, and John.\n\nThere are FOUR seasons: Spring, Summer, Fall, Winter.\n\nThere are FOUR cardinal directions: North, South, East, West.\n\nThe cross has FOUR arms — representing these four divisions.\n\nIn early Christian art, the four gospels are represented by four symbols: a man (Aquarius), a lion (Leo), an ox/bull (Taurus), and an eagle (Scorpio — in ancient astrology, the eagle was the higher form of Scorpio). These are the FOUR FIXED SIGNS of the zodiac — the signs that mark the midpoint of each season.\n\nThe four gospels ARE the four seasons. The symbols prove it. The astrology is embedded in the scripture.",
                detail: "Ezekiel 1:10 describes four living creatures with faces of a man, lion, ox, and eagle — the same four fixed zodiac signs, written centuries before the gospels. Revelation 4:7 repeats the same four creatures around God's throne. The zodiac isn't hidden in the Bible — it's a central architectural element.",
                color: .green
            )
            
            expandableCard(
                id: "three_days",
                emoji: "3️⃣",
                title: "3 Days Dead = Winter Solstice",
                subtitle: "December 22, 23, 24 → 'Born again' December 25",
                content: "Jesus dies and is resurrected after THREE DAYS.\n\nOn December 22nd (winter solstice), the sun reaches its lowest point in the sky. For three days — December 22, 23, and 24 — it appears to 'stand still.' It neither moves further south nor begins to return north. The sun is 'dead' for three days.\n\nOn December 25th, the sun begins its journey north again — days start getting longer. The sun is 'born again.' This is why December 25th is celebrated as the birthday of Mithra, Sol Invictus, Horus, Tammuz, and dozens of other sun gods — LONG before it was assigned to Jesus.\n\nThree days dead. Born again. On December 25th. The story was written in the sky before any human wrote it in a book.",
                detail: "The early Christian church did NOT celebrate Christmas. Jesus' birthday is never mentioned in the Bible. December 25th was assigned in the 4th century by Emperor Constantine — who was himself a sun worshiper (Sol Invictus) before converting to Christianity. He placed Jesus' birthday on the existing sun god's birthday. The merge was deliberate.",
                color: .red
            )
            
            expandableCard(
                id: "easter",
                emoji: "🐣",
                title: "Easter = Spring Equinox",
                subtitle: "The sun conquers darkness",
                content: "Easter — the resurrection — occurs at the spring equinox (around March 20-21). This is when day and night are equal, and from this point, the days become LONGER than the nights.\n\nThe sun 'conquers' darkness. Light wins over dark. Life returns after the 'death' of winter. Crops can be planted. Animals give birth. The world is 'resurrected.'\n\nEaster is calculated using the MOON (first Sunday after the first full moon after the spring equinox) — an explicitly astronomical calculation. The holiest day in Christianity is determined by celestial mechanics, not by historical dating.\n\nEggs = new life. Rabbits = fertility. Spring flowers = resurrection of the earth. None of these symbols are Christian. They are all spring equinox / fertility celebration symbols from pagan traditions thousands of years older.",
                detail: "The word 'Easter' derives from 'Eostre' or 'Ishtar' — pagan goddesses of spring, dawn, and fertility. Sunrise services on Easter morning — facing EAST to watch the sun RISE. They're literally watching the sun rise and calling it the resurrection. The service itself tells you what's happening.",
                color: .pink
            )
            
            expandableCard(
                id: "sunday",
                emoji: "📅",
                title: "Church on SUNday",
                subtitle: "The day of the sun",
                content: "Christians worship on SUNDAY. Not Monday (Moon-day). Not Saturday (Saturn-day). SUN-day. The day of the SUN.\n\nThe seven days of the week are named after celestial bodies:\n\nSunday = Sun\nMonday = Moon\nTuesday = Mars (Tyr)\nWednesday = Mercury (Woden)\nThursday = Jupiter (Thor)\nFriday = Venus (Frigg)\nSaturday = Saturn\n\nChristians worship their sun god on the day named after the sun. The earliest Christians (Jewish followers of Jesus) worshiped on Saturday (the Sabbath). The switch to Sunday was made by the Roman Empire — which worshiped Sol Invictus (the Unconquered Sun) on Sunday.\n\nConstantine's edict of 321 AD made Sunday the official day of rest. A sun worshiper made the sun's day the holy day. And billions have followed ever since.",
                detail: "In Spanish, Sunday is 'Domingo' — from Latin 'Dominus' (Lord). But in many languages, the sun connection is explicit: German 'Sonntag' (Sun-day), Dutch 'Zondag' (Sun-day). The day itself tells you who you're worshiping.",
                color: .orange
            )
            
            insightCard(
                "THE SOLAR CALENDAR IN SCRIPTURE",
                "12 apostles = 12 months. 4 gospels = 4 seasons. 3 days dead = winter solstice. Easter = spring equinox. Worship on SUNday.\n\nThe entire Christian calendar is a solar calendar with names changed. The math is astronomical. The holidays align with celestial events. The numbers match the zodiac.\n\nThis isn't conspiracy. It's astronomy. Written in the stars before anyone wrote it in a book.",
                color: .cyan
            )
        }
    }
    
    // MARK: - ═══════════════════════════════════════════════
    // TAB 6: THE PATTERN
    // ═══════════════════════════════════════════════════════
    
    private var thePatternTab: some View {
        VStack(spacing: 12) {
            sectionHeader("WHAT THIS MEANS", subtitle: "This is not anti-religion. This is anti-hiding-the-truth. Know what you're worshiping. Know where it came from. Make an INFORMED choice.")
            
            expandableCard(
                id: "not_anti",
                emoji: "🙏",
                title: "This Is NOT Anti-God",
                subtitle: "It's anti-hiding-the-truth",
                content: "The sun IS the source of all life on Earth. Without it, everything dies. In that sense, the ancients were RIGHT to revere it. The sun literally gives life, sustains life, and its absence means death.\n\nIf someone wants to worship the sun — or a personification of the sun — that's their right. The sun is worthy of reverence.\n\nThe problem isn't sun worship. The problem is sun worship DISGUISED as something else. The problem is an institution that took the oldest spiritual tradition on Earth, repackaged it, and used it to control billions of people — while hiding the origins.\n\nKnow what you worship. Know where it came from. Then choose freely.",
                detail: nil,
                color: .green
            )
            
            expandableCard(
                id: "institution",
                emoji: "🏛️",
                title: "The Institution Hid the Origins",
                subtitle: "Control requires ignorance",
                content: "The early Roman Church systematically destroyed pagan temples, burned libraries, banned solstice celebrations, and executed 'heretics' who maintained the old solar traditions.\n\nThen they adopted every single element of those traditions — the birthday (Dec 25), the resurrection (spring equinox), the halo (sun disc), the cross (zodiac), the communion (sun eating), the 12 disciples (zodiac signs) — and claimed they were NEW and UNIQUE to Christianity.\n\nThe goal was never spiritual. The goal was CONTROL. If people know they're worshiping the same sun that every civilization has always worshiped, they don't need a priest to mediate. They don't need an institution. They don't need to pay tithes.\n\nThe institution needs you to believe the story is unique. Because unique means you need THEM to access it.",
                detail: nil,
                color: .red
            )
            
            expandableCard(
                id: "sunflow_connection",
                emoji: "☀️",
                title: "Why SunFlow Is Named SunFlow",
                subtitle: "The sun flows. The truth flows. You flow.",
                content: "SunFlow isn't a coincidence.\n\nThe sun is the original source. The original truth. The original 'god' — not in a bearded-man-in-the-sky way, but in a this-is-literally-what-gives-you-life way.\n\nSun worship isn't primitive. It's accurate. The sun IS the source. Every ancient civilization knew this. Modern institutions hid it to sell you a middleman.\n\nSunFlow: Reignited is about removing the middleman. Going back to source. The sun flows. Truth flows. Consciousness flows. You don't need a priest, a pope, or a building to access what's been right above your head — every single day — since the beginning of time.\n\nThe sun rises every morning. Without asking for your faith. Without demanding your money. Without threatening you with hell.\n\nIt just gives. Every day. For free.\n\nThat's the real gospel.",
                detail: nil,
                color: Color(red: 1.0, green: 0.85, blue: 0.3)
            )
            
            insightCard(
                "THE FINAL TRUTH",
                "37 sun gods who died and were resurrected. Thousands of years before Christianity. The cross is the zodiac. The crown of thorns is the sun's corona. The monstrance IS a sun. The halo IS a sun disc. 12 apostles = 12 months. 'He is risen' = the sunrise.\n\nThey didn't lie about what they worship. They lied about what YOU'RE worshiping.\n\nNow you know. And once you know, you can't unknow.\n\nThat's awakening. That's SunFlow. ☀️",
                color: Color(red: 1.0, green: 0.85, blue: 0.3)
            )
            
            sourceCard("Sources: Jordan Maxwell — lectures on astrotheology; Kersey Graves — The World's Sixteen Crucified Saviors (1875); Gerald Massey — The Natural Genesis (1883); D.M. Murdock/Acharya S — The Christ Conspiracy (1999); Manly P. Hall — The Secret Teachings of All Ages (1928); Bill Donahue — Hidden Meanings; Sir James George Frazer — The Golden Bough (1890); Joseph Campbell — The Hero with a Thousand Faces (1949)")
        }
    }
    
    // MARK: - ═══════════════════════════════════════════════
    // SHARED COMPONENTS
    // ═══════════════════════════════════════════════════════
    
    private func sectionHeader(_ title: String, subtitle: String) -> some View {
        VStack(spacing: 6) {
            Text(title).font(.system(size: 12, weight: .black)).tracking(2).foregroundColor(.white.opacity(0.4))
            Text(subtitle).font(.system(size: 11, weight: .medium)).foregroundColor(.white.opacity(0.3)).multilineTextAlignment(.center)
        }
        .padding(.bottom, 4)
    }
    
    private func expandableCard(id: String, emoji: String, title: String, subtitle: String, content: String, detail: String?, color: Color) -> some View {
        VStack(alignment: .leading, spacing: 0) {
            Button {
                withAnimation(.easeInOut(duration: 0.2)) {
                    if expandedCards.contains(id) { expandedCards.remove(id) }
                    else { expandedCards.insert(id) }
                }
            } label: {
                HStack(spacing: 10) {
                    Text(emoji).font(.system(size: 20)).frame(width: 30)
                    VStack(alignment: .leading, spacing: 2) {
                        Text(title).font(.system(size: 13, weight: .bold)).foregroundColor(.white)
                        Text(subtitle).font(.system(size: 10, weight: .medium)).foregroundColor(.white.opacity(0.35))
                    }
                    Spacer()
                    Image(systemName: expandedCards.contains(id) ? "chevron.up" : "chevron.down")
                        .font(.system(size: 10)).foregroundColor(.white.opacity(0.2))
                }
                .padding(12)
            }
            
            if expandedCards.contains(id) {
                VStack(alignment: .leading, spacing: 10) {
                    Text(content).font(.system(size: 12, weight: .medium)).foregroundColor(.white.opacity(0.6)).lineSpacing(3)
                    
                    if let detail = detail {
                        Text(detail).font(.system(size: 11, weight: .medium)).foregroundColor(color.opacity(0.5)).lineSpacing(3)
                            .padding(10).frame(maxWidth: .infinity, alignment: .leading)
                            .background(RoundedRectangle(cornerRadius: 8).fill(color.opacity(0.03)))
                    }
                }
                .padding(.horizontal, 12).padding(.bottom, 12)
            }
        }
        .background(RoundedRectangle(cornerRadius: 12).fill(Color.white.opacity(0.02))
            .overlay(RoundedRectangle(cornerRadius: 12).stroke(color.opacity(0.06), lineWidth: 1)))
    }
    
    private func insightCard(_ title: String, _ text: String, color: Color) -> some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack(spacing: 6) {
                Image(systemName: "lightbulb.fill").font(.system(size: 11)).foregroundColor(color)
                Text(title).font(.system(size: 11, weight: .bold)).foregroundColor(color)
            }
            Text(text).font(.system(size: 12, weight: .medium)).foregroundColor(.white.opacity(0.6)).lineSpacing(3)
        }
        .padding(14).background(RoundedRectangle(cornerRadius: 12).fill(color.opacity(0.03))
            .overlay(RoundedRectangle(cornerRadius: 12).stroke(color.opacity(0.1), lineWidth: 1)))
    }
    
    private func sourceCard(_ text: String) -> some View {
        Text(text).font(.system(size: 9, weight: .medium)).foregroundColor(.white.opacity(0.15)).lineSpacing(2)
            .padding(10).background(RoundedRectangle(cornerRadius: 8).fill(Color.white.opacity(0.01)))
    }
}

// MARK: - ═══════════════════════════════════════════════════
// TAB ENUM
// ═══════════════════════════════════════════════════════════

enum SolarTab: String, CaseIterable {
    case sunGods = "Sun Gods"
    case crucified = "37 Saviors"
    case cross = "The Cross"
    case symbols = "In Plain Sight"
    case calendar = "The Numbers"
    case pattern = "The Pattern"
    
    var emoji: String {
        switch self {
        case .sunGods: return "☀️"
        case .crucified: return "✝️"
        case .cross: return "🔄"
        case .symbols: return "👁️"
        case .calendar: return "📅"
        case .pattern: return "🎯"
        }
    }
    
    var label: String { rawValue.uppercased() }
}

// MARK: - ═══════════════════════════════════════════════════
// SUN GOD DATABASE
// ═══════════════════════════════════════════════════════════

struct SolarSunGodEntry: Identifiable {
    let id: String
    let name: String
    let civilization: String
    let regionEmoji: String
    let description: String
    let detail: String?
    let color: Color
    
    static let allGods: [SolarSunGodEntry] = [
        .init(id: "ra", name: "Ra / Amun-Ra", civilization: "Ancient Egypt", regionEmoji: "🇪🇬", description: "The supreme sun god of Egypt. Ra sailed across the sky in a solar barque each day (sunrise to sunset) and traveled through the underworld at night, battling chaos serpent Apophis, to be reborn each morning. The pharaohs were considered sons of Ra.", detail: "Horus, another solar deity, wore the sun disc on his falcon head. The Eye of Ra was the sun itself. Egyptian religion was explicitly, openly sun worship.", color: .orange),
        .init(id: "helios", name: "Helios / Apollo", civilization: "Ancient Greece & Rome", regionEmoji: "🇬🇷", description: "Helios drove the sun chariot across the sky each day, pulled by four horses. Apollo was the god of light, truth, and prophecy. Both represented the sun's journey and power. Helios appears on the floor of a Jewish synagogue at Beit Alpha and inside the Vatican.", detail: "In Greek, 'Jesus' (Iesous) and 'Helios' share linguistic roots through solar symbolism. The sun god was worshiped across the Mediterranean for millennia before Christianity.", color: .yellow),
        .init(id: "mithra", name: "Mithra / Sol Invictus", civilization: "Roman Empire / Persia", regionEmoji: "🇮🇹", description: "Mithra was born on December 25th. Had 12 followers. Performed miracles. Died and was resurrected after 3 days. Was called 'the light of the world.' Sound familiar? Mithraism was Christianity's biggest competitor in Rome — same story, earlier date. Sol Invictus ('Unconquered Sun') was the official sun cult of Rome before Constantine merged it with Christianity.", detail: "Emperor Constantine worshiped Sol Invictus before his 'conversion.' He placed Jesus' birthday on Mithra's birthday (Dec 25). He made Sunday (dies Solis — day of the Sun) the holy day. He didn't convert from sun worship. He merged it.", color: .red),
        .init(id: "surya", name: "Surya", civilization: "Hindu / Vedic India", regionEmoji: "🇮🇳", description: "The Hindu sun god. Rides a chariot with seven horses across the sky (seven colors of the visible spectrum / seven days of the week). One of the most important Vedic deities. Surya Namaskar (Sun Salutation) is still practiced daily by millions in yoga.", detail: "Hinduism openly acknowledges the sun as divine. No pretense. No cover story. Just honest recognition that the sun is the source of life. The oldest living sun worship tradition on Earth.", color: .orange),
        .init(id: "krishna", name: "Krishna", civilization: "Hindu India", regionEmoji: "🇮🇳", description: "Krishna — the Christ of ancient India. Born of a virgin (Devaki). A tyrant king tried to kill him as a baby. Performed miracles. Had disciples. Was crucified (depicted 'crucified in space' with the solar radiance above him, per Sir Edward Moore's 'The Hindu Pantheon'). Was resurrected. Christ and Krishna — the linguistic and mythological parallels are undeniable.", detail: "The word 'Christ' and 'Krishna' share the same Proto-Indo-European root (*ghrei- meaning 'to anoint'). Same root. Same story. Same sun.", color: .purple),
        .init(id: "amaterasu", name: "Amaterasu", civilization: "Japan", regionEmoji: "🇯🇵", description: "The supreme sun goddess of Shinto. Japan's emperors claimed direct descent from her. Japan's name — 'Land of the Rising Sun' — and its flag (a red sun disc) are direct sun worship. The Imperial family maintained solar deity worship into the 20th century.", detail: "Japan's flag is literally the sun. The entire nation is organized around sun worship. It's the most honest national flag on Earth.", color: .red),
        .init(id: "huitzilopochtli", name: "Huitzilopochtli", civilization: "Aztec / Mesoamerica", regionEmoji: "🇲🇽", description: "The Aztec sun god and god of war. The Aztec sun stone is one of the most famous sun worship artifacts ever created. Mesoamerican civilizations built entire cities aligned to solar events. Temples were observatories. The sun was the center of everything.", detail: "The Maya, Inca, and Aztec ALL had sophisticated sun worship. The Inca called their sun god Inti and built Machu Picchu as a solar observatory. Sun worship across the Americas — independent of the Old World — because the pattern is universal.", color: .orange),
        .init(id: "inti", name: "Inti", civilization: "Inca / South America", regionEmoji: "🇵🇪", description: "The Inca sun god. The Inca emperor was considered the Son of the Sun (Sapa Inca). Worship included crawling on knees toward the sun. Cuzco's Coricancha (Temple of the Sun) was covered in gold to reflect sunlight. The Inca empire was a solar theocracy.", detail: "Sun worship in Peru predates the Inca by thousands of years. The Nazca lines, visible only from the sky, may have been offerings to the sun. Universal pattern, independent discovery.", color: .yellow),
        .init(id: "korean", name: "Hwanung / Dangun", civilization: "Korea", regionEmoji: "🇰🇷", description: "In Korean mythology, Hwanung descended from heaven (the sky/sun realm) to found civilization. His son Dangun founded the first Korean kingdom. The concept of heaven-sent rulers connected to the sun mirrors solar deity traditions worldwide.", detail: nil, color: .cyan),
        .init(id: "slavic", name: "Dazhbog / Svarog", civilization: "Slavic / Eastern Europe", regionEmoji: "🇺🇦", description: "Pre-Christian Slavic sun god. Dazhbog was the 'giving god' — the sun that gives light and life. Slavic peoples had robust sun worship traditions that were systematically destroyed after Christianization. The sun gods were replaced with saints, but the solstice celebrations survived as folk traditions.", detail: "Many Eastern European Christmas traditions (Yule log, caroling, feasting) are directly from pre-Christian solstice celebrations of the sun's return. The pagan tradition survived — just renamed.", color: .blue),
        .init(id: "native", name: "Wi / Tawa / Sun Father", civilization: "Native American", regionEmoji: "🏔️", description: "Across hundreds of Native American nations, the sun was central to spirituality. The Lakota called the sun Wi. The Hopi had Tawa (Sun Spirit). The Sun Dance ceremony — one of the most sacred Indigenous rituals — is direct sun worship. Native Americans understood: the sun gives life.", detail: "The children of the sun gods — that's how many Native American traditions describe their relationship with the sun. Not slaves of God. CHILDREN of the sun. A fundamentally different (and healthier) relationship with the divine.", color: .green),
        .init(id: "buddha", name: "Buddha", civilization: "Buddhist Tradition", regionEmoji: "☸️", description: "Buddha is consistently depicted with a sun disc (halo) behind his head. Buddhist temples orient toward the sun. The 'enlightenment' of Buddha is a solar metaphor — light conquering darkness, ignorance dispelled by illumination. Buddha and Jesus are depicted identically in many traditions: helping the sick, teaching followers, radiating light.", detail: "Both Jesus and Buddha: born miraculously, renounced worldly power, taught compassion, had followers, achieved transcendence, depicted with sun discs. Same archetype. Same sun.", color: .yellow),
    ]
}

// MARK: - ═══════════════════════════════════════════════════
// CRUCIFIED SAVIOR DATABASE
// ═══════════════════════════════════════════════════════════

struct CrucifiedSavior: Identifiable {
    let id: String
    let name: String
    let origin: String
    let approximateDate: String
    let regionEmoji: String
    let parallels: String
    let detail: String?
    let color: Color
    
    static let allSaviors: [CrucifiedSavior] = [
        .init(id: "krishna_c", name: "Krishna", origin: "India", approximateDate: "~3000 BCE", regionEmoji: "🇮🇳", parallels: "Born of a virgin (Devaki). Birth announced by a star. Tyrant king ordered massacre of infants. Performed miracles. Had disciples. Was crucified ('crucified in space'). Descended to hell. Resurrected. Ascended to heaven. Called 'Savior' and 'Redeemer.' Source: Hindu Pantheon, Sir Edward Moore.", detail: "Krishna's story predates Christianity by at least 2,000 years. The parallels are not coincidence — they're the same solar narrative applied to a different culture's personification of the sun.", color: .purple),
        .init(id: "horus_c", name: "Horus", origin: "Egypt", approximateDate: "~3000 BCE", regionEmoji: "🇪🇬", parallels: "Born of a virgin (Isis). Born on December 25th. Birth announced by a star in the east. Visited by three kings. Teacher at age 12. Baptized at 30. Had 12 followers. Performed miracles (walked on water, healed sick). Called 'the light,' 'the truth,' 'God's anointed son.' Crucified. Buried 3 days. Resurrected.", detail: "The Horus-Jesus parallels are extensively documented. Gerald Massey's 'The Natural Genesis' (1883) catalogs dozens of direct correspondences. The Egyptian origins of Christianity are traceable through specific iconography, terminology, and narrative structure.", color: .orange),
        .init(id: "mithra_c", name: "Mithra", origin: "Persia / Rome", approximateDate: "~1400 BCE", regionEmoji: "🇮🇷", parallels: "Born of a virgin on December 25th. Performed miracles. Had 12 companions. Promised eternal life to followers. Died and was resurrected after 3 days. Called 'the Light of the World.' Sunday was his sacred day. Had a sacred meal of bread and wine (communion). Was called 'the Way, the Truth, and the Life.'", detail: "Mithraism was so similar to Christianity that early Church fathers accused the devil of creating Mithra to confuse people. Justin Martyr (2nd century) literally wrote that the devil anticipated Christianity by creating Mithra first. That's how close the parallels are.", color: .red),
        .init(id: "dionysus_c", name: "Dionysus / Bacchus", origin: "Greece / Rome", approximateDate: "~1500 BCE", regionEmoji: "🇬🇷", parallels: "Born of a virgin (Semele). Son of Zeus (God the Father). Turned water into wine. Called 'King of Kings.' Died (torn apart) and was resurrected. Followers ate his flesh and drank his blood (communion of wine). Triumphal entry into cities. Called 'the Vine' ('I am the vine' — John 15:5).", detail: "The Gospel of John's 'I am the vine' statement is a direct Dionysian reference. The first miracle of Jesus (water into wine at Cana) is Dionysus's signature miracle. The wine-blood connection is explicitly Dionysian. The author of John's gospel knew exactly what tradition they were drawing from.", color: .purple),
        .init(id: "attis_c", name: "Attis", origin: "Phrygia (Turkey)", approximateDate: "~1200 BCE", regionEmoji: "🇹🇷", parallels: "Born of a virgin (Nana). Born on December 25th. Called 'the Good Shepherd.' Died (on a tree/cross). Was buried. Rose from the dead after 3 days. His resurrection was celebrated at the spring equinox (Easter). Followers ate a sacred meal in his memory.", detail: "Attis worship was widespread in Rome before Christianity. His death-and-resurrection festival was celebrated on the EXACT dates that became Good Friday through Easter Sunday. The church didn't replace Attis — it absorbed him.", color: .green),
        .init(id: "osiris_c", name: "Osiris", origin: "Egypt", approximateDate: "~2400 BCE", regionEmoji: "🇪🇬", parallels: "God-king who was killed (by Set/darkness). Body dismembered (death). Reassembled and resurrected by Isis. Became lord of the afterlife. Offered eternal life to followers. His resurrection symbolized the annual flooding of the Nile (life returning to the land).", detail: "The Osiris-Isis-Horus trinity predates the Christian trinity by thousands of years. Father (Osiris), Mother (Isis), Son (Horus). The Holy Family is the Egyptian Holy Family with names changed.", color: .orange),
        .init(id: "tammuz_c", name: "Tammuz", origin: "Mesopotamia / Babylon", approximateDate: "~2000 BCE", regionEmoji: "🇮🇶", parallels: "Shepherd god. Born on December 25th. Died and descended to the underworld. Resurrected after 3 days. His death was mourned by women (compare: women at the cross/tomb of Jesus). Mentioned in the Bible itself — Ezekiel 8:14 describes women 'weeping for Tammuz' at the temple.", detail: "The Bible NAMES Tammuz. Ezekiel saw women weeping for this dying-and-rising god AT the Jewish temple. The tradition was IN Judaism before Christianity existed. The dying god narrative was already present in the religion Jesus emerged from.", color: .cyan),
        .init(id: "isus_c", name: "Hesus / Esus", origin: "Celtic Druids", approximateDate: "~500 BCE", regionEmoji: "🇮🇪", parallels: "The Celtic Druidic god. Name: Hesus (later spelled Esus or Isus). Depicted dying on a cross/tree with a sun disc behind him. The word 'Jesus' in Celtic Druidic tradition predates Christianity. Druidic crosses with sun circles are found across Ireland and Britain.", detail: "The name 'Jesus' was not unique to Christianity. A Celtic god with nearly the same name, depicted on a cross with a sun, existed centuries before the Christian era. The name was borrowed along with the symbol.", color: .green),
        .init(id: "quetzalcoatl_c", name: "Quetzalcoatl", origin: "Aztec / Mesoamerica", approximateDate: "~1000 BCE", regionEmoji: "🇲🇽", parallels: "The 'feathered serpent.' Born of a virgin. Associated with the morning star (Venus = light bringer). Died/sacrificed himself. Promised to return. Called 'Lord of the Dawn.' Taught wisdom and opposed human sacrifice. Was betrayed and departed, promising to come back.", detail: "When Spanish conquistadors arrived, some Indigenous peoples initially wondered if Quetzalcoatl had returned — because the prophecy of a returning god was already in place. The dying-and-returning god archetype existed in the Americas independently of the Old World. Same pattern. Different continent.", color: .red),
    ]
}
