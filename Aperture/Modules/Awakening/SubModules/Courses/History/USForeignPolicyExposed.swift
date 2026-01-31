// USForeignPolicyExposed.swift
// The interventions, coups, and wars they don't teach
// Documented. Cited. Truthful.

import SwiftUI

struct USForeignPolicyExposed: View {
    
    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                // Course Header
                courseHeader
                
                // Key stat
                interventionCounter
                
                // Lessons
                ForEach(Array(lessons.enumerated()), id: \.offset) { index, lesson in
                    NavigationLink(destination: ForeignPolicyLessonView(lesson: lesson, index: index + 1)) {
                        lessonRow(lesson, index: index)
                    }
                }
                
                // Sources
                sourcesSection
            }
        }
        .background(Color.black.ignoresSafeArea())
        .navigationTitle("US Foreign Policy")
        .navigationBarTitleDisplayMode(.inline)
    }
    
    private var courseHeader: some View {
        VStack(spacing: 16) {
            ZStack {
                Circle()
                    .fill(Color.red.opacity(0.2))
                    .frame(width: 100, height: 100)
                
                Image(systemName: "globe.americas.fill")
                    .font(.system(size: 44))
                    .foregroundColor(.red)
            }
            
            Text("U.S. Foreign Policy")
                .font(.system(size: 24, weight: .bold))
                .foregroundColor(.white)
            
            Text("EXPOSED")
                .font(.system(size: 14, weight: .black))
                .foregroundColor(.red)
                .tracking(4)
            
            Text("The interventions they don't teach")
                .font(.system(size: 14))
                .foregroundColor(.gray)
            
            HStack {
                Text("10 Lessons")
                    .font(.system(size: 12, weight: .medium))
                    .foregroundColor(.gray)
                Spacer()
                Text("~80 min")
                    .font(.system(size: 12, weight: .medium))
                    .foregroundColor(.gray)
            }
            .padding(.horizontal)
        }
        .padding()
    }
    
    private var interventionCounter: some View {
        VStack(spacing: 12) {
            Text("SINCE 1945")
                .font(.system(size: 11, weight: .bold))
                .foregroundColor(.gray)
                .tracking(2)
            
            HStack(spacing: 30) {
                statColumn("70+", "Coups & Interventions")
                statColumn("30+", "Countries Bombed")
                statColumn("20M+", "Deaths Linked")
            }
        }
        .padding()
        .background(Color.red.opacity(0.1))
        .cornerRadius(16)
        .padding()
    }
    
    private func statColumn(_ number: String, _ label: String) -> some View {
        VStack(spacing: 4) {
            Text(number)
                .font(.system(size: 28, weight: .bold))
                .foregroundColor(.red)
            Text(label)
                .font(.system(size: 10))
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
        }
    }
    
    private func lessonRow(_ lesson: ForeignPolicyLesson, index: Int) -> some View {
        HStack(spacing: 16) {
            ZStack {
                Circle()
                    .fill(lesson.color.opacity(0.2))
                    .frame(width: 48, height: 48)
                Text("\(index + 1)")
                    .font(.system(size: 18, weight: .bold))
                    .foregroundColor(lesson.color)
            }
            
            VStack(alignment: .leading, spacing: 4) {
                Text(lesson.title)
                    .font(.system(size: 15, weight: .semibold))
                    .foregroundColor(.white)
                Text(lesson.region)
                    .font(.system(size: 12))
                    .foregroundColor(.gray)
            }
            
            Spacer()
            
            Image(systemName: "chevron.right")
                .foregroundColor(.gray)
        }
        .padding()
        .background(Color.white.opacity(0.03))
    }
    
    private var sourcesSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Primary Sources")
                .font(.system(size: 16, weight: .bold))
                .foregroundColor(.white)
            
            VStack(alignment: .leading, spacing: 8) {
                sourceRow("Declassified CIA Documents", "cia.gov/readingroom")
                sourceRow("National Security Archive", "nsarchive.gwu.edu")
                sourceRow("Foreign Relations of the US", "history.state.gov")
                sourceRow("Pentagon Papers", "National Archives")
                sourceRow("Church Committee Reports", "Senate.gov")
            }
        }
        .padding()
    }
    
    private func sourceRow(_ name: String, _ source: String) -> some View {
        HStack(spacing: 10) {
            Image(systemName: "doc.text")
                .foregroundColor(.blue)
                .font(.system(size: 12))
            Text(name)
                .font(.system(size: 13))
                .foregroundColor(.white)
            Spacer()
            Text(source)
                .font(.system(size: 11))
                .foregroundColor(.gray)
        }
    }
    
    // MARK: - Lessons Data
    
    private var lessons: [ForeignPolicyLesson] {
        [
            ForeignPolicyLesson(
                title: "The Pattern of Intervention",
                region: "Global Overview",
                color: .red,
                content: """
                **How America Really Operates Abroad**
                
                Since 1945, the U.S. has intervened in other countries' affairs over 70 times. This isn't conspiracy—it's documented history.
                
                ---
                
                **The Playbook:**
                
                Most interventions follow a pattern:
                
                1. **Identify a "threat"** (usually a leader who nationalizes resources or leans socialist)
                2. **Economic pressure** (sanctions, IMF conditions)
                3. **Propaganda campaign** (manufacturing consent)
                4. **Fund opposition** (often through CIA or USAID)
                5. **Support coup or military intervention**
                6. **Install friendly government**
                7. **Open markets to U.S. corporations**
                
                ---
                
                **The Justifications (Then and Now):**
                
                | Era | Justification |
                |-----|---------------|
                | Cold War | "Stopping communism" |
                | 1990s | "Humanitarian intervention" |
                | 2000s | "War on Terror" |
                | Today | "Protecting democracy" |
                
                The pattern is the same. The marketing changes.
                
                ---
                
                **Documented CIA Coups (Partial List):**
                
                - Iran (1953)
                - Guatemala (1954)
                - Congo (1960)
                - Dominican Republic (1961)
                - Brazil (1964)
                - Indonesia (1965)
                - Chile (1973)
                - Haiti (1991, 2004)
                - And many more
                
                **Source:** National Security Archive; Declassified CIA documents
                
                ---
                
                **The Body Count:**
                
                Scholars estimate U.S. foreign interventions linked to:
                
                - **20-30 million deaths** since WWII
                - Includes direct military action, coups, sanctions, proxy wars
                
                **Source:** James A. Lucas, "US Has Killed More Than 20 Million People" (reviewed academic estimate)
                
                ---
                
                **Who Benefits:**
                
                - U.S. corporations (access to markets, resources)
                - Defense contractors (weapons sales)
                - Financial institutions (IMF, World Bank loans)
                - Political class (campaign contributions)
                
                **Who Pays:**
                
                - Civilians in targeted countries
                - U.S. taxpayers
                - U.S. soldiers
                - Global stability
                
                ---
                
                **The Information War:**
                
                Most Americans don't know this history because:
                
                - School curricula omit it
                - Media frames U.S. as always benevolent
                - Documents classified for decades
                - "National security" covers abuses
                
                But declassified documents confirm the pattern.
                """,
                keyTakeaway: "The U.S. has intervened in 70+ countries since 1945, usually to protect corporate interests. Coups, invasions, and proxy wars follow a consistent pattern. 20-30 million deaths are linked to these interventions."
            ),
            ForeignPolicyLesson(
                title: "Iran 1953: The First Coup",
                region: "Middle East",
                color: .orange,
                content: """
                **Operation AJAX: The Template**
                
                The 1953 Iran coup became the model for U.S. interventions worldwide.
                
                ---
                
                **The Context:**
                
                **Mohammad Mosaddegh:**
                - Democratically elected Prime Minister (1951)
                - TIME Magazine "Man of the Year" 1951
                - Popular, nationalist leader
                
                **His "crime":**
                - Nationalized Iran's oil industry
                - Oil had been controlled by British company (Anglo-Iranian, now BP)
                - Iranians received only 16% of profits from their own oil
                
                ---
                
                **The Coup:**
                
                **Operation AJAX** (CIA) / **Operation Boot** (MI6)
                
                1. CIA paid Iranian agents to pose as Mosaddegh supporters and act violently
                2. Bribed journalists to write anti-Mosaddegh propaganda
                3. Funded opposition politicians and military officers
                4. Organized street mobs
                5. August 19, 1953: Mosaddegh overthrown
                
                **Source:** CIA official history (declassified 2013)
                
                CIA Director Allen Dulles's brother, John Foster Dulles, was Secretary of State. Both had ties to oil interests.
                
                ---
                
                **The Aftermath:**
                
                **Who replaced Mosaddegh:**
                - Shah Mohammad Reza Pahlavi (restored to power)
                - Ruled as dictator for 26 years
                - SAVAK (secret police) tortured and killed thousands
                - Trained by CIA and Israeli Mossad
                
                **Oil deal:**
                - U.S. companies got 40% of Iranian oil
                - British got 40%
                - Iranians still didn't control their own resources
                
                ---
                
                **The Blowback:**
                
                **1979 Iranian Revolution:**
                - Shah overthrown by popular uprising
                - Islamic Republic established
                - U.S. Embassy hostage crisis
                - Anti-American sentiment rooted in 1953 coup
                
                Iranians remember 1953. Most Americans don't know it happened.
                
                ---
                
                **U.S. Acknowledgment:**
                
                **2013:** CIA officially acknowledged role in coup (60 years later)
                
                **2000:** Secretary of State Madeleine Albright:
                > "The United States played a significant role in orchestrating the overthrow of Iran's popular Prime Minister... The coup was clearly a setback for Iran's political development."
                
                ---
                
                **The Legacy:**
                
                The Iran coup established:
                
                1. CIA could overthrow governments secretly
                2. "Democracy" rhetoric could mask corporate interests
                3. Short-term gains create long-term blowback
                4. Media can be manipulated to support coups
                
                This template was used again and again.
                """,
                keyTakeaway: "The CIA overthrew Iran's democracy in 1953 to control oil. The dictator they installed ruled for 26 years. This directly led to the 1979 revolution and current tensions. Most Americans don't know this history."
            ),
            ForeignPolicyLesson(
                title: "Latin America: The Backyard",
                region: "Central & South America",
                color: .green,
                content: """
                **Centuries of Intervention**
                
                No region has suffered more U.S. intervention than Latin America.
                
                ---
                
                **The Monroe Doctrine (1823):**
                
                Declared the Western Hemisphere a U.S. sphere of influence.
                
                In practice: The U.S. treats Latin America as its property.
                
                ---
                
                **Guatemala 1954:**
                
                **Jacobo Árbenz:**
                - Democratically elected president
                - Instituted land reform
                - Redistributed United Fruit Company land (with compensation)
                
                **United Fruit's Response:**
                - Lobbied U.S. government
                - CIA Director Allen Dulles: On United Fruit's board
                - Secretary of State John Foster Dulles: Former United Fruit lawyer
                
                **Operation PBSUCCESS:**
                - CIA armed, trained rebels
                - Psychological warfare campaign
                - Árbenz overthrown
                - 40 years of military dictatorship followed
                - **200,000 killed** in subsequent civil war and genocide
                
                **Source:** National Security Archive; UN Truth Commission
                
                ---
                
                **Chile 1973:**
                
                **Salvador Allende:**
                - First democratically elected Marxist president in the Americas
                - Nationalized copper, banks
                - Expanded social programs
                
                **Nixon's orders** (documented):
                > "Make the economy scream"
                
                **U.S. Actions:**
                - Economic warfare
                - Funded opposition and strikes
                - CIA support for military coup
                
                **September 11, 1973:**
                - Military coup
                - Allende died (officially suicide during palace attack)
                - **General Augusto Pinochet** took power
                
                **Pinochet Dictatorship (1973-1990):**
                - 3,000+ killed or "disappeared"
                - 40,000+ tortured
                - Economists from University of Chicago implemented "free market" policies
                - U.S. supported Pinochet throughout
                
                **Source:** Church Committee; National Security Archive
                
                ---
                
                **Central America 1980s:**
                
                Reagan's "backyard" wars:
                
                **Nicaragua:**
                - Sandinistas overthrew U.S.-backed dictator
                - U.S. funded Contras (terrorists by any definition)
                - Mined harbors (violating international law)
                - Iran-Contra scandal: Sold weapons to Iran to fund Contras
                - World Court ruled U.S. guilty of international terrorism (U.S. ignored ruling)
                
                **El Salvador:**
                - U.S. funded military fighting leftist insurgency
                - Military massacred civilians (El Mozote: 1,000+ killed)
                - Assassinated Archbishop Oscar Romero
                - **75,000 killed** during civil war
                
                **Guatemala:**
                - U.S.-backed military committed genocide against Maya
                - **200,000 killed** (83% were Maya)
                - Reagan called dictator Ríos Montt "a man of great personal integrity"
                - Ríos Montt later convicted of genocide
                
                **Source:** UN Truth Commissions; National Security Archive
                
                ---
                
                **The Results:**
                
                U.S. interventions created:
                - Poverty
                - Violence
                - Instability
                - Migration (which U.S. then criminalizes)
                
                The refugees at the border are fleeing conditions the U.S. created.
                """,
                keyTakeaway: "The U.S. overthrew democracies, backed dictators, and funded death squads across Latin America. 200,000 killed in Guatemala, 75,000 in El Salvador. Today's migration crisis is direct blowback from these interventions."
            ),
            ForeignPolicyLesson(
                title: "Vietnam: The Big Lie",
                region: "Southeast Asia",
                color: .yellow,
                content: """
                **The War Built on Lies**
                
                Vietnam exposed the gap between what the government said and what it knew.
                
                ---
                
                **The Official Story:**
                
                "Defending South Vietnam from communist aggression"
                
                **The Reality (from Pentagon Papers):**
                
                The U.S. government knew:
                - Ho Chi Minh was a popular nationalist leader
                - Most Vietnamese supported unification under his leadership
                - The "South Vietnam" government was a U.S. creation
                - The war was unwinnable
                - They lied about all of it
                
                **Source:** Pentagon Papers (leaked by Daniel Ellsberg, 1971)
                
                ---
                
                **Gulf of Tonkin (1964):**
                
                **The claim:** North Vietnam attacked U.S. ships unprovoked
                
                **The reality:**
                - First incident: U.S. ships were supporting South Vietnamese attacks on North
                - Second incident: Probably didn't happen at all
                - NSA documents show administration knew claims were false
                
                **The result:** Congress passed Gulf of Tonkin Resolution, authorizing war
                
                The entire escalation was based on a lie.
                
                **Source:** Declassified NSA documents (2005)
                
                ---
                
                **The Human Cost:**
                
                | Group | Deaths |
                |-------|--------|
                | Vietnamese civilians | 2,000,000+ |
                | Vietnamese soldiers (North & South) | 1,100,000+ |
                | American soldiers | 58,220 |
                | Cambodians | 500,000+ |
                | Laotians | 200,000+ |
                
                **Total: 3-4 million dead**
                
                ---
                
                **What They Did:**
                
                **Agent Orange:**
                - 20 million gallons of herbicide sprayed
                - Dioxin causes cancer, birth defects
                - Effects continue today (Vietnamese children still born with defects)
                - U.S. veterans exposed, many denied treatment for years
                
                **Bombing:**
                - More bombs dropped on Vietnam than all of WWII combined
                - Laos: Most bombed country per capita in history
                - Unexploded bombs still kill people today
                
                **My Lai Massacre (1968):**
                - U.S. soldiers killed 347-504 unarmed civilians
                - Women raped, children killed
                - Covered up for over a year
                - Only one person convicted (3.5 years house arrest)
                
                **Source:** National Archives; Army investigation records
                
                ---
                
                **The Pentagon Papers Revealed:**
                
                Published by Daniel Ellsberg in 1971:
                
                - Government knew war was unwinnable
                - Lied to public about progress
                - Expanded war while claiming to wind down
                - Civilian leadership and military both complicit
                
                Nixon tried to suppress publication. Supreme Court ruled for press freedom.
                
                ---
                
                **The Lessons Ignored:**
                
                Vietnam should have taught:
                - Government lies about wars
                - Military industrial complex profits from war
                - Media can be manipulated
                - "Domino theory" was false
                - Wars create refugees (Vietnamese boat people)
                
                But these lessons were not learned. Iraq, Afghanistan followed the same pattern.
                """,
                keyTakeaway: "Vietnam was built on lies (Gulf of Tonkin). 3-4 million died. Agent Orange still causes birth defects. My Lai massacre covered up. Pentagon Papers proved government knew war was unwinnable. Same pattern repeated in Iraq."
            ),
            ForeignPolicyLesson(
                title: "Iraq: WMD and Lies",
                region: "Middle East",
                color: .orange,
                content: """
                **The War Based on Known Lies**
                
                Iraq proved that even after Vietnam, the government would lie to start wars.
                
                ---
                
                **The Claims (2002-2003):**
                
                - Iraq has Weapons of Mass Destruction (WMD)
                - Iraq has ties to Al-Qaeda and 9/11
                - Iraq poses an imminent threat to the U.S.
                - We will be greeted as liberators
                - War will be quick and pay for itself
                
                **All of these were false. And the government knew.**
                
                ---
                
                **The Evidence Was Manufactured:**
                
                **"Curveball":**
                - Main source for WMD claims was a single Iraqi defector
                - German intelligence warned he was unreliable
                - CIA used his claims anyway
                - Later admitted he fabricated everything
                
                **Niger Uranium:**
                - Claim that Iraq sought uranium from Niger
                - Based on forged documents
                - CIA knew documents were fake
                - Bush used claim in State of the Union anyway
                
                **Aluminum Tubes:**
                - Claimed as evidence of nuclear program
                - Department of Energy experts said they were for rockets
                - Administration used nuclear claim anyway
                
                **Source:** Senate Intelligence Committee Report (2008)
                
                ---
                
                **Colin Powell's UN Speech (2003):**
                
                Secretary of State presented "evidence" to UN:
                - Satellite photos of "mobile weapons labs"
                - Claims of chemical weapons stockpiles
                - Al-Qaeda connections
                
                **Every major claim was false.**
                
                Powell later called it a "blot" on his record.
                
                ---
                
                **The Real Reasons:**
                
                **Oil:**
                - Iraq has 5th largest oil reserves
                - Pre-war meetings discussed dividing oil fields
                - U.S. oil companies got major contracts after invasion
                
                **Neoconservative ideology:**
                - Project for New American Century (PNAC) called for Iraq invasion in 1998
                - Members: Cheney, Rumsfeld, Wolfowitz
                - Wanted to reshape Middle East
                
                **Unfinished business:**
                - Bush Sr. left Saddam in power after Gulf War
                - Bush Jr. reportedly said "He tried to kill my dad"
                
                ---
                
                **The Human Cost:**
                
                | Group | Deaths |
                |-------|--------|
                | Iraqi civilians | 150,000-1,000,000+ |
                | U.S. soldiers | 4,400+ |
                | Iraqi soldiers | Unknown tens of thousands |
                | Contractors | 3,500+ |
                
                **Displaced:** 4+ million Iraqis
                
                **Cost to U.S.:** $2+ trillion
                
                ---
                
                **The Aftermath:**
                
                - No WMDs found
                - Iraq destabilized
                - ISIS emerged from chaos
                - Iran gained influence
                - Refugee crisis
                - Veterans with PTSD, traumatic brain injuries
                
                ---
                
                **No Accountability:**
                
                - Bush: Remained president, now rehabilitated
                - Cheney: Never charged
                - Rumsfeld: Never charged
                - CIA officials who approved torture: Never charged
                - Media who sold the war: Still employed
                
                The lesson: There is no accountability for war crimes if you're American.
                """,
                keyTakeaway: "The Iraq War was based on known lies about WMD. 150,000-1,000,000+ Iraqi civilians died. No accountability for those who lied. Cost: $2+ trillion, regional destabilization, and ISIS."
            ),
            ForeignPolicyLesson(
                title: "Drone Warfare",
                region: "Global",
                color: .gray,
                content: """
                **Killing Without Accountability**
                
                Drones allow assassination without declaration of war, oversight, or accountability.
                
                ---
                
                **The Scope:**
                
                Since 2001:
                - **14,000+** drone strikes (confirmed)
                - **Pakistan, Yemen, Somalia, Libya, Afghanistan, Iraq, Syria**
                - **8,500-12,000** people killed
                - **Civilian deaths:** 900-2,200 (U.S. claims) to 5,000+ (independent estimates)
                
                **Source:** Bureau of Investigative Journalism; New America Foundation
                
                ---
                
                **The "Kill List":**
                
                Obama expanded and institutionalized drone killings:
                
                - "Terror Tuesday" meetings in White House
                - President personally approved names on kill list
                - No trial, no charges, no due process
                - "Signature strikes" targeted people based on behavior patterns, not identity
                
                **Source:** New York Times investigation (2012)
                
                ---
                
                **American Citizens Killed:**
                
                **Anwar al-Awlaki (2011):**
                - U.S. citizen
                - Killed by drone strike in Yemen
                - No trial, no charges
                - Administration refused to release legal justification
                
                **Abdulrahman al-Awlaki (2011):**
                - 16-year-old U.S. citizen
                - Anwar's son
                - Killed in separate strike two weeks later
                - Obama press secretary: "He should have had a more responsible father"
                
                **Nawar al-Awlaki (2017):**
                - 8-year-old U.S. citizen
                - Abdulrahman's sister
                - Killed in Trump-authorized raid
                
                Three generations of one American family killed without trial.
                
                ---
                
                **Civilian Casualties:**
                
                **"Double tap" strikes:**
                - Hit a target
                - Wait for rescuers to arrive
                - Strike again
                
                This is a war crime under international law.
                
                **Wedding parties:**
                - Multiple documented strikes on weddings mistaken for militant gatherings
                - Yemen, Afghanistan, Pakistan
                
                **Hospitals:**
                - Kunduz hospital strike (2015): 42 killed including patients and Doctors Without Borders staff
                
                ---
                
                **The Legal Black Hole:**
                
                The U.S. claims authority to:
                - Kill anyone, anywhere
                - Based on secret evidence
                - With no judicial review
                - In countries we're not at war with
                
                **Authorization:** 2001 AUMF (still in effect)
                - Passed 3 days after 9/11
                - Authorized force against those who "planned, authorized, committed, or aided" 9/11
                - Used to justify strikes on groups that didn't exist in 2001
                
                ---
                
                **The Blowback:**
                
                Drone strikes create more terrorists:
                
                - Civilian deaths radicalize survivors
                - "Signature strikes" killed unknown individuals
                - Fear of drones traumatizes entire populations
                - U.S. seen as lawless aggressor
                
                Former drone operators have spoken out about psychological trauma and ethical concerns.
                
                ---
                
                **No Accountability:**
                
                - No one prosecuted for civilian deaths
                - Investigations are internal
                - Victims cannot sue
                - Oversight is classified
                
                Assassination by algorithm, with no one responsible.
                """,
                keyTakeaway: "Drones have killed 8,500-12,000 people including U.S. citizens without trial. 'Signature strikes' target behavior patterns, not known individuals. This creates more terrorists while traumatizing entire populations."
            ),
            ForeignPolicyLesson(
                title: "Sanctions: Economic Warfare",
                region: "Global",
                color: .purple,
                content: """
                **Killing Without Bombs**
                
                Sanctions are presented as an alternative to war. In reality, they are war on civilian populations.
                
                ---
                
                **What Sanctions Do:**
                
                Sanctions restrict:
                - Trade
                - Banking
                - Medicine imports
                - Food imports
                - Technology
                - Travel
                
                **Who suffers:** Ordinary civilians
                **Who doesn't suffer:** Regime leaders
                
                ---
                
                **Iraq Sanctions (1990-2003):**
                
                After Gulf War, comprehensive sanctions imposed.
                
                **Results:**
                - Destroyed healthcare system
                - Clean water infrastructure collapsed
                - Malnutrition epidemic
                
                **Child mortality:**
                - UNICEF estimated 500,000 excess child deaths
                
                **Madeleine Albright (1996), asked if 500,000 dead children was worth it:**
                > "We think the price is worth it."
                
                **Source:** 60 Minutes interview; UNICEF studies
                
                ---
                
                **Cuba Embargo (1960-Present):**
                
                Longest embargo in modern history.
                
                **Effects:**
                - Shortages of medicine, medical equipment
                - Food scarcity
                - Economic devastation
                
                **UN votes to end embargo:**
                - **187-2** (2023)
                - Only U.S. and Israel voted to continue
                - Has been condemned by UN General Assembly for 30+ consecutive years
                
                **Who's isolated?**
                
                ---
                
                **Venezuela Sanctions:**
                
                Increased under Trump, maintained under Biden.
                
                **Effects:**
                - Oil revenue collapsed
                - Medicine shortages
                - Food scarcity
                - **40,000 deaths** attributed to sanctions (2017-2018 alone)
                
                **Source:** Center for Economic and Policy Research
                
                ---
                
                **Iran Sanctions:**
                
                After U.S. withdrew from nuclear deal (2018):
                
                **Effects:**
                - Medicine shortages (including cancer drugs)
                - Plane crashes due to inability to get parts
                - Economic devastation
                
                Sanctions explicitly include medicine exemptions, but:
                - Banks refuse transactions fearing U.S. penalties
                - De facto medicine embargo
                
                ---
                
                **North Korea:**
                
                Comprehensive sanctions for decades.
                
                **Effects:**
                - Periodic famine
                - Healthcare collapse
                - Civilian suffering
                
                **Did sanctions stop nuclear program?** No.
                
                **Did they cause civilian suffering?** Yes.
                
                ---
                
                **The Logic:**
                
                The theory:
                - Make people suffer
                - They'll blame their government
                - Government will change behavior
                
                The reality:
                - People blame whoever is sanctioning them
                - Governments tighten control
                - Black markets enrich regime allies
                - Civilians die
                - Nothing changes
                
                ---
                
                **The Double Standard:**
                
                When Russia sanctions Western countries: "Economic warfare"
                When U.S. sanctions others: "Promoting democracy"
                
                The U.S. sanctions more countries than any other nation.
                
                As of 2023: **20+ countries** under some form of U.S. sanctions
                
                ---
                
                **Who Benefits:**
                
                - U.S. corporations (eliminate competition)
                - Dollar hegemony (forces use of U.S. financial system)
                - Political posturing (looks "tough" without war)
                
                **Who pays:**
                
                - Civilians who can't get medicine
                - Children who don't have enough food
                - People with no power over their governments
                """,
                keyTakeaway: "Sanctions kill civilians while rarely changing regime behavior. 500,000 Iraqi children died under sanctions. Albright said it was 'worth it.' The UN votes 187-2 against Cuba embargo yearly. This is economic warfare on populations."
            ),
            ForeignPolicyLesson(
                title: "Military Bases & Empire",
                region: "Global",
                color: .blue,
                content: """
                **The Empire No One Talks About**
                
                The U.S. has more foreign military bases than any empire in history.
                
                ---
                
                **The Numbers:**
                
                | Country | Foreign Military Bases |
                |---------|------------------------|
                | United States | **750+** |
                | United Kingdom | 145 |
                | Russia | ~30 |
                | France | ~15 |
                | China | ~5 |
                
                U.S. bases in **80+ countries**.
                
                **Source:** David Vine, "Base Nation"
                
                ---
                
                **Where Are They:**
                
                - **Germany:** 119 bases
                - **Japan:** 120 bases
                - **South Korea:** 73 bases
                - **Italy:** 44 bases
                - **Middle East:** Dozens across multiple countries
                - **Africa:** 29+ (many secret)
                - **Latin America:** Multiple countries
                
                U.S. troops are stationed on every continent except Antarctica.
                
                ---
                
                **The Cost:**
                
                Annual cost of foreign bases: **$150+ billion**
                
                That's more than:
                - Entire federal education budget
                - All domestic infrastructure spending
                - All foreign aid combined
                
                ---
                
                **Why They Exist:**
                
                **Official reasons:**
                - "Defending allies"
                - "Maintaining stability"
                - "Deterring aggression"
                
                **Actual reasons:**
                - Power projection
                - Protecting corporate interests
                - Controlling resources
                - Encircling rivals (Russia, China)
                - Maintaining dollar hegemony
                
                ---
                
                **The Impact on Host Countries:**
                
                **Okinawa, Japan:**
                - 32 U.S. bases on small island
                - 74% of U.S. Japan bases on 0.6% of Japan's land
                - Sexual assaults by U.S. soldiers
                - Environmental contamination
                - Protests for decades
                
                **South Korea:**
                - Towns near bases have high rates of prostitution, assault
                - SOFA (Status of Forces Agreement) protects U.S. soldiers from local prosecution
                
                **Diego Garcia:**
                - U.K. expelled entire population (1968-1973) to give U.S. a base
                - Residents never allowed to return
                - Used as CIA black site for torture
                
                **Source:** David Vine, "Island of Shame"
                
                ---
                
                **NATO Expansion:**
                
                After Cold War ended:
                - U.S. promised not to expand NATO eastward
                - Then expanded anyway: Poland, Hungary, Czech Republic, Baltic states, etc.
                - Now on Russia's border
                
                Imagine if Russia had military bases in Mexico and Canada.
                
                ---
                
                **The Military Industrial Complex:**
                
                Eisenhower warned (1961):
                > "We must guard against the acquisition of unwarranted influence... by the military-industrial complex."
                
                Today:
                - **$886 billion** defense budget (2024)
                - More than next 10 countries combined
                - Defense contractors donate to both parties
                - Revolving door between Pentagon and contractors
                
                ---
                
                **Empire by Another Name:**
                
                Americans don't think of the U.S. as an empire.
                
                But by any historical definition:
                - Military presence on every continent
                - Economic control through dollar and sanctions
                - Political interference in other countries
                - Extracting resources
                
                This is what empire looks like.
                """,
                keyTakeaway: "The U.S. has 750+ military bases in 80+ countries—more than any empire in history. Cost: $150+ billion/year. Host communities suffer assault, environmental damage, and displacement. This is empire by another name."
            ),
            ForeignPolicyLesson(
                title: "The Media's Role",
                region: "Domestic",
                color: .cyan,
                content: """
                **Manufacturing Consent for War**
                
                The media doesn't just report on foreign policy—it sells it.
                
                ---
                
                **The Propaganda Model:**
                
                Noam Chomsky and Edward Herman identified how media manufactures consent:
                
                1. **Ownership:** Media owned by corporations with interests in war
                2. **Advertising:** Advertisers influence content
                3. **Sourcing:** Reliance on government and military sources
                4. **Flak:** Organized attacks on critical coverage
                5. **Common enemy:** Demonization of official enemies
                
                **Source:** "Manufacturing Consent" (1988)
                
                ---
                
                **Iraq War Coverage:**
                
                **Before the invasion:**
                - Major papers (NYT, WaPo) amplified WMD claims
                - Critical voices marginalized
                - Anti-war protests (largest in history) barely covered
                - Dissenting experts excluded from TV
                
                **The New York Times later apologized** for uncritical WMD coverage.
                
                But the damage was done.
                
                **Source:** FAIR (Fairness and Accuracy in Reporting) studies
                
                ---
                
                **Who Gets On TV:**
                
                During Iraq War buildup, major networks:
                
                - **393** interviews on Iraq
                - **Only 3** with anti-war leaders
                - Military analysts (often with defense contractor ties) dominated
                
                **The Pentagon Pundits:**
                - Military analysts on TV were secretly briefed by Pentagon
                - Many had financial ties to defense contractors
                - Presented as independent experts
                
                **Source:** New York Times investigation (2008)
                
                ---
                
                **Language That Sells War:**
                
                | Media Term | Reality |
                |------------|---------|
                | "Surgical strike" | Bombing |
                | "Collateral damage" | Civilian deaths |
                | "Enhanced interrogation" | Torture |
                | "Regime change" | Overthrowing government |
                | "Intervention" | Invasion |
                | "Moderate rebels" | Often extremists |
                
                Language sanitizes violence.
                
                ---
                
                **What Gets Covered:**
                
                **American deaths:** Names, faces, stories
                **Iraqi/Afghan civilian deaths:** Statistics (if mentioned at all)
                
                **U.S. bombs wedding:** Brief mention, quickly forgotten
                **U.S. soldier killed:** Extended coverage, national mourning
                
                This is not neutral reporting.
                
                ---
                
                **False Balance:**
                
                "Debate" on issues like:
                - Should we torture? (One side: torture. Other side: different torture)
                - Should we invade? (One side: invade now. Other side: invade later)
                
                True opposition excluded as "fringe."
                
                ---
                
                **The Embedded Journalist:**
                
                After Vietnam, military limited press access.
                
                "Embedded" journalists:
                - Travel with military units
                - Depend on military for safety
                - See war from soldier's perspective
                - Rarely see civilian casualties up close
                
                Result: Coverage that humanizes military, dehumanizes "enemy."
                
                ---
                
                **Social Media Era:**
                
                New challenges:
                - Direct propaganda from governments
                - Misinformation on all sides
                - But also: Harder to hide civilian casualties
                - Independent journalists can share footage
                
                Power is contested, but establishment media still dominates.
                
                ---
                
                **What You Can Do:**
                
                - Diversify sources (foreign media, independent journalists)
                - Notice whose perspective is centered
                - Ask: Who benefits from this framing?
                - Look for what's NOT being covered
                - Be skeptical of official claims, especially about enemies
                """,
                keyTakeaway: "Media manufactures consent for war through biased sourcing, sanitized language, and excluding anti-war voices. Only 3 of 393 Iraq War interviews featured anti-war leaders. Pentagon secretly briefed TV analysts."
            ),
            ForeignPolicyLesson(
                title: "What Can Be Done",
                region: "The Future",
                color: .green,
                content: """
                **Breaking the Cycle**
                
                Knowing the history is the first step. Now what?
                
                ---
                
                **Why This Continues:**
                
                1. **Profit:** Defense contractors, oil companies benefit
                2. **Political incentives:** Being "tough" wins votes
                3. **Ignorance:** Americans don't know the history
                4. **Dehumanization:** Other peoples' lives don't "count"
                5. **No accountability:** War criminals aren't punished
                6. **System is bipartisan:** Both parties support empire
                
                ---
                
                **What's Different Now:**
                
                - Information is harder to control
                - Younger generations more skeptical
                - Veterans speaking out
                - Global south gaining power
                - Dollar hegemony challenged
                - Climate crisis demands cooperation, not domination
                
                ---
                
                **Individual Actions:**
                
                **Educate yourself:**
                - Read histories not taught in school
                - Follow independent journalists
                - Listen to voices from affected countries
                - This course is a start, not the end
                
                **Speak up:**
                - Share what you learn
                - Challenge war propaganda
                - Support anti-war voices
                - Don't let lies go unchallenged
                
                **Vote and organize:**
                - Primary elections matter
                - Support anti-war candidates
                - Join organizations working for peace
                - Pressure representatives
                
                ---
                
                **Collective Actions:**
                
                **Anti-war movements have worked:**
                - Vietnam protests eventually changed policy
                - 2003 Iraq protests were largest in history
                - Opposition to Syria bombing (2013) stopped intervention
                
                **Support:**
                - Veterans for Peace
                - CodePink
                - ACLU (civil liberties)
                - Organizations in affected countries
                
                ---
                
                **Policy Changes Needed:**
                
                - Repeal 2001 AUMF (still used to justify wars)
                - Close foreign military bases
                - End arms sales to human rights abusers
                - Rejoin international institutions and treaties
                - Prosecute war crimes (including American war crimes)
                - Cut military budget, invest in diplomacy
                - End sanctions that harm civilians
                
                ---
                
                **The Deeper Shift:**
                
                Ultimately, we need to reject:
                - American exceptionalism (we're not uniquely good)
                - Manifest destiny (we don't have right to dominate)
                - Dehumanization (all lives have equal value)
                - Militarism (violence is not the answer)
                
                And embrace:
                - Accountability (no one is above law)
                - Solidarity (with people, not governments)
                - Diplomacy (talking, not bombing)
                - Repair (acknowledging and addressing harm)
                
                ---
                
                **The Stakes:**
                
                The same pattern continues:
                - Latin America: Coups and interventions
                - Middle East: Endless wars
                - Africa: Military expansion
                - Asia: Encirclement of China
                
                Climate change demands cooperation.
                Nuclear weapons demand restraint.
                Human survival demands change.
                
                **The question is not whether change is needed, but whether we'll make it in time.**
                
                ---
                
                **Final Thought:**
                
                You now know more than most Americans about U.S. foreign policy.
                
                Use that knowledge.
                
                The pattern continues because people don't see it.
                
                Now you see it. What will you do?
                """,
                keyTakeaway: "Change requires education, speaking up, organizing, and policy change. Anti-war movements have succeeded before. The pattern continues because people don't see it. Now you see it—what will you do?"
            )
        ]
    }
}

// MARK: - Lesson Model

struct ForeignPolicyLesson: Identifiable {
    let id = UUID()
    let title: String
    let region: String
    let color: Color
    let content: String
    let keyTakeaway: String
}

// MARK: - Lesson View

struct ForeignPolicyLessonView: View {
    let lesson: ForeignPolicyLesson
    let index: Int
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 24) {
                // Header
                VStack(alignment: .leading, spacing: 8) {
                    HStack {
                        Text("Lesson \(index)")
                            .font(.system(size: 12, weight: .medium))
                            .foregroundColor(lesson.color)
                            .padding(.horizontal, 10)
                            .padding(.vertical, 4)
                            .background(lesson.color.opacity(0.2))
                            .cornerRadius(8)
                        
                        Text(lesson.region)
                            .font(.system(size: 12, weight: .medium))
                            .foregroundColor(.gray)
                            .padding(.horizontal, 10)
                            .padding(.vertical, 4)
                            .background(Color.white.opacity(0.1))
                            .cornerRadius(8)
                    }
                    
                    Text(lesson.title)
                        .font(.system(size: 26, weight: .bold))
                        .foregroundColor(.white)
                }
                
                Divider()
                    .background(Color.white.opacity(0.2))
                
                Text(lesson.content)
                    .font(.system(size: 15))
                    .foregroundColor(.white.opacity(0.9))
                    .lineSpacing(6)
                
                // Key Takeaway
                VStack(alignment: .leading, spacing: 12) {
                    HStack {
                        Image(systemName: "globe.americas.fill")
                            .foregroundColor(lesson.color)
                        Text("Key Takeaway")
                            .font(.system(size: 14, weight: .bold))
                            .foregroundColor(lesson.color)
                    }
                    
                    Text(lesson.keyTakeaway)
                        .font(.system(size: 16, weight: .medium))
                        .foregroundColor(.white)
                        .lineSpacing(4)
                }
                .padding()
                .background(lesson.color.opacity(0.1))
                .cornerRadius(16)
            }
            .padding()
        }
        .background(Color.black.ignoresSafeArea())
        .navigationBarTitleDisplayMode(.inline)
    }
}

// MARK: - Preview

#Preview {
    NavigationView {
        USForeignPolicyExposed()
    }
}
