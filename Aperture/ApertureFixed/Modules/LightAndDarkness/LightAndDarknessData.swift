// LightAndDarknessData.swift
// LIGHT & DARKNESS — "The Greatest Story Ever Told. Decoded."
// ☀️ SunFlow: Reignited
//
// "Once you see it, you cannot unsee it."
// — Jordan Maxwell
//
// Four courses that cook the deepest institutional narrative ever run:
// organized religion itself. Not to destroy faith — to deepen it.
// To replace borrowed belief with earned understanding.
//
// Built on the astro-theology research of Jordan Maxwell,
// translated through the SunFlow lens: pattern recognition,
// systems thinking, and the courage to question everything.

import SwiftUI

// MARK: — Course Catalog

struct LDCourse: Identifiable {
    let id: String
    let number: Int
    let emoji: String
    let title: String
    let subtitle: String
    let tagline: String
    let accentColor: Color
    let estimatedMinutes: Int
    let lessons: [LDLesson]
}

struct LDLesson: Identifiable {
    let id: String
    let title: String
    let body: String                    // Full long-form content
    let keyTakeaway: String
    let patternToSpot: String?          // "Spot this in the wild" prompt
}

// MARK: — The Four Courses

let lightAndDarknessCourses: [LDCourse] = [
    
    // ═══════════════════════════════════════════════════
    // COURSE 1: EASTER
    // ═══════════════════════════════════════════════════
    
    LDCourse(
        id: "ld_easter",
        number: 1,
        emoji: "🌅",
        title: "Easter",
        subtitle: "The Sun That Died and Rose Again",
        tagline: "Every spring, billions celebrate an astronomical event they've been taught to call a resurrection.",
        accentColor: Color(red: 1.0, green: 0.75, blue: 0.3),
        estimatedMinutes: 18,
        lessons: [
            LDLesson(
                id: "easter_1",
                title: "The Last Supper Is a Star Map",
                body: """
Why are there exactly 12 people at the table with Jesus?

Not 10. Not 15. Exactly 12.

The answer isn't theological. It's astronomical.

**12 people = 12 months = 12 signs of the zodiac.**

Jesus sits at the center — the Sun, the only source of light — surrounded by his 12 months of the year. Look at how Leonardo arranged the painting: the 12 apostles are grouped into *four clusters of three*. Four groups. Three months each. 

Spring. Summer. Autumn. Winter.

The four gospels — Matthew, Mark, Luke, John — tell you the same thing in different words: they are the four seasons of God's son's journey through the year.

Notice the figure to Jesus's immediate right in the painting: it's drawn as a woman. Because one of the 12 signs of the zodiac is *Virgo the Virgin*. This is why scripture says Jesus was born of a virgin. Not a human woman. The *constellation* Virgo. In astrology, spring was always associated with Virgo rising on the horizon.

There's only one Jesus because there's only one Sun. We don't have six suns. We have one. The only begotten Son — because there's only one Sun in our solar system.

Once you see this framework, the entire New Testament snaps into focus. It was never history. It was always astronomy.
""",
                keyTakeaway: "The 12 apostles represent the 12 months/zodiac signs. Jesus is the Sun at the center. The Last Supper is a star chart.",
                patternToSpot: "Next time you see religious art, count the figures. Watch for groupings of 12, 4, and 3."
            ),
            LDLesson(
                id: "easter_2",
                title: "Passover, Easter, and the Equinox",
                body: """
Christians call it Easter. Jews call it Passover.

They're the same event — and neither is what you were told.

Every year, as winter ends, the Sun begins its journey back to the Northern Hemisphere. It *crosses over* the equator at the spring equinox. The Jews called this the *Passover* — the Sun literally passing over from the southern to the northern half of the Earth.

As the Sun returns, *everything springs back to life*. Plants bloom. Animals reproduce. The Earth warms. Life returns after the dead months of winter.

We call that season: **Spring**.

Which is exactly what Christians call it too. Walk into any store around Easter and count how many times you see the word "spring" paired with the word "Easter." They are used interchangeably — because they ARE the same thing.

**Easter = Spring = The Sun's Return**

The celebration is for the return of God's son — the light of the world — after his death in winter. The Sun dies (goes south) and is resurrected (comes north). Every. Single. Year. Like clockwork. Which is exactly what a covenant looks like.

The Catholic Church even defines Easter using pure astronomy: "The first Sunday after the first full moon after the spring equinox." They're calculating a solar-lunar event. Not a historical anniversary.

The early Germanic peoples called their spring goddess *Eostre*. Spring festival = Eostre's feast = Easter. The eggs, the rabbits — all ancient symbols of fertility and new life at spring. Pre-Christian. Pre-Jewish. As old as human civilization itself.

The story is true. Just not literally. The Sun does die and resurrect. Every year. That's the covenant. That's the promise. That's why we celebrate.
""",
                keyTakeaway: "Easter and Passover both mark the spring equinox — the Sun crossing the equator back to the Northern Hemisphere, bringing life. The 'resurrection' is astronomical, not biological.",
                patternToSpot: "Look at any Easter card. Count how many times 'spring,' 'season,' and 'sunrise' appear alongside resurrection language."
            ),
            LDLesson(
                id: "easter_3",
                title: "The Sun/Son Wordplay Is Not Accidental",
                body: """
In English, we have two words that sound identical:

**SUN** — the star at the center of our solar system.
**SON** — a male child.

This is not a coincidence.

Jesus is consistently called *the light of the world*. Why? Because the literal Sun IS the light of the world. Without it, everything dies within weeks.

Jesus is called *the risen Lord*. Christian Easter sunrise services — held literally at dawn, facing east where the Sun rises — celebrate "the risen son." Every sunrise service is, by definition, a sun-rise service.

Church after church is named *Sunrise Church*, *Son Rise Fellowship*, *Rising Son*. The pun is embedded in 2,000 years of Christian iconography because it was *intentional*. The original architects of these stories knew exactly what they were encoding.

Here's how to test this yourself: look at any church's marketing around Easter. Watch how freely they swap "sun" and "son" imagery. Sunrise services. Son of God. The light of the world. It's the same concept, the same symbol, split across two spellings.

The ancient Romans who built Christianity called their primary celebration *Dies Solis* — the Day of the Sun. We still call it Sunday. The first day of the week. The day Christians worship. Named after the Sun.

The cross — that's the Sun too. An equal-armed cross within a circle is the oldest known symbol for the Sun, found in cave paintings dating back 12,000 years. Long before any Christianity, humans drew a circle with lines radiating outward and said: that's God. That's the source of all light and life.

Jesus on the cross is the Sun dying at the winter solstice, hung on the Southern Cross constellation.

Which brings us to the crucifixion.
""",
                keyTakeaway: "The Sun/Son wordplay in Christianity is structural and intentional. The cross, sunrise services, and 'light of the world' all point to the same source: the Sun.",
                patternToSpot: "Find a church anywhere that does Easter sunrise services. Note they are literally watching the sun rise. That's the worship — and it's real."
            )
        ]
    ),
    
    // ═══════════════════════════════════════════════════
    // COURSE 2: THE ILLUSION OF FREEDOM
    // ═══════════════════════════════════════════════════
    
    LDCourse(
        id: "ld_freedom",
        number: 2,
        emoji: "🔓",
        title: "The Illusion of Freedom",
        subtitle: "The System You Were Born Into",
        tagline: "You think you're a free citizen. The paperwork says otherwise.",
        accentColor: Color(red: 0.4, green: 0.8, blue: 1.0),
        estimatedMinutes: 20,
        lessons: [
            LDLesson(
                id: "freedom_1",
                title: "The United States Is a Corporation",
                body: """
After the Civil War ended in 1865, the country was not united. The war was over — but the blood was not. The hatred was not. The division was not.

The politicians and bankers of the 1870s had a problem: how do you run a nation full of people who despise each other? Their solution was radical: *turn it into a company*.

In 1871, the District of Columbia Organic Act created the **United States** (incorporated) — a private corporation modeled on business law. Separate from the original *United States of America* — the republic founded in 1776.

This is why your legal documents always say **United States** — never "United States of America." Not a typo. Not interchangeable.

*United States of America* = the constitutional republic.
*United States* = the corporation.

When you fill out government forms and they ask if you're a "US citizen" — you are confirming you are an *employee* of the corporate entity called United States. That's the legal definition. Not a citizen of the republic. An employee of the corporation.

This is why everything functions as a business transaction:

- You need a *license* to drive (because driving is defined as commercial transport — operating a vehicle for business).
- You need a *marriage license* (because in corporate law, two entities entering a partnership require a contract — and a license).
- You go to *court* (courts are where commerce is adjudicated — tennis courts, basketball courts, all places where competition produces winners and money changes hands).

The language reveals the structure. Once you see it, you can't unsee it.
""",
                keyTakeaway: "The United States (corporation) and the United States of America (republic) are legally distinct entities. US citizenship means employee status in a corporate structure.",
                patternToSpot: "Look at any federal government document. It will say 'United States' — never 'United States of America.' That distinction is not an accident."
            ),
            LDLesson(
                id: "freedom_2",
                title: "Your Birth Certificate Is a Financial Instrument",
                body: """
You came out of your mother's water. Her water broke. You traveled down the birth *canal*. You were delivered at a *port* of entry (a hospital — a place where vessels dock). The attending physician signed the paperwork at the *dock*.

If this sounds like shipping terminology, that's because legally — it is.

Welcome to **Maritime Admiralty Law**: the law of the sea. Banking law. The law that governs anything traveling through water.

When a ship arrives at port, the captain must file a *Certificate of Manifest* documenting every item of commercial value on board. The port authority signs it.

When you were born, your mother filed a *Birth Certificate* with the government. The *doctor* signed it — because the doctor is the *dock-tor*. The person at the dock. 

On your birth certificate, your mother is listed not as "parent" or "mother." She is listed as the **informant**. Legally, she is informing the state that a new *commercial product* has been delivered.

Your name on all legal documents — driver's license, Social Security card, court summons, tax forms — appears in **ALL CAPITAL LETTERS**. In legal typography, all-caps represents a *corporation* or a *legal fiction* — a separate entity that can be taxed, sued, and controlled. The all-caps version of your name is the corporate entity the government actually deals with. Not you, the living human.

Your Social Security number? The back of your Social Security card has a number printed in red. That number corresponds to a bond — a financial instrument traded on stock markets. Your productive capacity was used as collateral when the U.S. government went bankrupt and borrowed from international banks.

This is presented as civic education. It is not. But knowing it gives you *context* for why the system operates the way it does.
""",
                keyTakeaway: "Birth certificates, maritime admiralty law, and all-caps names form a legal framework that treats citizens as commercial commodities within a corporate structure.",
                patternToSpot: "Check any government-issued document (license, SS card, court notice). Your name will be in ALL CAPS. That's the corporate 'you' — not the human you."
            ),
            LDLesson(
                id: "freedom_3",
                title: "The Crown, the City, and the Federal Reserve",
                body: """
Inside the city of London — a one-square-mile zone within greater London — sits the financial capital of the world. All major international banks maintain their primary offices there. It operates under its own laws, its own police force, its own governance. The Queen of England must ask permission to enter it.

This zone is called simply **The City**. And it is not owned by the British government.

It is controlled by a private order known as *the Crown* — not the royal family, who are largely ceremonial. The Crown refers to the **Knights Templar Freemasonic Order** — the most ancient banking brotherhood in Western history.

The Templars were disbanded officially in 1307. But their banking system — interest-bearing loans, letters of credit across borders, international finance — never stopped. It simply restructured under different names, migrating through the centuries into Freemasonry, into the Bank of England, into the City of London, and ultimately into the Federal Reserve System.

The Federal Reserve is not a government agency. It is a *private bank* — a consortium of banks that prints the U.S. money supply and charges interest on every dollar in existence. It was chartered in 1913, the same year the income tax was established (as a collection mechanism to ensure repayment).

The chain of control:
**Vatican → City of London (The Crown) → Federal Reserve → U.S. Government → You**

This is not a conspiracy theory. These are documented institutional relationships. The Vatican holds enormous financial interests through the IOR (Vatican Bank). The City of London's financial power is openly acknowledged. The Federal Reserve's private ownership structure is a matter of public record.

The knowledge is available. It has never been taught in schools because schools are also part of the system.

*You are not free in the way the story told you. But you are free in the way that matters most: you can see it now.*
""",
                keyTakeaway: "The Federal Reserve is a private bank. The City of London's 'Crown' is a financial brotherhood, not the monarchy. The Vatican-Crown-Fed chain controls the global monetary system.",
                patternToSpot: "Look at any dollar bill: 'Federal Reserve Note.' A note is a debt instrument. You don't own it. You owe it. Every dollar in existence is borrowed into existence with interest."
            )
        ]
    ),
    
    // ═══════════════════════════════════════════════════
    // COURSE 3: THE MESSIAH
    // ═══════════════════════════════════════════════════
    
    LDCourse(
        id: "ld_messiah",
        number: 3,
        emoji: "👁️",
        title: "The Messiah",
        subtitle: "The Symbol That Unites All Three Religions",
        tagline: "The all-seeing eye on the dollar isn't evil. It's the most ancient symbol for God that exists.",
        accentColor: Color(red: 0.8, green: 0.6, blue: 1.0),
        estimatedMinutes: 22,
        lessons: [
            LDLesson(
                id: "messiah_1",
                title: "The Eye of God — In Every Church, Synagogue, and Mosque",
                body: """
Christians are taught to see the pyramid and the all-seeing eye on the dollar bill as satanic. As Illuminati. As evil.

Here's what the reference books actually say:

The eye — *the all-seeing eye of God* — appears in Catholic churches on six continents. It's in stained glass windows across Protestant Europe. It's on the altar of Orthodox churches in Russia and Greece. It's in Jewish synagogues from New York to Jerusalem. It's in Islamic art from Turkey to Indonesia. It's on the Supreme Court's chair. It's on the papal vestments.

In the *Dictionary of All Scripture and Myth*, the eye is described as "the primary organ of sense perception closely connected with light, the sun, and the spirit — a symbol of mental vision, spiritual understanding."

In *Christian publications* sold in church bookstores: "The Eye-in-the-Triangle is a symbol of God. It is found in English and Greek churches."

The Catholic *Douay Bible* — the official Catholic Bible — has the eye in the triangle on its inside cover. The Catholic Church has used this symbol for 1,600 years.

In Judaism, Moses receiving the Ten Commandments is depicted with God represented as an eye in a triangle with a sunburst. The Hebrew name of God — the *Tetragrammaton* (YHWH/Yahweh) — is *always* displayed within a triangle in religious art.

This symbol is not satanic. It predates Satan as a concept. It goes back to Egypt: the Eye of Horus, the Eye of Ra — the Sun — the ultimate source of light, life, and intelligence.

When you see the eye, you're seeing 12,000 years of human understanding that the Sun is God's eye watching over creation.
""",
                keyTakeaway: "The all-seeing eye is found in Catholic, Protestant, Orthodox, Jewish, and Islamic sacred spaces worldwide. It's the universal ancient symbol for God/the Sun — not a Satanic or Illuminati symbol.",
                patternToSpot: "Visit any old church, cathedral, or synagogue. Look at the ceilings, stained glass, and altar art. You will find the eye in the triangle. It was never hidden."
            ),
            LDLesson(
                id: "messiah_2",
                title: "The Pyramid Is the Messiah's Temple",
                body: """
Proverbs 25:2 says: *"It is the glory of God to conceal a thing; but the honor of Kings is to search out a matter."*

The word *Messiah* — both in Hebrew (Old Testament) and Greek (New Testament) — does not simply mean "anointed one." In the original languages, the Messiah is described as the **Chief Cornerstone** — the stone the builders rejected.

But look at the *actual words* in both Hebrew and Greek:

In Hebrew: a word meaning **a triangle perched atop a pyramid**.
In Greek (used in the New Testament): the same concept — **a triangular piece perched on top of a rectangular structure**.

The Chief Cornerstone is not a flat stone on the ground. It's the *capstone* — the apex stone that completes the pyramid. The stone that *sits at the very top*. Which is exactly what you see on the dollar bill: the eye at the apex of the pyramid.

Isaiah 19:19 says: *"In that day shall there be an altar to the LORD in the midst of the land of Egypt, and a pillar at the border thereof to the LORD."* Most scholars read this as two things — an altar and a pillar. But Isaiah continues: *"and it shall be for a **sign** and for a **witness** unto the LORD."*

One sign. One witness. One thing.

The Great Pyramid of Giza sits *in the midst* of Egypt — literally at the geographical center — and marks the *border* between Lower and Upper Egypt. It is both altar and pillar. One structure.

The Pyramid is the altar to God prophesied by Isaiah. The eye at its apex is the Messiah — the Chief Cornerstone the builders rejected. Not placed there by Illuminati. Placed there by people who read their Bibles.
""",
                keyTakeaway: "The 'Chief Cornerstone' in both Hebrew and Greek literally means the capstone of a pyramid. The Great Pyramid of Giza is the altar prophesied in Isaiah 19:19. The dollar bill reflects this theology.",
                patternToSpot: "On the Great Seal of the US (back of the dollar), count: 13 layers of the pyramid. 13 stars above the eagle. 13 arrows. 13 olive leaves. 13 = Messiah + 12. Always."
            ),
            LDLesson(
                id: "messiah_3",
                title: "The Number 13 and Why America Was Founded on It",
                body: """
Why 13 colonies? Every student is taught it was coincidence — just how many there were at the time. But the question is never asked deeper.

In Biblical numerology, 13 = the Messiah + his chosen 12.

Jesus + 12 apostles = 13.
Joseph + 12 brothers = 13.
The Messiah + 12 tribes of Israel = 13.
The Messiah + 12 signs of the zodiac = 13.

The founding fathers — most of whom were Freemasons — built the number into everything:
- 13 original colonies
- 13 stars in the Great Seal arranged as a Star of David (6-pointed star made of 13 stars)
- 13 layers on the pyramid on the dollar
- 13 arrows in the eagle's left talon
- 13 olive leaves in the right talon
- 13 stripes on the American flag

The eagle itself is the ancient Egyptian symbol for Horus — the Sun God. Every image of the eagle on American seals and currency is a direct descendant of Egyptian Sun worship.

The Freemasons who founded this country were not worshipping Satan. They were fluent in ancient astro-theology — the same symbolic language used in Egypt, Babylon, India, and throughout the ancient world. They embedded that knowledge into the DNA of American symbolism because they wanted future initiates to recognize the lineage.

The knowledge was never hidden. It was displayed on every dollar bill, every federal building, every monument in Washington D.C. — the city deliberately designed on sacred geometric principles by Pierre L'Enfant, a Freemason.

*It was hidden in plain sight. The assumption was that nobody would look.*
""",
                keyTakeaway: "13 = Messiah + 12 chosen. This formula is embedded throughout American symbolism — colonies, Great Seal, dollar bill — because the Founding Fathers were fluent in ancient astro-theology.",
                patternToSpot: "On any US currency or federal seal, count the groupings of 13. They are never accidents. They are a calling card of those who understood the ancient knowledge."
            )
        ]
    ),
    
    // ═══════════════════════════════════════════════════
    // COURSE 4: THE CRUCIFIXION
    // ═══════════════════════════════════════════════════
    
    LDCourse(
        id: "ld_crucifixion",
        number: 4,
        emoji: "☀️",
        title: "The Crucifixion",
        subtitle: "The Sun's Death and Resurrection — Every Year",
        tagline: "The crucifixion happened. It happens every winter solstice. It always has.",
        accentColor: Color(red: 1.0, green: 0.5, blue: 0.3),
        estimatedMinutes: 20,
        lessons: [
            LDLesson(
                id: "crucifixion_1",
                title: "The Three Days of Death at the Winter Solstice",
                body: """
December 22nd. December 23rd. December 24th.

For these three days, the Sun — which has been moving southward across the sky since June — comes to a complete stop. Its position at sunset freezes. It doesn't move. Ancient peoples called this: **the Sun is dead**.

The sky chart of December 22-24 shows the Sun positioned next to a star constellation called the **Southern Cross**. The Sun literally stops — *dies* — at the Southern Cross.

Three days of death. Hung on the Southern Cross.

Then on December 25th: the Sun begins to move again. One degree northward. Its path shifts. Life is returning.

The ancient peoples called this the **resurrection of God's Son**. We call it Christmas — *Christ's Mass*. The celebration of the Sun's return. The birth of new light.

This is not metaphor. This is observable astronomy. Anyone with a clear sky and 2,000 years ago's level of careful observation would see it. The ancient Egyptians mapped it. The Sumerians recorded it. The Celtic druids marked it with standing stones that track the solstice to the day.

Every civilization that looked up understood: the Sun dies in winter and is reborn on December 25th. Every civilization built mythology around it. The *names* change — Ra, Osiris, Mithras, Krishna, Jesus. The *story* never does.

Crucified. Three days in the tomb. Resurrected on the third day. It's the winter solstice. It happens every year. That's why we celebrate it every year. Not because of a historical event from 2,000 years ago — because the astronomical event happens *every single December*.
""",
                keyTakeaway: "December 22-24: the Sun stops moving at the Southern Cross constellation — 'dies.' December 25: the Sun begins moving north again — 'rises.' The crucifixion/resurrection is the winter solstice, happening every year.",
                patternToSpot: "Find the Southern Cross constellation in the December night sky (visible from southern latitudes, or in star charts). That's the cross the Sun 'dies on' each year."
            ),
            LDLesson(
                id: "crucifixion_2",
                title: "For 700 Years, There Was No Human on the Cross",
                body: """
This is one of the most astonishing facts hidden in plain church history:

For the first **700 years** of Christianity, no image of a human hanging on a cross existed anywhere. Not in any church. Not in any Christian artwork. Not anywhere.

The cross was used — but with the *Sun* on it. The cross with a circle (the Sun disk) at its center. An equal-armed cross within a circle — the ancient 12,000-year-old petroglyph symbol for the Sun that's found in cave paintings from Sweden to Arizona.

No crucified man. Just the Sun on the cross.

Then, in the 4th century, the Roman Emperor Constantine — who became Christian and made everyone else become Christian to stay in his good graces — needed the religion restructured for empire management. A council was called: the **Council of Constantinople**.

At this council, it was decided that the religion needed a human figure to make it more emotionally accessible. A historical man. An anchor in real-world narrative. They chose the historical figure of **Apollonius of Tyana** — a real philosopher and mystic from the 1st century — as the physical template.

The face, the story structure, the biographical details: assembled from Apollonius and various other mythological archetypes (Krishna, Mithras, Osiris — all of whom were crucified, all born on December 25th, all resurrected on the third day).

This is documented history available in any seminary library. The human "Jesus" on the cross is a composite figure, constructed by committee, placed on a symbol that originally represented the Sun.

The original symbol was true. The astronomical event it encoded was real and repeatable. What was built *around* it — the historical narrative, the management structure, the financial machine of organized religion — is the insertion.
""",
                keyTakeaway: "For 700 years, no human figure appeared on the Christian cross — only the Sun symbol. A human figure was added by council decree in the 4th century, modeled on a historical philosopher named Apollonius of Tyana.",
                patternToSpot: "Find pre-4th century Christian art. You will find the Chi-Rho symbol, the ichthys fish, and the Sun cross — but no crucified human. The human was added later, by institutional decision."
            ),
            LDLesson(
                id: "crucifixion_3",
                title: "Krishna Was Crucified 3,000 Years Before Jesus",
                body: """
The Hindu god **Krishna** — worshipped across India for millennia — was crucified. In space. Against a solar cross. 3,000 years BCE.

The article *The Crucified Krishna* in *The Hindu Pantheon* (a scholarly reference work available in university libraries) states directly: "Krishna, the Christ of ancient India, who was crucified about 3,000 BC, was the prototype for the crucified Jesus."

Krishna = Christos = Christ. The linguistic connection is not subtle: **Krishna → Kristos → Christos → Christ**. The same word, transliterated across languages. The Christ-one. The Anointed One.

Every detail matches:
- Born of a virgin
- Birth announced by a star in the east
- Visited by wise men at birth
- Performed miracles (healed the sick, raised the dead)
- Betrayed by a close companion
- Crucified
- Resurrected on the third day
- Ascended into heaven

This pattern doesn't appear once in world mythology. It appears dozens of times, predating the New Testament by centuries and millennia:

**Osiris** (Egypt): born December 25th of a virgin, crucified, resurrected after three days.
**Horus** (Egypt): born December 25th, 12 disciples, performed miracles, crucified and resurrected.
**Mithras** (Persia, then Rome): born December 25th of a virgin, 12 disciples, crucified, resurrected.
**Dionysus** (Greece): born December 25th of a virgin, performed miracles, called "the light of the world."
**Attis** (Phrygia): born December 25th of a virgin, crucified, resurrected on the third day.

The story is not a historical account that happened once. It's a template — the most ancient template in human spirituality — that *describes* the Sun's cycle through the year.

The Bible is the greatest story ever told. Not because it's history. Because it's *the only story* — told over and over in every culture in every era because the Sun rises and sets, dies and is reborn, *every single day and every single year*.

The truth in it is real. The Sun IS the light of the world. It DOES die and resurrect. It DOES bring life to a dead winter earth.

The power was always real. Only the literal interpretation was the lie.
""",
                keyTakeaway: "Krishna, Osiris, Horus, Mithras, Dionysus, and Attis all share the Jesus biography — born Dec 25th of a virgin, 12 disciples, crucified and resurrected. The template describes the Sun's cycle, not one historical man.",
                patternToSpot: "Research any of the mythological figures listed. The biographical parallels to Jesus are specific and documented — not vague similarities. See for yourself in any comparative religion library."
            )
        ]
    )
]
