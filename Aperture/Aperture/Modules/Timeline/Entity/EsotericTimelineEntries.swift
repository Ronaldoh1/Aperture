// EsotericTimelineEntries.swift
// HIDDEN ORDERS & FORBIDDEN MAPS — The Esoteric Thread
// ☀️ SunFlow: Reignited
//
// These entries fill the gap between the ancient mystery schools
// and modern control — the secret societies that preserved (and
// sometimes corrupted) the original gnosis.

import SwiftUI

enum EsotericTimelineEntries {
  static let entries: [TimelineEra] = [
    // MARK: - Knights Templar (1119-1312)

    TimelineEra(
      year: 1119,
      yearDisplay: "1119 CE",
      title: "Knights Templar Founded",
      subtitle: "Warrior monks with a secret",
      description: """
        Nine knights camp on the Temple Mount in Jerusalem for nearly a decade. They tell everyone they're 'protecting pilgrims.' Nine men. Protecting all pilgrims. On the Temple Mount.

        They were DIGGING. Excavating Solomon's Temple. What did they find? Within decades, the Templars became the richest organization on Earth. They invented banking. They answered to NO king — only the Pope.

        They built gothic cathedrals encoded with sacred geometry. Their churches were circular, not cross-shaped — mimicking the Temple of Solomon, not Rome's design. They were accused of worshipping 'Baphomet' — which scholars now link to 'Sophia' (Wisdom) through Arabic encryption.

        The Templars were the bridge between the ancient mystery schools and the Renaissance. They brought knowledge from the East that the Church had spent centuries destroying.
        """,
      institutionalRot: [
        InstitutionalControl(
          institution: .religion, mechanism: "Templars accumulated power outside Church hierarchy",
          truth:
            "They preserved Gnostic and Islamic mystical knowledge that the Church tried to erase"),
        InstitutionalControl(
          institution: .finance,
          mechanism: "Invented modern banking — letters of credit, interest, international finance",
          truth:
            "The template for all modern banking was created by monk-soldiers who may have found Solomon's treasure"
        ),
      ],
      icon: "shield.fill",
      gradient: [Palette.primary.red, Palette.accent.gold],
      category: .religiousSuppression,
      isRevealed: true,
      region: "🇫🇷 France / 🏴 Jerusalem",
      dragonComment:
        "Nine men. Temple Mount. Decade of 'protection.' They found something. The money, the power, the cathedrals — all came AFTER the dig."
    ),

    // MARK: - Templar Destruction (1307)

    TimelineEra(
      year: 1307,
      yearDisplay: "1307 CE",
      title: "Friday the 13th — Templar Arrest",
      subtitle: "The original Friday the 13th",
      description: """
        On Friday, October 13, 1307, King Philip IV of France ordered the simultaneous arrest of every Templar in France. This is why Friday the 13th is 'unlucky' — it's the anniversary of the destruction of the most powerful order in Christendom.

        Why? Philip owed the Templars massive debts. The Pope wanted their independence crushed. Together, they fabricated charges: heresy, spitting on the cross, worshipping Baphomet, homosexuality.

        Under torture, Templars 'confessed.' Grand Master Jacques de Molay was burned at the stake in 1314. From the flames, he reportedly cursed both the Pope and the King — both died within the year.

        But here's what matters: the Templar FLEET vanished. 18 ships left La Rochelle the night before the arrests. Where did they go? Scotland (which wasn't under papal authority), Portugal (which simply renamed them), and possibly the Americas — decades before Columbus.

        Their knowledge didn't die. It went underground.
        """,
      institutionalRot: [
        InstitutionalControl(
          institution: .government,
          mechanism: "State and Church collude to destroy independent power",
          truth:
            "When knowledge holders become too powerful to control, they are eliminated — but the knowledge survives underground"
        ),
        InstitutionalControl(
          institution: .religion, mechanism: "Charges of heresy used to seize Templar wealth",
          truth:
            "Philip IV took the money. The Pope got control. The pattern repeats: accuse of heresy, confiscate wealth"
        ),
      ],
      icon: "flame.fill",
      gradient: [Palette.primary.red, Color(red: 0.3, green: 0.0, blue: 0.0)],
      category: .religiousSuppression,
      isRevealed: true,
      region: "🇫🇷 France",
      dragonComment:
        "Friday the 13th. That's where the superstition comes from. Not bad luck — a king erasing his debt by burning the bankers alive."
    ),

    // MARK: - Rosicrucians (1607-1616)

    TimelineEra(
      year: 1607,
      yearDisplay: "1607 CE",
      title: "Rosicrucian Manifestos",
      subtitle: "The Invisible College speaks",
      description: """
        Three anonymous manifestos appear in Europe: the Fama Fraternitatis (1614), the Confessio Fraternitatis (1615), and the Chemical Wedding of Christian Rosenkreutz (1616). They describe a secret brotherhood founded by 'Christian Rosenkreutz' who traveled to the Middle East and brought back forbidden knowledge.

        The manifestos called for a universal reformation of mankind through combining esoteric wisdom with science. They described an 'Invisible College' of adepts working secretly to transform society.

        Was it real? Or a literary device? It doesn't matter — the IDEAS ignited a revolution. The Rosicrucian impulse directly influenced the Scientific Revolution, Freemasonry, and the Enlightenment. Francis Bacon, Robert Fludd, Isaac Newton — all connected to Rosicrucian ideas.

        The core teaching: alchemy isn't about turning lead into gold. It's about turning the LEAD OF IGNORANCE into the GOLD OF CONSCIOUSNESS. The Great Work is internal transformation.

        The Invisible College became the Royal Society. Science itself emerged from occult roots the academy now denies.
        """,
      institutionalRot: [
        InstitutionalControl(
          institution: .education, mechanism: "Modern science erased its mystical origins",
          truth:
            "Chemistry came from alchemy. Astronomy from astrology. The founders of modern science were occultists — Newton spent more time on alchemy than physics"
        ),
        InstitutionalControl(
          institution: .religion, mechanism: "Church condemned Rosicrucian ideas as heresy",
          truth:
            "Direct knowledge through personal transformation threatened institutional authority — the same pattern as Gnosticism"
        ),
      ],
      icon: "cross.fill",
      gradient: [Color(red: 0.8, green: 0.2, blue: 0.3), Palette.accent.gold],
      category: .gnostic,
      isRevealed: true,
      region: "🇩🇪 Germany / Europe",
      dragonComment:
        "Newton was an alchemist. The founder of modern physics spent decades trying to decode Biblical prophecy and the Philosopher's Stone. They don't teach you THAT in school."
    ),

    // MARK: - Freemasonry Origins (1717)

    TimelineEra(
      year: 1717,
      yearDisplay: "1717 CE",
      title: "Grand Lodge of England Founded",
      subtitle: "The original Masons go public",
      description: """
        Four lodges in London unite to form the first Grand Lodge. But Freemasonry is far older than 1717 — that's just when it became 'official.' Operative masonry (actual stonework) stretches back to cathedral builders. Speculative masonry (philosophy) traces to the Templars, Rosicrucians, and before them, the mystery schools of Egypt.

        The original Masonic degrees preserved ancient knowledge in ritual form: the death and resurrection of Hiram Abiff mirrors Osiris, Tammuz, and later Jesus. The checkered floor represents duality. The All-Seeing Eye represents gnosis. The compass and square represent the union of spirit and matter.

        Many founders of the United States were Masons: Washington, Franklin, Hancock. The street layout of Washington D.C. contains Masonic geometry. The dollar bill's pyramid and eye? Pure Masonic symbolism.

        But here's the split: ORIGINAL Freemasonry carried genuine esoteric knowledge — direct spiritual experience, self-transformation, the same gnosis the Gnostics taught. Over time, many lodges became social clubs. The knowledge was preserved in the higher degrees but lost to most members.

        The question isn't whether Masons exist. It's whether the KNOWLEDGE they once carried still lives.
        """,
      institutionalRot: [
        InstitutionalControl(
          institution: .government,
          mechanism: "Masonic networks influenced political revolutions (American, French)",
          truth:
            "The ideals of liberty, equality, fraternity came from lodge rooms where hierarchies of Church and Crown couldn't reach"
        ),
        InstitutionalControl(
          institution: .religion, mechanism: "Church banned Catholic membership in Masonic lodges",
          truth:
            "Any organization that taught direct spiritual knowledge without Church mediation was an existential threat"
        ),
      ],
      icon: "triangle.fill",
      gradient: [Palette.accent.gold, Color(red: 0.3, green: 0.3, blue: 0.5)],
      category: .gnostic,
      isRevealed: true,
      region: "🇬🇧 England / 🌍 Global",
      dragonComment:
        "The All-Seeing Eye on the dollar bill isn't watching you. It's supposed to represent YOUR inner eye — the third eye, the pineal gland, the seat of gnosis. They put the secret in plain sight."
    ),

    // MARK: - Bavarian Illuminati (1776)

    TimelineEra(
      year: 1776,
      yearDisplay: "1776 CE",
      title: "Bavarian Illuminati Founded",
      subtitle: "Enlightenment's secret weapon",
      description: """
        On May 1, 1776 — five years before the U.S. Constitution — Adam Weishaupt, a professor of canon law at the University of Ingolstadt, founded the Order of the Illuminati. Not a shadowy ancient cabal, but a specific, documented, Enlightenment-era secret society with clear goals:

        Oppose superstition, religious influence over public life, and abuses of state power. Promote education, equality, and rational thought. Infiltrate existing power structures to reform them from within.

        Within a decade, they had 2,000+ members across Europe, including nobility, intellectuals, and Freemasons. They were EFFECTIVE — which is why the Bavarian government banned them in 1785 and seized their documents.

        Here's what matters: the REAL Illuminati lasted about 10 years. Everything since — every conspiracy theory about the 'Illuminati controlling the world' — is a funhouse mirror reflection that actually serves power by making people who question authority look crazy.

        The real conspiracy? Making 'Illuminati' a joke so nobody investigates ACTUAL networks of power.

        Weishaupt's original goal was liberation through knowledge — the same goal as every mystery school before him. He was a Gnostic in Enlightenment clothing.
        """,
      institutionalRot: [
        InstitutionalControl(
          institution: .government,
          mechanism: "Bavarian government banned the Illuminati and seized records",
          truth:
            "A documented case of a government destroying an organization that promoted education and questioned authority"
        ),
        InstitutionalControl(
          institution: .media,
          mechanism: "The word 'Illuminati' has been weaponized to discredit truth-seekers",
          truth:
            "By making the concept absurd, real networks of power operate unseen. The best hiding spot is a conspiracy theory nobody takes seriously"
        ),
      ],
      icon: "eye.trianglebadge.exclamationmark.fill",
      gradient: [Palette.accent.gold, Palette.primary.violet],
      category: .gnostic,
      isRevealed: true,
      region: "🇩🇪 Bavaria",
      dragonComment:
        "The Illuminati lasted 10 years. TEN. But now every YouTube video about power structures gets labeled 'Illuminati conspiracy' and dismissed. Who benefits from that? Not the truth-seekers."
    ),

    // MARK: - Piri Reis Map (1513)

    TimelineEra(
      year: 1513,
      yearDisplay: "1513 CE",
      title: "Piri Reis Map",
      subtitle: "A map that shouldn't exist",
      description: """
        In 1929, scholars rediscovered a map drawn by Ottoman admiral Piri Reis in 1513. It shows the western coast of Africa, the eastern coast of South America, and — impossibly — the northern coastline of Antarctica. Without ice.

        Antarctica wasn't officially 'discovered' until 1820. It hasn't been ice-free for at least 6,000 years. Some estimates say 34 million years.

        Piri Reis himself wrote on the map that he compiled it from 20 older source maps, some dating to the time of Alexander the Great (4th century BCE). He used maps that were already ancient IN HIS TIME.

        The U.S. Air Force investigated in 1960 and concluded that the Antarctic coastline depicted was remarkably accurate to the sub-glacial coastline — information that wasn't available until modern seismic surveys.

        This means one of two things: either an ancient civilization mapped Antarctica before it was covered in ice, OR ancient navigators had technology we don't attribute to them.

        Either way, the map breaks the narrative that civilization started 5,000 years ago and progressed linearly. The knowledge was ALREADY THERE — and was lost.
        """,
      institutionalRot: [
        InstitutionalControl(
          institution: .education,
          mechanism:
            "History textbooks ignore anomalous artifacts that don't fit the linear progress narrative",
          truth:
            "The Piri Reis map is in a museum in Istanbul. It's REAL. But it contradicts the timeline we're taught, so it's a 'curiosity' rather than a paradigm-shifting document"
        ),
        InstitutionalControl(
          institution: .science,
          mechanism: "Academic gatekeeping dismisses evidence of advanced ancient knowledge",
          truth:
            "When evidence challenges the dominant narrative, it's not disproven — it's ignored. There's a difference"
        ),
      ],
      icon: "map.fill",
      gradient: [Palette.primary.cyan, Color(red: 0.3, green: 0.5, blue: 0.4)],
      category: .ancient,
      isRevealed: true,
      region: "🇹🇷 Ottoman Empire",
      dragonComment:
        "A 1513 map showing Antarctica without ice. The Air Force confirmed the accuracy. Your history teacher never mentioned it. Ask yourself why."
    ),

    // MARK: - Cathar Genocide (1209-1229)

    TimelineEra(
      year: 1209,
      yearDisplay: "1209 CE",
      title: "Albigensian Crusade Begins",
      subtitle: "Rome's war on its own Christians",
      description: """
        The Cathars of Southern France were Christian Gnostics. They believed in direct experience of the divine, rejected the material world as a prison created by a false god (the Demiurge), and considered the Catholic Church to be that false god's institution.

        They didn't pay tithes. They didn't need priests. Women could be 'Perfecti' (spiritual leaders). They lived simply, practiced vegetarianism, and taught that the soul was divine light trapped in matter.

        Rome couldn't allow this. In 1209, Pope Innocent III launched the Albigensian Crusade — the only crusade against FELLOW CHRISTIANS. When asked how soldiers should distinguish Catholics from Cathars, the papal legate reportedly said: 'Kill them all. God will know His own.'

        At Béziers, 20,000 men, women, and children were massacred in a single day. The war lasted 20 years. The Inquisition was literally INVENTED to hunt down surviving Cathars. The last known Cathar Perfectus was burned alive in 1321.

        An entire civilization — with universities, troubadour poetry, the concept of courtly love, and a living Gnostic tradition — was exterminated.
        """,
      institutionalRot: [
        InstitutionalControl(
          institution: .religion,
          mechanism:
            "Pope launched a crusade against Christians who didn't pay tithes or need priests",
          truth:
            "The Cathars proved Christianity could exist WITHOUT the Church. That wasn't a theological threat — it was an economic and political one. No tithes = no Vatican"
        ),
        InstitutionalControl(
          institution: .military,
          mechanism: "Entire populations massacred to enforce doctrinal compliance",
          truth:
            "'Kill them all, God will know His own' — this is what institutional power does when knowledge threatens its monopoly"
        ),
      ],
      icon: "flame.fill",
      gradient: [Palette.primary.red, Color(red: 0.4, green: 0.0, blue: 0.0)],
      category: .religiousSuppression,
      isRevealed: true,
      region: "🇫🇷 Southern France",
      dragonComment:
        "20,000 killed in one day. Christians killing Christians. Because the Cathars didn't need a middleman to God. That's the real heresy — cutting out the middleman."
    ),

    // MARK: - Dead Sea Scrolls (1947)

    TimelineEra(
      year: 1947,
      yearDisplay: "1947 CE",
      title: "Dead Sea Scrolls Discovered",
      subtitle: "The desert gives up its secrets",
      description: """
        A Bedouin shepherd throws a rock into a cave near the Dead Sea and hears pottery shatter. Inside: 972 texts sealed in clay jars for 2,000 years. The most significant archaeological find of the 20th century.

        The scrolls include the oldest known copies of Hebrew Bible texts, proving the books were edited over centuries. They include texts that were EXCLUDED from the Bible — apocalyptic visions, angelic hierarchies, esoteric rituals, and documents from communities that practiced a form of Judaism that looked nothing like what survived.

        The Essene community at Qumran (likely authors of many scrolls) practiced communal living, ritual purification, and anticipated a cosmic battle between the 'Sons of Light' and the 'Sons of Darkness.' Sound familiar? It should — this is the soil from which both Christianity AND Gnosticism grew.

        For decades, access to the scrolls was restricted to a small group of scholars — many with Vatican connections. It took until the 1990s for full publication. Why the delay? Because the scrolls reveal that early Judaism and Christianity were far more diverse, mystical, and Gnostic than institutional religion wants you to know.
        """,
      institutionalRot: [
        InstitutionalControl(
          institution: .religion,
          mechanism: "Publication restricted for decades by scholars with institutional ties",
          truth:
            "The scrolls show Christianity didn't emerge from a single tradition — it grew from a complex ecosystem of Jewish mysticism that the Church needed to simplify for control"
        ),
        InstitutionalControl(
          institution: .education,
          mechanism: "Most people know about the scrolls but not what they contain",
          truth:
            "The scrolls reveal the Essenes practiced rituals and held beliefs nearly identical to Gnostic Christians — a century before Jesus"
        ),
      ],
      icon: "scroll.fill",
      gradient: [Palette.accent.gold, Color(red: 0.5, green: 0.4, blue: 0.2)],
      category: .gnostic,
      isRevealed: true,
      region: "🇮🇱 Qumran, Dead Sea",
      dragonComment:
        "2,000 years in a cave. Found by accident. Suppressed for decades. The desert remembered what humans tried to erase."
    ),

    // MARK: - Giordano Bruno Burned (1600)

    TimelineEra(
      year: 1600,
      yearDisplay: "1600 CE",
      title: "Giordano Bruno Burned Alive",
      subtitle: "The monk who saw too far",
      description: """
        Giordano Bruno was a Dominican friar who taught that the universe was infinite, that stars were distant suns with their own planets, that the Earth moved around the Sun, and that God was present in all matter — not sitting on a throne above the clouds.

        He taught Hermetic philosophy, the art of memory, and that direct experience of the divine was possible without the Church. He traveled Europe teaching these ideas openly.

        The Inquisition arrested him in 1592. After eight years of imprisonment and trial, he refused to recant. On February 17, 1600, he was burned at the stake in Rome's Campo de' Fiori.

        His tongue was nailed to a board so he couldn't speak at his execution.

        They didn't just kill his body — they tried to kill his IDEAS. They failed. Bruno's vision of an infinite universe became the foundation of modern cosmology. But the Church never apologized. In 2000, the Vatican said the execution was 'regrettable' but didn't rehabilitate him.

        Bruno was a Gnostic, a Hermeticist, and a man who believed consciousness pervaded all matter. He was 400 years ahead of his time — and they nailed his tongue shut for it.
        """,
      institutionalRot: [
        InstitutionalControl(
          institution: .religion,
          mechanism: "Tongue nailed, body burned for teaching an infinite universe",
          truth:
            "An infinite universe with no center means no special place for Earth, no special species, no need for a Church claiming exclusive divine access"
        ),
        InstitutionalControl(
          institution: .science,
          mechanism: "Bruno is rarely credited alongside Galileo and Copernicus",
          truth:
            "He said it FIRST. He said it LOUDEST. He paid with his life. But history credits the ones the Church eventually pardoned, not the one they burned"
        ),
      ],
      icon: "flame.fill",
      gradient: [Palette.primary.red, Palette.primary.violet],
      category: .religiousSuppression,
      isRevealed: true,
      region: "🇮🇹 Rome",
      dragonComment:
        "They nailed his tongue to a board. Because the most dangerous weapon against institutional power isn't a sword — it's a mouth that speaks truth."
    ),
  ]
}
