---
  title: "Recipe Analyzer Package"
author: "Elisa Hardie"
date: "4/1/24"
output: 
  html_document:
  toc: true
toc_float: true
---
  
  # Recipe Analyzer Package Documentation
  
  This document describes the main functions of the Recipe Analyzer Package. These functions are designed to help users analyze nutritional information, scale recipes based on servings, and generate shopping lists from recipes.

## Analyze Nutritional Information

The `analyze_nutrition` function calculates the nutritional information for a given recipe. This includes total calories, fat, carbohydrates, and protein.

### Inputs

- `recipe`: A dataframe or list with each ingredient and its quantity.

### Outputs

- A dataframe containing the nutritional summary of the recipe.

### Example

```{r, eval=FALSE}
recipe <- data.frame(
  ingredient = c("2 cups all-purpose flour", "1 cup sugar", "1/2 cup butter"),
  quantity = c(2, 1, 0.5)
)

nutrition_info <- analyze_nutrition(recipe)
print(nutrition_info)

## Scale Recipe Function

The `scale_recipe` function is designed to adjust the quantities of ingredients based on the desired number of servings. This is particularly useful when recipes need to be scaled up for larger gatherings or scaled down for smaller, more intimate meals.

### Purpose

To dynamically adjust ingredient quantities in a recipe according to the number of servings specified by the user.

### Inputs

- `recipe`: A dataframe detailing the recipe's ingredients and their respective quantities for a base number of servings.
- `servings`: The target number of servings for which the recipe should be scaled.

### Outputs

- A dataframe reflecting the adjusted quantities of ingredients required to meet the new serving size.

### Example 

The following example demonstrates how to use the `scale_recipe` function to double the servings of a given recipe:

```{r, eval=FALSE}
# Original recipe for 4 servings
original_recipe <- data.frame(
  ingredient = c("2 cups all-purpose flour", "1 cup sugar", "1/2 cup butter"),
  quantity = c(2, 1, 0.5),
  original_servings = 4
)

# Scaling the recipe for 8 servings
scaled_recipe <- scale_recipe(original_recipe, servings = 8)
print(scaled_recipe)

#Possible generate shopping list function:

generate_shopping_list(recipe)
generate a shopping list from the ingredients 

Example: 
  recipe_ingredients <- data.frame(
    ingredient = c("flour", "sugar", "butter"),
    quantity = c("2 cups", "1 cup", "1/2 cup")
  )

shopping_list <- generate_shopping_list(recipe_ingredients)
print(shopping_list)


