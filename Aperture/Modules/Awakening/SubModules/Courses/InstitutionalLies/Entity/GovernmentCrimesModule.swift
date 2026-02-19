// GovernmentCrimesModule.swift
// Documented government atrocities with primary sources

import SwiftUI

struct GovernmentCrimesModule: Identifiable {

    let id: String
    let title: String
    let subtitle: String
    let icon: String
    let content: String
    let sources: [String]
    let keyFacts: [String]

}

extension GovernmentCrimesModule {

    static let all: [GovernmentCrimesModule] = [

        GovernmentCrimesModule(
            id: "tuskegee",
            title: "Tuskegee Syphilis Study",
            subtitle: "1932-1972 • 40 Years of Medical Abuse",
            icon: "cross.case.fill",
            content: """
The U.S. Public Health Service conducted a study on 399 Black men with syphilis in Tuskegee, Alabama from 1932 to 1972.

**What They Did:**
• Recruited men under the guise of free healthcare
• Never informed them they had syphilis
• Deliberately withheld treatment even after penicillin became available in 1947
• Prevented participants from accessing treatment elsewhere
• Continued for 25 years AFTER a cure existed

**The Death Toll:**
• 128 participants died directly from syphilis or related complications
• 40 wives were infected
• 19 children were born with congenital syphilis

**Why It Matters:**
This wasn't "oops" or incompetence. This was a sustained, deliberate decision by government health officials to let Black men die for data. The study continued across multiple presidential administrations.

The CDC's own website acknowledges this as fact, not conspiracy.
""",
            sources: [
                "CDC: The Tuskegee Timeline (cdc.gov/tuskegee)",
                "Presidential Apology by Bill Clinton, 1997",
                "National Archives: Tuskegee Study Records"
            ],
            keyFacts: [
                "40 years of deliberate medical abuse",
                "Treatment withheld even after cure existed",
                "128 deaths, 40 wives infected, 19 children born with disease",
                "Government officials knew and continued"
            ]
        ),

        GovernmentCrimesModule(
            id: "mkultra",
            title: "MKUltra",
            subtitle: "CIA Mind Control Experiments",
            icon: "brain.head.profile",
            content: """
From 1953 to 1973, the CIA conducted illegal experiments on unwitting American and Canadian citizens to develop mind control techniques.

**What They Did:**
• Administered LSD and other drugs without consent
• Used electroshock therapy
• Employed psychological torture and hypnosis
• Targeted prisoners, mental patients, and unknowing civilians
• Operated through 80+ institutions including universities and hospitals

**Key Cases:**
• Frank Olson: CIA scientist given LSD without consent, died falling from a hotel window (ruled homicide in 1994)
• Canadian victims at McGill University subjected to "psychic driving" - forced to listen to loops of messages for weeks

**The Cover-Up:**
• CIA Director Richard Helms ordered all MKUltra files destroyed in 1973
• Program only exposed through FOIA requests and the Church Committee
• Surviving documents show this was not rogue agents - it was official policy

**Why It Matters:**
When people say "the government would never experiment on its own citizens," this is the documented proof they did. The Senate Select Committee hearings are public record.
""",
            sources: [
                "Senate Select Committee on Intelligence, 1977",
                "CIA declassified documents (cia.gov)",
                "National Security Archive: MKUltra Collection"
            ],
            keyFacts: [
                "20 years of illegal mind control experiments",
                "Unknowing citizens drugged with LSD",
                "80+ institutions participated",
                "Director ordered files destroyed - partial records survived"
            ]
        ),

        GovernmentCrimesModule(
            id: "church_committee",
            title: "Church Committee Revelations",
            subtitle: "Intelligence Abuses Exposed",
            icon: "eye.trianglebadge.exclamationmark",
            content: """
The Church Committee (1975-1976) was a U.S. Senate investigation that exposed decades of illegal activities by the FBI, CIA, NSA, and IRS.

**What They Found:**

**COINTELPRO (FBI):**
• Systematic surveillance and disruption of civil rights groups
• Attempts to "neutralize" Martin Luther King Jr.
• Infiltration of anti-war movements
• Targeted harassment of American citizens

**Operation CHAOS (CIA):**
• Illegal domestic surveillance of American citizens
• Infiltration of student groups
• Violated the CIA's charter prohibiting domestic operations

**NSA Surveillance:**
• Project SHAMROCK: Mass interception of international telegrams
• Project MINARET: Monitoring American citizens without warrants

**Assassination Programs:**
• Documented CIA assassination plots against foreign leaders
• Castro, Lumumba, Trujillo, and others

**Why It Matters:**
Everything "conspiracy theorists" warned about in the 1960s was proven true by congressional investigation. The government was systematically violating citizens' rights while denying it publicly.
""",
            sources: [
                "U.S. Senate Church Committee Final Report, 1976",
                "Senate.gov Historical Office",
                "National Archives: Church Committee Records"
            ],
            keyFacts: [
                "FBI systematically targeted civil rights leaders",
                "CIA conducted illegal domestic surveillance",
                "NSA intercepted Americans' communications without warrants",
                "Assassination programs were official policy"
            ]
        ),

        GovernmentCrimesModule(
            id: "operation_northwoods",
            title: "Operation Northwoods",
            subtitle: "Proposed False Flag Against Americans",
            icon: "flag.filled.and.flag.crossed",
            content: """
In 1962, the Joint Chiefs of Staff proposed Operation Northwoods - a plan to commit acts of terrorism against American citizens and blame Cuba to justify an invasion.

**The Proposed Actions:**
• Sink boats of Cuban refugees (real or simulated)
• Hijack planes
• Blow up a U.S. ship in Guantanamo Bay
• Orchestrate violent terrorism in U.S. cities
• Kill American citizens and blame Cuba

**Key Quote from the Document:**
"We could develop a Communist Cuban terror campaign in the Miami area, in other Florida cities and even in Washington... The terror campaign could be pointed at refugees seeking haven in the United States."

**What Happened:**
• Plan was signed by Chairman of Joint Chiefs Lyman Lemnitzer
• Presented to Secretary of Defense Robert McNamara
• Rejected by President Kennedy
• Documents declassified in 1997

**Why It Matters:**
The U.S. military's highest ranking officers formally proposed murdering American citizens as a "false flag" operation. This wasn't a rogue element - it was official policy submitted through proper channels.
""",
            sources: [
                "National Security Archive: Operation Northwoods Documents",
                "JFK Library: Declassified Records",
                "U.S. National Archives"
            ],
            keyFacts: [
                "Joint Chiefs proposed terrorism against Americans",
                "Plan included killing U.S. citizens",
                "Formally submitted through military channels",
                "Rejected by Kennedy, declassified 1997"
            ]
        ),

        GovernmentCrimesModule(
            id: "gulf_of_tonkin",
            title: "Gulf of Tonkin",
            subtitle: "The Lie That Started Vietnam",
            icon: "water.waves",
            content: """
On August 4, 1964, President Johnson announced that North Vietnamese boats had attacked U.S. destroyers in the Gulf of Tonkin. This "attack" was used to justify the Vietnam War.

**The Truth:**
• The August 2 incident was provoked by U.S./South Vietnamese operations
• The August 4 "attack" never happened
• NSA intercepted communications were misinterpreted or fabricated
• Johnson knew the evidence was questionable but proceeded anyway

**Declassified Documents Reveal:**
• NSA historian Robert Hanyok found agency deliberately skewed intelligence
• Secretary of Defense McNamara later admitted doubts about the second attack
• The Pentagon Papers confirmed systematic deception

**The Cost of the Lie:**
• 58,220 American soldiers killed
• 2-3 million Vietnamese civilians killed
• Massive environmental destruction
• Generational trauma on both sides

**Why It Matters:**
A war that killed millions was justified by an event that didn't happen. Government officials knew and lied. This is documented in declassified NSA records and the Pentagon Papers.
""",
            sources: [
                "NSA Declassified: Gulf of Tonkin Documents",
                "Pentagon Papers (National Archives)",
                "Robert McNamara's memoir 'In Retrospect'"
            ],
            keyFacts: [
                "August 4 attack never happened",
                "NSA deliberately skewed intelligence",
                "58,220 Americans died for a lie",
                "Declassified documents prove deception"
            ]
        )

    ]

}
