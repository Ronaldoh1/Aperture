// CatholicChurchExposeCourse.swift
// THE VATICAN EXPOSED - Crimes, Lies, and Hidden History

import SwiftUI

struct CatholicChurchExposeCourse {
    static let shared = CatholicChurchExposeCourse()
    
    let id = "catholic_expose"
    let title = "The Vatican Exposed"
    let subtitle = "Crimes, lies, and hidden history"
    let icon = "building.columns.fill"
    let colorHex = "#8B0000"
    
    var color: Color { Color(hex: colorHex) }
    
    let modules: [VaticanModule] = [
        
        // ═══════════════════════════════════════════════════════════════
        // MODULE 1: THE CRIMES
        // ═══════════════════════════════════════════════════════════════
        
        VaticanModule(
            id: "cc_crimes",
            number: 1,
            title: "The Crimes",
            subtitle: "What they did and covered up",
            lessons: [
                VaticanLesson(
                    id: "cc1_1",
                    title: "The Pedophilia Crisis",
                    content: """
**A Global Pattern of Child Abuse and Cover-Up**

This isn't isolated incidents. This is a systematic, global pattern spanning decades.

**The Numbers:**
- **United States:** 11,000+ victims, 4,400+ accused priests (John Jay Report, 2004)
- **Australia:** 4,400+ victims in Catholic institutions (Royal Commission, 2017)
- **Ireland:** 15,000+ children abused in Catholic institutions (Ryan Report, 2009)
- **Germany:** 3,677+ victims, 1,670+ accused clergy (German Bishops' Conference, 2018)
- **France:** 330,000+ victims since 1950 (CIASE Report, 2021)
- **Global estimate:** Hundreds of thousands of victims

**The Cover-Up System:**

1. **Crimen Sollicitationis (1962):** Secret Vatican document requiring all sexual abuse cases to be handled internally under "pontifical secret" - penalty of excommunication for revealing

2. **The Transfer Protocol:** Instead of reporting to police, abusive priests were transferred to new parishes where they abused again

3. **Silencing Victims:** Victims pressured to sign NDAs, threatened with excommunication, told reporting was "sin"

4. **Cardinal Bernard Law:** Boston Archbishop who covered up 250+ abusive priests, transferred to Vatican position after scandal broke

**Pope Benedict XVI (Joseph Ratzinger):**
- As head of Congregation for Doctrine of Faith (1981-2005), all abuse cases went through his office
- 2001 letter reminded bishops that abuse cases were under "pontifical secret"
- Critics argue he was architect of global cover-up system

**Financial Settlements:**
- U.S. dioceses have paid $4+ billion in settlements
- Multiple dioceses declared bankruptcy to limit payouts
- Victims often received a fraction of their damages

🔥 **The Pattern:** This wasn't "bad apples." This was institutional policy - protect the Church's reputation at all costs, even children's lives.

**📚 Sources:**
- John Jay Report (2004)
- Pennsylvania Grand Jury Report (2018)
- Australian Royal Commission (2017)
- CIASE Report, France (2021)
- Boston Globe Spotlight Investigation (2002)
""",
                    keyPoints: [
                        "330,000+ victims in France alone since 1950",
                        "Vatican documents required secrecy, not reporting",
                        "Abusive priests transferred, not prosecuted",
                        "$4+ billion paid in U.S. settlements"
                    ]
                ),
                
                VaticanLesson(
                    id: "cc1_2",
                    title: "The Inquisition",
                    content: """
**Centuries of Torture and Murder in God's Name**

The Inquisition wasn't medieval ignorance - it was systematic terror lasting 600+ years.

**The Timeline:**
- **1184:** Episcopal Inquisition begins
- **1231:** Papal Inquisition established by Gregory IX
- **1478:** Spanish Inquisition begins (lasted until 1834)
- **1542:** Roman Inquisition established (still exists as "Congregation for the Doctrine of the Faith")

**The Methods:**
Official Church-sanctioned torture techniques:
- The Rack (stretching limbs)
- Strappado (hanging by dislocated arms)
- Water torture
- The Wheel
- Burning alive
- "Heretic's Fork"

**The Victims:**
- Jews (forced conversions or death)
- Muslims
- Protestants
- Scientists (Galileo, Giordano Bruno)
- "Witches" (mostly women healers)
- Anyone who questioned Church authority

**Giordano Bruno (1600):**
- Proposed infinite universe, multiple worlds
- Burned alive in Rome's Campo de' Fiori
- Vatican has never apologized

**Galileo (1633):**
- Proved Earth orbits sun
- Forced to recant under threat of torture
- House arrest until death
- Vatican "apologized" in 1992 - 359 years later

**The Numbers:**
Estimates vary widely:
- Spanish Inquisition: 3,000-5,000 executions
- Total Inquisition deaths: Tens of thousands directly
- Witch trials (Church-enabled): 40,000-60,000

🔥 **The Legacy:** The current "Congregation for the Doctrine of the Faith" is the direct descendant of the Inquisition. Same office, different name.

**📚 Sources:**
- Peters, Edward. "Inquisition" (1988)
- Kamen, Henry. "The Spanish Inquisition" (1997)
- Vatican Archives (partially opened 1998)
""",
                    keyPoints: [
                        "600+ years of official Church torture and murder",
                        "Scientists burned alive for contradicting doctrine",
                        "Inquisition office still exists under new name",
                        "Vatican took 359 years to apologize to Galileo"
                    ]
                ),
                
                VaticanLesson(
                    id: "cc1_3",
                    title: "The Crusades",
                    content: """
**Holy Wars That Killed Millions**

The Crusades weren't defense - they were imperial conquest sanctified by religion.

**The Death Toll:**
Conservative estimates: 1-3 million deaths
Some historians: Up to 9 million

**First Crusade (1096-1099):**
- Pope Urban II promised: "All sins forgiven" for crusaders
- Massacre of Jerusalem: 40,000+ Muslims and Jews killed
- Eyewitness: "Blood ran ankle-deep in the streets"
- Jews burned alive in synagogues

**The Children's Crusade (1212):**
- Thousands of children sent to "reclaim Holy Land"
- Most died of disease or starvation
- Many sold into slavery
- Church encouraged this

**Fourth Crusade (1204):**
- Crusaders sacked Constantinople - a CHRISTIAN city
- Murdered Christians, looted churches
- Pope initially condemned, then accepted the loot

**The Albigensian Crusade (1209-1229):**
- Against the Cathars in France
- "Kill them all, God will know his own" - Papal legate
- Estimated 200,000-1,000,000 killed
- Entire culture destroyed

**The Pattern:**
- Pope declares crusade
- Sins forgiven for participants
- Land and wealth stolen
- Entire peoples massacred
- Church grows richer and more powerful

**Modern Catholic Position:**
- John Paul II apologized in 2000 for "sins of Christians"
- Never returned stolen wealth
- Never formally condemned the Crusades as wrong

🔥 **The Truth:** The Crusades were religiously-sanctioned genocide that enriched the Church through mass murder.

**📚 Sources:**
- Riley-Smith, Jonathan. "The Crusades" (1987)
- Tyerman, Christopher. "God's War" (2006)
- Madden, Thomas. "The New Concise History of the Crusades" (2005)
""",
                    keyPoints: [
                        "1-9 million killed in Church-sanctioned wars",
                        "'All sins forgiven' for killing non-Christians",
                        "Cathars: 200,000-1,000,000 killed for different beliefs",
                        "Fourth Crusade massacred fellow Christians"
                    ]
                )
            ]
        ),
        
        // ═══════════════════════════════════════════════════════════════
        // MODULE 2: THE LIES
        // ═══════════════════════════════════════════════════════════════
        
        VaticanModule(
            id: "cc_lies",
            number: 2,
            title: "The Lies",
            subtitle: "Fabrications that built an empire",
            lessons: [
                VaticanLesson(
                    id: "cc2_1",
                    title: "The Donation of Constantine",
                    content: """
**The Forgery That Built Papal Power**

For 700+ years, the Church used a forged document to claim political authority over all of Western Europe.

**The Claim:**
Emperor Constantine (4th century) supposedly granted Pope Sylvester I:
- Supremacy over all other churches
- Imperial regalia and symbols
- Sovereignty over Rome and the Western Roman Empire
- The right to crown emperors

**The Forgery:**
- Created around 750-850 CE (400+ years after Constantine)
- Used to justify papal territorial claims
- Basis for the Papal States
- Used to claim authority over kings

**The Exposure:**
- Lorenzo Valla (1440): Proved it was a forgery through linguistic analysis
- Latin used was medieval, not 4th century
- Historical anachronisms throughout
- Church initially suppressed Valla's work

**The Church's Response:**
- Continued using the document after exposure
- Never apologized for centuries of deception
- Used it to build and maintain power for 700+ years
- Modern Church quietly acknowledges it's fake

**The Impact:**
Based on this forgery, the Church:
- Claimed authority to crown Holy Roman Emperors
- Built the Papal States (756-1870)
- Justified interfering in secular governments
- Accumulated massive wealth and land

🔥 **The Lesson:** The Church built its political empire on a known lie and continued using it even after exposure.

**📚 Sources:**
- Valla, Lorenzo. "De falso credita et ementita Constantini Donatione" (1440)
- Fried, Johannes. "Donation of Constantine and Constitutum Constantini" (2007)
- Catholic Encyclopedia (acknowledges forgery)
""",
                    keyPoints: [
                        "Forged document claimed Constantine gave Church political power",
                        "Used for 700+ years before being exposed",
                        "Church continued using it after proof of forgery",
                        "Built Papal political empire on documented lie"
                    ]
                ),
                
                VaticanLesson(
                    id: "cc2_2",
                    title: "Peter Was Never in Rome",
                    content: """
**The Foundation Myth**

The entire papal authority rests on the claim that Peter was the first Bishop of Rome. The evidence doesn't support this.

**The Claim:**
- Peter was the "rock" on which Church was built (Matthew 16:18)
- Peter went to Rome and became its first bishop
- Peter was martyred in Rome under Nero
- Papal succession from Peter gives popes authority

**The Problems:**

1. **No Biblical Evidence:**
   - Paul's letter to Romans (57 CE) greets many people - not Peter
   - Paul would surely mention Peter if he was leading the Roman church
   - Acts ends with Paul in Rome - no mention of Peter there

2. **Historical Silence:**
   - No contemporary record of Peter in Rome
   - First claim of Peter in Rome: Clement (96 CE) - vague
   - First claim of Peter as Roman bishop: Much later

3. **The "Tomb" Problem:**
   - "Peter's tomb" under St. Peter's Basilica
   - Bones found in 1950s, declared "Peter's" in 1968
   - No actual evidence they're Peter's
   - Convenient that it can't be independently verified

4. **Peter's Actual Role:**
   - Galatians 2: Paul confronts Peter in Antioch
   - Peter was associated with Jewish Christians
   - James led Jerusalem church, not Peter

**What Scholars Say:**
- Many historians consider Peter's Roman episcopate legendary
- The claim served to give Rome authority over other churches
- Eastern churches never accepted Roman supremacy

🔥 **The Question:** If Peter was never Bishop of Rome, what is papal authority based on?

**📚 Sources:**
- O'Connor, Daniel William. "Peter in Rome" (1969)
- Lampe, Peter. "From Paul to Valentinus: Christians at Rome" (2003)
- Bockmuehl, Markus. "Simon Peter in Scripture and Memory" (2012)
""",
                    keyPoints: [
                        "Paul's letter to Rome doesn't mention Peter being there",
                        "No contemporary evidence Peter was in Rome",
                        "'Peter's bones' can't be verified",
                        "Eastern churches never accepted Rome's Peter-based authority"
                    ]
                ),
                
                VaticanLesson(
                    id: "cc2_3",
                    title: "They Chose Which Books",
                    content: """
**The Bible Didn't Fall From Heaven**

The Catholic Church decided which books became "scripture" and which were destroyed.

**The Selection Process:**

**Council of Nicaea (325 CE):**
- Called by Emperor Constantine (not a Christian until deathbed)
- Political unification was the goal
- Decided which beliefs were "orthodox"
- Ordered destruction of "heretical" texts

**Council of Rome (382 CE):**
- First official list of Biblical canon
- Pope Damasus I's list
- Excluded many early Christian texts

**Council of Carthage (397 CE):**
- Finalized New Testament canon
- 27 books chosen from hundreds of texts
- Criteria: Aligned with Church authority

**What Was Excluded:**
- Gospel of Thomas (Jesus's sayings without narrative)
- Gospel of Mary (Magdalene as key disciple)
- Gospel of Philip (different Jesus)
- Gospel of Judas (different betrayal story)
- Apocalypse of Peter
- Shepherd of Hermas (was almost included)
- Many others destroyed

**Nag Hammadi Discovery (1945):**
- 52 texts found buried in Egypt
- Hidden from Church destruction
- Revealed diverse early Christianity
- Showed Gnostic Christians had different beliefs

**What This Means:**
- The Bible is a human-selected anthology
- Church chose texts that supported their authority
- Alternative views were called "heresy" and destroyed
- Christianity could have looked very different

🔥 **The Truth:** The Church didn't preserve Christianity - they shaped it to serve institutional power, then destroyed the alternatives.

**📚 Sources:**
- Pagels, Elaine. "The Gnostic Gospels" (1979)
- Ehrman, Bart. "Lost Christianities" (2003)
- Metzger, Bruce. "The Canon of the New Testament" (1987)
- Nag Hammadi Library translations
""",
                    keyPoints: [
                        "Councils of men chose which books became 'scripture'",
                        "Hundreds of early Christian texts were excluded",
                        "Nag Hammadi (1945) revealed destroyed texts",
                        "Alternative Christianities were erased"
                    ]
                )
            ]
        ),
        
        // ═══════════════════════════════════════════════════════════════
        // MODULE 3: THE WEALTH
        // ═══════════════════════════════════════════════════════════════
        
        VaticanModule(
            id: "cc_wealth",
            number: 3,
            title: "The Wealth",
            subtitle: "Following the money",
            lessons: [
                VaticanLesson(
                    id: "cc3_1",
                    title: "The Vatican Bank",
                    content: """
**Money Laundering, Mafia Connections, and Mysterious Deaths**

The Vatican Bank (IOR - Institute for Works of Religion) has been involved in some of the biggest financial scandals of the 20th century.

**Banco Ambrosiano Scandal (1982):**
- Roberto Calvi, "God's Banker," found hanged under London bridge
- $1.3 billion missing
- Vatican Bank was major shareholder
- Mafia connections documented
- Vatican paid $244 million to creditors (not admitting guilt)

**Archbishop Paul Marcinkus:**
- Head of Vatican Bank during scandals
- Indicted by Italian authorities
- Vatican refused extradition
- Never faced trial
- Promoted to archbishop

**Pope John Paul I (1978):**
- Died after 33 days as Pope
- Was investigating Vatican Bank
- Had list of Freemasons in Vatican hierarchy
- No autopsy performed
- Body embalmed immediately
- Conspiracy theories persist

**Modern Scandals:**
- 2010: Italian police seized €23 million from Vatican Bank
- 2012: Vatileaks revealed corruption documents
- 2013-present: Ongoing reforms (limited)
- 2020: €350 million London real estate scandal

**The Structure:**
- Vatican Bank is outside all banking regulations
- No external audits until recently
- Perfect for money laundering
- Used by Italian elite to hide money

🔥 **The Pattern:** The institution that preaches poverty operates one of the world's most secretive banks with documented criminal connections.

**📚 Sources:**
- Yallop, David. "In God's Name" (1984)
- Raw, Charles. "The Moneychangers" (1992)
- Nuzzi, Gianluigi. "Vatican SpA" (2009)
- Financial Times investigative reporting
""",
                    keyPoints: [
                        "'God's Banker' found hanged, $1.3 billion missing",
                        "Vatican Bank officials indicted but protected",
                        "Pope John Paul I died after 33 days investigating",
                        "Bank operates outside normal regulations"
                    ]
                ),
                
                VaticanLesson(
                    id: "cc3_2",
                    title: "The Hidden Wealth",
                    content: """
**The Richest Institution on Earth**

While preaching "Blessed are the poor," the Vatican hoards unfathomable wealth.

**Vatican Wealth Estimates:**
- Real estate holdings: $10-15 billion (conservative)
- Gold reserves: Unknown (possibly billions)
- Art collection: Priceless (Michelangelo, Raphael, etc.)
- Financial investments: Unknown
- Land holdings: Largest non-government landowner in many countries

**Global Catholic Church:**
- U.S. Catholic Church alone: $30+ billion annual budget
- Property holdings: Impossible to fully assess
- Tax exempt status worldwide
- Receives government funding in many countries

**What They Own:**
- St. Peter's Basilica (worth?)
- Sistine Chapel (worth?)
- Centuries of art plundered from across the world
- The Vatican Library (priceless manuscripts)
- Real estate in Rome, across Italy, globally
- Investments in corporations worldwide

**The Contrast:**
Jesus said: "Sell everything you have and give to the poor" (Luke 18:22)

Vatican does: 
- Sits on billions while poverty exists
- Charges admission to see "holy" sites
- Sells indulgences (historically)
- Accumulates wealth continuously

**Tax Exemption:**
- Church pays no taxes in most countries
- Receives government subsidies in many
- Hospital and school exemptions
- Effectively subsidized by taxpayers

🔥 **The Hypocrisy:** An institution founded by a homeless carpenter who condemned wealth has become the richest religious organization in history.

**📚 Sources:**
- Posner, Gerald. "God's Bankers" (2015)
- Berry, Jason & Renner, Gerald. "Vows of Silence" (2004)
- The Economist: "The Vatican's Finances" (various)
""",
                    keyPoints: [
                        "Vatican real estate alone worth $10-15+ billion",
                        "Largest non-government landowner in many countries",
                        "Priceless art while preaching poverty",
                        "Tax exempt, often government subsidized"
                    ]
                )
            ]
        ),
        
        // ═══════════════════════════════════════════════════════════════
        // MODULE 4: THE SUPPRESSION
        // ═══════════════════════════════════════════════════════════════
        
        VaticanModule(
            id: "cc_suppression",
            number: 4,
            title: "The Suppression",
            subtitle: "Knowledge they hid from you",
            lessons: [
                VaticanLesson(
                    id: "cc4_1",
                    title: "The Vatican Secret Archives",
                    content: """
**53 Miles of Hidden Documents**

The Vatican Apostolic Archive (renamed from "Secret Archives" in 2019) contains 53 miles of shelving holding documents spanning 12 centuries.

**What's In There:**
- Letters from Michelangelo
- Henry VIII's request for divorce
- Galileo's trial documents
- Letters from Mary Queen of Scots
- Papal Bulls authorizing slavery
- Inquisition records
- Accounts of Church crimes
- Who knows what else?

**Access:**
- Only "qualified scholars" allowed
- Must apply and be approved by Vatican
- Cannot browse - must request specific documents
- Many sections completely closed
- No complete catalog available publicly

**What We Know Is Hidden:**
- Full Inquisition archives (partially opened 1998)
- Child abuse files (internal investigations)
- Financial records
- Diplomatic correspondence
- Anything "embarrassing" to the Church

**Why It Matters:**
- History written by those who control archives
- Church narrative can't be independently verified
- Evidence of crimes potentially hidden
- Alternative Christian histories suppressed

**The 2019 Name Change:**
- From "Vatican Secret Archives" to "Vatican Apostolic Archive"
- PR move to seem more open
- Access restrictions unchanged
- Still guards 12 centuries of secrets

🔥 **The Question:** What are they hiding that requires 53 miles of restricted archives?

**📚 Sources:**
- Vatican official statements
- Blouin, Francis & Rosenberg, William. "Processing the Past" (2011)
- The Guardian: Vatican Archives reporting
""",
                    keyPoints: [
                        "53 miles of shelving, 12 centuries of documents",
                        "Access strictly controlled by Vatican",
                        "No complete public catalog exists",
                        "Renamed from 'Secret' to 'Apostolic' - same restrictions"
                    ]
                ),
                
                VaticanLesson(
                    id: "cc4_2",
                    title: "The Real Mary Magdalene",
                    content: """
**The Woman They Slandered**

Mary Magdalene was the most important disciple. The Church turned her into a prostitute to suppress feminine spiritual authority.

**What the Bible Actually Says:**
- First witness to the resurrection (all four Gospels)
- Jesus appeared to her first
- She announced the resurrection to male disciples
- Called "Apostle to the Apostles"
- Present at crucifixion when male disciples fled
- No mention of prostitution anywhere

**The Slander:**
- Pope Gregory I (591 CE): Combined Mary Magdalene with unnamed "sinful woman"
- No biblical basis for this
- Created the "repentant prostitute" story
- Justified excluding women from authority

**The Vatican's "Correction" (1969):**
- Quietly acknowledged Mary wasn't a prostitute
- 1,378 years of slander
- No apology
- No effort to correct public perception

**What Was Suppressed:**
- Gospel of Mary Magdalene
- Shows her as spiritual teacher
- Peter jealous of her closeness to Jesus
- Gnostic Christians revered her

**Gospel of Philip:**
"The companion of the Savior is Mary Magdalene. Christ loved her more than all the disciples and used to kiss her often."

**Why It Matters:**
- Feminine spiritual authority was erased
- Women excluded from priesthood based on false history
- 1,400+ years of lies about a woman Jesus chose first

🔥 **The Pattern:** When women had spiritual authority, the Church invented slander to discredit them.

**📚 Sources:**
- Schaberg, Jane. "The Resurrection of Mary Magdalene" (2002)
- King, Karen. "The Gospel of Mary of Magdala" (2003)
- De Boer, Esther. "Mary Magdalene: Beyond the Myth" (1997)
- Vatican correction (1969)
""",
                    keyPoints: [
                        "First resurrection witness in all four Gospels",
                        "Pope Gregory invented 'prostitute' lie in 591 CE",
                        "Vatican quietly corrected in 1969 - no apology",
                        "Gospel of Mary shows her as key teacher"
                    ]
                )
            ]
        )
    ]
}

// MARK: - Supporting Types

struct VaticanModule: Identifiable {
    let id: String
    let number: Int
    let title: String
    let subtitle: String
    let lessons: [VaticanLesson]
}

struct VaticanLesson: Identifiable {
    let id: String
    let title: String
    let content: String
    let keyPoints: [String]
}
