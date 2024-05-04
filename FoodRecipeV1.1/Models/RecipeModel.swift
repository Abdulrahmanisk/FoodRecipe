//
//  RecipeModel.swift
//  FoodRecipeV1.1
//
//  Created by Abdulrahman isk on 24/12/2023.
//

import Foundation

enum Categories: String, CaseIterable {
    var id: String {self.rawValue}
    case allofthem = "All Recipes"
    case breakfast = "Breakfast"
    case soup = "Soup"
    case salad = "Salad"
    case appetizer = "Appetizer"
    case main = "Main Course"
    case side = "Side Dish"
    case dessert = "Dessert"
    case snack = "Snack"
    case drink = "Drink"
    
}


struct Recipe: Identifiable {
    let id = UUID()
    let allofthem: String
    let name: String
    let image: String
    let description: String
    let ingredients: String
    let directions: String
    let category: Categories.RawValue
    let datePublished: String
    let url: String
    let chefname: String
    let chefimage: String
    let timetomake: String
    let difficulty: String
    
}

extension Recipe {
    static let all: [Recipe] = [
        Recipe(
            allofthem: "All Recipes",
            name: "Savory Meatballs with Cranberry Glaze",
            image: "https://www.forksoverknives.com/uploads/savory-vegan-meatballs-with-cranberry-glaze.jpg?auto=webp",
            description: "Looking for a crowd-pleasing appetizer for your next gathering? Try this party-friendly recipe for vegan meatballs and a tangy dipping sauce today!",
            ingredients: """
                2 cups chopped fresh mushrooms
                ½ cup chopped onion
                2 cloves garlic, minced
                ½ teaspoon dried marjoram or summer savory, crushed
                ½ teaspoon dried sage, crushed
                ½ teaspoon dried thyme, crushed
                    Sea salt and freshly ground black pepper, to taste
                1 15-oz. can no-salt-added garbanzo beans (chickpeas), drained (reserve liquid) and rinsed
                1 cup cooked brown rice, cooled
                ½ cup whole wheat panko bread crumbs
                5 orange slices, quartered
                2 cups fresh or frozen cranberries
                ½ cup orange juice
                ⅓ cup packed brown sugar
                2 tablespoons pure maple syrup
                ½ teaspoon dry mustard
            """,
            directions: """
                To make Cranberry Glaze, in a saucepan combine all Cranberry Glaze ingredients and ¼ cup water. Cook over medium about 10 minutes or until berries burst, stirring occasionally. Transfer mixture to a blender or food processor. Cover and pulse until nearly smooth. If needed, thin with additional orange juice. Transfer to a serving dish.
                Preheat broiler. In a large nonstick skillet cook mushrooms, onion, and garlic over medium 5 minutes or until tender, stirring occasionally and adding water, 1 to 2 Tbsp. at a time, as needed to prevent sticking. Stir in marjoram, sage, thyme, salt, and pepper.
                In a food processor combine mushroom mixture, chickpeas, rice, and panko. Pulse until very finely ground but not smooth. Add 1 to 2 Tbsp. reserved chickpea liquid (aquafaba) if needed to moisten mixture. Let mixture stand 10 minutes. Form mixture into forty 1-inch balls. Arrange balls on a large baking sheet.
                Broil meatballs 4 to 6 inches from the heat about 10 minutes or until lightly browned and set, turning once.
                Thread 2 meatballs and an orange piece on each of 20 short skewers or long toothpicks. Place on a platter with Cranberry Glaze on the side. To transport, cover platter and place in an insulated carrier with a hot pack.
            """,
            category: "Main Course",
            datePublished: "2019-12-09 10:43:32",
            url: "https://www.forksoverknives.com/recipes/vegan-snacks-appetizers/savory-vegan-meatballs-with-cranberry-glaze/",
            chefname: "Mohammed",
            chefimage: "mohammed",
            timetomake: "1 Hour",
            difficulty: "Medium"
        ),
        Recipe(
            allofthem: "All Recipes",
            name: "Middle Eastern Red Rice Pilaf",
            image: "https://www.forksoverknives.com/uploads/2023/11/Middle-Eastern-Red-Rice-Pilaf-wordpress.jpg?auto=webp",
            description: "Delicious Middle Eastern Red Rice Pilaf with a flavorful cucumber, mint, and sesame seed topper.",
            ingredients: """
                1 cup chopped onion
                2 cloves garlic, minced
                1 teaspoon Aleppo pepper, or ¾ teaspoon paprika plus ¼ teaspoon cayenne pepper
                ¾ teaspoon sea salt
                ½ teaspoon ground cinnamon
                ¼ teaspoon ground cloves
                ¼ teaspoon ground cardamom
                2½ cups dry red rice
                1¼ cups chopped peeled acorn squash or butternut squash
                ⅓ cup raisins
                1⅓ cups finely chopped cucumber
                2 tablespoons chopped fresh mint
                1 teaspoon sesame seeds, toasted
                """,
            directions: """
                In a large saucepan, cook onion and garlic over medium heat for 4 minutes or until tender, stirring occasionally and adding water, 1 to 2 tablespoons at a time, as needed to prevent sticking. Stir in Aleppo pepper, salt, cinnamon, cloves, and cardamom. Cook for 1 minute.
                Add rice and squash; stir to coat. Add 3½ cups water and the raisins. Bring to a boil; reduce heat. Cover and simmer for 30 minutes or until the liquid is absorbed. Remove from heat; let stand for 10 minutes.
                For the topper, in a small bowl, stir together cucumber, mint, and sesame seeds. Serve with rice mixture.
                """,
            category: "Side Dish",
            datePublished: "2023-11-22 10:33:36",
            url: "",
            chefname: "Abdulrahman",
            chefimage: "abdulrahman",
            timetomake: "\(Int.random(in: 5...60))M",
            difficulty: ["Easy", "Normal", "Hard"].randomElement() ?? "Unknown"
        ),
        Recipe(
            allofthem: "All Recipes",
            name: "Panko Broccoli with Sun-Dried Tomatoes",
            image: "https://www.forksoverknives.com/uploads/2023/12/Panko-Broccoli-wordpress.jpg?auto=webp",
            description: "Supercharge your side dish skills with this colorful, crunchy, and totally crave-worthy panko broccoli recipe. Each floret is simmered in flavorful veggie broth, topped with garlic-infused panko, and finished with savory slivers of sun-dried tomatoes.",
            ingredients: """
                1½ lb. broccoli (1 large head)
                ⅓ cup low-sodium vegetable broth
                ¼ cup whole wheat panko
                4 cloves garlic, minced
                2 tablespoons slivered sun-dried tomatoes (not oil-packed)
                """,
            directions: """
                Cut broccoli head into small florets. If you like, peel and thinly slice broccoli stalks. In an extra-large nonstick skillet, cook broccoli in broth over medium-high heat for 6 to 8 minutes or until crisp-tender, stirring occasionally.
                Meanwhile, in a small bowl, combine panko and garlic. Add to skillet with sun-dried tomatoes. Cook for 2 to 3 minutes or until panko is toasted, stirring frequently. If you like, season with freshly ground black pepper.
                """,
            category: "Main Course",
            datePublished: "2023-12-18 10:24:46",
            url: "https://www.forksoverknives.com/recipes/vegan-salads-sides/panko-broccoli-with-sun-dried-tomatoes/",
            chefname: "Rehab",
            chefimage: "rehab",
            timetomake: "\(Int.random(in: 5...60)) minutes",
            difficulty: ["Easy", "Normal", "Hard"].randomElement() ?? "Unknown"
        ),
        Recipe(
            allofthem: "All Recipes",
            name: "Healthy Chocolate Hummus",
            image: "https://www.forksoverknives.com/uploads/Chocolate-Hummus-wordpress.jpg?auto=webp",
            description: "This oil-free chocolate hummus is deliciously creamy and features the supporting flavors of almond butter, maple syrup, and cinnamon. Get the recipe here!",
            ingredients: """
                1 15-oz. can no-salt-added chickpeas, rinsed and drained (1½ cups)
                ¼ cup unsweetened cocoa powder
                ¼ cup pure maple syrup
                1 tablespoon natural almond butter or peanut butter
                ½ teaspoon pure vanilla extract
                ¼ teaspoon ground cinnamon
                2 to 3 tablespoons unsweetened, unflavored plant-based milk
                3 cups fresh fruit and/or veggie sticks
            """,
            directions: """
                Put the first six ingredients (through cinnamon) in a blender or food processor. Add 2 tablespoons of the milk. Add the lid and blend until smooth, stopping to scrape down sides of blender and adding milk, 1 teaspoon at a time, as needed to make hummus creamy. Use a spoon or rubber scraper to put the hummus in a bowl.
                Serve with fresh fruit and/or vegetables for dipping.
            """,
            category: "Snack",
            datePublished: "2022-10-25 10:26:22",
            url: "https://www.forksoverknives.com/recipes/vegan-snacks-appetizers/healthy-chocolate-hummus/",
            chefname: "Fatima",
            chefimage: "fatima",
            timetomake: "\(Int.random(in: 5...60))M",
            difficulty: ["Easy", "Normal", "Hard"].randomElement() ?? "Unknown"
        ),
        Recipe(
            allofthem: "All Recipes",
            name: "Creamy Sweet Potato Pudding",
            image: "https://www.forksoverknives.com/uploads/2023/12/Sweet-Potato-Pudding-with-Glazed-Pecans-wordpress.jpg?auto=webp",
            description: "This luxurious sweet potato pudding is flavored with caramel-like dates and features a crunchy topping of sweet and spicy pecans. Get the recipe!",
            ingredients: """
                1 10-oz. purple sweet potato, peeled and coarsely chopped
                1 ripe avocado, halved, seeded, and peeled
                ¾ to 1 cup unsweetened, unflavored plant-based milk
                6 Medjool dates, pitted and soaked
                1 teaspoon pure vanilla extract
                Pinch sea salt
                3 tablespoons whole or broken pecans
                2 teaspoons pure cane sugar
                Pinch cayenne pepper (optional)
                Flaky sea salt, to taste
            """,
            directions: """
                Place potato pieces in a steamer basket in a large saucepan. Add water to the saucepan to just below the basket. Bring to boiling. Steam, covered, for 7 minutes or until very tender. Transfer to a food processor and let cool.
                Add the next five ingredients (through pinch salt) to the food processor. Process until smooth, adding more milk if needed to reach the desired consistency. Spoon into six 4-oz. serving dishes. Cover and chill for at least 4 hours.
                Meanwhile, place pecans in a dry small skillet. Sprinkle with sugar and cayenne (if using). Heat over medium heat for 5 minutes or until sugar melts and coats nuts, stirring occasionally. Transfer to a parchment-lined plate. Sprinkle lightly with flaky salt. Let cool.
                Sprinkle pudding with glazed pecans.
            """,
            category: "Dessert",
            datePublished: "2023-12-21 09:19:06",
            url: "https://www.forksoverknives.com/recipes/vegan-desserts/creamy-sweet-potato-pudding/",
            chefname: "Kholoud",
            chefimage: "nophoto",
            timetomake: "\(Int.random(in: 5...60))M",
            difficulty: ["Easy", "Normal", "Hard"].randomElement() ?? "Unknown"
        ),
        Recipe(
            allofthem: "All Recipes",
            name: "Panko Broccoli with Sun-Dried Tomatoes",
            image: "https://www.forksoverknives.com/uploads/2023/12/Panko-Broccoli-wordpress.jpg?auto=webp",
            description: "This super side dish features tender broccoli, crunchy garlic-infused panko bread crumbs, and savory sun-dried tomatoes. Get the panko broccoli recipe!",
            ingredients: """
                1½ lb. broccoli (1 large head)
                ⅓ cup low-sodium vegetable broth
                ¼ cup whole wheat panko
                4 cloves garlic, minced
                2 tablespoons slivered sun-dried tomatoes (not oil-packed)
            """,
            directions: """
                Cut broccoli head into small florets. If you like, peel and thinly slice broccoli stalks. In an extra-large nonstick skillet cook broccoli in broth over medium-high 6 to 8 minutes or until crisp-tender, stirring occasionally.
                Meanwhile, in a small bowl combine panko and garlic. Add to skillet with sun-dried tomatoes. Cook 2 to 3 minutes or until panko is toasted, stirring frequently. If you like, season with freshly ground black pepper.
            """,
            category: "Salad",
            datePublished: "2023-12-18 10:24:46",
            url: "https://www.forksoverknives.com/recipes/vegan-salads-sides/panko-broccoli-with-sun-dried-tomatoes/",
            chefname: "Raghad",
            chefimage: "nophoto",
            timetomake: "\(Int.random(in: 5...60))M",
            difficulty: ["Easy", "Normal", "Hard"].randomElement() ?? "Unknown"
        ),
        Recipe(
            allofthem: "All Recipes",
            name: "Roasted Kabocha Squash and Veggie Stew",
            image: "https://www.forksoverknives.com/uploads/2023/12/Roasted-Kabocha-and-Veggie-Stew-wordpress.jpg?auto=webp",
            description: "This roasted kabocha squash and veggie stew is packed full of warm, seasonal flavors. Spoon each serving over basil-infused farro, and dig in!",
            ingredients: """
                4 cups cubed peeled kabocha squash (¾-inch cubes)
                4 medium carrots, halved lengthwise and thickly sliced (2 cups)
                8 oz. fresh cremini mushrooms, halved
                1 medium fennel bulb, quartered, cored, and cut into ¼-inch wedges
                ¼ cup white wine vinegar
                1 cup chopped onion
                4 cloves garlic, minced
                4 cups low-sodium vegetable broth
                2 tablespoons no-salt-added tomato paste
                1 teaspoon dried Italian seasoning, crushed
                4 cups shredded fresh Swiss chard
                Sea salt, to taste
                Freshly ground black pepper, to taste
                2 cups hot cooked farro
                ½ cup slivered fresh basil
                2 tablespoons toasted pine nuts, chopped
            """,
            directions: """
                Preheat oven to 400°F. Line two large shallow baking pans with parchment paper or foil. Arrange squash and carrots in one baking pan and mushrooms and fennel in the other baking pan. Sprinkle all vegetables with vinegar. Roast 30 minutes or until just tender and lightly browned, stirring once.
                In a 4- to 6-quart pot cook onion in 2 tablespoons water over medium 4 minutes or until tender, stirring occasionally and adding water, 1 to 2 tablespoons at a time, as needed to prevent sticking. Add garlic; cook 1 minute. Add roasted vegetables, broth, tomato paste, and Italian seasoning. Bring to boiling; reduce heat. Cover and simmer 15 minutes, stirring occasionally. Stir in chard until wilted. Season with salt and pepper.
                Stir together farro, basil, and pine nuts. Spoon into bowls. Top with stew.
            """,
            category: "Soup",
            datePublished: "2023-12-14 11:08:20",
            url: "https://www.forksoverknives.com/recipes/vegan-soups-stews/roasted-kabocha-squash-and-veggie-stew/",
            chefname: "Mommy",
            chefimage: "nophoto",
            timetomake: "\(Int.random(in: 5...60))M",
            difficulty: ["Easy", "Normal", "Hard"].randomElement() ?? "Unknown"
        ),
        Recipe(
            allofthem: "All Recipes",
            name: "Vegan Chilaquiles",
            image: "https://www.forksoverknives.com/uploads/2023/11/Taco-Chilaquiles-wordpress.jpg?auto=webp",
            description: "These vegan chilaquiles feature crispy baked tortilla chips smothered in homemade salsa and topped with a zesty mix of quinoa and black beans. Get the recipe!",
            ingredients: """
                3 6-inch corn tortillas, cut into wedges
                1 14.5-oz. can no-salt-added fire-roasted diced tomatoes
                1½ cups low-sodium vegetable broth or water
                ½ cup chopped onion
                1 small jalapeño chile, halved and seeded, if desired
                2 cloves garlic, halved
                ½ teaspoon salt
                3 cups cooked red or tricolor quinoa
                1 tablespoon nutritional yeast
                1 tablespoon salt-free taco seasoning
                1 teaspoon smoked paprika
                1 15-oz. can no-salt-added black beans, rinsed and drained (1½ cups)
                ½ cup sliced scallions
                Chopped fresh cilantro
            """,
            directions: """
                Preheat oven to 400°F. Spread tortilla wedges on a baking sheet. Bake 10 to 12 minutes or until toasted.
                In a blender combine undrained tomatoes, 1 cup of the broth, the onion, jalapeño, garlic, and salt. Cover and blend until smooth. Transfer to a large nonstick skillet. Cook over medium 8 to 10 minutes or until slightly thickened. Stir in tortilla wedges until coated. Cook 2 minutes or until heated through.
                Meanwhile, in a medium saucepan combine quinoa, the remaining ½ cup broth, the nutritional yeast, taco seasoning, and smoked paprika. Cook over medium 4 to 5 minutes or until broth is mostly absorbed.
                Spoon quinoa mixture into shallow dishes. Top with tortilla mixture, beans, scallions, and cilantro.
            """,
            category: "Breakfast",
            datePublished: "2023-11-08 10:34:29",
            url: "https://www.forksoverknives.com/recipes/vegan-breakfast/vegan-chilaquiles/",
            chefname: "Daddy",
            chefimage: "daddy",
            timetomake: "\(Int.random(in: 5...60))M",
            difficulty: ["Easy", "Normal", "Hard"].randomElement() ?? "Unknown"
        ),
        Recipe(
            allofthem: "All Recipes",
            name: "Pineapple Ginger Smoothie",
            image: "https://www.forksoverknives.com/uploads/Pineapple-Ginger-Smoothie-wordpress.jpg?auto=webp",
            description: "Bananas, pineapple, ginger, and turmeric come together to create a creamy smoothie that’s perfect for breakfast or a midday snack. Get the recipe!",
            ingredients: """
                1 banana, sliced and frozen
                1 cup unsweetened, unflavored plant-based milk
                2 tablespoons quick-cooking oats (see tip, recipe intro)
                8 oz. frozen pineapple (about 1 cup)
                ½ teaspoon grated fresh ginger
                ¼ teaspoon ground turmeric
            """,
            directions: """
                Line a baking sheet with parchment paper. Freeze bananas on prepared baking sheet for at least 2 hours.
                In a high-powered blender (or food processor), combine plant milk, quick-cooking oats, frozen bananas and pineapple, ginger, and turmeric. Blend until smooth.
                Pour into a glass and serve.
            """,
            category: "Drink",
            datePublished: "2023-05-29 09:30:55",
            url: "https://www.forksoverknives.com/recipes/vegan-snacks-appetizers/pineapple-ginger-smoothie/",
            chefname: "Mohammed",
            chefimage: "nophoto",
            timetomake: "\(Int.random(in: 5...60))M",
            difficulty: ["Easy", "Normal", "Hard"].randomElement() ?? "Unknown"
        )
    ]
}
