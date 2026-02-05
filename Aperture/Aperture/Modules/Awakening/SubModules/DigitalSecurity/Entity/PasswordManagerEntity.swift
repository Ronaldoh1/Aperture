// PasswordManagerEntity.swift
// Password Security Deep Dive
// Using password managers like 1Password, Bitwarden, etc.

import SwiftUI

// MARK: - Password Manager Module

struct PasswordManagerModule {

    static let title = "Password Manager Mastery"
    static let subtitle = "Your digital key vault"
    static let icon = "key.fill"
    static let color = Color(hex: "#FF6B35")

    static let overview = """
    Your passwords are the keys to your digital life. If someone gets your email password, they can reset every other account you have. If you use the same password everywhere (and most people do), one breach exposes everything.

    A password manager is the ONLY practical solution for maintaining strong, unique passwords for hundreds of accounts.

    This module covers:
    • Why you need a password manager (spoiler: you do)
    • How to choose and set up a password manager
    • Creating a bulletproof master password
    • Migrating your existing passwords
    • Best practices for ongoing security
    """

    static let lessons: [PasswordLesson] = [
        whyYouNeedOneLesson,
        choosingManagerLesson,
        masterPasswordLesson,
        settingUpLesson,
        migrationLesson,
        bestPracticesLesson,
        emergencyAccessLesson
    ]

}

struct PasswordLesson: Identifiable {

    let id = UUID()
    let title: String
    let content: String
    let steps: [PasswordStep]
    let warnings: [String]

}

struct PasswordStep: Identifiable {

    let id = UUID()
    let number: Int
    let title: String
    let description: String
    let tip: String?

}

// MARK: - Lessons

extension PasswordManagerModule {

    static let whyYouNeedOneLesson = PasswordLesson(
        title: "Why You Need a Password Manager",
        content: """
        Let's be real about the problem:

        **The Human Brain Problem:**
        • Average person has 100+ online accounts
        • Human brains can't remember 100+ unique, complex passwords
        • So people reuse passwords (82% of people do)
        • Or use simple, guessable passwords

        **The Breach Reality:**
        • Major breaches happen constantly
        • 33 billion accounts exposed in 2023 alone
        • Your credentials are probably already leaked
        • Check at haveibeenpwned.com

        **What Happens After a Breach:**
        1. Hackers get email + password combos
        2. They automatically try them on other sites
        3. This is called "credential stuffing"
        4. If you reused that password, they're IN

        **The Math:**
        • 8-character password: Cracked in under 1 hour
        • 12-character password: Cracked in weeks
        • 16-character random password: 34,000+ years
        • 20-character random password: Essentially never

        **The Solution:**
        A password manager lets you:
        • Generate truly random, long passwords
        • Store them securely encrypted
        • Auto-fill them when needed
        • Only remember ONE master password

        You're not weak for needing a password manager. You're smart for using one.
        """,
        steps: [],
        warnings: [
            "Check if your email has been breached at haveibeenpwned.com",
            "Password reuse is the #1 security vulnerability for most people",
            "Even 'strong' passwords you create are weaker than random ones"
        ]
    )

    static let choosingManagerLesson = PasswordLesson(
        title: "Choosing a Password Manager",
        content: """
        Not all password managers are equal. Here's what to consider:

        **TOP RECOMMENDATIONS:**

        **1. Bitwarden** ⭐ BEST FREE OPTION
        • Open source (code is auditable)
        • Free tier is excellent
        • Premium: $10/year
        • Self-hostable for paranoid users
        • Cross-platform

        **2. 1Password** ⭐ BEST OVERALL
        • Best user experience
        • Family plans excellent
        • Travel mode (hides vaults at borders)
        • Watchtower (breach monitoring)
        • $36/year individual, $60/year family

        **3. Proton Pass**
        • From makers of ProtonMail
        • Swiss privacy
        • Integrated with Proton ecosystem
        • Newer but promising

        **AVOID:**

        **LastPass** ❌
        • Multiple serious breaches
        • Encrypted vaults were stolen
        • Trust destroyed

        **Browser Built-in Managers** ⚠️
        • Convenient but less secure
        • Tied to one browser
        • Less robust encryption
        • OK as stepping stone, not long-term

        **KEY FEATURES TO LOOK FOR:**
        • Zero-knowledge encryption (they can't see your data)
        • Cross-platform (works everywhere)
        • Secure sharing (for family/team)
        • 2FA support (store your 2FA codes too)
        • Breach monitoring
        • Password generator
        """,
        steps: [
            PasswordStep(
                number: 1,
                title: "Evaluate Your Needs",
                description: "Personal only? Family? Business? Free or paid features needed?",
                tip: "For most people, Bitwarden free or 1Password family is ideal"
            ),
            PasswordStep(
                number: 2,
                title: "Check Platform Support",
                description: "Make sure it works on all YOUR devices (Mac, Windows, iOS, Android)",
                tip: "All major managers support all major platforms"
            ),
            PasswordStep(
                number: 3,
                title: "Read Recent Security Audits",
                description: "Good managers publish third-party security audits",
                tip: "Bitwarden and 1Password both have recent audits available"
            )
        ],
        warnings: [
            "LastPass had serious breaches - consider migrating if you use it",
            "Free managers are fine - don't think you need to pay for security",
            "The best manager is the one you'll actually use"
        ]
    )

    static let masterPasswordLesson = PasswordLesson(
        title: "Creating Your Master Password",
        content: """
        Your master password is the ONE password you need to remember. It must be:
        • Strong enough to resist cracking
        • Memorable enough to never forget
        • Never used ANYWHERE else

        **THE PASSPHRASE METHOD:**

        Instead of: `Tr0ub4dor&3` (hard to remember, not that strong)
        Use: `correct-horse-battery-staple` (easy to remember, very strong)

        **How to create a passphrase:**

        1. Pick 4-6 random words (use a word list or generator)
        2. Words should be truly RANDOM, not a phrase
        3. Add separators (hyphens, spaces, or numbers)
        4. Optionally add a number or symbol

        **Examples:**
        • `elephant-quantum-bicycle-forest`
        • `correct horse battery staple 42`
        • `Mango!trumpet$ocean@castle`

        **The Math:**
        • 4 random words from 7,000 word list = 2.4 × 10^15 combinations
        • At 1 trillion guesses/second = 28 days to crack
        • 5 words = 75+ years
        • 6 words = essentially forever

        **IMPORTANT:**
        • NEVER use this password anywhere else
        • Write it down and store securely while memorizing
        • After memorized, destroy the paper OR store in a safe
        • Consider a passphrase you can visualize (creates memory palace)

        **Visualization Technique:**
        `elephant-quantum-bicycle-forest`
        Imagine: An elephant doing quantum physics calculations on a bicycle in a forest.
        The more absurd the image, the more memorable.
        """,
        steps: [
            PasswordStep(
                number: 1,
                title: "Generate Random Words",
                description: "Use diceware or EFF word list for true randomness",
                tip: "Don't pick words yourself - humans are bad at randomness"
            ),
            PasswordStep(
                number: 2,
                title: "Create a Visualization",
                description: "Build a mental scene with your words",
                tip: "Make it weird and memorable"
            ),
            PasswordStep(
                number: 3,
                title: "Practice Typing It",
                description: "Type it 20+ times to build muscle memory",
                tip: "Practice over several days before relying on it"
            ),
            PasswordStep(
                number: 4,
                title: "Store Emergency Backup",
                description: "Write it down and store in a secure location (safe, safety deposit box)",
                tip: "This is for emergencies only - not everyday reference"
            )
        ],
        warnings: [
            "NEVER reuse your master password anywhere",
            "Don't use quotes, song lyrics, or predictable phrases",
            "Have a recovery plan if you forget (but try not to forget)"
        ]
    )

    static let settingUpLesson = PasswordLesson(
        title: "Setting Up Your Password Manager",
        content: """
        Let's walk through setting up a password manager (using Bitwarden and 1Password as examples):

        **BITWARDEN SETUP:**

        1. Go to bitwarden.com
        2. Click "Get Started"
        3. Enter email and create master password
        4. Verify email
        5. Download apps for all your devices
        6. Install browser extensions
        7. Log in everywhere with master password

        **1PASSWORD SETUP:**

        1. Go to 1password.com
        2. Start free trial or purchase
        3. Create account with email
        4. Create master password
        5. **CRITICAL:** Save your Secret Key
        6. Download apps and extensions
        7. Use QR code to set up devices

        **THE SECRET KEY (1Password):**
        1Password uses a Secret Key + master password for extra security.
        • You MUST save this key
        • Store it separately from your master password
        • Without it, you cannot access your account from new devices

        **BROWSER EXTENSION SETUP:**
        
        All major browsers supported:
        • Chrome, Firefox, Safari, Edge, Brave
        • Enable auto-fill
        • Set keyboard shortcut for quick access
        • Disable browser's built-in password manager

        **MOBILE SETUP:**
        
        • Download official app from App Store/Play Store
        • Enable biometric unlock (Face ID, fingerprint)
        • Enable auto-fill in phone settings:
          - iOS: Settings > Passwords > AutoFill Passwords
          - Android: Settings > Passwords > AutoFill service
        """,
        steps: [
            PasswordStep(
                number: 1,
                title: "Create Your Account",
                description: "Sign up at bitwarden.com or 1password.com",
                tip: "Use an email you'll always have access to"
            ),
            PasswordStep(
                number: 2,
                title: "Set Master Password",
                description: "Use the passphrase method from previous lesson",
                tip: nil
            ),
            PasswordStep(
                number: 3,
                title: "Save Recovery Information",
                description: "Emergency kit, secret key, recovery codes",
                tip: "Store physically in a secure location"
            ),
            PasswordStep(
                number: 4,
                title: "Install Everywhere",
                description: "Desktop apps, mobile apps, browser extensions",
                tip: "You want it available on every device you use"
            ),
            PasswordStep(
                number: 5,
                title: "Disable Other Password Managers",
                description: "Turn off Chrome, Safari, Firefox built-in managers",
                tip: "Prevents confusion about which manager to use"
            )
        ],
        warnings: [
            "SAVE YOUR RECOVERY INFORMATION - losing it means losing everything",
            "1Password Secret Key is as important as your master password",
            "Only download apps from official sources"
        ]
    )

    static let migrationLesson = PasswordLesson(
        title: "Migrating Your Passwords",
        content: """
        Now let's move your existing passwords into your manager:

        **STEP 1: IMPORT FROM BROWSERS**

        Most password managers can import from:
        • Chrome
        • Firefox
        • Safari
        • Edge
        • LastPass, Dashlane, etc.

        In your password manager:
        Tools/Settings > Import > Select source > Follow instructions

        **STEP 2: ADD CRITICAL ACCOUNTS FIRST**

        Prioritize these:
        1. Email (most critical - controls password resets)
        2. Banking and financial
        3. Social media
        4. Work accounts
        5. Shopping sites

        **STEP 3: GENERATE NEW PASSWORDS**

        For each imported account:
        1. Open the account's settings
        2. Go to change password
        3. Use password manager to generate new password
        4. 20+ characters, all character types
        5. Save in manager
        6. Update the site

        **PASSWORD GENERATION SETTINGS:**
        • Length: 20+ characters (more is better)
        • Include: Uppercase, lowercase, numbers, symbols
        • Avoid ambiguous characters if you ever type manually

        **STEP 4: ENABLE 2FA EVERYWHERE**

        While updating passwords, also enable 2FA:
        • Your password manager can store TOTP codes
        • Or use separate authenticator (Authy, etc.)
        • Never use SMS 2FA if app-based is available

        **PACE YOURSELF:**
        You don't have to do this all at once.
        • Start with top 10 most critical accounts
        • Do 5-10 accounts per day
        • Within a few weeks, you'll be fully migrated
        """,
        steps: [
            PasswordStep(
                number: 1,
                title: "Export from Current Sources",
                description: "Export from browser, old password manager",
                tip: "Delete the export file after importing"
            ),
            PasswordStep(
                number: 2,
                title: "Import into New Manager",
                description: "Use the import tool in your password manager",
                tip: nil
            ),
            PasswordStep(
                number: 3,
                title: "Update Critical Accounts",
                description: "Generate new passwords for email, banking, social",
                tip: "Do email FIRST - it's the master key to everything"
            ),
            PasswordStep(
                number: 4,
                title: "Enable 2FA",
                description: "Add two-factor authentication while you're updating",
                tip: "Save backup codes in your password manager notes"
            ),
            PasswordStep(
                number: 5,
                title: "Clean Up",
                description: "Delete passwords from browsers, delete export files",
                tip: "You don't want passwords in multiple places"
            )
        ],
        warnings: [
            "Delete export files after importing - they're not encrypted",
            "Update EMAIL password FIRST - it's the key to everything else",
            "Save 2FA backup codes - don't just scan QR codes"
        ]
    )

    static let bestPracticesLesson = PasswordLesson(
        title: "Ongoing Best Practices",
        content: """
        Now that you're set up, here's how to stay secure:

        **DAILY HABITS:**

        • Always use the password manager to fill credentials
        • Never type passwords manually (phishing protection)
        • Lock your manager when stepping away
        • Use biometrics for convenience (but keep master password fresh in memory)

        **WHEN CREATING NEW ACCOUNTS:**

        1. Let password manager generate the password
        2. Use email alias if available (Hide My Email, SimpleLogin)
        3. Enable 2FA immediately
        4. Add to appropriate folder/category

        **REGULAR MAINTENANCE:**

        **Monthly:**
        • Review weak passwords (most managers flag these)
        • Update any passwords that were in breaches
        • Check for duplicate passwords

        **Quarterly:**
        • Review and remove unused accounts
        • Check security dashboard/reports
        • Verify recovery information is still accessible

        **SECURITY HYGIENE:**

        • Never share your master password with anyone
        • Be cautious of phishing (manager won't auto-fill on fake sites)
        • Keep apps updated
        • Review connected devices periodically
        • Use secure sharing features for family passwords

        **TRAVEL SECURITY (1Password):**

        1Password has "Travel Mode":
        • Mark vaults as "safe for travel"
        • Enable travel mode before crossing borders
        • Non-safe vaults are hidden (not just locked - gone)
        • Protects against forced device searches
        • Re-enable normal mode after travel
        """,
        steps: [],
        warnings: [
            "If you suspect master password is compromised, change it IMMEDIATELY",
            "Periodically verify you can still access your recovery materials",
            "Never export your vault to unencrypted files"
        ]
    )

    static let emergencyAccessLesson = PasswordLesson(
        title: "Emergency Access & Recovery",
        content: """
        What happens if you:
        • Forget your master password?
        • Become incapacitated?
        • Pass away?

        **PERSONAL RECOVERY:**

        **Emergency Kit:**
        Create and store securely:
        • Master password (written)
        • Secret key (if applicable)
        • Recovery codes
        • Account email

        Store in:
        • Home safe
        • Safety deposit box
        • With a trusted attorney
        • Split between multiple locations

        **TRUSTED CONTACTS:**

        Most managers offer emergency access:

        **1Password:**
        • Add family members to family plan
        • Recovery contacts can request access
        • You can set a waiting period

        **Bitwarden:**
        • Emergency Access feature
        • Trusted contacts request access
        • Waiting period (you can deny during wait)
        • After wait, they get access

        **SET IT UP:**
        1. Identify 1-2 trusted people
        2. Discuss with them in person
        3. Configure emergency access
        4. Set appropriate wait period (3-7 days recommended)
        5. Test it works

        **WHAT TO SHARE:**
        • How to request access
        • That they may need to wait
        • What to do with access (pay bills, etc.)
        • Any legal considerations

        **LEGAL PREPARATION:**
        • Include digital assets in your will
        • Consider a digital executor
        • Document existence of password manager
        • Lawyer should know how to access emergency kit

        **IF YOU FORGET MASTER PASSWORD:**
        • Most managers CANNOT recover it (zero-knowledge)
        • This is why emergency kit is essential
        • Some offer account recovery if you have Secret Key
        • Without recovery materials, you start over
        """,
        steps: [
            PasswordStep(
                number: 1,
                title: "Create Emergency Kit",
                description: "Document master password, secret key, recovery codes",
                tip: "Physical paper in secure location"
            ),
            PasswordStep(
                number: 2,
                title: "Set Up Trusted Contacts",
                description: "Add emergency access contacts in your manager",
                tip: "Choose carefully - they'll have full access"
            ),
            PasswordStep(
                number: 3,
                title: "Configure Wait Period",
                description: "Set how long before trusted contacts can access",
                tip: "3-7 days gives you time to deny if mistaken request"
            ),
            PasswordStep(
                number: 4,
                title: "Test the System",
                description: "Have trusted contact request access, then deny it",
                tip: "Make sure the process works before you need it"
            ),
            PasswordStep(
                number: 5,
                title: "Document for Estate",
                description: "Include in will or estate documents",
                tip: "Digital assets are real assets"
            )
        ],
        warnings: [
            "If you lose master password AND recovery materials, your data is GONE",
            "Zero-knowledge means even the company can't help you recover",
            "Set up emergency access BEFORE you need it"
        ]
    )

}
