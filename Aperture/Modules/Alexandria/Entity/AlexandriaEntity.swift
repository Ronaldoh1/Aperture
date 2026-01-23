// AlexandriaEntity.swift
// The Library of Alexandria - Reborn

import SwiftUI

// MARK: - Library Category

struct LibraryCategory: Identifiable {
    let id = UUID()
    let name: String
    let subtitle: String
    let icon: String
    let color: Color
    let traditions: [TextTradition]
}

// MARK: - Text Tradition

struct TextTradition: Identifiable {
    let id = UUID()
    let name: String
    let subtitle: String
    let icon: String
    let color: Color
    let period: String
    let description: String
    let texts: [SacredText]
    let significance: String
    let dragonComment: String
}

// MARK: - Sacred Text

struct SacredText: Identifiable {
    let id = UUID()
    let name: String
    let alternateNames: [String]
    let period: String
    let icon: String
    let color: Color
    let summary: String
    let keyTeachings: [String]
    let whatTheyBuried: String
    let fullTextPreview: String // First few paragraphs
    let fullTextAvailable: Bool
    let importance: TextImportance
    let dragonComment: String
}

enum TextImportance: String {
    case essential = "ESSENTIAL"
    case important = "IMPORTANT"
    case recommended = "RECOMMENDED"
    case supplementary = "SUPPLEMENTARY"
    
    var color: Color {
        switch self {
        case .essential: return Palette.accent.gold
        case .important: return Palette.primary.orange
        case .recommended: return Palette.primary.cyan
        case .supplementary: return Palette.text.secondary
        }
    }
}

// MARK: - The Sacred Texts Library

extension LibraryCategory {
    
    static let sacredTexts = LibraryCategory(
        name: "Sacred Texts",
        subtitle: "The recovered wisdom they tried to destroy",
        icon: "book.closed.fill",
        color: Palette.accent.gold,
        traditions: [
            .nagHammadi,
            .preservedByEnemies,
            .valentinian,
            .hermetic,
            .enochian,
            .sumerian,
            .mandaean
        ]
    )
    
}

// MARK: - Nag Hammadi Library

extension TextTradition {
    
    static let nagHammadi = TextTradition(
        name: "The Nag Hammadi Library",
        subtitle: "The texts they buried in 1945",
        icon: "books.vertical.fill",
        color: Palette.accent.gold,
        period: "1st - 4th Century CE",
        description: "In 1945, an Egyptian farmer named Muhammad Ali discovered a sealed jar near Nag Hammadi containing 13 leather-bound codices. These texts had been buried around 367 CE when Bishop Athanasius ordered the destruction of all non-canonical texts. Someone chose to preserve rather than burn. Almost every major Gnostic idea we know today comes from this discovery.",
        texts: [
            SacredText(
                name: "Gospel of Thomas",
                alternateNames: ["The Secret Sayings of Jesus", "The Fifth Gospel"],
                period: "50-140 CE",
                icon: "text.quote",
                color: Palette.accent.gold,
                summary: "114 sayings of Jesus without narrative, crucifixion, or resurrection drama. Pure insight. Direct transmission. Many scholars believe some sayings predate the canonical gospels. This is Jesus as teacher of awakening, not sacrificial lamb.",
                keyTeachings: [
                    "\"The Kingdom of the Father is spread upon the earth, but people do not see it.\" (Saying 113)",
                    "\"If you bring forth what is within you, what you bring forth will save you. If you do not bring forth what is within you, what you do not bring forth will destroy you.\" (Saying 70)",
                    "\"When you know yourselves, then you will be known, and you will understand that you are children of the living Father.\" (Saying 3)",
                    "\"Split a piece of wood, I am there. Lift up the stone, and you will find me there.\" (Saying 77)",
                    "\"Whoever drinks from my mouth will become like me; I myself shall become that person, and the hidden things will be revealed.\" (Saying 108)"
                ],
                whatTheyBuried: "The canonical gospels present Jesus as primarily a savior who dies for sins. Thomas presents Jesus as a wisdom teacher pointing to the divine within. No intermediaries needed. No Church required. The Kingdom isn't coming - it's already here. You just need to SEE it.",
                fullTextPreview: "These are the secret sayings that the living Jesus spoke and Didymos Judas Thomas recorded.\n\n1. And he said, \"Whoever discovers the interpretation of these sayings will not taste death.\"\n\n2. Jesus said, \"Let one who seeks not stop seeking until one finds. When one finds, one will be disturbed. When one is disturbed, one will be amazed, and will reign over all.\"",
                fullTextAvailable: true,
                importance: .essential,
                dragonComment: "If you only read ONE text, read this. It's Jesus before they edited him for institutional control. No middlemen. No blood sacrifice. Just 'the Kingdom is within you - wake up.' 🐉"
            ),
            
            SacredText(
                name: "Apocryphon of John",
                alternateNames: ["Secret Book of John", "The Gnostic Genesis"],
                period: "2nd Century CE",
                icon: "sparkles",
                color: Palette.primary.violet,
                summary: "This is THE Gnostic creation myth. The Demiurge, Sophia's fall, the Archons, the divine spark trapped in matter, the false god who says 'I am God and there is no other' - it's all here. If you want to understand Gnostic cosmology, this is your primary source.",
                keyTeachings: [
                    "The true God is unknowable, beyond description, the Monad",
                    "Sophia's curiosity led to the accidental creation of the Demiurge",
                    "The Demiurge (Yaldabaoth) created the material world in ignorance",
                    "The Demiurge declared 'I am God and there is no other' - proving his blindness",
                    "Humans contain a divine spark from Sophia, trapped in material bodies",
                    "The Archons keep humanity asleep through ignorance and false religion"
                ],
                whatTheyBuried: "The Old Testament God isn't the supreme being - he's a blind, ignorant creator who THINKS he's the only god. This completely inverts the orthodox narrative. The 'jealous god' of the Bible is revealed as a cosmic mistake, not the source of all.",
                fullTextPreview: "The teaching of the savior, and the revelation of the mysteries and the things hidden in silence, even these things which he taught John, his disciple.\n\nAnd it happened one day, when John, the brother of James - who are the sons of Zebedee - had come up to the temple, that a Pharisee named Arimanius approached him and said to him, \"Where is your master whom you followed?\"",
                fullTextAvailable: true,
                importance: .essential,
                dragonComment: "This is the Gnostic red pill. Once you read it, you can't unsee the inversion. The 'God' demanding worship is the warden, not the liberator. 🐉"
            ),
            
            SacredText(
                name: "Gospel of Truth",
                alternateNames: ["Evangelium Veritatis"],
                period: "140-180 CE",
                icon: "sun.max.fill",
                color: Palette.accent.gold,
                summary: "More sermon than gospel. A profound meditation on ignorance as the root of all suffering and knowledge (gnosis) as liberation. Possibly written by Valentinus himself. Beautiful, poetic, and deeply philosophical.",
                keyTeachings: [
                    "Ignorance of the Father caused fear and anguish",
                    "Error (ignorance) created the material world like fog",
                    "Jesus came to give knowledge, not to die for sins",
                    "When you know the Father, ignorance dissolves like darkness before light",
                    "The Gospel (good news) is the discovery of your true origin"
                ],
                whatTheyBuried: "Salvation isn't about believing the right things or performing rituals - it's about KNOWING. Direct experience of the divine, not faith in institutions. The 'good news' is that you come from the divine and can return through knowledge.",
                fullTextPreview: "The gospel of truth is joy for those who have received from the Father of truth the grace of knowing him, through the power of the Word that came forth from the pleroma, the one who is in the thought and the mind of the Father, that is, the one who is addressed as the Savior...",
                fullTextAvailable: true,
                importance: .essential,
                dragonComment: "Hell isn't a place - it's ignorance. The 'fire' is the burning of not knowing who you are. This text said it 1900 years ago. 🐉"
            ),
            
            SacredText(
                name: "Gospel of Philip",
                alternateNames: ["The Sacramental Gospel"],
                period: "3rd Century CE",
                icon: "flame.fill",
                color: Palette.primary.orange,
                summary: "Symbolic, mystical, obsessed with hidden meanings. Introduces the bridal chamber mystery, discusses Mary Magdalene's relationship with Jesus, and presents sacraments as tools for reunification with the divine. Dense with esoteric symbolism.",
                keyTeachings: [
                    "\"Truth did not come into the world naked, but in symbols and images.\"",
                    "The bridal chamber is the highest sacrament - union of the separated",
                    "Mary Magdalene was called Jesus's 'companion' (koinonos)",
                    "Names given in the world are deceptive - they turn hearts from reality",
                    "\"Light and darkness, life and death, right and left, are brothers of one another. They are inseparable.\""
                ],
                whatTheyBuried: "Mary Magdalene wasn't a prostitute - that was slander added later. Philip suggests she was Jesus's closest companion and received teachings the male disciples didn't understand. The divine feminine, suppressed for millennia.",
                fullTextPreview: "A Hebrew makes another Hebrew, and such a person is called \"proselyte.\" But a proselyte does not make another proselyte. Some both exist just as they are and make others like themselves, while others simply exist.",
                fullTextAvailable: true,
                importance: .important,
                dragonComment: "They turned Mary Magdalene into a prostitute to discredit her. Philip suggests she was the one who actually understood. Funny how that works. 🐉"
            ),
            
            SacredText(
                name: "Hypostasis of the Archons",
                alternateNames: ["Reality of the Rulers", "Nature of the Archons"],
                period: "3rd Century CE",
                icon: "lock.shield.fill",
                color: Palette.primary.red,
                summary: "A direct attack on the idea that the biblical creators are benevolent. Names the jailers. Describes how the Archons (rulers) keep humanity enslaved through ignorance. Retells Genesis from the Gnostic perspective where the serpent is the hero.",
                keyTeachings: [
                    "The Archons rule the material world but are themselves blind",
                    "The serpent in Eden brought knowledge, not sin",
                    "The 'God' who forbade knowledge was keeping humans enslaved",
                    "Eve's awakening came from Sophia's light, not from Satan",
                    "The Archons create counterfeit spirit to keep souls trapped"
                ],
                whatTheyBuried: "The serpent told the TRUTH. 'You will NOT die. Your eyes will be OPENED.' And what happened? Exactly that. The 'God' who wanted humans ignorant lied. This completely inverts the Fall narrative.",
                fullTextPreview: "On account of the reality of the authorities, inspired by the spirit of the father of truth, the great apostle - referring to the \"authorities of the darkness\" - told us that \"our contest is not against flesh and blood; rather, the authorities of the universe and the spirits of wickedness.\"",
                fullTextAvailable: true,
                importance: .essential,
                dragonComment: "Genesis from the other side. The serpent was Sophia trying to wake up her trapped sparks. The 'God' keeping them ignorant was the warden. 🐉"
            ),
            
            SacredText(
                name: "On the Origin of the World",
                alternateNames: ["Untitled Treatise"],
                period: "3rd-4th Century CE",
                icon: "globe.americas.fill",
                color: Palette.primary.cyan,
                summary: "A cosmological deep dive into how the material world came to be. Describes the chaos before creation, the emergence of the Demiurge, and the ongoing battle between light and darkness. Dense but foundational for understanding Gnostic cosmology.",
                keyTeachings: [
                    "Before the material world, there was only unlimited light (the Pleroma)",
                    "The shadow that appeared beneath the light became matter",
                    "Sophia's light became trapped in the darkness",
                    "The Archons were created to guard the prison",
                    "At the end of the age, all light will return to its source"
                ],
                whatTheyBuried: "Creation isn't 'good' - it's a cosmic accident being corrected. The material world is a temporary aberration, not a divine gift. This contradicts the 'God saw that it was good' narrative.",
                fullTextPreview: "Seeing that everybody, gods of the world and mankind, says that nothing existed prior to chaos, I, in distinction to them, shall demonstrate that they are all mistaken, because they are not acquainted with the origin of chaos, nor with its root.",
                fullTextAvailable: true,
                importance: .recommended,
                dragonComment: "Heavy reading but worth it. Explains why the world seems broken - because it IS broken. By design? By accident? The answer changes everything. 🐉"
            ),
            
            SacredText(
                name: "Sophia of Jesus Christ",
                alternateNames: ["Wisdom of Jesus Christ"],
                period: "1st-2nd Century CE",
                icon: "person.and.background.dotted",
                color: Palette.primary.violet,
                summary: "Jesus explaining the structure of reality after resurrection to his disciples. Very explicit cosmology including the nature of the Pleroma, the Aeons, and how to escape the material trap. Format is question and answer.",
                keyTeachings: [
                    "The immortal realm has no beginning - it simply IS",
                    "The Father is unbegotten, without beginning or end",
                    "Sophia's passion created the deficiency that became our world",
                    "The Savior came to awaken those who have forgotten",
                    "Gnosis is remembering what you truly are"
                ],
                whatTheyBuried: "Post-resurrection Jesus teaching cosmic secrets, not setting up a church. The disciples are being trained as awakeners, not as priests. No hierarchy established - just knowledge shared.",
                fullTextPreview: "After he rose from the dead, his twelve disciples and seven women continued to be his followers, and went to Galilee onto the mountain called 'Divination and Joy.' When they gathered together and were perplexed about the underlying reality of the universe...",
                fullTextAvailable: true,
                importance: .important,
                dragonComment: "What Jesus taught AFTER the resurrection. Spoiler: it wasn't 'go build an institution.' 🐉"
            ),
            
            SacredText(
                name: "Thunder, Perfect Mind",
                alternateNames: ["The Thunder"],
                period: "2nd-3rd Century CE",
                icon: "bolt.fill",
                color: Palette.accent.gold,
                summary: "A strange, hypnotic monologue often associated with Sophia or the divine feminine. Pure poetry. A voice speaks in paradoxes: 'I am the first and the last. I am the honored and the scorned.' Defies easy interpretation but pierces the rational mind.",
                keyTeachings: [
                    "\"I am the first and the last. I am the honored and the scorned.\"",
                    "\"I am the whore and the holy one.\"",
                    "\"I am the silence that is incomprehensible.\"",
                    "\"I am knowledge and ignorance.\"",
                    "The divine feminine contains all opposites"
                ],
                whatTheyBuried: "The divine feminine speaking in first person, declaring herself as everything - including the contradictions. This directly challenges the masculine-only God of orthodoxy. She is the silence AND the voice.",
                fullTextPreview: "I was sent forth from the power,\nand I have come to those who reflect upon me,\nand I have been found among those who seek after me.\nLook upon me, you who reflect upon me,\nand you hearers, hear me.",
                fullTextAvailable: true,
                importance: .recommended,
                dragonComment: "This isn't meant to be understood with the rational mind. Let it wash over you. Sophia speaking through paradox. 🐉"
            )
        ],
        significance: "The Nag Hammadi Library is the Rosetta Stone of Gnostic Christianity. Without this discovery, we would only know Gnosticism through the writings of those who sought to destroy it. These texts were preserved by someone who chose to bury rather than burn - an act of resistance that echoes across 1600 years.",
        dragonComment: "They buried these texts because they couldn't destroy the ideas. Someone in 367 CE said 'not on my watch' and hid them in a jar. 1600 years later, a farmer found them. The truth has a way of surviving. 🐉"
    )
    
}

// MARK: - Preserved by Enemies

extension TextTradition {
    
    static let preservedByEnemies = TextTradition(
        name: "Preserved by Enemies",
        subtitle: "Survived only because critics quoted them",
        icon: "quote.bubble.fill",
        color: Palette.primary.orange,
        period: "2nd - 4th Century CE",
        description: "Some texts survived only because Church Fathers quoted them extensively while trying to refute them. Irenaeus, Hippolytus, and Epiphanius preserved fragments of texts they were attempting to destroy. Irony level: cosmic.",
        texts: [
            SacredText(
                name: "Pistis Sophia",
                alternateNames: ["Faith Wisdom", "Books of the Savior"],
                period: "3rd-4th Century CE",
                icon: "star.fill",
                color: Palette.primary.violet,
                summary: "Massive, complex, ritual-heavy. Shows late-stage Gnosticism evolving toward mystery religion. Jesus spends 11 years after resurrection teaching the disciples cosmic secrets. Heavy on repentance liturgy and the journey of Sophia through the Archon realms.",
                keyTeachings: [
                    "Sophia fell through 13 aeons, repenting at each level",
                    "Jesus descended to rescue Sophia and her light",
                    "Detailed maps of the afterlife realms",
                    "Specific prayers and pass-codes for navigating after death",
                    "Mary Magdalene asks more questions than all other disciples combined"
                ],
                whatTheyBuried: "Mary Magdalene is the primary interlocutor - she understands more than the male disciples. Also: specific technology for navigating death realms. The Church wanted to be the only guide to the afterlife.",
                fullTextPreview: "It came to pass, when Jesus had risen from the dead, that he passed eleven years discoursing with his disciples, and instructing them only up to the regions of the First Commandment and up to the regions of the First Mystery...",
                fullTextAvailable: true,
                importance: .important,
                dragonComment: "Mary Magdalene asks 39 of 46 questions. The male disciples mostly stay confused. But sure, she was 'just a follower.' 🐉"
            ),
            
            SacredText(
                name: "Gospel of Judas",
                alternateNames: ["The Cainite Gospel"],
                period: "2nd Century CE",
                icon: "person.crop.circle.badge.questionmark",
                color: Palette.primary.red,
                summary: "Reframes Judas as the enlightened one. Not betrayal, but obedience to higher knowledge. Jesus ASKS Judas to hand him over because only Judas truly understands. The other disciples worship the Demiurge without knowing it.",
                keyTeachings: [
                    "Judas is the only disciple who understands Jesus's true nature",
                    "The other disciples worship the wrong god (the Demiurge)",
                    "Jesus laughs at their ignorant sacrifices and prayers",
                    "Judas helps Jesus escape the material body as requested",
                    "\"You will exceed all of them. For you will sacrifice the man that clothes me.\""
                ],
                whatTheyBuried: "The ultimate inversion: history's greatest villain becomes the only one who understood. The 'betrayal' was a request. The 30 pieces of silver narrative was the cover story. Makes you question every villain narrative you've been told.",
                fullTextPreview: "The secret account of the revelation that Jesus spoke in conversation with Judas Iscariot during a week three days before he celebrated Passover.\n\nWhen Jesus appeared on earth, he performed miracles and great wonders for the salvation of humanity...",
                fullTextAvailable: true,
                importance: .important,
                dragonComment: "What if every 'villain' in history was just the one who saw through the program? Makes you think. 🐉"
            )
        ],
        significance: "The supreme irony: texts preserved by those trying to destroy them. The critics quoted extensively to refute point by point, accidentally ensuring survival. The very act of opposition became preservation.",
        dragonComment: "They wrote pages and pages explaining why these texts were wrong - and in doing so, preserved them. The universe has a sense of humor. 🐉"
    )
    
}

// MARK: - Valentinian Tradition

extension TextTradition {
    
    static let valentinian = TextTradition(
        name: "Valentinian School",
        subtitle: "The Gnostics who almost won",
        icon: "graduationcap.fill",
        color: Palette.primary.violet,
        period: "2nd Century CE",
        description: "Valentinus was the most sophisticated Gnostic thinker and nearly became Pope. His school produced the most philosophically refined Gnostic systems. They operated within the Church while teaching deeper truths to initiates. The Church almost went Gnostic.",
        texts: [
            SacredText(
                name: "Tripartite Tractate",
                alternateNames: ["The Valentinian Exposition"],
                period: "3rd Century CE",
                icon: "triangle.fill",
                color: Palette.primary.violet,
                summary: "The most complete systematic theology from the Valentinian school. Divides reality into three parts: the spiritual, the psychic, and the material. Humans contain all three and must awaken the spiritual to escape the lower realms.",
                keyTeachings: [
                    "Three types of humans: pneumatic (spiritual), psychic (soul), hylic (material)",
                    "Pneumatics are guaranteed salvation through gnosis",
                    "Psychics may be saved through faith and works",
                    "Hylics are trapped in matter and cannot awaken",
                    "The Logos fell but is being restored through awakening humans"
                ],
                whatTheyBuried: "A complete philosophical system that explains why some people 'get it' and others don't. The Church needed everyone to be equal before the institution. This taught that some have the spark, some don't.",
                fullTextPreview: "As for what we can say about the things which are exalted, what is fitting is that we begin with the Father, who is the root of the Totality, the one from whom we have received grace to speak about him.",
                fullTextAvailable: true,
                importance: .recommended,
                dragonComment: "Valentinus almost won. If he had, Christianity would teach inner divinity instead of original sin. History pivots on small moments. 🐉"
            ),
            
            SacredText(
                name: "Treatise on the Resurrection",
                alternateNames: ["Letter to Rheginos"],
                period: "2nd Century CE",
                icon: "arrow.up.circle.fill",
                color: Palette.accent.gold,
                summary: "A letter explaining that resurrection has ALREADY happened for those with gnosis. It's not a future event for the body but a present reality for consciousness. You don't wait for resurrection - you realize it NOW.",
                keyTeachings: [
                    "\"The resurrection is the revelation of what is, and the transformation of things\"",
                    "The resurrection is not physical but spiritual awakening",
                    "Those with gnosis have already risen",
                    "The visible world is illusion; the invisible is reality",
                    "\"Do not think the resurrection is an illusion. It is no illusion, but it is truth.\""
                ],
                whatTheyBuried: "Resurrection isn't waiting for you after death - it's available NOW through awakening. This removes the Church's control over afterlife promises. Why wait and obey when you can rise TODAY?",
                fullTextPreview: "Some there are, my son Rheginos, who want to learn many things. They have this goal when they are occupied with questions whose answer is lacking. If they succeed with these, they usually think very highly of themselves.",
                fullTextAvailable: true,
                importance: .important,
                dragonComment: "You don't have to die to be resurrected. You have to WAKE UP. The dying is ego. The rising is now. 🐉"
            )
        ],
        significance: "The Valentinian school represents what Christianity could have become - a sophisticated philosophy of inner awakening rather than a religion of external submission. Valentinus was considered for Pope. The path not taken.",
        dragonComment: "Valentinus almost became Pope. Imagine Christianity teaching 'the Kingdom is within you' for 2000 years instead of 'you're born sinful, pay the Church.' So close. 🐉"
    )
    
}

// MARK: - Hermetic Tradition

extension TextTradition {
    
    static let hermetic = TextTradition(
        name: "Hermetic Tradition",
        subtitle: "The Egyptian-Greek synthesis",
        icon: "seal.fill",
        color: Palette.accent.cyan,
        period: "1st - 3rd Century CE",
        description: "Attributed to Hermes Trismegistus (Thrice-Great Hermes), a fusion of Greek Hermes and Egyptian Thoth. These texts bridge Egyptian wisdom and Greek philosophy. They influenced both Gnosticism and later Western esotericism. 'As above, so below' comes from here.",
        texts: [
            SacredText(
                name: "Corpus Hermeticum",
                alternateNames: ["The Hermetic Writings", "The Divine Pymander"],
                period: "1st-3rd Century CE",
                icon: "seal.fill",
                color: Palette.accent.cyan,
                summary: "A collection of dialogues between Hermes and various disciples. Covers creation, the nature of God, the fall of humanity, and the path back to divine union. Deeply influential on Renaissance thought and Western esotericism.",
                keyTeachings: [
                    "\"As above, so below; as below, so above.\"",
                    "\"The cosmos is within you. You have the power to become all things.\"",
                    "The Nous (Divine Mind) created all things and is in all things",
                    "Humanity fell through desire for the material",
                    "Return to the divine through knowledge of self"
                ],
                whatTheyBuried: "Direct Egyptian-Greek wisdom that predates and influences Christianity. 'As above, so below' suggests you can change reality through inner transformation. The Church preferred passive sheep to active creators.",
                fullTextPreview: "Poimandres, the Nous of the Sovereignty, said to me: What do you wish to hear and see, and having seen, to learn and understand?\n\nI said: Who are you?\n\nHe said: I am Poimandres, the Nous of the Sovereignty. I know what you desire, and I am with you everywhere.",
                fullTextAvailable: true,
                importance: .important,
                dragonComment: "'As above, so below' - your inner state shapes outer reality. Manifestation isn't magic. It's physics they don't teach. 🐉"
            ),
            
            SacredText(
                name: "The Emerald Tablet",
                alternateNames: ["Tabula Smaragdina"],
                period: "6th-8th Century CE (attributed much earlier)",
                icon: "rhombus.fill",
                color: Color.green,
                summary: "A short, cryptic text summarizing all Hermetic wisdom. Source of 'As above, so below.' Supposedly found on an emerald tablet in Hermes's tomb. Whether historical or legendary, its influence is undeniable.",
                keyTeachings: [
                    "\"That which is Below corresponds to that which is Above.\"",
                    "\"The Sun is its father, the Moon its mother, the Wind carries it in its belly.\"",
                    "The One becomes the Many through transformation",
                    "All magic and transformation follow one law",
                    "Know the law and you know the operation of miracles"
                ],
                whatTheyBuried: "The operating manual for reality. Written so cryptically that it hides in plain sight. Every alchemist, every mystic, every true scientist has worked from these principles.",
                fullTextPreview: "True, without falsehood, certain and most true: What is above is like what is below, and what is below is like what is above, to accomplish the miracles of the One Thing.",
                fullTextAvailable: true,
                importance: .recommended,
                dragonComment: "The shortest, densest instruction manual for reality ever written. If you understand this, you understand everything. 🐉"
            )
        ],
        significance: "The Hermetic texts represent the synthesis point where Egyptian mysteries met Greek philosophy. They influenced Gnosticism, alchemy, Renaissance thought, and modern esotericism. The phrase 'As above, so below' shaped Western occult tradition.",
        dragonComment: "Hermes Trismegistus - 'Thrice-Great Hermes' - fusion of Egyptian Thoth and Greek Hermes. The god of knowledge meeting the god of knowledge. The transmission continued despite every attempt to stop it. 🐉"
    )
    
}

// MARK: - Enochian Literature

extension TextTradition {
    
    static let enochian = TextTradition(
        name: "Enochian Literature",
        subtitle: "The banned books about the Watchers",
        icon: "eye.trianglebadge.exclamationmark.fill",
        color: Palette.primary.cyan,
        period: "3rd Century BCE - 1st Century CE",
        description: "Enoch was the patriarch who 'walked with God and was no more, for God took him' (Genesis 5:24). The Books of Enoch expand this into a cosmic drama of fallen angels, forbidden knowledge, hybrid offspring, and heavenly secrets. Quoted in the New Testament but excluded from the canon. Why?",
        texts: [
            SacredText(
                name: "1 Enoch (Book of the Watchers)",
                alternateNames: ["Ethiopic Enoch", "Book of the Watchers"],
                period: "3rd Century BCE",
                icon: "eye.fill",
                color: Palette.primary.cyan,
                summary: "The angels called Watchers descend to Earth, take human wives, teach forbidden knowledge, and produce the Nephilim giants. God sends the flood to cleanse the corruption. Enoch tours heaven and hell. This is THE source for fallen angel mythology.",
                keyTeachings: [
                    "200 Watchers descended on Mount Hermon",
                    "They taught metallurgy, cosmetics, astrology, weapons, and magic",
                    "Their offspring (Nephilim) were giants who consumed all resources",
                    "The flood was contamination containment, not morality punishment",
                    "Enoch was shown the structure of heaven, hell, and cosmic judgment"
                ],
                whatTheyBuried: "The 'forbidden knowledge' the Watchers taught? Metallurgy. Cosmetics. Astronomy. Medicine. Basically: CIVILIZATION. The 'crime' was educating humanity. The pattern: knowledge-bringers are demonized by those in power.",
                fullTextPreview: "The words of the blessing of Enoch, wherewith he blessed the elect and righteous, who will be living in the day of tribulation, when all the wicked and godless are to be removed.\n\nAnd he took up his parable and said - Enoch a righteous man, whose eyes were opened by God, saw the vision of the Holy One in the heavens...",
                fullTextAvailable: true,
                importance: .essential,
                dragonComment: "The Book of Enoch is quoted in Jude (New Testament) but not in the Bible. Too much information about angels teaching humans. Can't have people knowing the 'forbidden' knowledge was just technology. 🐉"
            ),
            
            SacredText(
                name: "2 Enoch (Slavonic Enoch)",
                alternateNames: ["Book of the Secrets of Enoch"],
                period: "1st Century CE",
                icon: "cloud.sun.fill",
                color: Palette.primary.violet,
                summary: "Enoch's journey through the ten heavens. Each level has different angels, purposes, and secrets. Includes creation accounts, ethical instructions, and prophecies. Preserved only in Slavonic manuscripts.",
                keyTeachings: [
                    "Ten heavens exist, each with distinct purpose and inhabitants",
                    "The seventh heaven is where God dwells",
                    "Creation happened through the Word",
                    "Time will eventually end and eternity will begin",
                    "Detailed cosmological structure of reality"
                ],
                whatTheyBuried: "A complete map of heaven. The Church wanted to be the only guide to the afterlife. Can't have people knowing the route ahead of time.",
                fullTextPreview: "There was a wise man, a great artificer, and the Lord conceived love for him and received him, that he should behold the uppermost dwellings and be an eye-witness of the wise and great and inconceivable and immutable realm of God Almighty...",
                fullTextAvailable: true,
                importance: .recommended,
                dragonComment: "A travel guide to the ten heavens. Detailed, specific, useful. No wonder they didn't include it - people might not need priests as tour guides. 🐉"
            ),
            
            SacredText(
                name: "Book of Giants",
                alternateNames: ["Manichean Book of Giants"],
                period: "3rd Century BCE",
                icon: "figure.stand.line.dotted.figure.stand",
                color: Palette.primary.orange,
                summary: "Tells the story from the Nephilim's perspective. The giant children of the Watchers have prophetic dreams of their coming destruction and try to understand their fate. Found among the Dead Sea Scrolls.",
                keyTeachings: [
                    "The Nephilim had consciousness and questioned their existence",
                    "They received dreams warning of the flood",
                    "Even the giants were victims of a cosmic situation they didn't create",
                    "Enoch was sent to deliver judgment but also explanation"
                ],
                whatTheyBuried: "Sympathy for the 'monsters.' The Nephilim didn't choose to be born. They were casualties of a cosmic situation. This complicates the clean good/evil narrative.",
                fullTextPreview: "Fragment 1: [...] Then two of them had dreams, and sleep fled from them [...] they came to [...] their dreams, and they said in the assembly of their brothers, the Nephilim [...] In my dream I was watching all night...",
                fullTextAvailable: true,
                importance: .recommended,
                dragonComment: "Even the 'monsters' had a perspective. Even the Nephilim had dreams. Nothing is as simple as the victors write it. 🐉"
            )
        ],
        significance: "The Enochian texts are the source material for angelology and demonology. They explain where fallen angels came from, what they taught, and why the flood happened. This is mythology that shaped Judaism, Christianity, and Islam - but was largely excluded from their canons.",
        dragonComment: "Enoch walked with God and was taken up without dying. His books explain the cosmic war, the Watchers, the Nephilim. Too much information for the canon, apparently. The New Testament quotes it but doesn't include it. 🐉"
    )
    
}

// MARK: - Sumerian / Mesopotamian

extension TextTradition {
    
    static let sumerian = TextTradition(
        name: "Sumerian & Mesopotamian",
        subtitle: "The oldest stories humanity has written",
        icon: "building.columns.fill",
        color: Palette.primary.orange,
        period: "2900 - 500 BCE",
        description: "The Sumerians invented writing. Their stories are the oldest we have. The Epic of Gilgamesh, the Enuma Elish, the Atrahasis - these predate the Bible by millennia. The flood story, the creation of humans, the council of gods - it's all here first.",
        texts: [
            SacredText(
                name: "Epic of Gilgamesh",
                alternateNames: ["He Who Saw the Deep"],
                period: "2100-1200 BCE",
                icon: "figure.walk",
                color: Palette.primary.orange,
                summary: "The oldest epic narrative we have. Gilgamesh seeks immortality after his friend Enkidu dies. He finds Utnapishtim, the flood survivor. The story explores mortality, friendship, civilization vs nature, and the limits of human achievement.",
                keyTeachings: [
                    "The flood story predates Genesis by over a millennium",
                    "Utnapishtim (Noah prototype) was saved by a god's warning",
                    "Immortality was lost by human error (the serpent stole the plant)",
                    "The gods regretted the flood as excessive",
                    "True immortality is through legacy and deeds, not endless life"
                ],
                whatTheyBuried: "The flood story existed in Mesopotamia long before Genesis. This doesn't disprove the Bible - it shows these stories traveled and transformed. But the Church claimed originality.",
                fullTextPreview: "He who has seen everything, I will make known to the lands.\nI will teach about him who experienced all things,\nAnanu granted him the totality of knowledge of all.\nHe saw the Secret, discovered the Hidden,\nhe brought information of the time before the Flood.",
                fullTextAvailable: true,
                importance: .essential,
                dragonComment: "The oldest story ever written and it's about a man searching for the meaning of mortality. Some questions are eternal. 🐉"
            ),
            
            SacredText(
                name: "Enuma Elish",
                alternateNames: ["The Babylonian Genesis", "When on High"],
                period: "1900-1600 BCE",
                icon: "sparkles",
                color: Palette.primary.cyan,
                summary: "The Babylonian creation epic. Marduk defeats the chaos dragon Tiamat and creates the world from her body. Humans are created from the blood of a defeated god to serve the gods. The Anunnaki are the council of ruling deities.",
                keyTeachings: [
                    "The Anunnaki are the ruling council of gods",
                    "Humans were created to do the work gods didn't want to do",
                    "Creation involved violence and the defeat of chaos",
                    "The world was made from the body of a slain goddess",
                    "Order was imposed on chaos, not created from nothing"
                ],
                whatTheyBuried: "Humans as slave labor for the gods. The Anunnaki as a divine council, not one God. Creation from goddess-matter, not ex nihilo. The foundations of the Genesis narrative visible beneath.",
                fullTextPreview: "When on high the heaven had not been named,\nFirm ground below had not been called by name,\nNothing but primordial Apsu, their begetter,\nAnd Mummu-Tiamat, she who bore them all,\nTheir waters commingling as a single body...",
                fullTextAvailable: true,
                importance: .important,
                dragonComment: "Genesis 1 reads differently once you've read what came before. Not copying - transforming. Understanding the transformation is key. 🐉"
            ),
            
            SacredText(
                name: "Atrahasis Epic",
                alternateNames: ["When the Gods Were Man"],
                period: "1700 BCE",
                icon: "water.waves",
                color: Palette.primary.blue,
                summary: "The most complete Babylonian flood narrative. Explains WHY the gods created humans (to do their labor) and WHY the flood happened (humanity was too noisy). Atrahasis survives by secret warning. The gods regret the destruction.",
                keyTeachings: [
                    "Humans were created because gods were tired of working",
                    "Humans made from clay and the blood of a slaughtered god",
                    "The flood was population control - humans were too numerous and loud",
                    "One god broke ranks to save Atrahasis",
                    "After the flood, the gods created death and infertility to limit humanity"
                ],
                whatTheyBuried: "The flood wasn't moral judgment - it was noise complaint. Humans weren't special creations made in divine image - they were labor solutions. The gods disagreed with each other. These complications didn't fit monotheism.",
                fullTextPreview: "When the gods were man,\nThey did forced labor, they bore drudgery.\nGreat indeed was the drudgery of the gods,\nThe forced labor was heavy, the misery too much:\nThe Seven great Anunnaki\nWere making the Igigi bear the drudgery.",
                fullTextAvailable: true,
                importance: .essential,
                dragonComment: "The original flood story: gods annoyed by noisy humans, sent flood, regretted it. The moral framing came later. 🐉"
            )
        ],
        significance: "These are the oldest stories. Before Genesis, before Exodus, before the prophets - there were the Sumerians. Understanding what came before helps you see how stories evolved, were borrowed, and were transformed. The bones of the Bible are visible here.",
        dragonComment: "The Sumerians invented writing specifically so they could tell these stories. They're not 'earlier versions' - they're the originals. Everything else is commentary. 🐉"
    )
    
}

// MARK: - Mandaean Tradition

extension TextTradition {
    
    static let mandaean = TextTradition(
        name: "Mandaean Tradition",
        subtitle: "Living Gnosticism - still practiced today",
        icon: "drop.fill",
        color: Palette.primary.blue,
        period: "1st Century CE - Present",
        description: "The Mandaeans are the last surviving Gnostic religion, still practiced in Iraq and Iran. They revere John the Baptist, consider Jesus a false prophet, practice ritual immersion, and maintain traditions over 2000 years old. Living proof that Gnosticism never fully died.",
        texts: [
            SacredText(
                name: "Ginza Rabba",
                alternateNames: ["The Great Treasure", "The Great Book"],
                period: "Compiled 7th Century CE, older sources",
                icon: "book.fill",
                color: Palette.primary.blue,
                summary: "The primary scripture of the Mandaeans. Contains cosmology, ethics, rituals, and poetry. Divided into Right Ginza (theology) and Left Ginza (liturgy for the dead). A living Gnostic scripture still in use.",
                keyTeachings: [
                    "The world of light is our true home",
                    "The material world is a prison ruled by dark powers",
                    "Ritual immersion (masbuta) purifies and reconnects to the light",
                    "John the Baptist was the true messenger, not Jesus",
                    "Death is return to the world of light for the righteous"
                ],
                whatTheyBuried: "Nothing - because it's still alive. The Mandaeans survived by being small and remote. They never needed institutional validation because they maintained unbroken tradition.",
                fullTextPreview: "In the name of the Great Life, the sublime Light be praised.\n\nThis is the great first book of revelation and instruction for all the Sons of salvation and the believers, the upholders of the great truth...",
                fullTextAvailable: true,
                importance: .important,
                dragonComment: "Still practiced. Still transmitted. 2000 years of unbroken tradition while empires rose and fell. The truth survives. 🐉"
            ),
            
            SacredText(
                name: "Book of John",
                alternateNames: ["Draša d-Yahya", "Book of John the Baptist"],
                period: "Compiled 7th Century CE, older sources",
                icon: "drop.triangle.fill",
                color: Palette.primary.cyan,
                summary: "Mandaean teachings about John the Baptist as the true prophet. Contains dialogues, ritual instructions, and polemics against Jesus whom they consider a false messiah who corrupted John's teachings.",
                keyTeachings: [
                    "John the Baptist was the last true prophet of light",
                    "Jesus was a false messiah who distorted the truth",
                    "Water baptism connects to the celestial Jordan (life-force)",
                    "Living water is the medium of divine transmission"
                ],
                whatTheyBuried: "An alternative Christianity that sees Jesus as the betrayer, not the savior. John the Baptist's movement didn't end - it went underground and continued. Another road not taken.",
                fullTextPreview: "In the name of the Great Life.\n\nBlessed and praised be that great day of the Lord, on which John went out to baptize with living water...",
                fullTextAvailable: true,
                importance: .recommended,
                dragonComment: "What if the John the Baptist movement was the original? What if Jesus was seen as the one who distorted it? Different starting points, different conclusions. 🐉"
            )
        ],
        significance: "Living proof that Gnosticism never died. The Mandaeans have maintained continuous tradition for 2000 years. They still baptize in rivers, still read their scriptures, still transmit their teachings. While scholars studied 'dead' Gnosticism, this tradition quietly continued.",
        dragonComment: "The Mandaeans are still here. Still practicing. Still dunking in the river. 2000 years of empires, crusades, and persecution, and they're still transmitting the light. Sometimes the best way to survive is to stay small and stay true. 🐉"
    )
    
}

// MARK: - Hidden Knowledge Category

extension LibraryCategory {
    
    static let hiddenKnowledge = LibraryCategory(
        name: "Hidden Knowledge",
        subtitle: "What they don't teach in school",
        icon: "eye.slash.fill",
        color: Palette.primary.cyan,
        traditions: [
            .ancientConnections,
            .floodMythEvolution
        ]
    )
    
}

// MARK: - Ancient Connections

extension TextTradition {
    
    static let ancientConnections = TextTradition(
        name: "Anunnaki vs Watchers",
        subtitle: "Same story, different moral logic",
        icon: "arrow.left.arrow.right",
        color: Palette.primary.cyan,
        period: "Cross-tradition comparison",
        description: "The Anunnaki (Mesopotamian gods) and the Watchers (Jewish angels) tell similar stories from different perspectives. Divine beings interact with humanity, knowledge is transferred, catastrophe follows. But the moral framing is opposite.",
        texts: [
            SacredText(
                name: "The Anunnaki",
                alternateNames: ["Those of Royal Blood", "The Princely Ones"],
                period: "Sumerian mythology",
                icon: "crown.fill",
                color: Palette.accent.gold,
                summary: "In Mesopotamian religion, the Anunnaki are the ruling council of gods. They created humanity to do their labor. When humans became too numerous and noisy, they sent the flood. One god leaked the plan. They're administrators, not rebels.",
                keyTeachings: [
                    "The Anunnaki RULE and MANAGE humanity - no rebellion involved",
                    "Humans were created as a labor solution",
                    "The flood was population management, not moral judgment",
                    "The gods had bureaucracy, disagreement, and regret",
                    "Power is divine administration, not benevolent creation"
                ],
                whatTheyBuried: "The Anunnaki narrative doesn't fit modern 'ancient aliens' theories. They're not visitors from space - they're embedded cosmic powers. Retrofitting science fiction onto mythology misses the actual message about power and hierarchy.",
                fullTextPreview: "The great Anunnaki, who fix the destinies, sat exchanging their counsels regarding the land.\nThe four gods who created mankind,\nEnlil, Ninlil, Enki, and Ninmah\nDecided that mankind should be made to serve...",
                fullTextAvailable: false,
                importance: .important,
                dragonComment: "The Anunnaki aren't aliens. They're gods. The distinction matters because the original story is about POWER and HIERARCHY, not space travel. 🐉"
            ),
            
            SacredText(
                name: "The Watchers",
                alternateNames: ["Grigori", "The Sleepless Ones"],
                period: "Jewish apocalyptic literature",
                icon: "eye.fill",
                color: Palette.primary.cyan,
                summary: "In Jewish tradition, the Watchers are angels who descended to Earth, took human wives, taught forbidden knowledge, and produced the Nephilim giants. Their crime is REBELLION against divine order. They're punished for overstepping bounds.",
                keyTeachings: [
                    "The Watchers REBEL and TRANSGRESS - violating divine law",
                    "Their 'crime' was teaching humanity knowledge",
                    "The flood was damage control for corrupted creation",
                    "Knowledge-bringers are framed as corruptors",
                    "Boundaries between realms must not be crossed"
                ],
                whatTheyBuried: "Both stories have divine beings and humans interacting before a flood. But the Anunnaki cause the flood intentionally, while the Watchers make the flood necessary. Same event, inverted moral frameworks.",
                fullTextPreview: "And it came to pass when the children of men had multiplied that in those days were born unto them beautiful and comely daughters. And the angels, the children of the heaven, saw and lusted after them...",
                fullTextAvailable: true,
                importance: .important,
                dragonComment: "Anunnaki: gods managing their creation. Watchers: rebels who crossed a line. Same chaos, different blame. The frame determines the meaning. 🐉"
            )
        ],
        significance: "The comparison reveals how the same archetypal events get different moral framings. The beings, the knowledge, the catastrophe - all similar. But who's responsible and why it matters - completely inverted. This is how mythology works.",
        dragonComment: "Same story: divine beings, forbidden knowledge, world-changing catastrophe. Different moral: one's about administration, one's about rebellion. The FRAMING is the control. 🐉"
    )
    
}

// MARK: - Flood Myth Evolution

extension TextTradition {
    
    static let floodMythEvolution = TextTradition(
        name: "Flood Myth Evolution",
        subtitle: "One story, four frames",
        icon: "water.waves",
        color: Palette.primary.blue,
        period: "2000 BCE - 200 BCE",
        description: "The flood story appears in Atrahasis, Gilgamesh, Genesis, and Enoch. Each retelling transforms the meaning. Tracking the evolution reveals how power structures reshape myths to serve their purposes.",
        texts: [
            SacredText(
                name: "Atrahasis Flood",
                alternateNames: [],
                period: "1700 BCE",
                icon: "1.circle.fill",
                color: Palette.primary.blue,
                summary: "The earliest complete flood narrative. Humans were created as labor for the gods. Their population growth creates noise that disturbs the gods. Multiple reduction attempts fail. The flood is final solution. One god leaks the plan. Survival is cleverness, not righteousness.",
                keyTeachings: [
                    "REASON FOR FLOOD: Human noise disturbs gods",
                    "HERO QUALITY: Clever, connected to the right god",
                    "MORAL FRAME: None - it's management, not judgment",
                    "AFTERMATH: Gods regret, create mortality limits",
                    "THEME: Divine administration has collateral damage"
                ],
                whatTheyBuried: "No moral judgment. Just annoyed gods doing pest control. The survivor isn't 'righteous' - he's lucky and well-connected.",
                fullTextPreview: "Enlil made his voice heard and spoke to the gods his brothers: 'The noise of mankind has become too much. I am losing sleep over their racket. Cut off food supplies...'",
                fullTextAvailable: false,
                importance: .essential,
                dragonComment: "First version: gods annoyed by noise, flood as population control. No morality. Just management. 🐉"
            ),
            
            SacredText(
                name: "Gilgamesh Flood",
                alternateNames: [],
                period: "1200 BCE",
                icon: "2.circle.fill",
                color: Palette.primary.cyan,
                summary: "Utnapishtim's story within the epic. More mythic polish than Atrahasis. The gods regret their excess. There's cosmic remorse but still no moral indictment of humanity. The flood survivor becomes immortal - a transformation reward.",
                keyTeachings: [
                    "REASON FOR FLOOD: Various divine complaints, not specified clearly",
                    "HERO QUALITY: Pious, obedient to warning god",
                    "MORAL FRAME: Beginning to emerge but weak",
                    "AFTERMATH: Gods grant immortality out of guilt",
                    "THEME: Even gods make mistakes and regret"
                ],
                whatTheyBuried: "The gods' regret and guilt. They overreacted and knew it. Divine beings capable of error doesn't fit later theology.",
                fullTextPreview: "Utnapishtim spoke to Gilgamesh: 'I will reveal to you, Gilgamesh, a secret of the gods. The great gods decided to make a flood. Their father Anu was sworn to secrecy, as was counselor Enlil...'",
                fullTextAvailable: true,
                importance: .important,
                dragonComment: "Second version: more poetry, divine regret emerging. The frame is shifting toward meaning. 🐉"
            ),
            
            SacredText(
                name: "Genesis Flood",
                alternateNames: ["Noah's Flood"],
                period: "6th-5th Century BCE",
                icon: "3.circle.fill",
                color: Color.green,
                summary: "The frame shifts dramatically. The flood is MORAL - human wickedness fills the earth. Noah is RIGHTEOUS - chosen for virtue. God is singular, not a committee. Survival is obedience and faith. The covenant afterward establishes ongoing relationship.",
                keyTeachings: [
                    "REASON FOR FLOOD: Human violence and corruption",
                    "HERO QUALITY: Righteous, blameless, walked with God",
                    "MORAL FRAME: Central - wickedness requires cleansing",
                    "AFTERMATH: Covenant, rainbow, divine promise",
                    "THEME: Righteousness is rewarded, wickedness destroyed"
                ],
                whatTheyBuried: "The earlier versions where there was no moral justification. Genesis adds righteousness because the new frame requires meaning, not just management.",
                fullTextPreview: "The Lord saw how great the wickedness of the human race had become on the earth, and that every inclination of the thoughts of the human heart was only evil all the time. The Lord regretted that he had made human beings...",
                fullTextAvailable: true,
                importance: .essential,
                dragonComment: "Third version: MORALITY enters. The flood is punishment now. Noah is righteous now. Same water, different meaning. 🐉"
            ),
            
            SacredText(
                name: "Enoch Flood",
                alternateNames: [],
                period: "3rd Century BCE",
                icon: "4.circle.fill",
                color: Palette.primary.violet,
                summary: "The most specific: The Watchers corrupted bloodlines and taught forbidden knowledge. The Nephilim giants consume the world. The flood is contamination containment - sterilizing a hybrid crisis. Not noise complaint, not vague wickedness, but SPECIFIC corruption requiring SPECIFIC cleansing.",
                keyTeachings: [
                    "REASON FOR FLOOD: Watcher rebellion, Nephilim corruption",
                    "HERO QUALITY: Uncorrupted bloodline (pure genetics)",
                    "MORAL FRAME: Contamination and purification",
                    "AFTERMATH: Watchers imprisoned, forbidden knowledge judged",
                    "THEME: Boundaries between realms must be maintained"
                ],
                whatTheyBuried: "The genetic/bloodline angle. The idea that the flood was about PURE vs CORRUPTED humanity. Too specific, too uncomfortable, too close to other ideologies later misused.",
                fullTextPreview: "And Azâzêl taught men to make swords, and knives, and shields, and breastplates, and taught them about metals of the earth and the art of working them... And there arose much godlessness, and they committed fornication, and they were led astray...",
                fullTextAvailable: true,
                importance: .important,
                dragonComment: "Fourth version: Watcher rebellion, hybrid corruption, genetic contamination. Most detailed, most uncomfortable, most suppressed. 🐉"
            )
        ],
        significance: "Same flood. Four frames. Tracking the evolution shows how each culture repurposed the story for its needs. The water is constant; the meaning is constructed. This is how all mythology works - and how understanding the process frees you from any single frame.",
        dragonComment: "One flood, four stories: management → regret → morality → contamination. The frame determines what the story MEANS. Control the frame, control the meaning. See the frames, see the game. 🐉"
    )
    
}

// MARK: - All Categories

extension LibraryCategory {
    
    static let allCategories: [LibraryCategory] = [
        .sacredTexts,
        .hiddenKnowledge
    ]
    
}
