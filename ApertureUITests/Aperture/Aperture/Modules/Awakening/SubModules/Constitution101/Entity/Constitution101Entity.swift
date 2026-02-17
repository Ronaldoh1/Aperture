// Constitution101Entity.swift
// Constitution 101 - What They Didn't Teach You In School
// The document that defines and LIMITS government power

import SwiftUI

// MARK: - Constitution 101 Course

enum Constitution101Course {
  static let id = "constitution_101"
  static let title = "Constitution 101"
  static let subtitle = "The Document They Don't Want You to Understand"
  static let icon = "scroll.fill"
  static let color = Color(hex: "#1565C0")

  static let overview = """
    The Constitution isn't just a piece of paper in a museum. It's the supreme law that LIMITS government power and protects YOUR rights.

    Most schools teach you to memorize dates and names. They don't teach you HOW to use these rights to defend yourself.

    This course covers:
    • What the Constitution actually says (in plain English)
    • The Bill of Rights - your 10 essential protections
    • How to invoke your rights in real situations
    • What the government CANNOT do to you
    • How courts have interpreted these rights

    An armed populace isn't just about guns - it's about being armed with KNOWLEDGE.
    """

  static let modules: [ConstitutionModule] = [
    foundationsModule,
    firstAmendmentModule,
    secondAmendmentModule,
    fourthAmendmentModule,
    fifthAmendmentModule,
    sixthAmendmentModule,
    otherAmendmentsModule,
    fourteenthAmendmentModule,
    usingYourRightsModule,
  ]
}

// MARK: - Module Definition

struct ConstitutionModule: Identifiable {
  let id = UUID()
  let number: Int
  let title: String
  let subtitle: String
  let icon: String
  let lessons: [ConstitutionLesson]
  let keyPoints: [String]
}

struct ConstitutionLesson: Identifiable {
  let id = UUID()
  let title: String
  let originalText: String?
  let plainEnglish: String
  let realWorldApplication: String
  let keyCases: [ConstitutionCase]
}

struct ConstitutionCase: Identifiable {
  let id = UUID()
  let name: String
  let year: String
  let summary: String
  let impact: String
}

// MARK: - Module 1: Foundations

extension Constitution101Course {
  static let foundationsModule = ConstitutionModule(
    number: 1,
    title: "Constitutional Foundations",
    subtitle: "Why this document matters",
    icon: "building.columns.fill",
    lessons: [
      ConstitutionLesson(
        title: "Why the Constitution Exists",
        originalText:
          "We the People of the United States, in Order to form a more perfect Union, establish Justice, insure domestic Tranquility, provide for the common defence, promote the general Welfare, and secure the Blessings of Liberty to ourselves and our Posterity, do ordain and establish this Constitution for the United States of America.",
        plainEnglish: """
          The Constitution exists because the Founders had just escaped tyranny and wanted to PREVENT it from happening again.

          Key concept: The Constitution doesn't GIVE you rights. You are born with natural rights. The Constitution PROTECTS those rights from government interference.

          Think of it as a LEASH on government, not a gift to citizens.

          **The Structure:**
          • Articles I-III: Create the three branches (Legislative, Executive, Judicial)
          • Articles IV-VII: How states interact, amendments, supremacy clause
          • Bill of Rights (Amendments 1-10): Explicit protections for individuals
          • Later Amendments: Expanded rights and clarifications

          **Key Principle: Enumerated Powers**
          The federal government can ONLY do what the Constitution explicitly allows. Everything else is reserved to states or the people (10th Amendment).

          If someone in government says "the Constitution doesn't say we CAN'T do this" - they have it backwards. The Constitution must say they CAN.
          """,
        realWorldApplication: """
          When the government tries to expand its power, ask: "Where in the Constitution does it authorize this?"

          Example: Federal drug laws are constitutionally questionable. The government had to pass an AMENDMENT (18th) to ban alcohol, but claims drug prohibition needs no amendment. The inconsistency reveals how constitutional limits have eroded.
          """,
        keyCases: [
          ConstitutionCase(
            name: "Marbury v. Madison",
            year: "1803",
            summary: "Established judicial review - courts can strike down unconstitutional laws",
            impact: "Courts are the final interpreters of what the Constitution means"
          )
        ]
      ),
      ConstitutionLesson(
        title: "The Bill of Rights Overview",
        originalText: nil,
        plainEnglish: """
          The Bill of Rights (first 10 amendments) was demanded by Anti-Federalists who didn't trust a strong central government. They were RIGHT to be suspicious.

          **Quick Overview:**

          **1st Amendment** - Speech, Religion, Press, Assembly, Petition
          **2nd Amendment** - Keep and bear arms
          **3rd Amendment** - No quartering soldiers
          **4th Amendment** - No unreasonable searches
          **5th Amendment** - Due process, self-incrimination, double jeopardy
          **6th Amendment** - Speedy trial, attorney, confront witnesses
          **7th Amendment** - Jury trial in civil cases
          **8th Amendment** - No cruel/unusual punishment, excessive bail
          **9th Amendment** - Rights not listed still exist
          **10th Amendment** - Powers not given to feds stay with states/people

          **The 9th Amendment is crucial but forgotten:**
          "The enumeration in the Constitution, of certain rights, shall not be construed to deny or disparage others retained by the people."

          Translation: Just because a right isn't listed doesn't mean you don't have it. The government cannot say "it's not in the Bill of Rights, so you don't have that right."
          """,
        realWorldApplication: """
          The 9th Amendment supports privacy rights, bodily autonomy, and many other "unenumerated" rights. When someone says "there's no right to privacy in the Constitution," point to the 9th Amendment.
          """,
        keyCases: [
          ConstitutionCase(
            name: "Griswold v. Connecticut",
            year: "1965",
            summary: "Found right to privacy in the Constitution",
            impact: "Recognized rights exist beyond those explicitly listed"
          )
        ]
      ),
    ],
    keyPoints: [
      "The Constitution LIMITS government, not citizens",
      "You are born with rights; the Constitution protects them",
      "Federal government has only enumerated powers",
      "The 9th Amendment protects unlisted rights",
    ]
  )
}

// MARK: - Module 2: First Amendment

extension Constitution101Course {
  static let firstAmendmentModule = ConstitutionModule(
    number: 2,
    title: "First Amendment",
    subtitle: "Freedom of Speech, Religion, Press, Assembly",
    icon: "megaphone.fill",
    lessons: [
      ConstitutionLesson(
        title: "Freedom of Speech",
        originalText:
          "Congress shall make no law... abridging the freedom of speech, or of the press...",
        plainEnglish: """
          The government cannot punish you for what you say (with limited exceptions).

          **What's Protected:**
          • Political speech (the MOST protected)
          • Criticism of the government
          • Offensive or unpopular opinions
          • Symbolic speech (flag burning, protests)
          • Anonymous speech
          • Commercial speech (with some limits)

          **What's NOT Protected:**
          • True threats of violence
          • Incitement to imminent lawless action
          • Defamation (false statements of fact that damage reputation)
          • Fraud
          • Obscenity (narrowly defined)
          • Child pornography

          **Key: The 1st Amendment only restricts GOVERNMENT**
          Private companies (Twitter, Facebook) are NOT bound by the 1st Amendment. They can censor whatever they want. Your recourse is to not use their platform.

          However, if the government COMPELS or COERCES private censorship, that may be unconstitutional.
          """,
        realWorldApplication: """
          You can criticize the President, burn a flag, say racist things, protest at a politician's house - the GOVERNMENT cannot punish you.

          But your employer can fire you, platforms can ban you, and people can shun you. The 1st Amendment doesn't protect you from social consequences.
          """,
        keyCases: [
          ConstitutionCase(
            name: "Brandenburg v. Ohio",
            year: "1969",
            summary: "Speech can only be banned if it incites IMMINENT lawless action",
            impact: "Very high bar for restricting speech"
          ),
          ConstitutionCase(
            name: "Texas v. Johnson",
            year: "1989",
            summary: "Flag burning is protected symbolic speech",
            impact: "Even deeply offensive speech is protected"
          ),
        ]
      ),
      ConstitutionLesson(
        title: "Freedom of Religion",
        originalText:
          "Congress shall make no law respecting an establishment of religion, or prohibiting the free exercise thereof...",
        plainEnglish: """
          Two separate protections:

          **1. Establishment Clause**
          Government cannot establish an official religion or favor one religion over others.

          **2. Free Exercise Clause**
          Government cannot prevent you from practicing your religion.

          **What This Means:**
          • No state-sponsored prayer in public schools
          • Government cannot require religious oaths
          • You can practice any religion (or none)
          • Religious organizations get tax exemptions
          • Government generally cannot burden religious practice without compelling reason

          **Where It Gets Complicated:**
          • "In God We Trust" on money
          • Christmas as federal holiday
          • Ten Commandments on government property
          • Religious exemptions from general laws

          Courts use various tests to evaluate these cases, but the general principle is: government must stay neutral toward religion.
          """,
        realWorldApplication: """
          • A teacher cannot lead prayer in a public school
          • A student CAN pray on their own
          • Employers must reasonably accommodate religious practices
          • Religious groups can discriminate in employment under some circumstances
          """,
        keyCases: [
          ConstitutionCase(
            name: "Engel v. Vitale",
            year: "1962",
            summary: "School-sponsored prayer unconstitutional",
            impact: "Government cannot promote religion in schools"
          )
        ]
      ),
      ConstitutionLesson(
        title: "Freedom of Assembly & Petition",
        originalText:
          "...the right of the people peaceably to assemble, and to petition the Government for a redress of grievances.",
        plainEnglish: """
          You have the right to:
          • Gather with others
          • Protest
          • March
          • Petition the government

          **Limits:**
          • Must be "peaceable" - no violence
          • Government can impose reasonable TIME, PLACE, MANNER restrictions
          • Cannot block traffic indefinitely
          • Permits can be required for large gatherings

          **What Government CANNOT Do:**
          • Ban protests based on their MESSAGE
          • Require permits in a way that discriminates by viewpoint
          • Use excessive force against peaceful protesters
          • Arrest people for simply being present at a protest

          **Your Rights at Protests:**
          • You can photograph/record anything in public
          • Police cannot seize your phone without warrant
          • You can refuse to identify yourself (in most states, unless detained)
          • You can leave at any time (unless detained)
          """,
        realWorldApplication: """
          If police give a "dispersal order," you should leave to avoid arrest. But the order must be lawful - you can challenge it later.

          Document everything. Note badge numbers. Record from a safe distance.
          """,
        keyCases: [
          ConstitutionCase(
            name: "NAACP v. Alabama",
            year: "1958",
            summary: "Freedom of association is protected",
            impact: "Government cannot force disclosure of membership lists"
          )
        ]
      ),
    ],
    keyPoints: [
      "Government cannot restrict speech based on viewpoint",
      "Only applies to GOVERNMENT action, not private entities",
      "Government cannot establish religion or prevent practice",
      "Peaceful assembly is protected, violence is not",
    ]
  )
}

// MARK: - Module 3: Second Amendment

extension Constitution101Course {
  static let secondAmendmentModule = ConstitutionModule(
    number: 3,
    title: "Second Amendment",
    subtitle: "Right to Keep and Bear Arms",
    icon: "shield.fill",
    lessons: [
      ConstitutionLesson(
        title: "The Right to Bear Arms",
        originalText:
          "A well regulated Militia, being necessary to the security of a free State, the right of the people to keep and bear Arms, shall not be infringed.",
        plainEnglish: """
          This is one of the most debated amendments. Here's what the Supreme Court has said:

          **DC v. Heller (2008)** - Landmark ruling:
          • The 2nd Amendment protects an INDIVIDUAL right to own firearms
          • Not dependent on militia service
          • Includes right to self-defense in the home
          • Can be subject to some regulations

          **McDonald v. Chicago (2010)**:
          • Applies 2nd Amendment to states (not just federal government)

          **What's Protected:**
          • Owning firearms for self-defense
          • Keeping firearms in your home
          • "Arms" in common use for lawful purposes

          **What's NOT Unlimited:**
          • Felons can be prohibited
          • Mental illness restrictions
          • Some restrictions on types of weapons
          • Carrying in sensitive places
          • Commercial sale regulations

          **Historical Context:**
          The Founders had just fought a revolution against tyranny. The 2nd Amendment was partly about ensuring citizens could resist government tyranny - not just hunt or protect against criminals.
          """,
        realWorldApplication: """
          Laws vary significantly by state. In some states you can open carry without a permit. In others, even owning certain firearms is restricted.

          Know YOUR state's laws. Federal law sets a floor, but states can (in some ways) restrict further.
          """,
        keyCases: [
          ConstitutionCase(
            name: "DC v. Heller",
            year: "2008",
            summary: "Individual right to own firearms for self-defense",
            impact: "Settled that 2nd Amendment is individual right, not just militia-related"
          ),
          ConstitutionCase(
            name: "New York State Rifle & Pistol Association v. Bruen",
            year: "2022",
            summary: "Right to carry firearms outside the home for self-defense",
            impact: "Struck down may-issue permit schemes"
          ),
        ]
      )
    ],
    keyPoints: [
      "Individual right to own firearms for self-defense",
      "Applies to states via 14th Amendment",
      "Not unlimited - some regulations permitted",
      "Know your state's specific laws",
    ]
  )
}

// MARK: - Module 4: Fourth Amendment

extension Constitution101Course {
  static let fourthAmendmentModule = ConstitutionModule(
    number: 4,
    title: "Fourth Amendment",
    subtitle: "Protection from Unreasonable Searches",
    icon: "lock.shield.fill",
    lessons: [
      ConstitutionLesson(
        title: "Your Right to Privacy",
        originalText:
          "The right of the people to be secure in their persons, houses, papers, and effects, against unreasonable searches and seizures, shall not be violated, and no Warrants shall issue, but upon probable cause, supported by Oath or affirmation, and particularly describing the place to be searched, and the persons or things to be seized.",
        plainEnglish: """
          The government cannot search you or your stuff without:
          • A warrant based on probable cause, OR
          • Your consent, OR
          • A recognized exception

          **What's Protected:**
          • Your home (highest protection)
          • Your person
          • Your papers and documents
          • Your "effects" (belongings)
          • Your car (less protection than home)
          • Your phone (requires warrant)

          **Warrant Requirements:**
          • Must be issued by neutral judge
          • Based on probable cause
          • Must specify what to search and what to seize
          • Cannot be a "general warrant"

          **Recognized Exceptions:**
          • Consent (NEVER give it)
          • Plain view (officer sees evidence in plain sight)
          • Search incident to arrest
          • Exigent circumstances (emergency)
          • Automobile exception (lower standard)
          • Stop and frisk (pat down for weapons)

          **The Exclusionary Rule:**
          Evidence obtained in violation of the 4th Amendment generally cannot be used in court. This is why police want your CONSENT.
          """,
        realWorldApplication: """
          NEVER consent to a search. Say: "I do not consent to any searches."

          If they search anyway, don't resist physically - but your lawyer can argue the evidence should be thrown out.

          For your phone: Police need a warrant to search it, even if you're arrested.
          """,
        keyCases: [
          ConstitutionCase(
            name: "Riley v. California",
            year: "2014",
            summary: "Police need a warrant to search cell phones",
            impact: "Digital privacy protected even during arrest"
          ),
          ConstitutionCase(
            name: "Carpenter v. United States",
            year: "2018",
            summary: "Warrant required for cell phone location data",
            impact: "Digital data has 4th Amendment protection"
          ),
        ]
      )
    ],
    keyPoints: [
      "NEVER consent to searches",
      "Warrants require probable cause and specificity",
      "Your home has the highest protection",
      "Your phone requires a warrant to search",
    ]
  )
}

// MARK: - Module 5: Fifth Amendment

extension Constitution101Course {
  static let fifthAmendmentModule = ConstitutionModule(
    number: 5,
    title: "Fifth Amendment",
    subtitle: "Right to Silence and Due Process",
    icon: "hand.raised.fill",
    lessons: [
      ConstitutionLesson(
        title: "Your Right to Remain Silent",
        originalText:
          "No person... shall be compelled in any criminal case to be a witness against himself, nor be deprived of life, liberty, or property, without due process of law...",
        plainEnglish: """
          The 5th Amendment contains multiple protections:

          **1. Self-Incrimination Protection**
          You CANNOT be forced to testify against yourself. This is the "right to remain silent."

          **2. Due Process**
          Government cannot take your life, liberty, or property without proper legal procedures.

          **3. Double Jeopardy**
          You cannot be tried twice for the same crime (with exceptions).

          **4. Grand Jury Requirement**
          For serious federal crimes, a grand jury must indict you.

          **5. Takings Clause**
          Government must pay fair compensation if it takes your property.

          **How to Invoke:**
          Simply staying silent may NOT be enough. You should clearly state:

          "I invoke my Fifth Amendment right to remain silent."

          Then STOP TALKING. Don't explain. Don't justify. Say NOTHING.

          **Miranda Rights:**
          When in custody, police must inform you of your rights before questioning. But you don't have to wait for Miranda - you can invoke your rights ANY time.
          """,
        realWorldApplication: """
          The 5th Amendment applies to TESTIMONIAL evidence - things you SAY. It doesn't protect:
          • Your fingerprints
          • DNA samples
          • Standing in a lineup
          • Providing handwriting samples

          But it DOES protect:
          • Your words
          • Your passwords (in most circuits)
          • Your PIN codes (debated)
          """,
        keyCases: [
          ConstitutionCase(
            name: "Miranda v. Arizona",
            year: "1966",
            summary: "Police must inform suspects of rights before interrogation",
            impact: "Created the famous 'Miranda warnings'"
          )
        ]
      )
    ],
    keyPoints: [
      "You NEVER have to answer questions",
      "Invoke your rights CLEARLY and verbally",
      "Due process means fair procedures",
      "Cannot be tried twice for same crime",
    ]
  )
}

// MARK: - Module 6: Sixth Amendment

extension Constitution101Course {
  static let sixthAmendmentModule = ConstitutionModule(
    number: 6,
    title: "Sixth Amendment",
    subtitle: "Rights in Criminal Proceedings",
    icon: "figure.stand.line.dotted.figure.stand",
    lessons: [
      ConstitutionLesson(
        title: "Your Rights If Accused",
        originalText:
          "In all criminal prosecutions, the accused shall enjoy the right to a speedy and public trial, by an impartial jury...; to be informed of the nature and cause of the accusation; to be confronted with the witnesses against him; to have compulsory process for obtaining witnesses in his favor, and to have the Assistance of Counsel for his defence.",
        plainEnglish: """
          If you're criminally accused, you have:

          **1. Speedy Trial**
          Cannot be held indefinitely without trial.

          **2. Public Trial**
          Trials are open to the public (with exceptions).

          **3. Impartial Jury**
          Jury of your peers, not stacked against you.

          **4. Notice of Charges**
          Must be told what you're accused of.

          **5. Confrontation**
          Right to face and cross-examine witnesses.

          **6. Compulsory Process**
          Can force witnesses to testify for you.

          **7. Right to Counsel**
          Right to a lawyer - and if you can't afford one, one must be provided (Gideon v. Wainwright).

          **Critical Point:**
          The right to counsel is for CRIMINAL cases. Immigration proceedings are civil, so no automatic right to a free attorney there.

          **When Counsel Attaches:**
          At "critical stages" - arraignment, interrogation (after charging), trial.

          ALWAYS ask for a lawyer. Say: "I want an attorney. I will not answer questions without my attorney present."
          """,
        realWorldApplication: """
          If arrested:
          1. "I invoke my right to remain silent"
          2. "I want an attorney"
          3. STOP TALKING

          Police may continue asking questions - do not answer. Wait for your lawyer.
          """,
        keyCases: [
          ConstitutionCase(
            name: "Gideon v. Wainwright",
            year: "1963",
            summary: "Right to free attorney if you cannot afford one",
            impact: "Created the public defender system"
          )
        ]
      )
    ],
    keyPoints: [
      "Right to speedy trial",
      "Right to face your accusers",
      "Right to a lawyer - provided free if needed",
      "Ask for a lawyer IMMEDIATELY if arrested",
    ]
  )
}

// MARK: - Module 7: Other Key Amendments

extension Constitution101Course {
  static let otherAmendmentsModule = ConstitutionModule(
    number: 7,
    title: "Other Key Amendments",
    subtitle: "3rd, 7th, 8th, 9th, 10th",
    icon: "list.bullet.rectangle",
    lessons: [
      ConstitutionLesson(
        title: "The Rest of the Bill of Rights",
        originalText: nil,
        plainEnglish: """
          **3rd Amendment - No Quartering Soldiers**
          Government cannot force you to house soldiers. Rarely invoked but establishes privacy principle.

          **7th Amendment - Civil Jury Trial**
          Right to jury trial in civil cases over $20. Ensures juries, not just judges, decide disputes.

          **8th Amendment - No Cruel & Unusual Punishment**
          • No excessive bail
          • No excessive fines
          • No cruel and unusual punishment

          What's "cruel and unusual" evolves. Death penalty for minors: unconstitutional. Life without parole for non-violent crimes: debated.

          **9th Amendment - Unenumerated Rights**
          Rights not listed in Constitution still exist. This is HUGE and underappreciated. Supports privacy, bodily autonomy, and more.

          **10th Amendment - Reserved Powers**
          "The powers not delegated to the United States by the Constitution, nor prohibited by it to the States, are reserved to the States respectively, or to the people."

          Federal government has ONLY the powers Constitution gives it. Everything else belongs to states or people. This principle has been significantly eroded.
          """,
        realWorldApplication: """
          The 9th and 10th Amendments are often forgotten but extremely important.

          When the government claims power, ask:
          - Where is this power granted in the Constitution? (10th)
          - Does this infringe on a natural right? (9th)
          """,
        keyCases: []
      )
    ],
    keyPoints: [
      "9th Amendment protects unlisted rights",
      "10th Amendment limits federal power",
      "8th Amendment prohibits cruel punishment",
      "These amendments are often overlooked but crucial",
    ]
  )
}

// MARK: - Module 8: 14th Amendment

extension Constitution101Course {
  static let fourteenthAmendmentModule = ConstitutionModule(
    number: 8,
    title: "Fourteenth Amendment",
    subtitle: "Equal Protection and Due Process",
    icon: "equal.circle.fill",
    lessons: [
      ConstitutionLesson(
        title: "The Second Bill of Rights",
        originalText:
          "...nor shall any State deprive any person of life, liberty, or property, without due process of law; nor deny to any person within its jurisdiction the equal protection of the laws.",
        plainEnglish: """
          The 14th Amendment (1868) transformed the Constitution. Originally, the Bill of Rights only applied to the FEDERAL government. The 14th Amendment extended protections to STATES.

          **Key Provisions:**

          **1. Citizenship Clause**
          Anyone born in the U.S. is a citizen. This includes children of undocumented immigrants (birthright citizenship).

          **2. Due Process Clause**
          STATES cannot deprive persons of life, liberty, or property without due process.

          **3. Equal Protection Clause**
          STATES must provide equal protection of laws to all persons.

          **"Persons" Not "Citizens":**
          Notice the language: "any person," not "any citizen." This is why constitutional protections apply to EVERYONE in the U.S., regardless of immigration status.

          **Incorporation Doctrine:**
          Through the 14th Amendment, most Bill of Rights protections now apply to states. States cannot violate your free speech, search you without warrant, etc.

          **Levels of Scrutiny:**
          Laws that discriminate are analyzed at different levels:
          - Race, national origin: Strict scrutiny (almost always unconstitutional)
          - Sex: Intermediate scrutiny
          - Most other things: Rational basis (usually upheld)
          """,
        realWorldApplication: """
          The 14th Amendment is why:
          • States cannot ban firearms (2nd applies via 14th)
          • States cannot establish religion (1st applies via 14th)
          • Undocumented immigrants have constitutional rights
          • Brown v. Board of Education ended school segregation
          """,
        keyCases: [
          ConstitutionCase(
            name: "Brown v. Board of Education",
            year: "1954",
            summary: "Segregated schools violate Equal Protection",
            impact: "Ended legal school segregation"
          ),
          ConstitutionCase(
            name: "Plyler v. Doe",
            year: "1982",
            summary: "Undocumented children have right to public education",
            impact: "Equal protection applies regardless of immigration status"
          ),
        ]
      )
    ],
    keyPoints: [
      "Extended Bill of Rights to apply to states",
      "Protects 'persons,' not just citizens",
      "Equal protection prohibits discrimination",
      "Foundation for civil rights jurisprudence",
    ]
  )
}

// MARK: - Module 9: Using Your Rights

extension Constitution101Course {
  static let usingYourRightsModule = ConstitutionModule(
    number: 9,
    title: "Using Your Rights",
    subtitle: "Practical application in real life",
    icon: "checkmark.shield.fill",
    lessons: [
      ConstitutionLesson(
        title: "Your Constitutional Toolkit",
        originalText: nil,
        plainEnglish: """
          Knowing your rights means nothing if you don't USE them.

          **Key Phrases to Memorize:**

          "I invoke my Fifth Amendment right to remain silent."

          "I do not consent to any searches."

          "Am I being detained, or am I free to go?"

          "I want to speak to an attorney."

          "I do not consent to this interaction."

          **The Order of Operations:**

          1. Stay calm - escalation helps no one
          2. Ask: "Am I being detained or am I free to go?"
          3. If free to go: LEAVE
          4. If detained: "I invoke my right to remain silent. I want an attorney."
          5. Do NOT physically resist
          6. Do NOT consent to searches
          7. Document everything afterward

          **Know the Difference:**
          • Asserting rights ≠ being uncooperative
          • Silence ≠ guilt
          • Knowing your rights ≠ being anti-police
          • Using rights ≠ having something to hide

          **Rights Must Be Invoked:**
          Simply staying quiet might not be enough. CLEARLY state you are invoking your rights.

          **After the Encounter:**
          • Write everything down immediately
          • Note badge numbers, car numbers
          • Get witness information
          • Take photos if relevant
          • Contact an attorney if needed
          """,
        realWorldApplication: """
          Practice saying these phrases out loud. When you're stressed, your brain defaults to what it has rehearsed.

          Teach your family. Role play scenarios. Make it automatic.

          Your rights only work if you exercise them.
          """,
        keyCases: []
      )
    ],
    keyPoints: [
      "Rights must be actively invoked",
      "Stay calm but firm",
      "Document everything",
      "Practice makes perfect",
    ]
  )
}
