# Grade School

Grade School is a small archiving program that stores students' names
along with the grade that they are in.

The current features are:

- Adding a student's name to the roster for a grade
  - "Add Jim to grade 2."
  - "OK."
- Getting a list of all students enrolled in a grade
  - "Which students are in grade 2?"
  - "We've only got Jim just now."
- Getting a sorted list of all students in all grades. Grades should
  sort as 1, 2, 3, etc., and students within a grade should be sorted
  alphabetically by name.
  - "Who all is enrolled in school right now?"
  - "Grade 1: Anna, Barb, and Charlie. Grade 2: Alex, Peter, and Zoe.
    Grade 3..."

Note that all our students only have one name. (It's a small town, what
do you want?)

Currently, the test suite does not pass. Your **first task** is to get
the existing test suite passing by adjusting the `School` class.

Once the test suite is passing, add the following features (with
corresponding tests):

- Removing a student from the school
  - "Remove Jim in grade 2."
  - Assume that the students have unique names per grade.
- Graduating the students to the next grade
  - "Graduate the students."
  - Assume that grade 8 is the highest grade, and after grade 8 they are
    no longer in the school.
- Limiting the number of students per grade to 20
  - When adding students, if there 

Once you are done, create a GitHub Gist with the Ruby files for the
`School` class and the test file and share it via email.

-----

For running the tests provided, you will need the Minitest gem. Open a terminal
window and run the following command to install minitest:

```
gem install minitest
```

In order to run the test, you can run the test file from the exercise
directory. For example, if the test suite is called hello_world_test.rb, you
can run the following command:


```
ruby grade_school_test.rb
```
