# APERTURE - IMPLEMENTATION ROADMAP
## Dynamic Running List of Improvements

**Last Updated:** February 9, 2026  
**Current Version:** MVP (1.0)

---

# LEGEND

| Status | Meaning |
|--------|---------|
| ✅ | Completed |
| 🔄 | In Progress |
| 📋 | Planned |
| 🔮 | Future |
| 🚫 | Blocked |

---

# SPRINT: CURRENT (Feb 2026)

## ✅ COMPLETED THIS SPRINT

| # | Feature | Status | Notes |
|---|---------|--------|-------|
| 1 | Consciousness Assessment System | ✅ | 10 archetypes, personalized paths |
| 2 | Pistis Sophia Course | ✅ | 13 modules, 52 lessons |
| 3 | The 11th Dimension Course | ✅ | 10 modules, M-theory framework |
| 4 | The Ujat Code Course | ✅ | 9 modules, 7-breath protocol |
| 5 | Fastlane Setup | ✅ | TestFlight distribution ready |
| 6 | Build Error Fixes | ✅ | All naming conflicts resolved |
| 7 | Feature Flag System | ✅ | MVP versioning support |
| 8 | Startup Optimizer | ✅ | Performance tracking |
| 9 | SwiftLint Config | ✅ | Code quality enforcement |
| 10 | Feature Audit Document | ✅ | All features documented |

---

# BACKLOG: HIGH PRIORITY

## 🔄 IN PROGRESS

| # | Feature | Status | Target | Notes |
|---|---------|--------|--------|-------|
| 11 | Premium Paywall | 📋 | v1.1 | Revenue enablement |
| 12 | Course Progress Persistence | ✅ | v1.0 | Save user progress |
| 13 | Dragon Evolution Logic | 📋 | v1.1 | Complete XP system |

## 📋 PLANNED - NEXT SPRINT

| # | Feature | Priority | Target | Notes |
|---|---------|----------|--------|-------|
| 14 | Onboarding Flow | HIGH | v1.0 | First-time user experience |
| 15 | Push Notifications | HIGH | v1.1 | Engagement driver |
| 16 | Deep Linking | MEDIUM | v1.1 | Share courses |
| 17 | Analytics Integration | MEDIUM | v1.1 | User behavior tracking |
| 18 | Crash Reporting (Sentry) | MEDIUM | v1.1 | Production monitoring |

---

# BACKLOG: FEATURES BY VERSION

## MVP (v1.0) - Launch Checklist

| Feature | Status | Required for Launch |
|---------|--------|---------------------|
| Core navigation | ✅ | YES |
| Dragon Companion (basic) | ✅ | YES |
| Course Hub | ✅ | YES |
| Assessment | ✅ | YES |
| 5+ courses available | ✅ | YES |
| Psyop Scanner | ✅ | YES |
| Basic Arsenal tools | ✅ | YES |
| Onboarding flow | ✅ | YES |
| App Store assets | 📋 | YES |
| Privacy Policy | 📋 | YES |
| Terms of Service | 📋 | YES |

---

## v1.1 - Premium & Polish

| Feature | Status | Notes |
|---------|--------|-------|
| Premium paywall | 📋 | StoreKit 2 |
| Course progress saving | 📋 | UserDefaults + CloudKit |
| Dragon full evolution | 📋 | All stages unlocked |
| Offline downloads | 📋 | Core Data caching |
| Digital Security guide | 📋 | Content exists |
| Government Tracker | 📋 | UI polish needed |
| GodMode Gates 3-7 | 📋 | Premium content |
| Emerald Tablets course | 📋 | Premium content |
| Birth Chart calculator | 📋 | Interactive feature |

---

## v1.2 - Community

| Feature | Status | Notes |
|---------|--------|-------|
| AwakeTogether hub | 🔮 | Social features |
| Community forums | 🔮 | Discussion threads |
| Local groups | 🔮 | Geographic matching |
| Mentorship matching | 🔮 | Premium feature |
| Mandela Effects tracker | 🔮 | User submissions |
| Sacred Etymology dict | 🔮 | Searchable database |

---

## v1.3 - Advanced

| Feature | Status | Notes |
|---------|--------|-------|
| Multiple dragons | 🔮 | Premium+ feature |
| Voice interaction | 🔮 | Speech recognition |
| URL scanning | 🔮 | Auto-analyze articles |
| Feed scanner | 🔮 | Social media analysis |
| Audio versions | 🔮 | Text-to-speech |
| AI insights | 🔮 | Personalized guidance |

---

## v2.0 - Platform Expansion

| Feature | Status | Notes |
|---------|--------|-------|
| Cloud sync (Supabase) | 🔮 | Cross-device sync |
| watchOS app | 🔮 | Quick practices |
| visionOS app | 🔮 | Immersive courses |
| AR previews | 🔮 | Spatial notes |
| Pattern forecasting | 🔮 | AI predictions |
| Synchronicity log | 🔮 | Pattern tracking |

---

# TECHNICAL DEBT

| Item | Priority | Notes |
|------|----------|-------|
| Modularize into Swift Packages | LOW | When codebase grows |
| Bazel build system | LOW | For faster CI |
| Localization (Spanish) | MEDIUM | After v1.1 |
| Accessibility audit | MEDIUM | VoiceOver support |
| Unit test coverage | MEDIUM | Target 60% |
| UI test automation | LOW | After v1.2 |
| Performance profiling | MEDIUM | Instruments pass |

---

# CONTENT BACKLOG

## Courses to Create

| Course | Priority | Category |
|--------|----------|----------|
| Nervous System Mastery | HIGH | Practical |
| Shadow Integration | HIGH | Consciousness |
| Dark Night Navigation | HIGH | Consciousness |
| Divide & Conquer | MEDIUM | Systems |
| Media Literacy | MEDIUM | Truth |
| Attention Economy | MEDIUM | Systems |
| Empath Protection | MEDIUM | Practical |

## Library Content Needed

| Content | Priority |
|---------|----------|
| More Gnostic texts | MEDIUM |
| Hermetic corpus | LOW |
| Vedic texts | LOW |
| Buddhist sutras | LOW |

---

# METRICS & GOALS

## Launch Metrics (v1.0)

| Metric | Target |
|--------|--------|
| Cold startup time | <500ms |
| First paint | <200ms |
| Crash-free rate | >99.5% |
| App size | <100MB |

## Engagement Metrics (v1.1+)

| Metric | Target |
|--------|--------|
| D1 retention | >40% |
| D7 retention | >20% |
| Course completion | >30% |
| Premium conversion | >5% |

---

# NOTES

## Decisions Made
- Feature flags over feature branches (simpler)
- UserDefaults for MVP, CloudKit for v1.1+
- No modularization until codebase warrants it
- SwiftLint warnings, not errors (developer velocity)
- Dragon Ball course stays free (entry point)

## Open Questions
- [ ] Which payment provider? (StoreKit 2 vs RevenueCat)
- [ ] Community moderation strategy?
- [ ] Content update frequency?
- [ ] Beta tester program structure?

---

**Next Review:** Weekly on Mondays
