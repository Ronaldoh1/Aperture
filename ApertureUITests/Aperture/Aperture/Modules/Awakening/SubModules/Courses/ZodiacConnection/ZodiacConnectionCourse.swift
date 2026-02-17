// ZodiacConnectionCourse.swift
// Decoding The Zodiac's Connection to Religion
// Aperture - SunFlow Consciousness Platform

import Foundation

// MARK: - Zodiac Connection Course

final class ZodiacConnectionCourse {
  static let shared = ZodiacConnectionCourse()
  private init() {}

  // MARK: - Course Metadata

  let title = "Decoding The Zodiac's Connection to Religion"
  let subtitle = "How Solar Mythology Became World Religion"
  let description = """
    Uncover the hidden astronomical origins of religious symbolism. This course reveals \
    how ancient solar worship and zodiacal knowledge were encoded into religious texts, \
    and how the original Evangelical Gnostics understood the cosmic teachings before \
    institutional control obscured the truth.
    """
  let icon = "sparkles"
  let estimatedHours = 8
  let difficulty = "Advanced"

  // MARK: - Modules

  lazy var modules: [ZodiacModule] = [
    moduleOne,
    moduleTwo,
    moduleThree,
    moduleFour,
    moduleFive,
    moduleSix,
    moduleSeven,
    moduleEight,
    moduleNine,
    moduleTen,
    moduleEleven,
    moduleTwelve,
  ]

  // MARK: - Module 1: The Kingdom of God Revealed

  private var moduleOne: ZodiacModule {
    ZodiacModule(
      id: "zc_mod_1",
      number: 1,
      title: "The Kingdom of God Revealed",
      subtitle: "Understanding What Ancient Texts Really Mean",
      lessons: [
        ZodiacLesson(
          id: "zc_1_1",
          title: "Kingdom: A Category of Life",
          content: """
            When you hear religious figures speak of "God's Kingdom" or "the Kingdom of Heaven," \
            what image comes to mind? A castle in the clouds? A paradise beyond death?

            Let's examine what "kingdom" actually means linguistically and categorically.

            In human language, we categorize different life forms into groups:
            • Cattle are in HERDS
            • Bees are in SWARMS
            • Fish are in SCHOOLS
            • Owls are in PARLIAMENTS
            • And animals are in... KINGDOMS

            The word "kingdom" has always been associated with ANIMALS. This is not arbitrary—it's \
            fundamental to how humans categorized life forms across cultures and languages.

            Where do we find collections of animals? In a ZOO—from the ancient Greek "zoon" meaning \
            "living being" or "animal."

            Now consider: What do we call the band of constellations in the sky?

            The ZODIAC—literally the "circle of animals" (from Greek "zodiakos kyklos").

            The zodiac contains: The Lion, The Bull, The Ram, The Fish, The Scorpion, The Crab, and more.

            When ancient texts speak of "God's Kingdom," they're referring to the zodiac—the celestial \
            kingdom of animal symbols that governs the cycles of time.
            """,
          keyPoints: [
            "Kingdom = category for animals in all human languages",
            "Zoo comes from Greek 'zoon' meaning animal/living being",
            "Zodiac means 'circle of animals' in Greek",
            "God's Kingdom = the zodiac in ancient understanding",
            "The zodiac is in the heavens, hence 'Kingdom of Heaven'",
          ]
        ),
        ZodiacLesson(
          id: "zc_1_2",
          title: "The Lord's Prayer Decoded",
          content: """
            Let's examine the most famous prayer in Christianity with fresh eyes:

            "Our Father, who art in HEAVEN..."
            → God is in heaven, not on Earth. Where are the zodiac constellations? In heaven.

            "Hallowed be thy name..."
            → The names of the constellations are sacred.

            "Thy KINGDOM come..."
            → Let the zodiacal influences manifest.

            "Thy will be done, on EARTH as it is in HEAVEN..."
            → As above, so below. The celestial patterns affect earthly events.

            When the ancient Christians prayed this prayer, they were acknowledging the cosmic order—the \
            influence of the zodiacal kingdom upon life on Earth.

            This wasn't superstition to them—it was astronomy, the observation of how celestial cycles \
            correlated with seasons, agriculture, and the human experience.

            The prayer is an acknowledgment of cosmic law: the heavenly kingdom (zodiac) governs the \
            patterns of life below.
            """,
          keyPoints: [
            "The Lord's Prayer references celestial governance",
            "'Kingdom' refers to the zodiac constellation system",
            "'As in heaven, so on earth' = cosmic correspondence",
            "Ancient Christians understood the astronomical symbolism",
            "The prayer acknowledges natural cosmic law",
          ]
        ),
        ZodiacLesson(
          id: "zc_1_3",
          title: "Job's Testimony: God Created the Zodiac",
          content: """
            The Bible itself confirms that God created the zodiac. In the Book of Job, God speaks directly:

            "Can you bind the chains of the Pleiades? Can you loosen Orion's belt? Can you bring forth \
            the Mazzaroth in their seasons?" (Job 38:31-32)

            MAZZAROTH is the Hebrew word for ZODIAC.

            God is asking Job: "Can YOU control the zodiac? Can YOU bring forth its signs in their proper seasons?"

            The implication is clear: GOD controls the zodiac. God placed these signs in the heavens. \
            They are not evil or demonic—they are divine creation.

            This is why the Book of Job has God saying: "I put the 12 signs of the zodiac in the heavens. \
            What are you going to do about it? It's my work in the heavens. I put it there."

            The zodiac is presented as God's work, God's creation, God's system for ordering time and seasons.

            Yet modern religious institutions condemn astrology while claiming to follow these same scriptures. \
            This contradiction reveals how much has been hidden and distorted.
            """,
          keyPoints: [
            "Mazzaroth = Hebrew word for zodiac",
            "Job 38:31-32 confirms God created the constellations",
            "The zodiac is described as divine creation, not demonic",
            "God controls the celestial cycles",
            "Modern condemnation of astrology contradicts scripture",
          ]
        ),
      ]
    )
  }

  // MARK: - Module 2: The Son/Sun of God

  private var moduleTwo: ZodiacModule {
    ZodiacModule(
      id: "zc_mod_2",
      number: 2,
      title: "The Son/Sun of God",
      subtitle: "Solar Mythology in Religious Texts",
      lessons: [
        ZodiacLesson(
          id: "zc_2_1",
          title: "S-U-N vs S-O-N: The Cosmic Play on Words",
          content: """
            In English, we hear no difference between "sun" (the star) and "son" (offspring).

            This is not coincidental. Throughout ancient solar religions, the divine principle was \
            personified as the sun—the source of all light, life, and energy on Earth.

            Consider these parallels:

            THE SUN:
            • Is "the light of the world" (it literally illuminates everything)
            • "Rises" every morning (sunrise)
            • Is your "risen savior" (without it, Earth dies in weeks)
            • "Dies" every evening (sunset)
            • Spends 3 days at its lowest point during winter solstice
            • Is "reborn" on December 25th when days begin lengthening

            THE SON (Jesus):
            • Is called "the light of the world" (John 8:12)
            • "Rose" from the dead
            • Is called the "risen savior"
            • Died on the cross
            • Was in the tomb for 3 days
            • Birth is celebrated on December 25th

            The sun gives its energy freely to all life. The Egyptians taught that if the sun kept \
            its energy to itself, it would live forever. But because it gives to everyone, it will \
            eventually "die." Hence: "God's son died so that you might live."

            This is literally true of the physical sun: without solar energy, no life exists.
            """,
          keyPoints: [
            "Son and Sun are phonetically identical in English",
            "Solar mythology predates Christianity by thousands of years",
            "Jesus's attributes match the sun's astronomical properties",
            "December 25th = rebirth of the sun after winter solstice",
            "The sun 'dying so we might live' is literal solar physics",
          ]
        ),
        ZodiacLesson(
          id: "zc_2_2",
          title: "Walking on Water & Turning Water to Wine",
          content: """
            Many dismiss the miracles of Jesus as impossible supernatural events. But when understood \
            as solar allegory, they become profound astronomical poetry.

            WALKING ON WATER:
            Go to any ocean at 5:45 PM just before sunset. Watch the sun as it descends toward the \
            horizon. What do you see?

            The sun appears to be SITTING ON THE WATER. It doesn't go under, it doesn't rise above—it \
            appears to rest directly on the surface.

            "God's Son, the light of the world, is walking on water."

            This is observable astronomy, not supernatural magic.

            TURNING WATER INTO WINE:
            In ancient cosmology, Earth was personified as "Mother Earth" or "Mother Nature."

            Mother Earth asks God's Son (the sun) to bring water for the marriage feast at Cana.

            What does the sun actually do?
            1. It evaporates water from the oceans
            2. The water rises to form clouds
            3. Clouds release rain
            4. Rain falls on grape vines
            5. Grapes become wine

            The sun turns water into wine through the natural cycle of evaporation, rain, and agriculture.

            These "miracles" are descriptions of natural solar processes, told as allegory.
            """,
          keyPoints: [
            "Walking on water = sunset over the ocean (observable)",
            "Mother Earth = the bride, asking for water",
            "Water to wine = evaporation → clouds → rain → grapes → wine",
            "Miracles are solar allegories, not supernatural events",
            "Ancient peoples understood these as natural explanations",
          ]
        ),
        ZodiacLesson(
          id: "zc_2_3",
          title: "The Sun Rises: Your Risen Savior",
          content: """
            Every morning, the sun RISES. We call this event "sunrise."

            "He is RISEN!"

            This proclamation of Easter morning mirrors what happens literally every single day: \
            the sun rises.

            Why is this significant?

            The sun rising IS your salvation. If the sun doesn't rise:
            • Plants die within days
            • Temperatures plummet
            • The food chain collapses
            • Earth becomes a frozen, dead rock
            • All life ceases within weeks

            The risen sun is literally, physically, objectively your savior. Without sunrise, \
            you don't survive.

            Ancient peoples weren't stupid—they understood their complete dependence on solar cycles. \
            They created stories to encode this vital knowledge.

            The problem isn't the stories themselves—they're beautiful astronomical poetry. \
            The problem is that institutional religion took the poetry literally while hiding \
            the cosmic truth that the original teachers understood.
            """,
          keyPoints: [
            "Sunrise = 'He is risen' - linguistic connection",
            "The sun rising IS literal salvation for all life",
            "Without the sun, Earth dies within weeks",
            "Ancient peoples encoded survival knowledge in allegory",
            "Institutions literalized poetry and hid the cosmic meaning",
          ]
        ),
      ]
    )
  }

  // MARK: - Module 3: The 12 Apostles = 12 Signs

  private var moduleThree: ZodiacModule {
    ZodiacModule(
      id: "zc_mod_3",
      number: 3,
      title: "The Twelve",
      subtitle: "Apostles, Signs, Months, and Tribes",
      lessons: [
        ZodiacLesson(
          id: "zc_3_1",
          title: "Why Twelve? The Sacred Number",
          content: """
            The number 12 appears everywhere in religious texts:

            • 12 Apostles of Jesus
            • 12 Tribes of Israel
            • 12 Brothers of Joseph
            • 12 Stones on the High Priest's breastplate
            • 12 Gates of Heaven (Revelation)
            • 12 Foundations of the New Jerusalem
            • 12 Stars in Mary's crown

            Why 12? What's so special about this number?

            The answer is astronomical:
            • 12 signs of the zodiac
            • 12 months of the year
            • 12 hours of daylight (approximately)
            • 12 hours of darkness (approximately)

            The number 12 divides the solar year into observable segments. Each zodiac sign \
            corresponds to approximately one month as the sun appears to move through that \
            constellation.

            When Jesus chooses 12 apostles, he's embodying the sun surrounded by the 12 \
            zodiacal divisions of the year. This is cosmic symbolism, not historical accident.

            The same pattern appears in Jacob having 12 sons (the tribes of Israel)—each \
            corresponding to a zodiac sign, which is why each tribe has a specific symbol \
            and blessing.
            """,
          keyPoints: [
            "12 appears repeatedly in all religious texts",
            "12 = number of zodiac signs and months",
            "12 hours of light, 12 hours of darkness (daily division)",
            "Apostles represent the zodiac surrounding the sun (Jesus)",
            "12 Tribes of Israel also correspond to zodiac signs",
          ]
        ),
        ZodiacLesson(
          id: "zc_3_2",
          title: "The Last Supper: A Zodiac Tableau",
          content: """
            Examine Leonardo da Vinci's famous painting of the Last Supper. Look closely at \
            the arrangement:

            Jesus sits in the CENTER—representing the sun.

            On either side are 12 figures—the apostles.

            But notice HOW they're arranged: in GROUPS OF THREE.

            Four groups of three apostles = 12 total.

            This mirrors exactly how the zodiac is divided:
            • 4 seasons (spring, summer, fall, winter)
            • 3 signs per season
            • 4 × 3 = 12 signs total

            The painting shows the sun (Jesus) presiding over the 12 signs of the zodiac, \
            divided into their four seasonal groupings.

            Now look at the figure to Jesus's right. Art historians have long noted this \
            figure appears feminine. This is Mary Magdalene, according to some interpretations.

            But astronomically, this represents VIRGO—the virgin. One of the 12 signs of the \
            zodiac is Virgo, the only female figure in the zodiacal wheel.

            Jesus "born of a virgin" = the sun born in the constellation of Virgo.
            """,
          keyPoints: [
            "Last Supper shows Jesus (sun) with 12 apostles (zodiac)",
            "Apostles arranged in groups of 3 = four seasons",
            "4 × 3 = 12 = the zodiacal year",
            "Feminine figure = Virgo, the virgin constellation",
            "Born of a virgin = sun rising in Virgo",
          ]
        ),
        ZodiacLesson(
          id: "zc_3_3",
          title: "Light vs Darkness: The Eternal War",
          content: """
            Every day contains:
            • 12 hours of LIGHT (ruled by the sun)
            • 12 hours of DARKNESS (ruled by the night)

            This creates the eternal symbolic battle between:
            • Light and dark
            • Good and evil
            • God and the Devil
            • Christ and Satan

            In Egyptian mythology, this was represented by:
            • HORUS - the sun god, god of light
            • SET - the god of darkness, chaos, and night

            SET is where we get the word "SUNSET"—when Set, the prince of darkness, takes over.

            In modern mythology, this became:
            • Luke Skywalker (walks in sky/light) vs
            • DARTH Vader (dark father, prince of darkness)

            Star Wars creator George Lucas studied Joseph Campbell's work on mythology and \
            deliberately encoded these ancient solar myths into his films.

            The "battle between good and evil" is ultimately the daily and yearly observation \
            of light versus darkness—the sun's journey through the sky.
            """,
          keyPoints: [
            "12 hours of light, 12 hours of darkness daily",
            "This duality became good vs evil mythology",
            "Egyptian Set = darkness, hence 'sunset'",
            "Star Wars encodes ancient solar mythology",
            "Good vs evil = light vs dark = astronomical observation",
          ]
        ),
      ]
    )
  }

  // MARK: - Module 4: The Ages of the Zodiac

  private var moduleFour: ZodiacModule {
    ZodiacModule(
      id: "zc_mod_4",
      number: 4,
      title: "The Ages of the Zodiac",
      subtitle: "Understanding Great Year Precession",
      lessons: [
        ZodiacLesson(
          id: "zc_4_1",
          title: "The 2,150-Year Cycle",
          content: """
            Earth wobbles on its axis like a spinning top. This wobble is called PRECESSION.

            Due to precession, the constellation that appears behind the sun at the spring equinox \
            slowly changes over time. It takes approximately 25,920 years to complete one full cycle \
            through all 12 zodiac signs.

            Divide 25,920 by 12 = 2,160 years per sign (approximately 2,150 years).

            Each 2,150-year period is called an AGE:
            • Age of Taurus (the Bull): ~4,300 BC - ~2,150 BC
            • Age of Aries (the Ram): ~2,150 BC - ~1 AD
            • Age of Pisces (the Fish): ~1 AD - ~2,150 AD
            • Age of Aquarius (the Water Bearer): ~2,150 AD - ~4,300 AD

            As we're now in approximately 2025 AD, we're about 125 years from the end of the \
            Age of Pisces and the beginning of the Age of Aquarius.

            This is why many speak of these as "the end times"—it's the end of the Piscean Age.

            It's not the end of the world—it's the end of an astrological era and the beginning of another.
            """,
          keyPoints: [
            "Precession causes the zodiac to shift over 25,920 years",
            "Each age lasts approximately 2,150 years",
            "We're at the end of the Age of Pisces",
            "The Age of Aquarius begins around 2150 AD",
            "End times = end of an astrological age, not the world",
          ]
        ),
        ZodiacLesson(
          id: "zc_4_2",
          title: "Age of Taurus: The Golden Calf",
          content: """
            During the Age of Taurus (~4,300 BC - 2,150 BC), the bull was the dominant religious symbol.

            In Egypt:
            • Apis, the sacred bull, was worshipped
            • Hathor, the cow goddess, was revered
            • Bull imagery dominated temples

            In Mesopotamia:
            • Winged bulls guarded temples and palaces
            • Bull sacrifice was central to worship

            In the Bible:
            • While Moses is on the mountain receiving the new law, the Israelites build a GOLDEN CALF.

            Why a golden calf?
            • GOLDEN = the color of the SUN
            • CALF = young bull = TAURUS

            The Israelites were continuing the old religion of the Age of Taurus—sun worship \
            symbolized by the bull.

            Moses came down with a NEW covenant—representing the transition to a new age. \
            He was furious because the people were clinging to the old astrological age instead \
            of embracing the new one.

            The destruction of the golden calf represents the end of the Age of Taurus.
            """,
          keyPoints: [
            "Age of Taurus = bull worship worldwide",
            "Golden Calf = sun (gold) in Taurus (bull)",
            "Israelites practicing Taurus Age religion",
            "Moses brought the new age covenant (Aries)",
            "Destroying the calf = ending the old astrological age",
          ]
        ),
        ZodiacLesson(
          id: "zc_4_3",
          title: "Age of Aries: The Ram's Horn",
          content: """
            After the Age of Taurus came the Age of Aries, the Ram (~2,150 BC - 1 AD).

            Moses instituted new religious practices reflecting this transition:

            THE SHOFAR (Ram's Horn):
            Jews blow the RAM'S HORN on holy days. Why a ram's horn specifically? \
            Because Aries the Ram was now the ruling constellation.

            ABRAHAM:
            The name "Abraham" contains "Ab-RAM"—father of the ram. \
            Abraham was told to sacrifice his son Isaac, but at the last moment, \
            a RAM appeared to be sacrificed instead.

            THE PASSOVER LAMB:
            The Passover sacrifice is a LAMB (young sheep/ram). \
            This connected the religious observance to the ruling zodiac sign.

            MOSES'S HORNS:
            In Michelangelo's famous sculpture, Moses has HORNS. \
            Many think this was a mistranslation, but it actually represents \
            the horns of Aries the Ram—Moses brought the Age of the Ram.

            All the "lamb of God" imagery connects to the Age of Aries, when \
            sheep and ram symbolism dominated religious practice.
            """,
          keyPoints: [
            "Age of Aries = ram/lamb symbolism dominant",
            "Shofar (ram's horn) = Aries the Ram",
            "Abraham contains 'Ab-Ram' (father of the ram)",
            "Passover lamb connects to Aries symbolism",
            "Moses's horns = horns of Aries",
          ]
        ),
        ZodiacLesson(
          id: "zc_4_4",
          title: "Age of Pisces: The Two Fish",
          content: """
            We currently live in the Age of Pisces, the Two Fish (approximately 1 AD - 2,150 AD).

            When Jesus arrived, he brought the symbolism of the new age:

            THE FISH SYMBOL:
            The earliest Christian symbol wasn't the cross—it was the ICHTHYS, the fish. \
            Early Christians identified each other by drawing a fish.

            THE FISHERMAN:
            Jesus called fishermen as disciples and told them he would make them "fishers of men."

            FEEDING THE MULTITUDE:
            Jesus fed the crowd with TWO FISH and five loaves. \
            Why specifically TWO fish? Because Pisces is symbolized by TWO FISH swimming in opposite directions.

            THE OLDEST CHURCH:
            In Megiddo, Israel, archaeologists discovered the oldest known Christian church. \
            On its mosaic floor is a large image of TWO FISH—not a cross, but the symbol of Pisces.

            PISCES MEANING:
            The two fish swim in opposite directions, representing duality and division. \
            The Age of Pisces has indeed been an age of religious division—countless denominations, \
            sects, and conflicts between faiths.

            We're now in the final centuries of this age.
            """,
          keyPoints: [
            "Age of Pisces began around 1 AD with Jesus",
            "Ichthys (fish) was the original Christian symbol",
            "Jesus fed multitudes with TWO fish = Pisces",
            "Oldest church in Megiddo has fish mosaic, not cross",
            "Two fish = duality, division (religious conflicts of this age)",
          ]
        ),
      ]
    )
  }

  // MARK: - Module 5: The Age of Aquarius

  private var moduleFive: ZodiacModule {
    ZodiacModule(
      id: "zc_mod_5",
      number: 5,
      title: "The Coming Age",
      subtitle: "Aquarius: The Man with the Water Pitcher",
      lessons: [
        ZodiacLesson(
          id: "zc_5_1",
          title: "Luke 22:10 - The Next Age Predicted",
          content: """
            In Luke 22:10, the disciples ask Jesus where they should prepare for the Passover. \
            His answer is remarkable:

            "Behold, when ye are entered into the city, there shall a man meet you, bearing a \
            PITCHER OF WATER; follow him into the house where he entereth in."

            A MAN carrying a WATER PITCHER.

            This is the symbol of AQUARIUS—the Water Bearer.

            Here's what makes this significant: In the ancient Middle East, MEN NEVER CARRIED WATER. \
            This was exclusively women's work. Any man seen carrying a water pitcher would be \
            immediately noticed—it would be scandalous.

            Historical records confirm: women drew water from wells, women carried water jars, \
            women managed household water. Men carrying water was unheard of.

            So why does Jesus tell them to look for something impossible—a man with a water pitcher?

            Because he's not describing a literal person. He's describing the ASTROLOGICAL SIGN that \
            will follow Pisces: AQUARIUS, always depicted as a MAN pouring water.

            "Follow him into the house" = enter the Age of Aquarius after Pisces ends.
            """,
          keyPoints: [
            "Luke 22:10 describes 'a man with a water pitcher'",
            "In ancient times, only women carried water—men never did",
            "This describes Aquarius, not a literal person",
            "Aquarius = the Water Bearer (man pouring water)",
            "Follow him into the house = enter the next age",
          ]
        ),
        ZodiacLesson(
          id: "zc_5_2",
          title: "The End Times: End of an Age",
          content: """
            Christians have been preaching "the end times" for decades, warning that we're in \
            "the last days." Many point to signs of moral decay, wars, and disasters as evidence.

            They're partially right—but they misunderstand what's ending.

            The Age of Pisces is approximately 2,150 years long.
            It began around 1 AD (the time of Jesus).
            We're now about 2,025 years into this age.
            That means there are approximately 125 years remaining.

            The "end times" are the end of the Age of Pisces—not the end of Earth or humanity.

            Every astrological age transition involves upheaval:
            • Old systems collapse
            • New paradigms emerge
            • Religious and social structures transform

            The transition from Pisces to Aquarius represents:
            • From faith-based to knowledge-based systems
            • From hierarchical religion to individual consciousness
            • From division (two fish) to unity (water poured for all)

            The "tribulations" of end times prophecy describe the chaos of transitional periods—not \
            divine punishment, but cosmic change.
            """,
          keyPoints: [
            "End times = end of Age of Pisces, not end of world",
            "About 125 years remain in Pisces age",
            "All age transitions involve upheaval and change",
            "Aquarius brings different energy than Pisces",
            "Tribulation = transition chaos, not punishment",
          ]
        ),
        ZodiacLesson(
          id: "zc_5_3",
          title: "Characteristics of the Coming Age",
          content: """
            Aquarius has distinct characteristics that will shape the coming age:

            THE WATER BEARER:
            Aquarius pours water freely to all. Unlike Pisces (fish restricted to water), \
            Aquarius DISTRIBUTES water. This suggests democratization of knowledge—information \
            flowing freely to everyone.

            AIR SIGN:
            Despite the water imagery, Aquarius is an AIR sign—associated with thought, \
            communication, and intellect. The Age of Aquarius may emphasize:
            • Mental/intellectual development
            • Communication technologies
            • Ideas spreading through the air (wireless, internet)

            THE HUMANITARIAN:
            Aquarius is associated with humanitarian ideals, equality, and brotherhood. \
            This age may see:
            • Breakdown of rigid hierarchies
            • Rise of collective consciousness
            • Focus on humanity over nations or religions

            SCIENCE AND SPIRITUALITY MERGE:
            The rational, intellectual nature of Aquarius suggests science and spirituality \
            may find common ground—neither pure faith (Pisces) nor pure materialism, but \
            integrated understanding.

            We're already seeing early signs: internet democratizing information, global \
            communication, growing interest in consciousness research.
            """,
          keyPoints: [
            "Aquarius pours water to all = democratized knowledge",
            "Air sign = thought, communication, intellect",
            "Humanitarian focus on equality and unity",
            "Science and spirituality may integrate",
            "Internet and global communication = early Aquarian energy",
          ]
        ),
      ]
    )
  }

  // MARK: - Module 6: The Virgin Birth

  private var moduleSix: ZodiacModule {
    ZodiacModule(
      id: "zc_mod_6",
      number: 6,
      title: "The Virgin Birth Decoded",
      subtitle: "Virgo and the Solar Mythology",
      lessons: [
        ZodiacLesson(
          id: "zc_6_1",
          title: "Born of a Virgin: The Constellation",
          content: """
            "Jesus was born of a virgin."

            This statement has mystified and divided people for two millennia. But when we \
            understand astronomical symbolism, it becomes clear:

            One of the 12 signs of the zodiac is VIRGO—the Virgin.

            Virgo is the only female figure in the zodiac. She is depicted as a maiden holding \
            wheat, associated with harvest, purity, and fertility.

            In astronomical terms, "born of a virgin" means:
            The sun (God's Son) appears to emerge from (is "born of") the constellation Virgo \
            at certain times of the year.

            Ancient peoples observed that during specific seasons, the sun would rise with Virgo \
            as the backdrop constellation. The sun was "born" in the Virgin.

            This astronomical observation became personified as a literal virgin birth—a woman \
            giving birth without intercourse.

            But the original meaning was observational: the sun rises in the house of the Virgin.

            Every sun god throughout history has a "virgin birth" story because they all represent \
            the same astronomical phenomenon: the sun emerging from the constellation Virgo.
            """,
          keyPoints: [
            "Virgo is the only female zodiac constellation",
            "Born of a virgin = sun rising in constellation Virgo",
            "Astronomical observation personified as literal birth",
            "All sun gods have virgin birth stories",
            "Same phenomenon, different cultural narratives",
          ]
        ),
        ZodiacLesson(
          id: "zc_6_2",
          title: "Mary or Mari? The Etymology of Purity",
          content: """
            The name of Jesus's mother is given as MARY in English. But let's examine \
            the etymology:

            The Latin root is MARI—meaning "pure" or "of the sea."

            This is where we get:
            • Marine (of the sea)
            • Maritime (relating to the sea)
            • Marinate (purify in liquid)
            • Pure water was called "mari water" (purified water)

            The name wasn't M-A-R-Y (Mary) but M-A-R-I (Mari)—meaning PURE.

            So "Virgin Mari" doesn't mean a woman named Mary who was a virgin. \
            It means "the Pure Virgin"—referring to the pure, unblemished constellation \
            of Virgo.

            The Catholic Church venerates "Holy Mary, Mother of God"—but the original \
            meaning honored the zodiacal Virgin, the pure constellation that "gives birth" \
            to the sun.

            In the Last Supper painting, the feminine figure at Jesus's right represents Virgo—\
            one of the 12 zodiac signs surrounding the sun. This is why "she" sits in the \
            place of honor.
            """,
          keyPoints: [
            "Mari = 'pure' in Latin (not a personal name)",
            "Marine, maritime share the same root",
            "Virgin Mari = 'Pure Virgin' = Virgo constellation",
            "The Holy Mother = the zodiacal Virgin",
            "Feminine figure in Last Supper = Virgo",
          ]
        ),
      ]
    )
  }

  // MARK: - Module 7: The Cross Decoded

  private var moduleSeven: ZodiacModule {
    ZodiacModule(
      id: "zc_mod_7",
      number: 7,
      title: "The Cross Decoded",
      subtitle: "The Four Corners and the Circle",
      lessons: [
        ZodiacLesson(
          id: "zc_7_1",
          title: "No Man on the Cross: The First 600 Years",
          content: """
            A shocking historical fact: For the FIRST 600 YEARS of Christianity, there was \
            NO man depicted on the cross.

            Research the early Church and you'll find:
            • Early Christian art shows fish, peacocks, anchors, vines—but not crucifixes
            • The cross was a symbol, but Christ was not shown suffering on it
            • The first known crucifix (cross with Jesus's body) dates to the 5th-6th century

            Early Christians understood the cross as a COSMIC SYMBOL, not a torture device.

            What changed?

            Church councils in Europe decided to add the human figure to make the religion \
            "more personal" and relatable to common people. They transformed an abstract \
            cosmic symbol into an emotional image of human suffering.

            This was a deliberate choice to shift Christianity from astronomical knowledge \
            to emotional devotion—easier to control, easier to manipulate.

            The original Christians—the Evangelical Gnostics—would not have recognized \
            the crucifix as part of their faith.
            """,
          keyPoints: [
            "First 600 years of Christianity had no crucifix",
            "Early symbols: fish, anchors, vines—not suffering Jesus",
            "Cross was cosmic symbol, not torture device",
            "Church councils added the human figure later",
            "Changed from cosmic understanding to emotional manipulation",
          ]
        ),
        ZodiacLesson(
          id: "zc_7_2",
          title: "The Four Corners: N-E-W-S",
          content: """
            The cross represents the four cardinal directions:
            • North
            • East
            • West
            • South

            The cross is the intersection of these four directions—the "crossing" point \
            of the four corners of the earth.

            N-E-W-S: Notice anything?

            North-East-West-South = NEWS

            Anything that happens in the North, East, West, or South is NEWS—\
            information from the four corners of the world.

            This isn't coincidence—it's encoded linguistic wisdom.

            The sun appears to travel through these four directions daily:
            • Rises in the EAST
            • Reaches highest point in the SOUTH (in the northern hemisphere)
            • Sets in the WEST
            • "Dies" in the NORTH (winter, darkness)

            "God's Son dies on the cross" = the sun sets (dies) at the intersection of the \
            four cardinal directions.

            The cross is a map of the sun's daily journey and the four corners of our world.
            """,
          keyPoints: [
            "Cross = four cardinal directions (N-E-W-S)",
            "NEWS = North-East-West-South (not coincidence)",
            "Sun rises East, peaks South, sets West, 'dies' North",
            "Dying on the cross = sun setting at the intersection",
            "Cross is a solar/directional map, not just a torture device",
          ]
        ),
        ZodiacLesson(
          id: "zc_7_3",
          title: "The Circle on the Cross: Sun Worship",
          content: """
            Look at church architecture. On many churches, you'll find a distinctive symbol:

            A CROSS with a CIRCLE in the center.

            This is called the Celtic Cross, the Sun Cross, or the Wheel Cross.

            What is that circle?

            It's the SUN.

            The sun is a perfect circle—the most geometrically perfect shape observable in nature. \
            Ancient peoples saw it as "God's eye"—perfectly round like the pupil of an eye, \
            always watching from heaven.

            "God is watching you" = the sun sees everything during the day.

            You are a PUPIL following God's Son's teachings—"pupil" means both a student AND \
            the round part of the eye.

            The cross with the circle is the sun (God's Son) positioned at the center of the \
            four directions. It's an astronomical diagram right there on the church.

            Churches are built facing EAST—toward the rising sun—for the same reason. \
            Easter (East-er) celebrates the sun rising in the east.

            Sun worship is embedded in church architecture, even if modern worshippers don't \
            recognize it.
            """,
          keyPoints: [
            "Celtic/Sun Cross has circle at center",
            "The circle = the sun",
            "Sun = God's eye (perfect circle, always watching)",
            "Pupil = student AND part of the eye (double meaning)",
            "Churches face east = toward rising sun = sun worship",
          ]
        ),
      ]
    )
  }

  // MARK: - Module 8: The Way

  private var moduleEight: ZodiacModule {
    ZodiacModule(
      id: "zc_mod_8",
      number: 8,
      title: "The Way",
      subtitle: "What Christians Were Really Called",
      lessons: [
        ZodiacLesson(
          id: "zc_8_1",
          title: "Followers of 'The Way'",
          content: """
            In the first century, Christians were NOT called "Christians."

            Research Roman records and you'll find early followers of Jesus were called:

            "FOLLOWERS OF THE WAY"

            This term appears in the Book of Acts:
            • Acts 9:2 - Saul seeks those "belonging to the Way"
            • Acts 19:9 - Some spoke evil of "the Way"
            • Acts 19:23 - "A great disturbance about the Way"
            • Acts 22:4 - Paul persecuted "the Way"
            • Acts 24:14 - "According to the Way, which they call a sect"

            What IS "the Way"?

            In ancient Greek, Phoenician, and Middle Eastern traditions, "the Way" was a \
            specific term for THE ZODIAC—the path the sun travels through the 12 signs.

            Look up "the Way" in ancient texts and you'll find it consistently refers to \
            the zodiacal path, the ecliptic, the sun's journey through the heavens.

            Jesus said: "I AM the Way, the Truth, and the Life."

            The sun IS the Way—it travels the zodiacal path.
            The sun IS the Truth—it reveals all by its light.
            The sun IS the Life—without it, nothing lives.
            """,
          keyPoints: [
            "Early Christians called 'Followers of the Way'",
            "The term appears throughout the Book of Acts",
            "'The Way' = ancient term for the zodiacal path",
            "Sun travels through the 12 signs = 'the Way'",
            "I am the Way = the sun's path through the zodiac",
          ]
        ),
        ZodiacLesson(
          id: "zc_8_2",
          title: "Jeremiah's Warning About 'The Way'",
          content: """
            In Jeremiah 6:16, God gives an important instruction:

            "Thus saith the LORD, Stand ye in the ways, and see, and ask for the OLD PATHS, \
            where is THE GOOD WAY, and walk therein, and ye shall find rest for your souls. \
            But they said, We will NOT walk therein."

            God tells the people:
            1. Ask for the OLD paths (the ancient wisdom)
            2. Find THE WAY (the zodiacal knowledge)
            3. Walk in it (follow cosmic law)
            4. Find rest for your souls

            But the people refused: "We will NOT walk in the Way."

            This is exactly what happened historically. The original cosmic teachings—\
            the ancient understanding of the zodiac as God's creation and system—\
            were rejected in favor of literal interpretations and institutional control.

            The Way (astronomical wisdom) was abandoned.
            The old paths (ancient understanding) were forgotten.
            The people refused to walk in true understanding.

            And so they lost "rest for their souls"—the peace that comes from understanding \
            your place in the cosmic order.
            """,
          keyPoints: [
            "Jeremiah 6:16 tells people to 'ask for the old paths'",
            "'The Way' = the ancient cosmic wisdom",
            "People refused to 'walk in the Way'",
            "Original teachings abandoned for literal interpretation",
            "Walking in the Way brings 'rest for souls'",
          ]
        ),
        ZodiacLesson(
          id: "zc_8_3",
          title: "The Way as Astrology",
          content: """
            If "the Way" refers to the zodiac, then following "the Way" means understanding \
            astrology—the study of how celestial cycles influence earthly events.

            This makes the condemnation of astrology by modern Christianity deeply ironic.

            The original Christians—followers of the Way—were studying celestial patterns.
            The Magi who found Jesus were astrologers following a star.
            The zodiac is called God's creation in the Book of Job.
            Jesus constantly used zodiacal symbolism (12 apostles, fish, water bearer).

            Yet modern churches call astrology "demonic" or "of the devil."

            In Acts 10, Peter has a vision where God says: "Do not call anything impure \
            that God has made clean."

            If God created the zodiac (the Mazzaroth in Job), who are we to call it evil?

            The Way is not superstition—it's observation of God's cosmic order. \
            The ancients understood the correlation between celestial cycles and earthly patterns. \
            They encoded this knowledge in religious stories.

            Following the Way means understanding these patterns—not worshipping planets, \
            but recognizing the order God established in the heavens.
            """,
          keyPoints: [
            "The Way = following zodiacal/astrological wisdom",
            "Original Christians studied celestial patterns",
            "Magi were astrologers—they found Jesus by a star",
            "Modern condemnation of astrology contradicts scripture",
            "The Way = understanding God's cosmic order",
          ]
        ),
      ]
    )
  }

  // MARK: - Module 9: Etymology of Religious Terms

  private var moduleNine: ZodiacModule {
    ZodiacModule(
      id: "zc_mod_9",
      number: 9,
      title: "Sacred Etymology",
      subtitle: "Hidden Meanings in Religious Words",
      lessons: [
        ZodiacLesson(
          id: "zc_9_1",
          title: "Sunday: The Day of the Sun",
          content: """
            Why do Christians go to church on SUNDAY?

            SUNday = Sun's Day = Day of the SUN

            This is direct sun worship embedded in our weekly calendar:

            • Sunday - Sun's day
            • Monday - Moon's day
            • Tuesday - Tiw's day (Norse god of war, like Mars)
            • Wednesday - Woden's day (Odin, like Mercury)
            • Thursday - Thor's day (like Jupiter)
            • Friday - Freya's day (like Venus)
            • Saturday - Saturn's day

            Our entire week is named after celestial bodies and the gods associated with them.

            The Romans worshipped the sun on the first day of the week. \
            When Christianity became the Roman state religion, they kept this day \
            but changed the reason.

            "We're not worshipping the sun—we're worshipping on the day Jesus rose!"

            But Jesus as the risen savior IS the sun rising. The symbolism is the same, \
            just rebranded.

            Going to church on SUNday to celebrate the RISEN savior is sun worship \
            with a Christian label.
            """,
          keyPoints: [
            "Sunday = Sun's Day (day of the sun)",
            "All weekdays named after celestial bodies/gods",
            "Romans worshipped sun on first day of week",
            "Christianity adopted the day, rebranded the reason",
            "Risen savior on Sunday = sun rising",
          ]
        ),
        ZodiacLesson(
          id: "zc_9_2",
          title: "Crisco, Christ, and the Anointed",
          content: """
            Ever wonder about Pillsbury's cooking oil called CRISCO?

            CRISCO comes from the Greek word CHRISTOS (Χριστός).

            CHRISTOS means "the anointed one"—specifically, one who is anointed with OIL.

            In ancient times, anointing with oil was a sacred ritual:
            • Priests were anointed with oil
            • Kings were anointed with oil
            • The Messiah (Hebrew) = The Christ (Greek) = The Anointed One

            CRISCO is literally "Christ oil"—oil for anointing.

            When you call Jesus "the Christ," you're calling him "the Anointed"—\
            one who has had sacred oil applied.

            This connects to:
            • The woman who anointed Jesus's feet with oil
            • The wise and foolish virgins with their oil lamps
            • Anointing the sick with oil

            Oil (particularly olive oil) was sacred throughout the ancient world. \
            It represented the essence of the sun's energy captured in olives.

            Christ = Christos = Chrisco = Crisco = anointing oil.
            """,
          keyPoints: [
            "Crisco comes from Greek 'Christos'",
            "Christos means 'anointed with oil'",
            "Christ = the Anointed One",
            "Anointing with oil was sacred ritual for priests/kings",
            "Oil represents captured solar energy",
          ]
        ),
        ZodiacLesson(
          id: "zc_9_3",
          title: "More Hidden Etymology",
          content: """
            The language reveals what institutions try to hide:

            HORIZON:
            "Horus Rising" = Hor-Rise-On
            Horus was the Egyptian sun god. The horizon is where Horus rises.

            AMEN:
            Egyptian sun god was AMEN-RA. Every prayer ends with "AMEN"—\
            invoking the sun god whether you know it or not.

            HOLY/HALO:
            From HELIOS, the Greek sun god. Saints have HALOS—circles of light \
            around their heads representing solar divinity.

            CHURCH:
            From Greek KIRK or CIRCE—meaning circle. Churches are circles of \
            worshippers, and the sun is the perfect circle they honor.

            GOSPEL:
            God's Spell—the enchanting story of God's son (sun).

            HOLY SPIRIT / GHOST:
            In Dutch, "geist" (ghost) and "gas" are related. The "holy spirit" \
            that moves invisibly is like the wind—breath (spiritus) of God = \
            the invisible energy that moves things.

            Every word carries encoded history. The priests changed the packaging \
            but couldn't change the linguistic roots.
            """,
          keyPoints: [
            "Horizon = Horus Rising (Egyptian sun god)",
            "Amen = Amen-Ra (Egyptian sun god)",
            "Halo = Helios (Greek sun god)",
            "Church = circle (kirk/circe)",
            "Language preserves truth institutions tried to hide",
          ]
        ),
      ]
    )
  }

  // MARK: - Module 10: The Original Christians

  private var moduleTen: ZodiacModule {
    ZodiacModule(
      id: "zc_mod_10",
      number: 10,
      title: "The Evangelical Gnostics",
      subtitle: "What the Original Christians Believed",
      lessons: [
        ZodiacLesson(
          id: "zc_10_1",
          title: "Gnosis: Direct Knowledge",
          content: """
            Before institutional Christianity, there were the GNOSTICS.

            GNOSIS (γνῶσις) = Greek for "knowledge" or "knowing"

            The Gnostics were the "knowers"—those who sought DIRECT EXPERIENCE of the divine \
            rather than blind faith in intermediaries.

            Key Gnostic beliefs:

            1. DIRECT KNOWLEDGE IS POSSIBLE
            You don't need a priest to connect you to God. Divine wisdom can be \
            experienced directly through inner revelation.

            2. THE DIVINE SPARK WITHIN
            Every human contains a spark of divine light, trapped in material existence. \
            Awakening means recognizing this inner divinity.

            3. ALLEGORY OVER LITERALISM
            Sacred texts are SYMBOLIC, not literal history. They encode cosmic truths \
            through stories, not document historical events.

            4. ASTROTHEOLOGY
            The Gnostics understood that religious stories encoded astronomical knowledge. \
            They knew the zodiac was God's kingdom.

            The early Christians who were called "followers of the Way" were these Gnostics—\
            people who understood the cosmic symbolism behind the teachings.
            """,
          keyPoints: [
            "Gnosis = knowledge/knowing in Greek",
            "Gnostics sought direct experience, not blind faith",
            "Believed in divine spark within each person",
            "Understood texts as allegory, not literal history",
            "Knew the zodiacal foundation of religious symbolism",
          ]
        ),
        ZodiacLesson(
          id: "zc_10_2",
          title: "The Suppression of Gnosis",
          content: """
            What happened to the Gnostics? Why don't we hear about them?

            They were systematically suppressed by the emerging institutional church.

            THE COUNCIL OF NICAEA (325 AD):
            Emperor Constantine convened bishops to standardize Christianity. \
            They voted on which books to include in the Bible and which to exclude. \
            Most Gnostic texts were labeled "heretical" and ordered destroyed.

            THE PERSECUTION:
            For centuries, possessing Gnostic texts could mean death. \
            The knowledge was driven underground.

            THE NAG HAMMADI DISCOVERY (1945):
            In Egypt, a farmer found a sealed jar containing 13 leather-bound codices—\
            Gnostic texts hidden to preserve them from destruction. \
            These include the Gospel of Thomas, Gospel of Philip, and many others.

            THE HIDDEN TEACHINGS:
            These texts reveal that early Christians had a VERY different understanding \
            than what became orthodox. They understood the allegorical, astronomical nature \
            of the teachings.

            The institutional church made faith mandatory and knowledge forbidden. \
            "Just believe" replaced "seek to understand."
            """,
          keyPoints: [
            "Gnostics suppressed by institutional church",
            "Council of Nicaea voted on canon, excluded Gnostic texts",
            "Possessing Gnostic texts was punishable by death",
            "Nag Hammadi texts discovered in 1945",
            "Original Christianity was knowledge-based, not faith-based",
          ]
        ),
        ZodiacLesson(
          id: "zc_10_3",
          title: "Why They Hid the Truth",
          content: """
            Why would religious institutions hide the zodiacal, astronomical origins of their teachings?

            CONTROL:
            If you know you contain a divine spark and can access wisdom directly, \
            you don't need priests. The church becomes unnecessary.

            POWER:
            If sacred texts are allegory anyone can interpret, there's no authority. \
            By claiming exclusive access to truth, institutions gain power.

            MONEY:
            If salvation comes from understanding, you can't sell indulgences or demand tithes. \
            Fear of hell keeps people paying.

            SIMPLICITY:
            Cosmic symbolism is complex. "Just believe and be saved" is simple. \
            Simple messages spread faster than nuanced wisdom.

            POLITICAL UTILITY:
            Constantine didn't care about spiritual truth. He wanted a unified religion \
            to control his empire. Literalized Christianity served political purposes.

            The zodiacal truth empowers individuals.
            The literalized version empowers institutions.

            That's why they hid it.
            """,
          keyPoints: [
            "Control: Direct gnosis eliminates need for priests",
            "Power: Exclusive interpretation = institutional authority",
            "Money: Fear-based religion generates income",
            "Simplicity: Literal faith spreads faster than wisdom",
            "Political: Unified religion controls empires",
          ]
        ),
      ]
    )
  }

  // MARK: - Module 11: Reclaiming the Original Teachings

  private var moduleEleven: ZodiacModule {
    ZodiacModule(
      id: "zc_mod_11",
      number: 11,
      title: "Reclaiming the Original Teachings",
      subtitle: "What This Means for You Today",
      lessons: [
        ZodiacLesson(
          id: "zc_11_1",
          title: "Not About Destroying Faith",
          content: """
            Understanding the zodiacal origins of religious symbolism is not about destroying faith. \
            It's about deepening it.

            Consider: What's more miraculous?

            A. A man 2,000 years ago literally walked on water and rose from the dead

            B. Ancient wisdom keepers encoded profound astronomical knowledge into stories that have \
            guided billions for millennia, preserving crucial information about humanity's relationship \
            with the cosmos

            The second option requires even more wonder and appreciation.

            The ancients weren't primitive—they were profound. They created a system of preservation \
            so powerful that even after institutions tried to literalize and corrupt it, the truth \
            remains embedded in the very words we use.

            The sun DOES give life to everything.
            The zodiac DOES correlate with cycles on Earth.
            The 12 divisions of the year ARE meaningful.

            This isn't rejecting the sacred—it's recognizing WHERE the sacred truly resides: \
            in the actual cosmos, not in literal interpretations of poetry.
            """,
          keyPoints: [
            "This deepens faith, doesn't destroy it",
            "Ancient wisdom is more profound than literal miracles",
            "The ancients encoded truth brilliantly",
            "The cosmic truths ARE sacred",
            "The sacred is in the cosmos, not in literalism",
          ]
        ),
        ZodiacLesson(
          id: "zc_11_2",
          title: "What To Do With This Knowledge",
          content: """
            How should you apply this understanding?

            1. OBSERVE THE SKY:
            Start watching sunrise and sunset. Notice the moon phases. \
            Learn where the constellations are. Experience what the ancients experienced.

            2. UNDERSTAND THE CALENDAR:
            The solstices, equinoxes, and seasonal transitions were sacred moments. \
            Connect with these natural cycles instead of arbitrary holidays.

            3. QUESTION INSTITUTIONS:
            When a religious authority condemns something as "demonic" or "evil," \
            research whether it was actually part of the original teachings. \
            Much that's condemned was sacred knowledge before it was suppressed.

            4. SEEK DIRECT EXPERIENCE:
            Like the Gnostics, prioritize your own inner experience over external authority. \
            You have access to the same cosmos, the same sun, the same stars they studied.

            5. SHARE WISELY:
            Not everyone is ready for these ideas. Some will react with hostility. \
            Share with those who are seeking, not those who are defending.

            6. INTEGRATE, DON'T DIVIDE:
            This knowledge unifies rather than divides. See how all traditions encode \
            the same cosmic truths. Use this to build bridges, not walls.
            """,
          keyPoints: [
            "Observe the sky—experience what ancients experienced",
            "Connect with natural calendar cycles",
            "Question institutional condemnations",
            "Prioritize direct experience over authority",
            "Use this knowledge to unify, not divide",
          ]
        ),
        ZodiacLesson(
          id: "zc_11_3",
          title: "The Plagiarism Defense Exposed",
          content: """
            When confronted with the obvious parallels between Christianity and older solar religions, \
            some defenders make an absurd argument:

            "The Devil knew Jesus would come, so Satan planted all these similar stories beforehand \
            to make Jesus look like a copy!"

            Think about this logically:

            So the Devil:
            1. Knew thousands of years in advance exactly what Jesus would do
            2. Created Horus, Mithra, Krishna, and dozens of other sun gods
            3. Made them all have virgin births, 12 disciples, die and resurrect
            4. Just to make Jesus look unoriginal later?

            This is like an author in 2025 claiming: "Everyone who wrote this story before me \
            in the past 2,000 years KNEW I would eventually write it, so they published first \
            just to make me look like a plagiarist!"

            No. When the same story appears repeatedly across cultures and millennia, \
            with the same details—virgin birth, 12 helpers, death and resurrection—\
            we're looking at the SAME SOURCE: solar mythology.

            The sun was the original "savior." All the stories point to the same celestial phenomenon. \
            Christianity didn't copy these religions; they all arise from the same astronomical observations.
            """,
          keyPoints: [
            "The 'Devil planted parallels' defense is illogical",
            "Parallel myths across cultures indicate common source",
            "Solar mythology is that common source",
            "All savior figures encode sun worship",
            "Christianity arose from same observations as others",
          ]
        ),
      ]
    )
  }

  // MARK: - Module 12: Living the Cosmic Truth

  private var moduleTwelve: ZodiacModule {
    ZodiacModule(
      id: "zc_mod_12",
      number: 12,
      title: "Living the Cosmic Truth",
      subtitle: "Walking in 'The Way' Today",
      lessons: [
        ZodiacLesson(
          id: "zc_12_1",
          title: "As Above, So Below",
          content: """
            The Hermetic axiom "As above, so below" summarizes the ancient understanding:

            What happens in the heavens corresponds to what happens on Earth.

            This isn't superstition—it's observation:
            • The moon affects tides
            • Solar cycles affect climate
            • Seasons change all life patterns
            • Light and darkness affect mood and behavior

            The ancients extended this observation to subtler influences: \
            planetary alignments, zodiacal transitions, celestial events.

            Were they wrong? Modern science confirms:
            • Solar flares affect electronics and even human behavior
            • Full moons correlate with certain emergency room statistics
            • Seasonal affective disorder proves light affects consciousness

            "Let thy will be done on Earth as it is in Heaven" isn't passive resignation—\
            it's acknowledging that cosmic patterns manifest on Earth.

            Understanding these patterns allows you to align with them rather than fight them. \
            That's wisdom, not superstition.
            """,
          keyPoints: [
            "'As above, so below' = cosmic correspondence",
            "Moon affects tides—celestial influence is real",
            "Solar cycles affect all life on Earth",
            "Science confirms many celestial influences",
            "Understanding patterns allows alignment with cosmic law",
          ]
        ),
        ZodiacLesson(
          id: "zc_12_2",
          title: "You Are Part of the Cosmos",
          content: """
            The ultimate teaching of this knowledge is simple:

            YOU ARE NOT SEPARATE FROM THE COSMOS.

            You are:
            • Made of elements forged in dying stars
            • Sustained by solar energy flowing through the food chain
            • Governed by the same cycles that move planets
            • Part of the cosmic dance, not an observer of it

            The Gnostics taught that you contain a divine spark—a piece of the cosmic light \
            temporarily housed in a material body.

            This isn't religious poetry. Every atom in your body was once in a star. \
            You are literally made of stellar material.

            When you understand the zodiac as God's kingdom, you understand YOUR place in it. \
            You are not a worm begging for salvation. You are a cosmic being having a temporary \
            earthly experience.

            The sun that rises each morning rises within you too—consciousness awakening from sleep. \
            The yearly cycle the sun travels, you travel in your own spiritual development. \
            The ages the zodiac measures, humanity moves through collectively.

            As above, so below. As without, so within.
            """,
          keyPoints: [
            "You are not separate from the cosmos",
            "Your atoms came from stars",
            "You contain a divine spark of cosmic light",
            "The solar cycle mirrors consciousness awakening",
            "As above, so below—as without, so within",
          ]
        ),
        ZodiacLesson(
          id: "zc_12_3",
          title: "Walking in The Way",
          content: """
            To "walk in the Way" today means:

            1. RECOGNIZE YOUR COSMIC CITIZENSHIP
            You belong to the universe, not just to a nation, tribe, or religion.

            2. HONOR THE CYCLES
            The solar and lunar cycles are sacred. Align your life with natural rhythms \
            rather than purely artificial schedules.

            3. SEEK GNOSIS
            Direct experience trumps inherited belief. Investigate, question, experience.

            4. SEE THROUGH DIVISION
            All religions encode the same cosmic truths. Don't fight over which \
            packaging is correct—recognize the common content.

            5. EMBODY THE LIGHT
            Like the sun, give your energy freely. Illuminate. Warm. Sustain.

            6. ACCEPT THE CYCLES
            Light and dark, birth and death, expansion and contraction—all are part \
            of the cosmic dance. Accept both sides of existence.

            7. REMEMBER:
            "God's kingdom" is the zodiac.
            "God's Son" is the sun.
            "The Way" is the path through the signs.
            And YOU are part of this cosmic story.

            Welcome to the Way. Now walk in it.
            """,
          keyPoints: [
            "Recognize yourself as a cosmic citizen",
            "Honor natural cycles as sacred",
            "Seek direct gnosis over inherited belief",
            "See unity behind religious divisions",
            "Walk in the Way—you are part of the cosmic story",
          ]
        ),
      ]
    )
  }
}

// MARK: - Supporting Types

struct ZodiacModule: Identifiable {
  let id: String
  let number: Int
  let title: String
  let subtitle: String
  let lessons: [ZodiacLesson]
}

struct ZodiacLesson: Identifiable {
  let id: String
  let title: String
  let content: String
  let keyPoints: [String]
}
