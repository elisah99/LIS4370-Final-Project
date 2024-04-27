#Analyze Nutrition function (with example values)

analyze_nutrition <- function(recipe) {
  
  # Example nutritional values per unit (could be expanded to use a real database)
  nutrition_data <- data.frame(
    ingredient = c("flour", "sugar", "butter"),
    calories_per_unit = c(100, 120, 150),
    fat_per_unit = c(0.5, 0, 11),
    carbs_per_unit = c(22, 30, 0),
    protein_per_unit = c(3, 0, 0.1)
  )
  
  # Join recipe with nutritional data
  detailed_recipe <- merge(recipe, nutrition_data, by = "ingredient")
  
  # Calculate total nutrition
  detailed_recipe$total_calories <- detailed_recipe$quantity * detailed_recipe$calories_per_unit
  detailed_recipe$total_fat <- detailed_recipe$quantity * detailed_recipe$fat_per_unit
  detailed_recipe$total_carbs <- detailed_recipe$quantity * detailed_recipe$carbs_per_unit
  detailed_recipe$total_protein <- detailed_recipe$quantity * detailed_recipe$protein_per_unit
  
  # Sum up nutritional values
  total_nutrition <- data.frame(
    total_calories = sum(detailed_recipe$total_calories),
    total_fat = sum(detailed_recipe$total_fat),
    total_carbs = sum(detailed_recipe$total_carbs),
    total_protein = sum(detailed_recipe$total_protein)
  )
  
  return(total_nutrition)
}

# Example recipe data
recipe <- data.frame(
  ingredient = c("flour", "sugar", "butter"),
  quantity = c(2, 1, 0.5),
  unit = c("cup", "cup", "cup")
)

# Calculate nutrition information
nutrition_info <- analyze_nutrition(recipe)
print(nutrition_info)




#Scale Recipe function
scale_recipe <- function(recipe, original_servings, desired_servings) {
  # Calculate the scaling factor
  scaling_factor <- desired_servings / original_servings
  
  # Scale the quantities in the recipe
  recipe$scaled_quantity <- recipe$quantity * scaling_factor
  
  return(recipe[, c("ingredient", "scaled_quantity", "unit")])
}

# Example recipe data
recipe <- data.frame(
  ingredient = c("flour", "sugar", "butter"),
  quantity = c(2, 1, 0.5),
  unit = c("cup", "cup", "cup")
)

# Scale the recipe from 4 servings to 8 servings
scaled_recipe <- scale_recipe(recipe, original_servings = 4, desired_servings = 8)
print(scaled_recipe)


#Generate shopping list function

generate_shopping_list <- function(scaled_recipe) {
  
  # Aggregate quantities by ingredient and unit
  shopping_list <- aggregate(scaled_quantity ~ ingredient + unit, data = scaled_recipe, FUN = sum)
  
  return(shopping_list)
}

# Example scaled recipe data
scaled_recipe <- data.frame(
  ingredient = c("flour", "sugar", "butter", "flour"),
  scaled_quantity = c(4, 2, 1, 2),
  unit = c("cup", "cup", "cup", "cup")
)

# Generate shopping list
shopping_list <- generate_shopping_list(scaled_recipe)
print(shopping_list)
