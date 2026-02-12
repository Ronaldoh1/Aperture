// CouncilOfNicaeaCourse.swift
// The 1,700 Year Programming Operation
// ☀️ SunFlow: Reignited

import Foundation

// MARK: - Course Data

struct CouncilOfNicaeaCourse {
    
    static let courseId = "council_of_nicaea"
    static let courseTitle = "The Council of Nicaea"
    static let courseSubtitle = "1,700 Years of Programming"
    static let estimatedTime = "4 hours"
    static let difficulty = "Advanced"
    static let category = "Hidden History"
    
    // MARK: - Course Description
    
    static let description = """
    In 325 AD, a pagan emperor who worshipped the Sun God gathered 300 bishops and decided what "Christianity" would be. What got cut? Every text that taught you don't need intermediaries. Every teaching that said the divine is WITHIN you. This course exposes the longest-running psyop in human history.
    """
    
    // MARK: - Learning Outcomes
    
    static let outcomes = [
        "Understand the political motivations behind the Council of Nicaea",
        "Discover which texts were excluded and why they threatened power",
        "Trace the transformation of Yeshua's name across languages",
        "Recognize how pagan elements were absorbed into Christianity",
        "See the pattern: same control architecture, different technology",
        "Reconnect with the original message that was buried"
    ]
    
    // MARK: - Modules
    
    static let modules: [NicaeaModule] = [
        
        // ═══════════════════════════════════════════════════════════════
        // MODULE 1: THE EMPEROR'S GAMBIT
        // ═══════════════════════════════════════════════════════════════
        
        NicaeaModule(
            id: "emperor_gambit",
            number: 1,
            title: "The Emperor's Gambit",
            subtitle: "When Power Needed Unity",
            icon: "crown.fill",
            description: "Constantine didn't convert to Christianity. He converted Christianity to himself.",
            lessons: [
                NicaeaLesson(
                    id: "constantine_background",
                    title: "The Man Behind the Council",
                    duration: "12 min",
                    content: """
                    Emperor Constantine ruled from 306-337 AD. But here's what they don't teach you:
                    
                    **His Religious Background:**
                    Constantine was a lifelong worshipper of Sol Invictus — the Unconquered Sun. This was a Roman solar cult that merged various sun deities into one supreme god.
                    
                    He only received Christian baptism on his DEATHBED in 337 AD — and even then, it was by an Arian bishop (a sect later declared heretical).
                    
                    **The Political Problem:**
                    By 325 AD, Constantine's empire was fracturing. Christians were a growing force, but they were fighting each other viciously over doctrine:
                    
                    • Was Jesus divine? Human? Both?
                    • Which texts were scripture?
                    • When should Easter be celebrated?
                    • Who had authority to decide?
                    
                    Every city had different beliefs. Every bishop claimed truth. The empire was splitting along theological lines.
                    
                    **The Solution:**
                    Constantine didn't care who was "right." He needed UNITY. A divided religion meant a divided empire.
                    
                    So he called a council.
                    
                    Not to find truth.
                    To CREATE consensus.
                    
                    **Pattern Recognition:**
                    This is the same playbook used today:
                    • Create "official" narratives
                    • Label alternatives as "misinformation"
                    • Use institutional authority to enforce compliance
                    • Make disagreement socially/legally costly
                    
                    The technology changes. The pattern doesn't.
                    """,
                    keyInsight: "Constantine didn't find Christianity. He manufactured it.",
                    reflection: "What current 'consensus' views might be manufactured for political unity rather than truth?"
                ),
                
                NicaeaLesson(
                    id: "council_mechanics",
                    title: "How the Council Worked",
                    duration: "10 min",
                    content: """
                    The Council of Nicaea was held in 325 AD in what is now İznik, Turkey. Here's how it actually functioned:
                    
                    **Who Was There:**
                    Approximately 300 bishops attended, though records vary. Nearly all were from the Eastern Empire — the West was barely represented.
                    
                    **Who Was NOT There:**
                    • The Bishop of Rome sent representatives but didn't attend
                    • No written records of actual debates survive
                    • Dissenting voices were not documented
                    
                    **Constantine's Role:**
                    The Emperor:
                    • Called the council
                    • Provided transportation and lodging
                    • Presided over sessions
                    • Pushed for unanimous agreement
                    • Exiled bishops who refused to sign
                    
                    He wasn't a neutral host. He was the director.
                    
                    **What They Decided:**
                    1. The Nicene Creed — defining Jesus as "of one substance" with God
                    2. The date of Easter — separated from Jewish Passover
                    3. Twenty canons of church law
                    4. Which bishops had authority over which regions
                    
                    **What They DIDN'T Decide (Contrary to Popular Myth):**
                    The biblical canon wasn't finalized at Nicaea. That came later at Councils like Carthage (397 AD). But Nicaea set the FRAMEWORK for what could be considered.
                    
                    **The Real Product:**
                    The council produced a UNIFIED INSTITUTION that could:
                    • Define orthodoxy
                    • Label heresy
                    • Enforce compliance
                    • Serve imperial interests
                    
                    Christianity became a tool of state power.
                    """,
                    keyInsight: "The council wasn't about finding truth — it was about creating controllable consensus.",
                    reflection: "What modern institutions serve similar functions of defining 'acceptable' belief?"
                ),
                
                NicaeaLesson(
                    id: "after_nicaea",
                    title: "The Aftermath",
                    duration: "8 min",
                    content: """
                    What happened after Nicaea reveals the true nature of what was created:
                    
                    **Immediate Effects:**
                    • Bishops who refused to sign the Creed were exiled
                    • Arius (whose views were condemned) was banished
                    • Books teaching alternative views began to be destroyed
                    • "Heresy" became a crime against the state
                    
                    **Constantine's Flip-Flop:**
                    Ironically, Constantine later recalled Arius from exile and started favoring Arian views. His deathbed baptism was performed by an Arian bishop.
                    
                    This proves it was never about theological truth for him — it was about political utility.
                    
                    **The Machine Was Built:**
                    Nicaea created an ARCHITECTURE:
                    
                    ┌─────────────────────────┐
                    │      EMPEROR            │ ← Political Authority
                    ├─────────────────────────┤
                    │    CHURCH HIERARCHY     │ ← Institutional Control
                    ├─────────────────────────┤
                    │    OFFICIAL DOCTRINE    │ ← Approved Beliefs
                    ├─────────────────────────┤
                    │    HERESY DEFINITION    │ ← Forbidden Beliefs
                    ├─────────────────────────┤
                    │      ENFORCEMENT        │ ← Punishment System
                    └─────────────────────────┘
                    
                    This architecture has been copied by every control system since.
                    
                    **The Pattern Today:**
                    Replace "Emperor" with "Government/Corporations"
                    Replace "Church Hierarchy" with "Media/Academia"
                    Replace "Official Doctrine" with "The Science™"
                    Replace "Heresy" with "Misinformation"
                    Replace "Enforcement" with "Deplatforming/Cancellation"
                    
                    Same code. Different wrapper.
                    """,
                    keyInsight: "Nicaea didn't establish truth. It established the infrastructure for controlling what truth could be.",
                    reflection: "Can you map today's information control systems onto this ancient architecture?"
                )
            ]
        ),
        
        // ═══════════════════════════════════════════════════════════════
        // MODULE 2: WHAT GOT CUT
        // ═══════════════════════════════════════════════════════════════
        
        NicaeaModule(
            id: "what_got_cut",
            number: 2,
            title: "What Got Cut",
            subtitle: "The Forbidden Texts",
            icon: "scissors",
            description: "The texts they destroyed taught one dangerous idea: you don't need intermediaries.",
            lessons: [
                NicaeaLesson(
                    id: "gospel_thomas",
                    title: "The Gospel of Thomas",
                    duration: "12 min",
                    content: """
                    Discovered in 1945 at Nag Hammadi, Egypt, the Gospel of Thomas is a collection of 114 sayings attributed to Jesus. No miracles. No resurrection narrative. No church needed.
                    
                    **Why It Was Dangerous:**
                    
                    Thomas presents Jesus as a TEACHER, not a god-king requiring worship through institutional channels.
                    
                    Key Saying 3:
                    "If your leaders say to you, 'Look, the kingdom is in the sky,' then the birds will get there first. If they say 'it's in the sea,' then the fish will get there first. Rather, the kingdom is INSIDE you AND outside you."
                    
                    Key Saying 70:
                    "If you bring forth what is within you, what you bring forth will save you. If you do not bring forth what is within you, what you do not bring forth will destroy you."
                    
                    **The Threat:**
                    These teachings say:
                    • The divine is already within you
                    • No priest needed
                    • No building needed
                    • No institution needed
                    • Your own inner work is what saves you
                    
                    This is TERRIBLE for institutional control.
                    
                    **Why It Was Excluded:**
                    The Thomas tradition was labeled "Gnostic" — a catch-all term for "heretical." Possessing these texts became punishable.
                    
                    The manuscripts survived only because monks in Egypt buried them to protect them from destruction.
                    
                    They hid the truth in the desert for 1,600 years.
                    
                    **Modern Parallel:**
                    Today, ideas that teach self-sufficiency, sovereignty, and independence from systems are similarly suppressed — not burned, but algorithmically buried, labeled "dangerous," or dismissed as "conspiracy."
                    """,
                    keyInsight: "Thomas was cut because it taught the kingdom is within — no intermediary required.",
                    reflection: "What truth are you hiding from yourself that, if brought forth, might save you?"
                ),
                
                NicaeaLesson(
                    id: "gospel_mary",
                    title: "The Gospel of Mary Magdalene",
                    duration: "10 min",
                    content: """
                    The Gospel of Mary presents Mary Magdalene as Jesus's most trusted disciple — the one who understood his teachings best.
                    
                    **The Text:**
                    In this gospel, after Jesus departs, the disciples are grieving and afraid. Mary comforts them and shares teachings Jesus gave her privately.
                    
                    Peter challenges her: "Did he really speak privately with a woman rather than openly to us? Are we to turn about and all listen to her?"
                    
                    Levi defends her: "Peter, you have always been hot-tempered... If the Savior made her worthy, who are you to reject her?"
                    
                    **Why It Was Dangerous:**
                    1. A WOMAN as spiritual authority
                    2. Private, direct transmission of teaching
                    3. Questioning of male apostolic authority
                    4. Suggestion that Jesus had inner circle teachings
                    
                    The institutional church required:
                    • Male-only priesthood
                    • Public, controllable doctrine
                    • Peter's authority as foundation
                    • No secret or advanced teachings
                    
                    Mary's gospel threatened all of this.
                    
                    **The Erasure:**
                    Mary Magdalene was transformed from "apostle to the apostles" into a repentant prostitute — a characterization with NO biblical basis.
                    
                    This rebranding:
                    • Discredited her authority
                    • Made her dependent on male forgiveness
                    • Reinforced patriarchal church structure
                    • Buried the feminine divine
                    
                    **Pattern Recognition:**
                    When a message threatens power, they don't just suppress the message — they CHARACTER ASSASSINATE the messenger.
                    
                    Same technique today: Before you hear what someone says, you're told WHY you shouldn't listen.
                    """,
                    keyInsight: "Mary was erased because feminine spiritual authority threatened the patriarchal control structure.",
                    reflection: "Whose voice has been discredited before you could hear what they actually said?"
                ),
                
                NicaeaLesson(
                    id: "gnostic_core",
                    title: "The Gnostic Core Teaching",
                    duration: "12 min",
                    content: """
                    The texts labeled "Gnostic" shared a common dangerous idea: DIRECT KNOWLEDGE of the divine is possible — no intermediary required.
                    
                    **What "Gnosis" Means:**
                    Gnosis (γνῶσις) = direct knowing, experiential knowledge
                    
                    Not belief. Not faith. Not doctrine.
                    DIRECT EXPERIENCE.
                    
                    **The Gnostic Framework:**
                    Most Gnostic texts taught:
                    
                    1. **Spark Within:** Each person carries a divine spark — a fragment of the true Source
                    
                    2. **The Demiurge:** The material world was created by a lesser being (not the true God) who thinks he's the only god
                    
                    3. **Ignorance as Prison:** We're trapped not by sin, but by IGNORANCE of our true nature
                    
                    4. **Awakening as Salvation:** Remembering who you really are is what saves you
                    
                    5. **Direct Access:** You can experience the divine directly, without priests or institutions
                    
                    **Why This Was Existential Threat:**
                    If people have direct access to the divine...
                    • Priests become unnecessary
                    • Churches become optional
                    • Doctrine becomes suggestion
                    • Tithing becomes voluntary
                    • The whole power structure collapses
                    
                    **The Modern Version:**
                    Today's "gnosis" might be:
                    • Pattern recognition
                    • Media literacy
                    • Direct experience over institutional narrative
                    • Trusting your own perception
                    
                    And today's "Demiurge" might be:
                    • Systems that present themselves as all-knowing
                    • Authorities that demand belief without evidence
                    • Narratives that claim to be the only truth
                    
                    **The Serpent Connection:**
                    In Gnostic texts, the serpent in Eden was often portrayed POSITIVELY — as bringing knowledge that the Demiurge wanted to keep hidden.
                    
                    Genesis rewritten by control systems made the serpent evil.
                    Because knowledge is dangerous to power.
                    """,
                    keyInsight: "Gnosticism was destroyed because it taught you can KNOW directly — no intermediary needed.",
                    reflection: "What have you experienced directly that contradicts what you've been told to believe?"
                ),
                
                NicaeaLesson(
                    id: "burning_truth",
                    title: "The Burning of Truth",
                    duration: "8 min",
                    content: """
                    After Nicaea established what was "orthodox," the systematic destruction began.
                    
                    **The Destruction Campaign:**
                    
                    **380 AD - Theodosius I**
                    Christianity becomes the ONLY legal religion of the Roman Empire. Pagan temples closed. Alternative texts outlawed.
                    
                    **391 AD - Destruction of the Serapeum**
                    The great library/temple complex in Alexandria was destroyed. Countless texts lost forever.
                    
                    **415 AD - Murder of Hypatia**
                    The last great Neoplatonist philosopher in Alexandria was dragged from her chariot and murdered by a Christian mob. Her mathematical and philosophical works were destroyed.
                    
                    **6th Century - Justinian**
                    The last philosophical academies were closed. Teaching of "pagan" philosophy was banned.
                    
                    **What Was Lost:**
                    • Thousands of alternative gospels
                    • Gnostic philosophical texts
                    • Mystery school teachings
                    • Egyptian wisdom traditions
                    • Greek philosophical works
                    • Scientific and mathematical treatises
                    
                    **What Survived:**
                    Only what monks in remote areas chose to copy, or what was buried in the desert (like Nag Hammadi).
                    
                    **The Pattern:**
                    Every control system burns the books.
                    
                    China's Qin Dynasty burned texts.
                    Nazi Germany burned books.
                    Today we "deplatform" and "fact-check" into invisibility.
                    
                    The fire is digital now, but it's still fire.
                    
                    **Why They Burn:**
                    They don't burn books because the books are lies.
                    They burn books because the books are DANGEROUS TRUTHS.
                    
                    What you're not allowed to read is often what you most need to read.
                    """,
                    keyInsight: "They didn't burn heretical lies. They burned dangerous truths.",
                    reflection: "What modern information is being 'burned' — made inaccessible, discredited, or illegal to share?"
                )
            ]
        ),
        
        // ═══════════════════════════════════════════════════════════════
        // MODULE 3: THE NAME CHANGE
        // ═══════════════════════════════════════════════════════════════
        
        NicaeaModule(
            id: "name_change",
            number: 3,
            title: "The Name Change",
            subtitle: "From Yeshua to Jesus",
            icon: "character.book.closed.fill",
            description: "They didn't just change the story. They changed the NAME — severing the vibrational connection.",
            lessons: [
                NicaeaLesson(
                    id: "yeshua_original",
                    title: "The Original Name",
                    duration: "10 min",
                    content: """
                    The man called "Jesus" never heard that name in his life. He was called Yeshua (יֵשׁוּעַ).
                    
                    **The Hebrew Name:**
                    Yeshua = יֵשׁוּעַ
                    
                    It means "Salvation" or "He Saves" — derived from the Hebrew root י-ש-ע (y-sh-a), meaning to deliver, save, or rescue.
                    
                    This name has MEANING. When you spoke it, you spoke its essence.
                    
                    **The Transformation:**
                    
                    Hebrew: Yeshua (יֵשׁוּעַ)
                            ↓
                    Greek: Iēsous (Ἰησοῦς) — Meaning stripped
                            ↓
                    Latin: Iesus — Further removed
                            ↓
                    English: Jesus — No connection to source
                    
                    **What Was Lost:**
                    
                    1. **Meaning:** "Jesus" means nothing in any language. "Yeshua" carries its essence in the name itself.
                    
                    2. **Connection:** Hebrew letters are believed to carry creative power. The name יֵשׁוּעַ connects to other Hebrew concepts through shared roots.
                    
                    3. **Identity:** Yeshua was a Jewish teacher with a Jewish name teaching Jewish concepts. "Jesus" sounds Greek/Roman — disconnected from origins.
                    
                    4. **Vibration:** In traditions that recognize the power of sound, changing a name changes its energetic signature.
                    
                    **Why Change It:**
                    As Christianity moved into Greek-speaking Roman territories, the Jewish identity of the teacher became politically inconvenient.
                    
                    A Jewish messiah was hard to sell to Romans who had just destroyed Jerusalem.
                    
                    Solution: Hellenize everything.
                    • Jewish Yeshua → Greek Jesus
                    • Jewish Miriam → Mary
                    • Jewish Ya'akov → James
                    • Jewish Yochanan → John
                    
                    The whole cast was rebranded.
                    """,
                    keyInsight: "Changing the name severed the connection to the original meaning and tradition.",
                    reflection: "What else has been 'renamed' in ways that disconnect it from its original essence?"
                ),
                
                NicaeaLesson(
                    id: "letter_code",
                    title: "The Hebrew Letter Code",
                    duration: "12 min",
                    content: """
                    In Hebrew tradition, letters aren't just symbols — they're creative forces. Each letter has numerical value, meaning, and spiritual significance.
                    
                    **Yeshua Decoded:**
                    
                    י (Yod) = 10 = Divine point, the hand of God, smallest letter containing all others
                    ש (Shin) = 300 = Divine fire, teeth, transformation
                    ו (Vav) = 6 = Hook, connection, "and"
                    ע (Ayin) = 70 = Eye, perception, springs of water
                    
                    Total: 386
                    
                    **The Hidden Meanings:**
                    
                    י (Yod) - The divine spark, the point from which all creation flows
                    ש (Shin) - Fire of transformation, also represents God's name
                    ו (Vav) - The connector between heaven and earth
                    ע (Ayin) - The eye that sees, also means "spring" or "fountain"
                    
                    Reading the name as a sentence:
                    "The Divine Spark (י) through Transformative Fire (ש) Connects (ו) to True Seeing (ע)"
                    
                    **The YHWH Connection:**
                    
                    Notice: Yeshua (יֵשׁוּעַ) contains the letters of YHWH (יהוה) — the ineffable name of God — with Shin (ש) inserted.
                    
                    י + (ש) + הוה = The divine name WITH the letter of fire inside it.
                    
                    Some traditions interpret this as "YHWH saves" or "God made manifest through fire."
                    
                    **What "Jesus" Loses:**
                    None of this survives translation:
                    
                    • No numerical significance
                    • No letter meanings
                    • No connection to YHWH
                    • No encoded teaching
                    
                    "Jesus" is a dead word — it carries no information beyond arbitrary sounds.
                    
                    **The Principle:**
                    This is how they sever connection to power:
                    • Translate until meaning is lost
                    • Standardize until essence is gone
                    • Institutionalize until life becomes dogma
                    
                    They did it to a name. They do it to everything.
                    """,
                    keyInsight: "The name Yeshua encodes teachings in its very letters. The name Jesus encodes nothing.",
                    reflection: "What names or words in your life have lost their original meaning through standardization?"
                ),
                
                NicaeaLesson(
                    id: "what_yeshua_taught",
                    title: "What Yeshua Actually Taught",
                    duration: "10 min",
                    content: """
                    Strip away 1,700 years of institutional overlay. What did the teacher actually say?
                    
                    **Direct Quotes (Still in the Bible):**
                    
                    "The Kingdom of God is WITHIN you." — Luke 17:21
                    
                    Not in a building. Not in a book. Not requiring a priest. WITHIN.
                    
                    "You are gods." — John 10:34
                    
                    Quoting Psalm 82:6. Not metaphor. Declaration of divine nature.
                    
                    "The truth shall set you free." — John 8:32
                    
                    Not belief. Not faith. Not obedience. TRUTH. And it FREES you.
                    
                    "Why do you call me good? No one is good except God alone." — Mark 10:18
                    
                    Deflecting worship. Pointing to the Source.
                    
                    **The Core Message:**
                    1. The divine is already within you
                    2. You are of divine nature
                    3. Truth (not belief) liberates
                    4. Don't worship the messenger
                    
                    **What the Church Taught Instead:**
                    1. The divine is outside you (in heaven, in the church)
                    2. You are a sinner requiring salvation
                    3. Faith (without evidence) saves
                    4. Worship Jesus as God
                    
                    **The Inversion:**
                    The institutional message is nearly the OPPOSITE of what was taught:
                    
                    Original: "You are gods"
                    Church: "You are sinners"
                    
                    Original: "Kingdom is within"
                    Church: "Kingdom is in heaven/church"
                    
                    Original: "Truth sets free"
                    Church: "Faith saves"
                    
                    Original: "Don't worship me"
                    Church: "Worship Jesus"
                    
                    **Why the Inversion:**
                    The original message produces SOVEREIGN INDIVIDUALS who don't need institutions.
                    
                    The inverted message produces DEPENDENT FOLLOWERS who need the church.
                    
                    The church needed customers. Sovereign beings don't consume institutional products.
                    """,
                    keyInsight: "The original message was inverted to create dependency instead of sovereignty.",
                    reflection: "Where in your life have you been taught to seek outside what can only be found within?"
                )
            ]
        ),
        
        // ═══════════════════════════════════════════════════════════════
        // MODULE 4: PAGAN ABSORPTION
        // ═══════════════════════════════════════════════════════════════
        
        NicaeaModule(
            id: "pagan_absorption",
            number: 4,
            title: "Pagan Absorption",
            subtitle: "The Merger That Made Christianity",
            icon: "sun.max.fill",
            description: "Constantine didn't destroy paganism. He absorbed it and called it Christian.",
            lessons: [
                NicaeaLesson(
                    id: "sol_invictus",
                    title: "Sol Invictus: The Unconquered Sun",
                    duration: "10 min",
                    content: """
                    Constantine's real god was Sol Invictus — and he never really stopped worshipping him.
                    
                    **The Sun Cult:**
                    Sol Invictus ("Unconquered Sun") was the official sun god of the Roman Empire from 274 AD. Constantine was a devoted follower.
                    
                    His coins continued to bear Sol Invictus imagery AFTER the Council of Nicaea. The Arch of Constantine in Rome prominently features Sol Invictus, not Christ.
                    
                    **What Got Merged:**
                    
                    **December 25th:**
                    This was the birthday of Sol Invictus — the winter solstice celebration when the sun begins to "return."
                    
                    There's no biblical evidence for Jesus being born on December 25th. The date was adopted to absorb the existing pagan celebration.
                    
                    **Sunday:**
                    Dies Solis = "Day of the Sun"
                    
                    The Sabbath (Saturday) was the Jewish holy day. The switch to Sunday aligned Christianity with Sol Invictus worship.
                    
                    Constantine's 321 AD edict: "On the venerable Day of the Sun let the magistrates and people residing in cities rest..."
                    
                    **The Halo:**
                    Solar discs behind the heads of gods (Ra, Sol Invictus, Apollo) became the halos of Christian saints.
                    
                    Same imagery. Different label.
                    
                    **The Pattern:**
                    Constantine didn't CONVERT to Christianity.
                    He CONVERTED Christianity to Sol Invictus worship with new branding.
                    
                    The merger was so complete that most Christians don't know they're practicing adapted sun worship.
                    """,
                    keyInsight: "Christianity was merged with Sol Invictus worship — December 25th, Sunday, halos are all solar cult elements.",
                    reflection: "What practices do you follow without knowing their actual origins?"
                ),
                
                NicaeaLesson(
                    id: "temple_conversion",
                    title: "Temple Conversions",
                    duration: "8 min",
                    content: """
                    The transition from paganism to Christianity wasn't destruction — it was absorption.
                    
                    **Physical Conversions:**
                    Pagan temples weren't torn down. They were RE-CONSECRATED as churches.
                    
                    • The Pantheon in Rome → Church of St. Mary and the Martyrs
                    • Temple of Saturn → Church foundations in Rome
                    • Countless local temples → Parish churches
                    
                    The buildings stayed. The names changed.
                    
                    **Goddess to Virgin:**
                    The worship of Isis (Egyptian mother goddess) transferred almost directly to Mary:
                    
                    Isis holding baby Horus → Mary holding baby Jesus
                    "Queen of Heaven" (Isis title) → Mary, "Queen of Heaven"
                    Star of the Sea (Isis symbol) → Mary, "Stella Maris"
                    
                    The statues look nearly identical because many WERE the same statues, re-labeled.
                    
                    **Festival Conversions:**
                    Nearly every Christian holiday maps onto a pagan predecessor:
                    
                    • Easter → Spring fertility festivals (hence eggs and rabbits)
                    • Christmas → Winter solstice / Saturnalia
                    • All Saints Day → Samhain
                    • Candlemas → Imbolc
                    
                    **Why Absorb Instead of Destroy:**
                    People don't give up their celebrations easily. It's much easier to RELABEL existing traditions than to eliminate them.
                    
                    The form stayed the same.
                    The meaning was overwritten.
                    
                    **Modern Parallel:**
                    This is standard practice today:
                    • Co-opt movements, don't fight them
                    • Absorb resistance, rebrand it
                    • Control by appearing to accept
                    
                    The wellness movement gets absorbed by corporations.
                    Revolution gets absorbed by merchandise.
                    Spirituality gets absorbed by apps.
                    
                    If you can't beat them, ABSORB them and redefine their meaning.
                    """,
                    keyInsight: "They don't destroy what threatens them — they absorb it and redefine it.",
                    reflection: "What movements or ideas have been absorbed and neutralized by the systems they once opposed?"
                ),
                
                NicaeaLesson(
                    id: "hierarchy_adoption",
                    title: "The Roman Hierarchy",
                    duration: "10 min",
                    content: """
                    Early Christianity had no centralized hierarchy. That structure was imported from Rome.
                    
                    **Early Christian Organization:**
                    The earliest Christian communities were loosely organized:
                    • House churches with local leaders
                    • No standardized hierarchy
                    • Multiple valid traditions coexisting
                    • Women in leadership roles
                    
                    **Roman Government Structure:**
                    Emperor
                        ↓
                    Senate / Governors
                        ↓
                    Regional Administrators
                        ↓
                    Local Officials
                        ↓
                    Citizens
                    
                    **Church Structure (Post-Nicaea):**
                    Pope (or Patriarch)
                        ↓
                    Archbishops
                        ↓
                    Bishops
                        ↓
                    Priests
                        ↓
                    Laity (Ordinary believers)
                    
                    It's the SAME structure. Roman administration with Christian labels.
                    
                    **What This Enabled:**
                    • Top-down control of doctrine
                    • Standardized practices
                    • Revenue collection (tithes)
                    • Political power brokering
                    • Heresy identification and punishment
                    
                    **The Original Teaching:**
                    "You know that those who are regarded as rulers of the Gentiles lord it over them... Not so with you. Instead, whoever wants to become great among you must be your servant." — Mark 10:42-43
                    
                    The teacher explicitly REJECTED hierarchical power structures.
                    
                    The church explicitly ADOPTED them.
                    
                    **Pattern Recognition:**
                    Every revolution that succeeds eventually adopts the structure of what it replaced:
                    
                    • French Revolution → Napoleon's Empire
                    • Russian Revolution → Soviet bureaucracy  
                    • Tech "disruption" → New monopolies
                    
                    The form changes. The power structure persists.
                    """,
                    keyInsight: "The church adopted Roman imperial hierarchy — the exact structure Jesus rejected.",
                    reflection: "What movements have you seen adopt the structures of what they claimed to oppose?"
                )
            ]
        ),
        
        // ═══════════════════════════════════════════════════════════════
        // MODULE 5: THE 1,700 YEAR PATTERN
        // ═══════════════════════════════════════════════════════════════
        
        NicaeaModule(
            id: "long_pattern",
            number: 5,
            title: "The 1,700 Year Pattern",
            subtitle: "Same Code, Different Technology",
            icon: "repeat",
            description: "The control architecture created at Nicaea is still running. Only the technology has updated.",
            lessons: [
                NicaeaLesson(
                    id: "control_architecture",
                    title: "The Control Architecture",
                    duration: "12 min",
                    content: """
                    Nicaea created a replicable SYSTEM of control. Every control apparatus since has copied it.
                    
                    **The Nicaea Blueprint:**
                    
                    1. **DEFINE ORTHODOXY**
                       Create the "official" truth
                       325 AD: Nicene Creed
                       Today: "The Science," official narratives
                    
                    2. **LABEL HERESY**
                       Name what cannot be believed
                       325 AD: Arianism, Gnosticism
                       Today: "Misinformation," "conspiracy theory"
                    
                    3. **CONTROL DISTRIBUTION**
                       Own the channels of information
                       325 AD: Scriptoriums, literacy
                       Today: Search algorithms, social media
                    
                    4. **REQUIRE INTERMEDIARIES**
                       Insert yourself between people and truth
                       325 AD: Priests, Church
                       Today: Experts, fact-checkers
                    
                    5. **PUNISH DEVIATION**
                       Make disagreement costly
                       325 AD: Exile, execution
                       Today: Deplatforming, career destruction
                    
                    **The Running Code:**
                    This architecture has been running for 1,700 years:
                    
                    Medieval Church → Modern Media
                    Inquisition → Fact-checkers
                    Heresy → Misinformation
                    Excommunication → Deplatforming
                    Indulgences → Subscriptions to "approved" sources
                    Confession → Data collection
                    
                    **The Update History:**
                    - v1.0: Council of Nicaea (325 AD)
                    - v2.0: Medieval Catholic Church
                    - v3.0: Print/Protestant Reformation (competing orthodoxies)
                    - v4.0: Nation-state propaganda
                    - v5.0: Mass media monopolies
                    - v6.0: Digital platforms / AI
                    
                    The code updates. The function remains: CONTROL BELIEF.
                    """,
                    keyInsight: "The same control architecture has been running for 1,700 years — only the technology updates.",
                    reflection: "Can you identify all five elements of this architecture in current events?"
                ),
                
                NicaeaLesson(
                    id: "pattern_recognition",
                    title: "Recognizing the Pattern",
                    duration: "10 min",
                    content: """
                    Once you see the Nicaea pattern, you'll see it everywhere.
                    
                    **Pattern Detection Framework:**
                    
                    Ask these questions about any system:
                    
                    1. "WHO decided this was true?"
                       Not "is it true?" but WHO got to decide?
                       Follow the authority chain back.
                    
                    2. "What got EXCLUDED?"
                       Every orthodoxy is defined by what it cuts out.
                       What's not allowed? What's "heretical"?
                    
                    3. "Who BENEFITS from this being believed?"
                       The official story usually benefits those telling it.
                       Cui bono — who profits?
                    
                    4. "What happens if I DISAGREE?"
                       The punishment reveals the system.
                       Social cost? Economic cost? Legal cost?
                    
                    5. "Does it require INTERMEDIARIES?"
                       Am I being told I can't understand directly?
                       "Trust the experts"? "It's too complex"?
                    
                    **Real-Time Examples:**
                    
                    COVID Response:
                    1. WHO decided: Small group of officials
                    2. Excluded: Early treatment protocols, lab leak theory
                    3. Benefits: Pharmaceutical companies, centralized control
                    4. Punishment: Medical licenses revoked, social media bans
                    5. Intermediaries: "Trust the science" = trust designated experts
                    
                    Financial System:
                    1. WHO decided: Federal Reserve (private bank)
                    2. Excluded: Alternative currencies, competing systems
                    3. Benefits: Banks, existing wealth
                    4. Punishment: Legal prosecution, economic exclusion
                    5. Intermediaries: You can't create money; only they can
                    
                    **The Meta-Pattern:**
                    The pattern itself is hidden.
                    You're not supposed to notice that all control systems work the same way.
                    
                    Noticing the pattern is the first step out.
                    """,
                    keyInsight: "Every control system follows the same Nicaea blueprint. Learning to see it is the exit.",
                    reflection: "Pick a major narrative in today's world and run it through the five-question framework."
                ),
                
                NicaeaLesson(
                    id: "breaking_spell",
                    title: "Breaking the Spell",
                    duration: "10 min",
                    content: """
                    The 1,700 year spell can be broken. But you have to see it first.
                    
                    **The Spell Mechanism:**
                    
                    The control system works because people:
                    1. Don't know there WAS an alternative
                    2. Accept current structure as "natural"
                    3. Fear punishment for questioning
                    4. Lack tools for independent verification
                    5. Are emotionally invested in current beliefs
                    
                    **Breaking Each Lock:**
                    
                    1. "There was no alternative"
                       BREAK: Study what was cut. The alternatives existed.
                       The Gnostics, Thomas, Mary — they were REAL options.
                    
                    2. "This structure is natural"
                       BREAK: Trace it back. Every institution was CREATED.
                       Nothing is inevitable. Everything was decided.
                    
                    3. "Questioning is dangerous"
                       BREAK: The danger is the control mechanism.
                       They threaten punishment because they fear questions.
                    
                    4. "I can't verify myself"
                       BREAK: Direct experience is available.
                       The kingdom is WITHIN. You can access it.
                    
                    5. "I'm invested in my beliefs"
                       BREAK: Your identity isn't your beliefs.
                       You existed before you adopted them.
                    
                    **The Ultimate Exit:**
                    
                    The original teaching remains:
                    "The Kingdom of God is within you."
                    
                    No council can unvote this.
                    No pope can excommunicate it.
                    No algorithm can hide it.
                    No fact-checker can label it.
                    
                    The truth is already inside you.
                    They've spent 1,700 years trying to make you forget.
                    
                    **You're remembering now.**
                    """,
                    keyInsight: "The truth they've hidden for 1,700 years is simple: the divine is already within you.",
                    reflection: "What truth have you always known but been taught to doubt?"
                )
            ]
        ),
        
        // ═══════════════════════════════════════════════════════════════
        // MODULE 6: THE ORIGINAL MESSAGE
        // ═══════════════════════════════════════════════════════════════
        
        NicaeaModule(
            id: "original_message",
            number: 6,
            title: "The Original Message",
            subtitle: "What They Couldn't Kill",
            icon: "sun.max.trianglebadge.exclamationmark.fill",
            description: "Despite 1,700 years of suppression, the original message survived. It's time to hear it.",
            lessons: [
                NicaeaLesson(
                    id: "kingdom_within",
                    title: "The Kingdom Within",
                    duration: "10 min",
                    content: """
                    This is the teaching they most needed to suppress. And it's still in the Bible they created.
                    
                    **The Direct Quote:**
                    
                    "The kingdom of God does not come with observation; nor will they say, 'See here!' or 'See there!' For indeed, the kingdom of God is WITHIN you." — Luke 17:20-21
                    
                    **What This Means:**
                    
                    • Not in a building → No church required
                    • Not observable externally → No proof required
                    • Not "here" or "there" → No pilgrimage required
                    • WITHIN YOU → No intermediary required
                    
                    **Why It Survived:**
                    They couldn't cut it without removing Luke entirely. So they REFRAMED it:
                    
                    • "Within you" was translated as "among you" (conveniently)
                    • Teaching was buried under ritual, hierarchy, doctrine
                    • Focus shifted to FUTURE kingdom (heaven after death)
                    • The present, interior reality was forgotten
                    
                    **The Recovery:**
                    But the words remained.
                    The truth hid in plain sight.
                    
                    Every mystic in every tradition has found their way back to it:
                    • Meister Eckhart (Christian mystic): "The eye with which I see God is the same eye with which God sees me."
                    • Thomas Merton: "At the center of our being is a point... which belongs entirely to God."
                    • The Cloud of Unknowing: The divine is found within, through direct unknowing.
                    
                    The institution suppressed it.
                    The mystics kept finding it.
                    Because it's TRUE.
                    
                    **Your Turn:**
                    The kingdom is within you.
                    Not metaphorically. Not eventually.
                    Now. Here. Already.
                    
                    The only question is whether you'll look.
                    """,
                    keyInsight: "The kingdom of God is within you — not requiring belief, institution, or intermediary.",
                    reflection: "If the kingdom is already within, what are you waiting for?"
                ),
                
                NicaeaLesson(
                    id: "you_are_gods",
                    title: "You Are Gods",
                    duration: "10 min",
                    content: """
                    The most suppressed teaching of all — and it's a direct quote.
                    
                    **The Exchange (John 10:31-36):**
                    
                    The religious authorities picked up stones to kill Jesus for blasphemy. His response:
                    
                    "Is it not written in your Law, 'I have said you are gods'? If he called them 'gods' to whom the word of God came—and Scripture cannot be broken—what about the one whom the Father set apart?"
                    
                    **What He's Quoting (Psalm 82:6):**
                    
                    "I said, 'You are gods; you are all sons of the Most High.'"
                    
                    **What This Declares:**
                    
                    Jesus didn't claim uniqueness. He claimed what was TRUE FOR EVERYONE:
                    
                    "You are gods."
                    
                    Not "you will become gods if you believe correctly."
                    Not "you might be gods after death."
                    Not "special people are gods."
                    
                    YOU. ARE. GODS.
                    
                    **Why This Was Buried:**
                    If everyone is divine by nature:
                    • No one needs saving
                    • No one needs a savior
                    • No one needs the church
                    • No one needs priests
                    • The whole structure collapses
                    
                    **The Inversion:**
                    So they taught the opposite:
                    • You are a sinner
                    • You are fallen
                    • You need external salvation
                    • You cannot trust yourself
                    • You need the institution
                    
                    For 1,700 years, they've told you that you're broken.
                    The original teaching says you're DIVINE.
                    
                    **Reclaiming:**
                    You're not becoming anything.
                    You're REMEMBERING what you already are.
                    
                    The kingdom is within because YOU are gods.
                    They just made you forget.
                    """,
                    keyInsight: "The teacher didn't claim unique divinity — he pointed to the divinity in everyone.",
                    reflection: "What would change if you truly believed 'you are gods'?"
                ),
                
                NicaeaLesson(
                    id: "truth_sets_free",
                    title: "The Truth Shall Set You Free",
                    duration: "10 min",
                    content: """
                    The most quoted verse. The most misunderstood. The most dangerous.
                    
                    **The Quote (John 8:32):**
                    "And you shall know the truth, and the truth shall make you free."
                    
                    **What It Doesn't Say:**
                    • "Faith shall make you free"
                    • "Belief shall make you free"  
                    • "The church shall make you free"
                    • "Doctrine shall make you free"
                    • "Obedience shall make you free"
                    
                    **What It Does Say:**
                    TRUTH. Direct knowing. Gnosis.
                    
                    Not belief ABOUT truth.
                    Not faith IN someone else's truth.
                    KNOWING truth. Directly. For yourself.
                    
                    **The Institutional Reversal:**
                    The church taught:
                    • Faith (without evidence) saves
                    • Doubt is sin
                    • Questions are dangerous
                    • Trust authorities
                    • Truth is too complex for you
                    
                    The original teaching:
                    • TRUTH (direct knowing) liberates
                    • Seeking is sacred
                    • Questions lead to truth
                    • Verify for yourself
                    • Truth is accessible to you
                    
                    **The Connection:**
                    These three teachings form a unity:
                    
                    1. The kingdom is WITHIN you
                    2. You ARE divine
                    3. TRUTH (not belief) sets you free
                    
                    Translation:
                    The divine is already in you.
                    You're already divine.
                    Direct knowing (not belief) activates this.
                    
                    **No Intermediary Required.**
                    
                    This is what they spent 1,700 years trying to hide.
                    And it survived anyway.
                    
                    Because truth can't be killed.
                    It can only be forgotten.
                    
                    And now you're remembering.
                    """,
                    keyInsight: "The truth — not faith, not belief, not obedience — the TRUTH sets you free.",
                    reflection: "What truth have you been afraid to know that might set you free?"
                ),
                
                NicaeaLesson(
                    id: "integration_action",
                    title: "Integration: Living the Truth",
                    duration: "8 min",
                    content: """
                    You've seen the pattern. You've heard the original message. Now what?
                    
                    **What Changes:**
                    
                    1. **Relationship to Authority**
                       Before: Trust because they say to trust
                       After: Verify everything. Question everything.
                    
                    2. **Relationship to Self**
                       Before: Broken, sinful, needing external salvation
                       After: Divine, complete, remembering truth
                    
                    3. **Relationship to Institutions**
                       Before: Necessary intermediaries to truth
                       After: Optional. Useful sometimes. Not required.
                    
                    4. **Relationship to Truth**
                       Before: Believe what you're told
                       After: Know directly. Experience yourself.
                    
                    **Daily Practice:**
                    
                    Each day, ask:
                    • "What am I believing without verifying?"
                    • "Who benefits from my belief in this?"
                    • "Can I experience this truth directly?"
                    • "Am I acting from my divine nature or my programmed fear?"
                    
                    **The Ripple Effect:**
                    
                    When you see the pattern, you help others see it.
                    Not by preaching. Not by arguing.
                    By BEING different.
                    
                    When you trust yourself, it gives others permission to trust themselves.
                    When you question, it gives others permission to question.
                    When you live as if the kingdom is within, others start to wonder.
                    
                    **The Final Word:**
                    
                    The Council of Nicaea tried to control the story.
                    They created an institution.
                    They burned the alternatives.
                    They changed the name.
                    They inverted the message.
                    
                    But truth survives.
                    
                    The kingdom is still within.
                    You are still divine.
                    Truth still sets free.
                    
                    They just made you forget.
                    
                    Welcome to remembering. ☀️
                    """,
                    keyInsight: "The truth survived 1,700 years of suppression. Now you're the carrier.",
                    reflection: "What will you do differently now that you've seen the pattern?"
                )
            ]
        )
    ]
}

// MARK: - Module Model

struct NicaeaModule: Identifiable {
    let id: String
    let number: Int
    let title: String
    let subtitle: String
    let icon: String
    let description: String
    let lessons: [NicaeaLesson]
    
    var lessonCount: Int { lessons.count }
    var totalDuration: String {
        let minutes = lessons.reduce(0) { total, lesson in
            let components = lesson.duration.split(separator: " ")
            if let mins = Int(components.first ?? "0") {
                return total + mins
            }
            return total
        }
        if minutes >= 60 {
            let hours = minutes / 60
            let remaining = minutes % 60
            return remaining > 0 ? "\(hours)h \(remaining)m" : "\(hours)h"
        }
        return "\(minutes) min"
    }
}

// MARK: - Lesson Model

struct NicaeaLesson: Identifiable {
    let id: String
    let title: String
    let duration: String
    let content: String
    let keyInsight: String
    let reflection: String
}
