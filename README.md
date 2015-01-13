![General Assembly Logo](http://i.imgur.com/ke8USTq.png)

# Ruby Conditionals Demo

## Objectives

By the end of this, students should be able to:

- Select the proper conditional statement (if, if/else, unless)
- Predict the results of a conditional statement, given the value of variables
- Write small programs using conditional statements

## Conditionals and Truthiness

Most programming languages have a way of switching blocks of code based on some condition. This is called *control flow* because these statements affect the order in which code exectutes.

What are our expectations when we encounter a control statement? We have to read the *condition*, which appears after the control keyword, and determine whether or not the condition is "truthy". If it is, that code will execute; if it is "falsey", it won't.

*Truthiness* in ruby is simple: the only values that are **not** true are `false` and `nil`. We say `false` and `nil` are "falsey", while **everything else** is "truthy".

Let's look at a few examples.

### `if`

What will `favorite_food` equal after the last line?

```ruby
favorite_food = "chocolate"
like_fruit? = true

if like_fruit?
  favorite_food = "strawberries"
end
```

The variable `like_fruit?` holds a truthy value, `true`. The code inside the `if`-block will execute, setting `favorite_food` equal to `"strawberries"`.

In English, this code would read: 

> Set `favorite_food` to `"chocolate"` and `like_fruit?` to `true`. Then, if `like_fruit?` is `true`, set `favorite_food` to `"strawberries"`."

### `if/else`

Let's modify our program to use an `if/else`-block. In our previous example, the code inside the block executed depending on the value of the condition. This time, we will have two code blocks and the condition will tell us *which one* to execute.

```ruby
favorite_food = "chocolate"
like_fruit? = false

if like_fruit?
  favorite_food = "strawberries"
else
  favorite_food = "rhubarb"
end
```

In addition to using an `else`-block this time, we've also set `like_fruit?` to `false`. This time, we skip over the first block, since the condition is false, and execute the second block. Now, `favorite_food` should equal `"rhubarb"`.

The code reads:

> Set `favorite_food` to `"chocolate"` and `like_fruit?` to `false`. Then, if `like_fruit?` is `true`, set `favorite_food` to `"strawberries"`. Otherwise, if `like_fruit?` is `false`, set `favorite_food` to `"rhubarb"` instead."

### `unless`

Sometimes, we want to execute a block if the condition is **false**. There are two ways of accomplishing this. We can use the `not` keyword or `!` operator, or we can use the `unless` keyword. The ruby community strongly favors using `unless` since it reads more like English.

```ruby
favorite_food = "strawberry"
like_fruit? = false

# if not like_fruit?  # weird to say
# if !like_fruit?     # weird to read
unless like_fruit?    # better
  favorite_food = "rhubarb"
end
```

Just remember that `unless` is the opposite of `if`. 

`unless` can take an `else`-block as well, although that is usually bad practice. Instead, you can switch the order of the blocks and make the conditional positive.

> Never use unless with else. Rewrite these with the positive case first. -- [Ruby Styleguide](https://github.com/styleguide/ruby) (see example) 

Try reading your code out loud, translating to English. Which way sounds better to your ear: using `not` or `unless`?

## Comparison Operators (Comparators)

Often we will want to compare two objects in ruby. The following comparison operators will return either `true` or `false` based on the values compared. This behavior makes them useful for control flow.

- `==` (equal)
- `!=` (not equal)
- `<` (less than)
- `>` (greater than)
- `>=` (greater than or equal to)
- `<=` (less than or equal to)

Sometimes reading these can be tricky, especially if they're combined with `unless` or logical operators like `or`, covered in the next section. One trick I've found to help me understand them is to convert them into an English question. For example, I read `x == y` as "Are the values of `x` and `y` the same?". Use the following list as a handy reference if we get stuck.

- `==` Are the values of `x` and `y` the same?
- `!=` Are the values of `x` and `y` different?
- `<` Is the value of `x` less than the value of `y`?
- `>` Is the value of `x` greater than the value of `y`?
- `>=` Is the value of `x` greater than or equal to the value of `y`?
- `<=` Is the value of `x` less than or equal to the value of `y`?

For each of these questions, an answer of "yes" indicates the comparison operator will return `true`, while an answer of "no" indicates it will return `false`.

### Bonus

Research the `<=>` method, also known as the spaceship operator. When would you use it, and how would you implement a custom `<=>`? What does `<=>` return?

## Logical Operators

Logical operators combine truth values according to the laws of logic. For example, if I say "The sky is either blue or green", the statement is true since the sky is blue (only one condition needs to be true). If, on the other hand, I say "The sky is both blue and cloudy", both conditions must apply in order for the statement to be true.

The laws of logic are simple facts, like addition and multiplication facts, and can be memorized from the following table:

| Operator | Statement A | Statement B | Result |
| -------- | ----------- | ----------- | ------ |
| AND      | TRUE        | TRUE        | TRUE   |
| AND      | TRUE        | FALSE       | FALSE  |
| AND      | FALSE       | TRUE        | FALSE  |
| AND      | FALSE       | FALSE       | FALSE  |
| OR       | TRUE        | TRUE        | TRUE   |
| OR       | TRUE        | FALSE       | TRUE   |
| OR       | FALSE       | TRUE        | TRUE   |
| OR       | FALSE       | FALSE       | FALSE  |

Ruby has natural-language logical operators `and` and `or`. These read very nicely, especially in complex conditionals. They have lower precedence than the analogous `&&` and `||` operators, so do **not** use `and` and `or` when doing conditional assignment. Additionally there is `not` or `!`, which flips the truth value of the expression immediately following it.

Ruby is "lazily-evaluated" which means it will return a value as soon as possible from a logical statement. Sometimes this is called "short-circuit" evaluation.

```ruby
  a = true
  b = false

  a || b #=> true
# ^--- exits here
```

Ruby exits after inspecting the value of `a`, since **any** OR-statement with a single `true` value returns `true`. Likewise, **any** AND-statement with a single `false` must return `false`:

```ruby
  a = false
  b = true

  a || b #=> false
# ^--- exits here
```

For any other logical statement, ruby must evaluate both values before returning the correct value.

### Bonus

What is conditional assignment?

What is memoization? How does it take advantage of short-circuit evaluation?

## Best Practices

**Don't test true.** Since anything in ruby is true (expect `nil` and `false`), you don't have to test against `true` using the equality operator.

```ruby
x = true

# BAD
if x == true
  # do something
end

# GOOD
if x
  # do something
end

# The same advice applies, for example, when `x = Object.new` or `x = 4`
```

Avoid explicitly return `true` and `false` in a ternary. This is the most uselss ternary expression ever written: `x ? true : false`. If `x` is truthy, the same thing is accomplished by evaluating `x` itself.

## Your Turn

It's time to make some chocolate! Inspect the `lib/chocolate.rb` file for instructions on how to make chocolate. You should also read `spec/chocolate_spec.rb` for an idea of how you're expected to use the method `can_i_make_chocolate?`. Your task is to fill in the body of the method using conditional logic. Frequently run your tests and check output to help with any syntax errors and to check for correctness.

## Additional Resources

- [Ruby Core Documentation: Control Expressions](http://www.ruby-doc.org/core-2.2.0/doc/syntax/control_expressions_rdoc.html)
- [Ruby Explained: Conditionals and Flow Control](http://www.eriktrautman.com/posts/ruby-explained-conditionals-and-flow-control)
