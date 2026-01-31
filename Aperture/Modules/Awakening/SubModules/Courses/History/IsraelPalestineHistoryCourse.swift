// IsraelPalestineHistoryCourse.swift
// Documented history - both perspectives, primary sources
// Understanding the conflict through facts

import SwiftUI

struct IsraelPalestineHistoryCourse: View {
    
    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                // Header
                courseHeader
                
                // Context note
                contextNote
                
                // Lessons
                ForEach(Array(lessons.enumerated()), id: \.offset) { index, lesson in
                    NavigationLink(destination: IPLessonView(lesson: lesson, index: index + 1)) {
                        lessonRow(lesson, index: index)
                    }
                }
                
                // Sources
                sourcesSection
            }
        }
        .background(Color.black.ignoresSafeArea())
        .navigationTitle("Israel-Palestine History")
        .navigationBarTitleDisplayMode(.inline)
    }
    
    private var courseHeader: some View {
        VStack(spacing: 16) {
            ZStack {
                Circle()
                    .fill(Color.blue.opacity(0.2))
                    .frame(width: 100, height: 100)
                
                Image(systemName: "globe.europe.africa.fill")
                    .font(.system(size: 44))
                    .foregroundColor(.blue)
            }
            
            Text("Israel-Palestine")
                .font(.system(size: 24, weight: .bold))
                .foregroundColor(.white)
            
            Text("A Documented History")
                .font(.system(size: 14))
                .foregroundColor(.gray)
            
            HStack {
                Text("12 Lessons")
                    .font(.system(size: 12, weight: .medium))
                    .foregroundColor(.gray)
                Spacer()
                Text("~90 min")
                    .font(.system(size: 12, weight: .medium))
                    .foregroundColor(.gray)
            }
            .padding(.horizontal)
        }
        .padding()
    }
    
    private var contextNote: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Image(systemName: "info.circle.fill")
                    .foregroundColor(.blue)
                Text("About This Course")
                    .font(.system(size: 14, weight: .bold))
                    .foregroundColor(.blue)
            }
            
            Text("This course presents documented historical facts from scholarly sources, UN records, Israeli historians, and Palestinian accounts. We encourage verification of all claims through the sources provided.")
                .font(.system(size: 12))
                .foregroundColor(.white.opacity(0.8))
            
            Text("Understanding history is not the same as taking sides. Facts inform conscience.")
                .font(.system(size: 11, weight: .medium))
                .foregroundColor(.orange)
        }
        .padding()
        .background(Color.blue.opacity(0.1))
        .cornerRadius(12)
        .padding()
    }
    
    private func lessonRow(_ lesson: IPLesson, index: Int) -> some View {
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
                Text(lesson.era)
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
                sourceRow("Benny Morris", "Israeli historian, archival research")
                sourceRow("Ilan Pappé", "Israeli historian, The Ethnic Cleansing of Palestine")
                sourceRow("Rashid Khalidi", "Palestinian-American historian")
                sourceRow("UN Archives", "Resolutions, reports, UNRWA")
                sourceRow("B'Tselem", "Israeli human rights organization")
                sourceRow("Human Rights Watch", "International documentation")
                sourceRow("Amnesty International", "Reports on occupied territories")
            }
        }
        .padding()
    }
    
    private func sourceRow(_ name: String, _ desc: String) -> some View {
        HStack(spacing: 8) {
            Image(systemName: "doc.text.fill")
                .foregroundColor(.blue)
                .font(.system(size: 10))
            Text("\(name):")
                .font(.system(size: 11, weight: .semibold))
                .foregroundColor(.white)
            Text(desc)
                .font(.system(size: 11))
                .foregroundColor(.gray)
        }
    }
    
    private var lessons: [IPLesson] {
        [
            IPLesson(
                title: "Palestine Before Zionism",
                era: "Pre-1880s",
                color: .green,
                content: """
                **The Land Before the Conflict**
                
                Before political Zionism emerged, Palestine was home to a diverse population under Ottoman rule.
                
                ---
                
                **Ottoman Palestine (1517-1917):**
                
                **Population (1880s census estimates):**
                - Total: ~450,000-500,000 people
                - Muslims: ~85%
                - Christians: ~10%
                - Jews: ~5% (mostly religious, non-Zionist)
                
                **The Land:**
                - Part of Ottoman Syria
                - Agricultural economy
                - Cities: Jerusalem, Jaffa, Haifa, Nablus, Gaza
                - Mix of farming, commerce, religious pilgrimage
                
                *Source: Ottoman census records; Justin McCarthy, "The Population of Palestine" (1990)*
                
                ---
                
                **Palestinian Arab Society:**
                
                Palestinians were not "a land without a people":
                
                - Established villages, some centuries old
                - Agricultural traditions (olives, citrus, grain)
                - Urban merchant class
                - Religious institutions (Muslim, Christian)
                - Arabic language and culture
                - Local governance structures
                
                **Jewish Population:**
                
                Jews had lived in Palestine for centuries:
                - Primarily in Jerusalem, Safed, Hebron, Tiberias
                - Religious communities (not political nationalists)
                - Generally lived alongside Arab neighbors
                - Many were Mizrahi/Sephardic (Middle Eastern)
                
                ---
                
                **The Myth of "Empty Land":**
                
                The phrase "a land without a people for a people without a land" was popularized by early Zionists.
                
                **Reality:**
                - The land was inhabited
                - It had cities, villages, farms
                - It had a population with deep roots
                
                Early Zionist leaders acknowledged this:
                
                > "The bride is beautiful, but she is married to another man."
                > — Zionist delegation report, 1897
                
                > "We must expropriate gently... We shall try to spirit the penniless population across the border."
                > — Theodor Herzl, diary, 1895
                
                *Source: Herzl's diaries; Benny Morris, "Righteous Victims" (1999)*
                """,
                keyTakeaway: "Pre-Zionist Palestine had ~500,000 people—85% Muslim, 10% Christian, 5% Jewish. It was inhabited land with cities, villages, and established communities. Early Zionist leaders knew this."
            ),
            IPLesson(
                title: "The Rise of Zionism",
                era: "1880s-1917",
                color: .blue,
                content: """
                **Political Zionism Emerges**
                
                Zionism—Jewish nationalism seeking a homeland—arose in response to European antisemitism.
                
                ---
                
                **Context: European Antisemitism**
                
                Jews in Europe faced:
                - Pogroms in Russia (1881-1884, 1903-1906)
                - Dreyfus Affair in France (1894)
                - Discrimination across the continent
                - Rising nationalist movements excluding Jews
                
                This persecution was real and horrific.
                
                ---
                
                **Theodor Herzl (1860-1904):**
                
                Founder of political Zionism:
                - Austrian Jewish journalist
                - Witnessed antisemitism covering Dreyfus trial
                - Published "Der Judenstaat" (The Jewish State) in 1896
                - Organized First Zionist Congress (1897)
                
                **From the First Zionist Congress:**
                
                > "Zionism seeks to establish a home for the Jewish people in Palestine secured under public law."
                
                Other locations were considered (Uganda, Argentina) but Palestine chosen for biblical/historical connection.
                
                ---
                
                **Early Immigration (Aliyah):**
                
                **First Aliyah (1882-1903):**
                - ~25,000-35,000 Jews immigrated
                - Established agricultural settlements
                - Funded by Baron Rothschild
                
                **Second Aliyah (1904-1914):**
                - ~35,000-40,000 immigrants
                - More ideologically Zionist
                - Established kibbutzim
                - Introduced "Hebrew labor" concept (excluding Arab workers)
                
                ---
                
                **"Hebrew Labor" Policy:**
                
                Zionist organizations promoted hiring only Jews:
                
                - Displaced Arab workers from Jewish-owned enterprises
                - Created economic separation
                - Arabs saw their livelihoods threatened
                - Tensions began between communities
                
                *Source: Gershon Shafir, "Land, Labor and the Origins of the Israeli-Palestinian Conflict" (1989)*
                
                ---
                
                **Land Purchases:**
                
                Early Zionists bought land, often from:
                - Absentee Ottoman landlords
                - Local landowners
                
                **Consequences:**
                - Arab tenant farmers were evicted
                - Village lands lost
                - Resentment grew
                
                This was legal purchase but created displacement.
                
                ---
                
                **Arab Responses:**
                
                By early 1900s, Palestinians recognized the threat:
                - Newspaper editorials warned of Zionist intentions
                - Petitions to Ottoman authorities
                - Calls to restrict Jewish immigration
                - Some violence against settlements
                
                The conflict's roots were planted before WWI.
                """,
                keyTakeaway: "Zionism emerged from real European antisemitism. Early Jewish immigration (1882-1914) was ~70,000 people. Land purchases displaced Arab farmers. Both Jewish persecution in Europe and Palestinian displacement are documented facts."
            ),
            IPLesson(
                title: "The Balfour Declaration",
                era: "1917",
                color: .orange,
                content: """
                **Britain Promises What It Doesn't Own**
                
                In 1917, Britain made a fateful promise that shaped the next century.
                
                ---
                
                **The Balfour Declaration (November 2, 1917):**
                
                > "His Majesty's Government view with favour the establishment in Palestine of a national home for the Jewish people, and will use their best endeavours to facilitate the achievement of this object, it being clearly understood that nothing shall be done which may prejudice the civil and religious rights of existing non-Jewish communities in Palestine..."
                
                **Key Points:**
                - "National home" (deliberately vague)
                - "In Palestine" (not "of Palestine")
                - Existing inhabitants called "non-Jewish communities" (90% of population)
                - No mention of their political rights
                
                ---
                
                **Who Was Involved:**
                
                **Arthur Balfour:** British Foreign Secretary
                **Lord Rothschild:** Recipient of the letter
                **Chaim Weizmann:** Zionist leader who lobbied for it
                
                Palestinians were not consulted.
                
                ---
                
                **Britain's Motivations:**
                
                Multiple factors:
                
                1. **Wartime strategy:** Hoped to win Jewish support in WWI
                2. **Imperial interests:** Wanted influence near Suez Canal
                3. **Christian Zionism:** Religious beliefs about Jewish return
                4. **Antisemitism:** Some wanted Jews to leave Europe
                
                ---
                
                **The Contradiction:**
                
                Britain had also promised:
                
                **Hussein-McMahon Correspondence (1915-1916):**
                - Promised Arab independence in exchange for revolt against Ottomans
                - Arabs understood this included Palestine
                - British later claimed ambiguity
                
                **Sykes-Picot Agreement (1916):**
                - Secretly divided Middle East between Britain and France
                - Contradicted promises to Arabs
                
                Britain promised the same land to multiple parties.
                
                ---
                
                **Palestinian Response:**
                
                When they learned of it:
                - Protests and petitions
                - Delegation to London (rejected)
                - Growing national movement
                
                **First Palestine Arab Congress (1919)** demanded:
                - Recognition of Palestine as independent
                - Rejection of Balfour Declaration
                - End to Jewish immigration
                
                ---
                
                **Long-term Consequences:**
                
                The Balfour Declaration:
                - Gave international legitimacy to Zionism
                - Ignored indigenous population
                - Set stage for British Mandate policies
                - Created framework for partition
                
                It was 67 words that changed history.
                
                *Source: Original document in British National Archives; Tom Segev, "One Palestine, Complete" (2000)*
                """,
                keyTakeaway: "Britain promised Palestine to Zionists (Balfour) while also promising Arab independence. Palestinians—90% of the population—were called 'non-Jewish communities' with no political rights mentioned. They were never consulted."
            ),
            IPLesson(
                title: "The British Mandate",
                era: "1920-1948",
                color: .purple,
                content: """
                **British Rule and Growing Conflict**
                
                From 1920-1948, Britain controlled Palestine as violence escalated.
                
                ---
                
                **The Mandate System:**
                
                After WWI, League of Nations gave Britain the "Mandate" for Palestine:
                
                - Incorporated Balfour Declaration
                - Britain to facilitate Jewish homeland
                - Also protect Arab rights (contradiction built in)
                - Not independence—colonial administration
                
                ---
                
                **Immigration Waves:**
                
                Jewish immigration increased dramatically:
                
                | Period | Immigrants | Total Jewish Pop |
                |--------|-----------|-----------------|
                | 1919-1923 | 35,000 | 83,000 |
                | 1924-1928 | 82,000 | 154,000 |
                | 1929-1939 | 250,000 | 450,000 |
                
                By 1947: ~650,000 Jews (33% of population)
                
                *Source: British Mandate statistics; UN Special Committee on Palestine*
                
                ---
                
                **Palestinian Resistance:**
                
                **1920-1921:** Riots in Jerusalem, Jaffa
                **1929:** Hebron massacre (67 Jews killed); reprisals
                **1936-1939:** Arab Revolt
                
                **The Arab Revolt (1936-1939):**
                - General strike
                - Armed insurgency
                - Demanded end to immigration, land sales
                - Britain crushed it brutally
                - 5,000+ Palestinians killed
                - Leadership exiled or imprisoned
                - Palestinian society weakened before 1948
                
                ---
                
                **Jewish Armed Groups:**
                
                **Haganah:** Main Zionist militia (became IDF)
                **Irgun:** More militant, bombing campaigns
                **Lehi (Stern Gang):** Terrorist attacks, assassinated British officials
                
                **Notable incidents:**
                - King David Hotel bombing (1946): 91 killed
                - Deir Yassin massacre (1948): 100+ villagers killed
                
                ---
                
                **The Holocaust and Immigration:**
                
                During/after WWII:
                - 6 million Jews murdered in Europe
                - Survivors sought refuge
                - Britain restricted immigration (White Paper, 1939)
                - Illegal immigration increased
                - International sympathy for Zionism grew
                
                The Holocaust was a horrific crime against humanity that strengthened the case for a Jewish state.
                
                ---
                
                **UN Partition Plan (1947):**
                
                **Resolution 181:**
                - Divided Palestine into Jewish and Arab states
                - Jerusalem as international zone
                - Jews (33% of population) got 56% of land
                - Arabs (67% of population) got 44% of land
                
                **Votes:** 33 for, 13 against, 10 abstentions
                
                **Reactions:**
                - Jewish Agency accepted (as starting point)
                - Arab states rejected
                - Palestinians rejected (why give away majority's land?)
                
                **The UN plan was never implemented.** Civil war began immediately.
                
                *Source: UN Archives; Benny Morris, "1948" (2008)*
                """,
                keyTakeaway: "Under British rule (1920-1948), Jewish population grew from 11% to 33%. The 1936 Arab Revolt was crushed. The UN proposed partition: 56% of land to 33% of population (Jews). Palestinians rejected giving away their majority's land."
            ),
            IPLesson(
                title: "1948: The Nakba",
                era: "1947-1949",
                color: .red,
                content: """
                **The Catastrophe**
                
                What Israelis call the War of Independence, Palestinians call the Nakba (Catastrophe).
                
                ---
                
                **The Numbers:**
                
                **750,000+ Palestinians became refugees**
                (Out of ~1.4 million Arab population)
                
                **400+ villages destroyed or depopulated**
                
                These numbers are documented by:
                - UN records
                - Israeli historians (Benny Morris, Ilan Pappé)
                - Palestinian historians
                - British records
                
                *Source: Benny Morris, "The Birth of the Palestinian Refugee Problem Revisited" (2004)*
                
                ---
                
                **How It Happened:**
                
                Israeli historian Benny Morris documented four causes:
                
                1. **Direct expulsion by Jewish forces** (documented in many cases)
                2. **Fear of violence after massacres** (Deir Yassin effect)
                3. **Psychological warfare** (loudspeaker warnings, rumors)
                4. **Some left expecting to return after fighting**
                
                **Not a single cause** but a combination—with significant forced expulsion.
                
                ---
                
                **Plan Dalet (March 1948):**
                
                Haganah military plan included:
                - Securing areas allocated to Jewish state
                - "Destruction of villages (setting fire to, blowing up, and planting mines)"
                - "Mounting search and control operations according to the following guidelines: encirclement, search, and in the event of resistance, destruction of armed forces and expulsion of population"
                
                *Source: Plan Dalet, declassified Israeli documents*
                
                ---
                
                **Deir Yassin (April 9, 1948):**
                
                Village near Jerusalem:
                - Attacked by Irgun and Lehi
                - 100-254 villagers killed (estimates vary)
                - Women and children among dead
                - News of massacre spread
                - Caused panic and flight in other areas
                
                Even mainstream Zionist leadership condemned it (publicly).
                
                *Source: Israeli and Palestinian accounts; Benny Morris*
                
                ---
                
                **The War:**
                
                **Phase 1 (Nov 1947-May 1948):** Civil war
                - Jewish forces gained advantage
                - Many Palestinians fled/expelled before states invaded
                
                **Phase 2 (May 1948-1949):** Arab-Israeli War
                - Israel declared independence (May 14)
                - Arab states invaded (May 15)
                - Israel won, expanded beyond partition lines
                - Armistice agreements (1949)
                
                **Result:** Israel controlled 78% of Palestine (not 56% of partition plan)
                
                ---
                
                **The Refugees:**
                
                750,000+ Palestinians ended up in:
                - Gaza Strip (under Egypt)
                - West Bank (under Jordan)
                - Lebanon
                - Syria
                - Jordan
                
                **UN Resolution 194 (1948):**
                
                > "Refugees wishing to return to their homes and live at peace with their neighbors should be permitted to do so..."
                
                Israel has never allowed mass return.
                
                **Today:** 5.9 million registered Palestinian refugees (including descendants)
                
                *Source: UNRWA statistics*
                """,
                keyTakeaway: "750,000+ Palestinians became refugees in 1948. Israeli historians document forced expulsions alongside other factors. 400+ villages were destroyed. UN Resolution 194 called for return—never implemented."
            ),
            IPLesson(
                title: "1967: Occupation Begins",
                era: "1967-Present",
                color: .orange,
                content: """
                **The Six-Day War and Its Aftermath**
                
                In June 1967, Israel captured the remaining Palestinian territories—and never left.
                
                ---
                
                **The Six-Day War (June 5-10, 1967):**
                
                Israel fought Egypt, Jordan, Syria:
                - Pre-emptive strike destroyed Egyptian air force
                - Captured Sinai Peninsula (Egypt)
                - Captured Gaza Strip (Egypt)
                - Captured West Bank and East Jerusalem (Jordan)
                - Captured Golan Heights (Syria)
                
                ---
                
                **UN Resolution 242 (November 1967):**
                
                Called for:
                - Israeli withdrawal from "territories occupied"
                - "Termination of all claims or states of belligerency"
                - Right of all states to live in peace
                
                **Still the framework for peace negotiations—56 years later.**
                
                ---
                
                **The Occupation Begins:**
                
                Israel's stated intention was temporary occupation pending peace.
                
                **57 years later, it continues.**
                
                Population under occupation (1967):
                - West Bank: ~600,000 Palestinians
                - Gaza: ~350,000 Palestinians
                - East Jerusalem: ~66,000 Palestinians
                
                Today:
                - West Bank: ~3 million
                - Gaza: ~2.1 million
                - East Jerusalem: ~350,000
                
                ---
                
                **Military Occupation:**
                
                Palestinians under occupation face:
                
                **Military law** (not civil law):
                - Military courts
                - Administrative detention (no charges)
                - Home demolitions
                - Movement restrictions
                
                **Checkpoints:**
                - Hundreds throughout West Bank
                - Control all movement
                - Hours of waiting
                
                **Permits required** for:
                - Travel between areas
                - Building homes
                - Accessing farmland
                - Family reunification
                
                *Source: B'Tselem (Israeli human rights organization)*
                
                ---
                
                **International Law:**
                
                The occupation is considered **illegal** under international law by:
                - UN General Assembly
                - International Court of Justice (2004 advisory opinion)
                - Most countries worldwide
                
                **Fourth Geneva Convention** prohibits:
                - Transfer of occupying power's population to occupied territory
                - Collective punishment
                - Destruction of property
                
                Israel disputes applicability but is bound by it under international consensus.
                
                ---
                
                **Why It Continues:**
                
                Various factors:
                - Security concerns (real attacks occur)
                - Settlements create "facts on the ground"
                - Religious attachment to land
                - Political pressures
                - No peace agreement
                
                **The occupation is now longer than most Israelis and Palestinians have been alive.**
                """,
                keyTakeaway: "Israel captured the West Bank and Gaza in 1967—57 years ago. UN Resolution 242 called for withdrawal. International law considers the occupation illegal. 5+ million Palestinians live under military rule."
            ),
            IPLesson(
                title: "Settlements: Facts on the Ground",
                era: "1967-Present",
                color: .red,
                content: """
                **Creating Irreversibility**
                
                Since 1967, Israel has built settlements throughout the occupied West Bank and East Jerusalem.
                
                ---
                
                **The Numbers (2024):**
                
                **West Bank settlements:** 130+ official, 100+ outposts
                **West Bank settlers:** ~500,000
                **East Jerusalem settlers:** ~220,000
                **Total:** ~720,000 Israeli settlers in occupied territory
                
                *Source: Peace Now; B'Tselem*
                
                ---
                
                **International Law:**
                
                **Fourth Geneva Convention, Article 49:**
                > "The Occupying Power shall not deport or transfer parts of its own civilian population into the territory it occupies."
                
                **UN Security Council Resolution 2334 (2016):**
                > Settlements have "no legal validity" and constitute "a flagrant violation under international law"
                
                **Vote:** 14-0 (US abstained under Obama)
                
                **International Court of Justice (2004):**
                Settlements are illegal.
                
                Every country except Israel considers settlements illegal. US position has varied.
                
                ---
                
                **How Settlements Expand:**
                
                1. **Land confiscation:**
                   - "State land" declarations
                   - Military zones
                   - "Absentee property"
                
                2. **Outposts:**
                   - Settlers establish unauthorized outposts
                   - Government eventually legalizes them
                
                3. **Infrastructure:**
                   - Settler-only roads
                   - Bypass Palestinians
                   - Fragment Palestinian territory
                
                ---
                
                **Impact on Palestinians:**
                
                **Land loss:**
                - Settlements control ~40% of West Bank
                - Palestinians confined to shrinking areas
                
                **Water:**
                - Settlers get 4x more water per capita
                - Palestinian wells restricted
                - Springs taken over
                
                **Movement:**
                - Roads bisect Palestinian areas
                - Checkpoints between Palestinian towns
                - Some areas completely surrounded
                
                **Violence:**
                - Settler attacks on Palestinians documented
                - 2023: 1,000+ attacks recorded
                - Rarely prosecuted
                
                *Source: UN OCHA; B'Tselem*
                
                ---
                
                **The "Two-State Solution":**
                
                Settlements make a Palestinian state increasingly difficult:
                
                - Largest settlements in strategic locations
                - East Jerusalem surrounded
                - West Bank fragmented
                - No territorial contiguity
                
                **Many argue this is the point:** Create facts that prevent Palestinian state.
                
                ---
                
                **Political Support:**
                
                Settlement expansion supported by:
                - Religious Zionists (divine right to land)
                - Secular nationalists (security, demographics)
                - Real estate interests (subsidized housing)
                - US evangelical Christians (prophecy beliefs)
                
                **Every Israeli government since 1967 has expanded settlements**—left, right, and center.
                """,
                keyTakeaway: "720,000 Israeli settlers live in occupied territory—illegal under international law. Settlements control 40% of West Bank, fragment Palestinian territory, and make a two-state solution increasingly impossible."
            ),
            IPLesson(
                title: "Gaza: The Blockade",
                era: "2007-Present",
                color: .gray,
                content: """
                **The World's Largest Open-Air Prison**
                
                Since 2007, Gaza's 2.1 million people have lived under a comprehensive blockade.
                
                ---
                
                **Background:**
                
                **2005:** Israel withdrew settlements from Gaza
                **2006:** Hamas won Palestinian legislative elections
                **2007:** Hamas took control of Gaza after conflict with Fatah
                **2007:** Israel and Egypt imposed blockade
                
                ---
                
                **The Blockade:**
                
                Israel and Egypt control all access:
                
                **Movement of people:**
                - Exits heavily restricted
                - Permits rarely granted
                - Many have never left
                
                **Goods controlled:**
                - Israel determines what enters
                - "Dual use" items banned (construction materials, medical equipment)
                - At times: chocolate, pasta, coriander banned
                
                **Water/electricity:**
                - Israel controls water supply
                - Electricity limited (4-12 hours/day)
                - Sewage systems failing
                
                ---
                
                **UN Assessment:**
                
                UN declared Gaza **"unlivable"** by 2020.
                
                Conditions in 2024:
                - 45% unemployment
                - 80% dependent on humanitarian aid
                - 97% of water undrinkable
                - Infrastructure collapsing
                
                *Source: UN OCHA, World Bank*
                
                ---
                
                **Is It Legal?**
                
                **International law:**
                
                The blockade has been called:
                - "Collective punishment" (illegal under Geneva Conventions)
                - A form of siege warfare
                
                **UN Human Rights Council** and other bodies have called for lifting the blockade.
                
                **Israel's position:** Security necessity due to Hamas rockets
                
                ---
                
                **Military Operations:**
                
                Major Israeli military operations in Gaza:
                
                | Operation | Year | Palestinian Deaths |
                |-----------|------|-------------------|
                | Cast Lead | 2008-09 | 1,400+ |
                | Pillar of Defense | 2012 | 170+ |
                | Protective Edge | 2014 | 2,200+ |
                | 2021 | 2021 | 250+ |
                | 2023-24 | Ongoing | 35,000+ |
                
                **Israeli deaths from Gaza rockets (2004-2023):** ~50
                
                *Sources: UN OCHA, Israeli government*
                
                ---
                
                **Hamas:**
                
                **What they are:**
                - Islamic resistance movement
                - Designated terrorist organization by US, EU, others
                - Governs Gaza since 2007
                - Fires rockets at Israel
                - Has killed Israeli civilians
                
                **October 7, 2023:**
                - Hamas attacked Israel
                - 1,200 Israelis killed
                - 240+ hostages taken
                - Deadliest day for Jews since Holocaust
                
                This was a horrific attack on civilians.
                
                ---
                
                **The Cycle:**
                
                - Blockade creates desperation
                - Desperation feeds extremism
                - Attacks provide justification for blockade
                - Repeat
                
                **Breaking this cycle requires addressing root causes, not just symptoms.**
                """,
                keyTakeaway: "Gaza's 2.1 million people have lived under blockade since 2007. UN called it 'unlivable.' 97% of water is undrinkable. Both Hamas attacks on civilians and collective punishment of Gaza's population are documented realities."
            ),
            IPLesson(
                title: "Apartheid Allegations",
                era: "2020s",
                color: .purple,
                content: """
                **The A-Word**
                
                Major human rights organizations have concluded Israel practices apartheid. This is contested.
                
                ---
                
                **What Is Apartheid?**
                
                International legal definition (Rome Statute):
                
                > "Inhumane acts... committed in the context of an institutionalized regime of systematic oppression and domination by one racial group over any other racial group"
                
                Key elements:
                - Systematic oppression
                - Domination of one group over another
                - Intent to maintain domination
                
                ---
                
                **Who Says It's Apartheid:**
                
                **Human Rights Watch (2021):**
                > "Israeli authorities are committing the crimes against humanity of apartheid and persecution."
                
                *Report: "A Threshold Crossed"*
                
                **Amnesty International (2022):**
                > "Israel has established and maintained an institutionalized regime of oppression and domination of the Palestinian population for the benefit of Jewish Israelis—a system of apartheid."
                
                *Report: "Israel's Apartheid Against Palestinians"*
                
                **B'Tselem (Israeli organization, 2021):**
                > "This is apartheid."
                
                **UN Special Rapporteur (2022):**
                Concluded Israel practices apartheid.
                
                ---
                
                **The Evidence Cited:**
                
                **Two legal systems:**
                - Israeli civilians: civil law
                - Palestinians: military law
                - In the same territory
                
                **Movement restrictions:**
                - Checkpoints throughout West Bank
                - Permit system
                - Settler-only roads
                
                **Differential rights:**
                - Israeli settlers vote in Israeli elections
                - Palestinians cannot
                - Under same de facto sovereignty
                
                **Resource allocation:**
                - Water access unequal
                - Building permits denied to Palestinians
                - Land confiscation continues
                
                **Nationality law:**
                - 2018 Nation-State Law: Israel is for Jews
                - Palestinians cannot become citizens
                
                ---
                
                **Counter-Arguments:**
                
                **Israel and supporters argue:**
                - Israel is a democracy with Arab citizens
                - West Bank is disputed, not occupied
                - Security measures, not racial discrimination
                - Comparison to South Africa is false
                - These reports are biased
                
                **Arab citizens of Israel:**
                - Can vote
                - Serve in parliament
                - Have legal equality (formally)
                
                **However:**
                - Discrimination documented
                - Unequal resource allocation
                - Land access restrictions
                - 2018 law explicitly preferential
                
                ---
                
                **Why It Matters:**
                
                **If it is apartheid:**
                - International crime
                - Triggers legal obligations
                - Calls for sanctions
                - Changes diplomatic calculus
                
                **The word matters.** That's why it's so contested.
                
                *Source: Human Rights Watch, Amnesty International, B'Tselem reports*
                """,
                keyTakeaway: "Human Rights Watch, Amnesty International, B'Tselem, and UN rapporteurs have concluded Israel practices apartheid. Israel disputes this. The determination has major legal implications."
            ),
            IPLesson(
                title: "US Support for Israel",
                era: "1948-Present",
                color: .blue,
                content: """
                **The Special Relationship**
                
                The United States provides unprecedented support to Israel.
                
                ---
                
                **Military Aid:**
                
                **Annual aid package:** $3.8 billion (2016-2026 MOU)
                - Largest recipient of US foreign aid
                - More than all other countries combined some years
                
                **Total since 1948:** $158+ billion (inflation-adjusted)
                
                **What it buys:**
                - F-35 fighter jets
                - Missile defense systems
                - Bombs and munitions
                - Military technology
                
                *Source: Congressional Research Service*
                
                ---
                
                **UN Vetoes:**
                
                US has vetoed **53 UN Security Council resolutions** critical of Israel (as of 2024).
                
                More than all other vetoes combined.
                
                **Topics vetoed:**
                - Settlement condemnation
                - Military operation criticism
                - Calls for ceasefire
                - Palestinian rights
                
                ---
                
                **Why?**
                
                Multiple factors:
                
                **1. Strategic Alliance:**
                - Regional ally in Middle East
                - Intelligence sharing
                - Military cooperation
                
                **2. Domestic Politics:**
                - AIPAC and pro-Israel lobbying (see earlier course)
                - Evangelical Christian support
                - Bipartisan consensus (until recently)
                
                **3. Shared Values Narrative:**
                - "Only democracy in Middle East"
                - "Shared values" (contested)
                
                **4. Holocaust:**
                - Moral weight of Jewish persecution
                - "Never again" commitment
                
                ---
                
                **What Aid Enables:**
                
                US weapons used in:
                - Gaza operations
                - West Bank military actions
                - Air strikes
                
                **Leahy Law:**
                - Prohibits aid to units committing human rights violations
                - Rarely enforced for Israel
                - State Department has largely exempted Israel
                
                **US citizens killed by Israel:**
                - Rachel Corrie (2003)
                - Shireen Abu Akleh (2022)
                - Others
                - No consequences
                
                ---
                
                **Changing Attitudes:**
                
                **American public opinion shifting:**
                
                2023 polling:
                - 50% of Democrats sympathize more with Palestinians than Israel
                - Generational divide: younger Americans more critical
                - Still bipartisan establishment consensus
                
                **Congress:**
                - "The Squad" and progressives more critical
                - Still overwhelming votes for aid
                - Conditioning aid remains taboo
                
                ---
                
                **International Isolation:**
                
                US positions increasingly isolated:
                - UN votes often 150+ to 5-10
                - Only US, Israel, and small nations vote together
                - Allies like Germany, France vote differently
                
                **The US is Israel's crucial shield from international pressure.**
                """,
                keyTakeaway: "$3.8 billion annually. 53 UN vetoes. US weapons used in military operations. The US provides unprecedented support—making it uniquely responsible for what that support enables."
            ),
            IPLesson(
                title: "Palestinian Perspectives",
                era: "Past and Present",
                color: .green,
                content: """
                **Voices Often Unheard**
                
                Palestinian perspectives are rarely centered in Western media. Here they are.
                
                ---
                
                **The Core Grievances:**
                
                **1. Dispossession:**
                - 750,000+ expelled in 1948
                - Property seized, never returned
                - Villages destroyed
                - Right of return denied
                
                **2. Ongoing occupation:**
                - 57 years under military rule
                - No citizenship, no state
                - Daily humiliations
                - Children tried in military courts
                
                **3. Erasure:**
                - History denied
                - Existence questioned
                - "There is no such thing as Palestinians" (commonly said)
                - Maps that erase them
                
                ---
                
                **Palestinian Voices:**
                
                **Mahmoud Darwish (poet):**
                > "We suffer from an incurable disease called hope."
                
                **Edward Said (scholar):**
                > "The question of Palestine is therefore the question of how to live with a colonial occupation."
                
                **Rashid Khalidi (historian):**
                > "The Palestinians have never been accorded their legitimate rights."
                
                ---
                
                **What Palestinians Want:**
                
                Consistent demands over decades:
                
                1. **End of occupation**
                2. **Right of return** (or compensation) for refugees
                3. **East Jerusalem as capital**
                4. **Viable, contiguous state** OR equal rights in one state
                5. **Recognition of Nakba**
                
                ---
                
                **The Two-State Solution:**
                
                **Palestinians accepted:**
                - 22% of historic Palestine (West Bank, Gaza, East Jerusalem)
                - This was the PLO position since 1988
                - Massive compromise from original position
                
                **Israel has not accepted** a viable Palestinian state:
                - Continued settlement expansion
                - No withdrawal to 1967 lines
                - Jerusalem not negotiable
                
                ---
                
                **Life Under Occupation:**
                
                **Children:**
                - Can be arrested from age 12
                - Military courts with 99% conviction rate
                - 500-700 detained at any time
                
                **Farmers:**
                - Land confiscated for settlements
                - Olive trees uprooted
                - Can't access their own fields
                
                **Families:**
                - Family separation (permits denied)
                - Home demolitions (thousands)
                - Unable to build (permits rejected)
                
                *Source: Defense for Children International; UN reports*
                
                ---
                
                **Palestinian Resistance:**
                
                Has included:
                - Nonviolent protest (often met with violence)
                - Boycotts and strikes
                - Political organizing
                - Armed resistance (controversial)
                
                **International law** recognizes right to resist occupation.
                **But** targeting civilians is a war crime.
                
                ---
                
                **Why This Matters:**
                
                Palestinians are not abstractions:
                - 14 million people
                - With families, dreams, history
                - Under conditions no American would accept
                - Asking for rights taken for granted elsewhere
                
                **Understanding their perspective is not "taking sides"—it's seeing the full picture.**
                """,
                keyTakeaway: "Palestinians seek: end of occupation, right of return, viable state or equal rights. They accepted 22% of historic Palestine—Israel hasn't accepted even that. 14 million people asking for rights others take for granted."
            ),
            IPLesson(
                title: "Where Do We Go?",
                era: "Present and Future",
                color: .yellow,
                content: """
                **Possible Futures**
                
                After decades of failed peace processes, what are the options?
                
                ---
                
                **Option 1: Two-State Solution**
                
                **What it means:**
                - Israel within 1967 borders (roughly)
                - Palestinian state in West Bank/Gaza
                - East Jerusalem as Palestinian capital
                - Some land swaps
                - Refugee issue addressed (unclear how)
                
                **Challenges:**
                - 720,000 settlers in occupied territory
                - Jerusalem deeply contested
                - No trust between parties
                - No Israeli government supports it
                - Settlements may have made it impossible
                
                **International consensus:** Still the official position of most countries
                
                ---
                
                **Option 2: One State (Equal Rights)**
                
                **What it means:**
                - Single state from river to sea
                - Equal citizenship for all
                - Democracy with Jewish and Palestinian citizens
                
                **Challenges:**
                - Jews would become minority (demographics)
                - Fundamentally challenges Zionist project
                - Deep distrust between communities
                - No political support in Israel
                
                **Some Palestinians and Israelis** now advocate this.
                
                ---
                
                **Option 3: One State (Unequal)**
                
                **Current trajectory:**
                - Israel controls all territory
                - Palestinians have no rights or limited autonomy
                - Continued occupation indefinitely
                - Formal annexation possible
                
                **This is essentially the status quo**—called apartheid by human rights organizations.
                
                ---
                
                **Option 4: Continued Conflict**
                
                **Without resolution:**
                - Periodic wars
                - More suffering on all sides
                - Radicalization
                - Regional instability
                - No peace
                
                ---
                
                **What Would Peace Require?**
                
                From any perspective, peace requires:
                
                **Israelis:**
                - Security guarantees
                - Recognition
                - End of violence against civilians
                
                **Palestinians:**
                - End of occupation
                - Self-determination
                - Justice for refugees
                - Recognition of their history
                
                **Both:**
                - Acknowledgment of the other's suffering
                - Compromise on core issues
                - Leadership willing to take risks
                - International support
                
                ---
                
                **What Can You Do?**
                
                1. **Learn the history** (you're doing this)
                2. **Listen to voices from all sides**
                3. **Question media framing**
                4. **Support human rights universally**
                5. **Engage your representatives**
                6. **Reject dehumanization of anyone**
                
                ---
                
                **Final Thoughts:**
                
                There are no simple answers. But some things are clear:
                
                - **All human life has equal value**
                - **Occupation is not sustainable or just**
                - **Targeting civilians is wrong, whoever does it**
                - **History must be reckoned with**
                - **Justice and security are not opposites**
                
                **Understanding is the first step. What you do with that understanding is up to you.**
                """,
                keyTakeaway: "Two-state solution faces 720,000 settlers. One equal state challenges Zionism. Status quo is apartheid according to human rights groups. Peace requires security for Israelis and justice for Palestinians. All human life has equal value."
            )
        ]
    }
}

// MARK: - Models

struct IPLesson: Identifiable {
    let id = UUID()
    let title: String
    let era: String
    let color: Color
    let content: String
    let keyTakeaway: String
}

struct IPLessonView: View {
    let lesson: IPLesson
    let index: Int
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 24) {
                VStack(alignment: .leading, spacing: 8) {
                    HStack {
                        Text("Lesson \(index)")
                            .font(.system(size: 12, weight: .medium))
                            .foregroundColor(lesson.color)
                            .padding(.horizontal, 10)
                            .padding(.vertical, 4)
                            .background(lesson.color.opacity(0.2))
                            .cornerRadius(8)
                        
                        Text(lesson.era)
                            .font(.system(size: 12))
                            .foregroundColor(.gray)
                    }
                    
                    Text(lesson.title)
                        .font(.system(size: 26, weight: .bold))
                        .foregroundColor(.white)
                }
                
                Divider().background(Color.white.opacity(0.2))
                
                Text(lesson.content)
                    .font(.system(size: 15))
                    .foregroundColor(.white.opacity(0.9))
                    .lineSpacing(6)
                
                VStack(alignment: .leading, spacing: 12) {
                    HStack {
                        Image(systemName: "lightbulb.fill")
                            .foregroundColor(lesson.color)
                        Text("Key Takeaway")
                            .font(.system(size: 14, weight: .bold))
                            .foregroundColor(lesson.color)
                    }
                    
                    Text(lesson.keyTakeaway)
                        .font(.system(size: 16, weight: .medium))
                        .foregroundColor(.white)
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

#Preview {
    NavigationView {
        IsraelPalestineHistoryCourse()
    }
}
