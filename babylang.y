%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

void yyerror(const char *s);
int yylex(void);

typedef struct node {
    char* value;
    struct node* left;
    struct node* right;
} Node;

Node* create_node(char* value, Node* left, Node* right);
void print_tree(Node* tree, int level);
%}

%union {
    char* str;
    struct node* node;
}

%token <str> NUMBER ID
%token ASSIGN WHILE COLON LT GT EQ NE PLUS MINUS MUL DIV

%type <node> stmt expr cond block

%%
program: stmt { print_tree($1, 0); }
       ;

stmt: ID ASSIGN expr         { $$ = create_node("assign", create_node($1, NULL, NULL), $3); }
    | WHILE cond COLON block { $$ = create_node("while", $2, $4); }
    ;

cond: expr LT expr { $$ = create_node("<", $1, $3); }
    | expr GT expr { $$ = create_node(">", $1, $3); }
    | expr EQ expr { $$ = create_node("==", $1, $3); }
    | expr NE expr { $$ = create_node("!=", $1, $3); }
    ;

block: stmt { $$ = $1; }
     ;

expr: expr PLUS expr  { $$ = create_node("+", $1, $3); }
    | expr MINUS expr { $$ = create_node("-", $1, $3); }
    | expr MUL expr   { $$ = create_node("*", $1, $3); }
    | expr DIV expr   { $$ = create_node("/", $1, $3); }
    | ID              { $$ = create_node($1, NULL, NULL); }
    | NUMBER          { $$ = create_node($1, NULL, NULL); }
    ;

%%

Node* create_node(char* value, Node* left, Node* right) {
    Node* new_node = malloc(sizeof(Node));
    new_node->value = strdup(value);
    new_node->left = left;
    new_node->right = right;
    return new_node;
}

void print_tree(Node* tree, int level) {
    if (!tree) return;
    for (int i = 0; i < level; i++) printf("  ");
    printf("%s\n", tree->value);
    print_tree(tree->left, level + 1);
    print_tree(tree->right, level + 1);
}

void yyerror(const char *s) {
    fprintf(stderr, "Error: %s\n", s);
}
