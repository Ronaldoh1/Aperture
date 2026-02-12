// DigitalSecurityEntity.swift
// Digital Security & Privacy Course
// How they harvest your data and use it to control you

import SwiftUI

// MARK: - Digital Security Course

struct DigitalSecurityCourse {

    static let title = "Digital Security & Privacy"
    static let subtitle = "How They Track, Harvest, and Control You Through Technology"
    static let icon = "lock.shield.fill"
    static let color = Color(hex: "#00BFA5")

    static let overview = """
    Every click, every scroll, every like, every search - they're watching. Not because they care about you, but because YOUR DATA IS THE PRODUCT.

    Social media isn't free. YOU pay with your behavior, your psychology, your attention, and your freedom. Tech companies have built the most sophisticated surveillance and manipulation system in human history.

    This course will teach you:
    • How your data is harvested (it's worse than you think)
    • How they profile and predict your behavior
    • How this data is used to manipulate you
    • How to protect yourself and reclaim your digital sovereignty

    Knowledge is armor. After this course, you'll never look at your phone the same way again.
    """

    static let quote = "\"If you're not paying for the product, you ARE the product.\""
    static let quoteAuthor = "The Social Dilemma"

    static let modules: [DigitalSecurityModule] = [
        surveillanceCapitalismModule,
        dataHarvestingModule,
        behavioralManipulationModule,
        mobileSecurityModule,
        webSecurityModule,
        socialMediaArmorModule,
        privacyToolsModule,
        digitalSovereigntyModule
    ]

}

// MARK: - Module Definition

struct DigitalSecurityModule: Identifiable {

    let id = UUID()
    let number: Int
    let title: String
    let subtitle: String
    let icon: String
    let duration: String
    let lessons: [DigitalSecurityLesson]
    let keyTakeaways: [String]

}

struct DigitalSecurityLesson: Identifiable {

    let id = UUID()
    let title: String
    let content: String
    let facts: [SecurityFact]
    let actionItems: [String]

}

struct SecurityFact: Identifiable {

    let id = UUID()
    let icon: String
    let title: String
    let description: String
    let source: String?

}

// MARK: - Module 1: Surveillance Capitalism

extension DigitalSecurityCourse {

    static let surveillanceCapitalismModule = DigitalSecurityModule(
        number: 1,
        title: "Surveillance Capitalism",
        subtitle: "The business model that trades your freedom",
        icon: "eye.trianglebadge.exclamationmark.fill",
        duration: "25 min",
        lessons: [
            DigitalSecurityLesson(
                title: "You Are The Product",
                content: """
                In 2004, something changed. Google discovered that the "data exhaust" from your searches - the patterns, timing, location, click behavior - could be used to predict what you would do next. And predictions could be SOLD.

                This was the birth of surveillance capitalism. Your behavioral data became the raw material for a new kind of market.

                Every tech company followed:
                • Facebook maps your social graph, emotions, and vulnerabilities
                • Amazon tracks your purchasing psychology
                • Google knows your searches, location, emails, calendar
                • Apple (despite marketing) collects behavioral telemetry
                • TikTok builds psychological profiles with alarming speed

                The product isn't ads. The product is CERTAINTY about your future behavior. Advertisers don't pay for eyeballs - they pay for guaranteed influence over your decisions.
                """,
                facts: [
                    SecurityFact(
                        icon: "dollarsign.circle.fill",
                        title: "$200+ Billion Industry",
                        description: "The behavioral data market generates over $200 billion annually. Your data is more valuable than oil.",
                        source: "Shoshana Zuboff, 'The Age of Surveillance Capitalism'"
                    ),
                    SecurityFact(
                        icon: "brain.head.profile",
                        title: "Prediction Products",
                        description: "Tech companies don't just know what you did - they predict what you'll do. And sell that prediction.",
                        source: nil
                    ),
                    SecurityFact(
                        icon: "person.3.fill",
                        title: "Shadow Profiles",
                        description: "Facebook builds profiles on people who don't even have accounts, using data from friends and websites.",
                        source: "Facebook Congressional Testimony, 2018"
                    )
                ],
                actionItems: [
                    "Watch 'The Social Dilemma' documentary",
                    "Read about Shoshana Zuboff's research",
                    "Audit which apps have access to your data"
                ]
            ),
            DigitalSecurityLesson(
                title: "The Extraction Machine",
                content: """
                Data extraction happens at every layer:

                **Device Level:**
                • Your phone's accelerometer knows when you're walking, driving, sleeping
                • Microphone access can detect ambient sounds, TV shows, conversations
                • Camera apps map your face, environment, and objects
                • Battery usage patterns reveal your daily schedule

                **App Level:**
                • Every tap, scroll speed, and hover duration is logged
                • Keyboard apps can record everything you type
                • Photo libraries are scanned for faces, locations, objects
                • Contact lists are harvested and cross-referenced

                **Network Level:**
                • Every website visit is tracked across the entire internet
                • WiFi networks you connect to reveal your locations
                • Bluetooth beacons track you in stores
                • Cell towers triangulate your position 24/7

                They don't just know WHERE you are. They know where you WILL be.
                """,
                facts: [
                    SecurityFact(
                        icon: "location.fill",
                        title: "Location Points",
                        description: "Google collects your location approximately 14,000 times per day on Android.",
                        source: "Associated Press Investigation, 2018"
                    ),
                    SecurityFact(
                        icon: "keyboard.fill",
                        title: "Keystroke Logging",
                        description: "Some keyboard apps send every keystroke to remote servers, including passwords.",
                        source: nil
                    ),
                    SecurityFact(
                        icon: "antenna.radiowaves.left.and.right",
                        title: "Ultrasonic Tracking",
                        description: "Some apps use inaudible sounds from your TV to link your devices and track viewing habits.",
                        source: "FTC Research, 2017"
                    )
                ],
                actionItems: [
                    "Review all app permissions on your phone",
                    "Disable microphone access for non-essential apps",
                    "Turn off location services when not needed"
                ]
            )
        ],
        keyTakeaways: [
            "Your data is the product, not the service",
            "Surveillance capitalism profits from predicting your behavior",
            "Data extraction happens at device, app, and network levels",
            "Even 'free' services have a massive hidden cost"
        ]
    )

}

// MARK: - Module 2: Data Harvesting Deep Dive

extension DigitalSecurityCourse {

    static let dataHarvestingModule = DigitalSecurityModule(
        number: 2,
        title: "Data Harvesting",
        subtitle: "What they collect and how",
        icon: "tray.full.fill",
        duration: "30 min",
        lessons: [
            DigitalSecurityLesson(
                title: "Your Digital Fingerprint",
                content: """
                Even without cookies, you can be uniquely identified. Your "browser fingerprint" is a combination of:

                • Screen resolution
                • Installed fonts
                • Browser plugins
                • Time zone
                • Language settings
                • Canvas rendering (how your GPU draws)
                • Audio context fingerprint
                • WebGL renderer
                • Hardware concurrency

                Combined, these create a fingerprint that's **99.1% unique**. You can be tracked across browsers, across devices, even in incognito mode.

                Test it yourself: Visit AmIUnique.org or Panopticlick.eff.org

                This is why "clearing cookies" does almost nothing. The tracking has evolved far beyond cookies.
                """,
                facts: [
                    SecurityFact(
                        icon: "hand.point.up.fill",
                        title: "99.1% Unique",
                        description: "Your browser fingerprint is nearly as unique as your actual fingerprint.",
                        source: "Electronic Frontier Foundation"
                    ),
                    SecurityFact(
                        icon: "paintbrush.fill",
                        title: "Canvas Fingerprinting",
                        description: "Websites can identify you by how your specific hardware renders graphics.",
                        source: nil
                    ),
                    SecurityFact(
                        icon: "speaker.wave.3.fill",
                        title: "Audio Fingerprinting",
                        description: "Your audio hardware processes sound uniquely, creating another tracking vector.",
                        source: nil
                    )
                ],
                actionItems: [
                    "Test your browser fingerprint at AmIUnique.org",
                    "Consider using a privacy-focused browser like Brave or Firefox",
                    "Install anti-fingerprinting extensions"
                ]
            ),
            DigitalSecurityLesson(
                title: "The Data Broker Underworld",
                content: """
                Your data doesn't stay with the company that collected it. There's an entire shadow industry of **data brokers** who buy, sell, and trade your information.

                **Major Data Brokers:**
                • Acxiom - Has profiles on 2.5 billion people
                • Experian - Not just credit, full behavioral profiles
                • Oracle Data Cloud - Tracks $3 trillion in consumer transactions
                • LexisNexis - 10,000+ data points per person
                • Palantir - Works with government agencies

                **What They Sell:**
                • Your income and financial health
                • Your health conditions (inferred from purchases)
                • Your political leanings
                • Your emotional vulnerabilities
                • Your addiction tendencies
                • Life events (divorce, pregnancy, job loss)

                This data is sold to:
                • Advertisers
                • Insurance companies
                • Employers
                • Landlords
                • Political campaigns
                • Law enforcement (without warrants)
                """,
                facts: [
                    SecurityFact(
                        icon: "building.2.fill",
                        title: "4,000+ Data Brokers",
                        description: "There are over 4,000 data broker companies in the US alone.",
                        source: "Privacy Rights Clearinghouse"
                    ),
                    SecurityFact(
                        icon: "dollarsign.circle.fill",
                        title: "$200+ Per Profile",
                        description: "A detailed consumer profile can sell for $200+ in specialized markets.",
                        source: "Financial Times Investigation"
                    ),
                    SecurityFact(
                        icon: "cross.case.fill",
                        title: "Health Data Sales",
                        description: "Your pharmacy purchases, health searches, and fitness data are sold to insurers.",
                        source: nil
                    )
                ],
                actionItems: [
                    "Request your data from major brokers (they're legally required to provide it)",
                    "Opt out of data broker databases (tedious but possible)",
                    "Use services like DeleteMe to automate opt-outs"
                ]
            ),
            DigitalSecurityLesson(
                title: "Social Media: The Deepest Harvest",
                content: """
                Social media isn't a communication tool. It's a psychological extraction operation.

                **What Facebook Knows:**
                • Your face (facial recognition trained on your photos)
                • Your social graph (who you know, how close you are)
                • Your emotional state (detected from posts, comments, reactions)
                • Your political views (inferred from engagement patterns)
                • Your location history (even when the app is "closed")
                • Your messages (yes, even "private" ones for ad targeting)
                • Your offline purchases (Facebook Pixel + partner data)

                **What TikTok Knows:**
                • Your face and voice patterns
                • What makes you stop scrolling (millisecond precision)
                • Your emotional triggers
                • Your attention span
                • Your desires, fears, and insecurities
                • How to keep you watching (the algorithm adapts to YOU)

                The algorithm doesn't show you what you want to see. It shows you what will keep you engaged - even if that means making you angry, anxious, or addicted.
                """,
                facts: [
                    SecurityFact(
                        icon: "clock.fill",
                        title: "Dwell Time Tracking",
                        description: "TikTok measures how long you look at each video in milliseconds to profile your interests.",
                        source: "WSJ TikTok Investigation, 2021"
                    ),
                    SecurityFact(
                        icon: "face.smiling.fill",
                        title: "Emotion Detection",
                        description: "Facebook experimented with manipulating News Feed to affect users' emotions - without consent.",
                        source: "PNAS Study, 2014"
                    ),
                    SecurityFact(
                        icon: "bag.fill",
                        title: "Offline Tracking",
                        description: "Facebook tracks your offline purchases through partnerships with Visa, Mastercard, and retailers.",
                        source: nil
                    )
                ],
                actionItems: [
                    "Download your data from Facebook, Google, TikTok - see what they have",
                    "Review and revoke app permissions",
                    "Consider deleting or limiting social media"
                ]
            )
        ],
        keyTakeaways: [
            "You can be tracked without cookies via browser fingerprinting",
            "Data brokers trade your profile in a shadow economy",
            "Social media extracts psychological data, not just behavior",
            "Your 'private' messages are used for ad targeting"
        ]
    )

}

// MARK: - Module 3: Behavioral Manipulation

extension DigitalSecurityCourse {

    static let behavioralManipulationModule = DigitalSecurityModule(
        number: 3,
        title: "Behavioral Manipulation",
        subtitle: "How they use your data against you",
        icon: "brain.head.profile",
        duration: "35 min",
        lessons: [
            DigitalSecurityLesson(
                title: "Persuasion Architecture",
                content: """
                Every app on your phone is designed by teams of psychologists, behavioral economists, and AI researchers to **maximize engagement** - not your wellbeing.

                **Techniques Used:**

                **Variable Reward Schedules:**
                Like a slot machine, you never know if the next refresh will give you a dopamine hit. This uncertainty is more addictive than consistent rewards.

                **Social Validation Loops:**
                Likes, comments, and followers exploit your need for social approval. They've gamified human connection.

                **Fear of Missing Out (FOMO):**
                Stories that disappear, live streams, limited time offers - all designed to create anxiety that keeps you checking.

                **Infinite Scroll:**
                No natural stopping point. The feed never ends. Your brain's "completion instinct" is never satisfied.

                **Personalized Manipulation:**
                The algorithm learns YOUR specific psychological vulnerabilities and exploits them.

                This isn't accidental. It's intentional design.
                """,
                facts: [
                    SecurityFact(
                        icon: "gamecontroller.fill",
                        title: "Casino Design",
                        description: "Tech companies hired the same psychologists who designed casino slot machines.",
                        source: "Tristan Harris, former Google Design Ethicist"
                    ),
                    SecurityFact(
                        icon: "bell.badge.fill",
                        title: "Notification Engineering",
                        description: "The timing, sound, and content of notifications are optimized to interrupt you at maximum vulnerability.",
                        source: nil
                    ),
                    SecurityFact(
                        icon: "arrow.down.circle.fill",
                        title: "Pull to Refresh",
                        description: "The 'pull down to refresh' gesture was designed to mimic a slot machine lever pull.",
                        source: "Aza Raskin, inventor of infinite scroll (who now regrets it)"
                    )
                ],
                actionItems: [
                    "Turn off all non-essential notifications",
                    "Set specific times for checking social media",
                    "Use app timers to limit daily usage"
                ]
            ),
            DigitalSecurityLesson(
                title: "Algorithmic Radicalization",
                content: """
                Algorithms don't care about truth. They care about **engagement**. And nothing engages like outrage, fear, and tribal conflict.

                **The Radicalization Pipeline:**

                1. You watch a mild political video
                2. Algorithm notices you engaged
                3. Serves slightly more extreme content
                4. Measures engagement again
                5. Pushes you further toward extremes
                6. You end up in an echo chamber

                This happens across ALL platforms:
                • YouTube recommends conspiracy videos to keep you watching
                • Facebook groups become ideological bubbles
                • Twitter rewards hot takes over nuanced thinking
                • TikTok creates personalized reality tunnels

                **The goal isn't to inform you. It's to inflame you.**

                Studies show that false information spreads 6x faster than truth on social media. Because lies are often more emotionally engaging than facts.
                """,
                facts: [
                    SecurityFact(
                        icon: "flame.fill",
                        title: "Anger = Engagement",
                        description: "Facebook's own research showed their algorithm promoted divisive content because it drove more engagement.",
                        source: "Facebook Papers, 2021"
                    ),
                    SecurityFact(
                        icon: "arrow.triangle.branch",
                        title: "6x Faster Spread",
                        description: "False news stories spread 6x faster and reach more people than true stories.",
                        source: "MIT Study, Science Journal, 2018"
                    ),
                    SecurityFact(
                        icon: "person.2.fill",
                        title: "Echo Chambers",
                        description: "Algorithmic curation creates filter bubbles where you only see content that confirms your existing beliefs.",
                        source: nil
                    )
                ],
                actionItems: [
                    "Actively seek out perspectives you disagree with",
                    "Be skeptical of content that makes you angry",
                    "Diversify your information sources"
                ]
            ),
            DigitalSecurityLesson(
                title: "Targeted Advertising: Mind Reading",
                content: """
                Modern advertising isn't about informing you of products. It's about exploiting psychological vulnerabilities at precisely the right moment.

                **Emotional Targeting:**
                Facebook knows when you're feeling:
                • Insecure (show you beauty/fitness products)
                • Lonely (show you dating apps)
                • Anxious (show you comfort products)
                • Low self-esteem (show you self-improvement courses)

                They can target you in these vulnerable moments because they track your behavior patterns.

                **Predictive Targeting:**
                • Target knew a teenager was pregnant before her father did (based on purchase patterns)
                • Casinos target people showing "problem gambler" behavior
                • Predatory lenders target people with financial stress indicators

                **Dark Patterns:**
                Websites are designed to manipulate you:
                • "Only 2 left!" (often false)
                • Pre-checked boxes that opt you IN
                • Confusing unsubscribe flows
                • "Are you sure? Your friends will miss you!"

                This is psychological warfare, and you are the target.
                """,
                facts: [
                    SecurityFact(
                        icon: "person.crop.circle.badge.questionmark",
                        title: "Pregnancy Prediction",
                        description: "Target's algorithm predicted pregnancies with such accuracy, they had to mix in random ads so it wouldn't be obvious.",
                        source: "New York Times, 2012"
                    ),
                    SecurityFact(
                        icon: "exclamationmark.triangle.fill",
                        title: "Vulnerability Targeting",
                        description: "Facebook offered advertisers the ability to target teens when they felt 'insecure' or 'worthless'.",
                        source: "The Australian, 2017"
                    ),
                    SecurityFact(
                        icon: "creditcard.fill",
                        title: "Financial Targeting",
                        description: "Payday loan companies specifically target people showing financial distress indicators.",
                        source: nil
                    )
                ],
                actionItems: [
                    "Use ad blockers (uBlock Origin is excellent)",
                    "Opt out of personalized advertising",
                    "Be aware of your emotional state when browsing"
                ]
            )
        ],
        keyTakeaways: [
            "Apps are designed like slot machines to maximize addiction",
            "Algorithms promote outrage because it drives engagement",
            "Advertising exploits your psychological vulnerabilities",
            "You are being manipulated at moments of weakness"
        ]
    )

}

// MARK: - Module 4: Mobile Security

extension DigitalSecurityCourse {

    static let mobileSecurityModule = DigitalSecurityModule(
        number: 4,
        title: "Mobile Security",
        subtitle: "Protect your most personal device",
        icon: "iphone",
        duration: "25 min",
        lessons: [
            DigitalSecurityLesson(
                title: "Your Phone Is A Surveillance Device",
                content: """
                Your smartphone is the most sophisticated surveillance device ever created - and you carry it voluntarily.

                **What Your Phone Knows:**
                • Your exact location (GPS, cell towers, WiFi, Bluetooth)
                • Your daily routine (when you wake, sleep, work)
                • Your health (motion sensors detect gait, heart rate via camera)
                • Your finances (banking apps, purchase locations)
                • Your relationships (contacts, call logs, message patterns)
                • Your voice (always-on assistants, app permissions)
                • Your face (biometric data stored who knows where)

                **iOS vs Android:**
                Neither is fully private, but iOS gives you slightly more control:
                • App Tracking Transparency
                • Privacy labels in App Store
                • On-device Siri processing

                Android gives more customization but:
                • Google is an advertising company
                • More malware risk
                • Manufacturer bloatware

                The safest phone is the one not connected to the internet.
                """,
                facts: [
                    SecurityFact(
                        icon: "location.circle.fill",
                        title: "Always Tracking",
                        description: "Your phone continues to track location even when 'location services' is off, via WiFi and Bluetooth scanning.",
                        source: nil
                    ),
                    SecurityFact(
                        icon: "mic.fill",
                        title: "Background Recording",
                        description: "Apps with microphone permission can technically listen even when not in use.",
                        source: nil
                    ),
                    SecurityFact(
                        icon: "antenna.radiowaves.left.and.right",
                        title: "Cell Site Simulators",
                        description: "Government 'Stingray' devices can intercept your phone communications by pretending to be cell towers.",
                        source: "ACLU Documentation"
                    )
                ],
                actionItems: [
                    "Audit all app permissions RIGHT NOW",
                    "Disable microphone for non-essential apps",
                    "Turn off WiFi and Bluetooth when not in use",
                    "Use a VPN on public networks"
                ]
            ),
            DigitalSecurityLesson(
                title: "iOS Security Hardening",
                content: """
                If you use an iPhone, here's how to maximize your privacy:

                **Settings → Privacy & Security:**
                • Location Services → Only while using (or off)
                • Tracking → Turn OFF "Allow Apps to Request to Track"
                • Analytics & Improvements → Turn ALL off
                • Apple Advertising → Turn off Personalized Ads

                **Settings → Safari:**
                • Prevent Cross-Site Tracking → ON
                • Hide IP Address → From Trackers
                • Privacy Preserving Ad Measurement → OFF

                **Settings → Siri & Search:**
                • Disable "Listen for 'Hey Siri'"
                • Disable Siri Suggestions everywhere

                **Settings → Face ID & Passcode:**
                • Use alphanumeric password (not 6-digit PIN)
                • Enable "Erase Data" after 10 failed attempts
                • Disable Control Center when locked

                **Settings → Mail → Privacy Protection:**
                • Protect Mail Activity → ON
                • Hide IP Address → ON

                **App Permissions:**
                Review EVERY app's access to:
                • Camera, Microphone, Location
                • Contacts, Photos, Calendar
                • Health, Motion, Bluetooth
                """,
                facts: [
                    SecurityFact(
                        icon: "hand.raised.fill",
                        title: "ATT Impact",
                        description: "Apple's App Tracking Transparency cost Facebook $10 billion in ad revenue. That's how much YOUR tracking was worth.",
                        source: "Meta Earnings Report, 2022"
                    ),
                    SecurityFact(
                        icon: "lock.fill",
                        title: "Lockdown Mode",
                        description: "iOS 16+ has 'Lockdown Mode' for extreme security - limits features but blocks advanced attacks.",
                        source: nil
                    )
                ],
                actionItems: [
                    "Go through EVERY setting mentioned above",
                    "Review app permissions weekly",
                    "Delete apps you haven't used in 30 days",
                    "Enable automatic updates"
                ]
            )
        ],
        keyTakeaways: [
            "Your phone is a voluntary surveillance device",
            "Review and restrict app permissions aggressively",
            "iOS provides more privacy controls than Android",
            "Default settings are NOT privacy-friendly"
        ]
    )

}

// MARK: - Module 5: Web Security

extension DigitalSecurityCourse {

    static let webSecurityModule = DigitalSecurityModule(
        number: 5,
        title: "Web Security",
        subtitle: "Protect yourself online",
        icon: "globe",
        duration: "30 min",
        lessons: [
            DigitalSecurityLesson(
                title: "Browser Privacy",
                content: """
                Your browser is the window through which you're watched. Choose wisely.

                **Browser Rankings (Privacy):**

                1. **Tor Browser** - Maximum anonymity, routes through multiple servers
                   - Slowest, some sites block it
                   - Use for sensitive research

                2. **Brave** - Chrome-based but privacy-focused
                   - Built-in ad/tracker blocking
                   - Good balance of privacy and usability

                3. **Firefox** - Open source, privacy-respecting
                   - Highly customizable with extensions
                   - Owned by non-profit

                4. **Safari** - Better than Chrome
                   - Intelligent Tracking Prevention
                   - Apple's privacy focus helps

                5. **Chrome** - AVOID if possible
                   - Google's core surveillance product
                   - Every extension, every click, logged

                **Essential Extensions:**
                • uBlock Origin - Best ad/tracker blocker
                • Privacy Badger - EFF's tracker blocker
                • HTTPS Everywhere - Forces encrypted connections
                • Decentraleyes - Blocks CDN tracking
                • Cookie AutoDelete - Clears cookies automatically
                """,
                facts: [
                    SecurityFact(
                        icon: "eye.slash.fill",
                        title: "Incognito Lies",
                        description: "Incognito/Private mode only hides from YOUR device. Websites, ISPs, and employers still see everything.",
                        source: nil
                    ),
                    SecurityFact(
                        icon: "link",
                        title: "Third-Party Scripts",
                        description: "The average website loads scripts from 10+ third-party domains, each tracking you.",
                        source: nil
                    ),
                    SecurityFact(
                        icon: "chart.bar.fill",
                        title: "Chrome Dominance",
                        description: "Google Chrome has 65% market share - giving Google visibility into most of the world's browsing.",
                        source: "StatCounter, 2023"
                    )
                ],
                actionItems: [
                    "Switch to Brave or Firefox as your default browser",
                    "Install uBlock Origin and Privacy Badger",
                    "Clear cookies and cache regularly",
                    "Use different browsers for different activities"
                ]
            ),
            DigitalSecurityLesson(
                title: "VPNs: What They Actually Do",
                content: """
                VPN marketing is full of lies. Let's be clear about what they do and don't do.

                **What a VPN DOES:**
                • Hides your IP from websites
                • Encrypts traffic from your ISP
                • Bypasses geographic restrictions
                • Protects on public WiFi

                **What a VPN DOES NOT DO:**
                • Make you anonymous (you're still logged into accounts)
                • Protect from malware
                • Stop browser fingerprinting
                • Prevent tracking by websites you log into
                • Hide activity from the VPN provider itself

                **VPN Provider Concerns:**
                Many "no-log" VPNs have been caught logging. Trust is essential.

                **Trustworthy Options:**
                • Mullvad - Can pay with cash, no email required
                • ProtonVPN - Swiss jurisdiction, open source
                • IVPN - Transparent, security audited

                **Avoid:**
                • Free VPNs (you ARE the product)
                • VPNs owned by data companies
                • VPNs with aggressive marketing claims
                """,
                facts: [
                    SecurityFact(
                        icon: "exclamationmark.shield.fill",
                        title: "Free VPN Danger",
                        description: "Many free VPNs sell your browsing data - the exact thing you're trying to prevent.",
                        source: "CSIRO Study, 2017"
                    ),
                    SecurityFact(
                        icon: "doc.text.fill",
                        title: "No-Log Lies",
                        description: "PureVPN, IPVanish, and others claiming 'no logs' have provided user data to authorities.",
                        source: "Court Documents"
                    ),
                    SecurityFact(
                        icon: "location.slash.fill",
                        title: "Jurisdiction Matters",
                        description: "VPNs based in Five Eyes countries can be compelled to log. Choose Swiss, Panamanian, or Romanian.",
                        source: nil
                    )
                ],
                actionItems: [
                    "If using a VPN, choose a reputable paid provider",
                    "Don't trust 'no-log' claims without third-party audits",
                    "Remember: VPN is ONE layer, not complete protection",
                    "Use Tor for true anonymity needs"
                ]
            ),
            DigitalSecurityLesson(
                title: "Password Security",
                content: """
                Passwords are the keys to your digital life. Most people's are pathetically weak.

                **The Problem:**
                • 81% of breaches involve weak passwords
                • Average person has 100+ accounts
                • People reuse passwords across sites
                • Data breaches happen constantly

                **The Solution: Password Manager + Unique Passwords**

                **Recommended Password Managers:**
                • Bitwarden - Open source, free tier excellent
                • 1Password - Premium, excellent UX
                • KeePassXC - Offline, open source

                **AVOID:**
                • LastPass - Multiple security breaches
                • Browser-built-in managers - Less secure
                • Writing passwords down (unless in a safe)

                **Strong Password Rules:**
                • Minimum 16 characters (longer = better)
                • Unique for EVERY account
                • Random generation (not memorable phrases)
                • Two-factor authentication everywhere possible

                **Two-Factor Authentication (2FA):**
                Best to worst:
                1. Hardware key (YubiKey)
                2. Authenticator app (Authy, Google Authenticator)
                3. SMS (vulnerable to SIM swapping)
                """,
                facts: [
                    SecurityFact(
                        icon: "key.fill",
                        title: "Most Common Password",
                        description: "'123456' is still the most common password. 'password' is #4.",
                        source: "NordPass Annual Study"
                    ),
                    SecurityFact(
                        icon: "clock.badge.exclamationmark.fill",
                        title: "Crack Time",
                        description: "An 8-character password can be cracked in under 1 hour. A 16-character random password takes 34,000 years.",
                        source: nil
                    ),
                    SecurityFact(
                        icon: "phone.badge.waveform.fill",
                        title: "SIM Swapping",
                        description: "Hackers can convince carriers to transfer your number, intercepting SMS 2FA codes.",
                        source: nil
                    )
                ],
                actionItems: [
                    "Install Bitwarden or 1Password TODAY",
                    "Generate unique 20+ character passwords for all accounts",
                    "Enable 2FA on all critical accounts (email, banking, social)",
                    "Buy a YubiKey for your most important accounts"
                ]
            )
        ],
        keyTakeaways: [
            "Chrome is a surveillance tool - use Brave or Firefox",
            "VPNs help but don't make you anonymous",
            "Use a password manager with unique passwords everywhere",
            "Enable two-factor authentication on all important accounts"
        ]
    )

}

// MARK: - Module 6: Social Media Armor

extension DigitalSecurityCourse {

    static let socialMediaArmorModule = DigitalSecurityModule(
        number: 6,
        title: "Social Media Armor",
        subtitle: "If you must use it, use it safely",
        icon: "shield.lefthalf.filled",
        duration: "20 min",
        lessons: [
            DigitalSecurityLesson(
                title: "Platform-Specific Privacy Settings",
                content: """
                If you choose to use social media, lock it down:

                **Facebook/Meta:**
                • Settings → Privacy → Limit past posts visibility
                • Settings → Privacy → Don't allow search engines to link
                • Settings → Apps and Websites → Remove all
                • Settings → Off-Facebook Activity → Clear and disconnect
                • Download your data, then delete old posts

                **Instagram:**
                • Settings → Privacy → Private account
                • Settings → Privacy → Activity Status OFF
                • Settings → Privacy → Restrict story sharing
                • Settings → Security → Apps and Websites → Remove all

                **Twitter/X:**
                • Settings → Privacy → Protect your tweets
                • Settings → Privacy → Discoverability OFF
                • Settings → Privacy → Location OFF
                • Don't use for login to other services

                **TikTok:**
                • Settings → Privacy → Private account
                • Settings → Privacy → Suggest account OFF
                • Settings → Privacy → Download your data OFF
                • Better yet: delete it entirely

                **LinkedIn:**
                • Settings → Visibility → Profile viewing options
                • Settings → Advertising → Turn ALL off
                • Review connections - remove unknowns
                """,
                facts: [
                    SecurityFact(
                        icon: "person.badge.minus.fill",
                        title: "Shadow Reach",
                        description: "Even with private settings, your data is still collected. Privacy settings mainly affect other users, not the platform.",
                        source: nil
                    ),
                    SecurityFact(
                        icon: "arrow.triangle.2.circlepath.circle.fill",
                        title: "Settings Reset",
                        description: "Platforms often reset privacy settings during updates. Check them regularly.",
                        source: nil
                    )
                ],
                actionItems: [
                    "Go through EVERY platform's privacy settings",
                    "Download and review your data from each platform",
                    "Remove third-party app connections",
                    "Consider deleting accounts you don't actively use"
                ]
            ),
            DigitalSecurityLesson(
                title: "The Nuclear Option: Deletion",
                content: """
                Sometimes the best security is no exposure at all.

                **Before Deleting:**
                1. Download ALL your data first
                2. Remove linked accounts and apps
                3. Change email to a disposable one
                4. Change password to random gibberish
                5. Remove profile photos and personal info
                6. Wait 30 days after deletion (data lingers)

                **What Deletion Actually Means:**
                • Facebook: "Deleted" data kept for 90 days minimum
                • Instagram: Same 90-day policy
                • TikTok: Claims 30 days, but who knows
                • Google: Various retention periods, some permanent

                **Alternative: Compartmentalization**
                If you can't delete:
                • Create separate accounts for different purposes
                • Never use real name/photo on interest-based accounts
                • Use different email addresses
                • Don't link accounts together
                • Use browser containers (Firefox Multi-Account)

                The less connected your digital identities, the safer you are.
                """,
                facts: [
                    SecurityFact(
                        icon: "trash.slash.fill",
                        title: "Deletion Theater",
                        description: "Platforms keep 'deleted' data for legal, advertising, and AI training purposes - often indefinitely.",
                        source: nil
                    ),
                    SecurityFact(
                        icon: "person.2.slash.fill",
                        title: "Shadow Profiles Persist",
                        description: "Even after deletion, Facebook maintains shadow profiles using data from your friends.",
                        source: nil
                    )
                ],
                actionItems: [
                    "Evaluate which platforms you ACTUALLY need",
                    "Delete accounts you haven't used in 6+ months",
                    "For remaining accounts, use compartmentalization",
                    "Never use 'Sign in with Facebook/Google'"
                ]
            )
        ],
        keyTakeaways: [
            "Privacy settings protect you from users, not from the platform",
            "Downloaded data reveals how much they know about you",
            "Deletion is never truly complete",
            "Compartmentalization reduces your attack surface"
        ]
    )

}

// MARK: - Module 7: Privacy Tools

extension DigitalSecurityCourse {

    static let privacyToolsModule = DigitalSecurityModule(
        number: 7,
        title: "Privacy Tools",
        subtitle: "Your digital self-defense toolkit",
        icon: "wrench.and.screwdriver.fill",
        duration: "25 min",
        lessons: [
            DigitalSecurityLesson(
                title: "Essential Privacy Stack",
                content: """
                Here's your complete privacy toolkit:

                **Communication:**
                • Signal - End-to-end encrypted messaging
                • ProtonMail - Encrypted email (Swiss)
                • Session - No phone number required messaging

                **Search:**
                • DuckDuckGo - No tracking search
                • Startpage - Google results, no tracking
                • Brave Search - Independent index

                **Cloud Storage:**
                • Proton Drive - Encrypted cloud storage
                • Tresorit - Zero-knowledge encryption
                • Cryptomator - Encrypt before uploading anywhere

                **Notes & Documents:**
                • Standard Notes - Encrypted notes
                • CryptPad - Encrypted collaborative docs
                • Local storage with encryption

                **Financial Privacy:**
                • Privacy.com - Virtual debit cards
                • Cash for local purchases
                • Cryptocurrency for ultimate privacy (with precautions)

                **DNS:**
                • Use encrypted DNS (DoH or DoT)
                • Quad9 (9.9.9.9) - Blocks malware
                • Cloudflare (1.1.1.1) - Fast and private
                """,
                facts: [
                    SecurityFact(
                        icon: "lock.shield.fill",
                        title: "Signal Protocol",
                        description: "Signal's encryption protocol is so good that WhatsApp, Facebook Messenger, and Skype all adopted it.",
                        source: nil
                    ),
                    SecurityFact(
                        icon: "building.columns.fill",
                        title: "Swiss Privacy",
                        description: "Switzerland has some of the strongest privacy laws in the world, making it ideal for privacy services.",
                        source: nil
                    )
                ],
                actionItems: [
                    "Install Signal and get your close contacts to use it",
                    "Create a ProtonMail account for sensitive communications",
                    "Switch your default search to DuckDuckGo",
                    "Set up encrypted DNS on your devices"
                ]
            ),
            DigitalSecurityLesson(
                title: "Advanced Privacy Techniques",
                content: """
                For those who want maximum protection:

                **Operational Security (OpSec):**
                • Never mix identities (personal vs. anonymous)
                • Assume everything is logged somewhere
                • Use separate devices for sensitive activities
                • Pay with cash or cryptocurrency
                • Use public WiFi (with VPN) for anonymous activities

                **Email Aliases:**
                • SimpleLogin - Create unlimited aliases
                • AnonAddy - Forward to your real email
                • Apple Hide My Email - Built into iCloud+

                **Phone Number Privacy:**
                • MySudo - Multiple phone numbers
                • Google Voice - Free secondary number
                • Burner phones for high-risk situations

                **Physical OpSec:**
                • Webcam covers (or tape)
                • Microphone blockers
                • Faraday bags for phones
                • RF-blocking wallets for cards
                • Privacy screens for public work

                **Advanced:**
                • Tails OS - Amnesic operating system
                • Whonix - Route everything through Tor
                • Air-gapped computers for maximum security
                """,
                facts: [
                    SecurityFact(
                        icon: "laptopcomputer",
                        title: "Zuckerberg's Laptop",
                        description: "Mark Zuckerberg covers his laptop webcam and microphone with tape. If HE doesn't trust it...",
                        source: "Facebook Photo, 2016"
                    ),
                    SecurityFact(
                        icon: "wave.3.right",
                        title: "Faraday Effectiveness",
                        description: "A proper Faraday bag blocks ALL signals - your phone can't be tracked or remotely accessed.",
                        source: nil
                    )
                ],
                actionItems: [
                    "Cover your webcam when not in use",
                    "Set up email aliases for online services",
                    "Get a secondary phone number for non-personal use",
                    "Consider a Faraday bag for sensitive situations"
                ]
            )
        ],
        keyTakeaways: [
            "Privacy requires using privacy-respecting tools",
            "Encrypted communication protects your conversations",
            "Email aliases prevent your real address from being harvested",
            "Physical security matters too (webcam covers, Faraday bags)"
        ]
    )

}

// MARK: - Module 8: Digital Sovereignty

extension DigitalSecurityCourse {

    static let digitalSovereigntyModule = DigitalSecurityModule(
        number: 8,
        title: "Digital Sovereignty",
        subtitle: "Reclaim your digital freedom",
        icon: "crown.fill",
        duration: "20 min",
        lessons: [
            DigitalSecurityLesson(
                title: "The Philosophy of Digital Freedom",
                content: """
                Privacy isn't about having something to hide. It's about having something to PROTECT: your freedom.

                **Why Privacy Matters:**

                • **Autonomy**: Your thoughts and explorations should be yours alone
                • **Safety**: Vulnerable populations need privacy for protection
                • **Democracy**: Surveillance chills free speech and dissent
                • **Humanity**: Being watched changes how we behave

                **The Panopticon Effect:**
                When you know you're being watched, you self-censor. You don't explore controversial ideas. You conform.

                This is the goal. Not to catch criminals, but to create a population that polices itself.

                **Your Data Is Your Sovereignty:**
                In the digital age, your data is an extension of your mind. Whoever controls your data has power over you.

                Reclaiming your digital privacy is an act of resistance against systems designed to predict, influence, and control you.

                This isn't paranoia. It's awareness.
                """,
                facts: [
                    SecurityFact(
                        icon: "quote.bubble.fill",
                        title: "Snowden's Warning",
                        description: "'Arguing that you don't care about privacy because you have nothing to hide is like saying you don't care about free speech because you have nothing to say.'",
                        source: "Edward Snowden"
                    ),
                    SecurityFact(
                        icon: "building.2.fill",
                        title: "Corporate-Government Alliance",
                        description: "Through programs like PRISM, tech companies share user data directly with intelligence agencies.",
                        source: "Snowden Documents, 2013"
                    )
                ],
                actionItems: [
                    "Reflect: What would you do differently if no one was watching?",
                    "Share this knowledge with people you care about",
                    "Support organizations fighting for digital rights (EFF, ACLU)",
                    "Vote for politicians who support privacy legislation"
                ]
            ),
            DigitalSecurityLesson(
                title: "Your 30-Day Privacy Transformation",
                content: """
                Here's your action plan to reclaim your digital sovereignty:

                **Week 1: Assessment**
                □ Download your data from Google, Facebook, Amazon
                □ Review and revoke app permissions
                □ Audit your online accounts (use HaveIBeenPwned.com)
                □ Install a password manager

                **Week 2: Browser & Search**
                □ Switch to Brave or Firefox
                □ Install uBlock Origin, Privacy Badger
                □ Switch default search to DuckDuckGo
                □ Set up encrypted DNS

                **Week 3: Communication & Accounts**
                □ Install Signal, convince close contacts to join
                □ Create ProtonMail account
                □ Set up email aliases for new signups
                □ Enable 2FA on all important accounts

                **Week 4: Social Media & Ongoing**
                □ Lock down all social media privacy settings
                □ Delete accounts you don't need
                □ Set up a weekly privacy check routine
                □ Continue learning and adapting

                **Remember:**
                Privacy is a journey, not a destination. Every step makes you harder to track, predict, and control.

                You're not just protecting yourself. You're contributing to a culture that values human freedom over corporate profit.
                """,
                facts: [
                    SecurityFact(
                        icon: "checkmark.shield.fill",
                        title: "Compound Effect",
                        description: "Each privacy measure multiplies the effectiveness of others. A VPN + private browser + encrypted email is far more than 3x protection.",
                        source: nil
                    ),
                    SecurityFact(
                        icon: "person.3.fill",
                        title: "Network Effect",
                        description: "When you use Signal, you protect everyone you communicate with. Privacy is contagious.",
                        source: nil
                    )
                ],
                actionItems: [
                    "Print this 30-day plan and follow it",
                    "Set a weekly calendar reminder for privacy maintenance",
                    "Teach at least one other person what you've learned",
                    "Make privacy part of your identity, not just a task"
                ]
            )
        ],
        keyTakeaways: [
            "Privacy is about freedom, not secrecy",
            "Surveillance creates self-censorship",
            "Your data is an extension of your mind",
            "Digital sovereignty requires ongoing effort and awareness"
        ]
    )

}
