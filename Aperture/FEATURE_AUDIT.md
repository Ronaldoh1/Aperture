# APERTURE APP - FEATURE AUDIT & USE CASE DOCUMENT
## "As a person who has never heard of awakening, I'd like to use this app to..."

**Generated:** February 9, 2026  
**Purpose:** Feature audit for premium tier planning and capability review

---

# TABLE OF CONTENTS

1. [Core App Modules](#core-app-modules)
2. [Knowledge Courses](#knowledge-courses)  
3. [Tools & Utilities](#tools--utilities)
4. [Community Features](#community-features)
5. [Premium Tier Recommendations](#premium-tier-recommendations)
6. [Implementation Roadmap](#implementation-roadmap)

---

# CORE APP MODULES

## 1. Dragon Companion 🐉
**Module:** `/Modules/DragonCompanion`

### Use Cases
> "As a person who has never heard of awakening, I'd like to use this app to..."

- **Have a personal guide** that grows with me as I learn
- **Track my progress** in a fun, gamified way
- **Get personalized recommendations** based on my learning style
- **Feel motivated** to continue my self-improvement journey
- **Have accountability** through a companion that notices when I'm inactive

### Capabilities
| Capability | Description | Status |
|------------|-------------|--------|
| Dragon Stages | Egg → Hatchling → Young → Adult → Elder | ✅ Built |
| Element Types | Fire, Water, Earth, Air, Spirit, Shadow, Light, Cosmic | ✅ Built |
| Chakra Progress | Track 7 chakra development levels | ✅ Built |
| Mood System | Dragon responds to user activity | ✅ Built |
| XP & Leveling | 1000 XP per level, tracks total progress | ✅ Built |
| Trait Evolution | Dragon develops personality based on courses taken | ✅ Built |
| Daily Check-ins | Dragon greets and guides daily | 🔶 Partial |
| Voice Interaction | Talk to your dragon | ❌ Not Built |

### Premium Recommendation
| Feature | Free | Premium |
|---------|------|---------|
| Basic Dragon | ✅ | ✅ |
| Stage Evolution (past Young) | ❌ | ✅ |
| Custom Dragon Names | ❌ | ✅ |
| Multiple Dragons | ❌ | ✅ |
| Voice Interaction | ❌ | ✅ |

---

## 2. Psyop Scanner 🛡️
**Module:** `/Modules/PsyopScanner`

### Use Cases
> "As a person who has never heard of awakening, I'd like to use this app to..."

- **Analyze news articles** to identify manipulation techniques
- **Understand if I'm being emotionally manipulated** by content
- **Learn critical thinking skills** by seeing manipulation in real-time
- **Protect myself from misinformation** and propaganda
- **Become a more informed citizen** who can spot BS

### Capabilities
| Capability | Description | Status |
|------------|-------------|--------|
| Text Analysis | Paste any article/post for analysis | ✅ Built |
| Manipulation Score | 0-100 rating of manipulation level | ✅ Built |
| Technique Identification | Names specific psyop techniques used | ✅ Built |
| Emotional Trigger Detection | Identifies fear/anger/guilt triggers | ✅ Built |
| Source Credibility | Rates source trustworthiness | 🔶 Partial |
| Historical Comparison | Compares to known psyop patterns | ✅ Built |
| Breathing Exercise | Calm down after disturbing content | ✅ Built |
| Grounding Exercise | Reset emotional state | ✅ Built |
| URL Scanning | Paste URL to analyze full article | ❌ Not Built |
| Real-time Feed Scanner | Scan social media feeds | ❌ Not Built |

### Premium Recommendation
| Feature | Free | Premium |
|---------|------|---------|
| 3 Scans/Day | ✅ | ✅ |
| Unlimited Scans | ❌ | ✅ |
| Technique Deep-Dives | ❌ | ✅ |
| Historical Database Access | ❌ | ✅ |
| URL Auto-Scanning | ❌ | ✅ |
| Export Reports | ❌ | ✅ |

---

## 3. Consciousness Assessment 🎯
**Module:** `/Modules/Awakening/SubModules/Assessment`

### Use Cases
> "As a person who has never heard of awakening, I'd like to use this app to..."

- **Understand where I am** in my personal development journey
- **Get personalized course recommendations** based on my current state
- **Know which content is right for me** without being overwhelmed
- **Track my growth** over time with periodic reassessments
- **Find my tribe** - connect with others at similar stages

### Capabilities
| Capability | Description | Status |
|------------|-------------|--------|
| 10 Archetype System | Identifies consciousness state | ✅ Built |
| 10-Question Assessment | Quick 2-minute quiz | ✅ Built |
| Personalized Path | Custom course recommendations | ✅ Built |
| Dragon Messages | Archetype-specific guidance | ✅ Built |
| Secondary Archetype | Nuanced dual-type results | ✅ Built |
| Reassessment Tracking | See how you've evolved | ❌ Not Built |
| Community Matching | Find others like you | ❌ Not Built |

### Premium Recommendation
| Feature | Free | Premium |
|---------|------|---------|
| Initial Assessment | ✅ | ✅ |
| Course Recommendations | ✅ | ✅ |
| Monthly Reassessments | ❌ | ✅ |
| Detailed Archetype Report | ❌ | ✅ |
| Community Matching | ❌ | ✅ |

---

## 4. Alexandria Library 📚
**Module:** `/Modules/Alexandria`

### Use Cases
> "As a person who has never heard of awakening, I'd like to use this app to..."

- **Access forbidden/hidden texts** that aren't in mainstream education
- **Read ancient wisdom** from Gnostic, Hermetic, and other traditions
- **Study primary sources** instead of filtered interpretations
- **Build a personal library** of transformative knowledge
- **Understand suppressed history** and alternative perspectives

### Capabilities
| Capability | Description | Status |
|------------|-------------|--------|
| Gnostic Library | Nag Hammadi texts, Pistis Sophia | ✅ Built |
| Forbidden Gospels | Gospel of Thomas, Mary, Philip, etc. | ✅ Built |
| Consciousness Codex | Scientific papers on consciousness | ✅ Built |
| History Debugged | Corrected historical narratives | ✅ Built |
| Mind Defense | Counter-propaganda techniques | ✅ Built |
| Real Physics | Suppressed scientific knowledge | ✅ Built |
| Nutrition Awakening | Food industry truth | ✅ Built |
| Division Deprogramming | Breaking tribal programming | ✅ Built |
| Offline Access | Download for offline reading | ❌ Not Built |
| Audio Versions | Listen to texts | ❌ Not Built |
| Note-Taking | Annotate and highlight | ❌ Not Built |

### Premium Recommendation
| Feature | Free | Premium |
|---------|------|---------|
| 5 Free Texts | ✅ | ✅ |
| Full Library Access | ❌ | ✅ |
| Offline Downloads | ❌ | ✅ |
| Audio Versions | ❌ | ✅ |
| Note-Taking & Highlights | ❌ | ✅ |

---

## 5. GodMode ⚡
**Module:** `/Modules/GodMode`

### Use Cases
> "As a person who has never heard of awakening, I'd like to use this app to..."

- **Access my full potential** through specific practices
- **Learn esoteric techniques** from various traditions
- **Develop mental/spiritual abilities** I didn't know I had
- **Follow a structured path** to personal power
- **Integrate shadow work** and advanced practices

### Capabilities
| Capability | Description | Status |
|------------|-------------|--------|
| 7 Gates System | Progressive esoteric training | ✅ Built |
| Daily Practices | Guided exercises | 🔶 Partial |
| Progress Tracking | Gate completion tracking | ✅ Built |
| Integration Guidance | How to apply in daily life | 🔶 Partial |
| Community Challenges | Group practice sessions | ❌ Not Built |

### Premium Recommendation
| Feature | Free | Premium |
|---------|------|---------|
| Gate 1-2 | ✅ | ✅ |
| Gates 3-7 | ❌ | ✅ |
| Advanced Practices | ❌ | ✅ |
| 1-on-1 Guidance | ❌ | ✅ Premium+ |

---

## 6. Government Tracker 🏛️
**Module:** `/Modules/Government`

### Use Cases
> "As a person who has never heard of awakening, I'd like to use this app to..."

- **Know who represents me** at all levels of government
- **Track politician voting records** vs their promises
- **Stay informed on campaigns** and upcoming elections
- **Hold officials accountable** with easy access to their actions
- **Understand the political system** without partisan spin

### Capabilities
| Capability | Description | Status |
|------------|-------------|--------|
| Government Officials Directory | Federal, State, Local | ✅ Built |
| Campaign 2026 Tracker | Current election tracking | ✅ Built |
| Voting Record Lookup | How they actually voted | 🔶 Partial |
| Lobbyist Tracking | Who's funding them | ❌ Not Built |
| Bill Tracking | Follow legislation | ❌ Not Built |
| Push Notifications | Alerts for your representatives | ❌ Not Built |

### Premium Recommendation
| Feature | Free | Premium |
|---------|------|---------|
| Basic Directory | ✅ | ✅ |
| Campaign Tracker | ✅ | ✅ |
| Voting Records | ❌ | ✅ |
| Lobbyist Data | ❌ | ✅ |
| Bill Tracking | ❌ | ✅ |
| Custom Alerts | ❌ | ✅ |

---

## 7. Digital Security 🔒
**Module:** `/Modules/Awakening/SubModules/DigitalSecurity`

### Use Cases
> "As a person who has never heard of awakening, I'd like to use this app to..."

- **Protect my privacy** online and on my devices
- **Learn about digital threats** in plain language
- **Secure my data** from corporations and hackers
- **Understand surveillance** and how to minimize it
- **Take control** of my digital footprint

### Capabilities
| Capability | Description | Status |
|------------|-------------|--------|
| Password Manager Guide | Best practices | ✅ Built |
| VPN Recommendations | Privacy-focused options | ✅ Built |
| Browser Security | Hardening guides | ✅ Built |
| Phone Security | iOS/Android lockdown | ✅ Built |
| Social Media Privacy | Platform-specific guides | ✅ Built |
| Threat Assessment | Personal risk evaluation | ❌ Not Built |
| Security Checklist | Interactive to-do | ❌ Not Built |

### Premium Recommendation
| Feature | Free | Premium |
|---------|------|---------|
| Basic Guides | ✅ | ✅ |
| Advanced Techniques | ❌ | ✅ |
| Personal Threat Assessment | ❌ | ✅ |
| Interactive Checklist | ❌ | ✅ |

---

## 8. AwakeTogether Community 👥
**Module:** `/Modules/AwakeTogether`

### Use Cases
> "As a person who has never heard of awakening, I'd like to use this app to..."

- **Connect with like-minded people** on similar journeys
- **Share my experiences** without judgment
- **Find local groups** or virtual meetups
- **Get support** when the journey gets difficult
- **Help others** who are earlier in their path

### Capabilities
| Capability | Description | Status |
|------------|-------------|--------|
| Awakening Tracker | Community progress | 🔶 Partial |
| Consciousness Hub | Central community space | 🔶 Partial |
| Equity Weave | Resource sharing network | 🔶 Partial |
| Consciousness Course | Group learning | ✅ Built |
| Local Groups | Geographic communities | ❌ Not Built |
| Mentorship Matching | Connect seekers/guides | ❌ Not Built |
| Discussion Forums | Topic-based threads | ❌ Not Built |

### Premium Recommendation
| Feature | Free | Premium |
|---------|------|---------|
| View Community | ✅ | ✅ |
| Basic Participation | ✅ | ✅ |
| Create Groups | ❌ | ✅ |
| Mentorship Access | ❌ | ✅ |
| Priority Matching | ❌ | ✅ |

---

## 9. Cosmos / Timeline 🌌
**Module:** `/Modules/Cosmos`, `/Modules/Timeline`

### Use Cases
> "As a person who has never heard of awakening, I'd like to use this app to..."

- **Visualize my journey** through time
- **See connections** between events in my life
- **Track synchronicities** and meaningful patterns
- **Understand cosmic cycles** affecting my life
- **Plan around astrological events** (Mercury retrograde, etc.)

### Capabilities
| Capability | Description | Status |
|------------|-------------|--------|
| Personal Timeline | Life event tracking | 🔶 Partial |
| Cosmic Calendar | Planetary events | 🔶 Partial |
| Pattern Recognition | See connections | ❌ Not Built |
| Synchronicity Log | Record meaningful coincidences | ❌ Not Built |
| Predictive Insights | AI-powered pattern forecasting | ❌ Not Built |

### Premium Recommendation
| Feature | Free | Premium |
|---------|------|---------|
| Basic Timeline | ✅ | ✅ |
| Cosmic Calendar | ❌ | ✅ |
| AI Insights | ❌ | ✅ |

---

# KNOWLEDGE COURSES

## Course Categories & Premium Recommendations

### 🧠 CONSCIOUSNESS COURSES

| Course | Description | Free Lessons | Premium |
|--------|-------------|--------------|---------|
| **Consciousness 101** | Foundations of awareness | First 3 | Full course |
| **PhD Consciousness** | Advanced consciousness science | First 2 | Full course |
| **The Drone Self** | Quantum fields & embodiment | First 2 | Full course |
| **AI & Consciousness** | What AI reveals about mind | First 3 | Full course |
| **The 11th Dimension** | M-theory & multi-dimensional self | First 2 | Full course |
| **The Ujat Code** | Egyptian perception training | First 3 | Full course |

**Use Case:** "I want to understand what consciousness really is beyond what school taught me."

---

### ✝️ SPIRITUAL/RELIGIOUS COURSES

| Course | Description | Free Lessons | Premium |
|--------|-------------|--------------|---------|
| **Pistis Sophia** | Complete Gnostic cosmology | First 2 | Full course |
| **The Serpent Decoded** | Hidden meaning of the serpent | First 2 | Full course |
| **The Living Name** | What was buried about Jesus' name | First 2 | Full course |
| **Council of Nicaea** | How Christianity was manufactured | First 3 | Full course |
| **The Demiurge** | Gnostic false god concept | First 2 | Full course |
| **Bible Decoded** | Hidden meanings in scripture | First 3 | Full course |
| **Catholic Exposé** | Institution vs teachings | First 2 | Full course |
| **Colonial Christianity** | How religion was weaponized | First 2 | Full course |
| **Buddha's Path** | Original awakening technology | First 3 | Full course |
| **Thoth's Teachings** | Ancient Egyptian wisdom | First 2 | Full course |
| **Emerald Tablets** | Hermetic wisdom decoded | All | ❌ FULLY PREMIUM |

**Use Case:** "I want to understand spirituality beyond organized religion's filtered version."

---

### 🔍 TRUTH & SYSTEMS COURSES

| Course | Description | Free Lessons | Premium |
|--------|-------------|--------------|---------|
| **How to Spot a Psyop** | Mass manipulation decoded | First 3 | Full course |
| **Pattern Recognition** | The meta-skill for truth | First 3 | Full course |
| **The Master Lies** | Everything you were told wrong | First 2 | Full course |
| **Systems of Control** | How power operates | First 2 | Full course |
| **The Great Scams** | American Dream, College, Debt | First 3 | Full course |
| **Left/Right Programming** | Beyond the political matrix | First 3 | Full course |
| **Media Decoded** | How news manipulates | First 3 | Full course |
| **Word Spells** | Language as programming | First 2 | Full course |

**Use Case:** "I want to understand how I've been manipulated and see through the BS."

---

### 🧬 SCIENCE & PHYSICS COURSES

| Course | Description | Free Lessons | Premium |
|--------|-------------|--------------|---------|
| **Quantum Reality** | Physics that changed everything | First 3 | Full course |
| **Arrow of Time** | Why entropy only goes one way | First 2 | Full course |
| **Sacred Geometry** | The language of creation | First 3 | Full course |
| **Reality Paradoxes** | When logic meets its limits | First 3 | Full course |
| **Recursion** | Patterns containing themselves | First 2 | Full course |
| **Real Physics** | Suppressed scientific knowledge | First 2 | Full course |

**Use Case:** "I want to understand reality through a scientific lens that goes beyond textbooks."

---

### 💰 FINANCIAL COURSES

| Course | Description | Free Lessons | Premium |
|--------|-------------|--------------|---------|
| **Money Fundamentals** | What school should've taught | First 5 | Full course |
| **Financial Literacy** | Complete money education | First 3 | Full course |
| **Wealth Consciousness** | Mindset of abundance | First 3 | Full course |
| **Corporations Decoded** | How they really operate | First 2 | Full course |

**Use Case:** "I want to understand money and build wealth without the typical financial BS."

---

### 📺 ANIME WISDOM COURSES

| Course | Description | Free Lessons | Premium |
|--------|-------------|--------------|---------|
| **Dragon Ball Awakening** | DB/DBZ/DBS consciousness | All | Full course |
| **Saint Seiya** | 12 Houses & warrior path | First 3 | Full course |
| **Awakening Through Code** | Swift as spiritual practice | First 3 | Full course |

**Use Case:** "I want to see the deep wisdom hidden in anime I grew up with."

---

### 🌍 HISTORY & SOCIETY COURSES

| Course | Description | Free Lessons | Premium |
|--------|-------------|--------------|---------|
| **True History** | What actually happened | First 3 | Full course |
| **The Race Lie** | Scientific fraud of race | First 3 | Full course |
| **Civil Rights Truth** | Beyond the sanitized version | First 2 | Full course |
| **LGBTQ+ Truth** | Beyond political narratives | First 2 | Full course |
| **Education Exposed** | The schooling system decoded | First 3 | Full course |
| **Food Truth** | What you're really eating | First 3 | Full course |
| **Immigration Law** | Your actual rights | First 3 | Full course |
| **Constitution 101** | Know your rights | First 5 | Full course |

**Use Case:** "I want to understand history and society without the propaganda filter."

---

### 🌟 ASTROLOGY & CYCLES COURSES

| Course | Description | Free Lessons | Premium |
|--------|-------------|--------------|---------|
| **Birth Chart Calculator** | Your cosmic blueprint | Basic chart | Full interpretation |
| **Planetary Cycles** | Why timing matters | First 3 | Full course |
| **Solar Sovereignty** | Align with the sun | First 2 | Full course |

**Use Case:** "I want to understand cosmic timing and how it affects my life."

---

# TOOLS & UTILITIES

## Awakening Arsenal 🛠️
**Module:** `/Modules/Awakening/SubModules/AwakeningArsenal`

| Tool | Use Case | Free | Premium |
|------|----------|------|---------|
| **Meditation Timer** | "I want to meditate with guidance" | Basic | Advanced modes |
| **Breathing Exercises** | "I want to regulate my nervous system" | 3 techniques | All techniques |
| **Journal Prompts** | "I want to explore my thoughts" | Basic | AI-enhanced |
| **Grounding Exercises** | "I want to feel centered" | ✅ | ✅ |
| **Shadow Work Prompts** | "I want to face my darkness" | First 5 | All prompts |

---

## Know Your Rights ⚖️
**Module:** `/Modules/Awakening/SubModules/KnowYourRights`

| Tool | Use Case | Free | Premium |
|------|----------|------|---------|
| **Rights Cards** | "I need quick reference for my rights" | Basic | Full deck |
| **Police Encounter Guide** | "I want to know what to do if stopped" | ✅ | ✅ |
| **Legal Phrase Database** | "I want to know what to say" | Basic | Full |

---

## Mandela Effects 🌀
**Module:** `/Modules/Awakening/SubModules/MandelaEffects`

| Tool | Use Case | Free | Premium |
|------|----------|------|---------|
| **Effect Database** | "I want to see documented reality shifts" | First 10 | All |
| **Personal Tracker** | "I want to log my own experiences" | ❌ | ✅ |
| **Discussion Forum** | "I want to discuss with others" | ❌ | ✅ |

---

## Sacred Etymology 📖
**Module:** `/Modules/Awakening/SubModules/SacredEtymology`

| Tool | Use Case | Free | Premium |
|------|----------|------|---------|
| **Word Origins** | "I want to see the true meaning of words" | 20 words | Full dictionary |
| **Spell Breaking** | "I want to understand word magic" | ❌ | ✅ |

---

# PREMIUM TIER RECOMMENDATIONS

## Tier Structure

### 🆓 FREE TIER
**What's Included:**
- Dragon Companion (basic stage)
- Consciousness Assessment
- 3 Psyop Scans/day
- First 2-5 lessons of each course
- Basic Awakening Arsenal tools
- Know Your Rights essentials
- Government directory

**Limitations:**
- Dragon can't evolve past "Young Dragon"
- Limited library access
- No offline downloads
- Basic features only

---

### ⭐ PREMIUM TIER ($9.99/month or $79.99/year)
**Everything in Free, plus:**
- Full Dragon evolution (all stages)
- Custom dragon naming
- Unlimited Psyop Scanner
- Full access to ALL courses
- Complete Alexandria Library
- Advanced Awakening Arsenal
- Offline downloads
- GodMode Gates 3-7
- Full Sacred Etymology dictionary
- All Mandela Effects + tracker
- Voting records & lobbyist data
- Community group creation

---

### 👑 PREMIUM+ TIER ($19.99/month or $149.99/year)
**Everything in Premium, plus:**
- Multiple dragons
- Voice interaction with dragon
- 1-on-1 mentorship matching
- Priority community support
- Early access to new courses
- Exclusive monthly live sessions
- Personal threat assessment
- AI-powered insights
- Custom course paths

---

# IMPLEMENTATION ROADMAP

## Running List of Improvements

### 🔥 HIGH PRIORITY (This Sprint)
1. ✅ ~Consciousness Assessment System~ - DONE
2. ✅ ~New Courses (11th Dimension, Ujat Code, Sophia)~ - DONE
3. ⏳ SwiftLint Integration
4. ⏳ Feature Flag System
5. ⏳ Startup Optimization

### 📋 MEDIUM PRIORITY (Next Sprint)
6. Premium paywall implementation
7. Course progress persistence
8. Dragon evolution logic completion
9. Psyop Scanner improvements
10. Offline download system

### 📝 BACKLOG
11. Voice interaction for Dragon
12. Community features buildout
13. Real-time feed scanner
14. Mentorship matching
15. AI-powered insights
16. Multiple dragon support
17. Audio versions of texts
18. Bill tracking system
19. Synchronicity logger
20. Pattern forecasting

---

# FEATURE STATUS LEGEND

| Symbol | Meaning |
|--------|---------|
| ✅ | Fully Built |
| 🔶 | Partially Built |
| ❌ | Not Built |
| ⏳ | In Progress |

---

# NOTES FOR REVIEW

## Courses That Should Be FULLY Premium (Paywall from start)
1. **Emerald Tablets** - Ancient mystery school content
2. **GodMode Gates 3-7** - Advanced esoteric practices
3. **Birth Chart Full Interpretation** - Personalized content

## Courses That Should Have Generous Free Samples
1. **Dragon Ball Awakening** - Entry point for casual users
2. **Psyop Detection** - Hook feature that shows value
3. **Money Fundamentals** - Universal appeal
4. **Consciousness 101** - Foundation course

## Features That Drive Premium Conversions
1. Dragon evolution (people get attached)
2. Course completion (sunk cost after free lessons)
3. Psyop Scanner limits (utility creates demand)
4. Community features (social proof)

---

**Document Version:** 1.0  
**Last Updated:** February 9, 2026  
**Author:** Claude for Ron @ SunFlow
