# Part 2: Decision trees


# Decision trees

- very popular ML classifiers, due to their simplicity
- Can be applied on most data types
- a tree-like structure to model the relationships among potential outcomes
- intuitive and human-readable, offering high transparency in decision making
- the model structure:
    - begins at a wide trunk (__root node__)
	- splits into narrower branches (__decision nodes__)
	- every split is a decision, creating __branches__ 
	- with the final decision, the model reaches __leaf nodes__ or __terminal nodes__
- Here I focus on the __C5.0__ decision tree algorithm 

- - - 

![Decision tree example](./images/decisiontree.png)


# Pros and cons

## Pros
- general purpose classifier
- well on most problems
- offer automatic learning process
- can work with different types 
- can handle missing data
- can work on different sample sizes
- highly interpretable 

## Cons
- become over-complex with complicated data structures
- biased toward splits on variables with higher levels
- prone to overfitting and underfitting


