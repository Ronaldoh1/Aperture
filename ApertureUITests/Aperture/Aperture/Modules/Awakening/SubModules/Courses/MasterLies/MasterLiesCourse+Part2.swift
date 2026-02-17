// MasterLiesCourse+Part2.swift
// THE MASTER LIES - Medical & Historical Deceptions

import SwiftUI

extension MasterLiesCourse {
  static var additionalModules: [LiesModule] {
    [
      // ═══════════════════════════════════════════════════════════════
      // MODULE 4: BIG PHARMA LIES
      // ═══════════════════════════════════════════════════════════════

      LiesModule(
        id: "lies_pharma",
        number: 4,
        title: "Big Pharma Lies",
        subtitle: "The opioid scandal and beyond",
        icon: "pills.fill",
        lies: [
          ExposedLie(
            id: "pharma_1",
            lieTitle: "\"OxyContin is non-addictive\"",
            truth: "Purdue KNEW It Was Addictive--And Lied for Profit",
            content: """
              **You Were Told:**
              OxyContin was a breakthrough pain medication with less than 1% addiction risk.

              **The Truth:**
              Purdue Pharma KNEW OxyContin was highly addictive. They lied, bribed, and manipulated to sell it anyway.

              **The Death Count:**
              450,000+ Americans dead from opioid overdoses since the 1990s.

              **The Lies They Told:**

              **"Less than 1% addiction rate":**
              • This claim was fabricated
              • The data was created by clinicians PAID by Purdue
              • No legitimate studies supported this
              • Sales reps were trained to repeat this lie to doctors

              **"Safe for chronic pain":**
              • OxyContin was marketed for long-term use
              • Long-term opioid use creates dependency
              • They knew this and marketed it anyway

              **The Bribery:**

              **Doctors:**
              • Free trips to "pain management seminars" (vacations)
              • Paid speaking engagements ($$$)
              • 3,000 doctors on Purdue's speakers bureau at peak
              • The more they prescribed, the more they were paid

              **The FDA:**
              • FDA examiner who approved OxyContin's label
              • Later given a well-paid position at Purdue
              • The label allowed marketing as "less addictive"

              **The "Candyman" Doctor:**
              Purdue knew one doctor was called "the Candyman" by patients. He prescribed "crazy dosing." Purdue sent reps to meet with him 300+ times--to sell him MORE.

              **The Pseudo-Addiction Lie:**
              When patients showed addiction signs, Purdue trained doctors to call it "pseudo-addiction"--and prescribe MORE opioids.

              **The Sackler Family Escape:**
              • Withdrew $11 billion (75% of company assets) before bankruptcy
              • Called it a "milking program"
              • No family member went to prison
              • Richard Sackler email: "Abusers aren't victims. They are the victimizers."

              🔥 **450,000 dead. $11 billion extracted. Zero prison time.**
              """,
            evidence: [
              "DOJ prosecution documents",
              "Purdue internal emails",
              "State AG lawsuit evidence",
              "Congressional testimony",
            ],
            whobenefits: "Sackler family ($11B+), Purdue executives, bribed doctors."
          ),

          ExposedLie(
            id: "pharma_2",
            lieTitle: "\"Medical schools teach evidence-based medicine\"",
            truth: "Big Pharma Funds and Controls Medical Education",
            content: """
              **You Were Told:**
              Doctors receive unbiased, science-based training in medical school.

              **The Truth:**
              The pharmaceutical industry funds approximately HALF of all continuing medical education in the US.

              **The Numbers:**
              • Pharma spends $5+ billion annually on marketing to doctors
              • That's $8,000+ per physician per year
              • Half of medical education costs are pharma-funded

              **Harvard Medical School Got an F:**
              The American Medical Student Association graded medical schools on conflicts of interest. Harvard got an F.
              • 1,600 of 8,900 professors admitted financial ties to drug companies
              • These ties could bias their teaching and research

              **The Textbook Scandal:**
              A medical student at University of Toronto discovered:
              • His pain management course was funded by drug companies including Purdue
              • The course reference book was sponsored by Purdue
              • The book described oxycodone as a "weak opioid"
              • Oxycodone is actually 1.5x STRONGER than morphine

              **The ROI:**
              The pharmaceutical industry calculates they get $3.56 back for every $1 invested in medical education. They're not funding education--they're funding future prescriptions.

              **The Puppet Effect:**
              Studies show: As students' exposure to pharmaceutical industry increases, their ability to detect industry bias DECREASES.

              They're trained to not see the manipulation.

              🔥 **Your Doctor's Education**: Half funded by drug companies, taught from drug company textbooks, by professors on drug company payrolls. Still trust "just ask your doctor"?
              """,
            evidence: [
              "AMSA medical school conflict of interest grades",
              "Pharma marketing spend analysis",
              "CME funding source research",
              "Medical education bias studies",
            ],
            whobenefits:
              "Pharmaceutical companies train future prescribers to prefer their products."
          ),

          ExposedLie(
            id: "pharma_3",
            lieTitle: "\"Clinical trials are unbiased science\"",
            truth: "Drug Companies Run Their Own Trials",
            content: """
              **You Were Told:**
              Clinical trials prove drugs are safe and effective through rigorous, independent science.

              **The Truth:**
              Drug companies fund and often directly run trials of their own drugs. The conflicts of interest are staggering.

              **Who Pays For Trials:**
              • Most clinical trials are funded by the company selling the drug
              • They hire the researchers
              • They control the data
              • They decide what gets published

              **Publication Bias:**
              • Positive results: 97% published
              • Negative results: 50% never published
              • If a trial shows the drug doesn't work or is dangerous, it often disappears

              **The Ghost-Writing Scandal:**
              • Pharmaceutical companies write papers
              • They pay academics to put their names on them
              • The "author" may not have even seen the data
              • Published in prestigious journals as "independent research"

              **Endpoint Manipulation:**
              • If the primary endpoint fails, change to secondary endpoint
              • If that fails, do "subgroup analysis" until something works
              • Present the positive finding as the main result

              **The Vioxx Example:**
              • Merck's Vioxx (pain medication)
              • Internal analysis showed increased heart attack risk
              • Company hid the data
              • 88,000-140,000 excess heart attacks (estimate)
              • 27,785 estimated deaths
              • Company knew for YEARS before recall

              **The Fine:**
              Merck paid $4.85 billion in settlements. They made $11 billion on Vioxx. Profit after fine: ~$6 billion.

              🔥 **The Math**: Kill tens of thousands, pay billions, still profit billions. This is the business model.
              """,
            evidence: [
              "Publication bias meta-analyses",
              "Ghost-writing investigations",
              "Vioxx litigation documents",
              "AllTrials campaign data",
            ],
            whobenefits: "Drug companies control the 'science' that approves their products."
          ),

          ExposedLie(
            id: "pharma_4",
            lieTitle: "\"Antidepressants correct chemical imbalances\"",
            truth: "The 'Chemical Imbalance' Theory Was Marketing, Not Science",
            content: """
              **You Were Told:**
              Depression is caused by a "chemical imbalance" in the brain (low serotonin). Antidepressants correct this imbalance.

              **The Truth:**
              There is no scientific evidence that depression is caused by low serotonin. This was a marketing theory, not a medical discovery.

              **The Origin:**
              • 1960s: Scientists noticed antidepressants affected serotonin
              • They HYPOTHESIZED depression might be low serotonin
              • This was never proven
              • Drug companies ran with it anyway

              **The 2022 Bombshell:**
              A comprehensive review in Molecular Psychiatry analyzed decades of research and concluded:
              • "No consistent evidence" that depression is caused by low serotonin
              • "No support" for the chemical imbalance theory
              • The theory should have been abandoned long ago

              **Why It Persisted:**
              • It's easy to explain to patients
              • It reduces stigma (not your fault--it's chemistry!)
              • It sells drugs ($15+ billion antidepressant market)
              • Drug companies promoted it relentlessly

              **What Antidepressants Actually Do:**
              • Some people do feel better on them
              • The mechanism isn't "correcting an imbalance"
              • Effect is often barely better than placebo in trials
              • They may work through different mechanisms entirely

              **The Danger:**
              • Patients told they need drugs for a "medical condition"
              • Alternative treatments (therapy, lifestyle, etc.) deprioritized
              • Withdrawal effects when stopping
              • Overprescription, especially to children

              🔥 **The Pattern**: A marketing metaphor became "medical fact." Doctors told you something that was never scientifically proven because drug companies made it sound true.
              """,
            evidence: [
              "Moncrieff et al. 2022 Molecular Psychiatry review",
              "History of serotonin hypothesis",
              "Antidepressant efficacy meta-analyses",
              "Pharmaceutical marketing analysis",
            ],
            whobenefits: "Antidepressant manufacturers ($15B+ market)."
          ),
        ]
      ),

      // ═══════════════════════════════════════════════════════════════
      // MODULE 5: HISTORICAL LIES
      // ═══════════════════════════════════════════════════════════════

      LiesModule(
        id: "lies_history",
        number: 5,
        title: "Historical Lies",
        subtitle: "History is written by the victors",
        icon: "book.closed.fill",
        lies: [
          ExposedLie(
            id: "hist_1",
            lieTitle: "\"Columbus discovered America\"",
            truth: "Columbus Was a Genocidal Slaver Who Didn't 'Discover' Anything",
            content: """
              **You Were Taught:**
              Christopher Columbus was a brave explorer who discovered America in 1492.

              **The Truth:**

              **He Didn't "Discover" Anything:**
              • 100+ million indigenous people already lived there
              • Vikings had been there 500 years earlier
              • You can't "discover" a populated continent

              **What He Actually Did:**

              **From Columbus's Own Journal:**
              "They would make fine servants. With 50 men we could subjugate them all and make them do whatever we want."

              **From Bartolomé de las Casas (Spanish priest who documented it):**
              • Mass murder of indigenous populations
              • Slavery--shipped thousands to Spain
              • Torture for not meeting gold quotas (hands cut off)
              • Children fed to dogs
              • Sexual slavery of women and girls
              • Entire populations wiped out

              **The Numbers:**
              • Hispaniola population 1492: ~250,000
              • Hispaniola population 1517: ~14,000
              • That's 94% population loss in 25 years

              **Why the Myth Persists:**
              • Italian-American political identity
              • Knights of Columbus lobbying
              • American origin mythology
              • Celebrating colonialism as "discovery"

              🔥 **Columbus Day**: A federal holiday celebrating a man who, by modern standards, committed genocide and crimes against humanity.
              """,
            evidence: [
              "Columbus's ship logs and letters",
              "De las Casas 'A Short Account of the Destruction of the Indies'",
              "Pre-Columbian population estimates",
              "Viking settlement evidence at L'Anse aux Meadows",
            ],
            whobenefits:
              "Colonial narrative, American origin mythology, Italian-American political organizations."
          ),

          ExposedLie(
            id: "hist_2",
            lieTitle: "\"The Civil War was about states' rights\"",
            truth: "The Confederate States Explicitly Said It Was About Slavery",
            content: """
              **You Were Taught:**
              The Civil War was primarily about states' rights and economic differences, not slavery.

              **The Truth:**
              The Confederate states EXPLICITLY stated they were seceding to preserve slavery. This isn't interpretation--it's in their own documents.

              **South Carolina's Declaration of Secession (1860):**
              "[Northern states have] an increasing hostility on the part of the non-slaveholding States to the institution of slavery."

              **Mississippi's Declaration:**
              "Our position is thoroughly identified with the institution of slavery--the greatest material interest of the world."

              **Georgia's Declaration:**
              "The prohibition of slavery in the Territories is the cardinal principle of this organization."

              **Texas's Declaration:**
              "[Texas] was received as a commonwealth holding, maintaining, and protecting the institution known as negro slavery."

              **Confederate Vice President Alexander Stephens (1861):**
              "Our new government's foundations are laid, its cornerstone rests, upon the great truth that the negro is not equal to the white man; that slavery, subordination to the superior race, is his natural and normal condition."

              **Why the "States' Rights" Myth?**
              • Created AFTER the war by the "Lost Cause" movement
              • Made the Confederacy seem noble, not racist
              • Textbooks in Southern states promoted it for a century
              • Political rehabilitation of Confederate leaders

              🔥 **The Receipts**: They wrote it down. They said it was about slavery. The "states' rights" narrative was invented later to sanitize history.
              """,
            evidence: [
              "Confederate states' secession declarations (primary documents)",
              "Alexander Stephens 'Cornerstone Speech'",
              "Confederate Constitution (protects slavery explicitly)",
              "Lost Cause mythology analysis",
            ],
            whobenefits:
              "The 'Lost Cause' myth rehabilitates the Confederacy and minimizes slavery's centrality."
          ),

          ExposedLie(
            id: "hist_3",
            lieTitle: "\"The US entered WWII because of Pearl Harbor\"",
            truth: "FDR Provoked Japan and Knew the Attack Was Coming",
            content: """
              **You Were Taught:**
              Pearl Harbor was a complete surprise attack that forced America into WWII.

              **The Evidence Suggests:**
              The US had taken aggressive actions that made Japanese attack inevitable, and may have had advance warning.

              **US Actions Before Pearl Harbor:**
              • Froze Japanese assets in the US
              • Embargoed oil (Japan had 18-month supply)
              • Demanded Japan withdraw from China
              • Deployed fleet to Hawaii (provocation)

              **The McCollum Memo (October 1940):**
              Lt. Commander Arthur McCollum wrote an 8-point plan to provoke Japan into attacking:
              1. Make arrangements with Britain for use of British bases
              2. Make arrangements with Holland for use of Dutch bases
              3. Give all possible aid to China
              4. Send a division of cruisers to the Orient
              5. Send two divisions of submarines
              6. Keep the main fleet in Hawaii
              7. Demand Japan withdraw from Indochina
              8. Embargo trade with Japan

              **All 8 points were implemented.**

              **The Broken Codes:**
              • US had broken Japanese diplomatic codes (MAGIC)
              • US had broken Japanese naval codes (PURPLE)
              • Intercepted messages indicated attack was imminent
              • Fleet commanders claim they weren't warned

              **The Controversy:**
              Historians debate whether FDR:
              A) Knew the exact target (Pearl Harbor)
              B) Knew an attack was coming but not where
              C) Provoked Japan knowing attack was likely

              **What's NOT Controversial:**
              • The US took aggressive actions against Japan
              • These actions made war nearly inevitable
              • The US had intelligence Japan would attack
              • Pearl Harbor shifted public opinion from anti-war to pro-war overnight

              🔥 **The Pattern**: Wars are often "started" by the other side through deliberate provocation. The victim narrative enables intervention.
              """,
            evidence: [
              "McCollum Memo (declassified)",
              "MAGIC intelligence intercepts",
              "US economic sanctions on Japan 1940-41",
              "Congressional investigations",
            ],
            whobenefits: "Military-industrial complex, FDR's war goals, Allied powers."
          ),

          ExposedLie(
            id: "hist_4",
            lieTitle: "\"The atomic bombs were necessary to end WWII\"",
            truth: "Japan Was Already Defeated; Bombs Were About the USSR",
            content: """
              **You Were Taught:**
              Dropping atomic bombs on Hiroshima and Nagasaki saved millions of lives by ending WWII quickly.

              **The Evidence Suggests:**
              Japan was already seeking surrender. The bombs may have been used to intimidate the Soviet Union.

              **Japan Was Defeated:**
              • Navy destroyed
              • Air force destroyed
              • Blockade cutting off resources
              • Firebombing had already destroyed most major cities
              • Japanese leadership was seeking surrender terms

              **The Soviet Factor:**
              • USSR declared war on Japan on August 8
              • Soviet invasion of Manchuria was devastating
              • Some historians argue THIS ended the war, not the bombs
              • The bombs may have been used to end war BEFORE Soviets gained more territory

              **The Surrender Terms Issue:**
              • Japan's main condition: Keep the Emperor
              • US demanded unconditional surrender
              • After the bombs: US let Japan keep the Emperor anyway
              • The condition that "prevented" surrender was ultimately granted

              **What US Leaders Said:**

              **General Dwight D. Eisenhower:**
              "Japan was already defeated and dropping the bomb was completely unnecessary."

              **Admiral William Leahy (Truman's Chief of Staff):**
              "The use of this barbarous weapon at Hiroshima and Nagasaki was of no material assistance in our war against Japan."

              **The Casualties:**
              • Hiroshima: 70,000-80,000 immediate deaths, 140,000 total by year end
              • Nagasaki: 40,000 immediate deaths, 70,000 total by year end
              • Majority were civilians

              🔥 **The Question**: Was it to end the war--or to demonstrate the bomb to Stalin?
              """,
            evidence: [
              "Eisenhower and Leahy statements",
              "Japanese surrender negotiations records",
              "Soviet declaration of war timing",
              "Truman diary entries",
            ],
            whobenefits: "US established nuclear dominance over USSR, shaped Cold War."
          ),

          ExposedLie(
            id: "hist_5",
            lieTitle: "\"The Gulf of Tonkin attack justified Vietnam\"",
            truth: "The Second Attack Never Happened--LBJ Knew It",
            content: """
              **You Were Told:**
              North Vietnamese boats attacked US ships in the Gulf of Tonkin in August 1964, justifying US military involvement in Vietnam.

              **The Truth:**
              The second "attack" (August 4) never happened. It was fabricated, and LBJ knew it.

              **What Actually Happened:**

              **August 2, 1964:**
              USS Maddox was conducting intelligence operations in North Vietnamese waters. North Vietnamese boats fired on it. This DID happen (though the Maddox was in their territory).

              **August 4, 1964:**
              A "second attack" was reported. It triggered the Gulf of Tonkin Resolution and the Vietnam War.

              **The Second Attack Was False:**
              • Radar operators saw "contacts" in rough seas
              • Sonar operators heard "torpedoes"
              • Captain later said: "Freak weather effects" and "overeager" crew
              • Secretary of Defense McNamara: Later admitted doubts
              • NSA declassified documents (2005): Confirmed it didn't happen

              **LBJ's Own Recording:**
              In a taped conversation, LBJ said:
              "For all I know, our Navy was shooting at whales out there."

              He knew--and used it anyway.

              **The Result:**
              • Gulf of Tonkin Resolution passed (98-2 in Senate)
              • Gave LBJ broad war powers
              • 58,000 Americans dead
              • 2-3 million Vietnamese dead
              • War lasted until 1975

              🔥 **The Pattern**: False flags justify wars. Verify before you believe the "they attacked us" narrative.
              """,
            evidence: [
              "NSA declassified 2005 documents",
              "LBJ White House tapes",
              "McNamara later admissions",
              "Ship captain reports",
            ],
            whobenefits:
              "Military-industrial complex, Cold War policy makers, LBJ's political goals."
          ),

          ExposedLie(
            id: "hist_6",
            lieTitle: "\"Iraq had weapons of mass destruction\"",
            truth: "They Knew It Was False--And Invaded Anyway",
            content: """
              **You Were Told:**
              Iraq had weapons of mass destruction (WMDs) that posed an imminent threat, justifying the 2003 invasion.

              **The Truth:**
              No WMDs were found. The intelligence was manipulated, and officials knew the claims were dubious.

              **The Claims:**
              • Nuclear weapons program
              • Chemical weapons
              • Biological weapons
              • Mobile weapons labs
              • Links to Al-Qaeda

              **The Reality:**

              **"Curveball" (Rafid Ahmed Alwan):**
              • Single source for bio weapons claims
              • German intelligence warned he was unreliable
              • CIA used his claims anyway
              • He later admitted he lied

              **Yellowcake Uranium:**
              • Bush claimed Iraq sought uranium from Niger
              • Based on forged documents
              • CIA had doubts before the speech
              • Said it anyway

              **Aluminum Tubes:**
              • Claimed for centrifuges (nuclear weapons)
              • Department of Energy said: conventional rockets
              • The wrong conclusion was pushed to public

              **Mobile Weapons Labs:**
              • Colin Powell's UN presentation featured them
              • Based on Curveball's fabrications
              • Never found

              **The Downing Street Memo (2002):**
              British intelligence memo BEFORE the invasion:
              "The intelligence and facts were being fixed around the policy."

              They decided to invade, then found "evidence."

              **The Cost:**
              • No WMDs found
              • 4,500+ American troops killed
              • 200,000+ Iraqi civilians killed
              • $2+ trillion spent
              • ISIS emerged from the chaos

              🔥 **Zero accountability.** No one was prosecuted for lying America into war.
              """,
            evidence: [
              "Iraq Survey Group final report (no WMDs)",
              "Curveball admissions",
              "Downing Street Memo",
              "Senate Intelligence Committee reports",
            ],
            whobenefits: "Military-industrial complex, oil interests, neoconservative policy goals."
          ),
        ]
      ),
    ]
  }
}
