// PodcastLibrary.swift
// Curated library of awakening podcasts
// "Neural bridges for consciousness expansion"

import SwiftUI

struct PodcastLibrary {
    
    static let allPodcasts: [AwakeningPodcast] = [
        
        // MARK: - TOP PICKS (Your Research)
        
        AwakeningPodcast(
            name: "Inner Work",
            host: "Josephine Hardman, PhD",
            description: "Psychospiritual development like a blueprint for inner architecture.",
            longDescription: "Inner Work guides psychospiritual development like a tech engineer's blueprint for inner architecture. Episodes dive into healing patterns, shadow work, and awakening milestones—ideal for bridging personal divides. Josephine brings a PhD-level depth while keeping it accessible. Turns chaos into actionable clarity, with gamified self-reflection prompts. Recent episodes cover embodying 2026's collective shifts and navigating awakening without losing your mind.",
            category: .shadowWork,
            coverColor: .indigo,
            icon: "🔮",
            spotifyURL: "https://open.spotify.com/show/inner-work",
            applePodcastsURL: "https://podcasts.apple.com/podcast/inner-work",
            websiteURL: "https://josephinehardman.com/podcast",
            keyTopics: ["Shadow Work", "Healing Patterns", "Awakening Milestones", "Psychospiritual Development", "Inner Child", "Trauma Integration"],
            bestFor: [
                "Those ready to face their shadows",
                "People who want structure in their spiritual work",
                "Engineers who appreciate systematic approaches",
                "Anyone stuck in repeating life patterns"
            ],
            sampleEpisodes: [
                SampleEpisode(title: "The Architecture of Your Inner World", description: "Map your psyche like a system architect maps code", duration: "45 min"),
                SampleEpisode(title: "Shadow Work 101: Meeting Your Hidden Self", description: "Practical intro to integrating disowned parts", duration: "38 min"),
                SampleEpisode(title: "When Awakening Gets Messy", description: "What to do when spiritual growth disrupts your life", duration: "52 min")
            ],
            vibe: "Your inner architect's blueprint",
            difficultyLevel: 3,
            isTopPick: true
        ),
        
        AwakeningPodcast(
            name: "The Highest Self Podcast",
            host: "Sahara Rose",
            description: "Dharma and purpose as spiritual entrepreneurship.",
            longDescription: "Sahara Rose's powerhouse frames Dharma and purpose as 'spiritual entrepreneurship.' It's like a growth-hacker's manifesto for the soul—episodes mash Ayurveda, manifestation, and awakening journeys. Recent seasons tackle AI ethics meets mysticism. Her energy's contagious for spotting ideological overlaps between ancient wisdom and modern life. Perfect for those who want awakening AND success.",
            category: .practicalAwakening,
            coverColor: .pink,
            icon: "🌸",
            spotifyURL: "https://open.spotify.com/show/highest-self",
            applePodcastsURL: "https://podcasts.apple.com/podcast/highest-self",
            websiteURL: "https://sahararose.com/podcast",
            keyTopics: ["Dharma", "Ayurveda", "Manifestation", "Purpose", "Feminine Energy", "Spiritual Business"],
            bestFor: [
                "Spiritual entrepreneurs",
                "Those seeking their life purpose",
                "Women on the awakening path",
                "Anyone blending career with consciousness"
            ],
            sampleEpisodes: [
                SampleEpisode(title: "Discovering Your Dharma", description: "Find your soul's purpose using ancient Ayurvedic wisdom", duration: "55 min"),
                SampleEpisode(title: "Spiritual Entrepreneurship", description: "Building a business aligned with your highest self", duration: "48 min"),
                SampleEpisode(title: "AI and the Future of Consciousness", description: "Where technology meets mysticism", duration: "62 min")
            ],
            vibe: "Growth-hacker meets mystic",
            difficultyLevel: 2,
            isTopPick: true
        ),
        
        AwakeningPodcast(
            name: "On Being",
            host: "Krista Tippett",
            description: "Unity, wisdom, and the great awakening through profound conversations.",
            longDescription: "A contemplative powerhouse exploring unity, wisdom, and the 'great awakening.' Krista's interviews synthesize science, poetry, and spirituality—like a designer's elegant flow from division to wholeness. Conversations feature Nobel laureates, poets, activists, and mystics. Augments your empathy engine and makes philosophers sound like your witty uncle. The gold standard for spiritual-intellectual discourse.",
            category: .philosophy,
            coverColor: .blue,
            icon: "🕊️",
            spotifyURL: "https://open.spotify.com/show/on-being",
            applePodcastsURL: "https://podcasts.apple.com/podcast/on-being",
            websiteURL: "https://onbeing.org",
            keyTopics: ["Wisdom", "Unity", "Poetry", "Science & Spirit", "Social Healing", "Contemplative Life"],
            bestFor: [
                "Intellectuals seeking spiritual depth",
                "Those healing from polarization",
                "Anyone who loves deep conversation",
                "People bridging science and spirit"
            ],
            sampleEpisodes: [
                SampleEpisode(title: "The Inner Landscape of Beauty", description: "With poet John O'Donohue on beauty as a human need", duration: "51 min"),
                SampleEpisode(title: "The Bias Inside Us", description: "Exploring unconscious patterns with compassion", duration: "48 min"),
                SampleEpisode(title: "Einstein's God", description: "The spirituality behind scientific genius", duration: "55 min")
            ],
            vibe: "Wisdom for the thoughtful soul",
            difficultyLevel: 3,
            isTopPick: true
        ),
        
        AwakeningPodcast(
            name: "Tara Brach",
            host: "Tara Brach, PhD",
            description: "Psychology and Eastern practices for radical self-compassion.",
            longDescription: "Blending psychology and Eastern practices, Tara's talks on self-compassion and mindfulness are minimalist mastery—frictionless paths to spiritual awakening. Episodes like 'Receiving Life in Open Awareness' are pure gold for those midnight epiphanies. Her RAIN technique (Recognize, Allow, Investigate, Nurture) has helped millions. Think of it as your pocket guru for ideological synthesis. Offline-sync friendly for mobile awakening.",
            category: .meditation,
            coverColor: .green,
            icon: "🪷",
            spotifyURL: "https://open.spotify.com/show/tara-brach",
            applePodcastsURL: "https://podcasts.apple.com/podcast/tara-brach",
            websiteURL: "https://tarabrach.com",
            keyTopics: ["Self-Compassion", "RAIN Meditation", "Mindfulness", "Buddhism", "Radical Acceptance", "Loving Awareness"],
            bestFor: [
                "Those struggling with self-criticism",
                "Anxiety and stress relief seekers",
                "Meditation beginners and veterans",
                "Anyone healing from shame"
            ],
            sampleEpisodes: [
                SampleEpisode(title: "Radical Compassion: The RAIN Practice", description: "Her signature technique for emotional freedom", duration: "42 min"),
                SampleEpisode(title: "Receiving Life in Open Awareness", description: "Expand beyond the small self", duration: "38 min"),
                SampleEpisode(title: "Freedom from the Trance of Unworthiness", description: "Breaking free from not-enoughness", duration: "45 min")
            ],
            vibe: "Your pocket compassion guru",
            difficultyLevel: 1,
            isTopPick: true
        ),
        
        AwakeningPodcast(
            name: "Third Eye Awakening",
            host: "Amy Belair",
            description: "Chakras, energy work, and conscious living for the mystically inclined.",
            longDescription: "For the mystically inclined, this pod dives into chakras, energy work, and conscious living—like a tech engineer's graph of spiritual nodes. Amy shares tools for the 'great shift,' with recent episodes on collective awakening and energy sovereignty. Rewards deep listeners with practical integrations. If your third eye's blinking Morse code for help, this decodes it.",
            category: .mysticism,
            coverColor: .purple,
            icon: "👁️",
            spotifyURL: "https://open.spotify.com/show/third-eye-awakening",
            applePodcastsURL: "https://podcasts.apple.com/podcast/third-eye-awakening",
            websiteURL: nil,
            keyTopics: ["Third Eye", "Chakras", "Energy Work", "Collective Awakening", "Psychic Development", "Ascension"],
            bestFor: [
                "Those experiencing energy phenomena",
                "Chakra system explorers",
                "People in active awakening",
                "Anyone developing intuition"
            ],
            sampleEpisodes: [
                SampleEpisode(title: "Opening Your Third Eye Safely", description: "Practical steps without the overwhelm", duration: "35 min"),
                SampleEpisode(title: "The 2026 Collective Shift", description: "What's happening energetically on the planet", duration: "42 min"),
                SampleEpisode(title: "Protecting Your Energy Field", description: "Boundaries for empaths and sensitives", duration: "38 min")
            ],
            vibe: "Decoding your energy system",
            difficultyLevel: 4,
            isTopPick: true
        ),
        
        AwakeningPodcast(
            name: "Mind Love",
            host: "Melissa Monte",
            description: "Science-backed insights and spiritual stories for waking up.",
            longDescription: "Melissa Monte's blend of science-backed insights and spiritual stories is a growth-hacker's dream—rewiring narratives for those 'waking up in a sleepy world.' Award-winner for best documentary vibes. Augments by questioning illusions. Widget-friendly for quick episode captures during urban wandering. Perfect for skeptics who need evidence alongside intuition.",
            category: .scienceSpirit,
            coverColor: .cyan,
            icon: "🧠",
            spotifyURL: "https://open.spotify.com/show/mind-love",
            applePodcastsURL: "https://podcasts.apple.com/podcast/mind-love",
            websiteURL: "https://mindlove.com",
            keyTopics: ["Neuroscience", "Consciousness", "Healing Stories", "Breaking Illusions", "Mind-Body Connection", "Transformation"],
            bestFor: [
                "Science-minded spiritualists",
                "Skeptics opening to more",
                "Those who need evidence",
                "Transformation story lovers"
            ],
            sampleEpisodes: [
                SampleEpisode(title: "The Neuroscience of Awakening", description: "What happens in your brain during spiritual experiences", duration: "48 min"),
                SampleEpisode(title: "Breaking Free from the Matrix", description: "Stories of people who woke up from conditioning", duration: "52 min"),
                SampleEpisode(title: "Questioning Reality", description: "What if everything you believed was wrong?", duration: "45 min")
            ],
            vibe: "Science meets soul",
            difficultyLevel: 2,
            isTopPick: true
        ),
        
        // MARK: - CONSCIOUSNESS
        
        AwakeningPodcast(
            name: "Buddha at the Gas Pump",
            host: "Rick Archer",
            description: "In-depth interviews with ordinary spiritually awakening people.",
            longDescription: "Rick Archer has conducted over 600 interviews with 'ordinary' people who have experienced spiritual awakening. This removes the guru pedestal and shows awakening happening to regular folks—teachers, engineers, parents. Long-form conversations (1-2 hours) that go deep. Proof that awakening isn't reserved for monks in caves.",
            category: .consciousness,
            coverColor: .orange,
            icon: "⛽",
            spotifyURL: "https://open.spotify.com/show/batgap",
            applePodcastsURL: "https://podcasts.apple.com/podcast/batgap",
            websiteURL: "https://batgap.com",
            keyTopics: ["Awakening Stories", "Non-Duality", "Kundalini", "Ordinary Awakening", "Consciousness Research", "Integration"],
            bestFor: [
                "Those wondering if awakening is real",
                "People who've had experiences they can't explain",
                "Long-form conversation lovers",
                "Anyone feeling alone in their awakening"
            ],
            sampleEpisodes: [
                SampleEpisode(title: "The Engineer Who Woke Up", description: "A software developer's spontaneous awakening", duration: "95 min"),
                SampleEpisode(title: "Kundalini Rising: A Nurse's Story", description: "Medical professional navigates energy awakening", duration: "88 min"),
                SampleEpisode(title: "After the Awakening: What Now?", description: "The integration process nobody talks about", duration: "102 min")
            ],
            vibe: "600+ proof awakening is real",
            difficultyLevel: 3,
            isTopPick: false
        ),
        
        AwakeningPodcast(
            name: "Theories of Everything",
            host: "Curt Jaimungal",
            description: "Where physics meets philosophy meets consciousness.",
            longDescription: "Curt dives into the deepest questions of existence—consciousness, physics, mathematics, and reality itself. Interviews with physicists, philosophers, and consciousness researchers. Not for the faint of mind. This is where quantum mechanics meets mysticism with intellectual rigor. Engineers and scientists will feel at home.",
            category: .scienceSpirit,
            coverColor: .indigo,
            icon: "∞",
            spotifyURL: "https://open.spotify.com/show/toe",
            applePodcastsURL: "https://podcasts.apple.com/podcast/theories-of-everything",
            websiteURL: "https://theoriesofeverything.org",
            keyTopics: ["Physics", "Consciousness", "Mathematics", "Reality", "Philosophy of Mind", "Quantum Mechanics"],
            bestFor: [
                "Engineers and scientists",
                "Deep thinkers",
                "Those who need intellectual rigor",
                "Physics-consciousness bridge seekers"
            ],
            sampleEpisodes: [
                SampleEpisode(title: "Is Consciousness Fundamental?", description: "Physicists debate the hard problem", duration: "120 min"),
                SampleEpisode(title: "The Simulation Hypothesis", description: "Are we living in a computed reality?", duration: "95 min"),
                SampleEpisode(title: "Panpsychism and Physics", description: "Does consciousness pervade all matter?", duration: "108 min")
            ],
            vibe: "PhD-level consciousness exploration",
            difficultyLevel: 5,
            isTopPick: false
        ),
        
        // MARK: - EASTERN WISDOM
        
        AwakeningPodcast(
            name: "Ram Dass Here and Now",
            host: "Ram Dass Foundation",
            description: "Timeless teachings from the legendary spiritual teacher.",
            longDescription: "Archive recordings from Ram Dass (Richard Alpert)—the Harvard professor turned spiritual teacher who brought Eastern wisdom to the West. 'Be Here Now' philosophy in audio form. His warmth, humor, and depth make complex teachings accessible. A direct transmission from one of the most beloved teachers of the 20th century.",
            category: .easternWisdom,
            coverColor: .purple,
            icon: "🙏",
            spotifyURL: "https://open.spotify.com/show/ram-dass",
            applePodcastsURL: "https://podcasts.apple.com/podcast/ram-dass",
            websiteURL: "https://ramdass.org",
            keyTopics: ["Be Here Now", "Loving Awareness", "Hinduism", "Service", "Aging", "Death"],
            bestFor: [
                "Those new to Eastern philosophy",
                "Anyone seeking a warm teacher",
                "People dealing with aging or death",
                "Heart-centered practitioners"
            ],
            sampleEpisodes: [
                SampleEpisode(title: "Be Here Now", description: "The essence of Ram Dass's teaching", duration: "45 min"),
                SampleEpisode(title: "Becoming Nobody", description: "Dissolving the ego with love", duration: "52 min"),
                SampleEpisode(title: "Loving Awareness", description: "His ultimate teaching on consciousness", duration: "48 min")
            ],
            vibe: "The OG Western mystic",
            difficultyLevel: 2,
            isTopPick: false
        ),
        
        AwakeningPodcast(
            name: "Alan Watts Being in the Way",
            host: "Alan Watts Organization",
            description: "The philosopher who made Zen accessible to the West.",
            longDescription: "Archive recordings from Alan Watts—the British philosopher who made Zen Buddhism accessible to Western audiences. His playful, paradoxical teaching style makes ancient wisdom feel fresh. Lectures on Taoism, Buddhism, and the nature of reality delivered with British wit. The original 'spiritual but not religious' voice.",
            category: .easternWisdom,
            coverColor: .teal,
            icon: "☯️",
            spotifyURL: "https://open.spotify.com/show/alan-watts",
            applePodcastsURL: "https://podcasts.apple.com/podcast/alan-watts",
            websiteURL: "https://alanwatts.org",
            keyTopics: ["Zen Buddhism", "Taoism", "Western Philosophy", "The Self", "Play", "Nature of Reality"],
            bestFor: [
                "Intellectuals approaching spirituality",
                "Those who appreciate paradox",
                "Zen curious minds",
                "Anyone tired of serious spirituality"
            ],
            sampleEpisodes: [
                SampleEpisode(title: "The Real You", description: "Who are you really? A mind-bending exploration", duration: "55 min"),
                SampleEpisode(title: "The Tao of Philosophy", description: "Effortless action and going with the flow", duration: "48 min"),
                SampleEpisode(title: "This Is It", description: "The present moment is all there is", duration: "42 min")
            ],
            vibe: "Zen with British wit",
            difficultyLevel: 3,
            isTopPick: false
        ),
        
        AwakeningPodcast(
            name: "Rupert Spira Podcast",
            host: "Rupert Spira",
            description: "Non-dual teachings for recognizing your true nature.",
            longDescription: "Rupert Spira is one of the clearest voices in non-dual spirituality. His teaching focuses on direct recognition of awareness as your true nature. Dialogues with students, guided meditations, and explorations of 'the only thing that never changes.' Precise, elegant, and transformative. For those ready to question the questioner.",
            category: .consciousness,
            coverColor: .white,
            icon: "💎",
            spotifyURL: "https://open.spotify.com/show/rupert-spira",
            applePodcastsURL: "https://podcasts.apple.com/podcast/rupert-spira",
            websiteURL: "https://rupertspira.com",
            keyTopics: ["Non-Duality", "Awareness", "True Nature", "Self-Inquiry", "Consciousness", "Peace"],
            bestFor: [
                "Those drawn to non-dual teachings",
                "Direct path seekers",
                "Anyone asking 'Who am I?'",
                "Meditation practitioners going deeper"
            ],
            sampleEpisodes: [
                SampleEpisode(title: "The Nature of Awareness", description: "What is the 'I' that is aware?", duration: "45 min"),
                SampleEpisode(title: "You Are the Space", description: "Recognizing yourself as boundless awareness", duration: "38 min"),
                SampleEpisode(title: "Beyond the Mind", description: "What remains when thinking stops?", duration: "42 min")
            ],
            vibe: "Crystal clear non-duality",
            difficultyLevel: 4,
            isTopPick: false
        ),
        
        // MARK: - PRACTICAL AWAKENING
        
        AwakeningPodcast(
            name: "The Model Health Show",
            host: "Shawn Stevenson",
            description: "Health optimization meets consciousness expansion.",
            longDescription: "While not explicitly spiritual, Shawn's show recognizes that physical health is the foundation for awakening. Sleep, nutrition, movement—all covered with deep research. A healthy body is a clear vessel. The systems-thinking approach will appeal to engineers. Your body is hardware; optimize it.",
            category: .practicalAwakening,
            coverColor: .green,
            icon: "💪",
            spotifyURL: "https://open.spotify.com/show/model-health",
            applePodcastsURL: "https://podcasts.apple.com/podcast/model-health-show",
            websiteURL: "https://themodelhealthshow.com",
            keyTopics: ["Sleep", "Nutrition", "Movement", "Brain Health", "Longevity", "Energy"],
            bestFor: [
                "Those neglecting their physical foundation",
                "Bio-hackers and optimizers",
                "Anyone with low energy for practice",
                "Engineers who appreciate data"
            ],
            sampleEpisodes: [
                SampleEpisode(title: "Sleep and Consciousness", description: "How sleep affects your spiritual capacity", duration: "62 min"),
                SampleEpisode(title: "Brain Food", description: "Nutrition for cognitive clarity", duration: "55 min"),
                SampleEpisode(title: "The Gut-Brain Connection", description: "Your second brain and intuition", duration: "58 min")
            ],
            vibe: "Optimize the vessel",
            difficultyLevel: 1,
            isTopPick: false
        ),
        
        AwakeningPodcast(
            name: "Aubrey Marcus Podcast",
            host: "Aubrey Marcus",
            description: "Warrior poet exploring the full spectrum of human potential.",
            longDescription: "Aubrey dives into all aspects of human optimization—physical, mental, emotional, and spiritual. Open conversations about relationships, psychedelics, purpose, and shadow work. His 'Own the Day' philosophy is pragmatic awakening. Not afraid to go deep or get uncomfortable. For those who want the full human experience.",
            category: .practicalAwakening,
            coverColor: .orange,
            icon: "⚔️",
            spotifyURL: "https://open.spotify.com/show/aubrey-marcus",
            applePodcastsURL: "https://podcasts.apple.com/podcast/aubrey-marcus",
            websiteURL: "https://aubreymarcus.com",
            keyTopics: ["Human Optimization", "Relationships", "Psychedelics", "Masculinity", "Purpose", "Shadow Work"],
            bestFor: [
                "Men on the path",
                "Those exploring plant medicine",
                "Relationship-focused seekers",
                "Full-spectrum life optimizers"
            ],
            sampleEpisodes: [
                SampleEpisode(title: "Own the Day", description: "A morning-to-night optimization protocol", duration: "68 min"),
                SampleEpisode(title: "The Dark Night of the Soul", description: "Navigating spiritual crisis", duration: "75 min"),
                SampleEpisode(title: "Sacred Relationships", description: "Love as a path to awakening", duration: "82 min")
            ],
            vibe: "Warrior poet vibes",
            difficultyLevel: 3,
            isTopPick: false
        ),
        
        // MARK: - MEDITATION
        
        AwakeningPodcast(
            name: "Ten Percent Happier",
            host: "Dan Harris",
            description: "Meditation for fidgety skeptics.",
            longDescription: "Dan Harris was a skeptic who had a panic attack on live TV and found meditation out of desperation. His show approaches spirituality with journalist rigor. Interviews with teachers from all traditions, always asking the hard questions. For those who cringe at 'woo-woo' but want the benefits. Meditation for the rest of us.",
            category: .meditation,
            coverColor: .yellow,
            icon: "📺",
            spotifyURL: "https://open.spotify.com/show/ten-percent-happier",
            applePodcastsURL: "https://podcasts.apple.com/podcast/ten-percent-happier",
            websiteURL: "https://tenpercent.com",
            keyTopics: ["Meditation", "Skepticism", "Anxiety", "Practical Buddhism", "Mindfulness", "Mental Health"],
            bestFor: [
                "Skeptics and cynics",
                "Anxiety sufferers",
                "Corporate professionals",
                "Those who hate 'spiritual' language"
            ],
            sampleEpisodes: [
                SampleEpisode(title: "Meditation for Skeptics", description: "Dan's journey from doubt to practice", duration: "45 min"),
                SampleEpisode(title: "Dealing with Anxiety", description: "Practical techniques for worry", duration: "52 min"),
                SampleEpisode(title: "Is Enlightenment Real?", description: "Investigating the ultimate claim", duration: "58 min")
            ],
            vibe: "Skeptic-approved meditation",
            difficultyLevel: 1,
            isTopPick: false
        ),
        
        AwakeningPodcast(
            name: "Sounds True: Insights at the Edge",
            host: "Tami Simon",
            description: "Interviews with the world's top spiritual teachers.",
            longDescription: "Tami Simon founded Sounds True, one of the largest spiritual publishers. Her interviews tap into their vast network of teachers—from Eckhart Tolle to Pema Chödrön. Deep, thoughtful conversations with the biggest names in spirituality. Like having backstage passes to the awakening movement.",
            category: .consciousness,
            coverColor: .purple,
            icon: "🎙️",
            spotifyURL: "https://open.spotify.com/show/sounds-true",
            applePodcastsURL: "https://podcasts.apple.com/podcast/insights-at-the-edge",
            websiteURL: "https://soundstrue.com/podcasts",
            keyTopics: ["All Traditions", "Top Teachers", "Publishing Insights", "New Releases", "Spiritual Trends"],
            bestFor: [
                "Those wanting breadth of teaching",
                "Book lovers",
                "Teacher collectors",
                "Keeping up with spiritual trends"
            ],
            sampleEpisodes: [
                SampleEpisode(title: "Eckhart Tolle on Presence", description: "The Power of Now author on awakening", duration: "55 min"),
                SampleEpisode(title: "Pema Chödrön on Groundlessness", description: "Buddhist nun on uncertainty", duration: "48 min"),
                SampleEpisode(title: "Adyashanti: True Nature", description: "Non-dual teacher on awakening", duration: "52 min")
            ],
            vibe: "VIP access to top teachers",
            difficultyLevel: 3,
            isTopPick: false
        ),
        
        // MARK: - MYSTICISM & ENERGY
        
        AwakeningPodcast(
            name: "Cosmic Consciousness",
            host: "Brandon Beachum",
            description: "Where mysticism meets entrepreneurship and manifestation.",
            longDescription: "Brandon bridges the gap between spiritual awakening and worldly success. Conversations about consciousness, reality creation, and the nature of the universe. Features entrepreneurs, scientists, and mystics. For those who want to awaken AND succeed in the world. Positive vibes meets deep truth.",
            category: .mysticism,
            coverColor: .blue,
            icon: "🌌",
            spotifyURL: "https://open.spotify.com/show/cosmic-consciousness",
            applePodcastsURL: "https://podcasts.apple.com/podcast/cosmic-consciousness",
            websiteURL: nil,
            keyTopics: ["Manifestation", "Reality Creation", "Consciousness", "Success", "Universe", "Entrepreneurship"],
            bestFor: [
                "Spiritual entrepreneurs",
                "Manifestation practitioners",
                "Those blending business and spirit",
                "Optimistic awakeners"
            ],
            sampleEpisodes: [
                SampleEpisode(title: "Creating Your Reality", description: "The mechanics of manifestation", duration: "58 min"),
                SampleEpisode(title: "Consciousness and Business", description: "Building an awakened company", duration: "52 min"),
                SampleEpisode(title: "The Simulation Theory", description: "Are we in a cosmic video game?", duration: "65 min")
            ],
            vibe: "Manifest and awaken",
            difficultyLevel: 2,
            isTopPick: false
        ),
        
        AwakeningPodcast(
            name: "Human Design with Jenna Zoe",
            host: "Jenna Zoe",
            description: "Using your energetic blueprint for aligned living.",
            longDescription: "Human Design is like astrology meets the I Ching meets chakras meets quantum physics. Jenna makes this complex system accessible. Discover your type, strategy, and authority for making aligned decisions. It's a map of your unique energy—how you're designed to operate. Engineers will appreciate the systematic approach.",
            category: .mysticism,
            coverColor: .pink,
            icon: "🔷",
            spotifyURL: "https://open.spotify.com/show/human-design-jenna",
            applePodcastsURL: "https://podcasts.apple.com/podcast/human-design",
            websiteURL: "https://jennazoe.com",
            keyTopics: ["Human Design", "Energy Types", "Decision Making", "Alignment", "Relationships", "Career"],
            bestFor: [
                "System lovers",
                "Those making major life decisions",
                "Self-discovery enthusiasts",
                "People feeling out of alignment"
            ],
            sampleEpisodes: [
                SampleEpisode(title: "Intro to Human Design", description: "The basics of your energetic blueprint", duration: "45 min"),
                SampleEpisode(title: "The 5 Energy Types", description: "Generators, Projectors, Manifestors, Reflectors, MG", duration: "52 min"),
                SampleEpisode(title: "Making Aligned Decisions", description: "Using your authority for clarity", duration: "48 min")
            ],
            vibe: "Your energetic operating manual",
            difficultyLevel: 3,
            isTopPick: false
        ),
        
        // MARK: - PHILOSOPHY
        
        AwakeningPodcast(
            name: "Making Sense",
            host: "Sam Harris",
            description: "Meditation meets rationality meets hard conversations.",
            longDescription: "Sam Harris is a neuroscientist, philosopher, and longtime meditator. His podcast bridges hardcore rationality with genuine spiritual inquiry. Not afraid to tackle controversial topics. His Waking Up app is one of the most rigorous meditation programs available. For those who want spirituality without abandoning reason.",
            category: .philosophy,
            coverColor: .gray,
            icon: "🧩",
            spotifyURL: "https://open.spotify.com/show/making-sense",
            applePodcastsURL: "https://podcasts.apple.com/podcast/making-sense",
            websiteURL: "https://samharris.org",
            keyTopics: ["Meditation", "Neuroscience", "Philosophy", "Ethics", "AI", "Consciousness"],
            bestFor: [
                "Rationalists interested in meditation",
                "Scientists and skeptics",
                "Those who want rigorous spirituality",
                "Philosophy lovers"
            ],
            sampleEpisodes: [
                SampleEpisode(title: "The Nature of Consciousness", description: "What neuroscience reveals about awareness", duration: "85 min"),
                SampleEpisode(title: "Free Will and the Self", description: "Do you really make choices?", duration: "78 min"),
                SampleEpisode(title: "Meditation and the Ego", description: "What happens when you look for the self", duration: "92 min")
            ],
            vibe: "Enlightenment for rationalists",
            difficultyLevel: 4,
            isTopPick: false
        ),
        
        AwakeningPodcast(
            name: "Philosophize This!",
            host: "Stephen West",
            description: "Philosophy made accessible and entertaining.",
            longDescription: "Stephen West breaks down the history of philosophy in engaging, story-like episodes. From ancient Greeks to modern consciousness philosophers. Understanding how humans have grappled with big questions provides context for your own inquiry. The foundation that makes spiritual teachings make sense.",
            category: .philosophy,
            coverColor: .brown,
            icon: "📚",
            spotifyURL: "https://open.spotify.com/show/philosophize-this",
            applePodcastsURL: "https://podcasts.apple.com/podcast/philosophize-this",
            websiteURL: "https://philosophizethis.org",
            keyTopics: ["Philosophy History", "Big Questions", "Ethics", "Existentialism", "Eastern Philosophy", "Modern Thought"],
            bestFor: [
                "Philosophy beginners",
                "Context seekers",
                "Story lovers",
                "Those building a foundation"
            ],
            sampleEpisodes: [
                SampleEpisode(title: "Buddha and the Origins of Buddhism", description: "Philosophy behind the religion", duration: "35 min"),
                SampleEpisode(title: "Alan Watts and Eastern Philosophy", description: "The bridge builder", duration: "42 min"),
                SampleEpisode(title: "The Meaning of Life", description: "How philosophers have answered the big one", duration: "38 min")
            ],
            vibe: "Philosophy for everyone",
            difficultyLevel: 2,
            isTopPick: false
        )
    ]
}
