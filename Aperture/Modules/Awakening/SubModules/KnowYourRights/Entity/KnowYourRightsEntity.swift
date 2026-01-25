// KnowYourRightsEntity.swift
// Know Your Rights Course - Protection for EVERYONE
// Citizens, Green Card Holders, Visa Holders, Undocumented

import SwiftUI

// MARK: - Know Your Rights Course

struct KnowYourRightsCourse {

    static let id = "know_your_rights"
    static let title = "Know Your Rights"
    static let subtitle = "Legal Protection Everyone Must Know"
    static let icon = "shield.lefthalf.filled.badge.checkmark"
    static let color = Color(hex: "#4CAF50")

    static let overview = """
    The system counts on your ignorance. Police, employers, landlords, ICE agents - they often rely on you NOT knowing your rights to take advantage of you.

    This course covers your rights regardless of immigration status. Yes, even undocumented individuals have constitutional protections in the United States.

    Knowledge is power. Knowing your rights can mean the difference between freedom and detention, between justice and abuse.

    WARNING: This is educational information, NOT legal advice. For specific situations, consult an immigration attorney or civil rights lawyer.
    """

    static let disclaimer = """
    ⚠️ DISCLAIMER: This course provides general educational information about rights in the United States. It is NOT legal advice. Laws vary by state and change over time. For specific legal situations, always consult a qualified attorney. If you cannot afford one, contact legal aid organizations in your area.
    """

    static let modules: [RightsModule] = [
        universalRightsModule,
        policeEncountersModule,
        citizenRightsModule,
        greenCardRightsModule,
        visaHolderRightsModule,
        undocumentedRightsModule,
        workplaceRightsModule,
        housingRightsModule,
        iceEncountersModule,
        knowYourResourcesModule
    ]

}

// MARK: - Module Definition

struct RightsModule: Identifiable {

    let id = UUID()
    let number: Int
    let title: String
    let subtitle: String
    let icon: String
    let applicableTo: [ImmigrationStatus]
    let lessons: [RightsLesson]
    let keyRights: [String]

}

struct RightsLesson: Identifiable {

    let id = UUID()
    let title: String
    let content: String
    let scenarios: [RightsScenario]
    let scripts: [String] // What to say in situations
    let warnings: [String]

}

struct RightsScenario: Identifiable {

    let id = UUID()
    let situation: String
    let yourRights: [String]
    let whatToSay: String
    let whatNOTtoDo: [String]

}

enum ImmigrationStatus: String, CaseIterable {
    case citizen = "U.S. Citizen"
    case greenCard = "Green Card Holder"
    case visa = "Visa Holder"
    case undocumented = "Undocumented"
    case all = "Everyone"
}

// MARK: - Module 1: Universal Rights

extension KnowYourRightsCourse {

    static let universalRightsModule = RightsModule(
        number: 1,
        title: "Rights That Protect EVERYONE",
        subtitle: "Constitutional protections regardless of status",
        icon: "person.3.fill",
        applicableTo: [.all],
        lessons: [
            RightsLesson(
                title: "The Constitution Protects Everyone",
                content: """
                Here's what they don't want you to know: The U.S. Constitution protects EVERYONE on U.S. soil, not just citizens.

                The Supreme Court has repeatedly confirmed that constitutional protections apply to all persons within U.S. jurisdiction, regardless of immigration status.

                **Key cases:**
                • Yick Wo v. Hopkins (1886): "The Fourteenth Amendment... is not confined to the protection of citizens."
                • Plyler v. Doe (1982): Undocumented children have the right to public education
                • Zadvydas v. Davis (2001): Due process protects immigrants facing indefinite detention

                **Your Universal Rights:**

                **5th Amendment - Right to Remain Silent**
                You NEVER have to answer questions about your immigration status, where you were born, or how you entered the country. EVER.

                **4th Amendment - Protection from Unreasonable Search**
                Police and ICE cannot search you, your home, or your car without a warrant OR your consent. You can say NO.

                **6th Amendment - Right to an Attorney**
                In criminal proceedings, you have the right to an attorney. (Note: Immigration court is civil, so this right is limited there, but you can still hire one.)

                **14th Amendment - Due Process & Equal Protection**
                The government cannot deprive you of life, liberty, or property without due process of law. This applies to EVERYONE.
                """,
                scenarios: [
                    RightsScenario(
                        situation: "Someone asks about your immigration status",
                        yourRights: [
                            "You have the RIGHT to remain silent",
                            "You do NOT have to answer",
                            "You cannot be punished for staying silent"
                        ],
                        whatToSay: "I choose to remain silent. I do not wish to answer questions without an attorney.",
                        whatNOTtoDo: [
                            "Do NOT lie - lying can create legal problems",
                            "Do NOT provide false documents",
                            "Do NOT make up a story"
                        ]
                    )
                ],
                scripts: [
                    "I am exercising my right to remain silent.",
                    "I do not consent to a search.",
                    "Am I free to go?",
                    "I want to speak to a lawyer."
                ],
                warnings: [
                    "Remaining silent is your RIGHT - use it",
                    "Being silent is NOT an admission of guilt",
                    "Anything you say CAN and WILL be used against you"
                ]
            ),
            RightsLesson(
                title: "The Right to Remain Silent",
                content: """
                The 5th Amendment right to remain silent is your MOST POWERFUL protection. Use it.

                **What This Means:**
                • You do not have to answer questions from police, ICE, FBI, or any government agent
                • You do not have to explain where you're going or coming from
                • You do not have to show documents beyond what's legally required
                • You can end a conversation at any time

                **How to Invoke Your Right:**
                Simply saying nothing is NOT enough in all cases. You should CLEARLY state:

                "I am invoking my Fifth Amendment right to remain silent."

                After this, STOP TALKING. Do not explain, do not justify, do not argue. Just stop.

                **Common Tricks Agents Use:**
                • "If you have nothing to hide, why won't you talk?"
                • "Cooperating will make this easier for you"
                • "I'm just trying to help you"
                • "If you don't answer, I'll assume you're guilty"

                DO NOT FALL FOR THESE. They are trained to get you talking. Your silence cannot legally be held against you.

                **The Golden Rule:**
                If in doubt, SAY NOTHING. You can always talk later with a lawyer. You can NEVER un-say something.
                """,
                scenarios: [
                    RightsScenario(
                        situation: "Police ask 'Where are you coming from?'",
                        yourRights: [
                            "You do NOT have to answer",
                            "This is a fishing question",
                            "Your answer could be used against you"
                        ],
                        whatToSay: "I prefer not to answer questions. Am I free to go?",
                        whatNOTtoDo: [
                            "Do NOT lie about your location",
                            "Do NOT volunteer information",
                            "Do NOT get confrontational"
                        ]
                    )
                ],
                scripts: [
                    "I invoke my Fifth Amendment right to remain silent.",
                    "I will not answer questions without my attorney present.",
                    "Am I being detained or am I free to go?"
                ],
                warnings: [
                    "Your silence CANNOT be used as evidence of guilt",
                    "Police may try to make you uncomfortable - stay calm",
                    "Never consent to 'just a few questions'"
                ]
            )
        ],
        keyRights: [
            "Right to remain silent (5th Amendment)",
            "Right against unreasonable search (4th Amendment)",
            "Right to due process (14th Amendment)",
            "Right to equal protection under the law",
            "Right to an attorney in criminal cases"
        ]
    )

}

// MARK: - Module 2: Police Encounters

extension KnowYourRightsCourse {

    static let policeEncountersModule = RightsModule(
        number: 2,
        title: "Police Encounters",
        subtitle: "What to do when stopped by police",
        icon: "car.side.fill",
        applicableTo: [.all],
        lessons: [
            RightsLesson(
                title: "Types of Police Encounters",
                content: """
                Not all police encounters are the same. Understanding the difference can protect you.

                **1. CONSENSUAL ENCOUNTER**
                Police can approach anyone and ask questions. You are FREE TO LEAVE.
                - You can walk away
                - You don't have to answer
                - You don't have to show ID (in most states)

                Ask: "Am I free to go?" If yes, LEAVE.

                **2. DETENTION (Terry Stop)**
                Police briefly detain you because they have "reasonable suspicion" you're involved in crime.
                - You must stay
                - You still don't have to answer questions
                - They can pat you down for weapons (NOT search)
                - Should be brief

                Ask: "Am I being detained?" and "What is the reason?"

                **3. ARREST**
                Police take you into custody because they have "probable cause."
                - You must comply
                - You MUST remain silent
                - Ask for a lawyer IMMEDIATELY
                - Do not resist - fight it in court

                **TRAFFIC STOPS:**
                - You must show license, registration, insurance
                - You do NOT have to answer questions
                - You do NOT have to consent to a search
                - You CAN record the encounter (in most states)
                """,
                scenarios: [
                    RightsScenario(
                        situation: "Police pull you over for speeding",
                        yourRights: [
                            "Must show license, registration, insurance",
                            "Do NOT have to answer 'where are you going'",
                            "Do NOT have to consent to search",
                            "Can record the encounter"
                        ],
                        whatToSay: "Here is my license and registration. I do not consent to searches. Am I free to go?",
                        whatNOTtoDo: [
                            "Do NOT reach for anything without announcing it",
                            "Do NOT exit the car unless asked",
                            "Do NOT consent to search even if you have nothing to hide"
                        ]
                    ),
                    RightsScenario(
                        situation: "Police ask to search your car",
                        yourRights: [
                            "You can say NO",
                            "They need a warrant OR probable cause",
                            "Your refusal cannot be used against you"
                        ],
                        whatToSay: "I do not consent to any searches. If you have a warrant, please show it to me.",
                        whatNOTtoDo: [
                            "Do NOT physically resist if they search anyway",
                            "Do NOT help them search",
                            "Document everything and fight it in court"
                        ]
                    )
                ],
                scripts: [
                    "Am I being detained or am I free to go?",
                    "I do not consent to any searches.",
                    "I invoke my right to remain silent.",
                    "I want to speak to an attorney.",
                    "I do not consent to this encounter being recorded by you, but I will record for my protection."
                ],
                warnings: [
                    "NEVER physically resist - even if the stop is illegal",
                    "Stay calm - escalation can be dangerous",
                    "Comply with physical commands but NOT questions",
                    "Document everything AFTER the encounter"
                ]
            ),
            RightsLesson(
                title: "Recording the Police",
                content: """
                You have the RIGHT to record police in public. This has been upheld by federal courts.

                **Your Rights:**
                • You can record police performing their duties in public
                • You can record with your phone, camera, or any device
                • You do NOT have to stop recording if asked (in most cases)
                • Police CANNOT delete your recordings or seize your phone without a warrant

                **Best Practices:**
                1. Keep phone at safe distance - don't obstruct
                2. Stay calm, don't argue
                3. Announce you are recording if asked
                4. Backup footage to cloud automatically (if possible)
                5. Do NOT physically resist if they take your phone

                **Apps That Help:**
                • ACLU Mobile Justice (auto-uploads)
                • Cell 411 (alerts contacts)
                • Cop Watch (live streams)

                **What To Say If Challenged:**
                "I am recording for documentation purposes. I am not interfering with your duties. Recording police in public is protected by the First Amendment."

                **If They Try To Take Your Phone:**
                "I do not consent to the seizure of my phone. You need a warrant to search or seize it. I am noting this for my records."

                Then let them take it if they insist - fight it in court, not on the street.
                """,
                scenarios: [
                    RightsScenario(
                        situation: "Police tell you to stop recording",
                        yourRights: [
                            "Recording in public is protected by 1st Amendment",
                            "You do NOT have to stop (if not interfering)",
                            "They cannot seize your phone without warrant"
                        ],
                        whatToSay: "Recording police in public is protected by the First Amendment. I am not interfering with your duties.",
                        whatNOTtoDo: [
                            "Do NOT get close enough to interfere",
                            "Do NOT touch officers or their equipment",
                            "Do NOT physically resist if they take your phone"
                        ]
                    )
                ],
                scripts: [
                    "I am exercising my First Amendment right to record.",
                    "I am not interfering with your duties.",
                    "I do not consent to the seizure of my phone."
                ],
                warnings: [
                    "Recording is legal, but stay safe - back up if ordered",
                    "Don't let recording escalate a dangerous situation",
                    "Cloud backup is essential in case phone is seized"
                ]
            )
        ],
        keyRights: [
            "Right to know if you're free to go",
            "Right to refuse searches without a warrant",
            "Right to remain silent during any police encounter",
            "Right to record police in public",
            "Right to an attorney if arrested"
        ]
    )

}

// MARK: - Module 3: Citizen Rights

extension KnowYourRightsCourse {

    static let citizenRightsModule = RightsModule(
        number: 3,
        title: "U.S. Citizen Rights",
        subtitle: "Your rights as a citizen",
        icon: "flag.fill",
        applicableTo: [.citizen],
        lessons: [
            RightsLesson(
                title: "Rights Unique to Citizens",
                content: """
                As a U.S. citizen (by birth or naturalization), you have additional rights beyond those protected for everyone.

                **Exclusive Citizen Rights:**

                **1. Right to Vote**
                You can vote in federal, state, and local elections. Voting is how we change the system.

                **2. Right to Run for Office**
                You can run for most public offices. President requires natural-born citizenship.

                **3. Right to a U.S. Passport**
                You can obtain a U.S. passport and travel freely.

                **4. Freedom from Deportation**
                A citizen CANNOT be deported. Period. Even if convicted of crimes.
                (Exception: If citizenship was obtained through fraud, it can be revoked)

                **5. Right to Federal Employment**
                Many federal jobs require citizenship.

                **6. Right to Sponsor Family Members**
                You can sponsor certain relatives for green cards.

                **Important:**
                Your citizenship CANNOT be taken away just because you:
                • Commit crimes (you face regular criminal justice)
                • Travel abroad for extended periods
                • Acquire another citizenship (dual citizenship is legal)
                • Criticize the government (First Amendment)

                **If Anyone Questions Your Citizenship:**
                "I am a U.S. citizen. I am not required to prove my citizenship without a warrant. I am invoking my right to remain silent."
                """,
                scenarios: [
                    RightsScenario(
                        situation: "ICE asks about your citizenship status",
                        yourRights: [
                            "You can state 'I am a U.S. citizen'",
                            "You don't have to prove it on the spot",
                            "You cannot be detained solely for not having proof"
                        ],
                        whatToSay: "I am a U.S. citizen. I am not required to carry proof of citizenship. Am I free to go?",
                        whatNOTtoDo: [
                            "Do NOT lie about citizenship",
                            "Do NOT carry fake documents",
                            "Do NOT consent to searches"
                        ]
                    )
                ],
                scripts: [
                    "I am a U.S. citizen.",
                    "I am not required to prove my citizenship without due process.",
                    "Am I being detained? Am I free to go?"
                ],
                warnings: [
                    "Naturalized citizens have the SAME rights as born citizens",
                    "Keep citizenship documents safe but you don't have to carry them",
                    "If wrongly detained, do NOT sign voluntary departure"
                ]
            )
        ],
        keyRights: [
            "Right to vote in all elections",
            "Right to run for public office",
            "Freedom from deportation",
            "Right to a U.S. passport",
            "Right to sponsor family for immigration"
        ]
    )

}

// MARK: - Module 4: Green Card Holder Rights

extension KnowYourRightsCourse {

    static let greenCardRightsModule = RightsModule(
        number: 4,
        title: "Green Card Holder Rights",
        subtitle: "Lawful Permanent Resident protections",
        icon: "creditcard.fill",
        applicableTo: [.greenCard],
        lessons: [
            RightsLesson(
                title: "Your Rights as a Green Card Holder",
                content: """
                As a Lawful Permanent Resident (LPR), you have strong protections, but also some vulnerabilities to be aware of.

                **Your Rights:**

                • Live and work permanently in the U.S.
                • Travel in and out (with some restrictions)
                • Due process in any legal proceedings
                • Same workplace protections as citizens
                • Own property, get driver's license, etc.
                • Apply for citizenship after qualifying period

                **Important Limitations:**

                • You MUST carry your green card (legally required)
                • You CANNOT vote in federal elections
                • You CAN be deported for certain crimes
                • Extended trips abroad can jeopardize status

                **Deportation Risks:**
                Certain crimes can trigger deportation:
                • Aggravated felonies
                • Drug offenses (even marijuana in some cases)
                • Domestic violence
                • Firearms offenses
                • Fraud or theft over certain amounts

                **If you're charged with ANY crime, get an immigration attorney IMMEDIATELY. Public defenders often don't know immigration consequences.**

                **Travel Warnings:**
                • Trips over 6 months can raise abandonment issues
                • Trips over 1 year require re-entry permit
                • Criminal history can cause problems at re-entry
                """,
                scenarios: [
                    RightsScenario(
                        situation: "Asked about status at a checkpoint",
                        yourRights: [
                            "You should carry your green card (it's required)",
                            "You can show it to immigration officers",
                            "You still don't have to answer other questions"
                        ],
                        whatToSay: "Here is my permanent resident card. I choose not to answer additional questions. Am I free to go?",
                        whatNOTtoDo: [
                            "Do NOT travel without your green card",
                            "Do NOT lie about your status",
                            "Do NOT sign anything without reading it"
                        ]
                    )
                ],
                scripts: [
                    "I am a lawful permanent resident. Here is my green card.",
                    "I prefer not to answer additional questions.",
                    "I would like to speak to an attorney before answering."
                ],
                warnings: [
                    "ALWAYS carry your green card when outside the home",
                    "Any criminal charge requires immediate immigration attorney consultation",
                    "Never sign voluntary departure or give up your card"
                ]
            )
        ],
        keyRights: [
            "Right to live and work permanently in U.S.",
            "Right to travel (with green card)",
            "Right to due process before deportation",
            "Right to apply for citizenship",
            "Same workplace rights as citizens"
        ]
    )

}

// MARK: - Module 5: Visa Holder Rights

extension KnowYourRightsCourse {

    static let visaHolderRightsModule = RightsModule(
        number: 5,
        title: "Visa Holder Rights",
        subtitle: "Protections for work, student, and other visa holders",
        icon: "doc.text.fill",
        applicableTo: [.visa],
        lessons: [
            RightsLesson(
                title: "Your Rights on a Visa",
                content: """
                Whether you're on H-1B, F-1, J-1, O-1, or any other visa, you have rights AND responsibilities.

                **Your Rights:**

                • All constitutional protections (4th, 5th, 14th Amendments)
                • Remain silent about anything except visa-related questions to immigration
                • Workplace protections (OSHA, minimum wage, anti-discrimination)
                • Protection from employer retaliation
                • Access to courts and legal system
                • Emergency medical care

                **Your Responsibilities:**

                • Maintain valid visa status
                • Comply with visa conditions (work authorization, school enrollment, etc.)
                • Report address changes within 10 days
                • Depart by visa expiration (or obtain extension/change of status)

                **Common Visa Issues:**

                **H-1B Workers:**
                • Your employer cannot hold your passport
                • You can change employers (with new H-1B petition)
                • If laid off, you typically have 60 days grace period
                • Employer must pay prevailing wage

                **F-1 Students:**
                • Must maintain full-time enrollment
                • Limited work authorization (CPT, OPT)
                • Can transfer schools (with proper process)

                **Visa Overstay Consequences:**
                • Overstay under 180 days: Issues but recoverable
                • 180 days to 1 year: 3-year bar from re-entry
                • Over 1 year: 10-year bar from re-entry
                """,
                scenarios: [
                    RightsScenario(
                        situation: "Employer threatens deportation",
                        yourRights: [
                            "Your employer CANNOT deport you",
                            "You have workplace rights regardless of status",
                            "Retaliation for asserting rights is illegal"
                        ],
                        whatToSay: "I understand I have workplace rights. I will document this conversation. Threats based on immigration status may be illegal retaliation.",
                        whatNOTtoDo: [
                            "Do NOT let employer hold your passport",
                            "Do NOT sign documents you don't understand",
                            "Do NOT work unauthorized jobs"
                        ]
                    )
                ],
                scripts: [
                    "I am here on a valid visa.",
                    "I prefer to consult with an attorney before answering.",
                    "I do not consent to searches."
                ],
                warnings: [
                    "Always keep copies of all immigration documents",
                    "Track visa expiration dates carefully",
                    "Report employer violations to DOL (you're protected)",
                    "Seek legal advice before ANY status changes"
                ]
            )
        ],
        keyRights: [
            "All constitutional protections apply to you",
            "Workplace protections regardless of employer threats",
            "Right to change employers (with proper process)",
            "Right to remain silent on non-visa matters",
            "Access to courts and legal system"
        ]
    )

}

// MARK: - Module 6: Undocumented Rights

extension KnowYourRightsCourse {

    static let undocumentedRightsModule = RightsModule(
        number: 6,
        title: "Undocumented Rights",
        subtitle: "Yes, you still have constitutional rights",
        icon: "person.fill.questionmark",
        applicableTo: [.undocumented],
        lessons: [
            RightsLesson(
                title: "Your Rights Are REAL",
                content: """
                This is critical: Being undocumented does NOT mean you have no rights. The Constitution protects EVERYONE on U.S. soil.

                **Your Constitutional Rights:**

                **5th Amendment - MOST IMPORTANT**
                You have the absolute right to remain silent. You do NOT have to answer questions about:
                • Where you were born
                • How you entered the country
                • Your immigration status
                • Where you live or work

                SAY NOTHING. Ask for a lawyer.

                **4th Amendment**
                ICE, police, and anyone else cannot search you or your home without:
                • A warrant signed by a JUDGE (not just ICE)
                • OR your consent (NEVER GIVE IT)

                **14th Amendment**
                You have the right to due process. You cannot be detained indefinitely without a hearing.

                **Additional Rights:**
                • Your children have the right to public education (Plyler v. Doe)
                • You have the right to emergency medical care
                • You can file police reports and use courts
                • You have workplace protections (though enforcement is complex)
                • You can file taxes (many do with ITINs)

                **NEVER:**
                • Sign voluntary departure
                • Give false documents
                • Claim to be a citizen if you're not
                • Open the door without a judicial warrant
                """,
                scenarios: [
                    RightsScenario(
                        situation: "ICE comes to your door",
                        yourRights: [
                            "You do NOT have to open the door",
                            "They need a JUDICIAL warrant to enter",
                            "ICE warrants (Form I-200) are NOT judicial warrants",
                            "You can remain silent through the closed door"
                        ],
                        whatToSay: "I do not consent to entry. Please slide any warrant under the door. I will not open the door without a warrant signed by a judge.",
                        whatNOTtoDo: [
                            "Do NOT open the door",
                            "Do NOT answer questions through the door",
                            "Do NOT reach outside or step outside",
                            "Do NOT run - it can be used against you"
                        ]
                    ),
                    RightsScenario(
                        situation: "Stopped on the street by ICE",
                        yourRights: [
                            "You have the right to remain silent",
                            "You do not have to answer questions",
                            "Ask if you are free to go"
                        ],
                        whatToSay: "I am exercising my right to remain silent. I do not consent to searches. Am I free to go? If I am being detained, I wish to speak to a lawyer.",
                        whatNOTtoDo: [
                            "Do NOT run",
                            "Do NOT lie about status",
                            "Do NOT provide false documents",
                            "Do NOT sign anything"
                        ]
                    )
                ],
                scripts: [
                    "I am invoking my 5th Amendment right to remain silent.",
                    "I do not consent to any searches.",
                    "I do not consent to entry into my home.",
                    "Please show me a warrant signed by a judge.",
                    "I wish to speak to an attorney.",
                    "I do not wish to sign any documents."
                ],
                warnings: [
                    "NEVER sign voluntary departure - you lose rights to hearings",
                    "NEVER claim to be a citizen if you're not - it's a crime",
                    "NEVER provide false documents",
                    "ALWAYS memorize emergency legal contact numbers"
                ]
            ),
            RightsLesson(
                title: "Preparing for ICE Encounters",
                content: """
                Preparation can make all the difference. Here's how to be ready.

                **Create a Family Safety Plan:**

                1. **Emergency Contacts**
                   - Immigration lawyer's number (memorized)
                   - Family member or trusted friend
                   - Know Your Rights hotline in your area

                2. **Documents to Keep Ready**
                   - Copy of any immigration applications
                   - Evidence of time in U.S. (bills, leases, etc.)
                   - Medical records
                   - Children's birth certificates (if U.S. born)
                   - Power of attorney for children

                3. **If You Have Children**
                   - Designate a caretaker in writing
                   - Create guardianship documents
                   - Inform schools of emergency contacts
                   - Children should know NOT to open doors

                4. **At Your Door**
                   Keep a "Red Card" (available from immigrant rights orgs) visible that states your rights.

                5. **Know Your ICE Office Number**
                   If detained, family can call to locate you.

                **If Detained:**
                - Give your name
                - Say "I wish to remain silent"
                - Say "I want to speak to a lawyer"
                - Do NOT sign anything (especially stipulated removal)
                - You may have the right to a bond hearing

                **Important Numbers to Memorize:**
                - ICE Detainee Locator: 1-888-351-4024
                - Immigration Rights Hotlines vary by city
                """,
                scenarios: [],
                scripts: [
                    "I am invoking my right to remain silent.",
                    "I do not wish to sign any documents.",
                    "I want to speak to a lawyer.",
                    "I do not consent to deportation.",
                    "I want a hearing before an immigration judge."
                ],
                warnings: [
                    "Have a plan BEFORE you need it",
                    "Memorize key phone numbers",
                    "Never sign voluntary departure",
                    "Your children's safety plan is essential"
                ]
            )
        ],
        keyRights: [
            "Right to remain silent about immigration status",
            "Right to refuse entry without a judicial warrant",
            "Right to refuse searches",
            "Right to a hearing before an immigration judge",
            "Right to an attorney (though you may have to pay)",
            "Your children's right to education"
        ]
    )

}

// MARK: - Module 7: Workplace Rights

extension KnowYourRightsCourse {

    static let workplaceRightsModule = RightsModule(
        number: 7,
        title: "Workplace Rights",
        subtitle: "Your rights at work regardless of status",
        icon: "briefcase.fill",
        applicableTo: [.all],
        lessons: [
            RightsLesson(
                title: "Rights All Workers Have",
                content: """
                Regardless of immigration status, you have workplace rights. Period.

                **All Workers Are Protected By:**

                **Minimum Wage Laws**
                You must be paid at least minimum wage ($7.25 federal, often higher by state).

                **Overtime**
                Non-exempt workers must receive 1.5x pay for hours over 40/week.

                **Safe Workplace (OSHA)**
                Your employer must provide a safe workplace. You can report hazards.

                **Anti-Discrimination**
                You cannot be discriminated against based on race, religion, sex, national origin, disability, or age.

                **Anti-Retaliation**
                Your employer CANNOT retaliate against you for:
                - Reporting wage theft
                - Filing OSHA complaints
                - Reporting discrimination
                - Refusing unsafe work
                - Using immigration status as a threat is ILLEGAL

                **Wage Theft:**
                If your employer doesn't pay you, you can file a complaint with your state labor board. They cannot ask about immigration status for wage claims.

                **Workplace ICE Raids:**
                - Employers must be notified of "I-9 audits"
                - You have the right to remain silent
                - You can leave non-public work areas
                - Know your workplace rights before a raid happens
                """,
                scenarios: [
                    RightsScenario(
                        situation: "Employer threatens to call ICE",
                        yourRights: [
                            "Using immigration threats is ILLEGAL retaliation",
                            "You can file a complaint with NLRB or state agency",
                            "Document the threat (date, time, witnesses)"
                        ],
                        whatToSay: "I am documenting this conversation. Threatening workers with immigration enforcement may be illegal retaliation.",
                        whatNOTtoDo: [
                            "Do NOT quit in fear",
                            "Do NOT sign anything",
                            "Do NOT admit immigration status"
                        ]
                    )
                ],
                scripts: [
                    "I have the right to be paid for my work.",
                    "I am documenting this for my records.",
                    "I believe this may be illegal retaliation."
                ],
                warnings: [
                    "Document EVERYTHING - dates, times, witnesses",
                    "Immigration-based threats are illegal retaliation",
                    "File wage claims - status often cannot be asked"
                ]
            )
        ],
        keyRights: [
            "Right to minimum wage regardless of status",
            "Right to safe workplace",
            "Right against discrimination",
            "Right against immigration-based retaliation",
            "Right to file wage claims"
        ]
    )

}

// MARK: - Module 8: Housing Rights

extension KnowYourRightsCourse {

    static let housingRightsModule = RightsModule(
        number: 8,
        title: "Housing Rights",
        subtitle: "Your rights as a tenant",
        icon: "house.fill",
        applicableTo: [.all],
        lessons: [
            RightsLesson(
                title: "Tenant Rights Regardless of Status",
                content: """
                Your immigration status does NOT affect your tenant rights.

                **Your Rights as a Tenant:**

                **Fair Housing**
                Landlords cannot discriminate based on:
                - Race, color, national origin
                - Religion
                - Sex, familial status
                - Disability

                **Habitability**
                Your landlord must provide:
                - Working plumbing, electricity, heat
                - Safe, structurally sound building
                - Pest-free conditions
                - Working smoke detectors

                **Privacy**
                Landlords must give notice before entering (usually 24-48 hours, varies by state).

                **Eviction Protections**
                You CANNOT be evicted without legal process. "Self-help" evictions are illegal:
                - Changing locks
                - Shutting off utilities
                - Removing belongings
                - Harassment to force you out

                **If Your Landlord Threatens ICE:**
                This is housing discrimination and potentially illegal retaliation. Document and report to:
                - Local fair housing agency
                - HUD (federal)
                - Local tenant rights organizations

                **Eviction Court:**
                You have the right to appear in eviction court. Your immigration status is generally NOT relevant to housing cases.
                """,
                scenarios: [
                    RightsScenario(
                        situation: "Landlord threatens to report you to ICE",
                        yourRights: [
                            "This is likely illegal housing discrimination",
                            "Document the threat",
                            "File a fair housing complaint"
                        ],
                        whatToSay: "I am documenting this threat. Using immigration status to intimidate tenants may violate fair housing laws.",
                        whatNOTtoDo: [
                            "Do NOT move out in fear",
                            "Do NOT skip rent payments (it gives them legal grounds)",
                            "Do NOT reveal your status"
                        ]
                    )
                ],
                scripts: [
                    "I have tenant rights regardless of immigration status.",
                    "This may be illegal housing discrimination.",
                    "I am documenting this for a potential fair housing complaint."
                ],
                warnings: [
                    "Immigration-based threats are likely housing discrimination",
                    "Always document threats in writing",
                    "Continue paying rent to maintain your legal standing"
                ]
            )
        ],
        keyRights: [
            "Right to habitable housing",
            "Right against discrimination",
            "Right to legal eviction process",
            "Right to privacy in your home",
            "Right against immigration-based retaliation"
        ]
    )

}

// MARK: - Module 9: ICE Encounters

extension KnowYourRightsCourse {

    static let iceEncountersModule = RightsModule(
        number: 9,
        title: "ICE Encounters",
        subtitle: "Specific guidance for immigration enforcement",
        icon: "exclamationmark.shield.fill",
        applicableTo: [.all],
        lessons: [
            RightsLesson(
                title: "Types of ICE Warrants",
                content: """
                NOT ALL WARRANTS ARE THE SAME. This distinction could determine your fate.

                **JUDICIAL WARRANT (Valid)**
                - Signed by a JUDGE
                - Has court letterhead
                - Allows entry into your home
                - Must comply

                **ICE ADMINISTRATIVE WARRANT (NOT a judicial warrant)**
                - Form I-200 (Warrant for Arrest of Alien)
                - Form I-205 (Warrant of Removal/Deportation)
                - Signed by an ICE OFFICER, not a judge
                - Does NOT authorize entry into your home
                - You do NOT have to open your door

                **How to Tell the Difference:**
                A judicial warrant will:
                - Have a court name at the top
                - Be signed by a judge or magistrate
                - Have "United States District Court" or similar

                An ICE warrant will:
                - Say "Department of Homeland Security"
                - Be signed by an ICE officer
                - Have form numbers like I-200

                **What To Do:**
                1. Do NOT open the door
                2. Ask them to slide the warrant under the door
                3. Look for judge's signature and court name
                4. If it's just an ICE warrant, you do NOT have to open

                Say: "This is not a judicial warrant. I do not consent to entry."
                """,
                scenarios: [
                    RightsScenario(
                        situation: "ICE at your door with a warrant",
                        yourRights: [
                            "Ask them to show the warrant",
                            "Look for judge's signature",
                            "ICE warrants do NOT authorize home entry",
                            "You can remain inside and silent"
                        ],
                        whatToSay: "Please slide the warrant under the door. I will not open unless this is a warrant signed by a judge.",
                        whatNOTtoDo: [
                            "Do NOT open the door",
                            "Do NOT reach outside",
                            "Do NOT answer questions"
                        ]
                    )
                ],
                scripts: [
                    "Please slide the warrant under the door.",
                    "This is not a judicial warrant. I do not consent to entry.",
                    "I am invoking my right to remain silent."
                ],
                warnings: [
                    "ICE administrative warrants do NOT authorize home entry",
                    "Only a JUDICIAL warrant (signed by judge) requires you to open",
                    "Memorize the difference - it could save you"
                ]
            )
        ],
        keyRights: [
            "Right to see the warrant before opening",
            "Right to refuse entry with only ICE warrants",
            "Right to remain silent",
            "Right to not sign anything",
            "Right to request attorney"
        ]
    )

}

// MARK: - Module 10: Resources

extension KnowYourRightsCourse {

    static let knowYourResourcesModule = RightsModule(
        number: 10,
        title: "Know Your Resources",
        subtitle: "Organizations that can help",
        icon: "phone.fill",
        applicableTo: [.all],
        lessons: [
            RightsLesson(
                title: "Legal and Support Resources",
                content: """
                You don't have to face this alone. These organizations can help.

                **National Resources:**

                **ACLU (American Civil Liberties Union)**
                - Know Your Rights resources
                - Legal support for civil liberties violations
                - www.aclu.org

                **National Immigration Law Center (NILC)**
                - Immigration legal information
                - Policy advocacy
                - www.nilc.org

                **United We Dream**
                - Largest immigrant youth-led network
                - Know Your Rights training
                - www.unitedwedream.org

                **Immigration Advocates Network**
                - Legal services directory by location
                - www.immigrationadvocates.org

                **RAICES**
                - Free legal services for immigrants
                - Bond fund assistance
                - www.raicestexas.org

                **Hotlines:**
                - ICE Detainee Locator: 1-888-351-4024
                - ACLU National: Contact through website
                - Many cities have local rapid response hotlines

                **If Detained:**
                - You have the right to make phone calls
                - Contact family AND an attorney
                - Do not sign anything without legal advice
                - Request a bond hearing

                **Free Legal Help:**
                Many areas have free legal clinics for immigration matters. Search for "immigration legal aid [your city]"
                """,
                scenarios: [],
                scripts: [
                    "I need to speak to an attorney.",
                    "I want to make my phone call.",
                    "Please contact [organization] on my behalf."
                ],
                warnings: [
                    "Memorize at least ONE phone number",
                    "Have backup contacts outside your household",
                    "Know your local rapid response network"
                ]
            )
        ],
        keyRights: [
            "Right to contact an attorney",
            "Right to make phone calls if detained",
            "Right to contact consulate (for foreign nationals)",
            "Access to legal aid resources"
        ]
    )

}
