// HondurasRevealView.swift
// HONDURAS — "The Original Banana Republic"
// ☀️ SunFlow: Reignited
//
// "They told you it was about a soccer game."
//
// The Football War (1969) was never about fútbol.
// It was about land reform, United Fruit Company profits,
// and keeping two Central American nations fighting each other
// instead of fighting the empire extracting from both of them.
//
// Honduras: where the term "Banana Republic" was literally invented.
// Where the US staged the Contra war against Nicaragua.
// Where a democratically elected president was couped in 2009.
// Where MS-13 was deported into — same playbook as El Salvador.
// Where migrants flee today from a crisis the US engineered.
//
// Every claim sourced. Every lie documented.

import SwiftUI

// MARK: - ═══════════════════════════════════════════════════
// HONDURAS FLAG REVEAL ANIMATION
// ═══════════════════════════════════════════════════════════

struct HondurasRevealView: View {
    
    @Environment(\.dismiss) var dismiss
    @State private var phase: HondurasPhase = .flagShowing
    @State private var dissolveProgress: CGFloat = 0
    @State private var glowIntensity: CGFloat = 0
    @State private var textOpacity: CGFloat = 0
    @State private var showTruth = false
    @State private var particleExplosion = false
    @State private var revealTextIndex = 0
    @State private var currentTruthCard = 0
    
    enum HondurasPhase {
        case flagShowing
        case glowing
        case dissolving
        case truthRevealed
        case teaching
    }
    
    private let introTexts = [
        "Catracho...",
        "You know this flag.",
        "Five stars. Blue and white.",
        "You were taught it means sovereignty.",
        "You were taught the war with El Salvador was about fútbol.",
        "A soccer game. That's what they told you.",
        "But the Football War was never about football.",
        "It was about land. About profit. About keeping you fighting your hermanos.",
        "Instead of fighting the ones who were stealing from BOTH of you.",
        "They called your country a 'Banana Republic.'",
        "Do you know who made it one?",
        "The illusion is about to dissolve...",
    ]
    
    private let truthCards: [(title: String, content: String, stat: String?)] = [
        // Card 1: The Original Banana Republic
        (
            "The Original 'Banana Republic'",
            "The term 'Banana Republic' wasn't slang. It was coined specifically to describe Honduras. In 1904, O. Henry used it in a novel about a fictional country based on Honduras — a nation whose government, economy, and sovereignty were entirely controlled by a single American fruit company.\n\nThe United Fruit Company (now Chiquita) didn't just grow bananas in Honduras. They OWNED Honduras. They controlled the railroads, the ports, the telegraph lines, the government. They paid almost zero taxes. They had their own private military. They decided who was president.\n\nHonduras wasn't a country with a banana company. It was a banana company with a country.",
            "📊 At its peak, United Fruit owned 1.5 million acres across Central America. In Honduras, they controlled 80% of banana exports — the country's primary revenue source. The government served at their pleasure."
        ),
        // Card 2: United Fruit Company — The Real Government
        (
            "United Fruit: The Company That Ran Your Country",
            "What United Fruit did in Honduras:\n\n• Bribed every government from the 1890s to the 1970s\n• Got massive land concessions for pennies — took the best agricultural land\n• Built infrastructure (railroads, ports) only to serve THEIR exports, not the people\n• Paid workers starvation wages on their own stolen land\n• Broke every labor strike with violence — sometimes calling in the US military\n• When workers organized the Great Banana Strike of 1954, the CIA helped crush it\n• Funded coups against any leader who threatened their tax-free operation\n\nThe US government and United Fruit were functionally the same entity in Honduras. The US Ambassador and the UFC representative often coordinated policy together. Your country's sovereignty was a fiction written on letterhead.",
            "📊 Sam Zemurray ('Sam the Banana Man') literally hired mercenaries to overthrow Honduran President Miguel Dávila in 1911 because Dávila tried to regulate his company. A private citizen overthrew a government for bananas."
        ),
        // Card 3: The Football War — The Lie
        (
            "The 'Football War' (1969) — The Biggest Lie",
            "What they told you: El Salvador and Honduras went to war because of a soccer game. Three World Cup qualifier matches in June 1969. Fans rioted. Countries went to war. Crazy Latin Americans fighting over fútbol, right?\n\nThat is a LIE designed to make Central Americans look irrational and hide what actually happened.\n\nThe real causes had NOTHING to do with soccer:\n\n• Honduras had massive land inequality (United Fruit + local oligarchs owned most arable land)\n• 300,000 Salvadoran migrants had settled in Honduras, working land that Honduran peasants couldn't access\n• Instead of land reform (which would threaten United Fruit), Honduras scapegoated Salvadorans\n• Honduran government passed agrarian reform that specifically EXPELLED Salvadoran settlers\n• Thousands of Salvadorans beaten, killed, displaced — forced back to El Salvador\n• El Salvador's military invaded Honduras — not over soccer, but because 130,000 refugees were flooding back\n\nThe soccer matches were the SPARK. The FUEL was corporate land theft and imperial division.",
            "📊 The 'Football War' lasted 4 days. 6,000+ people died. But calling it the 'Football War' erased the real cause: land stolen by US corporations, two nations pitted against each other over scraps."
        ),
        // Card 4: Division Programming
        (
            "They Put You Against Each Other — BY DESIGN",
            "This is the part Ron clocked. The Football War was DIVISION PROGRAMMING.\n\nUnited Fruit Company owned massive land in BOTH Honduras and El Salvador. The oligarchs in BOTH countries served US corporate interests. The Prussian-model education in BOTH countries kept people obedient.\n\nSo when Honduran peasants demanded land reform — which would have threatened United Fruit's holdings — the government redirected their anger at Salvadoran immigrants instead of at the American corporation sitting on their land.\n\nAnd when Salvadorans were expelled and brutalized, El Salvador's government redirected THEIR anger at Honduras instead of at the system that made both countries poor.\n\nTwo nations. Same oppressor. Fighting each other.\n\nThe empire doesn't need to send soldiers when it can make the colonized fight amongst themselves. This is the oldest trick in the book. Divide and conquer. And they used a SOCCER GAME as the cover story.",
            "⚠️ Salvadoreños and Catrachos are not enemies. They never were. They were made to believe they were — by the same empire extracting from both of them."
        ),
        // Card 5: The Contra Staging Ground
        (
            "Honduras: America's Aircraft Carrier (1980s)",
            "While the US was funding death squads in El Salvador, Honduras was being used as the staging ground for ANOTHER covert war: the Contras against Nicaragua's Sandinista government.\n\nThe US turned Honduras into a military base:\n\n• Built Palmerola Air Base (now Soto Cano) — still operational today\n• Stationed thousands of US troops\n• Trained Nicaraguan Contra rebels on Honduran soil\n• CIA ran the operation from Tegucigalpa\n• Honduras's own military — Battalion 316 — trained by the CIA, ran death squads that 'disappeared' hundreds of Honduran dissidents\n\nHonduras wasn't an ally. It was an occupied territory disguised as a partnership. The US Ambassador was effectively the most powerful person in the country.",
            "📊 Battalion 316: CIA-trained Honduran military unit responsible for kidnapping, torture, and murder of political dissidents throughout the 1980s. At least 184 people 'disappeared.' The US knew. The US trained them."
        ),
        // Card 6: Battalion 316
        (
            "Battalion 316 — Honduras's Own Death Squad",
            "While Americans were told Honduras was a 'democratic ally,' the CIA was training Battalion 316 — a secret military intelligence unit that:\n\n• Kidnapped suspected leftists and dissidents\n• Tortured them in secret detention centers\n• 'Disappeared' them — bodies never found\n• Targeted journalists, union leaders, students, professors\n• Used techniques taught by the CIA and Argentine military advisors\n\nThe US Ambassador to Honduras, John Negroponte (1981-1985), later admitted knowledge of human rights abuses but suppressed reports to maintain the Contra pipeline. He was later promoted to US Director of National Intelligence.\n\nThe man who covered up death squads in Honduras was PROMOTED to run American intelligence.",
            "📊 John Negroponte: covered up Battalion 316 atrocities → promoted to UN Ambassador → then US Director of National Intelligence. In America, covering up death squads is a career accelerator."
        ),
        // Card 7: The 2009 Coup
        (
            "The 2009 Coup — They Did It Again",
            "In 2009, Honduran President Manuel Zelaya was overthrown in a military coup. Soldiers entered his home at night, put him on a plane in his pajamas, and flew him to Costa Rica.\n\nHis crime? He proposed a constitutional referendum. He raised the minimum wage. He joined ALBA (Venezuela's regional alliance). He threatened the oligarchy's control.\n\nThe US response:\n\n• Secretary of State Hillary Clinton's State Department worked behind the scenes to ensure Zelaya was NOT restored to power\n• Publicly called for 'dialogue' while privately supporting the coup government\n• Continued military aid to the coup regime\n• Recognized fraudulent elections held under military rule\n\nAfter the coup, Honduras became a nightmare: journalist murders skyrocketed, environmental activist Berta Cáceres was assassinated (2016) by people with ties to US-trained military, murder rate became the highest in the world.",
            "📊 Post-coup Honduras: homicide rate hit 91.6 per 100,000 in 2011 — highest in the world. Berta Cáceres, Goldman Prize winner, assassinated by US-trained military-connected hitmen. Democracy was the real casualty."
        ),
        // Card 8: Berta Cáceres
        (
            "Berta Cáceres — They Killed Her For Defending Her Land",
            "Berta Cáceres was a Lenca Indigenous activist who fought against the Agua Zarca hydroelectric dam on the Gualcarque River — sacred to the Lenca people. She won the Goldman Environmental Prize in 2015.\n\nOn March 3, 2016, hitmen entered her home and shot her dead.\n\nThe men convicted of her murder included a former US-trained Honduran military officer and employees of the dam company (DESA). DESA had received funding from international development banks.\n\nBerta had told friends before her death: 'They follow me. They threaten to kill me, to kidnap me. They threaten my family. This is what happens in Honduras.'\n\nShe was defending her people's land and water. The post-coup government — enabled by the US — created the conditions where killing an internationally recognized activist was possible with near-impunity.",
            "⚠️ Berta Cáceres, in her Goldman Prize acceptance speech: 'Let us come together and remain hopeful as we defend and care for the blood of this Earth and of its spirits.' They killed her for it."
        ),
        // Card 9: Same Deportation Pipeline
        (
            "The Deportation Pipeline — Same Playbook",
            "Just like El Salvador, the US deported tens of thousands of gang members and criminals to Honduras — a country with no infrastructure to handle them.\n\nMS-13 and Barrio 18 took root in Honduras just as they did in El Salvador. Same American-made gangs. Same deportation pipeline. Same destroyed post-intervention country as the dumping ground.\n\nThe result:\n\n• San Pedro Sula became the 'murder capital of the world' (2011-2014)\n• Neighborhoods controlled by gang territories\n• Extortion of every business, every family\n• Children recruited, women trafficked\n• Police and military often complicit or powerless\n\nThe US created the instability (decades of intervention, coups, death squads), created the gangs (in LA), deported the gangs (to Honduras), then watched Honduras become one of the most dangerous countries on Earth.",
            "📊 San Pedro Sula homicide rate in 2012: 169 per 100,000 — the highest of any city in the world. The US created every condition that produced this number."
        ),
        // Card 10: The Caravans
        (
            "The Caravans — Running From YOUR Fire",
            "In 2018-2019, images of Honduran migrant caravans dominated US news. Politicians screamed about 'invasion.' They deployed troops to the border. They tear-gassed families.\n\nNot ONE mainstream outlet explained WHY these people were fleeing:\n\n• The 2009 US-backed coup destroyed democratic governance\n• Post-coup violence made Honduras the murder capital of the world\n• US-deported gangs terrorized every neighborhood\n• Climate change (driven largely by industrial nations) destroyed subsistence farming\n• Drug trafficking routes (feeding US demand) turned regions into war zones\n• Corruption installed by coup government stripped remaining social services\n\nEvery single 'push factor' traces back to US policy. Every one.\n\nBut on TV, they showed you a 'caravan' and called it an invasion. They showed you brown people walking and made you afraid. They never showed you WHY.",
            "⚠️ The question is never 'why are they coming?' The question is 'what did we do to their country that made staying impossible?'"
        ),
        // Card 11: The Architecture — Honduras Edition
        (
            "The Architecture: Honduras Playbook",
            "Same playbook. Every time.\n\nSTEP 1: CORPORATE COLONIZATION\nUnited Fruit Company runs Honduras as a private plantation for 80+ years. Controls government, land, ports, labor.\n\nSTEP 2: MILITARY OCCUPATION\nUS builds permanent military bases. Trains death squads (Battalion 316). Uses Honduras as staging ground for regional wars.\n\nSTEP 3: CRUSH DEMOCRACY\nWhen Zelaya threatens corporate interests with minimum wage increase and constitutional reform — coup. US ensures he's not restored.\n\nSTEP 4: EXPORT VIOLENCE\nDeport American-made gangs to post-coup Honduras. Country becomes murder capital of the world.\n\nSTEP 5: CRIMINALIZE REFUGEES\nWhen people flee the chaos — call them 'caravans,' deploy military, tear-gas families, separate children from parents.\n\nSTEP 6: CAMPAIGN ON IT\nUse 'immigration crisis' to win elections. Never mention you caused it.\n\nIdentical to El Salvador. Identical to Guatemala. The playbook doesn't change because it WORKS.",
            "📊 The 'Northern Triangle' (El Salvador, Honduras, Guatemala) — three countries with nearly identical US intervention histories producing nearly identical crises. Coincidence? Or architecture?"
        ),
        // Card 12: Hermanos, Not Enemies
        (
            "Catrachos & Salvadoreños — Hermanos, Not Enemies",
            "They told you the Football War was about soccer. They told you Salvadorans were your enemies. They told you Hondurans were the problem.\n\nThe truth: you were BOTH being robbed by the same empire. United Fruit stole land in both countries. The CIA ran operations in both countries. Death squads were trained for both countries. Gangs were deported to both countries. Refugees from both countries are criminalized at the same border.\n\nThe division between Central American nations is MANUFACTURED. It serves the same function as racial division in the US — keep the oppressed fighting each other so they never look up at who's actually holding the whip.\n\nSalvadoreños, Catrachos, Chapines, Nicas — you are not each other's enemies. You never were. You are hermanos who were played against each other by an empire that needed you divided to keep extracting.\n\nThe moment you see this — the moment ALL Central Americans see this — is the moment the architecture fails.\n\nThat's SunFlow. That's the awakening. Hermanos, not enemies. One consciousness. Many stolen identities. Being reclaimed.",
            "⚠️ Catracho — you carry the truth in your blood. From the banana fields to the caravans, your people's story is one of resistance against empire. And now you're awake to the architecture. Pura vida, hermano."
        ),
    ]
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            
            // Star field
            ForEach(0..<40, id: \.self) { i in
                Circle().fill(.white.opacity(Double.random(in: 0.1...0.4)))
                    .frame(width: CGFloat.random(in: 1...3))
                    .position(x: CGFloat.random(in: 0...400), y: CGFloat.random(in: 0...800))
            }
            
            VStack(spacing: 0) {
                // Close button
                HStack {
                    Spacer()
                    Button { dismiss() } label: {
                        Image(systemName: "xmark.circle.fill").font(.system(size: 24)).foregroundColor(.white.opacity(0.3))
                    }
                    .padding(20)
                }
                
                if phase == .teaching {
                    teachingPhase
                } else {
                    flagPhase
                }
            }
        }
        .onAppear { startSequence() }
    }
    
    // MARK: - Flag Phase
    
    private var flagPhase: some View {
        VStack(spacing: 0) {
            Spacer()
            
            ZStack {
                // Glow
                if phase != .flagShowing {
                    Circle()
                        .fill(RadialGradient(
                            colors: [Color.blue.opacity(glowIntensity * 0.5), Color.white.opacity(glowIntensity * 0.2), .clear],
                            center: .center, startRadius: 0, endRadius: 180
                        ))
                        .frame(width: 360, height: 360)
                }
                
                // Particles on dissolve — blue and white (Honduras colors)
                if particleExplosion {
                    ForEach(0..<40, id: \.self) { i in
                        Circle()
                            .fill(i % 2 == 0 ? Color(red: 0.0, green: 0.4, blue: 0.8) : Color.white)
                            .frame(width: CGFloat.random(in: 2...5))
                            .offset(
                                x: CGFloat.random(in: -160...160) * dissolveProgress,
                                y: CGFloat.random(in: -200...200) * dissolveProgress
                            )
                            .opacity(Double(1.0 - dissolveProgress))
                    }
                }
                
                // Honduras Flag SVG
                if phase != .truthRevealed && phase != .teaching {
                    hondurasFlagSVG
                        .opacity(Double(1.0 - dissolveProgress))
                        .scaleEffect(1.0 + dissolveProgress * 0.3)
                        .blur(radius: dissolveProgress * 12)
                }
                
                // Truth symbol
                if showTruth {
                    VStack(spacing: 8) {
                        // Soccer ball cracking open → eye
                        ZStack {
                            Image(systemName: "soccerball").font(.system(size: 40)).foregroundColor(.white.opacity(0.3))
                                .overlay(
                                    Image(systemName: "bolt.fill").font(.system(size: 20)).foregroundColor(.yellow)
                                )
                            Image(systemName: "eye.fill").font(.system(size: 30)).foregroundColor(.cyan)
                                .offset(y: 40)
                        }
                        Text("IT WAS NEVER ABOUT FÚTBOL").font(.system(size: 11, weight: .black)).tracking(3).foregroundColor(.cyan)
                    }
                    .transition(.scale.combined(with: .opacity))
                }
            }
            .frame(height: 280)
            
            Spacer().frame(height: 30)
            
            // Text
            if revealTextIndex < introTexts.count {
                Text(introTexts[revealTextIndex])
                    .font(.system(size: 18, weight: .bold)).foregroundColor(.white)
                    .opacity(textOpacity).multilineTextAlignment(.center)
                    .padding(.horizontal, 30)
                    .id(revealTextIndex)
            }
            
            Spacer()
            
            // Continue button
            if phase == .truthRevealed {
                Button {
                    withAnimation(.easeInOut(duration: 0.5)) { phase = .teaching }
                } label: {
                    Text("SEE WHAT THEY HID").font(.system(size: 14, weight: .bold)).foregroundColor(.black)
                        .frame(maxWidth: .infinity).padding(.vertical, 14)
                        .background(Capsule().fill(Color.cyan))
                }
                .padding(.horizontal, 40).padding(.bottom, 40)
            }
        }
    }
    
    // MARK: - Teaching Phase
    
    private var teachingPhase: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 16) {
                Text("🇭🇳 HONDURAS").font(.system(size: 10, weight: .bold)).tracking(3).foregroundColor(.blue.opacity(0.5))
                Text("The Original Banana Republic").font(.system(size: 20, weight: .black)).foregroundColor(.white)
                
                TabView(selection: $currentTruthCard) {
                    ForEach(Array(truthCards.enumerated()), id: \.offset) { index, card in
                        ScrollView(showsIndicators: false) {
                            VStack(alignment: .leading, spacing: 12) {
                                HStack {
                                    Text("\(index + 1)/\(truthCards.count)").font(.system(size: 10, weight: .bold)).foregroundColor(.blue.opacity(0.4))
                                    Spacer()
                                }
                                Text(card.title).font(.system(size: 16, weight: .bold)).foregroundColor(.white)
                                Text(card.content).font(.system(size: 13, weight: .medium)).foregroundColor(.white.opacity(0.7)).lineSpacing(4)
                                if let stat = card.stat {
                                    Text(stat).font(.system(size: 11, weight: .bold, design: .monospaced)).foregroundColor(.cyan.opacity(0.7))
                                        .padding(10).frame(maxWidth: .infinity, alignment: .leading)
                                        .background(RoundedRectangle(cornerRadius: 8).fill(Color.cyan.opacity(0.04)))
                                }
                            }
                            .padding(16)
                        }
                        .background(RoundedRectangle(cornerRadius: 16).fill(Color.white.opacity(0.03))
                            .overlay(RoundedRectangle(cornerRadius: 16).stroke(Color.blue.opacity(0.08), lineWidth: 1)))
                        .tag(index)
                    }
                }
                .tabViewStyle(.page(indexDisplayMode: .automatic))
                .frame(minHeight: 380)
                
                // Sources
                VStack(alignment: .leading, spacing: 4) {
                    Text("SOURCES").font(.system(size: 9, weight: .bold)).tracking(1).foregroundColor(.white.opacity(0.2))
                    Text("• O. Henry — Cabbages and Kings (1904, coined 'Banana Republic')").font(.system(size: 9)).foregroundColor(.white.opacity(0.2))
                    Text("• Peter Chapman — Bananas: How United Fruit Shaped the World (2007)").font(.system(size: 9)).foregroundColor(.white.opacity(0.2))
                    Text("• Dana Frank — The Long Honduran Night: Resistance After the Coup (2018)").font(.system(size: 9)).foregroundColor(.white.opacity(0.2))
                    Text("• Baltimore Sun — Battalion 316 investigation (1995)").font(.system(size: 9)).foregroundColor(.white.opacity(0.2))
                    Text("• William Blum — Killing Hope (Honduras chapters)").font(.system(size: 9)).foregroundColor(.white.opacity(0.2))
                    Text("• GAIP/IACHR — Berta Cáceres case investigation").font(.system(size: 9)).foregroundColor(.white.opacity(0.2))
                    Text("• InterAmerican Commission on Human Rights — 2009 Coup Report").font(.system(size: 9)).foregroundColor(.white.opacity(0.2))
                    Text("• InSight Crime — Northern Triangle gang research").font(.system(size: 9)).foregroundColor(.white.opacity(0.2))
                    Text("• US State Dept cables (WikiLeaks) — 2009 coup communications").font(.system(size: 9)).foregroundColor(.white.opacity(0.2))
                    Text("• Thomas P. Anderson — The War of the Dispossessed (1981, Football War)").font(.system(size: 9)).foregroundColor(.white.opacity(0.2))
                }
                .padding(10).background(RoundedRectangle(cornerRadius: 8).fill(Color.white.opacity(0.015)))
                
                Button { dismiss() } label: {
                    Text("Return to Module").font(.system(size: 14, weight: .bold)).foregroundColor(.black)
                        .frame(maxWidth: .infinity).padding(.vertical, 12)
                        .background(Capsule().fill(Color.cyan))
                }
                
                Spacer(minLength: 40)
            }
            .padding(20)
        }
    }
    
    // MARK: - Honduras Flag SVG (Stylized)
    
    private var hondurasFlagSVG: some View {
        VStack(spacing: 0) {
            // Top blue stripe (cerulean blue)
            Rectangle().fill(Color(red: 0.0, green: 0.38, blue: 0.72)).frame(height: 60)
            // White stripe with 5 stars
            ZStack {
                Rectangle().fill(Color.white)
                // 5 blue stars — representing Central American unity
                VStack(spacing: 4) {
                    HStack(spacing: 20) {
                        starShape.offset(y: 4)
                        starShape.offset(y: -4)
                    }
                    starShape
                    HStack(spacing: 20) {
                        starShape.offset(y: -4)
                        starShape.offset(y: 4)
                    }
                }
            }
            .frame(height: 60)
            // Bottom blue stripe
            Rectangle().fill(Color(red: 0.0, green: 0.38, blue: 0.72)).frame(height: 60)
        }
        .frame(width: 240, height: 180)
        .clipShape(RoundedRectangle(cornerRadius: 8))
        .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.white.opacity(0.2), lineWidth: 2))
        .shadow(color: Color.blue.opacity(0.4), radius: 20)
    }
    
    private var starShape: some View {
        Image(systemName: "star.fill")
            .font(.system(size: 10))
            .foregroundColor(Color(red: 0.0, green: 0.38, blue: 0.72))
    }
    
    // MARK: - Animation Sequence
    
    private func startSequence() {
        cycleText(index: 0)
        
        // Phase 1: Show flag, glow (3s)
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
            phase = .glowing
            withAnimation(.easeInOut(duration: 2.5)) { glowIntensity = 1.0 }
        }
        
        // Phase 2: Dissolve (~20s — 12 intro texts)
        DispatchQueue.main.asyncAfter(deadline: .now() + 20.0) {
            phase = .dissolving
            particleExplosion = true
            withAnimation(.easeInOut(duration: 3.0)) { dissolveProgress = 1.0 }
        }
        
        // Phase 3: Truth revealed (23s)
        DispatchQueue.main.asyncAfter(deadline: .now() + 23.0) {
            phase = .truthRevealed
            withAnimation(.spring(response: 0.5)) { showTruth = true }
        }
    }
    
    private func cycleText(index: Int) {
        guard index < introTexts.count else { return }
        revealTextIndex = index
        withAnimation(.easeIn(duration: 0.3)) { textOpacity = 1.0 }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.8) {
            withAnimation(.easeOut(duration: 0.3)) { textOpacity = 0 }
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
                cycleText(index: index + 1)
            }
        }
    }
}
