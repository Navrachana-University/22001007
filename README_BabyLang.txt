BabyLang Compiler Project
=========================

A Minimalistic Programming Language Compiler Using Flex and Bison

📌 Project Overview
-------------------

BabyLang is a custom-designed mini programming language developed to demonstrate the fundamental concepts of compiler design. This project implements a lexical analyzer, syntax analyzer, abstract syntax tree generation, and basic interpretation for the BabyLang language using Flex (Lex) and Bison (Yacc) tools.

It supports simple constructs such as:
- Variable declarations and assignments
- Arithmetic expressions
- Comparison operators
- Loop control structure (while loop)

This project provides a practical example of how high-level language constructs are tokenized, parsed, and translated into an internal representation.

🧩 Project Structure
--------------------

| File Name        | Description |
|------------------|-------------|
| babylang.l       | Lexical analyzer written in Flex. It identifies tokens like identifiers, numbers, operators, and keywords. |
| babylang.y       | Grammar definition written in Bison. It builds the parse tree and defines actions for each grammar rule. |
| babylang.tab.c   | Bison-generated C source file for the parser. |
| babylang.tab.h   | Bison-generated header file containing token definitions. |
| lex.yy.c         | Flex-generated scanner source file. |
| main.c           | Main driver program to initiate the parsing process. |
| test.bl          | Sample BabyLang code for testing the compiler. |

📚 Language Features
--------------------

1. Variable Assignments
    x = 5
    y = x + 3

2. Arithmetic Operators
    + (Addition), - (Subtraction), * (Multiplication), / (Division)

3. Comparison Operators
    < (Less Than), > (Greater Than), == (Equal To), != (Not Equal To)

4. While Loops
    while x > 0:
      x = x - 1

⚙️ Compilation Instructions
---------------------------

Make sure Flex and Bison are installed, then compile with:

    bison -d babylang.y
    flex babylang.l
    gcc main.c lex.yy.c babylang.tab.c -o babylang

▶️ Running the Compiler
-----------------------

Run the compiler with:

    ./babylang < test.bl

🌲 Abstract Syntax Tree
-----------------------

The parser constructs an Abstract Syntax Tree (AST) using a custom Node structure. Example:

    =
    ├── x
    └── +
        ├── 3
        └── 2

🚧 Error Handling
-----------------

Syntax errors invoke `yyerror` to display error messages.

🧠 Learning Objectives
----------------------

- Tokenization using Flex
- Parsing using Bison with grammar rules
- AST creation
- Minimal error recovery
- Executing custom source code

📁 Sample Code (test.bl)
------------------------

    x = 10
    while x > 0:
      x = x - 1

✍️ Author
---------

Created as part of a Compiler Design Course Project  
Language: C, Flex, Bison  
Author: [Your Name]  
Institution: [Your University Name]

📌 Notes
--------

- This is a minimal compiler without type checking or code generation.
- Future enhancements: `if-else`, functions, arrays, optimization, code generation.
