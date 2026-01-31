// PalestineHistory.swift
// The people, the land, the struggle
// Documented history from Palestinian perspective

import SwiftUI

struct PalestineHistory: View {
    
    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                courseHeader
                approachNote
                
                ForEach(Array(lessons.enumerated()), id: \.offset) { index, lesson in
                    NavigationLink(destination: PalestineLessonView(lesson: lesson, index: index + 1)) {
                        lessonRow(lesson, index: index)
                    }
                }
                
                sourcesSection
            }
        }
        .background(Color.black.ignoresSafeArea())
        .navigationTitle("Palestine")
        .navigationBarTitleDisplayMode(.inline)
    }
    
    private var courseHeader: some View {
        VStack(spacing: 16) {
            ZStack {
                Circle()
                    .fill(Color.green.opacity(0.2))
                    .frame(width: 100, height: 100)
                
                Image(systemName: "leaf.fill")
                    .font(.system(size: 44))
                    .foregroundColor(.green)
            }
            
            Text("Palestine")
                .font(.system(size: 24, weight: .bold))
                .foregroundColor(.white)
            
            Text("A People's History")
                .font(.system(size: 14))
                .foregroundColor(.gray)
            
            HStack {
                Text("8 Lessons")
                    .font(.system(size: 12, weight: .medium))
                    .foregroundColor(.gray)
                Spacer()
                Text("~60 min")
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
                Image(systemName: "person.3.fill")
                    .foregroundColor(.green)
                Text("Centering Palestinian Voices")
                    .font(.system(size: 14, weight: .bold))
                    .foregroundColor(.white)
            }
            
            Text("Palestinians are often spoken about but rarely heard. This course centers Palestinian experiences and scholarship while using documented historical sources. Understanding Palestinian history is essential for understanding the present.")
                .font(.system(size: 12))
                .foregroundColor(.gray)
                .lineSpacing(4)
        }
        .padding()
        .background(Color.green.opacity(0.1))
        .cornerRadius(12)
        .padding()
    }
    
    private func lessonRow(_ lesson: PalestineLesson, index: Int) -> some View {
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
            Text("Sources")
                .font(.system(size: 16, weight: .bold))
                .foregroundColor(.white)
            
            VStack(alignment: .leading, spacing: 8) {
                sourceRow("Rashid Khalidi", "Palestinian historian, Columbia")
                sourceRow("Walid Khalidi", "Historian, founding member IPS")
                sourceRow("Nur Masalha", "Historian, SOAS")
                sourceRow("British Mandate Archives", "UK National Archives")
                sourceRow("UNRWA", "UN Relief and Works Agency")
                sourceRow("Palestinian oral histories", "Various collections")
            }
        }
        .padding()
    }
    
    private func sourceRow(_ name: String, _ source: String) -> some View {
        HStack(spacing: 10) {
            Image(systemName: "doc.text")
                .foregroundColor(.green)
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
    
    private var lessons: [PalestineLesson] {
        [
            PalestineLesson(
                title: "Who Are the Palestinians?",
                period: "Ancient - 1800s",
                color: .green,
                content: """
                **A People With Deep Roots**
                
                Palestinians are the indigenous people of Palestine—the land between the Jordan River and the Mediterranean Sea.
                
                ---
                
                **Historical Presence:**
                
                The land of Palestine has been continuously inhabited for thousands of years.
                
                **Archaeological evidence shows:**
                - Continuous habitation since the Bronze Age
                - Cities like Jericho among oldest in the world
                - Multiple empires ruled, but population remained
                
                **Who lived there:**
                - Canaanites (Bronze Age)
                - Various peoples under empires (Assyrian, Babylonian, Persian, Greek, Roman, Byzantine)
                - Arab presence since 7th century CE
                - Ottoman rule (1517-1917)
                
                **By the 1800s:**
                - Population was predominantly Arab Muslim
                - Significant Christian Arab minority
                - Small Jewish minority (largely religious, not Zionist)
                - Shared culture, language (Arabic), and identity
                
                ---
                
                **Palestinian Identity:**
                
                Palestinian identity developed like other national identities in the 19th-20th centuries.
                
                **Shared characteristics:**
                - Arabic language and culture
                - Attachment to the land
                - Distinct customs, food, dress, music
                - Shared history of resistance to colonialism
                
                **Cities with long history:**
                - Jerusalem (Al-Quds)
                - Jaffa (Yafa)
                - Haifa
                - Nablus
                - Hebron (Al-Khalil)
                - Gaza
                - Acre (Akka)
                
                ---
                
                **The "Empty Land" Myth:**
                
                Early Zionist slogan: "A land without a people for a people without a land"
                
                **This was never true.**
                
                1882 population of Palestine:
                - ~470,000 Arabs
                - ~24,000 Jews
                
                The land was inhabited, cultivated, and developed.
                
                ---
                
                **Culture and Society:**
                
                **Agriculture:**
                - Olive groves (some trees centuries old)
                - Citrus (Jaffa oranges world-famous)
                - Wheat, barley, vegetables
                - Terraced hillsides
                
                **Cities:**
                - Markets (souks)
                - Mosques, churches
                - Schools, courts
                - Trade with region and Europe
                
                **Social structure:**
                - Extended family (hamula) central
                - Village life dominant
                - Growing urban middle class
                - Religious and tribal leaders
                
                **Source:** Rashid Khalidi, "Palestinian Identity"; Walid Khalidi, "Before Their Diaspora"
                
                ---
                
                **Why This Matters:**
                
                Palestinians are not:
                - Recent arrivals
                - "Generic Arabs" with no specific identity
                - People who can just "go somewhere else"
                
                They are people with deep roots in a specific land—roots that were violently severed.
                """,
                keyTakeaway: "Palestinians are the indigenous people of Palestine with roots going back centuries. The 'land without a people' was a myth—in 1882, 470,000 Arabs lived there compared to 24,000 Jews."
            ),
            PalestineLesson(
                title: "British Colonialism",
                period: "1917-1948",
                color: .blue,
                content: """
                **Colonial Rule and Broken Promises**
                
                Britain colonized Palestine after WWI and made contradictory promises that created the conflict.
                
                ---
                
                **The Conquest:**
                
                **1917:** British forces conquered Palestine from Ottoman Empire
                **1920:** League of Nations gave Britain "Mandate" to govern
                
                **The Mandate's Contradiction:**
                - Tasked with preparing Palestinians for self-governance
                - BUT also committed to Zionist "national home"
                - These goals were incompatible
                
                ---
                
                **Promises to Arabs:**
                
                **Hussein-McMahon Correspondence (1915-1916):**
                - Britain promised Arab independence in exchange for revolt against Ottomans
                - Arabs understood this included Palestine
                - Arabs revolted, fighting alongside Lawrence of Arabia
                - Britain later claimed Palestine was excluded
                
                **Arabs felt betrayed—because they were.**
                
                ---
                
                **The Reality of Mandate Rule:**
                
                **For Palestinians:**
                - No path to independence
                - No democratic representation
                - Watched as Jewish immigration changed their homeland
                - Land purchased from absentee landlords, tenants evicted
                - Hebrew labor policy excluded them from jobs
                
                **British official's observation:**
                > "There is no doubt that the Arabs have been, in a sense, 'let down' by Britain."
                
                ---
                
                **Palestinian Resistance:**
                
                **1920-1921:** Riots in Jerusalem, Jaffa
                
                **1929:** Western Wall disturbances
                
                **1936-1939: The Great Arab Revolt**
                
                **What triggered it:**
                - Jewish immigration surged (fleeing Nazi Germany)
                - Land losses accelerated
                - No political rights
                - British ignored Arab demands
                
                **What happened:**
                - General strike (longest in colonial history)
                - Armed rebellion
                - Britain deployed 25,000+ troops
                - Mass arrests, executions, deportations
                - Entire villages demolished
                - 5,000+ Palestinians killed
                - Arab political leadership decimated
                
                **Source:** Rashid Khalidi, "The Iron Cage"
                
                ---
                
                **The Crushing:**
                
                Britain crushed the revolt with:
                - Collective punishment
                - House demolitions
                - Administrative detention
                - Curfews
                - Identity cards
                
                **These same tactics are used by Israel today.**
                
                ---
                
                **The White Paper (1939):**
                
                After crushing the revolt, Britain issued White Paper:
                - Limited Jewish immigration to 75,000 over 5 years
                - Promised independent Palestine within 10 years
                - Arab majority would be maintained
                
                **Too little, too late.**
                
                - Palestinian leadership had been destroyed
                - WWII interrupted everything
                - Britain reversed course after the war
                
                ---
                
                **Legacy of British Rule:**
                
                1. Facilitated demographic transformation
                2. Crushed Palestinian political organization
                3. Trained and armed Jewish militias (initially)
                4. Left without resolving contradictions
                5. Handed problem to UN
                
                Palestinians went from 90% to 67% of population under British rule.
                
                When Britain left, Palestinians were politically weakened and militarily outmatched.
                """,
                keyTakeaway: "Britain promised Arabs independence, then gave away their land. When Palestinians revolted, Britain crushed them—killing 5,000+ and destroying political leadership. Palestinians entered 1948 weakened while Zionist forces were organized and armed."
            ),
            PalestineLesson(
                title: "The Nakba (Catastrophe)",
                period: "1947-1949",
                color: .red,
                content: """
                **The Destruction of Palestinian Society**
                
                In 1948, Palestinian society was destroyed in a catastrophe Palestinians call the Nakba.
                
                ---
                
                **Before the Nakba:**
                
                Palestinian society in 1947:
                - ~1.4 million people
                - ~1,300 villages
                - Cities with schools, hospitals, businesses
                - Functioning society despite British oppression
                
                ---
                
                **The UN Partition:**
                
                **November 1947:** UN proposed partition
                
                - Jewish state: 56% of land
                - Arab state: 43% of land
                - Jerusalem: International
                
                **Problems:**
                - Jews were 33% of population, would get 56% of land
                - Proposed Jewish state had ~45% Arab population
                - Palestinians weren't meaningfully consulted
                - Why should majority give up land?
                
                **Arabs rejected it. Wouldn't you?**
                
                ---
                
                **The Expulsion:**
                
                **What happened (documented by Israeli historians):**
                
                **Dec 1947 - May 1948 (before Arab armies entered):**
                - 250,000-300,000 Palestinians already expelled
                - Zionist militias attacked villages
                - Massacres caused mass panic
                - Psychological warfare spread fear
                
                **May 1948 - 1949:**
                - Arab armies entered (poorly coordinated, limited)
                - Israeli forces expanded beyond partition lines
                - More villages destroyed
                - More expulsions
                
                **Total expelled/fled: 700,000-750,000**
                
                **Source:** Benny Morris, "The Birth of the Palestinian Refugee Problem"
                
                ---
                
                **The Massacres:**
                
                **Deir Yassin (April 9, 1948):**
                - Village near Jerusalem
                - Irgun and Lehi attacked
                - 100-254 villagers killed
                - Bodies mutilated
                - News spread, causing mass flight
                
                **Tantura (May 1948):**
                - Coastal village
                - Israeli soldiers executed prisoners
                - Mass grave discovered
                - Israeli historian Teddy Katz documented it
                
                **Other documented massacres:**
                - Al-Dawayima
                - Safsaf
                - Eilaboun
                - Many others
                
                **Source:** Ilan Pappé, "The Ethnic Cleansing of Palestine"
                
                ---
                
                **The Villages:**
                
                **Over 400 Palestinian villages were destroyed**
                
                What "destroyed" means:
                - Buildings demolished or blown up
                - Wells poisoned
                - Cemeteries desecrated
                - Orchards uprooted
                - Names changed or erased
                
                Many village sites are now:
                - Israeli towns
                - Forests planted by JNF
                - Agricultural land
                
                **The erasure was deliberate.**
                
                **Source:** Walid Khalidi, "All That Remains"
                
                ---
                
                **Personal Stories:**
                
                **From Palestinian oral histories:**
                
                > "We thought we would return in a few days. We took nothing. My mother left bread rising. When we came back—there was no house."
                
                > "They came at dawn. Shooting. We ran. My grandmother couldn't run. We never saw her again."
                
                > "I was born in that village. My father, his father, his father's father. All the way back. Now it doesn't exist. They say it never existed."
                
                **Source:** Palestinian oral history projects
                
                ---
                
                **Why They Couldn't Return:**
                
                **UN Resolution 194 (1948):**
                > "Refugees wishing to return to their homes and live at peace with their neighbours should be permitted to do so."
                
                **Israel refused.**
                
                **Why?**
                
                David Ben-Gurion (Israel's first PM):
                > "We must do everything to ensure they never do return."
                
                Allowing return would mean:
                - Arab majority in Israel
                - End of Jewish state
                - Acknowledging the crime
                
                So Palestinians were never allowed home.
                """,
                keyTakeaway: "700,000-750,000 Palestinians were expelled or fled in 1948. 400+ villages were destroyed. Massacres spread terror. UN called for return. Israel refused. Most refugees' villages no longer exist. Their descendants remain refugees 75+ years later."
            ),
            PalestineLesson(
                title: "Refugees Then and Now",
                period: "1948-Present",
                color: .orange,
                content: """
                **The World's Longest-Running Refugee Crisis**
                
                Palestinian refugees are the largest and longest-displaced refugee population in the world.
                
                ---
                
                **The Numbers:**
                
                **1948:** 700,000-750,000 expelled
                **Today:** 5.9 million registered refugees (UNRWA)
                
                **Where they are:**
                - West Bank: 870,000
                - Gaza: 1.6 million
                - Jordan: 2.3 million
                - Lebanon: 480,000
                - Syria: 560,000
                - Other: ~500,000
                
                **Source:** UNRWA statistics
                
                ---
                
                **The Camps:**
                
                **58 official refugee camps** across the region
                
                Camps were meant to be temporary (75+ years later...):
                
                **Conditions:**
                - Overcrowded (some most densely populated places on earth)
                - Poor infrastructure
                - Limited services
                - Poverty
                - Trauma passed down generations
                
                **Gaza camps:**
                - Jabalia: 116,000+ people in 1.4 km²
                - Beach Camp: 90,000+ people
                - Density higher than any major city
                
                ---
                
                **Life in Lebanon:**
                
                Palestinian refugees in Lebanon face unique restrictions:
                
                - Cannot own property
                - Banned from many professions
                - Cannot become citizens
                - Limited access to healthcare, education
                - Camps are essentially ghettoes
                
                **Why?** Lebanon's sectarian politics; fear Palestinians would upset balance.
                
                ---
                
                **What They Lost:**
                
                **Land:**
                - Pre-1948: Palestinians owned ~90% of private land
                - After: Ownership transferred to Israeli state or settlers
                
                **Property:**
                - Homes, businesses, furniture
                - Bank accounts frozen
                - Personal possessions left behind
                
                **Culture:**
                - Villages erased
                - Cemeteries destroyed
                - Olive groves uprooted
                - Place names changed
                
                ---
                
                **The Keys:**
                
                Many Palestinian families kept their house keys.
                
                For 75+ years.
                
                **Why?**
                
                > "My grandmother kept the key until she died. Then my mother. Now I have it. The house is gone. But the key reminds us: we belong there. We will return."
                
                The key became a symbol of the right of return.
                
                ---
                
                **Right of Return:**
                
                **International Law:**
                
                UN Resolution 194 (1948):
                > "Refugees wishing to return to their homes and live at peace with their neighbours should be permitted to do so."
                
                Universal Declaration of Human Rights:
                > "Everyone has the right to leave any country, including his own, and to return to his country."
                
                **Israel's Position:**
                
                Israel refuses return because it would end the Jewish majority.
                
                **The Paradox:**
                - Any Jew anywhere can immigrate to Israel (Law of Return)
                - Palestinians expelled from Israel cannot return
                
                ---
                
                **Generational Trauma:**
                
                Studies show:
                - PTSD passed through generations
                - Children of refugees show trauma symptoms
                - Loss of homeland affects identity
                - "Statelessness" creates psychological burden
                
                **Source:** Medical and psychological research on refugees
                
                ---
                
                **Why This Continues:**
                
                1. Israel refuses return or compensation
                2. Peace deals have failed
                3. International community doesn't enforce rights
                4. Refugees lack political power
                5. Time passing hasn't diminished the claim
                
                **The question remains:**
                
                How can there be peace without addressing the refugees?
                """,
                keyTakeaway: "5.9 million Palestinian refugees exist today—the world's longest-running refugee crisis. UN affirmed their right to return. Israel refuses. Many families still have their house keys 75+ years later. Peace without addressing refugees is impossible."
            ),
            PalestineLesson(
                title: "Life Under Occupation",
                period: "1967-Present",
                color: .purple,
                content: """
                **Daily Reality in the Occupied Territories**
                
                What does military occupation actually mean for the 5+ million Palestinians living under it?
                
                ---
                
                **The Checkpoint System:**
                
                **West Bank:**
                - 700+ checkpoints and barriers
                - What should be a 15-minute trip takes hours
                - Soldiers can deny passage arbitrarily
                - Humiliation is routine
                
                **Stories:**
                
                > "My wife was in labor. We reached the checkpoint. They made us wait. She gave birth in the car. The baby died."
                
                > "I'm a doctor. Every day I pass a checkpoint to reach my hospital. Some days they let me through. Some days they don't. My patients wait."
                
                **Source:** B'Tselem documentation
                
                ---
                
                **The Permit System:**
                
                Palestinians need permits for:
                - Travel between areas
                - Working in Israel
                - Accessing their own land (near settlements or wall)
                - Medical treatment
                - Family visits
                - Farming
                
                Permits can be:
                - Denied without reason
                - Revoked without notice
                - Used as pressure/punishment
                
                ---
                
                **Home Demolitions:**
                
                **Since 1967:** 55,000+ Palestinian structures demolished
                
                **Reasons given:**
                - Built without permit (permits rarely granted)
                - Collective punishment
                - Security
                - Making way for settlements
                
                **What it looks like:**
                - Bulldozers arrive (often at dawn)
                - Family has minutes to remove belongings
                - House destroyed
                - Family homeless
                - Often happens repeatedly to same family
                
                **Source:** Israeli Committee Against House Demolitions
                
                ---
                
                **Administrative Detention:**
                
                Israel can imprison Palestinians without charge or trial.
                
                **How it works:**
                - Secret evidence
                - Renewable indefinitely
                - No conviction needed
                - Currently: ~500-1,000 Palestinians held
                
                Some have been held for years without ever being charged.
                
                ---
                
                **Night Raids:**
                
                Israeli military conducts raids on Palestinian homes, typically at night.
                
                **What happens:**
                - Soldiers break down doors (often 2-4 AM)
                - Family forced outside
                - House searched, often damaged
                - Sometimes arrests; sometimes just "mapping"
                - Children traumatized
                
                **Frequency:** Thousands per year
                
                **Source:** Defense for Children International
                
                ---
                
                **Child Detention:**
                
                Israel is the only country that systematically prosecutes children in military courts.
                
                **Numbers:**
                - 500-700 Palestinian children detained annually
                - As young as 12
                - Often arrested in night raids
                - Interrogated without parents or lawyers
                - Confessions often in Hebrew (which they don't speak)
                
                **UNICEF (2013):**
                > "The ill-treatment of children who come in contact with the military detention system appears to be widespread, systematic and institutionalized."
                
                **Source:** UNICEF report; Defense for Children International
                
                ---
                
                **Settler Violence:**
                
                Settlers (illegal under international law) attack Palestinians:
                - Burning fields and orchards
                - Attacking farmers
                - "Price tag" attacks on mosques, churches
                - Physical assaults
                - Rarely prosecuted
                
                **Israeli military often protects settlers, not Palestinians.**
                
                ---
                
                **Gaza Blockade:**
                
                Since 2007:
                - Israel controls all borders
                - Limits food, medicine, building materials
                - Limits electricity, fuel
                - Limits who can enter or leave
                - 95% of water undrinkable
                - "World's largest open-air prison"
                
                **UN:** Gaza may be "uninhabitable"
                
                ---
                
                **What It's Like:**
                
                **Palestinian voices:**
                
                > "Every day is survival. Will the checkpoint be open? Will my permit be valid? Will they demolish my house today? This is not living. This is existing."
                
                > "My children have never left Gaza. They've never seen a tree that isn't in a picture. They've never met their cousins in the West Bank. We are in a cage."
                
                > "They want us to leave. Every humiliation, every demolition, every checkpoint—it's to make us give up. But where would we go? This is our home."
                """,
                keyTakeaway: "Daily life under occupation means checkpoints, permits, home demolitions, night raids, and child detention. 700+ checkpoints. 55,000+ structures demolished. Systematic humiliation designed to force Palestinians to leave their homeland."
            ),
            PalestineLesson(
                title: "Resistance and Resilience",
                period: "1948-Present",
                color: .green,
                content: """
                **How Palestinians Have Fought Back**
                
                Palestinians have resisted dispossession through multiple means across generations.
                
                ---
                
                **Forms of Resistance:**
                
                **1. Sumud (Steadfastness)**
                
                The most fundamental form: simply staying.
                
                > "Sumud means we refuse to leave. Our presence is our resistance."
                
                - Rebuilding demolished homes
                - Planting olive trees
                - Maintaining identity
                - Refusing to become invisible
                
                **2. Political Organization**
                
                **PLO (Palestine Liberation Organization):**
                - Founded 1964
                - Recognized by UN as legitimate representative
                - Moved from armed struggle to diplomacy (Oslo 1993)
                - Currently runs Palestinian Authority
                
                **Hamas:**
                - Founded 1987
                - Emerged from Muslim Brotherhood
                - Won 2006 Palestinian elections
                - Controls Gaza since 2007
                - Designated terrorist organization by US, EU
                
                **Other factions:**
                - PFLP, DFLP (leftist)
                - Islamic Jihad
                - Various smaller groups
                
                **3. Popular Resistance**
                
                **First Intifada (1987-1993):**
                - Largely nonviolent uprising
                - Stone-throwing, strikes, boycotts
                - Mass participation
                - Created international awareness
                - Led to Oslo process
                
                **Second Intifada (2000-2005):**
                - More violent
                - Suicide bombings
                - Harsh Israeli response
                - Both sides suffered
                - Ended any trust
                
                **Great March of Return (2018-2019):**
                - Protests at Gaza fence
                - Largely unarmed
                - Israel killed 200+, wounded 36,000+
                - International condemnation
                
                **4. BDS Movement (Boycott, Divestment, Sanctions)**
                
                - Founded 2005 by Palestinian civil society
                - Modeled on South Africa anti-apartheid movement
                - Calls for boycott of Israeli products and companies
                - Divestment from complicit corporations
                - Sanctions until Israel complies with international law
                
                **Israel has aggressively fought BDS:**
                - Anti-BDS laws in many US states
                - Calling it antisemitic (it's not)
                - Banning BDS activists from entering
                
                ---
                
                **Culture as Resistance:**
                
                **Literature:**
                - Mahmoud Darwish (national poet)
                - Ghassan Kanafani
                - Susan Abulhawa
                
                **Art:**
                - Banksy's work in West Bank
                - Palestinian film (Hany Abu-Assad, Elia Suleiman)
                - Embroidery (tatreez) preserved
                
                **Food:**
                - Preserving traditional recipes
                - Fighting Israeli appropriation of falafel, hummus
                
                > "Every time we cook our grandmother's recipes, we resist erasure."
                
                ---
                
                **Diaspora Activism:**
                
                Palestinians worldwide:
                - Organize politically
                - Educate about their history
                - Advocate for rights
                - Maintain connection to homeland
                - Support those under occupation
                
                ---
                
                **What Violence Has and Hasn't Achieved:**
                
                **Armed resistance:**
                - Brought attention to cause
                - Caused Israeli casualties
                - Led to severe retaliation
                - Alienated some international support
                - Has not ended occupation
                
                **Nonviolent resistance:**
                - Often ignored by media
                - Still met with violence
                - Building international solidarity
                - Moral clarity
                
                **The question isn't whether Palestinians have the right to resist (they do under international law), but what methods are effective and ethical.**
                
                ---
                
                **Resilience:**
                
                After 75+ years:
                - Palestinians still exist
                - Identity stronger than ever
                - Young generation engaged
                - Global awareness growing
                - Sumud continues
                
                > "They wanted us to disappear. We're still here."
                """,
                keyTakeaway: "Palestinians resist through sumud (staying), political organization, popular uprising, BDS, and cultural preservation. 75+ years of dispossession have not broken Palestinian identity or determination. Their presence itself is resistance."
            ),
            PalestineLesson(
                title: "Gaza",
                period: "2005-Present",
                color: .red,
                content: """
                **The World's Largest Open-Air Prison**
                
                Gaza is a 140 square mile strip of land where 2.3 million people live under blockade.
                
                ---
                
                **Basic Facts:**
                
                - **Population:** 2.3 million
                - **Area:** 141 square miles (twice the size of Washington DC)
                - **Density:** One of the most crowded places on earth
                - **Refugees:** 1.6 million (70%)
                - **Under 18:** ~50% of population
                
                ---
                
                **History:**
                
                **1948:** Gaza flooded with refugees from elsewhere in Palestine
                **1967:** Israel occupied Gaza
                **2005:** Israel withdrew settlers, kept control of borders
                **2006:** Hamas won Palestinian elections
                **2007:** Israel imposed blockade
                
                ---
                
                **The Blockade:**
                
                Israel controls:
                - All border crossings (with Egypt's cooperation on one)
                - Airspace
                - Territorial waters
                - Who and what enters or exits
                
                **Restricted or banned at various times:**
                - Building materials (cement, steel)
                - Medical equipment
                - Food items
                - Fuel
                - Educational materials
                - Seeds and fertilizer
                - Fishing equipment
                
                **Israeli official stated goal:**
                > "Put the Palestinians on a diet, but not make them die of hunger."
                
                (Actual quote from government advisor, leaked document)
                
                **Source:** Wikileaks cables; Gisha legal center
                
                ---
                
                **Living Conditions:**
                
                **Water:**
                - 95% of water undrinkable
                - Aquifer contaminated with sewage and seawater
                - 4 hours of running water per day (some areas)
                
                **Electricity:**
                - 4-8 hours per day
                - Hospitals operate on generators
                - No reliable power
                
                **Sewage:**
                - Treatment plants destroyed in bombings
                - Raw sewage pumped into sea
                - Beaches contaminated
                
                **Healthcare:**
                - Hospitals lack supplies
                - Patients die waiting for permits to leave
                - Doctors cannot attend training abroad
                
                **Economy:**
                - 45%+ unemployment
                - 80%+ depend on aid
                - Fishing restricted
                - Agriculture limited
                - No economy can function under blockade
                
                ---
                
                **The Wars:**
                
                **2008-2009 (Operation Cast Lead):**
                - 1,400+ Palestinians killed
                - 13 Israelis killed
                - Infrastructure destroyed
                
                **2012 (Operation Pillar of Defense):**
                - 170+ Palestinians killed
                - 6 Israelis killed
                
                **2014 (Operation Protective Edge):**
                - 2,250+ Palestinians killed (including 550 children)
                - 73 Israelis killed
                - 100,000+ homes damaged or destroyed
                
                **2021:**
                - 260+ Palestinians killed
                - 13 Israelis killed
                
                **2023-Present:**
                - Ongoing at time of writing
                - Unprecedented destruction
                - Tens of thousands killed
                
                **Pattern:** Massive asymmetry in casualties and destruction
                
                ---
                
                **UN Warnings:**
                
                **2020:** UN warned Gaza would be "uninhabitable" by 2020.
                
                We passed that date.
                
                **2012:** UN said Gaza could be uninhabitable by 2020 unless "herculean" efforts were made.
                
                No such efforts were made.
                
                ---
                
                **What Gazans Say:**
                
                > "I'm 16. I've survived four wars. I've never left Gaza. I've never seen my family in the West Bank. I don't know what peace looks like."
                
                > "We are not Hamas. We are 2 million people trying to survive. The blockade punishes all of us for the actions of some."
                
                > "They call it 'mowing the lawn' when they bomb us. We are not grass. We are human beings."
                
                ---
                
                **The Core Issue:**
                
                Gaza is not a natural disaster. It's a policy choice.
                
                The blockade could end tomorrow.
                The wars could stop.
                People could live normal lives.
                
                But that would require seeing Palestinians as human beings deserving of rights.
                """,
                keyTakeaway: "2.3 million people live in Gaza under blockade. 95% of water undrinkable. 4-8 hours of electricity. Repeated wars kill thousands. UN said Gaza would be uninhabitable by 2020. The blockade is a policy choice, not a necessity."
            ),
            PalestineLesson(
                title: "Voices and Solidarity",
                period: "Present",
                color: .cyan,
                content: """
                **Palestinian Voices and Global Solidarity**
                
                Understanding Palestine requires listening to Palestinians and those who stand with them.
                
                ---
                
                **Palestinian Voices:**
                
                **Mahmoud Darwish** (1941-2008), national poet:
                
                > "We have on this earth what makes life worth living."
                
                > "We suffer from an incurable disease called hope."
                
                **Edward Said** (1935-2003), scholar:
                
                > "The whole point of this idea of peace was originally to reconcile two peoples. Not one at the expense of the other."
                
                > "I cannot accept that the Holocaust should be used to justify the mistreatment of Palestinians."
                
                **Hanan Ashrawi**, politician and activist:
                
                > "We are the only people on Earth asked to guarantee the security of our occupier, while Israel is the only country that demands protection from its victims."
                
                **Mohammed El-Kurd**, writer and activist:
                
                > "Our existence is resistance."
                
                ---
                
                **Jewish Voices for Justice:**
                
                Many Jews oppose Israeli policies and support Palestinian rights.
                
                **Jewish Voice for Peace:**
                > "As Jews, we know what it's like to be persecuted. We cannot be silent when persecution is done in our name."
                
                **IfNotNow:**
                Trains young American Jews to oppose occupation.
                
                **Breaking the Silence:**
                Israeli soldiers testify about occupation.
                
                **B'Tselem:**
                Israeli human rights organization documenting abuses.
                
                **Not in Our Name:**
                Jews who refuse to have Israel speak for them.
                
                ---
                
                **Global Solidarity:**
                
                **South Africa:**
                - Anti-apartheid veterans support Palestinians
                - Desmond Tutu compared Israel to apartheid
                - South African government supports Palestine
                
                **Black Americans:**
                - Historic solidarity between Black and Palestinian movements
                - "From Ferguson to Palestine"
                - Shared analysis of state violence
                
                **Irish:**
                - Historical parallels (colonialism, occupation)
                - Strong solidarity movement
                - Derry and Gaza twinned
                
                **Indigenous peoples:**
                - Recognize settler colonialism
                - Share experiences of land theft
                - Mutual solidarity
                
                ---
                
                **What You Can Do:**
                
                **1. Educate yourself:**
                - Read Palestinian authors
                - Follow Palestinian journalists
                - Watch Palestinian films
                - Listen to Palestinian voices
                
                **2. Speak up:**
                - Challenge misinformation
                - Share what you learn
                - Use social media
                - Have difficult conversations
                
                **3. Support organizations:**
                - UNRWA (UN refugee agency)
                - Medical Aid for Palestinians
                - Defense for Children International - Palestine
                - Palestinian legal organizations
                
                **4. Political action:**
                - Contact representatives
                - Support candidates who advocate for Palestinian rights
                - Attend demonstrations
                - Join solidarity organizations
                
                **5. BDS:**
                - Research and boycott complicit companies
                - Support divestment campaigns
                - Call for sanctions
                
                ---
                
                **Resources:**
                
                **To follow:**
                - +972 Magazine
                - Mondoweiss
                - Electronic Intifada
                - Palestinian journalists on social media
                
                **To read:**
                - Rashid Khalidi, "The Hundred Years' War on Palestine"
                - Raja Shehadeh, "Palestinian Walks"
                - Susan Abulhawa, "Mornings in Jenin"
                - Mohammed El-Kurd, "Rifqa"
                
                **To watch:**
                - "5 Broken Cameras"
                - "The Present"
                - "Farha"
                - "Born in Gaza"
                
                ---
                
                **Final Thought:**
                
                Palestinians are not asking for special treatment.
                
                They're asking for the rights that everyone else takes for granted:
                - To live in their homeland
                - To move freely
                - To not be bombed
                - To have their children safe
                - To be seen as human
                
                > "We are not numbers. We are not statistics. We are people. We have names. We have stories. We have dreams. All we ask is that you see us."
                
                Now you have learned. What will you do with this knowledge?
                """,
                keyTakeaway: "Palestinians ask for basic rights everyone else has: to live in their homeland, move freely, not be bombed, keep their children safe, and be seen as human. Many Jews and global movements stand in solidarity. Education leads to action."
            )
        ]
    }
}

// MARK: - Models

struct PalestineLesson: Identifiable {
    let id = UUID()
    let title: String
    let period: String
    let color: Color
    let content: String
    let keyTakeaway: String
}

struct PalestineLessonView: View {
    let lesson: PalestineLesson
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
                        Image(systemName: "leaf.fill")
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
        PalestineHistory()
    }
}
