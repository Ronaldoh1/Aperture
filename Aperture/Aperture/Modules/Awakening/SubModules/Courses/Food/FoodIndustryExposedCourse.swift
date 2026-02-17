// FoodIndustryExposedCourse.swift
// What they're really feeding you
// The lies, the chemicals, the profit over health

import SwiftUI

struct FoodIndustryExposedCourse: View {
  var body: some View {
    ScrollView {
      VStack(spacing: 0) {
        // Header
        courseHeader

        // Shocking stats
        shockingStats

        // Lessons
        ForEach(Array(lessons.enumerated()), id: \.offset) { index, lesson in
          NavigationLink(destination: FoodLessonView(lesson: lesson, index: index + 1)) {
            lessonRow(lesson, index: index)
          }
        }

        // Banned elsewhere section
        bannedElsewhereSection

        // What to do
        whatToDoSection
      }
    }
    .background(Color.black.ignoresSafeArea())
    .navigationTitle("Food Industry Exposed")
    .navigationBarTitleDisplayMode(.inline)
  }

  private var courseHeader: some View {
    VStack(spacing: 16) {
      ZStack {
        Circle()
          .fill(Color.orange.opacity(0.2))
          .frame(width: 100, height: 100)

        Image(systemName: "fork.knife")
          .font(.system(size: 44))
          .foregroundColor(.orange)
      }

      Text("Food Industry Exposed")
        .font(.system(size: 24, weight: .bold))
        .foregroundColor(.white)

      Text("What they're really feeding you")
        .font(.system(size: 14))
        .foregroundColor(.gray)

      HStack {
        Text("10 Lessons")
          .font(.system(size: 12, weight: .medium))
          .foregroundColor(.gray)
        Spacer()
        Text("~75 min")
          .font(.system(size: 12, weight: .medium))
          .foregroundColor(.gray)
      }
      .padding(.horizontal)
    }
    .padding()
  }

  private var shockingStats: some View {
    VStack(spacing: 16) {
      Text("THE AMERICAN FOOD CRISIS")
        .font(.system(size: 12, weight: .black))
        .foregroundColor(.red)

      HStack(spacing: 12) {
        statBubble("73%", "of US adults\noverweight/obese")
        statBubble("10,000+", "additives allowed\nin US food")
        statBubble("3,000+", "banned in EU,\nlegal in US")
      }

      Text(
        "Americans are sicker and dying younger than people in other wealthy nations. The food supply is a major reason."
      )
      .font(.system(size: 12))
      .foregroundColor(.white.opacity(0.8))
      .multilineTextAlignment(.center)
    }
    .padding()
    .background(Color.red.opacity(0.1))
    .cornerRadius(16)
    .padding()
  }

  private func statBubble(_ value: String, _ label: String) -> some View {
    VStack(spacing: 4) {
      Text(value)
        .font(.system(size: 20, weight: .black))
        .foregroundColor(.red)
      Text(label)
        .font(.system(size: 9))
        .foregroundColor(.gray)
        .multilineTextAlignment(.center)
    }
    .frame(maxWidth: .infinity)
    .padding(.vertical, 12)
    .background(Color.white.opacity(0.05))
    .cornerRadius(10)
  }

  private func lessonRow(_ lesson: FoodLesson, index: Int) -> some View {
    HStack(spacing: 16) {
      ZStack {
        Circle()
          .fill(lesson.color.opacity(0.2))
          .frame(width: 48, height: 48)
        Text("\(index + 1)")
          .font(.system(size: 18, weight: .bold))
          .foregroundColor(lesson.color)
      }

      VStack(alignment: .leading, spacing: 4) {
        Text(lesson.title)
          .font(.system(size: 15, weight: .semibold))
          .foregroundColor(.white)
        Text(lesson.subtitle)
          .font(.system(size: 12))
          .foregroundColor(.gray)
      }

      Spacer()

      Image(systemName: "chevron.right")
        .foregroundColor(.gray)
    }
    .padding()
    .background(Color.white.opacity(0.03))
  }

  // MARK: - Banned Elsewhere

  private var bannedElsewhereSection: some View {
    VStack(alignment: .leading, spacing: 16) {
      HStack {
        Image(systemName: "exclamationmark.octagon.fill")
          .foregroundColor(.red)
        Text("BANNED IN OTHER COUNTRIES, LEGAL IN US")
          .font(.system(size: 14, weight: .black))
          .foregroundColor(.red)
      }

      VStack(spacing: 12) {
        bannedItem(
          "Potassium Bromate", "In bread", "Banned in EU, UK, Canada, China", "Linked to cancer")
        bannedItem(
          "Brominated Vegetable Oil (BVO)", "In sodas", "Banned in EU, Japan",
          "Affects thyroid, nervous system")
        bannedItem(
          "Titanium Dioxide", "In candy, frosting", "Banned in EU (2022)", "DNA damage concerns")
        bannedItem("Red Dye 3", "In candy, frosting", "Banned in EU", "Thyroid tumors in animals")
        bannedItem(
          "Azodicarbonamide", "In bread", "Banned in EU, Australia",
          "Respiratory issues, linked to cancer")
        bannedItem(
          "rBGH/rBST", "In milk", "Banned in EU, Canada, Japan", "Increases IGF-1 (cancer link)")
        bannedItem("Ractopamine", "In pork, beef", "Banned in 160+ countries", "Heart problems")
        bannedItem(
          "Chlorine-washed chicken", "Poultry", "Banned in EU", "Masks unsanitary conditions")
      }

      Text(
        "The EU uses the 'precautionary principle': if evidence suggests harm, ban it until proven safe. The US does the opposite: allow until proven harmful."
      )
      .font(.system(size: 11))
      .foregroundColor(.orange)
    }
    .padding()
    .background(Color.red.opacity(0.05))
    .cornerRadius(16)
    .padding(.horizontal)
  }

  private func bannedItem(_ name: String, _ found: String, _ banned: String, _ concern: String)
    -> some View
  {
    VStack(alignment: .leading, spacing: 4) {
      HStack {
        Text(name)
          .font(.system(size: 13, weight: .bold))
          .foregroundColor(.white)
        Spacer()
        Text(found)
          .font(.system(size: 10))
          .foregroundColor(.gray)
      }

      HStack {
        Text(banned)
          .font(.system(size: 10))
          .foregroundColor(.green)
        Text("•")
          .foregroundColor(.gray)
        Text(concern)
          .font(.system(size: 10))
          .foregroundColor(.red)
      }
    }
    .padding(10)
    .background(Color.white.opacity(0.05))
    .cornerRadius(8)
  }

  // MARK: - What To Do

  private var whatToDoSection: some View {
    VStack(alignment: .leading, spacing: 16) {
      HStack {
        Image(systemName: "leaf.fill")
          .foregroundColor(.green)
        Text("WHAT YOU CAN DO")
          .font(.system(size: 14, weight: .black))
          .foregroundColor(.green)
      }

      VStack(alignment: .leading, spacing: 10) {
        actionRow("Read ingredients", "If you can't pronounce it, research it")
        actionRow("Shop the perimeter", "Fresh foods along walls, processed in aisles")
        actionRow("Cook at home", "Control what goes in your food")
        actionRow("Buy organic when possible", "Especially 'Dirty Dozen' produce")
        actionRow("Avoid ultra-processed", "More than 5 ingredients = investigate")
        actionRow("Support local farmers", "Farmers markets, CSAs")
        actionRow("Download apps", "Yuka, EWG's Healthy Living scan barcodes")
      }

      Text("You can't avoid everything, but you can make informed choices. Knowledge is power.")
        .font(.system(size: 11))
        .foregroundColor(.green)
    }
    .padding()
    .background(Color.green.opacity(0.1))
    .cornerRadius(16)
    .padding()
  }

  private func actionRow(_ title: String, _ desc: String) -> some View {
    HStack(alignment: .top, spacing: 12) {
      Image(systemName: "checkmark.circle.fill")
        .foregroundColor(.green)
        .font(.system(size: 14))

      VStack(alignment: .leading, spacing: 2) {
        Text(title)
          .font(.system(size: 13, weight: .semibold))
          .foregroundColor(.white)
        Text(desc)
          .font(.system(size: 11))
          .foregroundColor(.gray)
      }
    }
  }

  // MARK: - Lessons

  private var lessons: [FoodLesson] {
    [
      FoodLesson(
        title: "The Sugar Conspiracy",
        subtitle: "How Big Sugar bought science",
        color: .red,
        content: """
          **The 50-Year Lie**

          For decades, you've been told fat makes you fat and causes heart disease. This was a lie paid for by the sugar industry.

          ---

          **The Documents:**

          In 2016, researchers discovered internal sugar industry documents from the 1960s.

          **What they revealed:**

          The Sugar Research Foundation (now Sugar Association) paid Harvard scientists $50,000 (equivalent to $600,000 today) to:
          - Downplay sugar's role in heart disease
          - Blame saturated fat instead
          - Publish in prestigious journals

          *Source: JAMA Internal Medicine, Kearns et al. (2016)*

          ---

          **The Scientists Involved:**

          **D. Mark Hegsted:** Later became head of nutrition at USDA
          **Fredrick Stare:** Harvard nutrition department founder

          Both took sugar industry money. Both shaped decades of nutrition policy.

          ---

          **The Consequences:**

          Because of this lie:
          - Dietary guidelines demonized fat
          - Food industry removed fat, added sugar
          - "Low-fat" products exploded (but high sugar)
          - Obesity epidemic began
          - Diabetes rates skyrocketed

          **Timeline:**
          - 1960s: Sugar industry funds research
          - 1977: First dietary guidelines blame fat
          - 1980s: Low-fat craze begins
          - 1980-2020: Obesity triples

          ---

          **Sugar Today:**

          The average American consumes:
          - **77 grams of sugar per day**
          - That's **19 teaspoons**
          - WHO recommends max 6 teaspoons

          Sugar is in:
          - Bread
          - Pasta sauce
          - Salad dressing
          - "Healthy" yogurt
          - Granola bars
          - Nearly everything processed

          ---

          **What Sugar Does:**

          **Metabolic effects:**
          - Insulin resistance
          - Fatty liver disease
          - Inflammation
          - Obesity
          - Type 2 diabetes

          **Brain effects:**
          - Activates same pathways as cocaine
          - Creates dependency
          - Affects mood and energy

          **Hidden names for sugar:**
          - High fructose corn syrup
          - Dextrose, maltose, sucrose
          - Cane juice, fruit concentrate
          - Agave, honey (still sugar)
          - 60+ names to hide it

          ---

          **The Industry Today:**

          The sugar industry continues to:
          - Fund favorable research
          - Lobby against sugar taxes
          - Fight warning labels
          - Market to children

          **Coca-Cola alone spends $4 billion/year on marketing.**
          """,
        keyTakeaway:
          "The sugar industry paid scientists to blame fat for heart disease. This lie shaped 50 years of nutrition policy. Average American eats 19 teaspoons of sugar daily—3x the recommended amount. Obesity and diabetes followed."
      ),
      FoodLesson(
        title: "Ultra-Processed Foods",
        subtitle: "Engineered for addiction",
        color: .orange,
        content: """
          **Food Designed to Addict**

          Ultra-processed foods aren't just unhealthy. They're engineered by scientists to make you unable to stop eating.

          ---

          **What Is Ultra-Processed:**

          **NOVA Classification:**

          1. **Unprocessed:** Fresh fruits, vegetables, meat, eggs
          2. **Processed ingredients:** Oil, butter, sugar, flour
          3. **Processed foods:** Canned vegetables, cheese, bread
          4. **Ultra-processed:** Industrial formulations with additives

          **Ultra-processed characteristics:**
          - Long ingredient lists
          - Ingredients you wouldn't use at home
          - Designed for long shelf life
          - High in sugar, salt, fat, additives
          - Low in fiber, nutrients

          ---

          **How Much We Eat:**

          In the United States:
          - **60%+ of calories** come from ultra-processed foods
          - **70%** of packaged foods are ultra-processed
          - **90%** of added sugars come from ultra-processed

          *Source: BMJ, Martínez Steele et al. (2016)*

          ---

          **The "Bliss Point":**

          Food scientists engineer the perfect combination of:
          - Sugar
          - Salt
          - Fat

          **The "bliss point"** is the precise amount that maximizes pleasure without triggering your brain's "stop eating" signal.

          > "We've learned how to optimize these products for consumption." 
          > — Howard Moskowitz, food industry consultant

          *Source: Michael Moss, "Salt Sugar Fat" (2013)*

          ---

          **Vanishing Caloric Density:**

          Cheetos are engineered to:
          - Dissolve quickly in your mouth
          - Not trigger satiety
          - Make you keep eating

          This is called "vanishing caloric density."

          **Your brain doesn't register you've eaten.**

          ---

          **The Health Effects:**

          Studies link ultra-processed foods to:

          - **Obesity:** Direct correlation
          - **Heart disease:** 12% higher risk per 10% increase in diet
          - **Cancer:** 10% increase in ultra-processed = 12% higher cancer risk
          - **Depression:** 33% higher risk
          - **Earlier death:** 62% higher mortality with highest consumption

          *Source: Multiple peer-reviewed studies, 2018-2023*

          ---

          **The NIH Study (2019):**

          Randomized controlled trial:
          - Participants ate ultra-processed OR unprocessed diets
          - Same calories, same macros available
          - Ultra-processed group ate **500 more calories/day**
          - Gained 2 pounds in 2 weeks

          **It's not about willpower. The food is designed to override satiety.**

          *Source: Hall et al., Cell Metabolism (2019)*

          ---

          **Examples of Ultra-Processed:**

          - Soft drinks
          - Packaged snacks
          - Fast food
          - Instant noodles
          - Breakfast cereals
          - Frozen dinners
          - Chicken nuggets
          - Hot dogs
          - Energy bars
          - Flavored yogurt

          **If your grandparents wouldn't recognize it as food, it's probably ultra-processed.**
          """,
        keyTakeaway:
          "60%+ of American calories come from ultra-processed foods. They're engineered with 'bliss points' to override satiety. Studies link them to obesity, cancer, depression, and early death. People eat 500 more calories when fed ultra-processed diets."
      ),
      FoodLesson(
        title: "The FDA: Captured Agency",
        subtitle: "Regulators who don't regulate",
        color: .purple,
        content: """
          **The Fox Guarding the Henhouse**

          The FDA is supposed to protect you from unsafe food. Instead, it protects the food industry.

          ---

          **Regulatory Capture:**

          When the industry being regulated controls the regulator.

          **How it happens:**
          - Industry funds FDA (user fees)
          - Revolving door: Industry → FDA → Industry
          - Industry writes the science FDA relies on
          - Lobbying shapes rules

          ---

          **The GRAS Loophole:**

          "Generally Recognized as Safe"

          **How it's supposed to work:**
          - FDA reviews new food additives
          - Determines safety
          - Approves or rejects

          **How it actually works:**
          - Company decides their additive is "GRAS"
          - Company can notify FDA (voluntary)
          - Or just start using it (no notification required)
          - FDA rarely challenges

          **Result:** 10,000+ additives in US food. FDA has fully reviewed only a fraction.

          *Source: Neltner et al., JAMA Internal Medicine (2013)*

          ---

          **The Revolving Door:**

          Examples:

          - **Michael Taylor:** Monsanto lawyer → FDA → Monsanto → FDA Deputy Commissioner → back to private sector
          - Wrote rules that govern his former/future employers

          - **Margaret Hamburg:** FDA Commissioner → Board of major biotech company

          This is normal, not exceptional.

          ---

          **What FDA Doesn't Do:**

          **Doesn't require:**
          - Testing of most additives before use
          - Long-term safety studies
          - Cumulative effect studies
          - Update of old approvals with new science

          **Doesn't review:**
          - Most GRAS additives
          - Combinations of additives
          - Effects on children specifically

          ---

          **Compared to Europe:**

          **EU approach (precautionary):**
          - Must prove safe before approval
          - Regular re-evaluation
          - Bans when evidence of harm
          - Stricter limits on additives

          **US approach (permissive):**
          - Allowed until proven harmful
          - Industry self-regulates
          - Rarely bans anything
          - Higher limits allowed

          **Result:** 3,000+ additives legal in US, banned in EU

          ---

          **Case Study: Food Dyes**

          **Red Dye 3:**
          - FDA banned in cosmetics (1990)
          - Still legal in food
          - Why? Industry lobbied
          - Linked to thyroid tumors in rats
          - Finally being phased out (2027) after 30+ years

          **Yellow 5, Red 40, etc.:**
          - Linked to behavioral issues in children
          - EU requires warning label
          - US: No warning required
          - Many companies use natural colors in EU, artificial in US

          ---

          **The Funding Problem:**

          FDA budget partially comes from "user fees" paid by the industry it regulates.

          **The customer is the industry, not you.**
          """,
        keyTakeaway:
          "The FDA is captured by the industry it regulates. The GRAS loophole lets companies self-approve additives. 10,000+ additives with minimal review. 3,000+ are banned in Europe but legal in US. Revolving door between FDA and industry is normal."
      ),
      FoodLesson(
        title: "Meat Industry Secrets",
        subtitle: "Factory farms and what they hide",
        color: .red,
        content: """
          **The Hidden Reality**

          99% of US meat comes from factory farms. What happens there is hidden for a reason.

          ---

          **Factory Farming Scale:**

          - **9 billion chickens** slaughtered per year in US
          - **120 million pigs**
          - **30 million cattle**

          These aren't farms. They're industrial facilities.

          ---

          **Animal Conditions:**

          **Chickens:**
          - 20,000-30,000 birds per shed
          - Less than 1 sq ft per bird
          - Never see sunlight
          - Bred to grow so fast legs break
          - Slaughtered at 6 weeks (natural lifespan: 8 years)

          **Pigs:**
          - Gestation crates: 2ft x 7ft for 3-4 years
          - Can't turn around
          - Concrete floors
          - Tail docking, teeth clipping without anesthesia
          - Intelligence comparable to dogs

          **Cattle:**
          - Feedlots with thousands of animals
          - Standing in manure
          - Fed corn (cows evolved to eat grass)
          - Antibiotics to survive conditions

          ---

          **Why This Affects YOUR Health:**

          **1. Antibiotics:**

          - 80% of US antibiotics go to livestock
          - Creates antibiotic-resistant bacteria
          - CDC: "Urgent threat to public health"
          - 35,000 Americans die yearly from resistant infections

          **2. Hormones:**

          - Growth hormones legal in US beef
          - rBGH in dairy (increases IGF-1)
          - Banned in EU, Canada, Japan
          - Linked to early puberty, cancer concerns

          **3. Contamination:**

          - USDA allows fecal contamination on meat
          - 97% of chicken breasts have bacteria
          - Salmonella in chicken is legal (not an "adulterant")

          ---

          **"Ag-Gag" Laws:**

          Many states have made it **illegal** to:
          - Film inside factory farms
          - Work there to document conditions
          - Expose animal abuse

          **Why would they need these laws if conditions were fine?**

          Industry wrote these laws. Politicians passed them.

          ---

          **The Workers:**

          Slaughterhouse workers:
          - Mostly immigrants (often undocumented)
          - Dangerous conditions (highest injury rates)
          - Low wages, no benefits
          - Psychological trauma documented
          - COVID outbreaks killed hundreds
          - Tyson managers bet on worker infections

          ---

          **Environmental Impact:**

          Factory farms produce:
          - More greenhouse gas than transportation
          - Manure lagoons (toxic to nearby communities)
          - Water pollution
          - Deforestation for feed crops

          **Communities near factory farms have higher rates of:**
          - Asthma
          - Nausea
          - Depression
          - Lower property values

          Disproportionately located in poor and minority communities.

          ---

          **The Labels That Lie:**

          - **"Natural":** Meaningless. No standards.
          - **"Farm fresh":** Marketing term.
          - **"Cage-free":** Still packed in sheds.
          - **"Free-range":** Access to outdoors (often unused).
          - **"Humanely raised":** No legal definition.

          **Only meaningful labels:**
          - USDA Organic (some standards)
          - Certified Humane (third-party audit)
          - Pasture-raised (better, but verify)
          """,
        keyTakeaway:
          "99% of US meat comes from factory farms with horrific conditions. 80% of antibiotics go to livestock, creating resistant superbugs. Ag-gag laws make documenting conditions illegal. Most labels ('natural,' 'farm fresh') are meaningless."
      ),
      FoodLesson(
        title: "The Dairy Deception",
        subtitle: "Got propaganda?",
        color: .blue,
        content: """
          **"Got Milk?" Was Marketing**

          Everything you believe about dairy was shaped by industry marketing, not science.

          ---

          **The Marketing Machine:**

          Dairy industry spends $200+ million/year on marketing.

          **"Got Milk?" campaign:**
          - Launched 1993
          - Government-funded (dairy checkoff program)
          - Created belief that milk is essential
          - Still influences beliefs today

          **The Milk Mustache:**
          - Celebrities paid to wear milk mustaches
          - Made milk seem cool
          - Targeted children

          ---

          **The Calcium Myth:**

          **Claim:** You need dairy for strong bones

          **Reality:**
          - Countries with highest dairy consumption have highest osteoporosis rates
          - Calcium available from many sources (greens, beans, fortified foods)
          - Harvard Nurses' Health Study: No bone benefit from high milk consumption
          - Excessive animal protein may actually leach calcium from bones

          *Source: Feskanich et al., American Journal of Public Health (1997)*

          ---

          **School Lunch Program:**

          Why is milk in every school cafeteria?

          - Dairy industry lobbied for mandatory milk
          - Government buys surplus dairy for schools
          - Creates lifetime consumers
          - 65% of humans are lactose intolerant (higher in non-white populations)

          **The government subsidizes the industry, then markets its product to children.**

          ---

          **What's Actually in Milk:**

          **Legal in US milk:**

          - Somatic cells (pus from infections): Up to 750,000 cells/mL
          - Antibiotics (trace amounts)
          - rBGH hormones (in conventional)
          - IGF-1 (linked to cancer risk)

          **Europe allows only 400,000 somatic cells/mL**

          ---

          **Health Concerns:**

          Studies have linked high dairy consumption to:

          - **Prostate cancer:** Meta-analysis found 9% increased risk
          - **Ovarian cancer:** Possible link (studies mixed)
          - **Acne:** Clear connection documented
          - **Digestive issues:** 65% of humans are lactose intolerant

          *Source: Aune et al., British Journal of Cancer (2015)*

          ---

          **The rBGH Story:**

          **Recombinant Bovine Growth Hormone:**

          - Made by Monsanto
          - Increases milk production
          - Increases IGF-1 in milk
          - Increases mastitis (infections)
          - Banned in EU, Canada, Japan, Australia
          - Legal in US

          **FDA approval:**
          - Monsanto submitted safety data
          - FDA employee who approved it later worked for Monsanto
          - Scientists who raised concerns were fired

          ---

          **The Plant-Based Threat:**

          Dairy industry has fought plant milks:

          - Lobbied to ban "milk" label for plant beverages
          - Sued companies using "milk" term
          - Created "Real Milk" campaigns

          **Why?** Plant milk sales growing 5x faster than dairy. Dairy sales declining.

          ---

          **What You Can Do:**

          - **Calcium sources:** Kale, broccoli, fortified foods, beans
          - **If you consume dairy:** Organic, pasture-raised
          - **Alternatives:** Oat, almond, soy milk (check for added sugar)
          - **Question the propaganda:** "Essential" is marketing
          """,
        keyTakeaway:
          "The dairy industry spends $200M+/year on marketing. Countries with highest dairy consumption have highest osteoporosis rates. 65% of humans are lactose intolerant. rBGH is banned in most countries but legal in US. 'Got Milk?' was propaganda, not science."
      ),
      FoodLesson(
        title: "The Corn Takeover",
        subtitle: "It's in everything",
        color: .yellow,
        content: """
          **The Corn-Based Food System**

          Modern American food is basically reorganized corn. It's in almost everything.

          ---

          **Corn Is Everywhere:**

          A typical fast food meal:
          - Soda: High fructose corn syrup
          - Bun: Corn starch, corn syrup
          - Beef: Corn-fed cattle
          - Chicken: Corn-fed
          - Fries: Fried in corn oil
          - Ketchup: High fructose corn syrup
          - Salad dressing: Corn oil, corn syrup

          **Even the packaging may contain corn-based materials.**

          *Source: Michael Pollan, "The Omnivore's Dilemma" (2006)*

          ---

          **Why Corn?**

          **Government Subsidies:**

          - Corn receives $5+ billion in subsidies annually
          - Makes corn artificially cheap
          - Farmers grow more than market demands
          - Excess corn needs somewhere to go

          **The solution:** Put it in everything

          ---

          **High Fructose Corn Syrup:**

          HFCS was developed to use excess corn.

          **Now it's in:**
          - Sodas
          - Bread
          - Yogurt
          - Cereal
          - Ketchup
          - Salad dressing
          - Canned soup
          - Crackers
          - Nearly all processed foods

          ---

          **Health Effects of HFCS:**

          **Metabolic effects:**
          - Doesn't trigger satiety like glucose
          - Goes straight to liver
          - Promotes fatty liver disease
          - Increases triglycerides
          - Linked to obesity, diabetes

          **Timeline:**
          - HFCS introduced: 1970s
          - HFCS becomes dominant sweetener: 1980s
          - Obesity epidemic begins: 1980s

          Correlation doesn't prove causation, but the timeline is striking.

          ---

          **Corn-Fed Animals:**

          Cows evolved to eat grass. Now they eat corn.

          **Why corn-fed is worse:**
          - Cattle get sick (need antibiotics)
          - Higher in saturated fat
          - Lower in omega-3s
          - Higher omega-6:omega-3 ratio (inflammatory)

          **Grass-fed benefits:**
          - Higher omega-3s
          - More CLA (beneficial fat)
          - More vitamins A, E
          - No routine antibiotics

          ---

          **The Corn Lobby:**

          The corn industry is powerful:

          - National Corn Growers Association
          - Archer Daniels Midland (ADM)
          - Cargill
          - Lobbying power in Congress
          - Subsidies protected

          **Iowa caucuses come first.** Candidates must support corn subsidies.

          ---

          **Ethanol: The Other Outlet**

          To use even more corn:

          - Mandated ethanol in gasoline
          - Uses 40% of US corn crop
          - Questionable environmental benefit
          - Raises food prices globally
          - Creates market for excess corn

          ---

          **The Real Cost:**

          Corn subsidies make processed food artificially cheap:

          - Fast food cheaper than vegetables
          - Soda cheaper than juice
          - Junk food more accessible

          **Poor communities eat more processed food because it's what they can afford.**

          This is policy, not accident.
          """,
        keyTakeaway:
          "Modern American food is reorganized corn—it's in nearly everything. $5B+ in subsidies make corn artificially cheap. HFCS introduction timeline matches obesity epidemic. Corn-fed animals are less healthy than grass-fed. Policy makes junk food cheaper than vegetables."
      ),
      FoodLesson(
        title: "Pesticides on Your Plate",
        subtitle: "What's sprayed on your food",
        color: .green,
        content: """
          **The Chemical Residue**

          Most non-organic produce is grown with pesticides. Residues remain when you eat it.

          ---

          **The Numbers:**

          - **1.1 billion pounds** of pesticides used in US agriculture annually
          - **70%** of non-organic produce has detectable pesticide residues
          - **225+** different pesticides found on produce

          *Source: USDA Pesticide Data Program*

          ---

          **Glyphosate (Roundup):**

          The most widely used herbicide in the world.

          **Where it's found:**
          - Oats (95% of samples)
          - Wheat
          - Corn
          - Soy
          - Many other crops

          **Health concerns:**
          - WHO classified as "probably carcinogenic" (2015)
          - Jury awarded $289M to groundskeeper with cancer (later reduced)
          - Multiple lawsuits against Bayer/Monsanto
          - Detected in 80%+ of Americans' urine

          **Industry response:**
          - Bayer (bought Monsanto) maintains safety
          - Lobbied against WHO classification
          - EPA says it's safe (industry influenced?)

          *Source: Environmental Working Group testing*

          ---

          **The Dirty Dozen:**

          Produce with most pesticide residues (buy organic if possible):

          1. Strawberries
          2. Spinach
          3. Kale/Collard Greens
          4. Peaches
          5. Pears
          6. Nectarines
          7. Apples
          8. Grapes
          9. Bell Peppers
          10. Cherries
          11. Blueberries
          12. Green Beans

          *Source: Environmental Working Group (2023)*

          ---

          **The Clean Fifteen:**

          Lowest in pesticides (conventional is okay):

          1. Avocados
          2. Sweet Corn
          3. Pineapple
          4. Onions
          5. Papaya
          6. Sweet Peas (frozen)
          7. Asparagus
          8. Honeydew Melon
          9. Kiwi
          10. Cabbage
          11. Mushrooms
          12. Mangoes
          13. Sweet Potatoes
          14. Watermelon
          15. Carrots

          ---

          **Cumulative Exposure:**

          FDA tests individual pesticides.
          **But you eat many foods with many pesticides.**

          No one tests:
          - Cumulative effects
          - Cocktail effects (combinations)
          - Long-term low-dose exposure
          - Effects on children specifically

          **The regulatory framework ignores how people actually eat.**

          ---

          **Children Are More Vulnerable:**

          - Higher intake per body weight
          - Developing brains and organs
          - Less ability to detoxify
          - Longer lifetime of exposure

          Studies link pesticide exposure to:
          - ADHD
          - Lower IQ
          - Developmental delays
          - Autism spectrum (some studies)

          ---

          **Organic: Worth It?**

          **Benefits:**
          - No synthetic pesticides
          - No GMOs
          - Lower residue levels
          - Better for farmworkers
          - Better for environment

          **Limitations:**
          - More expensive
          - Not pesticide-free (natural pesticides allowed)
          - "Organic" label can be gamed

          **Practical approach:**
          - Prioritize organic for Dirty Dozen
          - Conventional okay for Clean Fifteen
          - Local farmers markets (ask about practices)
          - Wash produce thoroughly
          """,
        keyTakeaway:
          "70% of non-organic produce has pesticide residues. Glyphosate found in 80%+ of Americans' urine. WHO says probably carcinogenic. Use the Dirty Dozen/Clean Fifteen to prioritize organic purchases. No one tests cumulative effects."
      ),
      FoodLesson(
        title: "Food Additives Deep Dive",
        subtitle: "What those ingredients actually are",
        color: .orange,
        content: """
          **The Unpronounceable Ingredients**

          That long list of ingredients? Here's what some of them actually are.

          ---

          **Preservatives:**

          **BHA & BHT (Butylated Hydroxyanisole/Toluene):**
          - Found in: Cereals, chips, gum
          - Concern: BHA is "reasonably anticipated to be a human carcinogen" (NIH)
          - Status: Legal in US, restricted in some countries

          **Sodium Nitrate/Nitrite:**
          - Found in: Bacon, hot dogs, deli meat
          - Concern: Forms nitrosamines (carcinogenic) when heated
          - WHO: Processed meat is Group 1 carcinogen (same as cigarettes)

          **TBHQ:**
          - Found in: Fast food, frozen pizza, crackers
          - Concern: High doses caused tumors in animals
          - Status: Legal, "safe in small amounts"

          ---

          **Artificial Colors:**

          **Why they exist:**
          - Natural colors fade
          - Artificial colors are cheaper
          - Make food look more appealing

          **The main ones:**

          | Dye | Found In | Concern |
          |-----|----------|---------|
          | Red 40 | Candy, cereals | Hyperactivity |
          | Yellow 5 | Chips, drinks | Hyperactivity, allergies |
          | Yellow 6 | Candy, sauces | Tumor links in studies |
          | Blue 1 | Candy, drinks | Passes blood-brain barrier |
          | Red 3 | Candy, frosting | Thyroid tumors |

          **EU requires warning label. US does not.**

          Many companies use natural colors in EU, artificial in US.

          ---

          **Artificial Sweeteners:**

          **Aspartame:**
          - Found in: Diet sodas, sugar-free products
          - WHO (2023): "Possibly carcinogenic"
          - Industry disputes findings
          - May affect gut bacteria

          **Sucralose (Splenda):**
          - Found in: Many "sugar-free" products
          - Concern: May affect insulin, gut bacteria
          - Heat may create chlorinated compounds

          **Acesulfame K:**
          - Found in: Sodas, protein shakes
          - Concern: Contains methylene chloride
          - Less studied than others

          ---

          **Emulsifiers:**

          **Carrageenan:**
          - Found in: Almond milk, ice cream, deli meat
          - Concern: Inflammation, gut issues in studies
          - Derived from seaweed (sounds natural, isn't harmless)

          **Polysorbate 80:**
          - Found in: Ice cream, vaccines
          - Concern: Disrupts gut barrier in animal studies
          - May promote inflammation

          ---

          **Flavor Enhancers:**

          **MSG (Monosodium Glutamate):**
          - Found in: Asian food, chips, processed foods
          - The controversy: "Chinese Restaurant Syndrome"
          - Science: Generally considered safe
          - But: May trigger headaches in some people
          - Also appears as: "Natural flavors," "hydrolyzed protein"

          **"Natural Flavors":**
          - Can be from 100+ chemical compounds
          - Doesn't mean healthy
          - Industry trade secret
          - You have no idea what it actually is

          ---

          **Reading Labels:**

          **Red flags:**
          - Ingredients you can't pronounce
          - Very long ingredient lists
          - Sugar in first 3 ingredients
          - Multiple types of sugar
          - "Natural flavors" (meaningless)
          - Dyes (by number)

          **Better choices:**
          - Short ingredient lists
          - Recognizable ingredients
          - Whole foods as base

          ---

          **The Real Question:**

          Why are there 10,000+ additives in our food?

          **Answer:** Longer shelf life, lower cost, more addictive qualities.

          **None of these benefits are for you.**
          """,
        keyTakeaway:
          "10,000+ additives allowed in US food. BHA is 'reasonably anticipated to be carcinogenic' but legal. Food dyes require warning labels in EU, not US. WHO says aspartame is 'possibly carcinogenic.' 'Natural flavors' can mean 100+ mystery chemicals."
      ),
      FoodLesson(
        title: "The Obesity Design",
        subtitle: "It's not your fault",
        color: .red,
        content: """
          **The System Is Designed to Make You Fat**

          Obesity isn't a personal failure. It's the predictable result of a system designed to maximize consumption.

          ---

          **The Numbers:**

          US adults (2022):
          - **30.4%** are overweight
          - **42.4%** are obese
          - **9.2%** are severely obese
          - **73.1%** total overweight/obese

          1960: Only 13% were obese.

          **What changed? The food supply.**

          ---

          **Portion Sizes:**

          | Food | 1980s | Today | Increase |
          |------|-------|-------|----------|
          | Bagel | 3" | 6" | 2x |
          | Soda | 6.5 oz | 20 oz | 3x |
          | Muffin | 1.5 oz | 8 oz | 5x |
          | Burger | 3.9 oz | 12 oz | 3x |
          | Fries | 2.4 oz | 6.9 oz | 3x |

          **Larger portions = more profit.** You've been conditioned to expect them.

          ---

          **The Food Environment:**

          **Food deserts:**
          - 23 million Americans live in them
          - No grocery store within 1 mile (urban) or 10 miles (rural)
          - Fast food is often the only option
          - Disproportionately affects poor communities and communities of color

          **Food swamps:**
          - Areas saturated with fast food and junk
          - Corner stores selling chips, not vegetables
          - Engineered for profit, not health

          ---

          **Marketing to Children:**

          Children see **10-13 food ads per day**.

          **95% are for:**
          - Fast food
          - Sugary cereals
          - Candy
          - Soda
          - Snacks

          **Marketing tactics:**
          - Cartoon characters
          - Toys in meals
          - Advergaming
          - Social media influencers
          - School sponsorships

          **Companies spend $14 billion/year marketing to children.**

          ---

          **The Addiction Factor:**

          Brain imaging shows:
          - Sugar activates same pathways as cocaine
          - Creates tolerance (need more for same effect)
          - Withdrawal symptoms when stopping
          - Food addiction is real

          **Industry knows this.** They engineer for it.

          ---

          **The Blame Game:**

          Industry message: "Personal responsibility"

          **If it's your fault, it's not theirs.**

          But consider:
          - Did you design the food to be addictive?
          - Did you create food deserts?
          - Did you lobby against nutrition labels?
          - Did you market junk food to children?
          - Did you make healthy food expensive?

          **The system is rigged. You're not weak.**

          ---

          **Economic Incentives:**

          **The food industry profits from you eating more:**
          - Larger portions = higher prices
          - Addictive food = repeat customers
          - Cheap ingredients = higher margins
          - Marketing works

          **The healthcare industry profits from you being sick:**
          - Diabetes medication market: $50+ billion
          - Weight loss industry: $70+ billion
          - Heart disease treatment: $200+ billion

          **No major industry profits from you being healthy and eating less.**

          ---

          **What Actually Works:**

          Individual level:
          - Cook at home
          - Avoid ultra-processed
          - Eat whole foods
          - Read labels

          System level:
          - Tax sugary drinks
          - Ban marketing to children
          - Subsidize vegetables (not corn)
          - Food access in underserved areas
          - Clear nutrition labels

          **Both are needed. Policy changes require political will.**
          """,
        keyTakeaway:
          "73% of Americans are overweight/obese—up from 13% in 1960. Portion sizes tripled. 23 million live in food deserts. $14 billion/year marketing junk to kids. The system profits from obesity. It's not personal failure—it's design."
      ),
      FoodLesson(
        title: "Taking Back Your Health",
        subtitle: "Practical steps forward",
        color: .green,
        content: """
          **You Have More Power Than You Think**

          The system is rigged, but you can still make choices that protect your health.

          ---

          **The 80/20 Rule:**

          You don't have to be perfect:
          - Eat whole foods 80% of the time
          - Allow flexibility 20%
          - Progress over perfection
          - Sustainable beats extreme

          ---

          **Shopping Strategies:**

          **At the grocery store:**

          1. **Shop the perimeter** - Fresh foods along walls
          2. **Read ingredients** - Not just nutrition facts
          3. **5 ingredient rule** - If more, investigate
          4. **Avoid middle aisles** - Where processed lives
          5. **Don't shop hungry** - Makes junk tempting

          **Better choices:**
          - Farmers markets (often cheaper than you think)
          - CSA boxes (Community Supported Agriculture)
          - Ethnic grocery stores (often less processed)
          - Frozen vegetables (nutritious, affordable)

          ---

          **Cooking Basics:**

          **Start simple:**
          - One new recipe per week
          - Batch cook on weekends
          - Prep ingredients in advance
          - Basic skills: sauté, roast, boil

          **Tools that help:**
          - Instant Pot / slow cooker
          - Sheet pan (roast everything)
          - Good knife
          - Basic spices

          **Cooking saves money AND health.**

          ---

          **Reading Labels:**

          **Ingredients to avoid/limit:**
          - High fructose corn syrup
          - Partially hydrogenated oils (trans fat)
          - Artificial colors (Red 40, Yellow 5, etc.)
          - Sodium nitrate/nitrite
          - BHA/BHT
          - "Natural flavors" (investigate brand)

          **Marketing terms that mean nothing:**
          - "Natural" - No legal definition
          - "Made with real fruit" - Could be 1%
          - "Lightly sweetened" - Still lots of sugar
          - "Multigrain" - Not same as whole grain

          ---

          **Apps That Help:**

          **Yuka:**
          - Scan barcodes
          - Rates products
          - Explains ingredients
          - Free version works well

          **EWG Healthy Living:**
          - Food and product ratings
          - Pesticide information
          - From Environmental Working Group

          **Open Food Facts:**
          - Crowdsourced database
          - Detailed ingredient info
          - Free and open source

          ---

          **Budget-Friendly Health:**

          Healthy eating doesn't have to be expensive:

          - **Beans and lentils:** Cheapest protein
          - **Frozen vegetables:** As nutritious as fresh
          - **Whole grains:** Rice, oats (not instant)
          - **Eggs:** Complete protein, affordable
          - **Bananas, cabbage, carrots:** Cheap produce
          - **Cook at home:** Always cheaper

          **Junk food is cheap until you count healthcare costs.**

          ---

          **Talking to Family:**

          Sharing this knowledge:
          - Lead by example
          - Don't lecture
          - Make healthy food delicious
          - Involve kids in cooking
          - Small changes add up

          ---

          **Systemic Action:**

          Individual choices matter AND we need system change:

          **Support:**
          - Food policy advocates
          - Local food movements
          - Politicians who prioritize health over industry
          - Organizations fighting for change (EWG, CSPI, etc.)

          **Oppose:**
          - Marketing junk to kids
          - Industry capture of FDA
          - Subsidies for corn/sugar, not vegetables
          - Food deserts

          ---

          **Final Thought:**

          The food industry spent 50 years making you sick for profit.

          **Learning the truth is the first step.**

          Every meal is a choice. You now have the information to choose wisely.

          **Your health is your wealth. Protect it.**
          """,
        keyTakeaway:
          "Use the 80/20 rule—whole foods 80% of the time. Shop perimeter, read ingredients, use apps like Yuka to scan products. Cooking at home is always healthier and cheaper. Support systemic change while making better individual choices. Your health is your wealth."
      ),
    ]
  }
}

// MARK: - Models

struct FoodLesson: Identifiable {
  let id = UUID()
  let title: String
  let subtitle: String
  let color: Color
  let content: String
  let keyTakeaway: String
}

struct FoodLessonView: View {
  let lesson: FoodLesson
  let index: Int

  var body: some View {
    ScrollView {
      VStack(alignment: .leading, spacing: 24) {
        VStack(alignment: .leading, spacing: 8) {
          HStack {
            Text("Lesson \(index)")
              .font(.system(size: 12, weight: .medium))
              .foregroundColor(lesson.color)
              .padding(.horizontal, 10)
              .padding(.vertical, 4)
              .background(lesson.color.opacity(0.2))
              .cornerRadius(8)
            Spacer()
          }

          Text(lesson.title)
            .font(.system(size: 26, weight: .bold))
            .foregroundColor(.white)

          Text(lesson.subtitle)
            .font(.system(size: 14))
            .foregroundColor(.gray)
        }

        Divider().background(Color.white.opacity(0.2))

        Text(lesson.content)
          .font(.system(size: 15))
          .foregroundColor(.white.opacity(0.9))
          .lineSpacing(6)

        VStack(alignment: .leading, spacing: 12) {
          HStack {
            Image(systemName: "lightbulb.fill")
              .foregroundColor(lesson.color)
            Text("Key Takeaway")
              .font(.system(size: 14, weight: .bold))
              .foregroundColor(lesson.color)
          }

          Text(lesson.keyTakeaway)
            .font(.system(size: 16, weight: .medium))
            .foregroundColor(.white)
        }
        .padding()
        .background(lesson.color.opacity(0.1))
        .cornerRadius(16)
      }
      .padding()
    }
    .background(Color.black.ignoresSafeArea())
    .navigationBarTitleDisplayMode(.inline)
  }
}

#Preview {
  NavigationStack {
    FoodIndustryExposedCourse()
  }
}
