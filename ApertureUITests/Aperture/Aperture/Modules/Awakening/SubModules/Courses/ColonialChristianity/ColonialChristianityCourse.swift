// ColonialChristianityCourse.swift
// THE CONQUEST - How Christianity Conquered the Americas

import SwiftUI

struct ColonialChristianityCourse {
  static let shared = ColonialChristianityCourse()

  let id = "colonial_christianity"
  let title = "The Conquest"
  let subtitle = "How Christianity erased the Americas"
  let icon = "cross.fill"
  let colorHex = "#8B0000"

  var color: Color {
    Color(hex: colorHex)
  }

  let modules: [CCModule] = [
    // ═══════════════════════════════════════════════════════════════
    // MODULE 1: THE DOCTRINE OF DISCOVERY
    // ═══════════════════════════════════════════════════════════════

    CCModule(
      id: "cc_doctrine",
      number: 1,
      title: "The Doctrine of Discovery",
      subtitle: "The papal bulls that legalized genocide",
      lessons: [
        CCLesson(
          id: "cc1_1",
          title: "The Pope's Permission to Conquer",
          content: """
            **The Legal Foundation for Genocide**

            In 1493, Pope Alexander VI issued a series of papal bulls (official decrees) that gave Spain and Portugal divine permission to conquer, colonize, and convert the entire non-Christian world.

            **The Papal Bulls:**

            **Inter Caetera (1493):**
            The Pope declared that all lands not already held by Christian rulers belonged to Spain:
            - "We... give, grant, and assign to you and your heirs and successors, kings of Castile and Leon, forever... all islands and mainlands found and to be found, discovered and to be discovered"
            - Non-Christian peoples had no rights to their own land
            - The Church granted authority to "subjugate" and convert them

            **Romanus Pontifex (1455):**
            Earlier bull that set the precedent:
            - Authorized Portugal to "invade, capture, vanquish, and subdue all Saracens and pagans"
            - Permitted them to "reduce their persons to perpetual slavery"
            - Granted ownership of all their possessions and lands

            **Still In Effect:**
            These doctrines were NEVER rescinded. They formed the legal basis for:
            - Spanish conquest of the Americas
            - Portuguese colonization of Africa and Brazil
            - British colonization of North America
            - US Supreme Court rulings on Native American land rights (Johnson v. M'Intosh, 1823)

            🔥 **The Pattern**: The Pope literally signed permission slips for genocide. The legal systems built on these "doctrines" still affect indigenous peoples today.
            """,
          keyPoints: [
            "1493: Pope gave Spain all non-Christian lands",
            "Indigenous peoples declared to have no land rights",
            "Authorized 'perpetual slavery' of non-Christians",
            "These doctrines were NEVER officially rescinded",
          ]
        ),

        CCLesson(
          id: "cc1_2",
          title: "The Requerimiento",
          content: """
            **The 'Legal' Notice Before Slaughter**

            Starting in 1513, Spanish conquistadors were required to read the "Requerimiento" (Requirement) to indigenous peoples before attacking them.

            **What It Said:**
            "We ask and require you... to acknowledge the Church as the ruler and superior of the whole world, and the high priest called Pope, and in his name the King and Queen"

            If they refused (or didn't understand, since it was read in Spanish/Latin):
            "We shall powerfully enter into your country, and shall make war against you... and shall subject you to the yoke and obedience of the Church and of their highnesses."

            "We shall take you and your wives and your children, and shall make slaves of them... and we shall take away your goods, and shall do you all the mischief and damage that we can."

            **How It Was Used:**
            - Often read from ships before landing
            - Read to empty beaches or forests
            - Read in Spanish to people who didn't speak Spanish
            - Sometimes read while people were already being attacked
            - The reading itself was considered sufficient "legal" warning

            **Bartolomé de las Casas (Spanish priest who witnessed it):**
            "I don't know whether to laugh or cry at the Requerimiento."

            🔥 **The Absurdity**: They read a document in a foreign language declaring the Pope owned all land, then claimed the victims "refused" when they didn't immediately surrender. This was the "legal" justification for mass murder.
            """,
          keyPoints: [
            "Spanish law required reading a 'notice' before conquest",
            "The notice was in Spanish/Latin to non-Spanish speakers",
            "Refusal (or confusion) justified enslavement and war",
            "Often read to empty beaches or during attacks",
          ]
        ),
      ]
    ),

    // ═══════════════════════════════════════════════════════════════
    // MODULE 2: THE MISSIONS
    // ═══════════════════════════════════════════════════════════════

    CCModule(
      id: "cc_missions",
      number: 2,
      title: "The Mission System",
      subtitle: "Concentration camps called 'salvation'",
      lessons: [
        CCLesson(
          id: "cc2_1",
          title: "The California Missions",
          content: """
            **What They Taught You:**
            The missions were kind places where Franciscan friars taught agriculture and Christianity to grateful Native Americans.

            **What Actually Happened:**

            **Forced Labor:**
            - Indigenous people were forced to work 6 days a week
            - Men worked fields, tended livestock, made bricks
            - Women ground grain, cooked, made cloth
            - Children were separated from families to prevent cultural transmission

            **Imprisonment:**
            - Once "baptized," Native people could not leave
            - Runaways were hunted by soldiers and returned
            - Locked in dormitories at night
            - Punishment included whipping, stocks, shackles

            **Death Rates:**
            At Mission San Gabriel alone:
            - 6,000 Native Americans died
            - Population couldn't sustain itself - required constant forced recruitment
            - Diseases: measles, smallpox, syphilis (introduced by soldiers)
            - Average lifespan in missions: significantly lower than outside

            **Cultural Destruction:**
            - Languages forbidden
            - Traditional practices banned
            - Spiritual ceremonies punished
            - Children raised to reject their own people

            **Fr. Junípero Serra:**
            - Founder of California missions
            - Personally ordered floggings
            - Called for more soldiers to capture runaways
            - Made a SAINT by Pope Francis in 2015
            - His statues are now being removed

            🔥 **The Reality**: The missions were forced labor camps where indigenous peoples were worked to death while their cultures were systematically destroyed. The Catholic Church canonized the man who built this system.
            """,
          keyPoints: [
            "Missions were forced labor camps",
            "Death rates were catastrophic",
            "Cultural destruction was intentional",
            "Serra was made a saint in 2015",
          ]
        ),

        CCLesson(
          id: "cc2_2",
          title: "The Encomienda System",
          content: """
            **Slavery by Another Name**

            The encomienda was a Spanish colonial system that granted conquistadors control over indigenous labor.

            **How It Worked:**
            - Conquistadors received a "grant" of indigenous people
            - In exchange for "protection" and Christian instruction
            - The encomendero could demand labor and tribute
            - In practice: slavery with a religious veneer

            **Queen Isabella's Loophole:**
            Isabella declared Native Americans were not to be enslaved (they had souls).
            Solution: Force them to work "voluntarily" in exchange for Christianity.

            **The Reality:**
            - 12-16 hour workdays in mines and fields
            - Families separated
            - Starvation-level food
            - Beaten for insufficient production
            - Entire populations worked to death

            **The Numbers:**
            On Hispaniola (Haiti/Dominican Republic):
            - 1492: Estimated 250,000-1,000,000 Taíno people
            - 1514: Only 32,000 remaining
            - 1548: Fewer than 500 Taíno alive
            - Cause: Forced labor, disease, murder, suicide

            **Bartolomé de las Casas witnessed:**
            "I saw here cruelty on a scale no living being has ever seen or expects to see."

            🔥 **The Pattern**: "Saving souls" was the cover for extracting labor until death. The entire economy of the Spanish colonies was built on indigenous bodies.
            """,
          keyPoints: [
            "Encomienda = slavery with religious justification",
            "Entire populations worked to death",
            "Hispaniola: 1 million to 500 in 56 years",
            "Church provided theological cover",
          ]
        ),

        CCLesson(
          id: "cc2_3",
          title: "Residential Schools: The Modern Continuation",
          content: """
            **"Kill the Indian, Save the Man"**

            From the 1870s to 1996, the US and Canadian governments, in partnership with churches, ran boarding schools designed to destroy indigenous cultures.

            **Captain Richard Pratt (founder, Carlisle Indian School):**
            "A great general has said that the only good Indian is a dead one... I agree with the sentiment, but only in this: that all the Indian there is in the race should be dead. Kill the Indian in him, and save the man."

            **What They Did:**
            - Children forcibly removed from families
            - Beaten for speaking native languages
            - Hair cut (spiritual violation in many cultures)
            - Traditional clothing forbidden
            - Given new "Christian" names
            - Sexual abuse widespread
            - Physical abuse systematic

            **The Numbers:**
            - 100,000+ children went through Canadian schools
            - 60,000+ through US schools
            - Thousands died from disease, abuse, neglect
            - Mass graves still being discovered

            **The Churches Involved:**
            - Catholic Church (majority of Canadian schools)
            - Anglican Church
            - Presbyterian Church  
            - United Church of Canada
            - Methodist Church
            - Various Protestant denominations in US

            **2021: Kamloops Discovery**
            Ground-penetrating radar found 215 children's bodies at Kamloops Indian Residential School. Then hundreds more at other sites.

            **2022: Pope Francis Apologized**
            "I am deeply sorry... I ask forgiveness for the ways in which many Christians supported the colonizing mentality."
            - But the Church has not released all records
            - Financial reparations are minimal
            - Many survivors received nothing

            🔥 **This Is Recent History**: The last residential school closed in 1996. Survivors are still alive. Perpetrators are still alive. Mass graves are still being discovered. This is not ancient history—this is your lifetime.
            """,
          keyPoints: [
            "Explicit goal: cultural genocide",
            "Thousands of children died",
            "Mass graves still being discovered",
            "Last school closed in 1996",
          ]
        ),
      ]
    ),

    // ═══════════════════════════════════════════════════════════════
    // MODULE 3: LATIN AMERICA
    // ═══════════════════════════════════════════════════════════════

    CCModule(
      id: "cc_latin",
      number: 3,
      title: "The Conquest of Latin America",
      subtitle: "Entire civilizations destroyed",
      lessons: [
        CCLesson(
          id: "cc3_1",
          title: "The Fall of the Aztec Empire",
          content: """
            **Tenochtitlan: The City They Destroyed**

            In 1519, Tenochtitlan was one of the largest cities in the world:
            - Population: 200,000-300,000
            - Larger than any European city at the time
            - Advanced infrastructure: aqueducts, causeways, floating gardens
            - Public sanitation Europeans didn't have

            **Hernán Cortés arrived with:**
            - 600 men
            - 16 horses
            - A few cannons

            **How Did He Win?**

            1. **Disease**: Smallpox killed 40% of the population in one year
            2. **Alliances**: Cortés allied with enemies of the Aztecs
            3. **Treachery**: Captured Moctezuma during a "peace" visit
            4. **Technology**: Steel, horses, guns

            **The Siege of Tenochtitlan (1521):**
            - 75-day siege
            - Cortés cut off water and food
            - Disease continued spreading
            - 100,000-240,000 Mexica died
            - The city was demolished stone by stone

            **What They Built on the Ruins:**
            Mexico City's main cathedral sits on the ruins of the Templo Mayor, the Aztec sacred pyramid. The stones of indigenous temples were used to build churches.

            **The Book Burnings:**
            Bishop Diego de Landa burned thousands of Maya manuscripts:
            "We found a large number of books... and as they contained nothing but superstition and lies of the devil, we burned them all."

            Only 4 Maya codices survive today. Entire libraries of knowledge—astronomy, medicine, history—destroyed by one man.

            🔥 **What Was Lost**: Not just lives, but entire knowledge systems. The Maya had astronomical calculations more accurate than contemporary Europeans. Burned because a bishop called it "devil's work."
            """,
          keyPoints: [
            "Tenochtitlan was larger than any European city",
            "Smallpox killed 40% before the final battle",
            "Churches built on top of destroyed temples",
            "Thousands of manuscripts burned—4 Maya codices survive",
          ]
        ),

        CCLesson(
          id: "cc3_2",
          title: "The Inca Empire's Destruction",
          content: """
            **The Conquest of the Andes**

            In 1532, Francisco Pizarro arrived in the Inca Empire, which stretched 2,500 miles along the Andes—the largest empire in pre-Columbian America.

            **The Trap at Cajamarca:**
            - Pizarro invited Inca emperor Atahualpa to a "meeting"
            - Atahualpa arrived with thousands of unarmed attendants
            - A priest handed Atahualpa a Bible
            - Atahualpa (who couldn't read) threw it down
            - Spanish soldiers opened fire with cannons and guns
            - 6,000-7,000 unarmed Incas killed in hours
            - Atahualpa captured

            **The Ransom:**
            Atahualpa offered to fill a room with gold and two rooms with silver for his release. The Spanish collected the ransom—estimated at $100 million in today's value—then executed him anyway after a "trial" for heresy and treason.

            **What They Destroyed:**
            - **Quipu**: Inca record-keeping system using knotted strings
            - Spanish banned and burned quipus
            - We still can't fully decode them
            - Thousands of years of records lost

            - **Mummies**: Incas preserved ancestors who "lived" among the community
            - Spanish burned the mummies as "demon worship"
            - Entire genealogies and histories destroyed

            **The Silver of Potosí:**
            In what is now Bolivia, the Spanish discovered the richest silver mine in history.
            - 8 million indigenous and African people died working Potosí
            - Spanish exported 45,000 tons of pure silver
            - This wealth funded the Spanish Empire
            - The mountain itself is a mass grave

            🔥 **The Extraction**: Everything valuable—gold, silver, labor, knowledge—was taken. What couldn't be monetized was destroyed. The wealth of the Andes built European cathedrals.
            """,
          keyPoints: [
            "6,000+ unarmed people massacred at Cajamarca",
            "Ransom paid, emperor executed anyway",
            "Quipu records burned—we can't decode them",
            "8 million died in Potosí silver mines",
          ]
        ),

        CCLesson(
          id: "cc3_3",
          title: "The Numbers They Don't Teach",
          content: """
            **The Population Collapse**

            Before European contact (1492):
            - Americas population estimates: 50-100 million
            - Some scholars argue up to 112 million

            By 1600:
            - Indigenous population: approximately 10 million
            - A loss of 90% or more

            **Causes:**
            1. **Disease** (50-90% of deaths)
               - Smallpox, measles, typhus, influenza
               - Indigenous peoples had no immunity
               - Entire villages died within weeks of contact

            2. **Violence**
               - Military conquest
               - Punitive expeditions
               - Slave raids

            3. **Forced Labor**
               - Encomienda system
               - Mining operations
               - Agricultural exploitation

            4. **Starvation**
               - Food systems disrupted
               - Lands seized
               - Populations relocated

            5. **Cultural Destruction**
               - Loss of will to live documented
               - Suicide epidemics
               - Forced separation from meaning

            **This Is the Largest Population Collapse in Human History.**

            Some scholars call it genocide. Others say "demographic catastrophe." 
            The Church called it "God's will."

            **Columbus himself wrote:**
            "Let us in the name of the Holy Trinity go on sending all the slaves that can be sold."

            🔥 **The Scale**: 90% population loss. Tens of millions of people. Entire civilizations. Languages, religions, knowledge systems, genetic lineages—gone. And the Church blessed every step.
            """,
          keyPoints: [
            "90% population collapse—tens of millions dead",
            "Largest demographic catastrophe in human history",
            "Disease, violence, forced labor, starvation combined",
            "Church provided theological justification throughout",
          ]
        ),
      ]
    ),

    // ═══════════════════════════════════════════════════════════════
    // MODULE 4: WHAT REMAINS
    // ═══════════════════════════════════════════════════════════════

    CCModule(
      id: "cc_remains",
      number: 4,
      title: "What Survived",
      subtitle: "The resistance and reclamation",
      lessons: [
        CCLesson(
          id: "cc4_1",
          title: "Hidden in Plain Sight",
          content: """
            **Syncretism: The Survival Strategy**

            When outright resistance meant death, indigenous peoples found ways to preserve their traditions within Christianity.

            **Examples:**

            **Guadalupe/Tonantzin:**
            The Virgin of Guadalupe appeared at Tepeyac—the exact location of Tonantzin's temple (Aztec mother goddess). The image contains indigenous symbols. Millions worship her as both Mary AND the continuing presence of Tonantzin.

            **Día de los Muertos:**
            The Catholic All Saints Day merged with Aztec death rituals. The marigolds, the altars, the food offerings—all predate Christianity. The dead return to visit, not because of Catholic doctrine, but because they always did.

            **Santería, Candomblé, Vodou:**
            African traditions survived by associating Orishas/Lwa with Catholic saints:
            - Changó = Saint Barbara
            - Yemayá = Virgin of Regla
            - Elegua = Saint Anthony
            The drums, the possessions, the offerings—Africa survived in the Americas.

            **Curanderismo:**
            Indigenous healing traditions continued as "folk Catholicism":
            - Limpias (spiritual cleansings)
            - Herbal medicine
            - Communication with spirits
            Called "superstition" by the Church, but practiced for 500 years.

            **What This Means:**
            Indigenous spirituality didn't die. It went underground. It disguised itself. It waited. Now it's re-emerging openly as people reclaim suppressed identities.

            🔥 **The Resilience**: They couldn't kill everything. The traditions survived in symbols, in practices, in the DNA of cultures. What was hidden is now being recovered.
            """,
          keyPoints: [
            "Syncretism = survival strategy",
            "Guadalupe preserves Tonantzin",
            "Día de los Muertos is pre-Christian",
            "African religions survived through saint associations",
          ]
        ),

        CCLesson(
          id: "cc4_2",
          title: "The Recovery",
          content: """
            **The Movement to Reclaim**

            Across the Americas, indigenous peoples are recovering what was taken:

            **Language Revitalization:**
            - Hawaiian: Nearly extinct in 1980s, now 24,000+ speakers
            - Māori immersion schools
            - Cherokee online courses
            - Maya languages resurging
            - Navajo code: from military secret to cultural treasure

            **Land Back Movement:**
            - Returning stolen lands to indigenous stewardship
            - Lake Tahoe's recent return to Washoe people
            - National parks reconsidered
            - Sacred sites being protected

            **Spiritual Recovery:**
            - Sun Dances and potlatches (once illegal) now practiced openly
            - Sweat lodge ceremonies spreading
            - Ayahuasca churches gaining legal protection
            - Indigenous wisdom sought by non-natives

            **Legal Recognition:**
            - UNDRIP (UN Declaration on Rights of Indigenous Peoples)
            - Bolivia: Pachamama given legal rights
            - New Zealand: Whanganui River recognized as person
            - Canada: MMIW inquiry (Missing and Murdered Indigenous Women)

            **Truth Telling:**
            - Residential school investigations
            - Columbus statues removed
            - Junípero Serra statues toppled
            - School curricula being revised
            - This course exists

            🔥 **What You Can Do**: 
            1. Learn the real history
            2. Support indigenous-led organizations
            3. Attend indigenous cultural events (when invited)
            4. Advocate for Land Back
            5. Recognize whose land you're on
            6. Listen more than you speak

            The healing requires truth. The truth requires witnesses. You are now a witness.
            """,
          keyPoints: [
            "Languages being revitalized",
            "Land Back movement growing",
            "Spiritual practices returning openly",
            "Your role: learn, support, witness",
          ]
        ),
      ]
    ),
  ]
}

// MARK: - Supporting Types

struct CCModule: Identifiable {
  let id: String
  let number: Int
  let title: String
  let subtitle: String
  let lessons: [CCLesson]
}

struct CCLesson: Identifiable {
  let id: String
  let title: String
  let content: String
  let keyPoints: [String]
}
