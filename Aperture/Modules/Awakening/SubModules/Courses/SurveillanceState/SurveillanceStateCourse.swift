// SurveillanceStateCourse.swift
// SunFlow: Reignited — Aperture
//
// SURVEILLANCE STATE: When Safety Becomes a Cage
// A course on surveillance, civil liberties, and digital sovereignty
// "They said it was for your protection. Then they turned it on you."

import SwiftUI

// MARK: - Models

struct SSLesson: Identifiable {
    let id: String
    let lessonNumber: Int
    let title: String
    let subtitle: String
    let hook: String
    let body: String
    let caseStudy: SSCaseStudy?
    let timeline: [SSTimelineEvent]
    let patternAlert: String
    let sovereigntyTip: String
    let reflectionPrompt: String
}

struct SSCaseStudy: Identifiable {
    let id = UUID()
    let era: String
    let title: String
    let whatHappened: String
    let whoItTargeted: String
    let legalCover: String
    let outcome: String
    let parallelsToday: String
}

struct SSTimelineEvent: Identifiable {
    let id = UUID()
    let year: String
    let event: String
    let significance: String
}

// MARK: - Course Definition

let surveillanceStateCourse: [SSLesson] = [

    // MARK: - LESSON 1
    SSLesson(
        id: "ss_01",
        lessonNumber: 1,
        title: "The Safety Bargain",
        subtitle: "How Surveillance Always Gets Sold",
        hook: "Every surveillance program in American history was sold the same way. There's a threat. It's urgent. Normal rules won't work fast enough. We need this one tool — just for the bad guys. Just temporarily. Just to keep you safe. The tool never stays temporary. The target list always grows. Learn the sales pitch once and you'll recognize it every time.",
        body: """
**The Template**

Surveillance programs follow a predictable sales cycle. First, manufacture or amplify a genuine threat until the public feels existential fear. Second, introduce the surveillance tool as the only solution fast enough to stop it. Third, discredit anyone who asks questions — call them naive, call them sympathizers, call them dangerous. Fourth, once the tool is built, it never gets dismantled. The threat changes. The tool expands.

This pattern has repeated with clockwork reliability across Red Scares, World Wars, the War on Drugs, post-9/11, and into the current moment. The technology changes each time. The pitch does not.

**The Four Promises They Always Make**

Promise 1: *Only the guilty will be targeted.* Reality: "Guilty" is a definition controlled by whoever runs the program. It expands to include dissidents, journalists, civil rights leaders, political opponents, and anyone who associates with any of the above.

Promise 2: *There are strict limits and oversight.* Reality: Oversight is typically internal, secret, and conducted by the same agencies being watched. External oversight is added only after exposure — usually decades later.

Promise 3: *This is temporary.* Reality: No surveillance infrastructure built in American history has ever been permanently dismantled. Tools built for one crisis become standard equipment for the next.

Promise 4: *If you have nothing to hide, you have nothing to fear.* Reality: This phrase eliminates the concept of privacy as a right. Privacy is not just for people with secrets. It is the foundation of free thought, free association, and political freedom. Every authoritarian system in history began by eliminating the expectation of privacy.

**Why the Bargain Always Fails**

The fundamental problem is asymmetry. The people making the promise — politicians, intelligence officials, law enforcement — are not the people who will suffer if the promise breaks. The people who say "trust us with this power" are not accountable when it's abused. They move to another position. They get promotions. The people who get surveilled, flagged, investigated, or disappeared are left dealing with consequences the promise-makers never face.

**The Chilling Effect: The Cost You Never See**

Even when surveillance doesn't result in arrest or prosecution, it works. When people know they might be watched, they self-censor. They don't attend certain meetings. They don't call certain people. They don't say certain things publicly. This is called the "chilling effect" — and it's a feature, not a bug. A population that monitors itself saves the state enormous resources. You become your own warden.

**What Sovereignty Looks Like**

Understanding the template doesn't mean you think there are no real threats. Real threats exist. The question is who gets to define the threat, who gets targeted in response, what oversight exists, and what happens to the tool when the threat passes. These are not paranoid questions. They are the questions every functioning democracy requires its citizens to ask.
""",
        caseStudy: SSCaseStudy(
            era: "1798",
            title: "Alien and Sedition Acts",
            whatHappened: "Congress passed laws making it illegal to criticize the government and giving the president power to deport any foreigner deemed 'dangerous.' Justified as protection against French Revolutionary influence.",
            whoItTargeted: "Political opponents of John Adams's Federalist Party — primarily journalists and politicians aligned with Jefferson's Democratic-Republicans. Dozens prosecuted for criticizing the president in print.",
            legalCover: "National security threat from France. War was looming. Foreign influence was real. The laws were framed as wartime emergency measures.",
            outcome: "Jefferson and Madison condemned the acts as unconstitutional. Jefferson won the 1800 election partly on backlash. Acts expired or were repealed — but the template was set.",
            parallelsToday: "Every era has its version: the threat is real enough to feel urgent, the targeted group is politically convenient, the legal cover is national security. The Acts of 1798 are the blueprint."
        ),
        timeline: [
            SSTimelineEvent(year: "1798", event: "Alien & Sedition Acts", significance: "First federal law criminalizing speech critical of government. Prosecuted newspaper editors, not spies."),
            SSTimelineEvent(year: "1917", event: "Espionage Act", significance: "Still active law, used to prosecute WWI anti-war protesters, later Ellsberg, later Snowden."),
            SSTimelineEvent(year: "1918", event: "Sedition Act", significance: "Made it illegal to criticize the military, draft, or flag. Eugene Debs sentenced to 10 years for a speech.")
        ],
        patternAlert: "Listen for the phrase 'If you have nothing to hide, you have nothing to fear.' It sounds reasonable. It is designed to eliminate your right to ask what the tool does and who controls it.",
        sovereigntyTip: "Before accepting any security-for-freedom trade, ask: Who defines the threat? Who gets targeted? What oversight exists? What happens to this tool after the threat passes? These four questions expose every bad bargain.",
        reflectionPrompt: "Can you name one surveillance tool built in American history that was later completely dismantled? If you can't name one, what does that tell you about how these bargains actually end?"
    ),

    // MARK: - LESSON 2
    SSLesson(
        id: "ss_02",
        lessonNumber: 2,
        title: "COINTELPRO",
        subtitle: "The Government's Secret War on Its Own Citizens",
        hook: "From 1956 to 1971, the FBI ran a classified program to infiltrate, disrupt, discredit, and destroy American political organizations. Not foreign spy rings. American citizens. Civil rights leaders. Anti-war groups. Women's liberation. Indigenous rights activists. The program was called COINTELPRO, and it used surveillance as a weapon. When it was finally exposed, what the FBI had done to Martin Luther King Jr. alone should have ended careers and triggered prosecutions. Nobody went to prison.",
        body: """
**What COINTELPRO Actually Was**

COINTELPRO — Counter Intelligence Program — was a series of secret FBI operations authorized by J. Edgar Hoover beginning in 1956. The official targets were "subversive organizations" — a term that meant whatever Hoover decided it meant. In practice it meant: communists, socialists, civil rights leaders, Black nationalist organizations, Puerto Rican independence groups, the American Indian Movement, the women's liberation movement, and various anti-war organizations.

The tactics were not intelligence-gathering. They were active warfare against American civilians.

**The Tactics**

*Infiltration:* FBI informants joined organizations and worked to create internal divisions, sow distrust between leaders, and report on membership. Some informants became central figures in the organizations they were destroying.

*Forged letters:* The FBI created and mailed fake letters between leaders of different organizations, designed to create feuds and suspicion. A forged letter from the Black Panthers to a rival group claiming their leader was an informant. Fabricated correspondence between civil rights leaders making it look like they were betraying each other.

*Smear campaigns:* Anonymous letters sent to employers, landlords, family members, and media contacts with fabricated or selectively edited information. Letters designed to cost activists their jobs, housing, and relationships.

*Psychological warfare:* The FBI sent Martin Luther King Jr. a letter in 1964 that strongly implied he should kill himself before his receipt of the Nobel Peace Prize. The letter was accompanied by recordings of his hotel room conversations. The explicit message was: we have everything. Your reputation will be destroyed. You should commit suicide.

*Direct disruption:* Working with local police departments to raid offices, make arrests on pretextual charges, and create legal costs that drained organizational resources.

*Targeting families:* Contacting wives, parents, and children of activists with fabricated information designed to destroy personal relationships and create domestic pressure to stop organizing.

**Who They Targeted**

The full target list, when declassified decades later, included: the NAACP, the Southern Christian Leadership Conference, the Student Nonviolent Coordinating Committee, the Nation of Islam, the Black Panther Party, the American Indian Movement, the Puerto Rican Independence Party, Students for a Democratic Society, the Socialist Workers Party, the Communist Party USA, the women's liberation movement, and dozens of individual Americans including Martin Luther King Jr., Malcolm X, Muhammad Ali, and John Lennon.

**What Was Legal Cover**

None of this was legally authorized. COINTELPRO operated in total secrecy, outside any judicial or congressional oversight. Hoover ran it as a personal fiefdom. When confronted after the Church Committee exposed the program in 1975, the FBI's defense was essentially: we thought it was necessary. Nobody faced criminal prosecution. Nobody served time. The agents who sent Martin Luther King Jr. a letter suggesting he kill himself received federal pensions.

**The Scale**

In 1975, the Church Committee (a Senate investigation) reported: "Many of the techniques used would be intolerable in a democratic society even if all the targets had been involved in violent activity, but COINTELPRO went far beyond that." The Committee documented over 2,000 separate COINTELPRO operations between 1956 and 1971.

**The Legacy**

COINTELPRO officially ended in 1971 when the files were stolen from an FBI field office and leaked to the press. It did not end because the FBI chose to stop. It ended because it was exposed. The tools, techniques, and organizational knowledge did not disappear. They were institutionalized. When you read about modern surveillance of Black Lives Matter, Standing Rock, environmental activists, or Muslim communities, you are reading about a continuity, not a new invention.
""",
        caseStudy: SSCaseStudy(
            era: "1964–1968",
            title: "The FBI's War on Martin Luther King Jr.",
            whatHappened: "The FBI designated King 'the most dangerous Negro in America' in 1963. They wiretapped his phones, bugged his hotel rooms, surveilled his associates, attempted to destroy his marriage, contacted his family with forged information, and in 1964 sent him a letter with recordings of his private conversations and an explicit suggestion that he kill himself before the Nobel Peace Prize ceremony.",
            whoItTargeted: "A Baptist minister and civil rights leader who advocated for voting rights, economic justice, and opposition to the Vietnam War. His only 'crime' was being effective.",
            legalCover: "Hoover convinced Attorney General Robert Kennedy to authorize wiretaps under the claim that King was influenced by Communist advisors. The 'Communist threat' was the cover for surveilling the most prominent civil rights leader in American history.",
            outcome: "King was murdered in 1968. In 1999, a civil court jury found in the King family lawsuit that 'governmental agencies' were partly responsible for his assassination. The FBI files on King were sealed until 2027 — extended multiple times.",
            parallelsToday: "The FBI conducted surveillance on Black Lives Matter organizers. Environmental activists have been labeled domestic terrorists. The tools are modern. The targeting logic is the same."
        ),
        timeline: [
            SSTimelineEvent(year: "1956", event: "COINTELPRO launches targeting CPUSA", significance: "Expanded immediately beyond stated target to include any 'subversive' group Hoover chose."),
            SSTimelineEvent(year: "1963", event: "FBI labels King 'most dangerous Negro'", significance: "Surveillance of the leading civil rights figure begins in earnest."),
            SSTimelineEvent(year: "1964", event: "FBI sends King suicide letter", significance: "Program crosses from surveillance to active psychological warfare against American citizens."),
            SSTimelineEvent(year: "1971", event: "Files stolen, program exposed", significance: "COINTELPRO ends not because anyone stopped it — because it was exposed by citizens."),
            SSTimelineEvent(year: "1975", event: "Church Committee hearings", significance: "Senate investigation reveals scope. Zero prosecutions follow.")
        ],
        patternAlert: "When surveillance targets are described as 'extremists' or 'threats to national security' without specific criminal evidence, remember that Martin Luther King Jr. was described in exactly those terms by the director of the FBI.",
        sovereigntyTip: "Look up what organizations were COINTELPRO targets and compare them to organizations described as 'threats' today. Notice any patterns in who gets labeled.",
        reflectionPrompt: "The Church Committee exposed COINTELPRO in 1975. Congress was shocked. The response was to create oversight rules. Within a decade, those rules were being quietly bypassed. What does that cycle tell you about oversight as a solution?"
    ),

    // MARK: - LESSON 3
    SSLesson(
        id: "ss_03",
        lessonNumber: 3,
        title: "Post-9/11: The Architecture Gets Built",
        subtitle: "How Fear Built the Permanent Surveillance Infrastructure",
        hook: "September 11 was a genuine catastrophe. Three thousand people died. The fear was real. And in that fear, the United States built the most comprehensive surveillance infrastructure in the history of any democracy — in secret, with no public debate, with legal authority that was interpreted by secret courts, rubber-stamped by secret opinions, and kept entirely hidden from the public for more than a decade. When Edward Snowden finally exposed it in 2013, the government's response was not to defend the programs with evidence. It was to call him a traitor.",
        body: """
**What Got Built**

The Patriot Act (passed 45 days after 9/11, with minimal congressional debate) gave law enforcement sweeping new powers to conduct surveillance with minimal judicial oversight. But the Patriot Act was the public part. The classified architecture was built in parallel.

**The NSA Programs (Pre-Snowden)**

*PRISM:* A program that gave the NSA direct access to the servers of Microsoft, Yahoo, Google, Facebook, PalTalk, YouTube, Skype, AOL, and Apple. Not selective warrants for specific suspects — direct server access to collect communications of millions of people.

*XKeyscore:* Described internally as the NSA's "widest reaching" system. Analysts could search through vast databases of emails, online chats, and browsing histories without a court order. One internal presentation described it as capable of finding "any email on the internet."

*Bulk Phone Records Collection:* The NSA collected metadata — who called whom, when, for how long — on essentially every phone call made in the United States. This was authorized under a secret interpretation of Section 215 of the Patriot Act that was classified. Congress passed a law. The NSA interpreted that law in a secret court order in a way that bore almost no relation to what the law's text said. The secret interpretation was used to collect data on hundreds of millions of Americans.

*MUSCULAR:* NSA tapped directly into the fiber-optic cables connecting Google and Yahoo data centers to collect data that bypassed even their cooperation with PRISM.

**The Secret Court**

The Foreign Intelligence Surveillance Court (FISC) was created to provide judicial oversight of surveillance. In practice, it became a rubber stamp. Between 1979 and 2012, the FISC received 33,900 applications for surveillance warrants. It approved 33,891. It rejected 9. A court that approves 99.97% of requests is not providing oversight — it is providing legal cover.

The court's interpretations of the law were classified. So judges on regular courts who might hear cases involving surveillance evidence often did not know what the legal framework actually said. Defense attorneys representing clients whose prosecution depended on NSA-gathered evidence were not told the evidence existed, let alone how it was gathered.

**What Snowden Revealed**

Edward Snowden, an NSA contractor, copied classified documents in 2013 and gave them to journalists Glenn Greenwald and Laura Poitras. What they published revealed: the bulk phone metadata collection program, PRISM, XKeyscore, the scope of international surveillance including tapping of foreign leaders including German Chancellor Angela Merkel, and the existence of the secret FISC opinions interpreting the law in ways Congress had not intended.

The government's response: Snowden was charged under the Espionage Act. Director of National Intelligence James Clapper, who had publicly lied to Congress about the phone metadata program ("Does the NSA collect any type of data at all on millions, or hundreds of millions, of Americans?" — "No, sir"), faced no consequences for perjury. Clapper was later appointed to a government advisory board.

**The Legal Aftermath**

In 2020, the Ninth Circuit Court of Appeals ruled that the bulk phone metadata collection program was illegal and that the intelligence officials who had assured Congress it was legal had lied. The program had been collecting data for seven years by that point. Nobody was prosecuted. The data collected was not deleted.

**Stingrays: Surveillance on the Street**

IMSI-catchers — commonly called Stingrays — are devices that mimic cell towers, forcing all nearby phones to connect to them and revealing phone numbers, locations, and in some models, call content. They were developed by Harris Corporation for military use. They were then sold to over 70 federal agencies and local police departments across the country — often with non-disclosure agreements that required local police to keep their use secret from prosecutors and defense attorneys, and in some cases from judges.

Cases built with Stingray evidence were prosecuted without disclosing to defense attorneys how the location information was obtained. In some jurisdictions, prosecutors dropped cases rather than reveal the technology's use. The existence of these devices was only widely acknowledged after they were exposed by journalists and FOIA requests.

**The Dragnet Effect**

Mass surveillance creates what researchers call the "dragnet effect." When everyone is collected, innocent people are caught in investigations because they happen to be near a target, communicate with someone who communicates with someone under surveillance, or fit a profile generated by algorithm. In the years after 9/11, thousands of Muslim Americans were subjected to surveillance, informant programs, and "preemptive prosecution" of people who had committed no crime but whose associations, speech, or religious practice made them algorithmic targets.

The FBI's "suspicious activity reporting" program instructs local law enforcement to report behaviors including: taking photographs, drawing diagrams, making notes, using binoculars, and standing outside buildings. These behaviors, reported on any American, can open an FBI file and trigger surveillance.
""",
        caseStudy: SSCaseStudy(
            era: "2001–Present",
            title: "The Muslim Community Surveillance Programs",
            whatHappened: "Post-9/11, the NYPD Demographics Unit (later renamed) mapped Muslim communities in New York — mosques, restaurants, schools, student associations — without any evidence of criminal activity. Informants were deployed in mosques. FBI informants were instructed to find or create terrorist plots to prosecute. In multiple documented cases, FBI informants provided the weapons, financing, and operational planning for 'terrorist plots' — then the person they recruited was arrested. These are called 'sting operations.'",
            whoItTargeted: "Muslim Americans across economic classes, countries of origin, and political views — targeted solely on the basis of religion. The NYPD Demographics Unit created 'ancestries of interest' — a list of ethnicities deemed inherently suspicious.",
            legalCover: "Post-9/11 security mandate. 'Terrorism prevention.' The surveillance required no probable cause and was conducted on communities, not suspects.",
            outcome: "The NYPD Demographics Unit was disbanded in 2014 after sustained pressure. Multiple 'sting operation' prosecutions have been challenged as entrapment. Courts have largely upheld them. The legal framework that enabled the programs remains intact.",
            parallelsToday: "Palantir's ImmigrationOS, the ICE use of commercial location data, facial recognition in protests — the architecture built post-9/11 is being applied to new targets."
        ),
        timeline: [
            SSTimelineEvent(year: "2001", event: "PATRIOT Act passed — 45 days after 9/11", significance: "Extended surveillance powers passed with minimal debate. Most provisions still active."),
            SSTimelineEvent(year: "2001–2007", event: "Warrantless wiretapping program (STELLARWIND)", significance: "NSA collected content of American communications without any court order. Bush administration approved it in secret."),
            SSTimelineEvent(year: "2013", event: "Snowden revelations", significance: "First public exposure of the full scope of NSA bulk collection programs."),
            SSTimelineEvent(year: "2015", event: "USA FREEDOM Act", significance: "Ended bulk phone metadata collection — but NSA could still collect records via carriers."),
            SSTimelineEvent(year: "2020", event: "Ninth Circuit rules phone metadata program illegal", significance: "Seven years of illegal collection retroactively acknowledged. Zero accountability.")
        ],
        patternAlert: "When officials say 'we only target bad actors' about programs that collect data on everyone, they are describing the use phase, not the collection phase. Collection first, targeting second — that's the actual sequence.",
        sovereigntyTip: "Signal encrypts message content AND metadata (who you message, when). Standard SMS shows carriers — and anyone with legal or technical access to carrier data — exactly who you talk to and when. That metadata builds a social graph of your entire life.",
        reflectionPrompt: "James Clapper lied to Congress about mass surveillance. Edward Snowden exposed it. Clapper was appointed to an advisory board. Snowden was charged under the Espionage Act and lives in exile. What does the outcome of those two choices tell you about what this system values?"
    ),

    // MARK: - LESSON 4
    SSLesson(
        id: "ss_04",
        lessonNumber: 4,
        title: "The Modern Stack",
        subtitle: "Palantir, Facial Recognition, and the Data Fusion Era",
        hook: "Old surveillance required agents with binoculars and wiretaps. Modern surveillance runs on data you already gave away. Your phone's GPS is always on. Your face is in every database. Your purchasing history is for sale. What used to require a COINTELPRO field team of dozens working for years can now be done in real time by an algorithm on a commercial platform. The infrastructure is no longer being built. It is built. And it is being used right now.",
        body: """
**The Palantir Architecture**

Palantir Technologies was co-founded by Peter Thiel in 2003 with early CIA funding. Its core product is a "data fusion" platform: a system that ingests information from hundreds of different sources — government databases, commercial data brokers, social media, license plate readers, phone location data, immigration records, employment records, educational records, healthcare records — and presents it as a single unified picture of a person.

The company received a $30 million contract from ICE in April 2025 for a platform called ImmigrationOS (Immigration Lifecycle Operating System). An additional $29.9 million task order followed in October 2025. The existing contract that ImmigrationOS builds on has a current total of $139.3 million. A new Department of Homeland Security blanket purchase agreement announced February 19, 2026 gives DHS the ability to purchase up to $1 billion in Palantir services over five years.

ImmigrationOS is described in government documents as providing "near real-time visibility" into individual movements and as enabling "targeting and enforcement prioritization." It includes an AI tool called ELITE (Enhanced Leads Identification & Targeting for Enforcement) that generates "address confidence scores" — a 0–100% probability estimate that a specific person is at a specific location — and produces "geospatial heat-maps" of neighborhoods.

**Commercial Location Data**

Your phone's GPS location data is collected by apps — weather apps, games, retail apps — and sold to data brokers. Data brokers sell it to anyone who can pay: marketers, private investigators, insurance companies, and government agencies. ICE has purchased commercial location data from companies including Venntel and Babel Street. This allows the government to obtain location history without a warrant, because it's purchasing commercial data rather than conducting government surveillance.

In 2018, the Supreme Court ruled in Carpenter v. United States that law enforcement needs a warrant to obtain cell-site location information from carriers. The commercial data broker loophole allows agencies to sidestep this ruling by purchasing the same data from third parties.

**Facial Recognition: The Permanent ID**

Facial recognition systems can identify individuals from security camera footage, photos posted to social media, driver's license databases, and photos from other government ID programs. Clearview AI scraped 30+ billion photos from social media platforms and created a searchable database sold to law enforcement agencies. Over 3,000 agencies in the United States have used it.

The accuracy rates are not equal across demographics. Studies by MIT and NIST have consistently found that facial recognition systems have significantly higher error rates for Black and brown individuals — up to 10-34 times higher misidentification rates. Multiple people have been wrongfully arrested because facial recognition produced a false match.

Robert Williams was arrested in Detroit in 2020 after a facial recognition system incorrectly identified him as a suspect in a theft. He was held for 30 hours before the investigating detective acknowledged the identification didn't hold up. Similar wrongful arrests have occurred in New Orleans and Georgia.

**Predictive Policing**

Algorithms that predict where crime will occur and who is likely to commit crime are now deployed by police departments in dozens of cities. These systems use historical arrest data as training input. Historical arrest data reflects decades of racially biased policing. The algorithm learns from that data and recommends increased policing in the same communities — which increases arrests in those communities — which feeds back into the training data. The result is mathematical laundering of human bias: the system's outputs look objective because they come from an algorithm.

**Data Integration = No More Safe Havens**

Pre-digital surveillance had gaps — a person could move, change their name, avoid certain record systems, and become harder to track. Modern data fusion closes those gaps. Your social media is linked to your phone number, which is linked to your email, which is linked to your financial records, which is linked to your location history. Each data point alone reveals little. Fused together, they produce a profile more detailed than anything a surveillance team of the 1960s could compile in years — generated automatically and continuously.

**Biometric Data: The Frontier**

Facial recognition is one biometric identifier. The emerging frontier includes: gait recognition (identifying individuals by how they walk, from surveillance camera footage without requiring a clear face shot), voice recognition (your voice print is unique and many devices are always listening), DNA databases (23andMe's genetic database was breached in 2023, exposing data on 6.9 million users — this data, once collected, can't be uncollected), and physiological stress markers (some systems claim to identify suspicious individuals by elevated heart rate or gait changes).

**What This Means for You**

The data you generate in your daily life — not your political activity, not your associations, just your ordinary movements and digital behavior — is already being collected, sold, fused, and made available to agencies whose use of it is subject to minimal oversight. This is not a future risk. It is current operating reality.
""",
        caseStudy: SSCaseStudy(
            era: "2017–Present",
            title: "The Standing Rock Surveillance",
            whatHappened: "During the Dakota Access Pipeline protests at Standing Rock in 2016–2017, protesters (called 'water protectors') were subjected to aerial surveillance by military aircraft, social media monitoring, infiltration by informants, and coordination between private security firms hired by the pipeline company and local law enforcement. The company TigerSwan, hired by Energy Transfer Partners, produced intelligence reports describing the protest movement as 'jihadist' and coordinated surveillance across state lines. A license plate reader tracked vehicles entering the protest camp.",
            whoItTargeted: "Indigenous activists, environmental protesters, journalists, and legal observers. Legal observers — lawyers present to document civil rights violations — were specifically surveilled.",
            legalCover: "Safety and law enforcement. The private security component allowed the pipeline company to conduct surveillance without the legal constraints on government actors.",
            outcome: "Over 800 people were arrested. Multiple criminal cases were dismissed. TigerSwan's surveillance documents were obtained and published by The Intercept. No accountability for the surveillance operations.",
            parallelsToday: "Private surveillance infrastructure working alongside government agencies with fewer legal constraints is now standard practice. The 'private' designation is used as a workaround for Fourth Amendment protections."
        ),
        timeline: [
            SSTimelineEvent(year: "2013", event: "Clearview AI begins scraping social media faces", significance: "A database of 30B+ faces built without consent from any of the photographed individuals."),
            SSTimelineEvent(year: "2018", event: "Carpenter v. United States", significance: "Supreme Court rules warrant needed for carrier location data. Commercial data broker loophole immediately exploited."),
            SSTimelineEvent(year: "2020", event: "Robert Williams wrongful arrest from facial recognition", significance: "Documented case of AI misidentification leading to detention of an innocent person."),
            SSTimelineEvent(year: "2025", event: "Palantir ImmigrationOS — $30M ICE contract", significance: "Near real-time AI targeting system deployed for immigration enforcement."),
            SSTimelineEvent(year: "2026", event: "DHS $1B Palantir purchase agreement", significance: "Department-wide contract covering all DHS agencies for five years.")
        ],
        patternAlert: "When surveillance is conducted through private companies rather than government agencies directly, the constitutional protections that limit government surveillance often don't apply. 'We bought the data' is not the same as 'we didn't surveil you.'",
        sovereigntyTip: "Your phone's app permissions are the front door to your location data. Go to Settings → Privacy → Location Services right now. Every app with 'Always On' access is a data point being sold. Change everything to 'Never' or 'While Using.'",
        reflectionPrompt: "The same AI systems that calculate an 'address confidence score' for immigration enforcement could tomorrow calculate one for any other category. What categories would make you uncomfortable? Now ask: what stops them from being used that way?"
    ),

    // MARK: - LESSON 5
    SSLesson(
        id: "ss_05",
        lessonNumber: 5,
        title: "Your Sovereign Response",
        subtitle: "Practical Moves That Actually Work",
        hook: "Knowing the system exists is not the same as being helpless inside it. Every defense you activate raises the cost of tracking you. Mass surveillance is optimized for easy targets. The goal isn't invisibility — it's making yourself inconvenient enough that you fall off the automated lists. Here is a practical framework that actually works, organized from easiest to most advanced.",
        body: """
**Understanding Your Threat Model**

Before picking tools, understand what you're defending against. Mass surveillance (the bulk collection programs, the commercial data broker system, the algorithmic profiling) is different from targeted surveillance (an active investigation focused specifically on you). Most people's realistic threat is mass/automated surveillance — and that can be meaningfully disrupted with basic steps.

**Tier 1: The Basics (Do These First — High Impact, Low Effort)**

*Messaging: Use Signal.*
Signal is end-to-end encrypted with open-source code that anyone can audit. It collects only your phone number and registration date — no messages, no contacts, no metadata about who you talk to. WhatsApp is end-to-end encrypted for message content but collects extensive metadata (who you message, when, how often) owned by Meta. Standard SMS is unencrypted and visible to carriers, law enforcement, and anyone with legal or technical access. The switch to Signal takes ten minutes and is the single highest-impact privacy move most people can make.

*Phone: Disable 2G.*
2G is an outdated network protocol with known vulnerabilities exploited by IMSI-catchers (Stingrays). Modern phones support 4G/5G exclusively for legitimate calls. On iPhone: Settings → Cellular → Cellular Data Options → Voice & Data → Set to LTE or 5G. On Samsung: Settings → Connections → Mobile Networks → Network Mode → select LTE/5G only. On Pixel: Settings → Network & internet → SIMs → Preferred network type → LTE or 5G.

*Apps: Audit Your Permissions.*
Every app with location access is a data point potentially sold to data brokers. Check your permissions (Settings → Privacy → Location Services on iPhone; Settings → Apps → Permissions on Android) and set everything to 'Never' or 'While Using' unless you have a specific reason.

*Browser: Use Firefox + uBlock Origin.*
Your browser history is collected and sold. Firefox with the uBlock Origin extension blocks the most common tracking technologies. Alternatively, Brave browser blocks trackers by default.

*Search: Use DuckDuckGo.*
Google stores your search history and uses it to build an advertising profile. DuckDuckGo does not store or share your searches.

**Tier 2: The Next Level**

*VPN: Use ProtonVPN.*
A VPN encrypts your internet traffic and hides your IP address from websites and your internet provider. ProtonVPN is based in Switzerland, has a no-logs policy that has been independently audited, and offers a free tier. When you use public Wi-Fi without a VPN, your traffic is visible to anyone on the network and to the provider.

*Password Manager: Use Bitwarden or 1Password.*
Password reuse is how one data breach becomes access to all your accounts. A password manager generates and stores unique passwords for every site. Bitwarden is free and open-source. 1Password is paid and includes features like travel mode (hide certain vaults when crossing borders) and dark web monitoring.

*Email: Consider ProtonMail.*
Gmail scans email content for advertising targeting. ProtonMail uses end-to-end encryption and is based in Switzerland. A free tier is available. It's worth creating a Proton account for sensitive communications even if you keep Gmail for general use.

**Tier 3: High-Commitment Moves**

*Phone: Consider a Pixel with GrapheneOS.*
GrapheneOS is a security-hardened Android variant with strong privacy protections, developed by the open-source community. It eliminates Google services and their data collection. It runs on Pixel devices. Installing it requires technical comfort but is well-documented. This is the phone choice of journalists, security researchers, and privacy-maximalists.

*Events and Protests: Airplane Mode or Leave Your Phone.*
If you're attending a public protest or any event where your presence could be logged, airplane mode prevents network connections but does not prevent your device from being located by other means. Leaving your phone at home or in a Faraday bag (which blocks all signals) provides stronger protection.

*Cash and No-Loyalty Cards.*
Credit and debit transactions create a permanent, searchable record of your purchasing behavior. Loyalty cards are more data collection programs than discount systems. Cash leaves no trail.

**On the "If You Have Nothing to Hide" Objection**

Privacy is not about hiding wrongdoing. Privacy is about having a space to think, to explore ideas, to have conversations, to make mistakes, to change your mind — without those things being recorded, sold, analyzed, and potentially used against you in ways you can't foresee. Every therapist's office is private. Every legal consultation is protected. Every confessional is sealed. Privacy is the condition under which humans can actually be free. The question isn't whether you have something to hide. It's whether you want to live in a world where nothing is ever private.
""",
        caseStudy: SSCaseStudy(
            era: "2013–Present",
            title: "How Encryption Saved Journalists and Activists",
            whatHappened: "After the Snowden revelations, journalists reporting on sensitive national security topics began using encrypted communications as standard practice. The Intercept, the Guardian, the New York Times, and other major outlets created secure submission systems (SecureDrop) allowing sources to contact journalists without exposing their identity. Organizations including the ACLU began using Signal for attorney-client communications. Activists in multiple countries facing government surveillance shifted to encrypted tools.",
            whoItTargeted: "Journalists, lawyers, activists, and ordinary people who wanted communications their governments couldn't read.",
            legalCover: "N/A — this is the defense side.",
            outcome: "Multiple journalists have reported that encryption has been essential to protecting sources. The FBI has publicly complained about 'going dark' — the problem of encryption making surveillance harder. Their complaint is your evidence that it works.",
            parallelsToday: "The same tools available to national security journalists are available to you. Signal is free. Encryption works regardless of who you are."
        ),
        timeline: [
            SSTimelineEvent(year: "2014", event: "Signal released publicly", significance: "End-to-end encrypted messaging available to anyone with a smartphone."),
            SSTimelineEvent(year: "2016", event: "FBI demands Apple break iPhone encryption", significance: "Apple refuses. Federal judge sides with Apple. Precedent: encryption rights defended."),
            SSTimelineEvent(year: "2022", event: "Supreme Court: no warrant needed for third-party data", significance: "The commercial data loophole remains. Your data given to apps is not protected."),
            SSTimelineEvent(year: "2025", event: "GrapheneOS reaches 100,000 daily active users", significance: "Privacy-first mobile OS adoption growing as awareness increases.")
        ],
        patternAlert: "When governments or companies argue that encryption is only used by criminals, they are making an argument that would also eliminate: attorney-client privilege, medical record privacy, journalist source protection, and private conversation between any two people.",
        sovereigntyTip: "The single fastest high-impact move: Open your phone's app settings and remove location access from every app that doesn't require it to function. Weather apps, games, social media — none of these need your precise location. This takes 5 minutes and immediately reduces your commercial surveillance footprint.",
        reflectionPrompt: "What would change in how you communicate, associate, and move through the world if you knew with certainty that all of it was being recorded? If your answer is 'I'd do things differently' — then you're already experiencing the chilling effect. The question is what you're going to do about it."
    )
]
