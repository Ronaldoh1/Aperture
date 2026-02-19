// PlanetaryCyclesCourse.swift
// THE TRUE CALENDAR - Why Your Resolutions Fail

import SwiftUI

struct PlanetaryCyclesCourse {
    static let shared = PlanetaryCyclesCourse()
    
    let id = "planetary_cycles"
    let title = "Planetary Cycles & True Calendar"
    let subtitle = "Why September isn't the 9th month"
    let icon = "calendar.circle.fill"
    let colorHex = "#4CAF50"
    
    var color: Color { Color(hex: colorHex) }
    
    let modules: [CalendarModule] = [
        
        CalendarModule(
            id: "cal_1",
            number: 1,
            title: "The Calendar Deception",
            subtitle: "How time was stolen from you",
            lessons: [
                CalendarLesson(
                    id: "c1_1",
                    title: "September Means SEVEN",
                    content: """
**The Obvious Lie We Never Question**

Look at the last four months of the year:
• Sept-ember → "septem" = SEVEN in Latin
• Oct-ober → "octo" = EIGHT in Latin
• Nov-ember → "novem" = NINE in Latin
• Dec-ember → "decem" = TEN in Latin

But September is the 9th month. October is the 10th. November is the 11th. December is the 12th.

**What Happened?**

The original Roman calendar had 10 months starting in March (spring equinox):

1. Martius (March) - NEW YEAR
2. Aprilis (April)
3. Maius (May)
4. Junius (June)
5. Quintilis (July - originally "fifth")
6. Sextilis (August - originally "sixth")
7. September (SEVENTH month)
8. October (EIGHTH month)
9. November (NINTH month)
10. December (TENTH month)

January and February were later additions for the winter period.

🔥 **The Evidence Is In The Names**: You've been saying it your whole life without seeing it.
""",
                    keyFact: "September literally means 'seventh month' in Latin—proof the calendar was shifted."
                ),
                
                CalendarLesson(
                    id: "c1_2",
                    title: "The Roman Manipulation",
                    content: """
**Why The Calendar Changed**

In 45 BCE, Julius Caesar reformed the calendar. In 8 BCE, Augustus followed. They:

1. **Added January & February** to the beginning (shifting all months +2)
2. **Renamed months** after themselves:
   • Quintilis → July (Julius Caesar)
   • Sextilis → August (Augustus Caesar)
3. **Moved New Year** from March to January

**Why March Was the Original New Year**

• Spring equinox (March 20-21) marks rebirth of nature
• Agricultural societies began their year when planting began
• Astrologically, Aries (the beginning of the zodiac) starts in late March
• "March" comes from Mars, god of war AND agriculture

**The Power Play**

Moving New Year to January served Roman political purposes:
• January was when new consuls took office
• Disconnect people from natural cycles
• Centralize calendar control in the state
• Religious festivals shifted to state-controlled dates

🔥 **The Pattern**: Those who control the calendar control the perception of time itself.
""",
                    keyFact: "New Year was moved from March to January for political convenience, not cosmic truth."
                ),
                
                CalendarLesson(
                    id: "c1_3",
                    title: "Why Your Resolutions Fail",
                    content: """
**Setting Goals at the Wrong Time**

You make New Year's resolutions on January 1st—deep winter in the Northern Hemisphere. Nature is dormant. Energy is contracted.

Then you're surprised when transformation doesn't happen.

**The Natural Cycle**

• **Spring (March)**: Birth, new beginnings, expansion
• **Summer (June)**: Full expression, peak energy
• **Autumn (September)**: Harvest, completion, reflection
• **Winter (December)**: Rest, death, gestation

Starting new ventures in January is like trying to plant seeds in frozen ground.

**When To Actually Start New Things**

• **New projects**: Spring equinox (March 20-21)
• **Major changes**: After the spring equinox until summer solstice
• **Harvest/completion**: Autumn equinox (September 22-23)
• **Rest/reflection**: Winter solstice to spring equinox

**The Catholic Church Connection**

The Gregorian calendar (1582) maintained January 1 as New Year. The Church had incentive to disconnect people from pagan (natural) cycles and align festivals with Church dates.

Christmas near winter solstice. Easter near spring equinox. Not accidents—overlays.

🔥 **The Fix**: Align YOUR cycles with nature's cycles. Plant seeds (intentions) in spring. Celebrate achievement in fall. Rest in winter without guilt.
""",
                    keyFact: "January resolutions fail because you're planting seeds in winter. Start at spring equinox."
                )
            ]
        ),
        
        CalendarModule(
            id: "cal_2",
            number: 2,
            title: "Natural Cycles & Alignment",
            subtitle: "Working WITH nature, not against it",
            lessons: [
                CalendarLesson(
                    id: "c2_1",
                    title: "The Four Solar Gates",
                    content: """
**The Quarterly Checkpoints**

The year has four major solar events:

**Spring Equinox (March 20-21)**
• Day and night are equal
• Light begins to dominate dark
• Energy: Initiation, new beginnings, emergence
• Action: Plant seeds (literal and metaphorical)

**Summer Solstice (June 20-21)**
• Longest day, shortest night
• Maximum light, peak expression
• Energy: Full power, visibility, achievement
• Action: Express fully, be seen, create

**Autumn Equinox (September 22-23)**
• Day and night equal again
• Dark begins to dominate light
• Energy: Harvest, gratitude, assessment
• Action: Complete projects, celebrate, release

**Winter Solstice (December 21-22)**
• Shortest day, longest night
• Maximum dark, the "death" of the sun
• Energy: Rest, reflection, gestation
• Action: Go inward, plan, recover

**The Hidden Pattern**
Notice: the MIDPOINT between solstice and equinox corresponds to what we call the "cross-quarter days"—Imbolc, Beltane, Lammas, Samhain.

🔥 **Living in Alignment**: Schedule your year by these gates. Major launches at spring equinox. Peak efforts toward summer solstice. Completion at autumn equinox. Rest through winter solstice.
""",
                    keyFact: "The four solar gates are the true calendar anchors—equinoxes and solstices."
                ),
                
                CalendarLesson(
                    id: "c2_2",
                    title: "Lunar Cycles",
                    content: """
**The Monthly Rhythm**

The moon completes a cycle every 29.5 days—close to a calendar month (month = "moon-th").

**The Eight Lunar Phases**

1. **New Moon**: Dark moon, new beginnings, set intentions
2. **Waxing Crescent**: Emergence, courage, taking first steps
3. **First Quarter**: Challenges, decisions, commitment
4. **Waxing Gibbous**: Refinement, adjustment, patience
5. **Full Moon**: Illumination, completion, peak energy
6. **Waning Gibbous**: Gratitude, sharing, teaching
7. **Last Quarter**: Release, forgiveness, letting go
8. **Waning Crescent**: Surrender, rest, preparation

**Practical Application**

• **New Moon**: Start projects, set intentions, begin
• **Waxing phases**: Build momentum, take action, grow
• **Full Moon**: Celebrate completion, gain clarity, release what's illuminated
• **Waning phases**: Wind down, integrate, prepare for next cycle

**Why 13 Moons?**
There are ~13 lunar cycles per year, not 12 months. The 12-month calendar ignores lunar reality.

🔥 **Experiment**: Track your energy through one lunar cycle. Notice: are you more energized at full moon? More introspective at new moon? Your body knows, even if your calendar doesn't.
""",
                    keyFact: "New moons are for beginnings, full moons for completion—align your actions accordingly."
                ),
                
                CalendarLesson(
                    id: "c2_3",
                    title: "Personal Year Cycles",
                    content: """
**Your Real New Year: Your Birthday**

Your personal annual cycle begins on YOUR birthday, not January 1.

**Why This Matters**

Astrology (whether you "believe" or not) maps personal cycles based on:
• Your birth date (starting point)
• The current position of planets relative to your birth chart
• Recurring patterns in your specific chart

Your "Solar Return" (when the Sun returns to its exact birth position) is YOUR new year.

**Calculating Your Personal Year (Numerology)**

Take your birth month + birth day + current year, reduce to single digit:

Example: Born May 8
5 + 8 + 2026 = 5 + 8 + 2 + 0 + 2 + 6 = 23 → 2 + 3 = 5

Personal Year 5 = Change, freedom, adventure

**The Nine-Year Cycle**

Year 1: New beginnings
Year 2: Partnerships, patience
Year 3: Expression, creativity
Year 4: Foundation, hard work
Year 5: Change, freedom
Year 6: Responsibility, family
Year 7: Introspection, spirituality
Year 8: Power, abundance
Year 9: Completion, release

Then it restarts.

🔥 **Application**: Know where you are in YOUR cycle. Don't force Year-1 energy during a Year-9 period. Flow with your rhythm.
""",
                    keyFact: "Your birthday is your personal New Year. That's when your annual cycle truly begins."
                )
            ]
        ),
        
        CalendarModule(
            id: "cal_3",
            number: 3,
            title: "Reclaiming Your Time",
            subtitle: "Living by natural cycles",
            lessons: [
                CalendarLesson(
                    id: "c3_1",
                    title: "The Practical Integration",
                    content: """
**How To Live This**

You can't change the Gregorian calendar, but you can align your life with natural rhythms while still meeting societal obligations.

**Annual Planning by Solar Cycle**

**Q1 (Jan-Mar): WINTER → SPRING**
• January/February: Rest, plan, gestate
• March equinox: Launch new projects, set intentions for year

**Q2 (Apr-Jun): SPRING → SUMMER**
• April/May: Build momentum, take action
• June solstice: Peak effort, visibility, express fully

**Q3 (Jul-Sep): SUMMER → AUTUMN**
• July/August: Sustain, maintain, refine
• September equinox: Harvest, assess, celebrate achievements

**Q4 (Oct-Dec): AUTUMN → WINTER**
• October/November: Complete, release, tie up loose ends
• December solstice: Rest, reflect, prepare for next cycle

**Monthly Planning by Lunar Cycle**

• Week 1 (New Moon): Set intentions, start new work
• Week 2 (Waxing): Build, create, expand
• Week 3 (Full Moon): Review, celebrate, release blocks
• Week 4 (Waning): Complete, clean up, prepare for next month

**Daily Planning by Solar Position**

• Morning: Creative work, new projects (rising energy)
• Midday: Meetings, collaboration (peak energy)
• Afternoon: Routine tasks, administration (sustaining)
• Evening: Reflection, planning (descending energy)

🔥 **The Result**: When you align with natural cycles, life feels less like struggle and more like flow. You're not fighting the current—you're riding it.
""",
                    keyFact: "Align quarters with seasons, months with moon cycles, days with sun position."
                ),
                
                CalendarLesson(
                    id: "c3_2",
                    title: "Calendar Systems Compared",
                    content: """
**Different Cultures, Different Calendars**

The Gregorian calendar is not the only system—and not the oldest.

**Hebrew Calendar**
• Lunisolar (moon cycles within solar year)
• New Year: Rosh Hashanah (fall)
• Based on creation count (~5785 in 2025)

**Islamic Calendar**
• Pure lunar (12 moon cycles, ~354 days)
• Drifts through seasons
• Based on Hijra migration (1446 in 2025)

**Chinese Calendar**
• Lunisolar
• New Year: New moon between Jan 21 - Feb 20
• 12-year animal cycle within 60-year great cycle

**Ethiopian Calendar**
• Solar, based on ancient Coptic
• 13 months (12 of 30 days + 1 of 5-6)
• ~7 years behind Gregorian (2017 in 2025)

**Mayan Calendar**
• Multiple interlocking cycles
• Tzolkin (260-day sacred), Haab (365-day civil)
• Calendar Round (52 years), Long Count

**The Pattern**
Every major civilization developed calendars based on celestial observation. The Gregorian is ONE option, shaped by Roman politics and Church interests.

🔥 **The Teaching**: There is no "correct" calendar—only systems that serve different purposes. Choose which rhythms you honor.
""",
                    keyFact: "Multiple valid calendar systems exist—the Gregorian is not 'the' calendar, just 'a' calendar."
                )
            ]
        )
    ]
}

// Supporting Types
struct CalendarModule: Identifiable {
    let id: String
    let number: Int
    let title: String
    let subtitle: String
    let lessons: [CalendarLesson]
}

struct CalendarLesson: Identifiable {
    let id: String
    let title: String
    let content: String
    let keyFact: String
}

struct CalendarProgress: Codable {
    var completedLessons: [String]
    var lastAccessed: Date?
    static var `default`: CalendarProgress { CalendarProgress(completedLessons: [], lastAccessed: nil) }
}
