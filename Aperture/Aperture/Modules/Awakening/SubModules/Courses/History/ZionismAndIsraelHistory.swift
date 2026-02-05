// ZionismAndIsraelHistory.swift
// The documented history - from Herzl to today
// Factual. Cited. Primary sources.

import SwiftUI

struct ZionismAndIsraelHistory: View {
    
    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                // Course Header
                courseHeader
                
                // Note on approach
                approachNote
                
                // Lessons
                ForEach(Array(lessons.enumerated()), id: \.offset) { index, lesson in
                    NavigationLink(destination: ZionismLessonView(lesson: lesson, index: index + 1)) {
                        lessonRow(lesson, index: index)
                    }
                }
                
                // Sources
                sourcesSection
            }
        }
        .background(Color.black.ignoresSafeArea())
        .navigationTitle("Zionism & Israel")
        .navigationBarTitleDisplayMode(.inline)
    }
    
    private var courseHeader: some View {
        VStack(spacing: 16) {
            ZStack {
                Circle()
                    .fill(Color.blue.opacity(0.2))
                    .frame(width: 100, height: 100)
                
                Image(systemName: "book.closed.fill")
                    .font(.system(size: 44))
                    .foregroundColor(.blue)
            }
            
            Text("Zionism & Israel")
                .font(.system(size: 24, weight: .bold))
                .foregroundColor(.white)
            
            Text("A Documented History")
                .font(.system(size: 14))
                .foregroundColor(.gray)
            
            HStack {
                Text("8 Lessons")
                    .font(.system(size: 12, weight: .medium))
                    .foregroundColor(.gray)
                Spacer()
                Text("~70 min")
                    .font(.system(size: 12, weight: .medium))
                    .foregroundColor(.gray)
            }
            .padding(.horizontal)
        }
        .padding()
    }
    
    private var approachNote: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Image(systemName: "doc.text.magnifyingglass")
                    .foregroundColor(.blue)
                Text("Our Approach")
                    .font(.system(size: 14, weight: .bold))
                    .foregroundColor(.white)
            }
            
            Text("This course presents documented history using primary sources: diaries, letters, official documents, and statements from historical figures themselves. We distinguish between Judaism (a religion), Jewish people (an ethnic/religious group), and Zionism (a political ideology). Criticism of Israeli government policies is not antisemitism, just as criticism of any government is not hatred of its people.")
                .font(.system(size: 12))
                .foregroundColor(.gray)
                .lineSpacing(4)
        }
        .padding()
        .background(Color.blue.opacity(0.1))
        .cornerRadius(12)
        .padding()
    }
    
    private func lessonRow(_ lesson: ZionismLesson, index: Int) -> some View {
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
                Text(lesson.period)
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
                sourceRow("Herzl's Diaries", "Complete Diaries of Theodor Herzl")
                sourceRow("Balfour Declaration", "British National Archives")
                sourceRow("UN Documents", "UNISPAL Archive")
                sourceRow("Israeli Historians", "Benny Morris, Ilan Pappé, Tom Segev")
                sourceRow("British Cabinet Papers", "UK National Archives")
                sourceRow("Declassified Israeli Documents", "Israel State Archives")
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
    
    private var lessons: [ZionismLesson] {
        [
            ZionismLesson(
                title: "Origins of Zionism",
                period: "1880s-1897",
                color: .blue,
                content: """
                **What is Zionism?**
                
                Zionism is a political ideology that emerged in 19th century Europe, advocating for the establishment of a Jewish homeland.
                
                ---
                
                **Historical Context:**
                
                In late 19th century Europe:
                - Jews faced persecution, pogroms (violent attacks)
                - Russian Empire: Pogroms killed thousands
                - Antisemitism was widespread
                - Dreyfus Affair (France, 1894): Jewish officer falsely convicted of treason
                
                Many Jewish thinkers sought solutions:
                - Some advocated assimilation
                - Some advocated socialism
                - Some advocated territorial nationalism (Zionism)
                
                ---
                
                **Theodor Herzl:**
                
                Austrian Jewish journalist, founder of political Zionism.
                
                **"Der Judenstaat" (The Jewish State, 1896):**
                - Argued Jews needed their own state
                - Antisemitism was "incurable"
                - Proposed organized emigration to a territory
                
                **First Zionist Congress (Basel, 1897):**
                - 200+ delegates from across Europe
                - Created World Zionist Organization
                - Basel Program: "Zionism aims at establishing for the Jewish people a publicly and legally assured home in Palestine"
                
                Herzl's diary entry after the Congress:
                > "At Basel, I founded the Jewish State. If I said this out loud today, I would be answered by universal laughter. Perhaps in five years, certainly in fifty, everyone will know it."
                
                **Source:** The Complete Diaries of Theodor Herzl
                
                ---
                
                **The Land Question:**
                
                Herzl initially considered multiple locations:
                - Argentina
                - Uganda (British offer, 1903)
                - Palestine
                
                Palestine was chosen for religious/historical significance, though Herzl himself was secular.
                
                **The Problem:**
                
                Palestine in the 1890s:
                - Population: ~500,000 Arabs, ~25,000 Jews
                - Arabs were 94% of population
                - Had lived there for centuries
                - Not an "empty land"
                
                Early Zionists were aware of this:
                
                **Ahad Ha'am** (cultural Zionist, visited Palestine 1891):
                > "We tend to believe abroad that Palestine is nowadays almost completely deserted... but in reality it is not so... Arabs, especially those in towns, see and understand our actions and aims in the country... and they try to obstruct us."
                
                **Source:** "Truth from Eretz Yisrael" (1891)
                
                ---
                
                **Early Migration:**
                
                **First Aliyah (1882-1903):**
                - ~25,000-35,000 Jewish immigrants to Palestine
                - Mostly from Russian Empire, fleeing pogroms
                - Founded agricultural settlements
                - Funded by Baron Edmond de Rothschild
                
                **Second Aliyah (1904-1914):**
                - ~35,000 immigrants
                - More ideological, socialist
                - Founded kibbutzim (collective farms)
                - Established Hebrew as daily language
                
                **Key Development:**
                
                The principle of "Hebrew labor" (Avodah Ivrit):
                - Jewish businesses should hire only Jews
                - Displaced Arab workers
                - Created parallel economies
                
                This was acknowledged by Zionist leaders as displacing the existing population.
                """,
                keyTakeaway: "Zionism emerged from real persecution of Jews in Europe. From the beginning, Zionist leaders knew Palestine was inhabited. Early immigration displaced Arab workers through 'Hebrew labor' policies. These tensions were recognized from the start."
            ),
            ZionismLesson(
                title: "The Balfour Declaration",
                period: "1917",
                color: .orange,
                content: """
                **The British Promise**
                
                The Balfour Declaration is one of the most consequential documents in modern history.
                
                ---
                
                **The Text:**
                
                November 2, 1917, letter from British Foreign Secretary Arthur Balfour to Lord Rothschild:
                
                > "His Majesty's Government view with favour the establishment in Palestine of a national home for the Jewish people, and will use their best endeavours to facilitate the achievement of this object, it being clearly understood that nothing shall be done which may prejudice the civil and religious rights of existing non-Jewish communities in Palestine."
                
                **Source:** British National Archives
                
                ---
                
                **What's Notable:**
                
                1. **One nation (Britain) promised** a second nation (Zionists) the land of a third nation (Palestinians)
                
                2. **Palestinians were not named** - referred to only as "existing non-Jewish communities" (though they were 90% of the population)
                
                3. **They had "civil and religious rights"** but not political or national rights
                
                4. **Jews everywhere got "national home"** status, Arabs got nothing
                
                ---
                
                **Why Britain Made This Promise:**
                
                **Strategic reasons:**
                - WWI was ongoing
                - British wanted control of Palestine (route to India, Suez Canal)
                - Hoped to gain support of Jewish communities worldwide
                - Wanted to preempt French claims to the region
                
                **Chaim Weizmann:**
                - Russian-born chemist living in Britain
                - Developed process for producing acetone (needed for explosives)
                - Used connections to lobby for Zionism
                - Later became first President of Israel
                
                ---
                
                **The Contradictions:**
                
                Britain made multiple, contradictory promises:
                
                **1. Hussein-McMahon Correspondence (1915-1916):**
                - Promised Arabs independence if they revolted against Ottomans
                - Arabs understood this included Palestine
                - British later claimed it didn't
                
                **2. Sykes-Picot Agreement (1916):**
                - Secret agreement with France
                - Divided Middle East between European powers
                - Contradicted Arab independence promises
                
                **3. Balfour Declaration (1917):**
                - Promised Jewish national home
                - Contradicted Arab promises
                
                Three incompatible promises made to secure wartime advantage.
                
                ---
                
                **Arab Response:**
                
                Arabs were not consulted. When they learned of Balfour:
                
                **King-Crane Commission (1919):**
                - U.S. fact-finding mission
                - Found 90% of Palestine's inhabitants opposed Zionist program
                - Recommended against unlimited Jewish immigration
                - Report was suppressed by Britain and France
                
                **Source:** King-Crane Commission Report (declassified)
                
                ---
                
                **The Mandate:**
                
                After WWI, League of Nations gave Britain "mandate" over Palestine.
                
                **The Mandate document incorporated Balfour Declaration** and committed Britain to:
                - Facilitate Jewish immigration
                - Facilitate "close settlement by Jews on the land"
                - While somehow also protecting Arab rights
                
                This was a contradiction that could not be resolved.
                """,
                keyTakeaway: "Britain promised Palestine to Zionists without consulting the 90% Arab population—while also promising Arabs independence. These contradictory promises created a conflict that continues today."
            ),
            ZionismLesson(
                title: "The British Mandate",
                period: "1920-1947",
                color: .purple,
                content: """
                **Growing Tensions Under British Rule**
                
                For 27 years, Britain tried to manage contradictory promises. It failed.
                
                ---
                
                **Jewish Immigration:**
                
                | Period | Jewish Immigration |
                |--------|-------------------|
                | 1920-1929 | ~100,000 |
                | 1930-1939 | ~250,000 (fleeing Nazi Germany) |
                | 1940-1947 | ~100,000 (despite restrictions) |
                
                **Jewish population grew from 11% (1922) to 33% (1947).**
                
                **Source:** British Mandatory Government statistics
                
                ---
                
                **Land Purchases:**
                
                Jewish organizations bought land, often from absentee landlords:
                
                - **Jewish National Fund (JNF):**
                  - Bought land as "inalienable" Jewish property
                  - Could never be sold to non-Jews
                  - Evicted Arab tenant farmers
                
                - By 1947: Jews owned ~7% of Palestine's land
                - But Zionist plan was for Jewish state on much more
                
                ---
                
                **Arab Resistance:**
                
                **1920-1921:** Riots in Jerusalem, Jaffa
                
                **1929:** Western Wall disturbances - 133 Jews, 116 Arabs killed
                
                **1936-1939: The Arab Revolt**
                - General strike, then armed rebellion
                - Britain deployed 25,000+ troops
                - Thousands of Arabs killed, detained
                - Arab political leadership decimated
                - Houses demolished as collective punishment
                
                **Source:** British colonial records; Rashid Khalidi, "The Iron Cage"
                
                ---
                
                **British Commissions:**
                
                Multiple British commissions tried to find solutions:
                
                **Peel Commission (1937):**
                - First to recommend partition
                - Jewish state on ~20% of Palestine
                - Arab state on rest (to merge with Jordan)
                - Population transfers proposed
                
                **Zionist response:** Accepted principle, negotiated for more land
                **Arab response:** Rejected (why give up any land?)
                
                **White Paper (1939):**
                - Limited Jewish immigration to 75,000 over 5 years
                - Limited land purchases
                - Promised independent Palestine with Arab majority within 10 years
                
                **Zionist response:** Rejected, some turned to armed resistance
                **Arab response:** Too little, too late
                
                ---
                
                **Zionist Military Organizations:**
                
                **Haganah:**
                - Main Zionist militia
                - Later became Israel Defense Forces
                
                **Irgun:**
                - Revisionist Zionist militia
                - Led by Menachem Begin (later PM)
                - Bombed King David Hotel (1946) - 91 killed
                - Deir Yassin massacre (1948)
                
                **Lehi (Stern Gang):**
                - Assassinated British minister Lord Moyne (1944)
                - Assassinated UN mediator Count Bernadotte (1948)
                - Leaders later became Israeli politicians
                
                **Source:** British records; Benny Morris, "Righteous Victims"
                
                ---
                
                **The Holocaust Factor:**
                
                - 6 million Jews murdered by Nazis
                - Created massive refugee crisis
                - Survivors sought to emigrate
                - Britain maintained immigration limits
                - Ships turned away (Exodus 1947)
                - Moral pressure on world to support Jewish state
                
                **The Holocaust did not cause Zionism** (which began 50 years earlier), but it dramatically accelerated support and immigration.
                
                ---
                
                **Britain Gives Up:**
                
                By 1947:
                - 100,000 British troops in Palestine
                - Attacked by both Jewish militias and Arab fighters
                - Financially exhausted after WWII
                - Turned problem over to newly formed United Nations
                """,
                keyTakeaway: "Under British rule, Jewish immigration changed demographics from 11% to 33% Jewish. Arab revolt was crushed. Zionist militias fought British and Arabs. The Holocaust accelerated emigration. Britain eventually gave up."
            ),
            ZionismLesson(
                title: "1948: The Nakba",
                period: "1947-1949",
                color: .red,
                content: """
                **The Catastrophe**
                
                What Israelis call the "War of Independence," Palestinians call the Nakba (catastrophe).
                
                ---
                
                **UN Partition Plan (November 1947):**
                
                Resolution 181 proposed:
                - Jewish state: 56% of Palestine
                - Arab state: 43% of Palestine
                - Jerusalem: International control
                
                **Demographics at the time:**
                - Jews: 33% of population, owned 7% of land
                - Arabs: 67% of population
                
                **Jewish state would include ~45% Arab population.**
                
                **Source:** UN Archives
                
                **Zionist leadership accepted** (though wanted more).
                **Arab leadership rejected** (why accept losing majority of land?).
                
                ---
                
                **The War:**
                
                **Phase 1: Civil War (Nov 1947 - May 1948)**
                - Fighting between Jewish and Arab militias
                - British withdrew gradually
                - Zionist forces had military advantage (organization, training, weapons)
                
                **Phase 2: Arab-Israeli War (May 1948 - 1949)**
                - Israel declared independence May 14, 1948
                - Neighboring Arab states invaded
                - Israel won, expanded territory beyond UN partition
                
                ---
                
                **Plan Dalet (Plan D):**
                
                Haganah military plan, March 1948:
                
                Instructions included:
                > "Destruction of villages (setting fire to, blowing up, and planting mines in the debris), especially those population centers which are difficult to control continuously... In the event of resistance, the armed force must be wiped out and the population must be expelled outside the borders of the state."
                
                **Source:** Israel State Archives (declassified); Walid Khalidi translation
                
                **Israeli historians debate interpretation:**
                - Some say it was defensive
                - Others (Ilan Pappé) say it was ethnic cleansing plan
                
                ---
                
                **The Expulsions:**
                
                **700,000-750,000 Palestinians** fled or were expelled.
                
                **Causes (documented by Israeli historians):**
                
                1. **Direct expulsion by Jewish forces** (many villages)
                2. **Fear of massacres** (after Deir Yassin, others)
                3. **Psychological warfare** (loudspeakers, rumors)
                4. **Destruction of villages** (no homes to return to)
                5. **Some left expecting to return** after fighting
                
                **Benny Morris** (Israeli historian):
                > "A Jewish state would not have come into being without the uprooting of 700,000 Palestinians. Therefore it was necessary to uproot them."
                
                **Source:** Benny Morris, "The Birth of the Palestinian Refugee Problem Revisited"
                
                ---
                
                **Deir Yassin (April 9, 1948):**
                
                - Village near Jerusalem
                - Attacked by Irgun and Lehi
                - 100-250 villagers killed (numbers disputed)
                - Bodies mutilated
                - News spread, causing panic and flight elsewhere
                
                **Menachem Begin** (Irgun leader, later PM):
                > "Arabs throughout the country... were seized with limitless panic and started to flee for their lives."
                
                **Source:** Begin's memoir "The Revolt"
                
                ---
                
                **The Result:**
                
                - **78%** of Mandatory Palestine became Israel (not 56% as UN proposed)
                - **400+** Palestinian villages destroyed
                - **700,000-750,000** refugees (many still in camps)
                - **Depopulated areas** settled by Jewish immigrants
                
                ---
                
                **The Refugees:**
                
                **UN Resolution 194 (December 1948):**
                > "Refugees wishing to return to their homes and live at peace with their neighbors should be permitted to do so at the earliest practicable date."
                
                Israel has never allowed returns.
                
                Today: ~5.9 million registered Palestinian refugees (UNRWA)
                
                **Source:** UN Archives; UNRWA
                """,
                keyTakeaway: "700,000-750,000 Palestinians fled or were expelled in 1948. Israeli historians have documented direct expulsions, massacres, and psychological warfare. UN called for their return. Israel refused. Their descendants remain refugees today."
            ),
            ZionismLesson(
                title: "1967 and Occupation",
                period: "1967-Present",
                color: .orange,
                content: """
                **The Six-Day War and Its Aftermath**
                
                In June 1967, Israel captured territories it has occupied ever since.
                
                ---
                
                **The 1967 War:**
                
                **Context:**
                - Tensions building with Egypt, Syria
                - Egypt blockaded Straits of Tiran
                - Nasser's rhetoric (though capabilities limited)
                
                **June 5-10, 1967:**
                - Israel launched preemptive strike
                - Destroyed Egyptian air force on ground
                - Captured Sinai Peninsula, Gaza Strip (from Egypt)
                - Captured West Bank, East Jerusalem (from Jordan)
                - Captured Golan Heights (from Syria)
                
                **Israeli leaders knew Arabs were not about to attack:**
                
                **Yitzhak Rabin** (Chief of Staff):
                > "I do not believe that Nasser wanted war. The two divisions he sent into Sinai on May 14 would not have been enough to unleash an offensive against Israel. He knew it and we knew it."
                
                **Menachem Begin:**
                > "The Egyptian army concentrations in the Sinai approaches do not prove that Nasser was really about to attack us. We must be honest with ourselves. We decided to attack him."
                
                **Source:** Israeli cabinet minutes; interviews in Haaretz
                
                ---
                
                **Occupation Begins:**
                
                Israel has now occupied the West Bank and Gaza for **57+ years** (as of 2024).
                
                This is one of the **longest military occupations in modern history**.
                
                ---
                
                **The Settlements:**
                
                Immediately after 1967, Israel began building settlements in occupied territories.
                
                **International Law:**
                - **Fourth Geneva Convention, Article 49:**
                  > "The Occupying Power shall not deport or transfer parts of its own civilian population into the territory it occupies."
                
                - **UN Security Council Resolution 446 (1979):**
                  > "The policy and practices of Israel in establishing settlements... have no legal validity."
                
                **Every country except Israel** considers settlements illegal.
                
                **Source:** International Court of Justice Advisory Opinion (2004)
                
                ---
                
                **Settlement Growth:**
                
                | Year | Settlers in West Bank |
                |------|----------------------|
                | 1972 | 1,500 |
                | 1983 | 22,000 |
                | 1993 | 116,000 |
                | 2005 | 253,000 |
                | 2023 | 700,000+ |
                
                This growth continued under every Israeli government—left and right.
                
                ---
                
                **The Occupation System:**
                
                **Two legal systems:**
                - Israeli settlers: Israeli civilian law
                - Palestinians: Israeli military law
                
                **Restrictions on Palestinians:**
                - Checkpoints throughout West Bank
                - Permit system to travel, work, access own land
                - Home demolitions without trial
                - Administrative detention (imprisonment without charge)
                - Night raids
                - Separation wall (85% built inside West Bank)
                
                **Source:** B'Tselem (Israeli human rights organization)
                
                ---
                
                **Gaza:**
                
                - Occupied 1967-2005
                - Israel withdrew settlers in 2005
                - But maintained control of borders, airspace, water
                - Blockade since 2007 (after Hamas election)
                - UN: Still occupied under international law
                - Called "world's largest open-air prison"
                
                ---
                
                **Jerusalem:**
                
                - East Jerusalem annexed (not recognized internationally)
                - Palestinian residents: "Permanent residents" not citizens
                - Can lose residency if they leave too long
                - Home demolitions in Palestinian neighborhoods
                - Settlement expansion continues
                
                ---
                
                **What Israeli Leaders Have Said:**
                
                **Moshe Dayan** (Defense Minister, 1967):
                > "We don't have a solution... You shall continue to live like dogs, and whoever wants to can leave."
                
                **Ariel Sharon** (as Housing Minister, 1991):
                > "Everybody has to move, run and grab as many hilltops as they can to enlarge the settlements, because everything we take now will stay ours. Everything we don't grab will go to them."
                
                **Source:** Israeli media archives
                """,
                keyTakeaway: "Israel has occupied the West Bank for 57+ years—one of history's longest occupations. 700,000+ settlers live in territories the entire world considers illegally occupied. Palestinians live under military law while settlers have civil rights."
            ),
            ZionismLesson(
                title: "U.S.-Israel Relations",
                period: "1948-Present",
                color: .blue,
                content: """
                **The "Special Relationship"**
                
                The U.S.-Israel relationship is unlike any other in American foreign policy.
                
                ---
                
                **The Aid:**
                
                **Current commitment (2016-2026):**
                - $3.8 billion per year in military aid
                - Largest recipient of U.S. foreign aid
                - Total since 1948: $158 billion+
                
                **What makes this unique:**
                - Israel is a wealthy country (GDP per capita higher than many EU nations)
                - Aid continues regardless of human rights concerns
                - Aid is largely unconditional
                
                **Source:** Congressional Research Service
                
                ---
                
                **UN Vetoes:**
                
                The U.S. has vetoed **more UN Security Council resolutions on Israel** than on any other topic.
                
                | Period | U.S. Vetoes on Israel |
                |--------|----------------------|
                | 1972-2023 | 50+ |
                
                Vetoed resolutions on:
                - Settlements
                - Attacks on Gaza
                - Annexation
                - Assassinations
                - Collective punishment
                
                **Source:** UN Security Council records
                
                ---
                
                **AIPAC:**
                
                **American Israel Public Affairs Committee:**
                - Largest pro-Israel lobbying group
                - Rated one of most powerful lobbies in Washington
                - Annual policy conference: 18,000+ attendees
                - Congressional members regularly speak
                
                **2022:** AIPAC created Super PAC (United Democracy Project):
                - Spent $26+ million in first cycle
                - Targeted progressive Democrats critical of Israel
                - Defeated some, scared others
                
                **Source:** OpenSecrets.org
                
                ---
                
                **Why Such Strong Support?**
                
                **Historical factors:**
                - Holocaust created sympathy for Jewish state
                - Cold War: Israel seen as ally against Soviet-backed Arabs
                - Shared "democratic values" narrative
                
                **Domestic politics:**
                - Evangelical Christian Zionism (religious belief in Israel)
                - AIPAC and pro-Israel lobbying
                - Campaign contributions
                - Fear of being labeled antisemitic
                
                **Strategic interests:**
                - Intelligence sharing
                - Weapons testing
                - Regional ally
                - Defense industry profits
                
                ---
                
                **What Critics Say:**
                
                **John Mearsheimer and Stephen Walt** ("The Israel Lobby"):
                - Argued Israel lobby distorts U.S. foreign policy
                - U.S. support for Israel harms U.S. interests
                - Attacked as antisemitic (they're not Jewish)
                
                **What they actually argued:**
                - Not about Jewish conspiracy
                - About how lobbying works in U.S. system
                - Similar to any other interest group, but more powerful
                
                **Source:** "The Israel Lobby and U.S. Foreign Policy" (2007)
                
                ---
                
                **The Cost:**
                
                **To Americans:**
                - Billions in aid annually
                - Target of terrorism (bin Laden cited U.S.-Israel as motivation)
                - Damaged reputation in Arab/Muslim world
                
                **To Palestinians:**
                - U.S. weapons used against them
                - U.S. vetoes protect Israel from accountability
                - U.S. diplomacy consistently favors Israel
                
                ---
                
                **Changing Attitudes:**
                
                **Among American Jews:**
                - Younger Jews more critical of Israeli policies
                - Organizations like J Street, IfNotNow represent alternatives
                - Orthodox Jews more supportive, secular Jews less
                
                **Among Democrats:**
                - Growing divide between base and leadership
                - Progressive members more willing to criticize
                - "Squad" members face intense pressure
                
                **Among Republicans:**
                - Christian Zionist base strongly pro-Israel
                - Criticism nearly nonexistent
                - Competition to be more pro-Israel
                
                **Source:** Gallup, Pew polling
                """,
                keyTakeaway: "The U.S. gives Israel $3.8 billion/year and has vetoed 50+ UN resolutions protecting it. AIPAC is one of the most powerful lobbies. This support continues regardless of Israeli policies, unlike any other bilateral relationship."
            ),
            ZionismLesson(
                title: "Human Rights Documentation",
                period: "Contemporary",
                color: .red,
                content: """
                **What Human Rights Organizations Say**
                
                Major human rights organizations have documented the situation. Their findings are consistent.
                
                ---
                
                **Amnesty International (2022):**
                
                Report: "Israel's Apartheid Against Palestinians"
                
                > "Israel has established and maintained an institutionalized regime of oppression and domination of the Palestinian population for the benefit of Jewish Israelis—a system of apartheid."
                
                Documented:
                - Territorial fragmentation
                - Segregation and control
                - Dispossession of land and property
                - Denial of rights
                
                **Source:** amnesty.org (full report available)
                
                ---
                
                **Human Rights Watch (2021):**
                
                Report: "A Threshold Crossed: Israeli Authorities and the Crimes of Apartheid and Persecution"
                
                > "The finding of apartheid is based on an overall policy to maintain the domination by Jewish Israelis over Palestinians... and the grave abuses committed against Palestinians living in the occupied territory."
                
                **Source:** hrw.org (full report available)
                
                ---
                
                **B'Tselem (2021):**
                
                **Israeli human rights organization:**
                
                Report: "A regime of Jewish supremacy from the Jordan River to the Mediterranean Sea: This is apartheid"
                
                > "The bar for labeling the Israeli regime as apartheid has been met... Not because it is identical to the South African apartheid regime, but because the core principle of apartheid is the same."
                
                **Source:** btselem.org
                
                ---
                
                **United Nations:**
                
                **UN Special Rapporteur (2022):**
                - Michael Lynk concluded Israel's occupation meets definition of apartheid
                - Called for international accountability
                
                **UN Human Rights Council:**
                - Repeated condemnations of settlement policy
                - Called for end to occupation
                
                **International Court of Justice (2004):**
                - Advisory opinion: Separation wall is illegal
                - Israel must cease construction
                - Israel ignored ruling
                
                ---
                
                **What "Apartheid" Means:**
                
                Under international law (Rome Statute, Apartheid Convention):
                
                Apartheid is:
                - Systematic oppression
                - Domination of one group over another
                - With intent to maintain domination
                
                **It does not mean:**
                - Identical to South Africa
                - That all situations are the same
                
                The legal question: Does the system meet the definition?
                These organizations concluded: Yes.
                
                ---
                
                **Daily Realities Documented:**
                
                **Movement restrictions:**
                - 700+ checkpoints and barriers
                - Permit system for Palestinians
                - Roads restricted by ethnicity
                
                **Home demolitions:**
                - 50,000+ structures demolished since 1967
                - Often with no notice
                - Family possessions destroyed
                
                **Administrative detention:**
                - Imprisonment without charge or trial
                - Renewable indefinitely
                - ~500-1,000 Palestinians at any time
                
                **Child detention:**
                - Israel is only country that systematically prosecutes children in military courts
                - ~500-700 Palestinian children detained annually
                
                **Source:** UNICEF; Defense for Children International
                
                ---
                
                **Israeli Voices:**
                
                **Former Shin Bet chiefs** (documentary "The Gatekeepers"):
                - All six living former heads criticized occupation
                - "We've become cruel"
                - "We are making them desperate"
                
                **Breaking the Silence:**
                - Organization of Israeli soldiers
                - Publish testimonies about service in occupied territories
                - Reveal systematic nature of abuses
                
                **Source:** breakingthesilence.org.il
                
                ---
                
                **The Response:**
                
                Israel's response to these findings:
                - Organizations are "biased"
                - Reports are "antisemitic"
                - Definitions don't apply
                
                But the documentation is extensive, consistent across organizations, and based on observable facts and international legal definitions.
                """,
                keyTakeaway: "Amnesty International, Human Rights Watch, B'Tselem (Israeli organization), and UN bodies have concluded Israel practices apartheid. This is based on documented facts and international legal definitions, not opinion."
            ),
            ZionismLesson(
                title: "Conclusion: Seeing Clearly",
                period: "Understanding",
                color: .white,
                content: """
                **What We've Learned**
                
                This course presented documented history—not opinion, not propaganda, but what the historical record shows.
                
                ---
                
                **Key Facts:**
                
                1. **Zionism** is a political ideology, not identical to Judaism or Jewish identity
                
                2. **Palestine was not empty** when Zionism began—it had a population that was displaced
                
                3. **Britain made contradictory promises** that created the conflict
                
                4. **700,000+ Palestinians** were expelled or fled in 1948 and were never allowed to return
                
                5. **The occupation** has lasted 57+ years—one of history's longest
                
                6. **Settlements** are illegal under international law—every country agrees except Israel
                
                7. **Major human rights organizations** (including Israeli ones) have documented apartheid conditions
                
                8. **U.S. support** is exceptional and largely unconditional
                
                ---
                
                **Important Distinctions:**
                
                | Term | Meaning |
                |------|---------|
                | Judaism | A religion |
                | Jewish people | An ethnic/religious group |
                | Zionism | A political ideology |
                | Israel | A state |
                | Israeli government | The current government |
                
                **Criticism of Zionism, Israel, or Israeli policies is not antisemitism.**
                
                Just as:
                - Criticizing U.S. policy isn't anti-American
                - Criticizing Saudi policy isn't Islamophobic
                - Criticizing China isn't anti-Asian
                
                ---
                
                **Jewish Perspectives:**
                
                Jews are not monolithic. There are:
                
                **Pro-Israel organizations:**
                - AIPAC, ZOA, ADL (increasingly)
                
                **Critical Jewish organizations:**
                - Jewish Voice for Peace
                - IfNotNow
                - J Street
                - B'Tselem (Israeli)
                - Breaking the Silence (Israeli)
                
                Many Jews, including Israeli Jews, oppose the occupation and support Palestinian rights.
                
                ---
                
                **What About October 7?**
                
                Whatever one thinks about Hamas's attack:
                
                - It did not happen in a vacuum
                - 57 years of occupation preceded it
                - This does not justify killing civilians
                - But context matters for understanding
                - Israeli response has killed tens of thousands
                
                Violence breeds violence. Only justice brings peace.
                
                ---
                
                **Why This Matters:**
                
                **Americans specifically should know:**
                
                1. U.S. tax dollars fund this ($3.8B/year)
                2. U.S. diplomatic support enables it
                3. U.S. weapons are used
                4. U.S. is not a neutral party
                5. Americans can influence policy
                
                ---
                
                **What You Can Do:**
                
                1. **Learn more** - This is an introduction
                2. **Listen to Palestinians** - Their voices are often excluded
                3. **Support organizations** working for justice
                4. **Contact representatives** - They respond to constituents
                5. **Challenge misinformation** - Armed with facts
                6. **Distinguish criticism from bigotry** - Both ways
                
                ---
                
                **Recommended Further Reading:**
                
                **Israeli historians:**
                - Benny Morris: "The Birth of the Palestinian Refugee Problem"
                - Ilan Pappé: "The Ethnic Cleansing of Palestine"
                - Tom Segev: "One Palestine, Complete"
                
                **Palestinian voices:**
                - Rashid Khalidi: "The Hundred Years' War on Palestine"
                - Edward Said: "The Question of Palestine"
                - Raja Shehadeh: "Palestinian Walks"
                
                **Human rights reports:**
                - Amnesty International: "Israel's Apartheid"
                - Human Rights Watch: "A Threshold Crossed"
                - B'Tselem reports
                
                ---
                
                **Final Thought:**
                
                The goal is not to demonize anyone, but to see clearly.
                
                When you understand the history, you can:
                - Evaluate claims critically
                - Resist propaganda from all sides
                - Support justice and human rights
                - Recognize that peace requires truth
                
                The first step toward justice is seeing clearly.
                
                Now you have the documented history. What will you do with it?
                """,
                keyTakeaway: "This documented history shows a pattern of displacement, occupation, and human rights violations—recognized by international law and human rights organizations. Understanding this history is the first step toward justice."
            )
        ]
    }
}

// MARK: - Models and Views

struct ZionismLesson: Identifiable {
    let id = UUID()
    let title: String
    let period: String
    let color: Color
    let content: String
    let keyTakeaway: String
}

struct ZionismLessonView: View {
    let lesson: ZionismLesson
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
                        
                        Text(lesson.period)
                            .font(.system(size: 12))
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
                
                Divider().background(Color.white.opacity(0.2))
                
                Text(lesson.content)
                    .font(.system(size: 15))
                    .foregroundColor(.white.opacity(0.9))
                    .lineSpacing(6)
                
                VStack(alignment: .leading, spacing: 12) {
                    HStack {
                        Image(systemName: "bookmark.fill")
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
    NavigationStack {
        ZionismAndIsraelHistory()
    }
}
