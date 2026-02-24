// BaphometMirrorCourse.swift — FULLY EXPANDED: 3 modules, 8 lessons
import SwiftUI
struct BaphometMirrorCourse {
    static let course = AlexandriaCourse(
        id: "baphomet_mirror", title: "Baphomet — The Mirror",
        subtitle: "The Truth Behind the Symbol of Fear",
        icon: "pentagon.fill", colorHex: "#9D4EDD",
        tier: 3, isPremium: false, isUltraPremium: false,
        modules: [

            ACModule(id: "bm1", number: 1, title: "They Made You Fear Your Own Reflection", subtitle: "Decode the anatomy of Baphomet", icon: "eye.trianglebadge.exclamationmark.fill", lessons: [

                ACLesson(id: "bm1_1", title: "The Symbol They Weaponized",
                    content: """
**Baphomet.** Say the name and watch people flinch.

For centuries, this image has been weaponized as the ultimate symbol of evil — the goat-headed demon, the sign of Satan, the proof that darkness walks among us. Parents warn children about it. Churches condemn it. It appears in horror films as shorthand for the presence of the adversary.

But what if every element of the figure was a **teaching**, not a threat?

**The Origin — Eliphas Lévi (1856):**
The most famous depiction of Baphomet was not discovered in a dark temple or unearthed from an ancient satanic text. It was drawn by Eliphas Lévi — a French Catholic scholar turned occultist — in 1856, for his book "Dogme et Rituel de la Haute Magie" (Dogma and Ritual of High Magic).

Lévi was not a Satanist. He was a former Catholic seminarian who had been denied priesthood and spent his life attempting to synthesize Christian mysticism, Kabbalah, Hermeticism, and Neoplatonic philosophy into a unified system. His Baphomet was an explicitly philosophical image — his attempt to compress the entirety of Hermetic wisdom into a single visual composition.

He wrote explicitly about what each element meant. It was not a secret. He explained it.

The Church's decision to call this image "the devil" was a choice — not a discovery.

**Why It Was Demonized:**
Before Lévi's 1856 image became universally associated with evil, there was the Knights Templar accusation of 1307. When King Philip IV of France — deeply in debt to the Templars — wanted to seize their wealth and destroy the order, he needed a criminal charge. He accused them of worshipping a heretical idol called "Baphomet."

The testimonies about what Baphomet looked like were extracted under torture — and contradict each other completely. Some described a head. Some described a skull. Some described a cat. Some described a beam of light. The inconsistency is exactly what you'd expect from confessions invented under duress, not from genuine witnesses describing a real object.

The Templars were executed. Their wealth was seized. The accusation had served its purpose.

The word "Baphomet" then lay dormant for centuries until Lévi chose it as the name for his philosophical composite image in 1856. From there, it entered popular imagination as synonymous with Satanism — a connection that has no historical basis.

**The Full Symbol Decoded:**

| Element | Fear-Based Reading | Accurate Hermetic Reading |
|---------|-------------------|--------------------------|
| 🔥 **Flame on head** | Devil's fire, hellfire | Illumination — the divine spark, awakened pineal gland |
| ☝️ **One hand up, one down** | Satanic gesture | "As Above, So Below" — Hermetic correspondence |
| 🪽 **Wings** | Fallen angel | Transcendence of duality, the capacity to rise |
| 🐐 **Goat head** | The Devil | Capricorn archetype — the mountain goat ascending to higher ground |
| ⚧ **Breasts and phallus** | Perversion, transgression | Conjunction of masculine and feminine — wholeness, non-duality |
| 🐍 **Caduceus staff** | Serpent of evil | Kundalini — twin energies rising (same symbol as medicine's caduceus) |
| ⭐ **Pentagram on forehead** | Satanic star | Five elements in harmony — spirit governing matter |
| 🌙 **Moon crescents** | Occult symbol | Lunar cycles — feminine principle, intuition, the unconscious |
| 💡 **Torch between the arms** | Hellfire | Intelligence — the light of consciousness between brain hemispheres |

🔥 **They didn't just demonize a symbol. They demonized the entire vocabulary of inner development — the language in which Hermetic philosophy, Kabbalah, and Gnostic wisdom described the complete human being. Baphomet is a portrait of your potential for wholeness. That's exactly why it had to become the face of evil.**
""",
                    keyInsight: "Baphomet was created by Eliphas Lévi in 1856 as an explicit Hermetic philosophical composition — every element documented and explained. The medieval 'Baphomet worship' accusation against the Templars was extracted under torture and produced contradictory descriptions, serving as justification for King Philip IV to seize Templar wealth. The image was demonized because it depicts the complete human being — the conjunction of opposites that the Church needed to keep separate.",
                    practice: "Find Eliphas Lévi's original Baphomet illustration and his written explanation of each element (in 'Dogma and Ritual of High Magic,' available in English translation). Read his own words about what he drew. Write: how does the image change when you read the creator's explanation vs. the Church's interpretation? Which reading takes more courage to sit with?",
                    interactiveElement: .symbolDecoder(elements: [
                        (symbol: "🔥 Flame on Head", fear: "Devil horns, hellfire", truth: "Illumination — the divine spark, the awakened pineal gland, intelligence"),
                        (symbol: "☝️ One Hand Up, One Down", fear: "Satanic gesture of command", truth: "'As Above, So Below' — the Hermetic principle of universal correspondence"),
                        (symbol: "🪽 Wings", fear: "Fallen angel, demonic flight", truth: "Transcendence — the ability to rise above duality and limited perspective"),
                        (symbol: "🐐 Goat Head", fear: "The Devil, Pan, the adversary", truth: "Capricorn — the mountain goat who ascends from depth to height through persistence"),
                        (symbol: "⚧ Breasts + Phallus", fear: "Perversion, gender transgression", truth: "Hieros Gamos — sacred marriage of masculine and feminine principles into wholeness"),
                        (symbol: "🐍 Caduceus Staff", fear: "Serpent of evil, demonic power", truth: "Kundalini — twin energies spiraling up (same symbol medicine uses for healing)"),
                        (symbol: "⭐ Pentagram on Forehead", fear: "Satanic star, mark of the beast", truth: "Five elements (earth/water/fire/air/spirit) in harmony — spirit governing matter"),
                        (symbol: "🌙 Moon Crescents on Arms", fear: "Occult lunar symbol", truth: "Feminine principle, intuition, the cyclical nature of consciousness"),
                        (symbol: "💡 Torch Between Horns", fear: "Hellfire, infernal illumination", truth: "Intelligence — the light of consciousness held between the two brain hemispheres")
                    ])
                ),

                ACLesson(id: "bm1_2", title: "The Templar Connection — Sophia in Disguise",
                    content: """
**The word "Baphomet" itself contains a hidden truth that the Inquisition's prosecutors couldn't have known they were suppressing.**

**The Three Competing Etymologies:**

**Theory 1 — Greek: Baptism of Wisdom**
*Baphe + Metis* (Greek) = "Baptism of Wisdom." The Templars, who spent decades in the Holy Land absorbing wisdom traditions from both Islamic scholarship and surviving Gnostic and Hermetic schools, may have been practicing forms of initiation they understood as "wisdom baptism" — entry into direct inner knowing rather than doctrinal acceptance.

**Theory 2 — Arabic slander: Muhammad corruption**
Some historians propose that "Baphomet" is a corruption of "Mahomet" (the French form of Muhammad) — the accusation being that the Templars had secretly converted to Islam. This would have been a useful political smear in 13th-century Europe. The problem: none of the tortured Templars described anything that looks like Islamic practice, and Templar churches show no Islamic architectural or decorative influence.

**Theory 3 — The Atbash Bombshell**
Scholar Hugh Schonfield (author of "The Passover Plot") applied the Atbash cipher — a Hebrew encryption method used by the Essene community at Qumran — to the word "Baphomet."

The Atbash cipher is simple: the last letter of the Hebrew alphabet is substituted for the first, the second-to-last for the second, and so on. The Essenes used it to encode sensitive words in the Dead Sea Scrolls.

Applied to "Baphomet" (transliterated into Hebrew): the result is **SOPHIA**.

Sophia. The Greek word for Wisdom. The divine feminine in Gnostic cosmology — the emanation of the divine that contains the fullness of wisdom. In Gnostic theology, Sophia's fall from the Pleroma (divine fullness) and her return is the central narrative of cosmic history. She is both the source of gnosis and its goal.

The Templars may have been worshipping Sophia — divine wisdom — encoded in the word "Baphomet" using the Essene encryption method that they could have encountered through their proximity to the Dead Sea area in the Holy Land.

**Why This Changes Everything:**
If the Templar "Baphomet" was encrypted "Sophia," then:
- The Templars were not heretical Satanists — they were Sophia-mystics, practitioners of a Gnostic wisdom tradition
- The Inquisition's torture extracted confessions of "Baphomet worship" without the prosecutors understanding what they were extracting confessions to
- The destruction of the Templars was the destruction of a major Western Gnostic wisdom school — the same institutional violence applied to Cathar Gnosticism in the Albigensian Crusade (1209-1229)
- The demonization of "Baphomet" was the demonization of "Sophia" — the divine feminine wisdom principle

The Church spent the medieval period systematically destroying every institution that honored the divine feminine outside of its controlled Marian devotion. The Templars and their encoded Sophia were one more casualty.

**The Hermetic Completion:**
Lévi's 1856 Baphomet image now takes on additional depth: by naming his Hermetic philosophical composite "Baphomet," he was consciously or unconsciously connecting it to the Sophia tradition — the image as an embodiment of divine wisdom, which includes the conjunction of all opposites (masculine/feminine, above/below, animal/divine).

The mirror of the title is precise. Baphomet shows you the complete human being — all of your opposites integrated, all of your polarities held in creative tension, all of your potential for conscious wholeness.

🔥 **They literally encrypted "Wisdom" in the name — using a cipher only the initiated would recognize — and then told everyone it meant "devil." Sophia became Baphomet became Satan. The most complete symbol of human wholeness became the most feared symbol in Western culture. That's not coincidence. That's a very specific operation.**
""",
                    keyInsight: "Hugh Schonfield's Atbash cipher application to 'Baphomet' produces 'Sophia' — the Gnostic divine feminine principle of wisdom. The Templars may have been Sophia-mystics using Essene encryption to protect their practice from Inquisition. The medieval destruction of the Templars was another episode in the systematic elimination of Gnostic wisdom schools. Lévi's 1856 image, named 'Baphomet,' unknowingly completed the circle: Sophia = Baphomet = the portrait of human wholeness.",
                    practice: "Research the Atbash cipher — how it works, where it appears in the Dead Sea Scrolls, how Schonfield applied it to 'Baphomet.' Then write: is this a convincing etymology? What would it require to be true (Templar access to Essene knowledge, deliberate encoding)? What is the strongest counter-argument? Practice holding both possibilities."
                )
            ]),

            ACModule(id: "bm2", number: 2, title: "The Conjunction of Opposites", subtitle: "What the image actually teaches about human wholeness", icon: "arrow.left.arrow.right", lessons: [

                ACLesson(id: "bm2_1", title: "The Sacred Marriage — Masculine and Feminine",
                    content: """
**The most confronting element of Baphomet's image — for most people — is the combination of both masculine and feminine anatomical features: breasts and phallus simultaneously.**

This is the element the Church calls "perversion." It is the element every major esoteric tradition calls the highest teaching.

**The Hieros Gamos:**
"Hieros Gamos" (Greek: sacred marriage) is one of the oldest religious concepts in human history — the sacred union of masculine and feminine principles, typically enacted between sky and earth deities, whose conjunction produces all of existence.

The hieros gamos appears in:
- **Sumer:** Inanna and Dumuzid — the annual sacred marriage ritual enacted by the king and high priestess
- **Egypt:** The union of Osiris (masculine principle) and Isis (feminine principle) that produces Horus (the resulting consciousness)
- **Alchemy:** The *coniunctio* — the union of Sol (sun/masculine) and Luna (moon/feminine) — the central image of alchemical transformation
- **Kabbalah:** The sacred union of Tiferet (the masculine divine heart) and the Shekhinah (the divine feminine presence)
- **Gnosticism:** The syzygy — paired masculine/feminine principles whose union restores the Pleroma (divine fullness)
- **Tantra:** The union of Shiva (pure consciousness) and Shakti (creative energy) — whose union is the ground of all reality

In every tradition: the conjunction of the masculine and feminine principles within a single being is the mark of the most complete spiritual development. Not the victory of one over the other — their integration.

**The Psychological Reading — Jung's Anima/Animus:**
Carl Jung identified the masculine and feminine principles as fundamental structures of the psyche that exist in both men and women:
- The **anima** is the feminine aspect within a man — his capacity for relatedness, intuition, receptivity, and depth of feeling
- The **animus** is the masculine aspect within a woman — her capacity for direction, assertion, rational clarity, and engagement with the world

Psychological health, in Jungian analysis, requires the integration of both — not the suppression of one in favor of the culturally sanctioned gender expression. A man who has suppressed his anima is brittle, relational tone-deaf, and cut off from his intuitive depths. A woman who has suppressed her animus lacks the assertive clarity to act effectively on her own behalf.

**The Baphomet Conjunction:**
What Lévi encoded in Baphomet's both/and anatomy was the completion of the inner sacred marriage — a being who has integrated the masculine and feminine principles and therefore does not experience them as opposites to be managed, but as a unified creative field.

This is not confusion about biological sex. It is clarity about the spectrum of inner qualities that every human consciousness contains and must integrate.

**The Modern Resistance:**
Contemporary culture is deeply uncomfortable with Baphomet's anatomical both/and — and the discomfort runs in multiple directions. Conservative communities see the image as sexual transgression. Progressive communities sometimes see it as appropriation of gender fluidity for occult ends.

Both reactions miss the original meaning: this is not a statement about gender identity. It is a statement about the completeness of inner development. The fully developed human being — the one who has reached what every tradition calls the highest stage — has integrated both the assertive and the receptive, the active and the contemplative, the generative and the nurturing.

🔥 **Baphomet's both/and anatomy is the most radical statement in Western esoteric philosophy: the whole human being is not a man or a woman, but the sacred marriage of both within a single consciousness. The Church called it perversion because an institution that required the dominance of masculine authority over feminine receptivity could not afford to let that image stand.**
""",
                    keyInsight: "The Hieros Gamos (sacred marriage) — the conjunction of masculine and feminine principles — appears in Sumer, Egypt, alchemy, Kabbalah, Gnosticism, and Tantra as the mark of the highest spiritual development. Jung's anima/animus framework provides the psychological equivalent. Baphomet's both/and anatomy encodes the complete inner integration of masculine and feminine — not gender identity, but the fullness of human psychological development.",
                    practice: "Inventory your own masculine and feminine qualities — not based on gender norms, but based on these specific pairs: assertive/receptive, analytical/intuitive, active/contemplative, directive/nurturing, boundary-setting/relational. Which cluster is more developed in you? Which is suppressed? What would it cost you to develop the suppressed cluster? What would it give you?"
                ),

                ACLesson(id: "bm2_2", title: "As Above, So Below — The Hermetic Gesture",
                    content: """
**Baphomet's most recognizable feature — after the goat head — is the gesture: one hand pointing upward, one hand pointing downward.**

This is not a power gesture. It is not a curse. It is the single most important principle in Hermetic philosophy, compressed into a physical position.

**"As Above, So Below":**
The full text from the Emerald Tablet: *"That which is below is like that which is above, and that which is above is like that which is below, to accomplish the miracles of the One Thing."*

The gesture means: I hold both in relationship simultaneously. The upper world (spirit, consciousness, the divine) and the lower world (matter, body, the material) are not separate. They mirror each other. What happens in one is reflected in the other.

**The Hermetic Axiom in Practice:**

*In psychology:* What you experience externally reflects what is happening internally. The patterns that appear in your relationships, your work, your circumstances — these are mirrors of your inner state. Change the inner; the outer responds.

*In physics:* The same mathematical structures appear at every scale of reality — from quantum mechanics to galactic structure. The laws that govern the very small govern the very large. Scale doesn't change the pattern.

*In consciousness:* Your body reflects your beliefs and emotional patterns (psychosomatic medicine). Your outer life reflects your inner commitments (the behavioral coherence of people who live their values). Your relationships reflect your relationship with yourself.

*In spiritual practice:* Meditation changes the brain (inner changes the above). The brain changes perception (above changes the below). Changed perception produces changed behavior. Changed behavior produces changed circumstances.

**The Gesture as Commitment:**
When Baphomet makes the up/down gesture, the image is not making a claim about magical power. It is making a commitment: to hold the awareness of both dimensions simultaneously — to never collapse into pure spiritual transcendence (pointing only up) or pure material obsession (pointing only down), but to maintain the bridge.

This is the actual difficulty of the spiritual life. Pure transcendence is available — meditation can produce states of consciousness that feel completely disconnected from material reality, pure bliss, pure awareness. But the Hermetic tradition says this is incomplete. The point is not to escape matter. The point is to bring the spiritual awareness DOWN into full material embodiment — and to bring the material reality UP into conscious spiritual awareness.

As above, so below. Spirit in matter. Matter in spirit. Not one at the expense of the other.

**The Practical Test:**
A person who has integrated "as above, so below" can be identified by their coherence: their spiritual beliefs and their daily material choices align. Their inner commitments and their outer relationships align. Their values and their behaviors align.

This alignment is rare. It requires ongoing attention — the constant translation of spiritual understanding into material practice. The gesture is not a symbol of achievement. It is a symbol of committed ongoing practice.

🔥 **The gesture means: I am not a spiritual being tolerating a material existence, nor a material being occasionally visiting spiritual states. I am both, simultaneously, committed to the alignment of both. That commitment — maintained in ordinary moments as well as extraordinary ones — is the whole work. Baphomet's most famous gesture is its simplest teaching: keep the bridge open. Always.**
""",
                    keyInsight: "'As Above, So Below' — Baphomet's up/down gesture — is the Hermetic axiom that the spiritual and material dimensions mirror each other and must be held in simultaneous awareness. The spiritual practice it encodes is not transcendence (escape from matter) but coherence: the ongoing alignment of inner spiritual commitment and outer material expression. The gesture is not a symbol of power — it's a symbol of practice.",
                    practice: "Assess your own 'as above, so below' coherence in three areas: (1) What you believe spiritually and how you spend your money. (2) What you value in relationships and how you treat people when it's inconvenient. (3) What you say your purpose is and what you actually do with your hours. Write the gap honestly. The gap IS the practice — not as shame, but as precise information about where the work is."
                )
            ]),

            ACModule(id: "bm3", number: 3, title: "Baphomet as Your Mirror", subtitle: "The full image as a map for your own integration", icon: "person.fill.viewfinder", lessons: [

                ACLesson(id: "bm3_1", title: "What You Fear Is What You Haven't Integrated",
                    content: """
**The title of this course is "Baphomet — The Mirror." The name is the teaching.**

When most people see Baphomet for the first time, they feel fear, disgust, or revulsion. That reaction is not arbitrary. It is information.

**The Jungian Shadow:**
Carl Jung's concept of the Shadow — the aspects of ourselves that we have disowned, hidden, or failed to develop — operates through projection. Whatever we cannot consciously acknowledge within ourselves, we project onto the world outside us.

The Shadow is not always dark. It includes undeveloped positive qualities — gifts not actualized, capacities not expressed, wholeness not claimed.

When a person (or a culture) consistently reacts with strong negative emotion to a symbol, image, or type of person — that reaction is almost always a Shadow projection. The symbol is carrying something the person cannot yet face within themselves.

**What Baphomet's Elements Mirror:**

**The goat head:** Instinct, animal nature, the body's wisdom. If this frightens you — where have you rejected your animal nature? Where do you treat your body as dangerous, shameful, or untrustworthy?

**The androgynous body:** The full spectrum of inner qualities across the masculine/feminine continuum. If this disturbs you — which qualities in yourself are you suppressing because they cross gender boundaries? What capacities are you denying yourself?

**The pentagram on the forehead:** The primacy of consciousness over matter — spirit governing rather than being controlled by circumstance. If this feels threatening — where have you given up the possibility of your own consciousness governing your life?

**The flame of illumination:** The activated mind and consciousness. If this frightens you — what in yourself are you afraid to fully illuminate? What would rather stay in the dark?

**The serpent/caduceus:** The rising energy of consciousness through the body's energy centers. If this disturbs you — what is your relationship to your own life force, to your vitality, to the energy that runs through your physical existence?

**The Practice:**
Look at the full Baphomet image for several minutes without judgment. Notice which element produces the strongest reaction in you — positive or negative. Ask:

What does this element represent that I have disowned? Where in my life is this quality absent or suppressed? What would change if I allowed this aspect of myself to exist?

The element you react most strongly to is your most immediate Shadow material.

**The Liberation:**
When the Shadow is integrated — when the disowned aspects are acknowledged and given appropriate expression — the projection ceases. The symbol loses its power to frighten or fascinate.

A person who has genuinely integrated their animal nature doesn't fear the goat head. A person who has integrated their full spectrum of inner masculine and feminine qualities doesn't react to the androgynous body. A person who is genuinely illuminated doesn't project evil onto the flame.

Baphomet stops being the face of evil and becomes what Lévi intended: a portrait of the complete human being. You.

🔥 **Baphomet was made into the face of evil to prevent you from looking at it long enough to see your own reflection. Every element they demonized is an element of your wholeness. The fear it produces is the distance between who you currently are and who you are capable of becoming. The mirror is merciless. It is also loving. It shows you exactly what needs your attention.**
""",
                    keyInsight: "Strong emotional reactions to Baphomet's specific elements (goat head, androgynous body, pentagram, flame, serpent) are Shadow projections — each pointing to a specific aspect of wholeness the individual has disowned. Integration dissolves the projection: once the quality is consciously claimed, the symbol loses its power to frighten. Baphomet is merciless and loving in equal measure — it shows you precisely what needs attention.",
                    practice: "Do the full Baphomet Shadow Mirror practice: Find a clear image of Lévi's 1856 Baphomet. Sit with it for 5 minutes without judgment. Write which element produced the strongest reaction (fear, disgust, fascination, attraction). Then complete: 'This element represents _______ in me that I have disowned.' 'Where in my life is this quality absent?' 'What would I need to accept about myself to integrate this?' This is your direct shadow work assignment."
                )
            ])
        ],
        sources: [
            "Eliphas Lévi, \"Dogme et Rituel de la Haute Magie\" (1856) — original Baphomet image and explanation",
            "Knights Templar trial records (1307-1314) — torture-extracted Baphomet confessions",
            "Hugh Schonfield — Atbash cipher analysis producing 'Sophia'",
            "Carl Jung, \"Aion\" and \"Psychology and Religion\" — Shadow and projection theory",
            "The Emerald Tablet — 'As Above, So Below' full text",
            "Hieros Gamos traditions — Sumerian, Egyptian, Alchemical, Kabbalistic",
            "Inquisitorial trial records — Cathar persecution and Albigensian Crusade",
            "Heinrich Kramer, \"Malleus Maleficarum\" (1487) — institutional demonization framework"
        ],
        dragonComment: "They turned the portrait of your potential wholeness into the face of evil. The goat, the serpent, the flame, the masculine/feminine integration — every element they told you to fear is an element of your own consciousness they needed you to reject. Baphomet is the mirror. What you see in it is yourself. 🐉"
    )
}
