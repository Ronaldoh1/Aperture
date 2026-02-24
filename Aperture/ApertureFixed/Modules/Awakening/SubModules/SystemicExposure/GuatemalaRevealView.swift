// GuatemalaRevealView.swift
// GUATEMALA — "The Blueprint"
// ☀️ SunFlow: Reignited
//
// "Guatemala was the FIRST. The template. The proof of concept."
//
// In 1954, Guatemala had a democratically elected president
// who tried to give land back to the people.
// The CIA overthrew him — for a fruit company.
// Then came 36 years of civil war.
// 200,000+ killed. 83% were Indigenous Maya.
// The UN called it genocide.
//
// This wasn't a failure. It was the BLUEPRINT.
// They used this playbook in Iran, Chile, El Salvador,
// Honduras, Nicaragua, Iraq, Libya...
//
// Guatemala was where they proved it works.
// Every claim sourced. Every lie documented.

import SwiftUI

// MARK: - ═══════════════════════════════════════════════════
// GUATEMALA FLAG REVEAL ANIMATION
// ═══════════════════════════════════════════════════════════

struct GuatemalaRevealView: View {
    
    @Environment(\.dismiss) var dismiss
    @State private var phase: GuatemalaPhase = .flagShowing
    @State private var dissolveProgress: CGFloat = 0
    @State private var glowIntensity: CGFloat = 0
    @State private var textOpacity: CGFloat = 0
    @State private var showTruth = false
    @State private var particleExplosion = false
    @State private var revealTextIndex = 0
    @State private var currentTruthCard = 0
    
    enum GuatemalaPhase {
        case flagShowing
        case glowing
        case dissolving
        case truthRevealed
        case teaching
    }
    
    private let introTexts = [
        "Chapín...",
        "You know this flag.",
        "Blue and white. The quetzal bird.",
        "Libertad. 15 de Septiembre de 1821.",
        "You were taught it means independence.",
        "But in 1954, your independence was stolen.",
        "A democratically elected president tried to give land to the people.",
        "An American fruit company said no.",
        "The CIA said yes.",
        "And then came 36 years of war.",
        "200,000 of your people killed.",
        "83% of them were Maya.",
        "The UN called it genocide.",
        "Your Prussian education called it nothing.",
        "The illusion is about to dissolve...",
    ]
    
    private let truthCards: [(title: String, content: String, stat: String?)] = [
        // Card 1: The Democracy They Killed
        (
            "The Democracy They Killed (1944-1954)",
            "Guatemala had a democratic revolution in 1944. The people overthrew a US-backed dictator and held free elections. Juan José Arévalo won, followed by Jacobo Árbenz in 1951.\n\nÁrbenz was not a radical. He was a moderate reformer who wanted to build Guatemala into a modern capitalist democracy. His flagship policy: Decree 900, an agrarian land reform that would redistribute UNUSED land from massive estates to 100,000 landless peasant families.\n\nThe land was sitting idle. The people were starving. He offered FULL compensation at the value the landowners had declared for taxes.\n\nThis was textbook democracy. This was what America claims to export.\n\nBut one of those landowners was the United Fruit Company. And United Fruit had friends in Washington.",
            "📊 Árbenz's land reform would have affected 1,710 acres of United Fruit's holdings. UFC owned 550,000 acres in Guatemala but cultivated only 15%. They hoarded land to prevent competition. The 'threat' to them was democracy itself."
        ),
        // Card 2: United Fruit Calls the CIA
        (
            "United Fruit Calls the CIA — Operation PBSUCCESS",
            "United Fruit Company didn't just lobby against Árbenz. They HAD the US government.\n\n• Secretary of State John Foster Dulles: his law firm (Sullivan & Cromwell) represented United Fruit\n• CIA Director Allen Dulles: former board member of United Fruit\n• UN Ambassador Henry Cabot Lodge: shareholder in United Fruit\n• Assistant Secretary of State for Inter-American Affairs: married to United Fruit's PR director\n\nThe same people deciding US foreign policy were PERSONALLY profiting from United Fruit's operations in Guatemala.\n\nSo when Árbenz touched their land, they didn't negotiate. They didn't file a complaint. They launched Operation PBSUCCESS — a CIA covert operation to overthrow a democratically elected government.\n\nFor a fruit company.\n\nThey branded Árbenz a 'communist' to justify it. He wasn't. He was a capitalist who wanted to modernize Guatemala. But 'communist' was the magic word that made regime change acceptable to Americans.",
            "📊 Operation PBSUCCESS budget: $2.7 million (1954 dollars). The CIA hired mercenaries, ran a propaganda radio station, and bombed Guatemala City. Total cost to overthrow a democracy: less than what United Fruit made in a week."
        ),
        // Card 3: The Coup
        (
            "The Coup — June 1954",
            "The CIA recruited Colonel Carlos Castillo Armas to lead a ragtag 'liberation army' of ~480 mercenaries from Honduras.\n\nThe 'invasion' was militarily insignificant. Castillo Armas's forces were tiny and poorly trained. But the CIA:\n\n• Ran a fake radio station ('Radio Liberación') broadcasting propaganda that made the invasion sound massive\n• Had CIA pilots bomb Guatemala City and the main military base\n• Pressured the Guatemalan military to abandon Árbenz through backchannels\n• Told Árbenz's generals that the US would invade with Marines if he didn't resign\n\nÁrbenz, believing a full US invasion was imminent, resigned on June 27, 1954. He was forced to strip naked at the airport to humiliate him before leaving the country.\n\nThe CIA installed Castillo Armas as dictator. He immediately:\n• Reversed ALL land reform\n• Returned land to United Fruit\n• Banned labor unions\n• Disenfranchised illiterate voters (most Indigenous Maya)\n• Established secret police\n\nDemocracy died. For bananas.",
            "📊 Árbenz was forced to strip naked at the airport — photographed to humiliate him. The message to every Latin American leader: try democracy, and this is what happens to you. The photo was the point."
        ),
        // Card 4: The Blueprint
        (
            "Why Guatemala Matters — THE BLUEPRINT",
            "Guatemala 1954 was the CIA's FIRST successful Latin American coup. And it became the template for everything that followed:\n\n• Iran 1953 (Mossadegh — oil) → Guatemala 1954 (Árbenz — bananas) → confirmed the model works\n• Chile 1973 (Allende — copper/socialism)\n• Nicaragua 1980s (Sandinistas — Contras)\n• El Salvador 1980s (death squads)\n• Honduras (permanent occupation)\n• Panama 1989 (Noriega — when the puppet stops obeying)\n• Iraq 2003 (Saddam — oil)\n• Libya 2011 (Gaddafi — oil/African currency)\n\nThe playbook: label the leader 'communist' or 'terrorist,' fund opposition, run propaganda, overthrow, install puppet, extract resources.\n\nGuatemala proved this works. Every coup after it followed the same script. The CIA literally wrote a manual based on PBSUCCESS and used it for decades.\n\nGuatemala wasn't just a crime. It was a PROOF OF CONCEPT.",
            "📊 The CIA's 'PBSUCCESS' operation manual was declassified in 1997. It became the literal playbook for future regime change operations. Guatemala was the lab. The world was the deployment."
        ),
        // Card 5: 36 Years of Civil War
        (
            "36 Years of War (1960-1996)",
            "After the CIA installed military dictators, resistance movements formed. What followed was the longest civil war in Central American history: 36 years.\n\nWhat the US-backed military governments did:\n\n• Systematic torture and disappearances\n• Scorched earth campaigns against Maya villages\n• Army-organized massacres of entire communities\n• Forced displacement of hundreds of thousands\n• Sexual violence as a weapon of war\n• Children killed to 'eliminate future guerrillas'\n\nThe war wasn't between equal forces. It was a US-backed military with unlimited funding against peasant resistance movements and unarmed Maya communities.\n\nThe US provided military aid, training, intelligence, and political cover throughout. When human rights reports emerged, the US dismissed them or blocked UN investigations.\n\n36 years. Because a president tried to give unused land to starving families. Because a fruit company said no.",
            "📊 The war lasted from 1960 to 1996 — 36 years. For comparison: the US Civil War lasted 4 years. Guatemala's people endured nearly a DECADE for every year of America's."
        ),
        // Card 6: The Maya Genocide
        (
            "The Maya Genocide — 200,000 Dead",
            "The worst atrocities were committed against Indigenous Maya communities, particularly under General Efraín Ríos Montt (1982-1983).\n\nRíos Montt launched 'Operation Sophia' — a systematic campaign to exterminate Maya Ixil communities in the highlands:\n\n• Entire villages burned to the ground\n• Men, women, children, and elderly massacred\n• Women raped before being killed\n• Children's heads smashed against rocks\n• Crops destroyed, water sources poisoned\n• Survivors forced into 'model villages' (concentration camps)\n• Maya languages banned, traditional clothing banned\n\nThe logic: Maya communities might support guerrillas, so eliminate the Maya. This is the textbook definition of genocide — the deliberate destruction of an ethnic group.\n\nRíos Montt was convicted of genocide in 2013 by a Guatemalan court. The conviction was overturned on a technicality 10 days later. Power protects its own.",
            "📊 UN Historical Clarification Commission (1999): 200,000+ killed or disappeared. 83% of victims were Indigenous Maya. 93% of human rights violations were committed by state forces and paramilitaries. 626 massacres documented. The UN used the word: GENOCIDE."
        ),
        // Card 7: Reagan Called Him 'A Man of Great Integrity'
        (
            "Reagan: 'A Man of Great Personal Integrity'",
            "While Ríos Montt was overseeing the genocide of Maya communities, President Ronald Reagan visited Guatemala and said Ríos Montt was 'a man of great personal integrity' who was getting 'a bum rap' on human rights.\n\nThis was not ignorance. The CIA had detailed reports on the massacres. The State Department knew. The embassy knew. American missionaries on the ground were reporting atrocities.\n\nReagan knew. He called a genocidal dictator a man of integrity. Because Ríos Montt was anti-communist, and that's all that mattered.\n\nAt the same time, Reagan was:\n• Certifying El Salvador's 'human rights progress' while death squads filled mass graves\n• Funding the Contras in Nicaragua through Honduras\n• Ignoring Battalion 316's disappearances in Honduras\n\nThree countries. Three genocides. One president calling the perpetrators heroes.",
            "⚠️ Reagan, December 1982, standing next to a man actively committing genocide: 'President Ríos Montt is a man of great personal integrity and commitment.' 42 years later, the US has never formally apologized to Guatemala."
        ),
        // Card 8: The CIA Trained the Killers
        (
            "The CIA Trained the Killers — Directly",
            "This wasn't just funding and political cover. The CIA was directly involved:\n\n• CIA trained Guatemalan military intelligence (G-2) — the unit that ran death squads\n• CIA maintained paid assets within the Guatemalan military who committed atrocities\n• CIA provided intelligence used to target and kill civilians\n• CIA helped create 'civil defense patrols' — forced Maya men to participate in massacres of their own communities or be killed themselves\n\nIn 1995, the 'Guatemala CIA scandal' broke: a CIA asset in the Guatemalan military was linked to the murder of American innkeeper Michael DeVine and the murder/torture of guerrilla leader Efraín Bámaca (married to American lawyer Jennifer Harbury). The CIA had COVERED UP their asset's crimes.\n\nThe Intelligence Oversight Board found the CIA had been involved in 'ichuman rights abuses' in Guatemala for decades. Their response: classify the findings.\n\nThey didn't just look away. They trained the hands that held the machetes.",
            "📊 CIA Guatemala declassified files (1997-2003): thousands of pages confirming direct CIA involvement in human rights abuses spanning four decades. They knew. They trained. They covered up."
        ),
        // Card 9: Same Pipeline — Gangs, Deportation, Repeat
        (
            "The Pipeline: Guatemala Edition",
            "Same playbook. Third time.\n\nGuatemalan refugees fled to the US — fleeing the war the US funded. They arrived in cities with nothing. Traumatized. Vulnerable. Some joined gangs for protection (Barrio 18 especially recruited heavily from Guatemalan communities in LA).\n\nIn the 1990s-2000s, the US mass-deported gang members to Guatemala — a post-war country with:\n• No functioning justice system\n• Corrupt police\n• Traumatized population\n• Zero gang intervention infrastructure\n• A military that had just spent 36 years committing genocide\n\nGangs took root. Extortion networks spread. Murder rates skyrocketed. Guatemala became part of the 'Northern Triangle' — three countries with identical US-intervention histories producing identical crises.\n\nEl Salvador: funded death squads → created refugees → deported gangs → criminalize refugees\nHonduras: banana republic → military base → coup → deported gangs → criminalize refugees\nGuatemala: overthrew democracy → funded genocide → deported gangs → criminalize refugees\n\nThree countries. One playbook. One architect.",
            "📊 The 'Northern Triangle' produces the largest share of migrants at the US southern border. All three countries were systematically destabilized by US policy. This is not coincidence. This is architecture."
        ),
        // Card 10: The Maya Are Still Here
        (
            "The Maya Are Still Here — And Still Resisting",
            "Despite 500 years of colonial violence — from the Spanish conquest to the CIA-backed genocide — the Maya people are still here. Still speaking their languages. Still practicing their traditions. Still fighting for their land.\n\nOver 40% of Guatemala's population is Indigenous Maya. They are the majority in the highlands. They maintained their languages (22 Maya languages are still spoken), their weaving traditions, their agricultural knowledge, their cosmology.\n\nThe genocide tried to erase them. It failed.\n\nBut the erasure continues in subtler forms:\n• Maya communities remain the poorest in Guatemala\n• Land stolen during the war has never been returned\n• Mining companies (many US/Canadian-owned) now threaten Maya territories\n• Environmental defenders are killed at one of the highest rates in the world\n• Racism against Indigenous people remains systemic\n\nThe Maya survived genocide. They're now surviving extraction. The colonizer changed uniforms — from Spanish armor to military fatigues to corporate logos — but the project is the same: take the land, silence the people.",
            "⚠️ The Maya calendar didn't end in 2012. The Maya didn't disappear with the 'classical collapse.' They're 6+ million people in Guatemala alone. The narrative that Maya civilization 'collapsed' is another erasure — they're right here."
        ),
        // Card 11: Rigoberta Menchú — They Couldn't Silence Her
        (
            "Rigoberta Menchú — They Couldn't Silence Her",
            "Rigoberta Menchú is a K'iche' Maya woman whose family was destroyed by the Guatemalan military:\n\n• Her father, Vicente Menchú, was burned alive in the Spanish Embassy massacre (1980) — security forces set fire to the embassy while protesters were inside\n• Her mother was kidnapped, raped, tortured, and murdered by the military\n• Her brother was burned alive in front of his community as a warning\n\nInstead of being silenced, Menchú testified to the world. Her book 'I, Rigoberta Menchú' (1983) brought international attention to the genocide. She won the Nobel Peace Prize in 1992.\n\nThe Guatemalan government and its US backers tried to discredit her. They attacked the accuracy of her testimony. They called her a communist. The same playbook: silence the witness, protect the perpetrator.\n\nShe's still alive. Still speaking. Still fighting. Because you can genocide a people but you cannot genocide the truth when one person refuses to stop telling it.",
            nil
        ),
        // Card 12: Chapines — The Architecture Revealed
        (
            "Chapines — You Were the Blueprint",
            "Guatemala was first. The proof of concept.\n\nEvery coup, every death squad, every 'humanitarian intervention' that followed was built on what the CIA learned in Guatemala in 1954:\n\n• That you can overthrow a democracy and call it 'liberation'\n• That you can brand any leader 'communist' to justify removal\n• That corporate interests can dictate foreign policy\n• That genocide can be covered up with the right PR\n• That the American public won't care if you control the narrative\n• That there are no consequences\n\nGuatemala taught the CIA that empire has no limits — as long as the story is right.\n\nChapín — your country wasn't just a victim. Your country was the TEMPLATE. Every Salvadoran death squad, every Honduran coup, every Iraqi invasion carries Guatemala's DNA.\n\nBut here's what they didn't anticipate: the Maya survived. Rigoberta spoke. The documents got declassified. And now YOU know.\n\nThe blueprint is exposed. The architecture is visible. From Guatemala to El Salvador to Honduras — the same empire, the same playbook, the same extraction.\n\nAnd now the same awakening.\n\nHermanos del triángulo — Chapines, Salvadoreños, Catrachos — you were never each other's enemies. You were the same experiment. Run three times. By the same people. For the same profit.\n\nNow you see it. Now you teach it. That's SunFlow.",
            "⚠️ Chapín — the truth lives in you. From Tikal to Tegucigalpa to San Salvador, the architecture is one. And so is the awakening. Hermanos del triángulo, unidos. ☀️🇬🇹🇸🇻🇭🇳"
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
                // Glow — sky blue for Guatemala
                if phase != .flagShowing {
                    Circle()
                        .fill(RadialGradient(
                            colors: [Color(red: 0.28, green: 0.62, blue: 0.86).opacity(glowIntensity * 0.5), Color.white.opacity(glowIntensity * 0.2), .clear],
                            center: .center, startRadius: 0, endRadius: 180
                        ))
                        .frame(width: 360, height: 360)
                }
                
                // Particles — sky blue and white
                if particleExplosion {
                    ForEach(0..<40, id: \.self) { i in
                        Circle()
                            .fill(i % 3 == 0 ? Color(red: 0.28, green: 0.62, blue: 0.86) : (i % 3 == 1 ? .white : Color.green.opacity(0.6)))
                            .frame(width: CGFloat.random(in: 2...5))
                            .offset(
                                x: CGFloat.random(in: -160...160) * dissolveProgress,
                                y: CGFloat.random(in: -200...200) * dissolveProgress
                            )
                            .opacity(Double(1.0 - dissolveProgress))
                    }
                }
                
                // Guatemala Flag SVG
                if phase != .truthRevealed && phase != .teaching {
                    guatemalaFlagSVG
                        .opacity(Double(1.0 - dissolveProgress))
                        .scaleEffect(1.0 + dissolveProgress * 0.3)
                        .blur(radius: dissolveProgress * 12)
                }
                
                // Truth symbol — quetzal breaking free
                if showTruth {
                    VStack(spacing: 8) {
                        ZStack {
                            // Broken chain
                            Image(systemName: "link").font(.system(size: 30)).foregroundColor(.red.opacity(0.4))
                                .overlay(
                                    Image(systemName: "bolt.fill").font(.system(size: 16)).foregroundColor(.yellow)
                                        .offset(x: 5, y: -5)
                                )
                            // Eye
                            Image(systemName: "eye.fill").font(.system(size: 30)).foregroundColor(.cyan)
                                .offset(y: 40)
                        }
                        Text("THE BLUEPRINT EXPOSED").font(.system(size: 11, weight: .black)).tracking(3).foregroundColor(.cyan)
                    }
                    .transition(.scale.combined(with: .opacity))
                }
            }
            .frame(height: 280)
            
            Spacer().frame(height: 30)
            
            // Cycling intro text
            if revealTextIndex < introTexts.count {
                Text(introTexts[revealTextIndex])
                    .font(.system(size: 18, weight: .bold)).foregroundColor(.white)
                    .opacity(textOpacity).multilineTextAlignment(.center)
                    .padding(.horizontal, 30)
                    .id(revealTextIndex)
            }
            
            Spacer()
            
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
                Text("🇬🇹 GUATEMALA").font(.system(size: 10, weight: .bold)).tracking(3).foregroundColor(Color(red: 0.28, green: 0.62, blue: 0.86).opacity(0.6))
                Text("The Blueprint").font(.system(size: 20, weight: .black)).foregroundColor(.white)
                
                TabView(selection: $currentTruthCard) {
                    ForEach(Array(truthCards.enumerated()), id: \.offset) { index, card in
                        ScrollView(showsIndicators: false) {
                            VStack(alignment: .leading, spacing: 12) {
                                HStack {
                                    Text("\(index + 1)/\(truthCards.count)").font(.system(size: 10, weight: .bold)).foregroundColor(Color(red: 0.28, green: 0.62, blue: 0.86).opacity(0.4))
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
                            .overlay(RoundedRectangle(cornerRadius: 16).stroke(Color(red: 0.28, green: 0.62, blue: 0.86).opacity(0.08), lineWidth: 1)))
                        .tag(index)
                    }
                }
                .tabViewStyle(.page(indexDisplayMode: .automatic))
                .frame(minHeight: 380)
                
                // Sources
                VStack(alignment: .leading, spacing: 4) {
                    Text("SOURCES").font(.system(size: 9, weight: .bold)).tracking(1).foregroundColor(.white.opacity(0.2))
                    Text("• Stephen Schlesinger — Bitter Fruit: The Story of the American Coup in Guatemala (1982)").font(.system(size: 9)).foregroundColor(.white.opacity(0.2))
                    Text("• CIA declassified PBSUCCESS files (1997-2003)").font(.system(size: 9)).foregroundColor(.white.opacity(0.2))
                    Text("• UN Commission for Historical Clarification — Guatemala: Memory of Silence (1999)").font(.system(size: 9)).foregroundColor(.white.opacity(0.2))
                    Text("• Rigoberta Menchú — I, Rigoberta Menchú (1983)").font(.system(size: 9)).foregroundColor(.white.opacity(0.2))
                    Text("• Kate Doyle — National Security Archive Guatemala Project").font(.system(size: 9)).foregroundColor(.white.opacity(0.2))
                    Text("• Greg Grandin — The Last Colonial Massacre (2004)").font(.system(size: 9)).foregroundColor(.white.opacity(0.2))
                    Text("• Nick Cullather — Secret History: The CIA's Classified Account of PBSUCCESS (1999)").font(.system(size: 9)).foregroundColor(.white.opacity(0.2))
                    Text("• Victoria Sanford — Buried Secrets: Truth and Human Rights in Guatemala (2003)").font(.system(size: 9)).foregroundColor(.white.opacity(0.2))
                    Text("• Ríos Montt genocide trial transcripts (2013)").font(.system(size: 9)).foregroundColor(.white.opacity(0.2))
                    Text("• Intelligence Oversight Board — Guatemala CIA review (1996)").font(.system(size: 9)).foregroundColor(.white.opacity(0.2))
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
    
    // MARK: - Guatemala Flag SVG (Stylized)
    
    private var guatemalaFlagSVG: some View {
        HStack(spacing: 0) {
            // Left blue stripe (sky blue — lighter than Honduras/El Salvador)
            Rectangle().fill(Color(red: 0.28, green: 0.62, blue: 0.86)).frame(width: 80)
            // White center with coat of arms
            ZStack {
                Rectangle().fill(Color.white)
                VStack(spacing: 2) {
                    // Quetzal bird (simplified)
                    Image(systemName: "bird.fill").font(.system(size: 16)).foregroundColor(Color.green)
                    // Crossed rifles & swords behind scroll
                    HStack(spacing: 2) {
                        Image(systemName: "leaf.fill").font(.system(size: 8)).foregroundColor(.green).rotationEffect(.degrees(-30))
                        VStack(spacing: 1) {
                            Text("LIBERTAD").font(.system(size: 4, weight: .bold)).foregroundColor(Color(red: 0.28, green: 0.62, blue: 0.86))
                            Text("15 DE SEPTIEMBRE").font(.system(size: 3, weight: .bold)).foregroundColor(Color(red: 0.28, green: 0.62, blue: 0.86))
                            Text("DE 1821").font(.system(size: 3, weight: .bold)).foregroundColor(Color(red: 0.28, green: 0.62, blue: 0.86))
                        }
                        Image(systemName: "leaf.fill").font(.system(size: 8)).foregroundColor(.green).rotationEffect(.degrees(30)).scaleEffect(x: -1)
                    }
                }
            }
            .frame(width: 80)
            // Right blue stripe
            Rectangle().fill(Color(red: 0.28, green: 0.62, blue: 0.86)).frame(width: 80)
        }
        .frame(width: 240, height: 180)
        .clipShape(RoundedRectangle(cornerRadius: 8))
        .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.white.opacity(0.2), lineWidth: 2))
        .shadow(color: Color(red: 0.28, green: 0.62, blue: 0.86).opacity(0.4), radius: 20)
    }
    
    // MARK: - Animation Sequence
    
    private func startSequence() {
        cycleText(index: 0)
        
        // Phase 1: Glow (3s)
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
            phase = .glowing
            withAnimation(.easeInOut(duration: 2.5)) { glowIntensity = 1.0 }
        }
        
        // Phase 2: Dissolve (~25s — 15 intro texts)
        DispatchQueue.main.asyncAfter(deadline: .now() + 25.0) {
            phase = .dissolving
            particleExplosion = true
            withAnimation(.easeInOut(duration: 3.0)) { dissolveProgress = 1.0 }
        }
        
        // Phase 3: Truth (28s)
        DispatchQueue.main.asyncAfter(deadline: .now() + 28.0) {
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
