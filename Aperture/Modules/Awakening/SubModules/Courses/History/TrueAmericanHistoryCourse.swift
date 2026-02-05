// TrueAmericanHistoryCourse.swift
// The history they didn't teach you
// Documented. Cited. Truthful.

import SwiftUI

struct TrueAmericanHistoryCourse: View {
    
    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                // Course Header
                courseHeader
                
                // Warning
                truthWarning
                
                // Lessons
                ForEach(Array(lessons.enumerated()), id: \.offset) { index, lesson in
                    NavigationLink(destination: HistoryLessonView(lesson: lesson, index: index + 1)) {
                        lessonRow(lesson, index: index)
                    }
                }
                
                // Sources
                sourcesSection
            }
        }
        .background(Color.black.ignoresSafeArea())
        .navigationTitle("True American History")
        .navigationBarTitleDisplayMode(.inline)
    }
    
    // MARK: - Header
    
    private var courseHeader: some View {
        VStack(spacing: 16) {
            ZStack {
                Circle()
                    .fill(Color.red.opacity(0.2))
                    .frame(width: 100, height: 100)
                
                Image(systemName: "book.closed.fill")
                    .font(.system(size: 44))
                    .foregroundColor(.red)
            }
            
            Text("True American History")
                .font(.system(size: 24, weight: .bold))
                .foregroundColor(.white)
            
            Text("The story they didn't want you to know")
                .font(.system(size: 14))
                .foregroundColor(.gray)
            
            Text("Documented • Cited • Truthful")
                .font(.system(size: 12, weight: .medium))
                .foregroundColor(.orange)
            
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
    
    // MARK: - Truth Warning
    
    private var truthWarning: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Image(systemName: "exclamationmark.triangle.fill")
                    .foregroundColor(.yellow)
                Text("A Note on Truth")
                    .font(.system(size: 14, weight: .bold))
                    .foregroundColor(.white)
            }
            
            Text("This course presents documented historical facts that were deliberately omitted from standard American education. Every claim is sourced from primary documents, academic research, and historical records. The truth may be uncomfortable, but it is necessary for genuine understanding.")
                .font(.system(size: 12))
                .foregroundColor(.gray)
                .lineSpacing(4)
        }
        .padding()
        .background(Color.yellow.opacity(0.1))
        .cornerRadius(12)
        .padding()
    }
    
    // MARK: - Lesson Row
    
    private func lessonRow(_ lesson: HistoryLesson, index: Int) -> some View {
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
    
    // MARK: - Sources
    
    private var sourcesSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Primary Sources Used")
                .font(.system(size: 16, weight: .bold))
                .foregroundColor(.white)
            
            VStack(alignment: .leading, spacing: 8) {
                sourceRow("National Archives", "archives.gov")
                sourceRow("Library of Congress", "loc.gov")
                sourceRow("Smithsonian Institution", "si.edu")
                sourceRow("Howard Zinn's \"A People's History\"", "Academic")
                sourceRow("1619 Project", "NY Times / Pulitzer")
                sourceRow("Equal Justice Initiative", "eji.org")
                sourceRow("Indigenous scholars & oral histories", "Various")
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
    
    private var lessons: [HistoryLesson] {
        [
            HistoryLesson(
                title: "Before Columbus",
                period: "Pre-1492",
                color: .green,
                content: """
                **The Americas Were Not "Discovered"**
                
                Before European contact, the Americas were home to an estimated **60-100 million people** in complex, sophisticated civilizations.
                
                ---
                
                **What Existed Before Columbus:**
                
                **North America:**
                - **Cahokia** (near modern St. Louis): City of 20,000+ people, larger than London in 1250 CE
                - **Haudenosaunee (Iroquois) Confederacy**: Democratic government that influenced the U.S. Constitution
                - **Pueblo peoples**: Advanced architecture, irrigation, astronomy
                - Hundreds of distinct nations with their own languages, governments, technologies
                
                **Central America:**
                - **Maya civilization**: Written language, advanced mathematics, astronomy
                - **Aztec Empire**: Capital Tenochtitlan had 200,000+ people, larger than any European city
                
                **South America:**
                - **Inca Empire**: 10 million people, road system spanning 25,000 miles
                - Advanced agriculture, medicine, architecture
                
                ---
                
                **The "Discovery" Myth:**
                
                You cannot "discover" a land where millions of people already live.
                
                The term "discovery" frames history from the colonizer's perspective, erasing the humanity and history of Indigenous peoples.
                
                **Source:** Charles C. Mann, "1491: New Revelations of the Americas Before Columbus"
                
                ---
                
                **The Doctrine of Discovery:**
                
                In 1493, Pope Alexander VI issued papal bulls declaring that any land not inhabited by Christians could be "discovered" and claimed.
                
                This became the legal basis for:
                - Colonization
                - Land theft
                - Enslavement of Indigenous peoples
                
                **This doctrine was cited by the U.S. Supreme Court as recently as 2005** (City of Sherrill v. Oneida Indian Nation).
                
                **Source:** Robert J. Miller, "Native America, Discovered and Conquered"
                
                ---
                
                **What Was Lost:**
                
                Within 100 years of Columbus:
                - 90% of Indigenous population died (disease, violence, slavery)
                - Estimated 55 million deaths
                - Countless languages, knowledge systems, histories destroyed
                
                This was one of the largest demographic catastrophes in human history.
                
                **Source:** Koch et al., "Earth system impacts of the European arrival" (2019)
                """,
                keyTakeaway: "The Americas had 60-100 million people in sophisticated civilizations before 1492. The 'discovery' narrative erases this and justified genocide through the Doctrine of Discovery, which remains in U.S. law today."
            ),
            HistoryLesson(
                title: "The Founding Contradictions",
                period: "1776-1789",
                color: .blue,
                content: """
                **"All Men Are Created Equal" - Except...**
                
                The founding documents contain profound contradictions that shaped America's trajectory.
                
                ---
                
                **The Declaration's Author:**
                
                Thomas Jefferson wrote "all men are created equal" while enslaving over 600 people in his lifetime.
                
                **Documented facts about Jefferson:**
                - Owned 607 enslaved people over his lifetime
                - Enslaved people built and maintained Monticello
                - Had children with Sally Hemings, an enslaved woman he owned (DNA confirmed)
                - Sally Hemings was the half-sister of his deceased wife
                - Never freed Sally Hemings or most of their children
                
                **Source:** Annette Gordon-Reed, "The Hemingses of Monticello" (Pulitzer Prize winner)
                
                ---
                
                **The Constitution's Compromises:**
                
                **The Three-Fifths Compromise (Article I, Section 2):**
                
                Enslaved people counted as 3/5 of a person for representation purposes.
                
                This wasn't about whether enslaved people were human—it was about political power:
                - Southern states wanted enslaved people fully counted for more Congressional seats
                - Northern states wanted them not counted
                - Compromise: 3/5
                
                Result: Slave states got disproportionate power in Congress and the Electoral College.
                
                **The Fugitive Slave Clause (Article IV, Section 2):**
                
                Required free states to return escaped enslaved people.
                
                **The Slave Trade Clause (Article I, Section 9):**
                
                Protected the international slave trade until 1808.
                
                ---
                
                **Who Could Vote:**
                
                The Constitution left voting to states. In practice:
                - Only white men
                - Only property owners (in most states)
                - About 6% of the population
                
                ---
                
                **The "Founding Fathers" Exposed:**
                
                Of the first 12 presidents:
                - **8 owned enslaved people**
                - Jefferson, Washington, Madison, Monroe, Jackson, Tyler, Polk, Taylor
                
                **George Washington:**
                - Owned 317 enslaved people at death
                - Rotated enslaved people out of Philadelphia every 6 months to avoid Pennsylvania's emancipation law
                - Pursued escaped enslaved people aggressively
                
                **James Madison:**
                - "Father of the Constitution"
                - Owned over 100 enslaved people
                - Never freed any
                
                **Source:** National Archives; Smithsonian Institution
                
                ---
                
                **The Contradiction Intentional:**
                
                The founders knew slavery contradicted their stated ideals.
                
                Jefferson originally included anti-slavery language in the Declaration draft.
                It was removed at the insistence of South Carolina and Georgia delegates.
                
                They chose to build the nation on this contradiction rather than lose southern support.
                """,
                keyTakeaway: "The Constitution was designed to protect slavery while proclaiming liberty. 8 of the first 12 presidents owned enslaved people. The Three-Fifths Compromise gave slave states extra political power."
            ),
            HistoryLesson(
                title: "The Economics of Slavery",
                period: "1619-1865",
                color: .orange,
                content: """
                **Slavery Built American Wealth**
                
                Slavery was not just a moral failing—it was the economic foundation of the United States.
                
                ---
                
                **The Numbers:**
                
                By 1860:
                - **4 million** people were enslaved
                - Enslaved people were worth more than all American railroads, factories, and banks **combined**
                - Total value: **$3.5 billion** (over $100 billion today)
                
                Cotton (produced by enslaved labor):
                - 60% of U.S. exports
                - Fueled textile industries in North and England
                - Made Southern planters the richest class in America
                
                **Source:** Edward Baptist, "The Half Has Never Been Told"
                
                ---
                
                **The Entire Economy:**
                
                Slavery wasn't just a Southern institution:
                
                **Northern Profits:**
                - Northern banks financed slave purchases
                - Northern insurance companies insured enslaved people as property
                - Northern ships transported cotton
                - Northern factories processed cotton
                - Northern merchants sold goods to plantations
                
                **Wall Street:**
                - JP Morgan's predecessor banks accepted enslaved people as loan collateral
                - Lehman Brothers began as cotton brokers
                - New York banks were deeply invested in slavery
                
                **Universities:**
                - Georgetown sold 272 enslaved people to pay debts
                - Brown University's namesake was a slave trader
                - Harvard Law School was funded by slave owner
                - Princeton, Yale, Columbia all had slavery connections
                
                **Source:** Craig Steven Wilder, "Ebony and Ivy"
                
                ---
                
                **The Brutality:**
                
                Slavery was maintained through systematic violence:
                
                - Whipping was routine (documented in plantation records)
                - Families were deliberately separated to prevent unity
                - Rape of enslaved women was common and legal
                - "Slave breakers" specialized in torture
                - Mutilation used for punishment (cutting off ears, toes, branding)
                
                Frederick Douglass's autobiography documents:
                > "I have often been awakened at the dawn of day by the most heart-rending shrieks of an own aunt of mine, whom [the overseer] used to tie up to a joist, and whip upon her naked back till she was literally covered with blood."
                
                **Source:** Frederick Douglass, "Narrative of the Life of Frederick Douglass" (1845)
                
                ---
                
                **After "Abolition":**
                
                The 13th Amendment (1865) abolished slavery "except as a punishment for crime."
                
                This exception was immediately exploited:
                
                **Convict Leasing:**
                - Southern states passed "Black Codes" criminalizing Black life
                - Arrested Black men for "vagrancy" (being unemployed)
                - Leased prisoners to mines, plantations, railroads
                - Conditions were often worse than slavery
                - U.S. Steel, railroads, and others profited
                
                **Source:** Douglas Blackmon, "Slavery by Another Name" (Pulitzer Prize winner)
                
                ---
                
                **The Wealth Gap Today:**
                
                Slavery's economic effects persist:
                
                - Median white family wealth: $171,000
                - Median Black family wealth: $17,600
                - Ratio: ~10:1
                
                This gap is not due to effort or choices. It's the compound result of:
                - 246 years of unpaid labor
                - 100 years of Jim Crow
                - Redlining, discrimination, mass incarceration
                
                **Source:** Federal Reserve Survey of Consumer Finances
                """,
                keyTakeaway: "Enslaved people were worth more than all U.S. railroads, factories, and banks combined. Northern banks, insurers, and universities profited. The 13th Amendment's exception led to convict leasing. The wealth gap persists today."
            ),
            HistoryLesson(
                title: "The Native American Genocide",
                period: "1492-1900",
                color: .red,
                content: """
                **The Systematic Destruction of Indigenous Peoples**
                
                What happened to Native Americans was genocide—defined by the UN as acts committed with intent to destroy a national, ethnic, racial, or religious group.
                
                ---
                
                **Population Decline:**
                
                - Pre-contact population: **60-100 million** (Americas)
                - North America specifically: **10-18 million**
                - By 1900: **237,000** in the U.S.
                
                **Over 90% death rate.**
                
                **Source:** Russell Thornton, "American Indian Holocaust and Survival"
                
                ---
                
                **The Methods:**
                
                **1. Disease (some intentional)**
                
                While initial disease spread was unintentional, biological warfare was documented:
                
                1763: British General Jeffrey Amherst wrote:
                > "Could it not be contrived to send the small pox among the disaffected tribes of Indians?"
                
                Blankets from smallpox patients were given to Native Americans at Fort Pitt.
                
                **Source:** National Archives, Amherst Papers
                
                **2. Military Campaigns**
                
                **Sand Creek Massacre (1864):**
                - U.S. Army attacked peaceful Cheyenne and Arapaho village
                - 150-200 killed, mostly women, children, elderly
                - Soldiers mutilated bodies, took "trophies"
                - Colonel Chivington: "Kill and scalp all, big and little"
                
                **Source:** Congressional investigation, 1865
                
                **Wounded Knee (1890):**
                - U.S. Army killed 250-300 Lakota, including women and children
                - 20 soldiers received Medal of Honor for this massacre
                - Medals have not been rescinded
                
                **Source:** National Archives; Smithsonian
                
                **3. Forced Relocation**
                
                **Indian Removal Act (1830):**
                
                President Andrew Jackson signed law forcing removal of Southeast tribes.
                
                **Trail of Tears:**
                - Cherokee, Muscogee, Seminole, Chickasaw, Choctaw forced to march west
                - 60,000 people removed
                - 15,000+ died during the marches
                - Supreme Court ruled removal unconstitutional (Worcester v. Georgia)
                - Jackson allegedly said: "John Marshall has made his decision; now let him enforce it"
                
                **Source:** National Park Service; National Archives
                
                **4. Boarding Schools**
                
                From 1860s-1960s, Native children were forcibly taken to boarding schools.
                
                Founder Richard Henry Pratt's stated goal:
                > "Kill the Indian, save the man"
                
                - Children forbidden to speak languages
                - Hair forcibly cut
                - Physical and sexual abuse documented
                - Many children died (mass graves discovered)
                - Generational trauma persists
                
                **2021-2022:** Mass graves discovered at Canadian and U.S. boarding schools.
                
                **Source:** National Native American Boarding School Healing Coalition
                
                ---
                
                **Broken Treaties:**
                
                The U.S. signed over **370 treaties** with Native nations.
                
                **Every single one was broken.**
                
                When Native lands were found to have value (gold, oil, fertile land), treaties were violated.
                
                **Source:** Vine Deloria Jr., "Behind the Trail of Broken Treaties"
                
                ---
                
                **Today:**
                
                - Reservations often have worst poverty in U.S.
                - Pine Ridge Reservation: Life expectancy 66-67 years
                - Native Americans have highest rates of police killings per capita
                - Sacred sites continue to be desecrated (Standing Rock, Oak Flat)
                - Many tribes still fighting for treaty rights
                """,
                keyTakeaway: "90%+ of Native Americans died from disease, military campaigns, forced removal, and cultural destruction. 370+ treaties were signed and every one was broken. Boarding schools attempted cultural genocide into the 1960s."
            ),
            HistoryLesson(
                title: "Reconstruction & Its Destruction",
                period: "1865-1877",
                color: .purple,
                content: """
                **America's Lost Opportunity**
                
                After the Civil War, there was a brief moment when true equality seemed possible. It was deliberately destroyed.
                
                ---
                
                **What Reconstruction Achieved:**
                
                **Constitutional Amendments:**
                - 13th: Abolished slavery (with prison exception)
                - 14th: Citizenship, due process, equal protection
                - 15th: Voting rights regardless of race
                
                **Black Political Power:**
                - Over 2,000 Black men held public office during Reconstruction
                - 16 Black men served in U.S. Congress
                - Hiram Revels and Blanche Bruce: First Black U.S. Senators
                - P.B.S. Pinchback: First Black governor (Louisiana)
                - Black legislators, judges, sheriffs throughout the South
                
                **Social Programs:**
                - Public schools created (for Black and white children)
                - Freedmen's Bureau provided food, healthcare, legal help
                - Black colleges founded (Howard, Fisk, Morehouse)
                - Land redistribution attempted
                
                **Source:** Eric Foner, "Reconstruction: America's Unfinished Revolution"
                
                ---
                
                **The Terrorist Campaign:**
                
                White Southerners launched systematic terrorism to end Black political power.
                
                **The Ku Klux Klan:**
                - Founded 1865 in Tennessee
                - Former Confederate soldiers
                - Goal: Restore white supremacy through terror
                
                **Methods:**
                - Murder of Black voters and white allies
                - Burning of Black schools and churches
                - Intimidation before elections
                - Lynching as public spectacle
                
                **Documented massacres:**
                
                **Colfax Massacre (1873):**
                - White militia attacked Black men defending courthouse
                - 150+ Black men killed
                - Many executed after surrendering
                - Only 3 white men convicted, convictions overturned by Supreme Court
                
                **Hamburg Massacre (1876):**
                - White mob attacked Black militia unit
                - Captured men executed
                
                **Source:** National Archives; Equal Justice Initiative
                
                ---
                
                **The Compromise of 1877:**
                
                The presidential election of 1876 was disputed.
                
                **The Deal:**
                - Republican Rutherford B. Hayes becomes president
                - In exchange: Federal troops withdrawn from South
                - Reconstruction ends
                - Black citizens abandoned to white supremacist terror
                
                This was a bipartisan agreement to sacrifice Black rights.
                
                ---
                
                **What Followed:**
                
                Without federal protection:
                - Black voters driven from polls
                - Black officeholders removed
                - Black Codes reinstated
                - Convict leasing expanded
                - Lynching became epidemic
                
                **Within 20 years:**
                - Black voting in the South fell from majority to nearly zero
                - Segregation (Jim Crow) became law
                - Everything Reconstruction built was destroyed
                
                ---
                
                **The Lost Promise:**
                
                Reconstruction showed that equality was possible.
                
                Black Americans voted, held office, built communities, and participated fully in democracy—until they were stopped by terrorism and federal abandonment.
                
                The failure of Reconstruction is not that equality was impossible. It's that it was **deliberately destroyed**.
                
                **Source:** W.E.B. Du Bois, "Black Reconstruction in America"
                """,
                keyTakeaway: "Reconstruction saw 2,000+ Black officials and real progress toward equality. This was deliberately destroyed through terrorism and the federal government's abandonment of Black citizens in the Compromise of 1877."
            ),
            HistoryLesson(
                title: "Jim Crow and Lynching",
                period: "1877-1950s",
                color: .gray,
                content: """
                **American Apartheid**
                
                For nearly 100 years after slavery, Black Americans lived under a system of legal segregation enforced by terrorism.
                
                ---
                
                **The Laws:**
                
                Jim Crow laws mandated segregation in:
                - Schools
                - Transportation
                - Restaurants
                - Hotels
                - Hospitals
                - Cemeteries
                - Drinking fountains
                - Bathrooms
                - Beaches
                - Parks
                - Prisons
                - Phone booths (separate for Black callers)
                
                **Plessy v. Ferguson (1896):**
                Supreme Court ruled "separate but equal" was constitutional.
                In practice: Separate and deliberately unequal.
                
                ---
                
                **Voter Suppression:**
                
                To eliminate Black voting:
                
                - **Poll taxes**: Pay to vote (poor couldn't afford)
                - **Literacy tests**: Impossible questions, selectively applied
                - **Grandfather clauses**: Could only vote if grandfather voted (before Black suffrage)
                - **White primaries**: Democrats-only primaries in one-party South
                - **Violence**: The ultimate deterrent
                
                **Result:**
                - 1896: 130,334 Black voters registered in Louisiana
                - 1904: 1,342
                
                **Source:** Richard Pildes, "Democracy, Anti-Democracy, and the Canon"
                
                ---
                
                **The Terrorism:**
                
                **Lynching:**
                - At least **4,400 documented lynchings** of Black Americans (1877-1950)
                - True number likely much higher
                - Often public spectacles with crowds, photographers
                - Body parts taken as "souvenirs"
                - Postcards made and sent through U.S. mail
                
                **Common "offenses" leading to lynching:**
                - Registering to vote
                - Testifying against a white person
                - Failing to say "sir" to a white person
                - "Looking at" a white woman
                - Being successful in business
                - Just being Black
                
                **Emmett Till (1955):**
                - 14-year-old from Chicago visiting Mississippi
                - Allegedly whistled at white woman
                - Kidnapped, tortured, murdered
                - Killers acquitted by all-white jury
                - Later confessed in magazine interview
                - Carolyn Bryant admitted in 2017 she lied
                
                **Source:** Equal Justice Initiative, "Lynching in America"
                
                ---
                
                **Federal Complicity:**
                
                Congress never passed an anti-lynching law.
                
                The Dyer Anti-Lynching Bill passed the House **three times** (1922, 1937, 1940).
                Each time, **Southern Democrats filibustered** in the Senate.
                
                Lynching was not made a federal hate crime until **2022**.
                
                ---
                
                **Tulsa Race Massacre (1921):**
                
                "Black Wall Street" in Tulsa, Oklahoma:
                - Wealthy, thriving Black community
                - Black-owned businesses, hospitals, schools
                - Estimated 600 businesses
                
                **The Destruction:**
                - White mob attacked over two days
                - 300+ Black residents killed
                - 10,000 Black residents left homeless
                - 35 blocks destroyed
                - Planes dropped firebombs (first aerial bombing in U.S.)
                - National Guard helped round up Black residents
                - No white attackers prosecuted
                
                **Hidden from history:**
                - Not taught in Oklahoma schools until 2020
                - Mass graves still being excavated
                - Survivors' lawsuit dismissed
                
                **Source:** Tulsa Race Massacre Commission
                
                ---
                
                **Similar massacres in:**
                - East St. Louis (1917): 40-200 killed
                - Elaine, Arkansas (1919): 100-240 killed
                - Rosewood, Florida (1923): Town destroyed
                
                These were not "riots." They were pogroms.
                """,
                keyTakeaway: "4,400+ documented lynchings terrorized Black communities for decades. Congress never passed anti-lynching legislation until 2022. Massacres like Tulsa destroyed thriving Black communities and were hidden from history."
            ),
            HistoryLesson(
                title: "The Labor Wars",
                period: "1877-1937",
                color: .orange,
                content: """
                **When America Waged War on Workers**
                
                Before labor rights existed, workers fought and died for the conditions we take for granted.
                
                ---
                
                **What Workers Faced:**
                
                In the late 1800s-early 1900s:
                - 12-16 hour workdays
                - 6-7 day work weeks
                - No minimum wage
                - Child labor (children as young as 5)
                - Deadly working conditions
                - No workers' compensation
                - Fired for organizing
                
                **Annual workplace deaths:** 35,000+ (1913)
                
                ---
                
                **The Triangle Shirtwaist Fire (1911):**
                
                - 146 workers died (mostly young immigrant women)
                - Locked doors prevented escape
                - No fire escapes
                - Women jumped to their deaths
                - Owners acquitted at trial
                
                Led to fire safety laws—after 146 deaths.
                
                **Source:** David Von Drehle, "Triangle: The Fire That Changed America"
                
                ---
                
                **The Government-Corporate Alliance:**
                
                When workers organized, they faced:
                - Private security (Pinkertons)
                - State militias
                - Federal troops
                - Injunctions from courts
                
                **Homestead Strike (1892):**
                - Carnegie Steel workers struck for fair wages
                - 300 Pinkerton agents attacked workers
                - 16 killed (9 workers, 7 Pinkertons)
                - Pennsylvania militia sent (8,000 troops)
                - Strike broken, union destroyed
                
                **Pullman Strike (1894):**
                - Railway workers struck over wage cuts
                - Federal troops sent by President Cleveland
                - 30 workers killed
                - Strike leader Eugene Debs imprisoned
                
                **Source:** Philip Foner, "History of the Labor Movement"
                
                ---
                
                **The Ludlow Massacre (1914):**
                
                Coal miners in Colorado struck against Rockefeller-owned mines.
                
                - Miners evicted from company housing, lived in tents
                - Colorado National Guard attacked tent colony
                - Machine guns and fire
                - 21 killed, including 11 children and 2 women
                - Children suffocated in pit dug for protection
                
                **John D. Rockefeller Jr.** defended the National Guard's actions.
                
                **No one was convicted.**
                
                **Source:** Howard Zinn, "A People's History"; National Archives
                
                ---
                
                **The Battle of Blair Mountain (1921):**
                
                The largest armed uprising since the Civil War.
                
                - 10,000 coal miners in West Virginia armed and marched
                - Fighting for right to organize
                - U.S. Army sent with planes (dropped bombs)
                - Miners surrendered after 5 days
                - 985 miners indicted for treason
                
                **Source:** James Green, "The Devil Is Here in These Hills"
                
                ---
                
                **What They Won:**
                
                After decades of struggle and death:
                
                - 8-hour workday
                - 40-hour work week
                - Minimum wage
                - Child labor laws
                - Safety regulations
                - Right to organize (Wagner Act, 1935)
                - Social Security
                
                **None of this was given. All of it was fought for.**
                
                ---
                
                **The Forgotten History:**
                
                You learned about the founding fathers.
                
                Did you learn about:
                - Mother Jones
                - Eugene Debs
                - Big Bill Haywood
                - The Wobblies (IWW)
                - The children who died in mines and factories
                - The women who jumped from Triangle
                
                Labor history is American history. It's hidden because it shows what solidarity can achieve.
                """,
                keyTakeaway: "Workers fought and died for 8-hour days, weekends, and safety laws. The government used troops to break strikes. The Ludlow Massacre killed 11 children. This history is hidden because it shows solidarity's power."
            ),
            HistoryLesson(
                title: "Japanese Internment",
                period: "1942-1946",
                color: .gray,
                content: """
                **When America Imprisoned Its Own Citizens**
                
                During World War II, 120,000 people of Japanese descent—most U.S. citizens—were imprisoned without charge or trial.
                
                ---
                
                **What Happened:**
                
                After Pearl Harbor (December 1941):
                
                **Executive Order 9066 (February 1942):**
                - Signed by President Franklin D. Roosevelt
                - Authorized "exclusion zones"
                - Forced removal of all people of Japanese ancestry from West Coast
                
                **Who was imprisoned:**
                - 120,000 people
                - 62% were American citizens
                - Including children, elderly, disabled
                - Given days to dispose of homes, businesses, possessions
                
                ---
                
                **The Camps:**
                
                Officially called "relocation centers." In reality: prison camps.
                
                - Surrounded by barbed wire
                - Armed guards with orders to shoot
                - Located in remote, harsh locations (deserts, swamps)
                - Families crowded into barracks
                - Communal bathrooms with no privacy
                - No freedom of movement
                
                **Camp names:** Manzanar, Tule Lake, Heart Mountain, Topaz, Poston, Gila River, Minidoka, Amache, Rohwer, Jerome
                
                **Source:** National Archives; Japanese American National Museum
                
                ---
                
                **The Injustice:**
                
                **No evidence of disloyalty was required.**
                
                - No Japanese American was ever convicted of espionage
                - Military knew there was no security threat (MAGIC intercepts)
                - FBI Director J. Edgar Hoover opposed internment as unnecessary
                
                **Meanwhile:**
                - German Americans and Italian Americans were not mass-imprisoned
                - Difference: Race
                
                ---
                
                **The Legal Shame:**
                
                **Korematsu v. United States (1944):**
                
                Supreme Court upheld internment 6-3.
                
                Justice Frank Murphy's dissent:
                > "This exclusion goes over 'the very brink of constitutional power' and falls into the ugly abyss of racism."
                
                Korematsu was not formally overturned until **2018** (Trump v. Hawaii, where Chief Justice Roberts called it "gravely wrong").
                
                ---
                
                **What Was Lost:**
                
                Japanese Americans lost:
                - Homes
                - Businesses
                - Farms
                - Savings
                - Years of their lives
                - Family members who died in camps
                - Their sense of belonging
                
                **Estimated property loss:** $400 million (1940s dollars) = ~$6 billion today
                
                ---
                
                **The Soldiers:**
                
                Despite imprisonment, Japanese Americans served:
                
                **442nd Regimental Combat Team:**
                - Most decorated unit in U.S. military history
                - 9,486 Purple Hearts
                - 21 Medals of Honor
                - Fought while their families were in camps
                
                ---
                
                **Redress:**
                
                **1988:** President Reagan signed Civil Liberties Act
                - Official government apology
                - $20,000 to each surviving internee
                - Acknowledgment that internment was based on "race prejudice, war hysteria, and a failure of political leadership"
                
                It took 46 years.
                
                ---
                
                **The Lessons:**
                
                After 9/11, some politicians proposed similar treatment for Muslims.
                
                Japanese American groups were among the first to speak against it.
                
                The same arguments used for internment are used today for:
                - Muslim bans
                - Border detention camps
                - Family separation
                
                History repeats when we don't learn it.
                """,
                keyTakeaway: "120,000 Japanese Americans (62% citizens) were imprisoned without charge based solely on race. The Supreme Court upheld it. It took 46 years to apologize. The same logic is used for immigration detention today."
            ),
            HistoryLesson(
                title: "COINTELPRO",
                period: "1956-1971",
                color: .purple,
                content: """
                **When the FBI Waged War on Americans**
                
                The FBI ran a secret program to "disrupt, discredit, and destroy" American political movements.
                
                ---
                
                **What Was COINTELPRO:**
                
                **Counter Intelligence Program** (1956-1971)
                
                FBI Director J. Edgar Hoover's domestic warfare:
                - Surveillance
                - Infiltration
                - Disinformation
                - Harassment
                - Psychological warfare
                - Inciting violence
                - Assassination
                
                **Targets:**
                - Civil rights movement
                - Black Power movement
                - Anti-war movement
                - Socialist and communist groups
                - Puerto Rican independence movement
                - American Indian Movement
                - Women's liberation movement
                
                **Source:** Senate Church Committee Report (1976)
                
                ---
                
                **Martin Luther King Jr.:**
                
                The FBI considered MLK the "most dangerous Negro in America."
                
                **Documented FBI actions:**
                - Wiretapped his phones
                - Bugged his hotel rooms
                - Recorded his private conversations
                - Sent anonymous letter urging him to commit suicide
                - Attempted to prevent his Nobel Prize acceptance
                - Tried to discredit him before March on Washington
                
                **The "suicide letter":**
                FBI sent King a letter with recordings, calling him an "evil, abnormal beast" and suggesting:
                > "There is only one thing left for you to do... You are done. There is but one way out for you."
                
                This was sent 34 days before King was to receive the Nobel Peace Prize.
                
                **Source:** FBI files (released under FOIA); Church Committee
                
                ---
                
                **Fred Hampton:**
                
                21-year-old chairman of Illinois Black Panther Party.
                
                **FBI classified Hampton as a "key extremist" and worked to neutralize him.**
                
                **December 4, 1969:**
                - FBI informant provided apartment floor plan
                - Chicago police raided at 4:30 AM
                - Fired 90+ shots, Panthers fired 1
                - Hampton shot twice in head while unconscious in bed
                - His pregnant fiancée was in the bed
                
                Later investigation revealed:
                - FBI had drugged Hampton (informant put barbiturates in his drink)
                - Raid was coordinated with FBI
                - Police initially claimed "shootout" (lie)
                
                **No one was criminally prosecuted.**
                
                Civil lawsuit resulted in $1.85 million settlement.
                
                **Source:** U.S. House Committee on Internal Security; Jeffrey Haas, "The Assassination of Fred Hampton"
                
                ---
                
                **Other COINTELPRO Tactics:**
                
                - Sent fake letters to create conflicts between groups
                - Planted stories with friendly journalists
                - Got people fired from jobs
                - Spread rumors to destroy marriages
                - Infiltrators provoked illegal activity for arrests
                - Created fake organizational newsletters
                
                ---
                
                **The End:**
                
                COINTELPRO was exposed in 1971 when activists broke into FBI office in Media, Pennsylvania, and stole files.
                
                **Church Committee (1976):**
                Senate investigation revealed full scope.
                
                Senator Frank Church:
                > "The FBI has conducted a sophisticated vigilante operation aimed squarely at preventing the exercise of First Amendment rights."
                
                ---
                
                **Today:**
                
                After 9/11, similar surveillance expanded:
                - Patriot Act
                - NSA mass surveillance (Snowden revelations)
                - Monitoring of Black Lives Matter
                - Infiltration of Standing Rock protesters
                - "Black Identity Extremist" designation (2017)
                
                The tactics continue under different names.
                """,
                keyTakeaway: "FBI's COINTELPRO surveilled, harassed, and killed Americans exercising their rights. MLK received FBI letters urging suicide. Fred Hampton was drugged and assassinated in his bed. Similar tactics continue today."
            ),
            HistoryLesson(
                title: "The Civil Rights Movement",
                period: "1954-1968",
                color: .blue,
                content: """
                **The Movement Beyond the Myths**
                
                The civil rights movement is taught as a sanitized story of peaceful progress. The reality was more radical, more dangerous, and more contested.
                
                ---
                
                **What They Don't Teach:**
                
                **Martin Luther King Jr. was deeply unpopular:**
                
                1966 Gallup poll:
                - 63% of Americans had an unfavorable opinion of King
                - 72% of white Americans disapproved of the March on Washington
                
                King was called:
                - "Communist"
                - "Outside agitator"
                - "Divisive"
                - Sound familiar?
                
                **Source:** Gallup Historical Polls
                
                ---
                
                **MLK Was Radical:**
                
                King is quoted for "I Have a Dream." Less quoted:
                
                **On capitalism (1967):**
                > "We must recognize that we can't solve our problem now until there is a radical redistribution of economic and political power."
                
                **On Vietnam (1967):**
                > "The greatest purveyor of violence in the world today: my own government."
                
                **On riots (1967):**
                > "A riot is the language of the unheard."
                
                **On white moderates (Letter from Birmingham Jail):**
                > "I have almost reached the regrettable conclusion that the Negro's great stumbling block... is not the White Citizen's Counciler or the Ku Klux Klanner, but the white moderate."
                
                At death, King was organizing the **Poor People's Campaign**—a multiracial movement against poverty and capitalism.
                
                ---
                
                **The Violence Against Activists:**
                
                The movement was met with systematic violence:
                
                **16th Street Baptist Church (1963):**
                - Birmingham, Alabama
                - KKK bombed church during Sunday school
                - Four girls killed: Addie Mae Collins (14), Cynthia Wesley (14), Carole Robertson (14), Carol Denise McNair (11)
                
                **Freedom Summer (1964):**
                - James Chaney, Andrew Goodman, Michael Schwerner murdered
                - Killed by KKK with help of local police
                - Bodies found 44 days later
                
                **Selma (1965):**
                - "Bloody Sunday": Police beat marchers on Edmund Pettus Bridge
                - Jimmie Lee Jackson shot by state trooper
                - Viola Liuzzo shot by KKK after march
                
                **Source:** FBI files; Civil Rights Movement Archives
                
                ---
                
                **Beyond King:**
                
                The movement included many who are less celebrated:
                
                **Ella Baker:** Organized SNCC, mentored young activists
                **Fannie Lou Hamer:** Beaten for registering to vote, challenged Democratic Party
                **Diane Nash:** Led Freedom Rides, Nashville sit-ins
                **Bayard Rustin:** Organized March on Washington (gay, largely erased)
                **Malcolm X:** Articulated Black self-defense and self-determination
                **Robert F. Williams:** Armed self-defense in Monroe, NC
                
                The movement was not one man.
                
                ---
                
                **What Was Won:**
                
                - **Civil Rights Act (1964):** Banned discrimination in public accommodations
                - **Voting Rights Act (1965):** Banned discriminatory voting practices
                - **Fair Housing Act (1968):** Banned housing discrimination
                
                ---
                
                **What Remains Undone:**
                
                The Voting Rights Act was gutted by Supreme Court in 2013 (Shelby County v. Holder).
                
                Since then:
                - Hundreds of polling places closed in Black communities
                - Voter ID laws passed
                - Purges of voter rolls
                - Gerrymandering
                
                The backlash to civil rights never stopped. It just changed forms.
                
                King's final campaign—against poverty—was never completed.
                
                The revolution is unfinished.
                """,
                keyTakeaway: "MLK was deeply unpopular and radical—against capitalism and war. The movement faced systematic violence and murder. The Voting Rights Act was gutted in 2013. The backlash never stopped."
            ),
            HistoryLesson(
                title: "Mass Incarceration",
                period: "1970-Present",
                color: .red,
                content: """
                **The New Jim Crow**
                
                America has 4% of the world's population and 20% of its prisoners. This is not an accident.
                
                ---
                
                **The Numbers:**
                
                - **2.3 million** people in U.S. prisons and jails
                - **5.5 million** under correctional supervision (probation, parole)
                - **1 in 3** Black men will be incarcerated at some point
                - U.S. incarceration rate: **639 per 100,000**
                - Comparable countries: 100-150 per 100,000
                
                **Source:** Bureau of Justice Statistics; Prison Policy Initiative
                
                ---
                
                **How It Happened:**
                
                **Nixon's War on Drugs (1971):**
                
                Nixon aide John Ehrlichman admitted in 1994:
                
                > "The Nixon campaign in 1968, and the Nixon White House after that, had two enemies: the antiwar left and Black people... We knew we couldn't make it illegal to be either against the war or Black, but by getting the public to associate the hippies with marijuana and Blacks with heroin, and then criminalizing both heavily, we could disrupt those communities."
                
                **Source:** Dan Baum, Harper's Magazine (2016)
                
                ---
                
                **Reagan's Escalation:**
                
                - Mandatory minimum sentences
                - 100:1 crack vs. powder cocaine disparity
                  (Same drug, crack = Black communities, powder = white)
                - Massive prison construction
                - "Just Say No" (while CIA-linked Contras brought cocaine to U.S.)
                
                ---
                
                **Clinton's Crime Bill (1994):**
                
                **Violent Crime Control and Law Enforcement Act:**
                - $10 billion for prison construction
                - "Three strikes" provisions
                - Eliminated Pell grants for prisoners
                - 100,000 new police officers
                - Expanded death penalty
                
                **Joe Biden wrote this bill.**
                
                Hillary Clinton called young Black men "super-predators."
                
                Prison population exploded.
                
                **Source:** Bureau of Justice Statistics
                
                ---
                
                **The Prison-Industrial Complex:**
                
                **Who profits from mass incarceration:**
                
                **Private prisons:**
                - CoreCivic (formerly CCA): $1.8 billion revenue
                - GEO Group: $2.3 billion revenue
                - Contracts guarantee 90% occupancy
                - Lobby for longer sentences
                
                **Prison labor:**
                - Prisoners paid $0.23-$1.15 per hour
                - Make products for: McDonald's, Walmart, Starbucks, Victoria's Secret
                - 13th Amendment: Slavery legal as punishment
                
                **Phone companies:**
                - Charge $1/minute for calls
                - Families pay $500-1,000/year to stay in contact
                
                **Bail industry:**
                - $2 billion industry
                - 470,000 people in jail pretrial (not convicted)
                - Can't afford bail = lose job, housing, custody
                
                ---
                
                **The Racial Disparity:**
                
                Black Americans:
                - 13% of population
                - 33% of prisoners
                
                White Americans:
                - Use drugs at similar rates
                - 5x less likely to be incarcerated
                
                Black men born in 2001:
                - 1 in 3 chance of imprisonment
                
                White men born in 2001:
                - 1 in 17 chance
                
                **Source:** Sentencing Project; Bureau of Justice Statistics
                
                ---
                
                **The Consequences:**
                
                After prison:
                - Can't vote (in many states)
                - Can't get public housing
                - Can't get food stamps
                - Can't get student loans
                - Can't get many jobs
                - Must disclose on applications
                
                It's a system designed to create permanent underclass.
                
                **Source:** Michelle Alexander, "The New Jim Crow"
                
                ---
                
                **The Alternative:**
                
                Countries with lower incarceration:
                - Focus on rehabilitation, not punishment
                - Treat addiction as health issue
                - Invest in education, jobs, housing
                - No private prison profit motive
                
                America chose this. It can choose differently.
                """,
                keyTakeaway: "Mass incarceration was deliberately created to target Black communities (Nixon aide admitted it). Prison corporations profit from bodies. 1 in 3 Black men will be incarcerated. This is the new Jim Crow."
            ),
            HistoryLesson(
                title: "The Pattern",
                period: "1492-Present",
                color: .white,
                content: """
                **Seeing the Throughline**
                
                American history follows a pattern that repeats.
                
                ---
                
                **The Cycle:**
                
                1. **Exploitation** of a group for profit
                2. **Ideology** created to justify exploitation
                3. **Progress** won through struggle and sacrifice
                4. **Backlash** by those who lose power
                5. **New form** of exploitation emerges
                
                ---
                
                **Example 1: Slavery → Jim Crow → Mass Incarceration**
                
                - Slavery: Exploit Black labor (1619-1865)
                - Reconstruction: Progress (1865-1877)
                - Jim Crow: Backlash and new exploitation (1877-1965)
                - Civil Rights: Progress (1954-1968)
                - Mass incarceration: New form of control (1970-present)
                
                ---
                
                **Example 2: Native Land Theft**
                
                - Colonization: Take land by force (1492-1800s)
                - Treaties: Fake progress, all broken
                - Reservations: Concentrated poverty
                - Termination era: Tried to dissolve tribes (1940s-60s)
                - Today: Sacred sites still desecrated, poverty persists
                
                ---
                
                **Example 3: Labor**
                
                - Industrial exploitation (1870s-1930s)
                - New Deal: Progress (1930s)
                - Union-busting, outsourcing: Backlash (1970s-present)
                - Gig economy: New exploitation
                
                ---
                
                **Example 4: Immigration**
                
                - Invite labor when needed (Chinese railroads, Mexican agriculture)
                - Scapegoat when convenient (Chinese Exclusion, Operation Wetback)
                - Repeat (guest workers today)
                
                ---
                
                **The Common Elements:**
                
                Every era has:
                
                1. **An exploited group** whose labor/land is extracted
                2. **A benefiting class** that accumulates wealth
                3. **An ideology** that justifies exploitation
                   - "Manifest Destiny"
                   - "Scientific racism"
                   - "Meritocracy"
                   - "Illegal alien"
                4. **Complicit institutions** that enforce the system
                5. **Resistance** from below
                6. **Historical amnesia** that erases the truth
                
                ---
                
                **The Ideology Updates:**
                
                | Era | Justification |
                |-----|---------------|
                | Slavery | "Natural order," "Curse of Ham" |
                | Jim Crow | "Separate but equal," "States' rights" |
                | Today | "Personal responsibility," "Color-blind" |
                
                The function is the same: Justify exploitation.
                
                ---
                
                **What Changes:**
                
                Real progress happens through:
                - Organized movements
                - Solidarity across groups
                - Direct action
                - Political power
                - Sustained pressure
                
                It is never given. It is always taken.
                
                ---
                
                **Why This Matters:**
                
                If you don't know the pattern, you can't see it repeating.
                
                Today:
                - Mass incarceration targets who slavery targeted
                - Border detention mirrors Japanese internment
                - Voter suppression uses new forms of old tactics
                - Labor exploitation continues through "gig" work
                - Wealth concentrates at the top
                
                **Knowing history is not about the past.**
                **It's about seeing the present clearly.**
                
                ---
                
                **The Choice:**
                
                Every generation faces the choice:
                
                - Accept the mythology and participate in exploitation
                - See the pattern and join the resistance
                
                Which side of history will you be on?
                """,
                keyTakeaway: "American history follows a pattern: exploitation, ideology, progress through struggle, backlash, new exploitation. Slavery became Jim Crow became mass incarceration. Knowing the pattern helps you see it repeating today."
            )
        ]
    }
}

// MARK: - Lesson Model

struct HistoryLesson: Identifiable {
    let id = UUID()
    let title: String
    let period: String
    let color: Color
    let content: String
    let keyTakeaway: String
}

// MARK: - Lesson View

struct HistoryLessonView: View {
    let lesson: HistoryLesson
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
                        
                        Text(lesson.period)
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
                
                // Content
                Text(lesson.content)
                    .font(.system(size: 15))
                    .foregroundColor(.white.opacity(0.9))
                    .lineSpacing(6)
                
                // Key Takeaway
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
    NavigationStack {
        TrueAmericanHistoryCourse()
    }
}
