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

# if not like_fruit?
unless like_fruit?
  favorite_food = "rhubarb"
end
```

Just remember that `unless` is the opposite of `if`. 

`unless` can take an `else`-block as well, although that is usually bad practice. Instead, you can switch the order of the blocks and make the conditional positive.

> Never use unless with else. Rewrite these with the positive case first. -- [Ruby Styleguide](https://github.com/styleguide/ruby) (see example) 

Try reading your code out loud, translating to English. Which way sounds better to your ear: using `not` or `unless`?

## Logical Operators

## Additional Resources

- [Ruby Core Documentation: Control Expressions](http://www.ruby-doc.org/core-2.2.0/doc/syntax/control_expressions_rdoc.html)
- [Ruby Explained: Conditionals and Flow Control](http://www.eriktrautman.com/posts/ruby-explained-conditionals-and-flow-control)
