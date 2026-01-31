// KnowYourRightsCourse.swift
// Your rights exist whether you know them or not
// But they only protect you if you exercise them

import SwiftUI

struct KnowYourRightsCourse: View {
    
    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                // Course Header
                courseHeader
                
                // Emergency Quick Reference
                emergencyCard
                
                // Lessons
                ForEach(Array(lessons.enumerated()), id: \.offset) { index, lesson in
                    NavigationLink(destination: RightsLessonView(lesson: lesson, index: index + 1)) {
                        lessonRow(lesson, index: index)
                    }
                }
                
                // Resources
                resourcesSection
            }
        }
        .background(Color.black.ignoresSafeArea())
        .navigationTitle("Know Your Rights")
        .navigationBarTitleDisplayMode(.inline)
    }
    
    // MARK: - Header
    
    private var courseHeader: some View {
        VStack(spacing: 16) {
            ZStack {
                Circle()
                    .fill(Color.blue.opacity(0.2))
                    .frame(width: 100, height: 100)
                
                Image(systemName: "shield.lefthalf.filled")
                    .font(.system(size: 48))
                    .foregroundColor(.blue)
            }
            
            Text("Know Your Rights")
                .font(.system(size: 26, weight: .bold))
                .foregroundColor(.white)
            
            Text("Your rights exist whether you know them or not.\nBut they only protect you if you exercise them.")
                .font(.system(size: 14))
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
            
            // Key reminder
            HStack(spacing: 8) {
                Image(systemName: "exclamationmark.triangle.fill")
                    .foregroundColor(.yellow)
                Text("Stay calm. Assert rights clearly. Document everything.")
                    .font(.system(size: 12, weight: .medium))
                    .foregroundColor(.yellow)
            }
            .padding()
            .background(Color.yellow.opacity(0.1))
            .cornerRadius(10)
            
            HStack {
                Text("12 Lessons")
                    .font(.system(size: 12, weight: .medium))
                    .foregroundColor(.gray)
                Spacer()
                Text("~75 min")
                    .font(.system(size: 12, weight: .medium))
                    .foregroundColor(.gray)
            }
            .padding(.horizontal)
        }
        .padding()
    }
    
    // MARK: - Emergency Card
    
    private var emergencyCard: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Image(systemName: "bolt.shield.fill")
                    .foregroundColor(.red)
                Text("EMERGENCY QUICK REFERENCE")
                    .font(.system(size: 14, weight: .black))
                    .foregroundColor(.red)
            }
            
            VStack(alignment: .leading, spacing: 10) {
                quickRight("You have the right to remain SILENT")
                quickRight("You do NOT have to consent to searches")
                quickRight("You can ask: \"Am I free to go?\"")
                quickRight("You can say: \"I do not consent to this search\"")
                quickRight("You can say: \"I want to speak with a lawyer\"")
                quickRight("You can record police in public")
            }
            
            Text("Memorize these. They could save your life or freedom.")
                .font(.system(size: 11, weight: .medium))
                .foregroundColor(.orange)
        }
        .padding()
        .background(Color.red.opacity(0.1))
        .cornerRadius(16)
        .overlay(
            RoundedRectangle(cornerRadius: 16)
                .stroke(Color.red.opacity(0.5), lineWidth: 2)
        )
        .padding()
    }
    
    private func quickRight(_ text: String) -> some View {
        HStack(alignment: .top, spacing: 10) {
            Image(systemName: "checkmark.shield.fill")
                .foregroundColor(.green)
                .font(.system(size: 14))
            Text(text)
                .font(.system(size: 13, weight: .semibold))
                .foregroundColor(.white)
        }
    }
    
    // MARK: - Lesson Row
    
    private func lessonRow(_ lesson: RightsLesson, index: Int) -> some View {
        HStack(spacing: 16) {
            ZStack {
                Circle()
                    .fill(lesson.color.opacity(0.2))
                    .frame(width: 48, height: 48)
                Image(systemName: lesson.icon)
                    .font(.system(size: 20))
                    .foregroundColor(lesson.color)
            }
            
            VStack(alignment: .leading, spacing: 4) {
                Text(lesson.title)
                    .font(.system(size: 15, weight: .semibold))
                    .foregroundColor(.white)
                Text(lesson.subtitle)
                    .font(.system(size: 12))
                    .foregroundColor(.gray)
                    .lineLimit(1)
            }
            
            Spacer()
            
            if lesson.critical {
                Text("CRITICAL")
                    .font(.system(size: 9, weight: .black))
                    .foregroundColor(.white)
                    .padding(.horizontal, 6)
                    .padding(.vertical, 3)
                    .background(Color.red)
                    .cornerRadius(4)
            }
            
            Image(systemName: "chevron.right")
                .foregroundColor(.gray)
        }
        .padding()
        .background(Color.white.opacity(0.03))
    }
    
    // MARK: - Resources
    
    private var resourcesSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Emergency Resources")
                .font(.system(size: 16, weight: .bold))
                .foregroundColor(.white)
            
            VStack(spacing: 8) {
                resourceRow("ACLU Know Your Rights", "aclu.org/know-your-rights", .blue)
                resourceRow("National Lawyers Guild Hotline", "nlg.org", .green)
                resourceRow("United We Dream (Immigration)", "unitedwedream.org", .purple)
                resourceRow("RAICES Texas (Immigration)", "raicestexas.org", .orange)
                resourceRow("Flex Your Rights", "flexyourrights.org", .cyan)
            }
        }
        .padding()
    }
    
    private func resourceRow(_ title: String, _ url: String, _ color: Color) -> some View {
        HStack(spacing: 12) {
            Image(systemName: "link.circle.fill")
                .foregroundColor(color)
            VStack(alignment: .leading) {
                Text(title)
                    .font(.system(size: 13, weight: .medium))
                    .foregroundColor(.white)
                Text(url)
                    .font(.system(size: 11))
                    .foregroundColor(.gray)
            }
            Spacer()
            Image(systemName: "arrow.up.right.square")
                .foregroundColor(.gray)
                .font(.system(size: 12))
        }
        .padding(.vertical, 4)
    }
    
    // MARK: - Lessons Data
    
    private var lessons: [RightsLesson] {
        [
            RightsLesson(
                title: "The Constitution in 10 Minutes",
                subtitle: "The rights you have on paper",
                icon: "doc.text.fill",
                color: .blue,
                critical: false,
                content: """
                **Your Constitutional Rights**
                
                The Constitution and its Amendments guarantee specific rights. Here are the ones you need to know:
                
                ---
                
                **1st Amendment - Expression**
                
                • Freedom of speech
                • Freedom of the press
                • Freedom of religion
                • Right to peaceful assembly
                • Right to petition the government
                
                **What this means:**
                - You can criticize the government
                - You can protest peacefully
                - You can record police in public
                - You can practice any religion (or none)
                
                ---
                
                **4th Amendment - Search & Seizure**
                
                > "The right of the people to be secure in their persons, houses, papers, and effects, against unreasonable searches and seizures, shall not be violated."
                
                **What this means:**
                - Police generally need a warrant to search
                - You can refuse consent to search
                - There are exceptions (more in later lessons)
                
                ---
                
                **5th Amendment - Self-Incrimination**
                
                • Right to remain silent
                • Right to due process
                • Protection against double jeopardy
                • Right to grand jury for serious crimes
                
                **What this means:**
                - You don't have to answer police questions
                - "Taking the Fifth" is not admission of guilt
                - You can't be tried twice for the same crime
                
                ---
                
                **6th Amendment - Criminal Proceedings**
                
                • Right to speedy, public trial
                • Right to impartial jury
                • Right to know charges against you
                • Right to confront witnesses
                • Right to an attorney
                
                **What this means:**
                - You can have a lawyer present during questioning
                - If you can't afford one, one will be provided (for criminal cases)
                
                ---
                
                **14th Amendment - Equal Protection**
                
                • Equal protection under the law
                • Due process applies to states
                • Citizenship rights
                
                **What this means:**
                - States can't deny you rights the federal government can't
                - Laws must apply equally to everyone
                
                ---
                
                **Important Reality Check:**
                
                These rights exist ON PAPER. In practice:
                - Police may violate them anyway
                - You may need to assert them clearly
                - You may need to fight in court later
                - Knowing them can prevent violations
                
                **Your job is to:**
                1. Know your rights
                2. Assert them calmly and clearly
                3. Document any violations
                4. Fight later with a lawyer if needed
                """,
                keyTakeaway: "The Constitution guarantees rights, but they only protect you if you know them and assert them. Knowledge is your first defense."
            ),
            RightsLesson(
                title: "Police Encounters: The Basics",
                subtitle: "What to do when stopped",
                icon: "figure.stand",
                color: .orange,
                critical: true,
                content: """
                **Types of Police Encounters**
                
                There are three types of police encounters, and your rights differ for each:
                
                ---
                
                **1. Consensual Encounter**
                
                Police can approach anyone and ask questions.
                
                **Your rights:**
                - You do NOT have to answer
                - You do NOT have to stop
                - You can ask: "Am I being detained?"
                - You can walk away if not detained
                
                ---
                
                **2. Detention (Terry Stop)**
                
                Police can briefly detain you if they have "reasonable suspicion" of criminal activity.
                
                **Your rights:**
                - You still don't have to answer questions
                - You can ask: "Am I free to go?"
                - You do NOT have to consent to search
                - You should stay calm and not resist
                
                **Their limits:**
                - Can only detain briefly
                - Can pat down outer clothing for weapons (Terry frisk)
                - Cannot search without consent or probable cause
                
                ---
                
                **3. Arrest**
                
                Police can arrest you with probable cause or a warrant.
                
                **Your rights:**
                - Right to remain silent
                - Right to an attorney
                - Right to know charges (eventually)
                - Right to phone call (varies by state)
                
                **What to do:**
                - Do NOT resist (even if wrongful)
                - Say: "I am invoking my right to remain silent"
                - Say: "I want a lawyer"
                - Do not answer questions without lawyer
                
                ---
                
                **The Magic Words:**
                
                Memorize and use these exact phrases:
                
                ✓ "Am I being detained, or am I free to go?"
                ✓ "I do not consent to any searches."
                ✓ "I am going to remain silent."
                ✓ "I want a lawyer."
                
                ---
                
                **Critical Safety Rules:**
                
                1. **Stay calm** - Escalation is dangerous
                2. **Keep hands visible** - Don't reach for anything
                3. **Don't run** - Running creates "reasonable suspicion"
                4. **Don't resist** - Even wrongful arrest, fight in court
                5. **Don't lie** - Better to stay silent than lie
                6. **Document later** - Write everything down ASAP
                
                ---
                
                **Recording Police:**
                
                You have the right to record police in public:
                - Keep phone visible (don't hide it)
                - Stay at safe distance
                - Don't interfere with their duties
                - Live stream if possible (can't delete evidence)
                
                ---
                
                **After the Encounter:**
                
                1. Write down everything immediately
                2. Get witness names and contact info
                3. Photograph any injuries or damage
                4. Save any video/audio evidence
                5. File complaint if rights were violated
                6. Contact lawyer if arrested
                """,
                keyTakeaway: "Know the three types of encounters. Use the magic words. Stay calm. Don't consent to searches. Assert your rights, then comply physically while fighting legally."
            ),
            RightsLesson(
                title: "Traffic Stops",
                subtitle: "Your rights in your vehicle",
                icon: "car.fill",
                color: .red,
                critical: true,
                content: """
                **Traffic Stop Protocol**
                
                Traffic stops are one of the most common—and dangerous—police encounters.
                
                ---
                
                **When Pulled Over:**
                
                1. **Pull over safely** - Use turn signal, find safe spot
                2. **Stay in the car** - Unless asked to exit
                3. **Hands on wheel** - Keep them visible
                4. **Turn on interior light** (at night)
                5. **Don't reach for anything** until asked
                
                ---
                
                **What You Must Provide:**
                
                In most states, you MUST provide:
                - Driver's license
                - Registration
                - Proof of insurance
                
                Tell the officer where documents are BEFORE reaching for them.
                
                "My registration is in my glove box. Is it okay if I reach for it?"
                
                ---
                
                **What You Don't Have to Do:**
                
                - Answer questions about where you're going
                - Answer questions about where you've been
                - Consent to a search of your car
                - Take field sobriety tests (but consequences vary)
                - Admit to anything
                
                ---
                
                **Vehicle Searches:**
                
                Police can search your car WITHOUT consent if:
                - They see contraband in plain view
                - They have probable cause (smell marijuana, etc.)
                - You're arrested (incident to arrest)
                - They're doing an inventory search after towing
                
                Police CANNOT search your car just because:
                - They pulled you over
                - You refused consent
                - You seem nervous
                
                **Always say:** "I do not consent to any searches."
                
                Even if they search anyway, your statement preserves your rights in court.
                
                ---
                
                **Passengers:**
                
                If you're a passenger:
                - You can ask if you're free to go
                - You don't have to answer questions
                - You may have to provide ID (depends on state)
                - You can record the encounter
                
                ---
                
                **Checkpoints:**
                
                DUI/Immigration checkpoints are generally legal, but:
                - You must stop
                - You must show license
                - You do NOT have to answer questions
                - You do NOT have to consent to search
                
                ---
                
                **If Asked to Exit:**
                
                Police can order you out of the car (Pennsylvania v. Mimms).
                
                If asked to exit:
                1. Comply (it's legally required)
                2. Lock your car
                3. Close windows
                4. Do not consent to search
                
                ---
                
                **Tickets and Citations:**
                
                - Sign the ticket (it's not admission of guilt)
                - Refusing to sign can lead to arrest
                - Fight the ticket in court, not on the street
                - Note the officer's name and badge number
                
                ---
                
                **After the Stop:**
                
                1. Note time, location, officer's name/badge
                2. Write down everything said
                3. Get dashcam footage if you have it
                4. File complaint if rights violated
                5. Contest ticket if appropriate
                """,
                keyTakeaway: "Provide license, registration, insurance. Keep hands visible. Don't consent to searches. Don't answer questions. Fight tickets in court, not on the roadside."
            ),
            RightsLesson(
                title: "ICE & Immigration Encounters",
                subtitle: "Rights for citizens and non-citizens",
                icon: "globe.americas.fill",
                color: .purple,
                critical: true,
                content: """
                **Everyone Has Rights**
                
                The Constitution protects everyone on U.S. soil, regardless of immigration status.
                
                This includes:
                - Citizens
                - Legal residents
                - Undocumented individuals
                - Tourists and visitors
                
                ---
                
                **Your Rights with ICE:**
                
                **You have the right to:**
                - Remain silent
                - Refuse to open your door
                - Refuse consent to search
                - Speak to a lawyer
                - Know if you're under arrest
                - Contact your consulate (if not US citizen)
                
                **You do NOT have to:**
                - Answer questions about your immigration status
                - Show documents to prove status
                - Sign anything
                - Let ICE into your home
                
                ---
                
                **At Your Door:**
                
                ICE shows up at your home. What do?
                
                1. **Don't open the door**
                2. Ask through the door: "Do you have a warrant?"
                3. If yes: "Please slide it under the door"
                
                **Check the warrant:**
                - Is it signed by a JUDGE? (Not just ICE agent)
                - Does it have YOUR name and address?
                - Is it current?
                
                **ICE administrative warrants (Form I-200) do NOT allow entry.**
                Only a warrant signed by a judge does.
                
                If no valid warrant: "I do not consent to entry."
                
                ---
                
                **In Public:**
                
                If stopped by ICE in public:
                
                - You can remain silent
                - You can say: "I do not consent to a search"
                - You can ask: "Am I free to go?"
                - You should NOT run
                - You should NOT lie about citizenship
                - You should NOT show fake documents
                
                ---
                
                **At Work:**
                
                ICE can enter PUBLIC areas of a workplace.
                
                For non-public areas, they need:
                - Consent from employer
                - A warrant
                
                **Know your workplace raid rights:**
                - You can remain silent
                - You can walk away from public area
                - You can refuse to sign anything
                - You can call a lawyer
                
                ---
                
                **If Detained:**
                
                Say: "I want to speak to a lawyer. I choose to remain silent."
                
                Then remain silent.
                
                **Do not sign anything** without understanding it completely and consulting a lawyer.
                
                **Watch out for:**
                - Voluntary departure forms
                - Stipulated removal orders
                - Any document you don't understand
                
                Signing can waive your rights to a hearing.
                
                ---
                
                **Know Your Number:**
                
                Memorize a lawyer or family member's phone number.
                
                You have the right to make phone calls.
                
                ICE must let you contact:
                - An attorney
                - Your consulate (if you request)
                
                ---
                
                **Prepare in Advance:**
                
                1. Know your rights (you're doing that now!)
                2. Have emergency contacts memorized
                3. Have power of attorney for children
                4. Have copies of important documents with trusted person
                5. Know local immigrant rights organizations
                6. Have a lawyer's number ready
                
                ---
                
                **Family Preparedness:**
                
                If you're at risk of detention:
                - Designate emergency childcare
                - Sign power of attorney for kids
                - Have school know who can pick up children
                - Have copies of birth certificates, IDs accessible
                - Have financial affairs in order
                
                ---
                
                **Resources:**
                
                - United We Dream: unitedwedream.org
                - RAICES: raicestexas.org  
                - ACLU Immigrant Rights: aclu.org
                - National Immigration Law Center: nilc.org
                """,
                keyTakeaway: "Everyone has constitutional rights regardless of status. Don't open the door without a judge-signed warrant. Remain silent. Don't sign anything. Have an emergency plan ready."
            ),
            RightsLesson(
                title: "Search & Seizure Deep Dive",
                subtitle: "When can police search?",
                icon: "magnifyingglass",
                color: .green,
                critical: false,
                content: """
                **The 4th Amendment**
                
                > "The right of the people to be secure in their persons, houses, papers, and effects, against unreasonable searches and seizures, shall not be violated."
                
                This means police generally need a warrant. But there are exceptions.
                
                ---
                
                **When Police Need a Warrant:**
                
                Generally, police need a warrant to search:
                - Your home
                - Your car (with exceptions)
                - Your phone
                - Your person beyond pat-down
                - Your containers and bags
                
                ---
                
                **Exceptions (No Warrant Needed):**
                
                **1. Consent**
                
                If you say "yes" to a search, no warrant needed.
                
                NEVER consent. Even if you have nothing to hide:
                - Consenting waives your rights
                - You don't know what "evidence" might be planted
                - You don't know what might be misinterpreted
                
                **Always say:** "I do not consent to any searches."
                
                ---
                
                **2. Plain View**
                
                If police can see contraband from a legal vantage point, they can seize it.
                
                Example: Officer pulls you over, sees drugs on passenger seat.
                
                **Tip:** Don't leave anything visible in your car.
                
                ---
                
                **3. Search Incident to Arrest**
                
                If you're arrested, police can search:
                - Your person
                - Area within your immediate control
                - Your car (if arrested in/near it)
                
                ---
                
                **4. Exigent Circumstances**
                
                Police can search without warrant if:
                - Evidence is being destroyed
                - Someone is in danger
                - Suspect is fleeing
                
                Courts scrutinize this heavily.
                
                ---
                
                **5. Terry Stop (Pat-Down)**
                
                During a lawful detention, police can:
                - Pat down outer clothing
                - Check for weapons only
                
                They cannot:
                - Reach into pockets (unless they feel a weapon)
                - Search belongings
                - Conduct full search
                
                ---
                
                **6. Automobile Exception**
                
                Cars have less protection than homes because they're mobile.
                
                Police can search a car without warrant if they have probable cause.
                
                "Probable cause" can include:
                - Smell of marijuana
                - Visible contraband
                - Drug dog alert
                
                **Still say:** "I do not consent to this search."
                
                This preserves your rights even if they search anyway.
                
                ---
                
                **Your Home: The Strongest Protection**
                
                Your home has the HIGHEST 4th Amendment protection.
                
                Without a warrant, police can only enter if:
                - You consent (DON'T)
                - They're in "hot pursuit" of fleeing suspect
                - There's an emergency (someone dying, etc.)
                
                **Never let police in without a warrant.**
                
                ---
                
                **What About Your Phone?**
                
                Riley v. California (2014): Police need a warrant to search your phone.
                
                **But:**
                - They can take it as evidence
                - They may try to get you to unlock it
                - Never consent to unlocking
                - Consider using strong passcode (5th Amendment may protect)
                
                ---
                
                **If They Search Anyway:**
                
                1. Clearly state: "I do not consent to this search"
                2. Do not physically resist
                3. Observe and remember everything
                4. Note badge numbers, officer names
                5. Get witnesses
                6. Fight it in court later
                """,
                keyTakeaway: "Never consent to searches. Say 'I do not consent' clearly, even if they search anyway. This preserves your rights for court."
            ),
            RightsLesson(
                title: "Your Right to Remain Silent",
                subtitle: "The most important right you have",
                icon: "speaker.slash.fill",
                color: .red,
                critical: true,
                content: """
                **The 5th Amendment Right**
                
                > "No person... shall be compelled in any criminal case to be a witness against himself."
                
                This is your most powerful right. Use it.
                
                ---
                
                **Why Silence Matters:**
                
                **Anything you say CAN and WILL be used against you.**
                
                This is not a formality. It's a warning:
                
                - Innocent statements can be twisted
                - Memory is imperfect under stress
                - Context can be removed
                - You can accidentally incriminate yourself
                - Police are trained to get you to talk
                
                ---
                
                **How to Invoke Your Right:**
                
                You must CLEARLY state your intention:
                
                ✓ "I am invoking my right to remain silent."
                ✓ "I choose to remain silent."
                ✓ "I'm not answering questions without a lawyer."
                
                Then: **Actually remain silent.**
                
                ---
                
                **Common Mistakes:**
                
                ❌ "I don't want to talk right now" (unclear)
                ❌ "I think I should have a lawyer" (unclear)
                ❌ Staying silent without invoking (courts may not protect)
                ❌ Talking after invoking (waives the right)
                
                ---
                
                **Police Interrogation Tactics:**
                
                Police are allowed to:
                - Lie to you ("Your friend already confessed")
                - Pretend to be sympathetic
                - Minimize the crime ("It's not a big deal")
                - Claim they have evidence they don't have
                - Keep questioning after you ask for a lawyer
                - Make you wait for hours
                
                **The only defense: SILENCE.**
                
                ---
                
                **What You Must Answer:**
                
                In most situations:
                - Your name (if required by state law during detention)
                - Driver's license info (during traffic stop)
                
                Everything else: SILENCE.
                
                "Where are you going?" → Silent
                "Where are you coming from?" → Silent
                "Do you have anything illegal?" → Silent
                "Why won't you answer if you're innocent?" → Silent
                
                ---
                
                **Miranda Warnings:**
                
                Police must read Miranda rights before custodial interrogation:
                - "You have the right to remain silent"
                - "Anything you say can be used against you"
                - "You have the right to an attorney"
                - "If you cannot afford one, one will be appointed"
                
                **But:**
                - They don't have to read Miranda during routine stops
                - Voluntary statements before Miranda can be used
                - Start protecting yourself immediately, don't wait
                
                ---
                
                **Invoke, Then Silence:**
                
                The pattern should be:
                
                1. "Am I being detained?"
                2. If yes: "I am invoking my right to remain silent."
                3. "I want a lawyer."
                4. Complete silence thereafter.
                
                No small talk. No explanations. No "just one thing."
                
                Silence.
                
                ---
                
                **It's Not Suspicious:**
                
                Remaining silent is:
                - Your constitutional right
                - Not evidence of guilt
                - What lawyers advise everyone to do
                - What police officers themselves would do
                
                Anyone who says "just cooperate if innocent" doesn't understand the system.
                
                ---
                
                **The Hard Truth:**
                
                Innocent people go to prison every year because they talked to police without a lawyer.
                
                False confessions happen, especially when:
                - People are exhausted
                - People are scared
                - People are young
                - People trust police to figure it out
                
                **Silence protects the innocent as much as the guilty.**
                """,
                keyTakeaway: "Invoke your right to silence clearly: 'I am invoking my right to remain silent. I want a lawyer.' Then actually remain silent. This is not suspicious—it's smart."
            ),
            RightsLesson(
                title: "Your Right to an Attorney",
                subtitle: "When and how to get a lawyer",
                icon: "person.text.rectangle.fill",
                color: .cyan,
                critical: false,
                content: """
                **The 6th Amendment Right**
                
                > "In all criminal prosecutions, the accused shall enjoy the right... to have the Assistance of Counsel for his defense."
                
                ---
                
                **When You Have the Right:**
                
                You have the right to an attorney:
                - During police interrogation (after arrest)
                - At all critical stages of criminal proceedings
                - At trial
                
                **Important:** Right to free attorney (public defender) only applies in CRIMINAL cases where jail is possible.
                
                ---
                
                **How to Invoke:**
                
                Say clearly:
                
                ✓ "I want a lawyer."
                ✓ "I won't answer questions without my lawyer present."
                ✓ "I'm invoking my right to an attorney."
                
                ---
                
                **What Happens After:**
                
                Once you invoke your right to an attorney:
                - Police must stop questioning
                - They cannot resume until lawyer is present
                - Anything obtained by continued questioning may be inadmissible
                
                **But:**
                - Police can still gather evidence other ways
                - They can still hold you
                - They may try to get you to waive the right
                
                Don't waive it.
                
                ---
                
                **Public Defenders:**
                
                If you can't afford a lawyer:
                - One will be appointed in criminal cases
                - You must request one
                - You may have to demonstrate inability to pay
                
                Public defenders are real lawyers. Many are excellent but overworked.
                
                ---
                
                **When to Get a Lawyer:**
                
                **Get a lawyer BEFORE you need one.**
                
                Consider having a lawyer's number ready if:
                - You're involved in activism/protest
                - You're an immigrant or have immigrant family
                - You work in cash business
                - You have any criminal history
                - You're a member of a targeted community
                
                ---
                
                **Types of Lawyers:**
                
                • **Criminal defense:** If accused of crime
                • **Immigration:** For ICE/deportation issues
                • **Civil rights:** For police misconduct claims
                • **Public defender:** Court-appointed for criminal
                
                ---
                
                **Finding a Lawyer:**
                
                - National Lawyers Guild: nlg.org
                - ACLU: aclu.org
                - Local bar association referral service
                - Legal aid organizations (income-based)
                - Immigration: CLINIC, RAICES
                
                ---
                
                **What a Lawyer Does:**
                
                A lawyer can:
                - Be present during questioning
                - Advise you what to say (or not say)
                - Negotiate with prosecutors
                - Review evidence against you
                - Fight illegal searches in court
                - Represent you at trial
                - Protect your rights throughout
                
                ---
                
                **The Cost Reality:**
                
                Lawyers are expensive. But:
                - Many offer free consultations
                - Some work on sliding scale
                - Public defenders are free if you qualify
                - Many civil rights cases are taken on contingency
                - Some organizations offer free help
                
                ---
                
                **The Takeaway:**
                
                Never talk to police about anything serious without a lawyer.
                
                Even if innocent.
                Especially if innocent.
                
                A lawyer's job is to protect your rights. Let them.
                """,
                keyTakeaway: "Say 'I want a lawyer' clearly and then stop talking. This is your right. Never talk to police about anything serious without an attorney present."
            ),
            RightsLesson(
                title: "Recording Police & Protests",
                subtitle: "Your First Amendment documentation rights",
                icon: "video.fill",
                color: .pink,
                critical: false,
                content: """
                **Your Right to Record**
                
                You have a First Amendment right to record police performing their duties in public.
                
                This has been affirmed by federal courts nationwide.
                
                ---
                
                **How to Record Safely:**
                
                1. **Keep phone visible** - Don't hide it
                2. **Maintain distance** - Don't interfere with their duties
                3. **Don't obstruct** - Don't physically block police
                4. **Stay calm** - Don't escalate
                5. **Know your state's audio laws** - Some require consent
                
                ---
                
                **Live Streaming:**
                
                Consider live streaming to:
                - Facebook Live
                - Instagram Live
                - ACLU Mobile Justice app
                - Periscope
                
                **Why?** If police take/destroy your phone, the footage is already saved online.
                
                ---
                
                **If Police Tell You to Stop:**
                
                You can say:
                "I'm exercising my First Amendment right to record. I'm not interfering with your duties."
                
                If they continue to demand:
                - Keep recording if safe to do so
                - Don't resist if they try to take phone
                - Do not unlock phone for them
                - Note officer names and badge numbers
                - File complaint later
                
                ---
                
                **Your Rights at Protests:**
                
                **You have the right to:**
                - Peacefully assemble
                - Express your views in public
                - Photograph/record in public
                - Distribute literature
                - Carry signs
                
                **You do NOT have the right to:**
                - Block traffic (without permit)
                - Trespass on private property
                - Use violence
                - Destroy property
                
                ---
                
                **Protest Preparation:**
                
                Before attending a protest:
                
                1. **Know your rights** (you're doing that!)
                2. **Write important numbers on your arm** (in case phone taken)
                3. **Have ID** (or know your state's rules about providing name)
                4. **Go with a buddy** (don't get separated)
                5. **Tell someone where you're going**
                6. **Have emergency contact plan**
                
                ---
                
                **What to Bring:**
                
                ✓ ID
                ✓ Phone (charged)
                ✓ Cash (for bail)
                ✓ Water
                ✓ Written emergency contact numbers
                ✓ Any necessary medications
                
                What NOT to bring:
                ✗ Weapons
                ✗ Drugs
                ✗ Anything you'd hate to lose
                ✗ Contact lenses (tear gas)
                
                ---
                
                **If Arrested at Protest:**
                
                1. Don't resist
                2. "I am invoking my right to remain silent"
                3. "I want a lawyer"
                4. Silence
                5. Get badge numbers if possible
                6. Note time, location, circumstances
                
                ---
                
                **After the Protest:**
                
                1. Document everything while fresh
                2. Save all photos/videos
                3. Connect with legal observers if present
                4. If arrested, contact NLG or ACLU
                5. File complaints for any rights violations
                
                ---
                
                **Legal Observer Programs:**
                
                Many protests have legal observers (often with green hats):
                - They document police behavior
                - They can be witnesses
                - They know local arrest procedures
                - They can contact lawyers for you
                """,
                keyTakeaway: "You have the right to record police in public. Livestream to protect footage. Know your protest rights. Prepare before you go. Document everything."
            ),
            RightsLesson(
                title: "Rights in Schools",
                subtitle: "Student constitutional rights",
                icon: "building.columns.fill",
                color: .yellow,
                critical: false,
                content: """
                **Students Have Rights Too**
                
                Students don't "shed their constitutional rights at the schoolhouse gate." - Supreme Court (Tinker v. Des Moines)
                
                But student rights are more limited than adult rights.
                
                ---
                
                **Free Speech in Schools:**
                
                Students can:
                - Wear political symbols (armbands, etc.)
                - Express opinions
                - Distribute literature (with limits)
                
                Schools can restrict speech that:
                - Substantially disrupts school
                - Is vulgar or obscene
                - Promotes illegal drug use
                - Is part of school-sponsored activities
                
                ---
                
                **Search Rules in Schools:**
                
                The 4th Amendment applies but with lower standards:
                
                **School officials** (not police) can search if:
                - They have "reasonable suspicion"
                - The search is not excessively intrusive
                
                This is LOWER than "probable cause" for police.
                
                **Your locker:**
                - Often considered school property
                - Schools may be able to search without suspicion
                - Check your school's policy
                
                **Your phone:**
                - Generally protected
                - But schools try to search anyway
                - Consider: Do you have to unlock it?
                
                ---
                
                **School Resource Officers (SROs):**
                
                Police in schools must follow police rules:
                - Need probable cause (not just reasonable suspicion)
                - Must read Miranda rights for interrogation
                - 4th Amendment fully applies
                
                **Don't let school officials use SROs to avoid constitutional limits.**
                
                ---
                
                **Interrogation at School:**
                
                If questioned by police at school:
                - You have the right to remain silent
                - You have the right to an attorney
                - You can request a parent be present
                
                If questioned by school officials:
                - Miranda rights don't apply
                - But you can still stay silent
                - Consequences may be school discipline, not criminal
                
                ---
                
                **Protests and Walkouts:**
                
                You have the right to protest, but:
                - Schools can discipline for missing class
                - They cannot discipline MORE harshly because of the message
                - Off-campus, on your own time: full free speech rights
                
                ---
                
                **Online Speech:**
                
                Recent Supreme Court case (Mahanoy Area School District v. B.L., 2021):
                - Schools cannot generally punish off-campus social media
                - But exceptions for threats, harassment, bullying
                
                ---
                
                **LGBTQ+ Rights:**
                
                Students have the right to:
                - Form GSA clubs (if other non-curricular clubs exist)
                - Be out at school
                - Use name and pronouns
                - Attend prom with same-sex date
                - Not be discriminated against
                
                ---
                
                **Immigrant Students:**
                
                - All children have the right to public education regardless of immigration status (Plyler v. Doe)
                - Schools cannot ask about immigration status
                - Schools cannot report to ICE
                - ICE cannot enter schools (sensitive locations policy)
                
                ---
                
                **If Your Rights Are Violated:**
                
                1. Document what happened
                2. Tell a trusted adult
                3. Contact ACLU or similar organization
                4. File complaint with school
                5. Know your school's grievance procedure
                """,
                keyTakeaway: "Students have constitutional rights, though somewhat limited. Police in schools must follow police rules. Know the difference between school officials and SROs."
            ),
            RightsLesson(
                title: "Rights in the Workplace",
                subtitle: "Know what your employer can and can't do",
                icon: "briefcase.fill",
                color: .orange,
                critical: false,
                content: """
                **Your Workplace Rights**
                
                The Constitution mostly protects you from the GOVERNMENT, not private employers.
                
                But laws protect workers from many employer abuses.
                
                ---
                
                **Anti-Discrimination:**
                
                Employers cannot discriminate based on:
                - Race
                - Color
                - Religion
                - Sex (including pregnancy, gender identity)
                - National origin
                - Age (40+)
                - Disability
                - Genetic information
                
                ---
                
                **Right to Organize:**
                
                The National Labor Relations Act protects:
                - Right to form or join unions
                - Right to bargain collectively
                - Right to discuss wages with coworkers
                - Right to engage in "concerted activity"
                
                **Your employer cannot:**
                - Fire you for union activity
                - Threaten you for discussing wages
                - Spy on union meetings
                - Promise benefits to avoid union
                
                ---
                
                **Wage and Hour Rights:**
                
                Under the Fair Labor Standards Act:
                - Minimum wage must be paid
                - Overtime (1.5x) for hours over 40/week
                - Employers must keep accurate time records
                - Employers cannot steal tips
                
                **Wage theft is a crime.** If you're not being paid properly:
                - Document everything
                - File complaint with Dept of Labor
                - Contact employment attorney
                
                ---
                
                **Workplace Safety:**
                
                Under OSHA, you have the right to:
                - Safe working conditions
                - Report safety violations
                - Request OSHA inspection
                - Review records of injuries
                - Not be retaliated against for reporting
                
                ---
                
                **Whistleblower Protections:**
                
                You're protected if you report:
                - Safety violations
                - Securities fraud
                - Tax fraud
                - Other legal violations
                
                Retaliation is illegal. Document everything.
                
                ---
                
                **Immigration in the Workplace:**
                
                - Employers must verify work eligibility (I-9)
                - But cannot discriminate based on citizenship status
                - Cannot demand specific documents
                - Cannot threaten to call ICE during labor dispute
                
                ---
                
                **What Employers CAN Do:**
                
                Private employers generally CAN:
                - Set dress codes
                - Monitor company email/devices
                - Drug test (with limits)
                - Set work schedules
                - Fire at-will employees for most reasons
                
                ---
                
                **At-Will Employment:**
                
                In most states, employment is "at-will":
                - You can quit anytime
                - They can fire you anytime
                - For any reason (or no reason)
                - Except illegal reasons (discrimination, retaliation)
                
                ---
                
                **If You're Fired:**
                
                It may be illegal if fired for:
                - Discrimination (race, sex, etc.)
                - Retaliation (for reporting violations)
                - Union activity
                - Taking protected leave (FMLA)
                - Refusing illegal orders
                
                Document everything. Consult an attorney.
                
                ---
                
                **Resources:**
                
                - EEOC: eeoc.gov (discrimination)
                - NLRB: nlrb.gov (union rights)
                - OSHA: osha.gov (safety)
                - Dept of Labor: dol.gov (wages)
                """,
                keyTakeaway: "The Constitution doesn't fully apply to private employers, but laws protect against discrimination, wage theft, unsafe conditions, and retaliation. Know your rights and document everything."
            ),
            RightsLesson(
                title: "Digital Rights & Privacy",
                subtitle: "Protecting yourself in the digital age",
                icon: "lock.shield.fill",
                color: .green,
                critical: false,
                content: """
                **Your Digital Rights**
                
                The 4th Amendment applies to digital devices, but technology moves faster than law.
                
                ---
                
                **Phone Searches:**
                
                Riley v. California (2014): Police need a warrant to search your phone.
                
                **At the border:** Different rules. CBP can search devices without warrant.
                
                **Best practices:**
                - Use strong passcode (biometrics can be compelled)
                - Enable encryption
                - Consider travel phone with minimal data
                
                ---
                
                **Passwords vs. Biometrics:**
                
                The 5th Amendment may protect passwords (testimonial).
                It likely does NOT protect biometrics (physical).
                
                Police may be able to force your fingerprint/face, but not your password.
                
                **Consider:**
                - Disable Face ID/Touch ID before risky situations
                - Or: turn phone off (requires passcode on restart)
                
                ---
                
                **Social Media:**
                
                Police can:
                - View your public posts
                - Use fake accounts to friend you
                - Subpoena your records from companies
                
                **Protect yourself:**
                - Review privacy settings
                - Assume anything posted could be seen by police
                - Use encrypted messaging for sensitive communication
                
                ---
                
                **Encrypted Messaging:**
                
                Use end-to-end encryption:
                - Signal (best)
                - WhatsApp (owned by Meta)
                - iMessage (Apple to Apple)
                
                Set messages to auto-delete.
                
                ---
                
                **Email:**
                
                Email is generally NOT private:
                - Stored with provider (can be subpoenaed)
                - Often unencrypted
                - Gmail scans for advertising
                
                For sensitive communication:
                - Use ProtonMail or similar
                - Use Signal instead
                
                ---
                
                **Location Data:**
                
                Your phone constantly tracks your location:
                - Cell tower connections
                - GPS
                - WiFi connections
                - Apps with location access
                
                Carpenter v. United States (2018): Police need warrant for historical cell site location data.
                
                But real-time tracking has different rules.
                
                ---
                
                **Cloud Storage:**
                
                Data stored in the cloud has less protection:
                - Provider can access it
                - Can be subpoenaed
                - May be accessed without warrant in some cases
                
                **Protect yourself:**
                - Encrypt sensitive files before uploading
                - Understand provider's policies
                - Consider local storage for sensitive data
                
                ---
                
                **VPNs:**
                
                VPNs can help privacy but:
                - VPN provider sees your traffic
                - Choose one that doesn't keep logs
                - Not a complete solution
                
                ---
                
                **The Third-Party Doctrine:**
                
                Old legal rule: Information shared with third parties has no privacy protection.
                
                This is eroding (Carpenter case), but slowly.
                
                Assume: If a company has your data, police might get it.
                
                ---
                
                **Protest-Specific Digital Safety:**
                
                Before a protest:
                - Enable airplane mode (or leave phone home)
                - Disable biometrics
                - Encrypt and back up device
                - Use Signal for communication
                - Turn off location services
                
                After:
                - Don't post photos that could identify others
                - Don't discuss tactics online
                - Assume surveillance
                """,
                keyTakeaway: "Police need a warrant to search your phone, but border is different. Passwords may be more protected than biometrics. Use encrypted messaging. Assume digital data can be obtained."
            ),
            RightsLesson(
                title: "If Your Rights Are Violated",
                subtitle: "What to do and how to fight back",
                icon: "scale.3d",
                color: .purple,
                critical: false,
                content: """
                **When Rights Are Violated**
                
                Police sometimes violate rights. Here's what to do.
                
                ---
                
                **In the Moment:**
                
                1. **Stay calm** - Escalation is dangerous
                2. **Don't resist** - Even if the stop is illegal
                3. **Clearly state your rights** - "I don't consent to this search"
                4. **Remember everything** - Details matter
                5. **Get witnesses** - Names and contacts
                6. **Record if safe** - Video is powerful evidence
                
                ---
                
                **Immediately After:**
                
                1. **Write everything down** while fresh:
                   - Date, time, location
                   - Officer names, badge numbers
                   - Patrol car numbers
                   - Exact words said
                   - Witnesses present
                
                2. **Photograph any injuries**
                
                3. **Save all evidence**:
                   - Videos, photos
                   - Receipts, tickets
                   - Medical records
                
                4. **Get medical attention** if injured
                
                ---
                
                **Filing Complaints:**
                
                **Internal Affairs:**
                - Every police department has internal affairs
                - File written complaint
                - Get copy/receipt
                - Often ineffective but creates record
                
                **Civilian Review Board:**
                - Many cities have these
                - May have more independence
                - Process varies by location
                
                **Department of Justice:**
                - For civil rights violations
                - FBI investigates police misconduct
                - Contact local FBI field office
                
                ---
                
                **Legal Action:**
                
                **Section 1983 Lawsuits:**
                - Sue police for constitutional violations
                - Can recover damages
                - Requires proving rights were violated
                
                **Challenges:**
                - Qualified immunity protects officers
                - Hard to prove
                - Takes years
                - Need a lawyer
                
                ---
                
                **Finding a Lawyer:**
                
                - ACLU (often takes civil rights cases)
                - National Lawyers Guild
                - Local civil rights attorneys
                - Law school clinics
                
                Many civil rights lawyers work on contingency (no fee unless you win).
                
                ---
                
                **Statute of Limitations:**
                
                You have limited time to sue:
                - Section 1983: Usually 2-3 years (varies by state)
                - State claims: Varies
                
                **Don't wait.** Consult a lawyer quickly.
                
                ---
                
                **The Reality:**
                
                Fighting police misconduct is hard:
                - System protects police
                - Qualified immunity blocks many cases
                - Takes time and resources
                - Retaliation is possible
                
                **But:**
                - Documentation helps future victims
                - Complaints create patterns
                - Some cases succeed
                - Change happens through pressure
                
                ---
                
                **Collective Action:**
                
                Individual complaints rarely change things.
                
                Consider:
                - Joining/supporting police accountability groups
                - Attending city council meetings
                - Supporting reform candidates
                - Connecting with others who've had similar experiences
                
                ---
                
                **Resources:**
                
                - ACLU: aclu.org
                - National Police Accountability Project: nlg-npap.org
                - NAACP Legal Defense Fund: naacpldf.org
                - Your local ACLU chapter
                - Copwatch organizations
                """,
                keyTakeaway: "If rights are violated: stay calm, don't resist, document everything, file complaints, consult a lawyer. Fighting misconduct is hard but important. Collective action creates change."
            )
        ]
    }
}

// MARK: - Lesson Model

struct RightsLesson: Identifiable {
    let id = UUID()
    let title: String
    let subtitle: String
    let icon: String
    let color: Color
    let critical: Bool
    let content: String
    let keyTakeaway: String
}

// MARK: - Lesson View

struct RightsLessonView: View {
    let lesson: RightsLesson
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
                        
                        if lesson.critical {
                            Text("CRITICAL")
                                .font(.system(size: 10, weight: .black))
                                .foregroundColor(.white)
                                .padding(.horizontal, 8)
                                .padding(.vertical, 4)
                                .background(Color.red)
                                .cornerRadius(4)
                        }
                    }
                    
                    Text(lesson.title)
                        .font(.system(size: 26, weight: .bold))
                        .foregroundColor(.white)
                    
                    Text(lesson.subtitle)
                        .font(.system(size: 16))
                        .foregroundColor(.gray)
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
                        Image(systemName: "shield.lefthalf.filled")
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
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(lesson.color.opacity(0.3), lineWidth: 1)
                )
            }
            .padding()
        }
        .background(Color.black.ignoresSafeArea())
        .navigationBarTitleDisplayMode(.inline)
    }
}

// MARK: - Preview

#Preview {
    NavigationView {
        KnowYourRightsCourse()
    }
}
