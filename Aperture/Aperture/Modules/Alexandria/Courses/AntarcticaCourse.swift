// AntarcticaCourse.swift
import SwiftUI

enum AntarcticaCourse {
  static let course = AlexandriaCourse(
    id: "antarctica", title: "Antarctica — Beyond the Ice Wall", subtitle: "The Final Mystery",
    icon: "snowflake", colorHex: "#3498DB", tier: 5, isPremium: false, isUltraPremium: true,
    modules: [
      ACModule(
        id: "ant1", number: 1, title: "Why 58 Nations Agreed to Keep You Out",
        subtitle: "The Antarctic Treaty decoded", icon: "lock.shield.fill",
        lessons: [
          ACLesson(
            id: "ant1_1", title: "The Most Protected Place on Earth",
            content: """
              **Antarctica. Land of eternal cold and impossible silences.**

              Not just an inhospitable continent. Potentially a **barrier** protecting something humanity isn't ready to encounter.

              **The Antarctic Treaty (1959):** 58 nations — many of them bitter enemies during the Cold War — signed an unprecedented agreement. No military operations. No mining. No territorial claims enforced. No private exploration beyond approved scientific missions.

              **In the entire history of geopolitics, enemies have NEVER cooperated on restricting access to a "barren" continent.**

              Why? What requires the United States, Russia, China, the UK, France, and 53 other nations to set aside their differences and agree: "Nobody goes there freely"?

              **The Threads:**

              | Evidence | Year | Significance |
              |----------|------|-------------|
              | **Piri Reis Map** | 1513 | Shows Antarctic coast ICE-FREE with coastline accuracy not confirmed until 1958 seismic surveys |
              | **German Antarctic Expedition** | 1938-39 | The Nazi regime sent an expedition to claim territory ("Neuschwabenland") — part of a broader pattern of fascist powers seeking strategic and ideological advantages. Not mysterious. Deeply evil regime, but the question of WHY Antarctica specifically remains. |
              | **Operation Highjump** | 1946-47 | Admiral Byrd's expedition: 4,700 military personnel, 13 ships, 33 aircraft — for "science"? |
              | **Admiral Byrd interviews** | 1947+ | Referenced "lands beyond the pole" and "craft that could fly pole to pole with tremendous speed" |
              | **Antarctic Treaty signed** | 1959 | 58 nations agree to restrict ALL access — unprecedented in human history |
              | **Lake Vostok discovered** | 1996 | Liquid lake sealed under 4km of ice for 15-20 MILLION years — what lives in it? |
              | **Pyramid structures in satellite imagery** | 2016 | Google Earth anomalies in the Ellsworth Mountains |

              🔥 **The questions that float in the mind: What lies beneath the ice? Other lands? Other oceans? Other realms of life and consciousness? Are we facing a physical limit — or a symbolic threshold that reminds us that not everything on Earth is destined to be discovered?**
              """,
            keyInsight:
              "58 nations — including enemies — agreed to restrict access to Antarctica. In all of human history, this level of cooperation on limiting access to 'nothing' has never happened.",
            practice:
              "Read the Antarctic Treaty (freely available). Note what it restricts and what it doesn't explain. Then ask: what would make 58 countries cooperate on keeping a secret?",
            interactiveElement: .timeline(events: [
              (
                year: "1513", event: "Piri Reis Map created",
                significance: "Shows ice-free Antarctic coast — impossible knowledge for the era"
              ),
              (
                year: "1938-39", event: "German Antarctic Expedition",
                significance:
                  "Nazi regime claims territory — evil regime, but why Antarctica specifically?"
              ),
              (
                year: "1946-47", event: "Operation Highjump",
                significance: "4,700 military personnel for 'scientific' research"
              ),
              (
                year: "1947", event: "Admiral Byrd's testimony",
                significance: "'Lands beyond the pole' and high-speed craft referenced"
              ),
              (
                year: "1959", event: "Antarctic Treaty signed",
                significance: "58 nations restrict ALL access — unprecedented"
              ),
              (
                year: "1996", event: "Lake Vostok discovered",
                significance: "Liquid lake sealed for 15-20 million years under 4km of ice"
              ),
              (
                year: "2016", event: "Pyramid anomalies spotted",
                significance:
                  "Satellite imagery reveals geometric structures in Ellsworth Mountains"
              ),
            ]))
        ]),
      ACModule(
        id: "ant2", number: 2, title: "Agartha — The Inner World",
        subtitle: "What ancient traditions say lies beneath", icon: "globe.central.south.asia.fill",
        lessons: [
          ACLesson(
            id: "ant2_1", title: "The Subterranean Kingdom",
            content: """
              **According to esoteric tradition, Agartha is not a myth.**

              It is a subterranean kingdom connected to the surface through secret passages, guarded by nature and the silence of centuries. Multiple traditions describe it:

              **Tibetan Buddhism:** Shambhala — a hidden kingdom accessible only to the pure of heart, located beneath the mountains. The Kalachakra Tantra describes it as a realm of advanced beings.

              **Hindu Tradition:** Patala — the subterranean realms beneath the earth, inhabited by Nagas (serpent beings of great wisdom).

              **Greek Mythology:** Hades — not just a realm of death, but an entire underworld with its own geography, rivers, and inhabitants.

              **Hollow Earth Theory (Admiral Byrd's accounts):** Byrd allegedly described finding a "land beyond the pole" — warm, green, with unknown animal life. His diary (debated in authenticity) describes being escorted by "flugleräder" (wing-wheel craft) to meet an advanced civilization.

              **The Piri Reis Map Connection:**
              The 1513 map shows Antarctica's coastline as it appeared WITHOUT ice. Modern seismic surveys didn't confirm this accuracy until 1958. How did a 16th-century Turkish admiral possess knowledge that required 20th-century technology to verify?

              The hypothesis: ancient civilizations mapped Antarctica when it was ice-free (12,000+ years ago). This knowledge was preserved in now-lost source maps that Piri Reis referenced.

              **The question isn't just what's under the ice.** It's what KNOWLEDGE about what's under the ice has been deliberately suppressed — and by whom.

              🔥 **Perhaps beyond that wall lies the truth that reminds us: the world is more vast and mysterious than we have been taught. And perhaps that's exactly why they don't want us to look.**
              """,
            keyInsight:
              "Multiple ancient traditions describe subterranean kingdoms beneath the earth. The Antarctic Treaty restricts access to the one place on Earth where such entrances might exist.",
            practice:
              "This module doesn't end with answers. It ends with mystery. Sit with the not-knowing. The most powerful spiritual state is the one that stays curious without needing to resolve."
          )
        ]),
    ],
    sources: [
      "The Antarctic Treaty (1959) — full text", "Piri Reis Map (Topkapi Palace Museum, Istanbul)",
      "Charles Hapgood, \"Maps of the Ancient Sea Kings\"",
      "Admiral Byrd's expedition records and interviews", "Lake Vostok research (Nature, 2012)",
      "Graham Hancock, \"Magicians of the Gods\"", "Kalachakra Tantra — Shambhala references",
    ],
    dragonComment:
      "The most protected, most restricted, most cooperated-on place on Earth is supposedly empty. In the history of power, nobody locks a door to an empty room. 🐉"
  )
}
