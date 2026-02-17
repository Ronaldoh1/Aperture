// ImmigrationLawEntity.swift
// Immigration Law Basics - What Everyone Should Know
// Understanding the system is the first step to navigating it

import SwiftUI

// MARK: - Immigration Law Course

enum ImmigrationLawCourse {
  static let id = "immigration_law_basics"
  static let title = "Immigration Law Basics"
  static let subtitle = "Navigate the System, Protect Yourself"
  static let icon = "globe.americas.fill"
  static let color = Color(hex: "#7B1FA2")

  static let overview = """
    Immigration law is deliberately complex. Complexity benefits those with resources and punishes those without.

    This course won't make you a lawyer, but it WILL help you:
    • Understand the different paths to legal status
    • Know what each status means and its limitations
    • Recognize scams and bad legal advice
    • Understand your rights in immigration proceedings
    • Know when and how to get proper legal help

    Knowledge protects you. Ignorance is what they count on.

    ⚠️ DISCLAIMER: This is educational information, NOT legal advice. Immigration law changes frequently. Always consult a qualified immigration attorney for your specific situation.
    """

  static let modules: [ImmigrationModule] = [
    visaTypesModule,
    greenCardModule,
    citizenshipModule,
    removalModule,
    protectionsModule,
    familyModule,
    workAuthModule,
    scamsModule,
    legalHelpModule,
  ]
}

// MARK: - Module Definition

struct ImmigrationModule: Identifiable {
  let id = UUID()
  let number: Int
  let title: String
  let subtitle: String
  let icon: String
  let lessons: [ImmigrationLesson]
  let keyFacts: [String]
}

struct ImmigrationLesson: Identifiable {
  let id = UUID()
  let title: String
  let content: String
  let importantNotes: [String]
  let commonMistakes: [String]
}

// MARK: - Module 1: Visa Types

extension ImmigrationLawCourse {
  static let visaTypesModule = ImmigrationModule(
    number: 1,
    title: "Understanding Visa Types",
    subtitle: "The alphabet soup explained",
    icon: "doc.text.fill",
    lessons: [
      ImmigrationLesson(
        title: "Immigrant vs Non-Immigrant Visas",
        content: """
          First, understand the fundamental distinction:

          **NON-IMMIGRANT VISAS (Temporary)**
          These are for temporary stays with the INTENT to return home:
          • Tourist (B-1/B-2)
          • Student (F-1, M-1, J-1)
          • Work (H-1B, L-1, O-1, etc.)
          • Business (B-1)

          You must demonstrate "non-immigrant intent" - that you plan to leave.

          **IMMIGRANT VISAS (Permanent)**
          These lead to permanent residence (green card):
          • Family-sponsored
          • Employment-based
          • Diversity Lottery
          • Refugee/Asylee

          **The Key Difference:**
          Non-immigrant visas require you to maintain ties to your home country and prove you'll leave. Immigrant visas are for those who intend to stay permanently.

          **"Dual Intent" Exception:**
          Some visas (H-1B, L-1, O-1) allow "dual intent" - you can seek a green card while on these visas without jeopardizing your status.
          """,
        importantNotes: [
          "Overstaying a visa has serious consequences",
          "Visa type determines what you can and cannot do",
          "Changing status requires proper legal process",
        ],
        commonMistakes: [
          "Working on a tourist visa (illegal)",
          "Overstaying and hoping no one notices",
          "Assuming visa = unlimited stay",
        ]
      ),
      ImmigrationLesson(
        title: "Common Non-Immigrant Visas",
        content: """
          **B-1/B-2 (Business/Tourist)**
          • Duration: Usually 6 months, can extend
          • Cannot work or study
          • Must maintain foreign residence
          • Most common visa type

          **F-1 (Student)**
          • For academic studies
          • Can work on-campus (limited)
          • CPT/OPT for practical training
          • Must maintain full-time enrollment

          **H-1B (Specialty Worker)**
          • Requires bachelor's degree minimum
          • Employer-sponsored
          • Annual cap (85,000/year)
          • 3-year initial, 6-year max
          • Dual intent allowed

          **L-1 (Intracompany Transfer)**
          • Transfer from foreign office
          • L-1A (managers): 7 years max
          • L-1B (specialized knowledge): 5 years max
          • Dual intent allowed

          **O-1 (Extraordinary Ability)**
          • "Extraordinary" in field
          • No annual cap
          • Dual intent allowed

          **J-1 (Exchange Visitor)**
          • Cultural exchange programs
          • Some have 2-year home residency requirement
          • Various categories (intern, trainee, professor, etc.)

          **TN (NAFTA/USMCA)**
          • Canadian and Mexican citizens only
          • Specific professions listed
          • Relatively easy to obtain
          """,
        importantNotes: [
          "Each visa has specific rules - know yours",
          "Violating visa terms = deportation risk",
          "Some visas have 2-year home residency requirements",
        ],
        commonMistakes: [
          "Working without authorization",
          "Dropping below full-time as F-1 student",
          "Not understanding visa conditions",
        ]
      ),
    ],
    keyFacts: [
      "Non-immigrant visas are temporary, immigrant visas lead to permanent residence",
      "Dual intent visas allow green card pursuit",
      "Each visa type has specific restrictions",
      "Overstaying has serious consequences",
    ]
  )
}

// MARK: - Module 2: Green Card

extension ImmigrationLawCourse {
  static let greenCardModule = ImmigrationModule(
    number: 2,
    title: "Green Card (Permanent Residence)",
    subtitle: "The path to staying permanently",
    icon: "creditcard.fill",
    lessons: [
      ImmigrationLesson(
        title: "Ways to Get a Green Card",
        content: """
          There are several paths to permanent residence:

          **1. FAMILY-BASED**

          *Immediate Relatives of US Citizens (no wait):*
          • Spouse
          • Unmarried children under 21
          • Parents (if citizen is 21+)

          *Family Preference Categories (long waits):*
          • F1: Unmarried adult children of citizens
          • F2A: Spouses and children of green card holders
          • F2B: Unmarried adult children of green card holders
          • F3: Married adult children of citizens
          • F4: Siblings of adult citizens

          Wait times can be 5-20+ years depending on category and country.

          **2. EMPLOYMENT-BASED**

          • EB-1: Priority workers (extraordinary ability, professors, executives)
          • EB-2: Advanced degrees or exceptional ability
          • EB-3: Skilled workers, professionals, other workers
          • EB-4: Special immigrants (religious workers, etc.)
          • EB-5: Investors ($800,000-$1,050,000 investment)

          Most require employer sponsorship and labor certification.

          **3. DIVERSITY LOTTERY**
          • 55,000 visas annually
          • Random selection from underrepresented countries
          • Free to enter (beware scams!)
          • Countries like Mexico, China, India NOT eligible

          **4. HUMANITARIAN**
          • Refugees and Asylees
          • Victims of trafficking (T visa)
          • Victims of crimes (U visa)
          • VAWA (domestic violence victims)
          """,
        importantNotes: [
          "Wait times vary dramatically by category and birth country",
          "Marriage fraud is a federal crime",
          "Employment sponsorship doesn't guarantee approval",
        ],
        commonMistakes: [
          "Paying for 'guaranteed' green card services (scam)",
          "Not maintaining status while waiting",
          "Missing filing deadlines",
        ]
      ),
      ImmigrationLesson(
        title: "The Green Card Process",
        content: """
          **TYPICAL EMPLOYMENT-BASED PROCESS:**

          1. **PERM Labor Certification**
             - Employer proves no qualified US workers available
             - Requires recruitment, advertising
             - 6-18 months

          2. **I-140 Immigrant Petition**
             - Employer files petition
             - USCIS reviews qualifications
             - 6-12 months (or 15 days premium)

          3. **Wait for Priority Date**
             - May wait years if backlogged
             - Check Visa Bulletin monthly

          4. **I-485 Adjustment of Status** (if in US)
             - Or Consular Processing (if abroad)
             - Interview, background checks
             - 1-2+ years

          **FAMILY-BASED PROCESS:**

          1. **I-130 Petition** filed by US citizen/LPR
          2. **Wait for Priority Date** (immediate relatives: no wait)
          3. **I-485 or Consular Processing**
          4. **Interview and Decision**

          **CONDITIONAL GREEN CARD:**
          If married less than 2 years when approved:
          • 2-year conditional green card
          • Must file I-751 to remove conditions
          • Joint filing with spouse (or waiver if divorced/abused)

          **MAINTAINING YOUR GREEN CARD:**
          • Don't abandon residence (trips over 6 months risky)
          • Get re-entry permit for trips over 1 year
          • File taxes as resident
          • Notify USCIS of address changes
          """,
        importantNotes: [
          "Priority dates determine when you can file",
          "Maintaining status while waiting is crucial",
          "Conditional green cards require additional filing",
        ],
        commonMistakes: [
          "Traveling too long and abandoning status",
          "Not filing I-751 on time (conditional card)",
          "Not updating address with USCIS",
        ]
      ),
    ],
    keyFacts: [
      "Green cards can be obtained through family, employment, lottery, or humanitarian programs",
      "Wait times vary from immediate to 20+ years",
      "Maintaining status while waiting is crucial",
      "Conditional cards require removal of conditions",
    ]
  )
}

// MARK: - Module 3: Citizenship

extension ImmigrationLawCourse {
  static let citizenshipModule = ImmigrationModule(
    number: 3,
    title: "Path to Citizenship",
    subtitle: "Naturalization requirements and process",
    icon: "flag.fill",
    lessons: [
      ImmigrationLesson(
        title: "Naturalization Requirements",
        content: """
          To become a US citizen through naturalization:

          **BASIC REQUIREMENTS:**

          1. **Age:** 18 or older

          2. **Green Card Duration:**
             • 5 years as permanent resident, OR
             • 3 years if married to US citizen

          3. **Physical Presence:**
             • At least half the required period in US
             • 30 months of 5 years, OR
             • 18 months of 3 years

          4. **Continuous Residence:**
             • No trips over 6 months (breaks continuity)
             • Trips over 1 year = restart the clock

          5. **Good Moral Character:**
             • No serious crimes
             • Pay taxes
             • No fraud

          6. **English Language:**
             • Read, write, speak basic English
             • Exceptions for elderly/disabled

          7. **Civics Knowledge:**
             • Pass test on US history/government
             • 100 possible questions, asked 10, need 6 correct

          8. **Oath of Allegiance:**
             • Renounce foreign allegiances
             • Support the Constitution

          **SPECIAL PATHS:**
          • Military service: Expedited naturalization
          • Children of citizens: May derive citizenship automatically
          """,
        importantNotes: [
          "Apply 90 days before meeting residence requirement",
          "Criminal history can bar naturalization",
          "Lying on application = permanent bar",
        ],
        commonMistakes: [
          "Applying too early",
          "Long trips that break continuous residence",
          "Not disclosing criminal history",
        ]
      ),
      ImmigrationLesson(
        title: "The Naturalization Process",
        content: """
          **STEP BY STEP:**

          **1. File N-400**
          • Application for Naturalization
          • $725 filing fee (fee waivers available)
          • Gather documents (green card, photos, tax returns)

          **2. Biometrics Appointment**
          • Fingerprints for background check
          • Usually within weeks of filing

          **3. Interview**
          • At USCIS office
          • English and civics tests
          • Review of application
          • Bring all documents

          **4. Decision**
          • Approved: Scheduled for ceremony
          • Continued: Need more evidence
          • Denied: Can appeal or reapply

          **5. Oath Ceremony**
          • Pledge allegiance
          • Receive Certificate of Naturalization
          • You are now a US CITIZEN!

          **TIMELINE:**
          • Typically 8-14 months total
          • Varies by USCIS office

          **WHAT CITIZENSHIP GIVES YOU:**
          • Right to vote
          • Cannot be deported
          • US passport
          • Sponsor more relatives
          • Run for most offices
          • Federal jobs requiring citizenship
          """,
        importantNotes: [
          "Be completely honest on application",
          "Study for civics test (free resources available)",
          "Bring all requested documents to interview",
        ],
        commonMistakes: [
          "Not preparing for English/civics test",
          "Forgetting documents at interview",
          "Not disclosing trips or addresses",
        ]
      ),
    ],
    keyFacts: [
      "5 years as green card holder (3 if married to citizen)",
      "Must pass English and civics tests",
      "Criminal history can disqualify",
      "Citizenship provides permanent protection from deportation",
    ]
  )
}

// MARK: - Module 4: Removal/Deportation

extension ImmigrationLawCourse {
  static let removalModule = ImmigrationModule(
    number: 4,
    title: "Removal Proceedings",
    subtitle: "Understanding deportation and your rights",
    icon: "exclamationmark.triangle.fill",
    lessons: [
      ImmigrationLesson(
        title: "Grounds for Deportation",
        content: """
          Understanding WHY people get deported:

          **IMMIGRATION VIOLATIONS:**
          • Overstaying visa
          • Working without authorization
          • Entering without inspection (EWI)
          • Visa fraud or misrepresentation
          • Smuggling others

          **CRIMINAL GROUNDS:**

          *Aggravated Felonies (worst category):*
          • Murder, rape, sexual abuse
          • Drug trafficking (ANY amount)
          • Firearms trafficking
          • Money laundering over $10,000
          • Theft or burglary with 1+ year sentence
          • Fraud over $10,000

          These bar MOST relief from deportation.

          *Crimes of Moral Turpitude:*
          • Fraud, theft, assault
          • Two or more = deportable
          • One within 5 years of entry = deportable

          *Drug Offenses:*
          • Almost any drug conviction (except simple marijuana possession <30g for personal use in some cases)

          *Domestic Violence:*
          • DV convictions
          • Stalking
          • Violating protection orders

          **PUBLIC CHARGE:**
          • Receiving certain public benefits
          • Complex rules, consult attorney

          **GREEN CARD HOLDERS:**
          Yes, you CAN be deported even with a green card. Citizenship is the only permanent protection.
          """,
        importantNotes: [
          "Even minor crimes can have immigration consequences",
          "Green card does NOT protect from deportation",
          "Always consult immigration attorney before any plea deal",
        ],
        commonMistakes: [
          "Taking plea deals without understanding immigration impact",
          "Assuming green card protects you",
          "Not fighting removal when relief is available",
        ]
      ),
      ImmigrationLesson(
        title: "Relief from Removal",
        content: """
          Even in removal proceedings, there may be options:

          **CANCELLATION OF REMOVAL**

          *For Green Card Holders:*
          • 5 years as LPR
          • 7 years continuous residence
          • No aggravated felony

          *For Non-LPRs (very difficult):*
          • 10 years continuous presence
          • Good moral character
          • Removal would cause "exceptional and extremely unusual hardship" to US citizen/LPR spouse, parent, or child
          • Only 4,000 granted per year

          **ASYLUM**
          • Fear of persecution in home country
          • Based on race, religion, nationality, political opinion, or particular social group
          • Must file within 1 year of entry (exceptions exist)

          **WITHHOLDING OF REMOVAL**
          • Higher standard than asylum
          • Cannot be removed to country where life/freedom threatened
          • Does NOT lead to green card

          **CONVENTION AGAINST TORTURE (CAT)**
          • Would be tortured by or with government acquiescence
          • Very high standard

          **VOLUNTARY DEPARTURE**
          • Leave on your own terms
          • Avoid deportation order
          • May preserve future immigration options
          • NOT always the best choice - consult attorney

          **PROSECUTORIAL DISCRETION**
          • Government may choose not to pursue case
          • Rare but possible

          **POST-REMOVAL:**
          • Deportation = 5-20 year bar from returning
          • Illegal reentry after deportation = federal crime
          """,
        importantNotes: [
          "Always explore ALL options with an attorney",
          "Don't sign voluntary departure without legal advice",
          "Deportation bars future entry",
        ],
        commonMistakes: [
          "Giving up without exploring relief options",
          "Signing voluntary departure when relief available",
          "Not showing up to court hearings",
        ]
      ),
    ],
    keyFacts: [
      "Even green card holders can be deported",
      "Criminal convictions have serious immigration consequences",
      "Relief options exist - always consult an attorney",
      "Missing court = automatic deportation order",
    ]
  )
}

// MARK: - Module 5: Special Protections

extension ImmigrationLawCourse {
  static let protectionsModule = ImmigrationModule(
    number: 5,
    title: "Special Protections",
    subtitle: "DACA, TPS, asylum, and more",
    icon: "shield.fill",
    lessons: [
      ImmigrationLesson(
        title: "DACA (Deferred Action)",
        content: """
          **DEFERRED ACTION FOR CHILDHOOD ARRIVALS**

          DACA is NOT a visa or legal status. It's a policy of prosecutorial discretion.

          **Requirements:**
          • Came to US before age 16
          • Continuous residence since June 15, 2007
          • Were under 31 on June 15, 2012
          • In school, graduated, or honorably discharged
          • No felony, significant misdemeanor, or 3+ misdemeanors
          • Pass background check

          **What DACA Provides:**
          • Temporary protection from deportation (2 years, renewable)
          • Work authorization
          • Social Security number
          • Driver's license in most states

          **What DACA Does NOT Provide:**
          • Path to green card or citizenship
          • Ability to sponsor family
          • Re-entry if you leave (Advance Parole limited)
          • Permanent protection

          **Current Status:**
          DACA has faced legal challenges. Check current status before applying or renewing. As of this content, renewals continue but new applications are restricted.

          **If You Have DACA:**
          • Renew on time (submit 120-150 days before expiration)
          • Avoid ANY criminal issues
          • Keep all documents
          • Consult attorney about other options
          """,
        importantNotes: [
          "DACA status can change with policy/court decisions",
          "ANY criminal conviction can disqualify",
          "Renew early - don't let it lapse",
        ],
        commonMistakes: [
          "Thinking DACA is a path to citizenship",
          "Traveling without Advance Parole",
          "Waiting too long to renew",
        ]
      ),
      ImmigrationLesson(
        title: "TPS, Asylum, and Humanitarian Programs",
        content: """
          **TEMPORARY PROTECTED STATUS (TPS)**

          Designated for countries with:
          • Armed conflict
          • Natural disaster
          • Extraordinary conditions

          Provides:
          • Protection from deportation
          • Work authorization
          • Travel authorization (with advance permission)

          Requirements:
          • National of designated country
          • Continuous presence in US
          • File during registration period
          • No disqualifying criminal history

          Current TPS countries change - check USCIS website.

          **ASYLUM**

          For those fleeing persecution based on:
          • Race
          • Religion
          • Nationality
          • Political opinion
          • Particular social group (LGBTQ+, gang targets, domestic violence victims in some cases)

          Process:
          1. File I-589 within 1 year of arrival (exceptions exist)
          2. Interview with asylum officer
          3. If denied, case goes to immigration court
          4. If granted, can apply for green card after 1 year

          **U VISA (Crime Victims)**
          • Victim of qualifying crime in US
          • Suffered substantial abuse
          • Have information about crime
          • Helpful to law enforcement
          • 4 years, leads to green card

          **T VISA (Trafficking Victims)**
          • Victim of severe trafficking
          • In US due to trafficking
          • Would face hardship if removed
          • 4 years, leads to green card

          **VAWA (Domestic Violence)**
          • Abused spouse, child, or parent of citizen/LPR
          • Self-petition for green card
          • Abuser doesn't know
          """,
        importantNotes: [
          "TPS designation can be terminated",
          "Asylum has strict deadlines",
          "U and T visas have caps and long waits",
        ],
        commonMistakes: [
          "Missing asylum 1-year deadline",
          "Not re-registering for TPS",
          "Not reporting crimes (U visa requires police report)",
        ]
      ),
    ],
    keyFacts: [
      "DACA is not a path to citizenship",
      "TPS provides temporary protection for designated countries",
      "Asylum must be filed within 1 year (with exceptions)",
      "U and T visas help crime and trafficking victims",
    ]
  )
}

// MARK: - Module 6: Family Immigration

extension ImmigrationLawCourse {
  static let familyModule = ImmigrationModule(
    number: 6,
    title: "Family Immigration",
    subtitle: "Sponsoring relatives",
    icon: "person.3.fill",
    lessons: [
      ImmigrationLesson(
        title: "Who Can You Sponsor?",
        content: """
          **US CITIZENS CAN SPONSOR:**

          *Immediate Relatives (no wait):*
          • Spouse
          • Unmarried children under 21
          • Parents (if citizen is 21+)

          *Family Preference:*
          • F1: Unmarried adult children (21+)
          • F3: Married adult children (any age)
          • F4: Brothers and sisters (if citizen is 21+)

          **GREEN CARD HOLDERS CAN SPONSOR:**
          • F2A: Spouse and unmarried children under 21
          • F2B: Unmarried adult children (21+)

          CANNOT sponsor: Parents, siblings, married children

          **WAIT TIMES (approximate):**
          • Immediate relatives: No wait
          • F1: 7-15 years
          • F2A: 2-5 years
          • F2B: 7-12 years
          • F3: 13-20 years
          • F4: 15-25 years

          Wait times are MUCH longer for Mexico, Philippines, China, India.

          **FINANCIAL REQUIREMENTS:**
          • Sponsor must sign Affidavit of Support (I-864)
          • Income at 125% of poverty guidelines
          • Can use co-sponsor or assets
          • Legally binding - can be sued if sponsored person gets benefits
          """,
        importantNotes: [
          "Wait times vary dramatically by country",
          "Financial sponsorship is legally binding",
          "Priority date locks in when petition filed",
        ],
        commonMistakes: [
          "Not filing early (priority date matters)",
          "Underestimating financial requirements",
          "Not understanding binding nature of sponsorship",
        ]
      ),
      ImmigrationLesson(
        title: "Marriage-Based Immigration",
        content: """
          **THE PROCESS:**

          1. **File I-130** (Petition for Alien Relative)
             • Prove valid marriage
             • Marriage certificate
             • Photos together
             • Joint accounts, leases, etc.

          2. **If spouse in US legally: File I-485 concurrently**
             • Adjustment of Status
             • Can include work permit (I-765) and travel permit (I-131)

          3. **If spouse abroad or entered illegally: Consular Processing**
             • May trigger unlawful presence bars (3 or 10 year)
             • May need I-601A provisional waiver

          4. **Interview**
             • Prove marriage is genuine
             • Answer questions separately and together
             • Provide extensive documentation

          **CONDITIONAL GREEN CARD:**
          If married less than 2 years at approval:
          • 2-year conditional card
          • Must file I-751 jointly 90 days before expiration
          • If divorced: file with waiver
          • If abuse: file with waiver (VAWA protections)

          **FRAUD WARNINGS:**
          Immigration takes marriage fraud VERY seriously:
          • Criminal penalties
          • Deportation
          • Permanent immigration bar
          • They WILL investigate suspicious cases

          **RED FLAGS they look for:**
          • Large age differences
          • Different languages
          • Short relationship before marriage
          • Previous immigration marriage
          • Lack of shared finances/residence
          """,
        importantNotes: [
          "Genuine marriage is key - document everything",
          "Conditional green card requires follow-up filing",
          "Marriage fraud has severe consequences",
        ],
        commonMistakes: [
          "Not gathering enough evidence of genuine marriage",
          "Forgetting to file I-751 on time",
          "Getting divorced before removing conditions (need waiver)",
        ]
      ),
    ],
    keyFacts: [
      "Citizens can sponsor more relatives than green card holders",
      "Wait times can be decades for some categories",
      "Marriage fraud has severe criminal and immigration consequences",
      "Conditional green cards require additional filing",
    ]
  )
}

// MARK: - Module 7: Work Authorization

extension ImmigrationLawCourse {
  static let workAuthModule = ImmigrationModule(
    number: 7,
    title: "Work Authorization",
    subtitle: "Legal ways to work in the US",
    icon: "briefcase.fill",
    lessons: [
      ImmigrationLesson(
        title: "Who Can Work?",
        content: """
          **AUTOMATIC WORK AUTHORIZATION:**
          • US citizens
          • Permanent residents (green card holders)
          • Certain visa holders (H-1B, L-1, O-1, etc.)

          **NEED SEPARATE WORK PERMIT (EAD):**
          • Pending adjustment of status (I-485)
          • Asylum applicants (after 180 days)
          • DACA recipients
          • TPS holders
          • F-1 students (OPT/CPT)
          • Some spouse visas (H-4 with H-1B in certain circumstances)

          **CANNOT WORK:**
          • B-1/B-2 tourists
          • Most F-2 dependents
          • Most J-2 dependents (without EAD)
          • ESTA/Visa Waiver visitors

          **EAD (Employment Authorization Document):**
          • Form I-765
          • Processing: 3-6 months (varies)
          • Valid 1-2 years typically
          • Renewal required

          **I-9 VERIFICATION:**
          All employers must verify work authorization:
          • You present documents from approved list
          • Employer fills out I-9
          • E-Verify in some states/employers
          """,
        importantNotes: [
          "Working without authorization is illegal",
          "Unauthorized work can bar future immigration benefits",
          "EADs take months - apply early",
        ],
        commonMistakes: [
          "Working before EAD arrives",
          "Letting EAD expire before renewing",
          "Working on wrong visa category",
        ]
      ),
      ImmigrationLesson(
        title: "For Students: CPT and OPT",
        content: """
          **CPT (Curricular Practical Training)**

          • Work directly related to major
          • Must be part of curriculum
          • Before graduation
          • Requires school authorization
          • Part-time or full-time
          • More than 12 months full-time = lose OPT

          **OPT (Optional Practical Training)**

          *Pre-completion OPT:*
          • While still in school
          • Part-time only
          • Deducted from post-completion

          *Post-completion OPT:*
          • After graduation
          • 12 months total
          • Must apply before graduation
          • 90 days to find job (unemployment limit)

          **STEM OPT Extension:**
          • Additional 24 months (36 total)
          • STEM degree from accredited school
          • Employer must be E-Verify
          • Training plan required
          • 150 days unemployment limit

          **DEADLINES ARE CRITICAL:**
          • Apply for OPT 90 days before graduation, no later than 60 days after
          • STEM extension: Before regular OPT expires
          • Start work only after EAD received

          **AFTER OPT:**
          • H-1B lottery
          • Other visa options
          • Return home
          • 60-day grace period to depart
          """,
        importantNotes: [
          "OPT has strict unemployment limits",
          "STEM extension requires E-Verify employer",
          "Missing deadlines = lose opportunity",
        ],
        commonMistakes: [
          "Working before EAD start date",
          "Exceeding unemployment limits",
          "Not tracking OPT reporting requirements",
        ]
      ),
    ],
    keyFacts: [
      "Working without authorization has serious consequences",
      "EADs take months to process - apply early",
      "Students have CPT, OPT, and STEM OPT options",
      "Employers must verify work authorization (I-9)",
    ]
  )
}

// MARK: - Module 8: Avoiding Scams

extension ImmigrationLawCourse {
  static let scamsModule = ImmigrationModule(
    number: 8,
    title: "Avoiding Immigration Scams",
    subtitle: "Protect yourself from fraud",
    icon: "exclamationmark.shield.fill",
    lessons: [
      ImmigrationLesson(
        title: "Common Scams",
        content: """
          Immigration scams prey on vulnerable people. Know what to watch for:

          **NOTARIO FRAUD**
          In Latin America, "notario" means lawyer. In the US, it does NOT.
          • "Notarios" cannot give legal advice
          • Cannot represent you in immigration matters
          • Many charge lawyer prices for worthless "help"
          • Often file wrong forms, causing DENIAL and DEPORTATION

          **FAKE LAWYERS**
          • Always verify at your state bar website
          • Ask for bar number and check it
          • Real lawyers have malpractice insurance

          **GUARANTEED RESULTS**
          No one can guarantee:
          • Green card approval
          • Visa approval
          • Asylum grant
          • Citizenship

          If someone promises guaranteed results, RUN.

          **LOTTERY SCAMS**
          • Diversity lottery is FREE to enter at dvprogram.state.gov
          • Anyone charging to "enter" you is a scammer
          • Government never emails lottery winners
          • Never send money for "processing fees"

          **FAKE USCIS CALLS/EMAILS**
          • USCIS rarely calls, never demands payment by phone
          • Official emails come from uscis.gov only
          • Never click links in suspicious emails
          • When in doubt, call USCIS directly

          **"SPECIAL PROGRAMS"**
          • No secret fast-track programs
          • No way to "buy" a green card (except legitimate EB-5)
          • No amnesty programs currently (check news)
          """,
        importantNotes: [
          "Notarios are NOT lawyers in the US",
          "No one can guarantee immigration results",
          "Diversity lottery is FREE",
        ],
        commonMistakes: [
          "Trusting notarios or immigration consultants",
          "Paying for 'guaranteed' results",
          "Not verifying lawyer credentials",
        ]
      ),
      ImmigrationLesson(
        title: "How to Find Legitimate Help",
        content: """
          **WHO CAN LEGALLY HELP:**

          1. **Licensed Attorneys**
             • Verify at state bar website
             • Specialize in immigration
             • Can represent you everywhere

          2. **DOJ Accredited Representatives**
             • Work for recognized organizations
             • Verify at justice.gov
             • Often lower cost than lawyers

          3. **Yourself (Pro Se)**
             • You can file your own paperwork
             • High risk - small mistakes have big consequences
             • Only for simple cases

          **RED FLAGS:**
          • Guarantees results
          • Asks you to sign blank forms
          • Won't give receipts
          • Keeps your original documents
          • Office is someone's home
          • Recommends lying
          • Much cheaper than everyone else
          • Only accepts cash

          **GOOD SIGNS:**
          • Written fee agreement
          • Provides receipts
          • Has verifiable credentials
          • Explains risks honestly
          • Doesn't promise specific outcomes
          • Returns your original documents
          • Has a real office
          • Multiple payment options

          **IF YOU'VE BEEN SCAMMED:**
          • Report to FTC at ftc.gov
          • Report to state attorney general
          • Report to state bar if fake lawyer
          • File complaint with DOJ if accredited rep
          • May be able to reopen your case if fraud occurred
          """,
        importantNotes: [
          "Always verify credentials",
          "Get everything in writing",
          "You can report scammers",
        ],
        commonMistakes: [
          "Not checking bar membership",
          "Signing blank forms",
          "Letting someone keep original documents",
        ]
      ),
    ],
    keyFacts: [
      "Notarios cannot practice law in the US",
      "No one can guarantee immigration results",
      "Verify all credentials before paying",
      "Report scams to FTC and state attorney general",
    ]
  )
}

// MARK: - Module 9: Finding Legal Help

extension ImmigrationLawCourse {
  static let legalHelpModule = ImmigrationModule(
    number: 9,
    title: "Finding Legal Help",
    subtitle: "Resources for getting proper assistance",
    icon: "building.columns.fill",
    lessons: [
      ImmigrationLesson(
        title: "Free and Low-Cost Resources",
        content: """
          You don't have to navigate this alone:

          **FREE LEGAL HELP:**

          **Immigration Advocates Network**
          • immigrationadvocates.org/nonprofit/legaldirectory
          • Search by location for free/low-cost providers

          **Catholic Charities**
          • Regardless of religion
          • Many locations offer immigration help
          • catholiccharitiesusa.org

          **CLINIC Network**
          • cliniclegal.org
          • Network of immigration legal services

          **Law School Clinics**
          • Many law schools offer free help
          • Supervised by professors
          • Search "[your city] law school immigration clinic"

          **AILA Lawyer Referral**
          • ailalawyer.com
          • Find AILA member immigration attorneys

          **LOCAL ORGANIZATIONS:**
          Search for:
          • "[your city] immigration legal services"
          • "[your community] immigrant rights"
          • Community organizations often know local resources

          **WHEN YOU NEED A PAID LAWYER:**
          • Complex cases
          • Criminal history
          • Prior deportation
          • Fraud issues
          • Immigration court
          • Appeals

          **WHAT TO BRING TO CONSULTATION:**
          • All immigration documents
          • Passport(s)
          • Criminal records (if any)
          • Previous applications
          • Family information
          • Timeline of US presence
          """,
        importantNotes: [
          "Free help exists - don't skip legal help due to cost",
          "Prepare documents before consultation",
          "Complex cases need paid attorneys",
        ],
        commonMistakes: [
          "Not seeking help due to assumed cost",
          "Waiting until in removal proceedings",
          "Not bringing documents to consultation",
        ]
      ),
      ImmigrationLesson(
        title: "Know Before Your Consultation",
        content: """
          **QUESTIONS TO ASK A LAWYER:**

          1. What are my options?
          2. What are the risks of each option?
          3. How long will it take?
          4. How much will it cost (total)?
          5. What happens if it's denied?
          6. Have you handled cases like mine?
          7. Will you personally handle my case?
          8. How will we communicate?
          9. Can I see a written fee agreement?
          10. What are the chances of success? (Be wary of guarantees)

          **INFORMATION TO PREPARE:**

          *Your Immigration History:*
          • How and when you entered US
          • All visas you've had
          • All addresses in US
          • All employers
          • All trips outside US
          • Any prior applications

          *Your Family:*
          • Spouse/children's status
          • Parents' status
          • Any US citizen relatives
          • Any relatives with immigration issues

          *Your Background:*
          • Criminal history (ALL, even dismissed)
          • Any past immigration violations
          • Any fraud (be honest with your lawyer)
          • Education and work history

          **AFTER HIRING:**
          • Get copies of EVERYTHING filed
          • Keep your own records
          • Note all deadlines
          • Respond promptly to requests
          • Update lawyer on address/employment changes
          • Attend all appointments and interviews
          """,
        importantNotes: [
          "Be completely honest with your lawyer",
          "Keep copies of all documents",
          "Respond promptly to all requests",
        ],
        commonMistakes: [
          "Hiding information from lawyer",
          "Not keeping personal copies",
          "Missing deadlines or appointments",
        ]
      ),
    ],
    keyFacts: [
      "Free legal help exists through many organizations",
      "Prepare all documents before consultation",
      "Be completely honest with your lawyer",
      "Keep copies of everything",
    ]
  )
}
